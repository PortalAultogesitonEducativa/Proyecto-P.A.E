using Microsoft.AspNetCore.Mvc;
using ProyectoPAE.Models;
using Microsoft.EntityFrameworkCore;

public class EstudianteController : Controller
{
    private readonly ApplicationDbContext _context;
    public EstudianteController(ApplicationDbContext context) { _context = context; }

    public IActionResult MisNotas()
    {
        // Obtenemos el ID del usuario que está logueado
        var userIdStr = HttpContext.Session.GetString("UserId");
        if (string.IsNullOrEmpty(userIdStr)) return RedirectToAction("Index", "Login");

        int userId = int.Parse(userIdStr);

        // Traemos las notas de la DB que pertenezcan a este ID
        var notas = _context.Calificaciones
                            .Where(n => n.ID_Estudiante == userId)
                            .ToList();

        return View(notas);
    }
}
