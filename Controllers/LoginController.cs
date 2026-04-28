using Microsoft.AspNetCore.Mvc;
using ProyectoPAE.Models;
using ProyectoPAE.Services;
using Microsoft.AspNetCore.Http;
using System.Linq;
using System;

namespace ProyectoPAE.Controllers
{
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ServicioEmail _emailService;

        public LoginController(ApplicationDbContext context, ServicioEmail emailService)
        {
            _context = context;
            _emailService = emailService;
        }

        // ─── LOGIN ────────────────────────────────────────────────────────────
        public IActionResult Index()
        {
            string rol = HttpContext.Session.GetString("UserRol");
            if (rol != null)
            {
                if (rol == "admin") return RedirectToAction("Usuarios", "Admin");
                if (rol == "docente") return RedirectToAction("Planilla", "Docente");
                if (rol == "estudiante") return RedirectToAction("MisNotas", "Estudiante");
            }
            return View();
        }

        [HttpPost]
        public IActionResult Ingresar(string correo, string password)
        {
            // Comparación directa en texto plano
            var user = _context.Usuarios
                .FirstOrDefault(u => u.CORREO_ELECTRONICO == correo && u.CONTRASEÑA == password);

            if (user != null)
            {
                HttpContext.Session.SetInt32("UserId", user.ID_Usuario);
                HttpContext.Session.SetString("UserIdStr", user.ID_Usuario.ToString());
                HttpContext.Session.SetString("NombreUsuario", user.NOMBRES);
                HttpContext.Session.SetString("UserRol", user.ROL.ToLower().Trim());

                return RedirectToAction("Dashboard", "Home");
            }

            ViewBag.Error = "Correo o contraseña incorrectos";
            return View("Index");
        }

        // ─── OLVIDÉ MI CONTRASEÑA ─────────────────────────────────────────────
        public IActionResult OlvideContraseña()
        {
            return View();
        }

        [HttpPost]
        public IActionResult SolicitarRecuperacion(string correo)
        {
            ViewBag.Mensaje = "Si ese correo está registrado, recibirás un enlace en unos minutos.";

            var user = _context.Usuarios
                .FirstOrDefault(u => u.CORREO_ELECTRONICO == correo && u.ACTIVO == true);

            if (user == null)
                return View("OlvideContraseña");

            // Invalidar tokens anteriores del mismo usuario
            var tokensAnteriores = _context.RecuperacionesPassword
                .Where(r => r.id_usuario == user.ID_Usuario && !r.usado)
                .ToList();
            tokensAnteriores.ForEach(t => t.usado = true);

            // Crear nuevo token
            string token = Guid.NewGuid().ToString("N");

            var recuperacion = new GU_RECUPERACION_PASSWORD
            {
                id_usuario = user.ID_Usuario,
                token = token,
                fecha_solicitud = DateTime.Now,
                fecha_expiracion = DateTime.Now.AddMinutes(30),
                usado = false
            };

            _context.RecuperacionesPassword.Add(recuperacion);
            _context.SaveChanges();

            // Armar enlace y enviar correo
            string enlace = Url.Action(
                "RestablecerContraseña", "Login",
                new { token },
                Request.Scheme
            );

            _emailService.EnviarCorreoRecuperacion(
                user.CORREO_ELECTRONICO,
                user.NOMBRES,
                enlace
            );

            return View("OlvideContraseña");
        }

        // ─── RESTABLECER CONTRASEÑA ───────────────────────────────────────────
        public IActionResult RestablecerContraseña(string token)
        {
            if (string.IsNullOrEmpty(token))
                return RedirectToAction("Index");

            var recuperacion = _context.RecuperacionesPassword
                .FirstOrDefault(r =>
                    r.token == token &&
                    !r.usado &&
                    r.fecha_expiracion > DateTime.Now
                );

            if (recuperacion == null)
            {
                ViewBag.Error = "El enlace no es válido o ya expiró.";
                return View("OlvideContraseña");
            }

            ViewBag.Token = token;
            return View();
        }

        [HttpPost]
        public IActionResult GuardarNuevaContraseña(string token, string nuevaPassword, string confirmar)
        {
            if (nuevaPassword != confirmar)
            {
                ViewBag.Token = token;
                ViewBag.Error = "Las contraseñas no coinciden.";
                return View("RestablecerContraseña");
            }

            if (nuevaPassword.Length < 8)
            {
                ViewBag.Token = token;
                ViewBag.Error = "La contraseña debe tener al menos 8 caracteres.";
                return View("RestablecerContraseña");
            }

            var recuperacion = _context.RecuperacionesPassword
                .FirstOrDefault(r =>
                    r.token == token &&
                    !r.usado &&
                    r.fecha_expiracion > DateTime.Now
                );

            if (recuperacion == null)
            {
                ViewBag.Error = "El enlace no es válido o ya expiró.";
                return View("OlvideContraseña");
            }

            var user = _context.Usuarios.Find(recuperacion.id_usuario);

            // Guardar contraseña anterior en historial en texto plano
            _context.HistorialPasswords.Add(new GU_HISTORIAL_PASSWORD
            {
                id_usuario = user.ID_Usuario,
                contrasena_hash = user.CONTRASEÑA,
                fecha_cambio = DateTime.Now
            });

            // Guardar nueva contraseña en texto plano directamente
            user.CONTRASEÑA = nuevaPassword;

            // Marcar token como usado
            recuperacion.usado = true;
            recuperacion.fecha_uso = DateTime.Now;

            _context.SaveChanges();

            ViewBag.Exito = "✅ Contraseña actualizada. Ya puedes iniciar sesión.";
            return View("Index");
        }

        // ─── LOGOUT ───────────────────────────────────────────────────────────
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Login");
        }
    }
}