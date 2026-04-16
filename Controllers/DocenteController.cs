using Microsoft.AspNetCore.Mvc;
using ProyectoPAE.Models;
using Microsoft.EntityFrameworkCore;

namespace ProyectoPAE.Controllers
{
    public class DocenteController : Controller
    {
        private readonly ApplicationDbContext _context;

        public DocenteController(ApplicationDbContext context) { _context = context; }

        public IActionResult Planilla()
        {
            // Verificamos sesión y rol (usando UserRol que corregimos antes)
            var rol = HttpContext.Session.GetString("UserRol");
            if (rol != "docente" && rol != "admin") return RedirectToAction("Index", "Login");

            // Traemos solo a los usuarios con rol 'estudiante'
            var estudiantes = _context.Usuarios.Where(u => u.ROL == "estudiante").ToList();
            return View(estudiantes);
        }

        [HttpPost]
        public IActionResult GuardarNota(int ID_Estudiante, string Materia, string Nota, int Periodo)
        {
            // 1. Convertimos el texto de la nota a decimal usando el formato universal (punto)
            decimal notaDecimal = decimal.Parse(Nota.Replace(",", "."), System.Globalization.CultureInfo.InvariantCulture);

            var nuevaNota = new Calificacion
            {
                ID_Estudiante = ID_Estudiante,
                Materia = Materia,
                Nota = notaDecimal, // Usamos el valor ya convertido
                Periodo = Periodo,
                FechaRegistro = DateTime.Now
            };

            _context.Calificaciones.Add(nuevaNota);
            _context.SaveChanges();

            return RedirectToAction("Planilla");
        }

    }
}