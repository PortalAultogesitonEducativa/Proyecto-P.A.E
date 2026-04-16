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
            var userIdStr = HttpContext.Session.GetString("UserId");

            // 2. Verificación de seguridad básica
            if (string.IsNullOrEmpty(nombreUsuario) || string.IsNullOrEmpty(userIdStr))
            {
                return RedirectToAction("Login", "Login");
            }

            // 3. Pasamos datos comunes a la vista
            ViewBag.Nombre = nombreUsuario;
            ViewBag.Rol = rol;

            // 4. Lógica para buscar hijos si el rol es 'acudiente'
            if (rol == "acudiente")
            {
                int userId = int.Parse(userIdStr);

                // 1. Buscar IDs de hijos (Asegúrate que en EstudiantePadre los nombres coincidan)
                var hijosIds = _context.ESTUDIANTE_PADRE
                                       .Where(ep => ep.ID_PADRE == userId)
                                       .Select(ep => ep.ID_ESTUDIANTE)
                                       .ToList();

                // Traemos los usuarios relacionados a memoria y luego filtramos por el texto "estudiante"
                var listaHijos = _context.Usuarios
                    .Where(u => hijosIds.Contains(u.ID_Usuario))
                    .AsEnumerable() // <--- Esto mueve la lógica a C# para evitar el error de traducción
                    .Where(u => u.ROL != null && u.ROL.Trim().ToLower() == "estudiante")
                    .ToList();

                if (listaHijos.Any())
                {
                    int primerHijoId = listaHijos.First().ID_Usuario;

                    var promedio = _context.EVALUACIONES
                                           .Where(e => e.id_estudiante == primerHijoId)
                                           .Select(e => (double?)e.nota)
                                           .Average() ?? 0.0;

                    var fallas = _context.ASISTENCIAS
                                         .Count(a => a.id_estudiante == primerHijoId && a.estado == "Falla");
                    // Dentro del bloque de acudiente en el HomeController:
                    var listaCitaciones = _context.CITACIONES
                                                  .Where(c => c.id_estudiante == primerHijoId)
                                                  .OrderByDescending(c => c.fecha)
                                                  .ToList();

                    ViewBag.TotalCitaciones = listaCitaciones.Count;
                    ViewBag.ListaCitaciones = listaCitaciones; // Pasamos la lista completa a la vista

                    ViewBag.DetalleNotas = _context.EVALUACIONES.Where(e => e.id_estudiante == primerHijoId).ToList();

                    ViewBag.PromedioRapido = promedio.ToString("0.0");

                    ViewBag.FallasRapidas = fallas;
                }

                ViewBag.ListaHijos = listaHijos;
            }

            return View();
        }

        // Otros métodos existentes
        public IActionResult Nosotros() => View();
        public IActionResult Contacto() => View();
        public IActionResult Cursos() => View();
        public IActionResult Blog() => View();
    }
}