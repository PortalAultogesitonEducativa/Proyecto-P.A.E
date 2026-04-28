using MailKit.Net.Smtp;
using MimeKit;
using Microsoft.Extensions.Configuration;

namespace ProyectoPAE.Services
{
    public class ServicioEmail
    {
        private readonly IConfiguration _config;

        public ServicioEmail(IConfiguration config)
        {
            _config = config;
        }

        public void EnviarCorreoRecuperacion(string destinatario, string nombre, string enlace)
        {
            var mensaje = new MimeMessage();
            mensaje.From.Add(new MailboxAddress(
                _config["Email:NombreRemitente"],
                _config["Email:Remitente"]
            ));
            mensaje.To.Add(new MailboxAddress(nombre, destinatario));
            mensaje.Subject = "Recuperación de contraseña — Sistema PAE";

            mensaje.Body = new TextPart("html")
            {
                Text = $@"
                <div style='font-family:Arial,sans-serif;max-width:500px;margin:auto'>
                    <h2 style='color:#2c3e50'>Recuperación de contraseña</h2>
                    <p>Hola <strong>{nombre}</strong>,</p>
                    <p>Recibimos una solicitud para restablecer tu contraseña.
                       Haz clic en el botón de abajo. El enlace expira en <strong>30 minutos</strong>.</p>
                    <a href='{enlace}' style='
                        display:inline-block;
                        background:#2980b9;
                        color:#fff;
                        padding:12px 24px;
                        border-radius:6px;
                        text-decoration:none;
                        margin:16px 0'>
                        Restablecer contraseña
                    </a>
                    <p style='color:#888;font-size:12px'>
                        Si no solicitaste este cambio, ignora este correo.<br/>
                        El enlace expirará automáticamente.
                    </p>
                </div>"
            };

            using var smtp = new SmtpClient();
            smtp.Connect(
                _config["Email:Servidor"],
                int.Parse(_config["Email:Puerto"]),
                MailKit.Security.SecureSocketOptions.StartTls
            );
            smtp.Authenticate(_config["Email:Remitente"], _config["Email:Password"]);
            smtp.Send(mensaje);
            smtp.Disconnect(true);
        }
    }
}
