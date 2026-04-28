using Microsoft.EntityFrameworkCore;
using ProyectoPAE.Models;
using ProyectoPAE.Services; 

var builder = WebApplication.CreateBuilder(args);
// Add services to the container.
builder.Services.AddControllersWithViews();
// 1. Configuración de la base de datos
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
// 2. CONFIGURAR EL SERVICIO DE SESIONES (NUEVO)
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(10);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

// 3. REGISTRAR SERVICIO DE CORREO
builder.Services.AddScoped<ServicioEmail>();  // ? línea nueva

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
// 4. HABILITAR EL USO DE SESIONES (NUEVO)
app.UseSession();
app.UseAuthorization();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
<<<<<<< HEAD
=======

// COMENTARIO NICOOOLASSSSSSSSSSSSSSSSSSSSSSSS
Console.WriteLine("Esto es una prueba de las ramas, la esa escribiendo nico para saber si esto se va a guardar solo en la compu, borrar este comentario despues");
>>>>>>> 7d57b91d8a5f4eb683c2c01d75bd58e06a0e330a
app.Run();