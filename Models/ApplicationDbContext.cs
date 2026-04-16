using Microsoft.EntityFrameworkCore;

namespace ProyectoPAE.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<EstudiantePadre> ESTUDIANTE_PADRE { get; set; }
        public DbSet<Asistencia> ASISTENCIAS { get; set; }
        public DbSet<Evaluacion> EVALUACIONES { get; set; }
        public DbSet<Citacion> CITACIONES { get; set; }
        public DbSet<Calificacion> Calificaciones { get; set; }
        public DbSet<Matricula> Matriculas { get; set; }
    }
}
