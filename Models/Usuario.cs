using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoPAE.Models
{
    [Table("GU_Usuario")]
    public class Usuario
    {
        [Key]
        public int ID_Usuario { get; set; }
        public string NOMBRE_USUARIO { get; set; } = string.Empty;
        public string CONTRASEÑA { get; set; } = string.Empty;
        public string? NOMBRES { get; set; }
        public string? APELLIDOS { get; set; }
        public string? CORREO_ELECTRONICO { get; set; }
        public DateTime? FECHA_CREACION { get; set; }
        public bool ACTIVO { get; set; }
        public string? ROL { get; set; }
    }

    [Table("ESTUDIANTE_PADRE")]
    public class EstudiantePadre
    {
        [Key]
        public int ID_ESTUDIANTE_PADRE { get; set; }
        public int ID_PADRE { get; set; }
        public int ID_ESTUDIANTE { get; set; }
        public string? relacion { get; set; }
    }

    [Table("ASISTENCIA")]
    public class Asistencia
    {
        [Key]
        public int id_asistencia { get; set; }
        public int id_estudiante { get; set; }
        public DateTime fecha { get; set; }
        public string? estado { get; set; }
    }

    [Table("EVALUACION")]
    public class Evaluacion
    {
        [Key]
        public int id_evaluacion { get; set; }
        public int id_estudiante { get; set; }
        public decimal nota { get; set; }
        public int id_materia { get; set; }
        public int id_curso { get; set; }
        public int id_calificador { get; set; }
        public DateTime fecha_evaluacion { get; set; }
        public string? tipo_evaluacion { get; set; }
    }

    [Table("CITACION")]
    public class Citacion
    {
        [Key]
        public int id_citacion { get; set; }
        public int id_estudiante { get; set; }
        public string? remitente { get; set; }
        public string? asunto { get; set; }
        public string? mensaje { get; set; }
        public DateTime fecha { get; set; }
    }
}