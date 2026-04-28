using Microsoft.AspNetCore.Mvc;
using ProyectoPAE.Models;
using Microsoft.EntityFrameworkCore;

public class EstudianteController : Controller
{
    private readonly ApplicationDbContext _context;
    public EstudianteController(ApplicationDbContext context) { _context = context; }

    public IActionResult MisNotas()
    {
        // 1. Obtenemos el ID de la sesión como texto
        var userIdStr = HttpContext.Session.GetString("UserIdStr");

        // 2. Intentamos convertirlo de forma segura
        if (int.TryParse(userIdStr, out int userId))
        {
            // Si la conversión es exitosa, buscamos las notas
            var notas = _context.Calificaciones
                                .Where(n => n.ID_Estudiante == userId)
                                .ToList();
            return View(notas);
        }

        // 3. Si el ID es inválido o nulo, mandamos al login en lugar de dar error
        return RedirectToAction("Index", "Login");
    }
}
