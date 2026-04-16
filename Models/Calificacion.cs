using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProyectoPAE.Models
{
    public class Calificacion
    {
        [Key]
        public int ID_Calificacion { get; set; }
        public int ID_Estudiante { get; set; }
        public string Materia { get; set; }
        public decimal Nota { get; set; }
        public int Periodo { get; set; }
        public DateTime FechaRegistro { get; set; }

        [ForeignKey("ID_Estudiante")]
        public virtual Usuario Estudiante { get; set; }
    }
}
