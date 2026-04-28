using Microsoft.AspNetCore.Mvc;
using ProyectoPAE.Models;
using Microsoft.AspNetCore.Http;
using System.Linq;

namespace ProyectoPAE.Controllers
{
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AdminController(ApplicationDbContext context)
        {
            _context = context;
        }

        // RF 1.4: Buscar y visualizar usuarios
        public IActionResult Usuarios(string buscar)
        {
            // Seguridad: Solo si es admin puede entrar
            var rol = HttpContext.Session.GetString("UserRol"); // Antes decía "Rol"

            if (rol != "admin")
            {
                return RedirectToAction("Dashboard", "Home");
            }

            // Traemos todos los usuarios
            var lista = _context.Usuarios.AsQueryable();

            // Si hay algo en el buscador, filtramos por nombre, apellido o rol
            if (!string.IsNullOrEmpty(buscar))
            {
                lista = lista.Where(u => u.NOMBRES.Contains(buscar) ||
                                         u.APELLIDOS.Contains(buscar) ||
                                         u.ROL.Contains(buscar));
            }

            return View(lista.ToList());
        }

        [HttpPost]
        public IActionResult RegistrarEstudiante(Usuario nuevoEstudiante, int CursoSeleccionado)
        {
            // 1. Verificar si el correo ya existe
            var existe = _context.Usuarios.Any(u => u.CORREO_ELECTRONICO == nuevoEstudiante.CORREO_ELECTRONICO);
            if (existe)
            {
                TempData["Error"] = "Este correo ya está registrado.";
                return RedirectToAction("Usuarios");
            }

            // --- EL CAMBIO CLAVE ESTÁ AQUÍ ---
            // Si no le das un nombre de usuario, SQL lanza el error de duplicado
            nuevoEstudiante.NOMBRE_USUARIO = nuevoEstudiante.CORREO_ELECTRONICO;
            // ---------------------------------

            nuevoEstudiante.ROL = "estudiante";
            nuevoEstudiante.ACTIVO = true;
            nuevoEstudiante.FECHA_CREACION = DateTime.Now;

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Usuarios.Add(nuevoEstudiante);
                    _context.SaveChanges(); // Aquí ya no debería saltar el error

                    var nuevaMatricula = new Matricula
                    {
                        id_estudiante = nuevoEstudiante.ID_Usuario,
                        id_curso = CursoSeleccionado,
                        fecha_matricula = DateTime.Now,
                        periodo_academico = "2026-I",
                        estado = "Activa",
                        ano = 2026
                    };

                    _context.Matriculas.Add(nuevaMatricula);
                    _context.SaveChanges();

                    return RedirectToAction("Usuarios");
                }
                catch (Exception ex)
                {
                    // Si algo falla, esto te ayudará a ver qué pasó sin que se cierre la app
                    ModelState.AddModelError("", "Error al guardar: " + ex.Message);
                }
            }
            return View("Usuarios", _context.Usuarios.ToList());
        }

        [HttpPost]
        public IActionResult RenovarMatricula(int idEstudiante)
        {
            // Buscamos la matrícula más reciente de este estudiante
            var ultimaMatricula = _context.Matriculas
                .Where(m => m.id_estudiante == idEstudiante)
                .OrderByDescending(m => m.ano)
                .FirstOrDefault();

            if (ultimaMatricula != null)
            {
                var nuevaMatricula = new Matricula
                {
                    id_estudiante = idEstudiante,
                    id_curso = ultimaMatricula.id_curso, // Lo dejamos en el mismo curso o podrías subirlo
                    fecha_matricula = DateTime.Now,
                    periodo_academico = "2026-I",
                    estado = "Activa",
                    ano = 2026 // Año de renovación
                };

                _context.Matriculas.Add(nuevaMatricula);
                _context.SaveChanges();
            }

            return RedirectToAction("Usuarios");
        }
        [HttpPost]
        public IActionResult CambiarRol(int idUsuario, string nuevoRol)
        {
            var usuario = _context.Usuarios.Find(idUsuario);

            // REGLAS DE ORO:
            // 1. No se puede editar al Admin Principal (ID 1).
            // 2. El nuevo rol no puede ser 'admin'.
            // 3. Solo permitimos cambiar a quienes son docentes o coordinadores.

            if (usuario != null && usuario.ID_Usuario != 1 && nuevoRol != "admin")
            {
                if (usuario.ROL == "docente" || usuario.ROL == "coordinador")
                {
                    usuario.ROL = nuevoRol;
                    _context.SaveChanges();
                }
            }

            return RedirectToAction("Usuarios");
        }

    }
}
