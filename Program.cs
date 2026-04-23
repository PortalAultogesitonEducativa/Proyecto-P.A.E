using Microsoft.EntityFrameworkCore;
using ProyectoPAE.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// 1. Configuración de la base de datos
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));

// 2. CONFIGURAR EL SERVICIO DE SESIONES (NUEVO)
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(10); // La sesión expira en 30 min
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

// 3. HABILITAR EL USO DE SESIONES (NUEVO)
app.UseSession();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

// COMENTARIO NICOOOLASSSSSSSSSSSSSSSSSSSSSSSS
Console.WriteLine("Esto es una prueba de las ramas, la esa escribiendo nico para saber si esto se va a guardar solo en la compu, borrar este comentario despues");
app.Run();