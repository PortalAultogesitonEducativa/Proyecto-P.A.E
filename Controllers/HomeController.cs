using Microsoft.AspNetCore.Mvc;
using ProyectoPAE.Models;
using System.Collections.Generic;
using Microsoft.AspNetCore.Http;
using System.Linq;

namespace ProyectoPAE.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        // Esta es la página principal (Pública)
        public IActionResult Index()
        {
            var courses = new List<Course>
            {
                new Course {
                    Title = "Desarrollo Personal",
                    Description = "Cursos para mejorar tus habilidades personales y profesionales.",
                    IconClass = "bi-lightbulb",
                    LinkText = "Ver Curso >"
                },
                new Course {
                    Title = "Tecnología e Innovación",
                    Description = "Capacítate en las últimas tendencias tecnológicas.",
                    IconClass = "bi-laptop",
                    LinkText = "Ver Curso >"
                },
                new Course {
                    Title = "Negocios y Liderazgo",
                    Description = "Aprende a gestionar y liderar equipos eficientemente.",
                    IconClass = "bi-briefcase",
                    LinkText = "Ver Curso >"
                }
            };

            return View(courses);
        }

        // --- MÉTODO DASHBOARD ACTUALIZADO PARA PADRES ---
        public IActionResult Dashboard()
        {
            // 1. Recuperamos los datos de la sesión
            var nombreUsuario = HttpContext.Session.GetString("NombreUsuario");
            var rol = HttpContext.Session.GetString("UserRol");
            var userIdStr = HttpContext.Session.GetString("UserIdStr");

            // 2. Verificación de seguridad: si no hay sesión, al Login
            if (string.IsNullOrEmpty(nombreUsuario) || string.IsNullOrEmpty(rol))
            {
                return RedirectToAction("Index", "Login");
            }

            ViewBag.Nombre = nombreUsuario;
            ViewBag.Rol = rol;

            // 3. Lógica específica para el ACUDIENTE
            if (rol == "acudiente")
            {
                // Usamos TryParse para evitar el error de formato (FormatException)
                if (int.TryParse(userIdStr, out int userId))
                {
                    // Buscar IDs de hijos vinculados
                    var hijosIds = _context.ESTUDIANTE_PADRE
                                           .Where(ep => ep.ID_PADRE == userId)
                                           .Select(ep => ep.ID_ESTUDIANTE)
                                           .ToList();

                    // Traer la información de los usuarios que son estudiantes
                    var listaHijos = _context.Usuarios
                        .Where(u => hijosIds.Contains(u.ID_Usuario))
                        .AsEnumerable()
                        .Where(u => u.ROL != null && u.ROL.Trim().ToLower() == "estudiante")
                        .ToList();

                    if (listaHijos.Any())
                    {
                        int primerHijoId = listaHijos.First().ID_Usuario;

                        // Promedio de notas
                        var promedio = _context.EVALUACIONES
                                               .Where(e => e.id_estudiante == primerHijoId)
                                               .Select(e => (double?)e.nota)
                                               .Average() ?? 0.0;

                        // Contador de fallas
                        var fallas = _context.ASISTENCIAS
                                             .Count(a => a.id_estudiante == primerHijoId && a.estado == "Falla");

                        // Citaciones
                        var listaCitaciones = _context.CITACIONES
                                                      .Where(c => c.id_estudiante == primerHijoId)
                                                      .OrderByDescending(c => c.fecha)
                                                      .ToList();

                        ViewBag.TotalCitaciones = listaCitaciones.Count;
                        ViewBag.PromedioRapido = promedio.ToString("0.0");
                        ViewBag.FallasRapidas = fallas;
                        ViewBag.ListaHijos = listaHijos;
                    }
                }
                else
                {
                    // Si el ID llega corrupto (como el error de la imagen 4), lo mandamos a re-identificarse
                    return RedirectToAction("Index", "Login");
                }
            }

            return View();
        }
        public IActionResult Perfil()
        {
            // Cambiamos "IdUsuario" por "UserId" para que coincida con el resto de tu app
            var userId = HttpContext.Session.GetInt32("UserId");

            // Si no hay sesión, regresamos al Login
            if (userId == null)
            {
                return RedirectToAction("Index", "Login");
            }

            // Buscamos al usuario por su ID
            var usuario = _context.Usuarios.Find(userId);

            if (usuario == null)
            {
                return RedirectToAction("Index", "Login");
            }

            return View(usuario);
        }
        // 1. Mostrar el formulario de edición
        public IActionResult EditarPerfil()
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId == null) return RedirectToAction("Index", "Login");

            var usuario = _context.Usuarios.Find(userId);
            return View(usuario);
        }

        // 2. Procesar la actualización
        [HttpPost]
        public IActionResult ActualizarPerfil(Usuario usuarioEditado)
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId == null) return RedirectToAction("Index", "Login");

            var usuarioBd = _context.Usuarios.Find(userId);
            if (usuarioBd != null)
            {
                // Actualizamos solo los campos permitidos por el RF3.2
                usuarioBd.TELEFONO = usuarioEditado.TELEFONO;
                usuarioBd.DIRECCION = usuarioEditado.DIRECCION;
                usuarioBd.CORREO_ELECTRONICO = usuarioEditado.CORREO_ELECTRONICO;
                // La foto requiere una lógica extra para guardar el archivo, 
                // por ahora aseguremos los datos de texto.

                _context.SaveChanges();

                // Actualizamos el nombre en sesión por si cambió el correo o algo importante
                TempData["Mensaje"] = "Perfil actualizado correctamente";
            }

            return RedirectToAction("Perfil");
        }

        // Otros métodos existentes
        public IActionResult Nosotros() => View();
        public IActionResult Contacto() => View();
        public IActionResult Cursos() => View();
        public IActionResult Blog() => View();
    }
}