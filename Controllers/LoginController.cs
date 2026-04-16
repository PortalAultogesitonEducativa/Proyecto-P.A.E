using Microsoft.AspNetCore.Mvc;
using ProyectoPAE.Models;
using System.Linq;
using Microsoft.AspNetCore.Http;

namespace ProyectoPAE.Controllers
{
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;

        public LoginController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            // Si ya existe la sesión, lo mandamos al Dashboard automáticamente
            if (HttpContext.Session.GetString("NombreUsuario") != null)
            {
                return RedirectToAction("Dashboard", "Home");
            }
            return View();
        }

        [HttpPost]
        public IActionResult Ingresar(string correo, string password)
        {
            // 1. Buscamos al usuario (ESTA LÍNEA ES LA QUE FALTA)
            var user = _context.Usuarios.FirstOrDefault(u => u.CORREO_ELECTRONICO == correo && u.CONTRASEÑA == password);

            if (user != null)
            {
                // Guardamos datos básicos en la sesión
                HttpContext.Session.SetString("UserId", user.ID_Usuario.ToString());
                HttpContext.Session.SetString("NombreUsuario", $"{user.NOMBRES} {user.APELLIDOS}");

                // 2. Obtenemos el Rol directamente de la base de datos
                string rol = (user.ROL ?? "estudiante").ToLower();

                // 3. Guardamos el rol en la sesión con el nombre correcto para el AdminController
                HttpContext.Session.SetString("UserRol", rol);

                // Redirigimos al Dashboard
                return RedirectToAction("Dashboard", "Home");
            }

            // Si fallan las credenciales
            ViewBag.Error = "Correo o contraseña incorrectos";
            return View("Index");
        }
        // Método para cerrar sesión
        public IActionResult Salir()
        {
            HttpContext.Session.Clear();

            // Esto le dice al navegador: "No guardes esta página en memoria"
            Response.Headers["Cache-Control"] = "no-cache, no-store, must-revalidate";
            Response.Headers["Pragma"] = "no-cache";
            Response.Headers["Expires"] = "0";

            return RedirectToAction("Index", "Home");
        }
        public IActionResult Logout()
        {
            // Limpiamos toda la información de la sesión
            HttpContext.Session.Clear();

            // Redirigimos al Login
            return RedirectToAction("Index", "Login");
        }
    }
}