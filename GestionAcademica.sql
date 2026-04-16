USE [master]
GO
/****** Object:  Database [GestionAcademica]    Script Date: 16/04/2026 3:09:36 p. m. ******/
CREATE DATABASE [GestionAcademica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GestionAcademica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GestionAcademica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GestionAcademica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GestionAcademica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GestionAcademica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestionAcademica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestionAcademica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestionAcademica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestionAcademica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestionAcademica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestionAcademica] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestionAcademica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GestionAcademica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestionAcademica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestionAcademica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestionAcademica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestionAcademica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestionAcademica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestionAcademica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestionAcademica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestionAcademica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GestionAcademica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestionAcademica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestionAcademica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestionAcademica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestionAcademica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestionAcademica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestionAcademica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GestionAcademica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GestionAcademica] SET  MULTI_USER 
GO
ALTER DATABASE [GestionAcademica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestionAcademica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GestionAcademica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GestionAcademica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GestionAcademica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GestionAcademica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GestionAcademica] SET QUERY_STORE = OFF
GO
USE [GestionAcademica]
GO
/****** Object:  Table [dbo].[AREA]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AREA](
	[id_area] [int] IDENTITY(1,1) NOT NULL,
	[nombre_area] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](300) NULL,
	[id_departamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASISTENCIA]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASISTENCIA](
	[id_asistencia] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[id_horario] [int] NOT NULL,
	[id_profesor] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[estado] [nvarchar](20) NOT NULL,
	[hora_llegada] [time](7) NULL,
	[justificacion] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_asistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AULA]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AULA](
	[id_aula] [int] IDENTITY(1,1) NOT NULL,
	[codigo_aula] [nvarchar](20) NOT NULL,
	[capacidad] [int] NOT NULL,
	[tipo] [nvarchar](50) NOT NULL,
	[ubicacion] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_aula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificaciones]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones](
	[ID_Calificacion] [int] IDENTITY(1,1) NOT NULL,
	[ID_Estudiante] [int] NOT NULL,
	[Materia] [varchar](100) NOT NULL,
	[Nota] [decimal](3, 2) NULL,
	[Periodo] [int] NOT NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Calificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CITACION]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CITACION](
	[id_citacion] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[remitente] [varchar](100) NULL,
	[asunto] [varchar](200) NULL,
	[mensaje] [text] NULL,
	[fecha] [datetime] NULL,
	[leido] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_citacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURSO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURSO](
	[id_curso] [int] IDENTITY(1,1) NOT NULL,
	[nombre_curso] [nvarchar](100) NOT NULL,
	[ano_escolar] [int] NOT NULL,
	[id_departamento] [int] NOT NULL,
	[id_area] [int] NOT NULL,
	[id_periodo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CURSO_MATERIA]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CURSO_MATERIA](
	[id_curso] [int] NOT NULL,
	[id_materia] [int] NOT NULL,
	[ano_escolar] [int] NOT NULL,
	[semestre] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_CURMAT] PRIMARY KEY CLUSTERED 
(
	[id_curso] ASC,
	[id_materia] ASC,
	[ano_escolar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTAMENTO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENTO](
	[id_departamento] [int] IDENTITY(1,1) NOT NULL,
	[nombre_departamento] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCUMENTO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCUMENTO](
	[id_documento] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](200) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[tipo_documento] [nvarchar](80) NOT NULL,
	[estado_documento] [nvarchar](50) NOT NULL,
	[version] [int] NOT NULL,
	[fecha_subida] [date] NOT NULL,
	[fecha_actualizacion] [date] NULL,
	[id_usuario_autor] [int] NOT NULL,
	[nombre_archivo] [nvarchar](255) NOT NULL,
	[tipo_mime] [nvarchar](100) NOT NULL,
	[tamano_archivo] [bigint] NOT NULL,
	[archivo_url] [nvarchar](500) NOT NULL,
	[id_curso] [int] NULL,
	[id_materia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCUMENTO_ETIQUETA]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCUMENTO_ETIQUETA](
	[id_etiqueta] [int] IDENTITY(1,1) NOT NULL,
	[id_documento] [int] NOT NULL,
	[atiqueta] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_etiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCUMENTO_VERSION]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCUMENTO_VERSION](
	[id_version] [int] IDENTITY(1,1) NOT NULL,
	[id_documento] [int] NOT NULL,
	[numero_version] [int] NOT NULL,
	[archivo_url] [nvarchar](500) NOT NULL,
	[nombre_archivo] [nvarchar](255) NOT NULL,
	[fecha_version] [date] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[notas_version] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTUDIANTE]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTUDIANTE](
	[id_estudiante] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](80) NOT NULL,
	[apellido] [nvarchar](80) NOT NULL,
	[fecha_nacimiento] [date] NULL,
	[direccion] [nvarchar](200) NULL,
	[telefono] [nvarchar](20) NULL,
	[email] [nvarchar](150) NOT NULL,
	[fecha_inscripcion] [date] NOT NULL,
	[codigo_estudiante] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTUDIANTE_PADRE]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTUDIANTE_PADRE](
	[id_estudiante] [int] NOT NULL,
	[id_padre] [int] NOT NULL,
	[relacion] [nvarchar](50) NOT NULL,
	[es_principal] [bit] NOT NULL,
 CONSTRAINT [PK_ESTPD] PRIMARY KEY CLUSTERED 
(
	[id_estudiante] ASC,
	[id_padre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVALUACION]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVALUACION](
	[id_evaluacion] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[id_materia] [int] NOT NULL,
	[id_curso] [int] NOT NULL,
	[fecha_evaluacion] [date] NOT NULL,
	[nota] [decimal](5, 2) NOT NULL,
	[tipo_evaluacion] [nvarchar](50) NOT NULL,
	[id_calificador] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_evaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXTRA_CURSO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_CURSO](
	[id_extra_curso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
	[instructor] [nvarchar](150) NULL,
	[cupos_totales] [int] NOT NULL,
	[cupos_disponibles] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
	[fecha_inicio_inscripcion] [date] NOT NULL,
	[fecha_fin_inscripcion] [date] NOT NULL,
	[activo] [bit] NOT NULL,
	[id_periodo] [int] NULL,
	[id_aula] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_extra_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXTRA_INSCRIPCION]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_INSCRIPCION](
	[id_extra_inscripcion] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[id_extra_curso] [int] NOT NULL,
	[fecha_inscripcion] [datetime] NOT NULL,
	[estado] [nvarchar](30) NOT NULL,
	[fecha_cancelacion] [datetime] NULL,
	[motivo_cancelacion] [nvarchar](300) NULL,
	[id_extra_curso_nuevo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_extra_inscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_DETALLE_ROL]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_DETALLE_ROL](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NOT NULL,
	[descripcion] [nvarchar](500) NULL,
	[fecha_mod] [date] NOT NULL,
	[modificado_por] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_HISTORIAL_PASSWORD]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_HISTORIAL_PASSWORD](
	[id_historial] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[contrasena_hash] [nvarchar](256) NOT NULL,
	[fecha_cambio] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_INTENTOS_LOGIN]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_INTENTOS_LOGIN](
	[id_intento] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_intento] [datetime] NOT NULL,
	[exitoso] [bit] NOT NULL,
	[ip_origen] [nvarchar](45) NULL,
	[bloqueado_hasta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_intento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_MENU_PERMISO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_MENU_PERMISO](
	[id_menu] [int] IDENTITY(1,1) NOT NULL,
	[nombre_menu] [nvarchar](100) NOT NULL,
	[ruta] [nvarchar](200) NOT NULL,
	[icono] [nvarchar](60) NULL,
	[activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_MENU_PERMISO_ROL]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_MENU_PERMISO_ROL](
	[id_rol] [int] NOT NULL,
	[id_menu] [int] NOT NULL,
	[fecha_asignacion] [date] NOT NULL,
 CONSTRAINT [PK_MENPERM] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC,
	[id_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_PARAMETRIZACION]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_PARAMETRIZACION](
	[id_param] [int] IDENTITY(1,1) NOT NULL,
	[modulo] [nvarchar](80) NOT NULL,
	[clave] [nvarchar](100) NOT NULL,
	[valor] [nvarchar](500) NOT NULL,
	[descripcion] [nvarchar](300) NULL,
	[activo] [bit] NOT NULL,
	[fecha_mod] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_param] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_PERMISO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_PERMISO](
	[id_permiso] [int] IDENTITY(1,1) NOT NULL,
	[nombre_permiso] [nvarchar](100) NOT NULL,
	[modulo] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_RECUPERACION_PASSWORD]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_RECUPERACION_PASSWORD](
	[id_recuperacion] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[token] [nvarchar](256) NOT NULL,
	[fecha_expiracion] [datetime] NOT NULL,
	[fecha_solicitud] [datetime] NOT NULL,
	[fecha_uso] [datetime] NULL,
	[id_solicitante] [int] NULL,
	[usado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_recuperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_ROL]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_ROL](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [nvarchar](80) NOT NULL,
	[descripcion] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_ROL_PERMISO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_ROL_PERMISO](
	[id_rol] [int] NOT NULL,
	[id_permiso] [int] NOT NULL,
	[fecha_asignacion] [date] NOT NULL,
 CONSTRAINT [PK_ROLPERM] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC,
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_Usuario]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_Usuario](
	[ID_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_USUARIO] [nvarchar](50) NOT NULL,
	[NOMBRES] [varchar](60) NOT NULL,
	[APELLIDOS] [varchar](60) NOT NULL,
	[CORREO_ELECTRONICO] [varchar](150) NOT NULL,
	[CONTRASEÑA] [nvarchar](256) NOT NULL,
	[FECHA_CREACION] [date] NOT NULL,
	[ACTIVO] [bit] NOT NULL,
	[ROL] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GU_USUARIO_ROL]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GU_USUARIO_ROL](
	[id_usuario] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
	[fecha_asignacion] [date] NOT NULL,
 CONSTRAINT [PK_USROL] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORARIO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORARIO](
	[id_horario] [int] IDENTITY(1,1) NOT NULL,
	[id_curso] [int] NOT NULL,
	[id_aula] [int] NOT NULL,
	[id_profesor] [int] NOT NULL,
	[dia] [nvarchar](15) NOT NULL,
	[hora_inicio] [time](7) NOT NULL,
	[hora_fin] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSCRIPCION]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSCRIPCION](
	[id_inscripcion] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[id_curso] [int] NOT NULL,
	[anio] [int] NOT NULL,
	[fecha_inscripcion] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATERIA]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIA](
	[id_materia] [int] IDENTITY(1,1) NOT NULL,
	[nombre_materia] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](300) NULL,
	[creditos] [int] NOT NULL,
	[horas_semana] [int] NOT NULL,
	[id_area] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATRICULA]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATRICULA](
	[id_matricula] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[id_curso] [int] NOT NULL,
	[fecha_matricula] [date] NOT NULL,
	[periodo_academico] [nvarchar](20) NOT NULL,
	[estado] [nvarchar](20) NOT NULL,
	[anio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PADRE_TUTOR]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PADRE_TUTOR](
	[id_padre] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](80) NOT NULL,
	[apellido] [nvarchar](80) NOT NULL,
	[telefono] [nvarchar](20) NULL,
	[email] [nvarchar](150) NULL,
	[relacion_estudiante] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_padre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERIODO]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERIODO](
	[id_periodo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_periodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFESOR]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESOR](
	[id_profesor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](80) NOT NULL,
	[apellido] [nvarchar](80) NOT NULL,
	[direccion] [nvarchar](200) NULL,
	[telefono] [nvarchar](20) NULL,
	[email] [nvarchar](150) NOT NULL,
	[especialidad] [nvarchar](100) NULL,
	[id_departamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFESOR_MATERIA]    Script Date: 16/04/2026 3:09:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESOR_MATERIA](
	[id_profesor] [int] NOT NULL,
	[id_materia] [int] NOT NULL,
	[anio_escolar] [int] NOT NULL,
	[horas_semana] [int] NOT NULL,
 CONSTRAINT [PK_PROFMAT] PRIMARY KEY CLUSTERED 
(
	[id_profesor] ASC,
	[id_materia] ASC,
	[anio_escolar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AREA] ON 
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (1, N'Matemáticas', N'Álgebra, geometría y cálculo', 1)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (2, N'Física', N'Mecánica, termodinámica y óptica', 1)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (3, N'Lengua Española', N'Gramática, literatura y redacción', 2)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (4, N'Historia Universal', N'Historia antigua, moderna y contemporánea', 2)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (5, N'Programación', N'Desarrollo de software y algoritmos', 3)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (6, N'Redes', N'Infraestructura y comunicaciones', 3)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (7, N'Biología', N'Celular, genética y anatomía', 4)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (8, N'Música', N'Teoría musical y práctica instrumental', 5)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (9, N'Matemáticas', N'Álgebra, geometría y cálculo', 1)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (10, N'Física', N'Mecánica, termodinámica y óptica', 1)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (11, N'Lengua Española', N'Gramática, literatura y redacción', 2)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (12, N'Historia Universal', N'Historia antigua, moderna y contemporánea', 2)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (13, N'Programación', N'Desarrollo de software y algoritmos', 3)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (14, N'Redes', N'Infraestructura y comunicaciones', 3)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (15, N'Biología', N'Celular, genética y anatomía', 4)
GO
INSERT [dbo].[AREA] ([id_area], [nombre_area], [descripcion], [id_departamento]) VALUES (16, N'Música', N'Teoría musical y práctica instrumental', 5)
GO
SET IDENTITY_INSERT [dbo].[AREA] OFF
GO
SET IDENTITY_INSERT [dbo].[ASISTENCIA] ON 
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (1, 1, 1, 1, CAST(N'2024-02-05' AS Date), N'Presente', CAST(N'07:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (2, 2, 1, 1, CAST(N'2024-02-05' AS Date), N'Presente', CAST(N'07:02:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (3, 3, 1, 1, CAST(N'2024-02-05' AS Date), N'Tardanza', CAST(N'07:18:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (4, 1, 2, 1, CAST(N'2024-02-07' AS Date), N'Presente', CAST(N'07:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (5, 2, 2, 1, CAST(N'2024-02-07' AS Date), N'Ausente', NULL, NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (6, 4, 3, 2, CAST(N'2024-02-06' AS Date), N'Presente', CAST(N'10:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (7, 5, 3, 2, CAST(N'2024-02-06' AS Date), N'Presente', CAST(N'10:05:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (8, 4, 4, 2, CAST(N'2024-02-08' AS Date), N'Justificado', NULL, N'Cita médica presentada oportunamente')
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (9, 6, 5, 3, CAST(N'2024-02-05' AS Date), N'Presente', CAST(N'09:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (10, 7, 6, 5, CAST(N'2024-08-05' AS Date), N'Presente', CAST(N'14:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (11, 8, 6, 5, CAST(N'2024-08-05' AS Date), N'Tardanza', CAST(N'14:22:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (12, 1, 8, 5, CAST(N'2024-08-06' AS Date), N'Presente', CAST(N'14:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (13, 2, 9, 5, CAST(N'2024-08-08' AS Date), N'Ausente', NULL, NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (14, 9, 13, 6, CAST(N'2025-01-27' AS Date), N'Presente', CAST(N'07:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (15, 10, 13, 6, CAST(N'2025-01-27' AS Date), N'Presente', CAST(N'07:10:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (16, 1, 1, 1, CAST(N'2024-02-05' AS Date), N'Presente', CAST(N'07:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (17, 2, 1, 1, CAST(N'2024-02-05' AS Date), N'Presente', CAST(N'07:02:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (18, 3, 1, 1, CAST(N'2024-02-05' AS Date), N'Tardanza', CAST(N'07:18:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (19, 1, 2, 1, CAST(N'2024-02-07' AS Date), N'Presente', CAST(N'07:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (20, 2, 2, 1, CAST(N'2024-02-07' AS Date), N'Ausente', NULL, NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (21, 4, 3, 2, CAST(N'2024-02-06' AS Date), N'Presente', CAST(N'10:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (22, 5, 3, 2, CAST(N'2024-02-06' AS Date), N'Presente', CAST(N'10:05:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (23, 4, 4, 2, CAST(N'2024-02-08' AS Date), N'Justificado', NULL, N'Cita médica presentada oportunamente')
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (24, 6, 5, 3, CAST(N'2024-02-05' AS Date), N'Presente', CAST(N'09:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (25, 7, 6, 5, CAST(N'2024-08-05' AS Date), N'Presente', CAST(N'14:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (26, 8, 6, 5, CAST(N'2024-08-05' AS Date), N'Tardanza', CAST(N'14:22:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (27, 1, 8, 5, CAST(N'2024-08-06' AS Date), N'Presente', CAST(N'14:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (28, 2, 9, 5, CAST(N'2024-08-08' AS Date), N'Ausente', NULL, NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (29, 9, 13, 6, CAST(N'2025-01-27' AS Date), N'Presente', CAST(N'07:00:00' AS Time), NULL)
GO
INSERT [dbo].[ASISTENCIA] ([id_asistencia], [id_estudiante], [id_horario], [id_profesor], [fecha], [estado], [hora_llegada], [justificacion]) VALUES (30, 10, 13, 6, CAST(N'2025-01-27' AS Date), N'Presente', CAST(N'07:10:00' AS Time), NULL)
GO
SET IDENTITY_INSERT [dbo].[ASISTENCIA] OFF
GO
SET IDENTITY_INSERT [dbo].[AULA] ON 
GO
INSERT [dbo].[AULA] ([id_aula], [codigo_aula], [capacidad], [tipo], [ubicacion]) VALUES (1, N'A-101', 30, N'Aula', N'Edificio A, Piso 1')
GO
INSERT [dbo].[AULA] ([id_aula], [codigo_aula], [capacidad], [tipo], [ubicacion]) VALUES (2, N'A-102', 30, N'Aula', N'Edificio A, Piso 1')
GO
INSERT [dbo].[AULA] ([id_aula], [codigo_aula], [capacidad], [tipo], [ubicacion]) VALUES (3, N'B-201', 40, N'Aula', N'Edificio B, Piso 2')
GO
INSERT [dbo].[AULA] ([id_aula], [codigo_aula], [capacidad], [tipo], [ubicacion]) VALUES (4, N'LAB-01', 25, N'Laboratorio', N'Edificio C, Piso 1 — Laboratorio de Física')
GO
INSERT [dbo].[AULA] ([id_aula], [codigo_aula], [capacidad], [tipo], [ubicacion]) VALUES (5, N'LAB-02', 20, N'Laboratorio', N'Edificio C, Piso 2 — Laboratorio de Cómputo')
GO
INSERT [dbo].[AULA] ([id_aula], [codigo_aula], [capacidad], [tipo], [ubicacion]) VALUES (6, N'AUD-01', 120, N'Auditorio', N'Edificio Central — Auditorio Principal')
GO
INSERT [dbo].[AULA] ([id_aula], [codigo_aula], [capacidad], [tipo], [ubicacion]) VALUES (7, N'B-202', 35, N'Aula', N'Edificio B, Piso 2')
GO
INSERT [dbo].[AULA] ([id_aula], [codigo_aula], [capacidad], [tipo], [ubicacion]) VALUES (8, N'A-103', 28, N'Aula', N'Edificio A, Piso 1')
GO
SET IDENTITY_INSERT [dbo].[AULA] OFF
GO
SET IDENTITY_INSERT [dbo].[Calificaciones] ON 
GO
INSERT [dbo].[Calificaciones] ([ID_Calificacion], [ID_Estudiante], [Materia], [Nota], [Periodo], [FechaRegistro]) VALUES (1, 6, N'Matemáticas', CAST(4.50 AS Decimal(3, 2)), 1, CAST(N'2026-03-28T13:22:38.473' AS DateTime))
GO
INSERT [dbo].[Calificaciones] ([ID_Calificacion], [ID_Estudiante], [Materia], [Nota], [Periodo], [FechaRegistro]) VALUES (2, 6, N'Español', CAST(3.80 AS Decimal(3, 2)), 1, CAST(N'2026-03-28T13:22:38.473' AS DateTime))
GO
INSERT [dbo].[Calificaciones] ([ID_Calificacion], [ID_Estudiante], [Materia], [Nota], [Periodo], [FechaRegistro]) VALUES (6, 6, N'Matemáticas', CAST(3.50 AS Decimal(3, 2)), 1, CAST(N'2026-03-28T13:53:36.587' AS DateTime))
GO
INSERT [dbo].[Calificaciones] ([ID_Calificacion], [ID_Estudiante], [Materia], [Nota], [Periodo], [FechaRegistro]) VALUES (7, 6, N'Español', CAST(4.20 AS Decimal(3, 2)), 1, CAST(N'2026-03-28T14:02:46.433' AS DateTime))
GO
INSERT [dbo].[Calificaciones] ([ID_Calificacion], [ID_Estudiante], [Materia], [Nota], [Periodo], [FechaRegistro]) VALUES (8, 12, N'Inglés', CAST(3.50 AS Decimal(3, 2)), 1, CAST(N'2026-03-29T16:39:46.927' AS DateTime))
GO
INSERT [dbo].[Calificaciones] ([ID_Calificacion], [ID_Estudiante], [Materia], [Nota], [Periodo], [FechaRegistro]) VALUES (9, 12, N'Matemáticas', CAST(4.20 AS Decimal(3, 2)), 1, CAST(N'2026-03-30T12:43:05.713' AS DateTime))
GO
INSERT [dbo].[Calificaciones] ([ID_Calificacion], [ID_Estudiante], [Materia], [Nota], [Periodo], [FechaRegistro]) VALUES (10, 12, N'Inglés', CAST(3.50 AS Decimal(3, 2)), 1, CAST(N'2026-04-06T17:42:44.263' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Calificaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[CITACION] ON 
GO
INSERT [dbo].[CITACION] ([id_citacion], [id_estudiante], [remitente], [asunto], [mensaje], [fecha], [leido]) VALUES (1, 6, N'Prof. Carlos Ruiz', N'Dificultades en Matemáticas', N'Se requiere una cita para hablar sobre el desempeño académico del estudiante.', CAST(N'2026-03-26T13:54:03.013' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[CITACION] OFF
GO
SET IDENTITY_INSERT [dbo].[CURSO] ON 
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (1, N'Matemáticas Avanzadas 2024-I', 2024, 1, 1, 1)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (2, N'Física General 2024-I', 2024, 1, 2, 1)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (3, N'Literatura y Redacción 2024-I', 2024, 2, 3, 1)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (4, N'Programación I 2024-II', 2024, 3, 5, 2)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (5, N'Programación II 2024-II', 2024, 3, 5, 2)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (6, N'Bases de Datos 2024-II', 2024, 3, 5, 2)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (7, N'Historia Contemporánea 2024-I', 2024, 2, 4, 1)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (8, N'Biología Celular 2024-II', 2024, 4, 7, 2)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (9, N'Redes de Computadoras 2025-I', 2025, 3, 6, 3)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (10, N'Álgebra Lineal 2025-I', 2025, 1, 1, 3)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (11, N'Matemáticas Avanzadas 2024-I', 2024, 1, 1, 1)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (12, N'Física General 2024-I', 2024, 1, 2, 1)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (13, N'Literatura y Redacción 2024-I', 2024, 2, 3, 1)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (14, N'Programación I 2024-II', 2024, 3, 5, 2)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (15, N'Programación II 2024-II', 2024, 3, 5, 2)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (16, N'Bases de Datos 2024-II', 2024, 3, 5, 2)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (17, N'Historia Contemporánea 2024-I', 2024, 2, 4, 1)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (18, N'Biología Celular 2024-II', 2024, 4, 7, 2)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (19, N'Redes de Computadoras 2025-I', 2025, 3, 6, 3)
GO
INSERT [dbo].[CURSO] ([id_curso], [nombre_curso], [ano_escolar], [id_departamento], [id_area], [id_periodo]) VALUES (20, N'Álgebra Lineal 2025-I', 2025, 1, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[CURSO] OFF
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (1, 1, 2024, N'1')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (1, 2, 2024, N'1')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (2, 3, 2024, N'1')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (3, 4, 2024, N'1')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (3, 5, 2024, N'1')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (4, 7, 2024, N'2')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (5, 8, 2024, N'2')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (6, 9, 2024, N'2')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (7, 6, 2024, N'1')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (8, 11, 2024, N'2')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (9, 10, 2025, N'1')
GO
INSERT [dbo].[CURSO_MATERIA] ([id_curso], [id_materia], [ano_escolar], [semestre]) VALUES (10, 1, 2025, N'1')
GO
SET IDENTITY_INSERT [dbo].[DEPARTAMENTO] ON 
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (1, N'Ciencias Exactas', N'Departamento de matemáticas, física y química')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (2, N'Humanidades', N'Departamento de lengua, historia y filosofía')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (3, N'Tecnología e Informática', N'Departamento de programación, redes y sistemas')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (4, N'Ciencias Naturales', N'Departamento de biología, ecología y medio ambiente')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (5, N'Artes y Cultura', N'Departamento de música, teatro y artes plásticas')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (6, N'Ciencias Exactas', N'Departamento de matemáticas, física y química')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (7, N'Humanidades', N'Departamento de lengua, historia y filosofía')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (8, N'Tecnología e Informática', N'Departamento de programación, redes y sistemas')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (9, N'Ciencias Naturales', N'Departamento de biología, ecología y medio ambiente')
GO
INSERT [dbo].[DEPARTAMENTO] ([id_departamento], [nombre_departamento], [descripcion]) VALUES (10, N'Artes y Cultura', N'Departamento de música, teatro y artes plásticas')
GO
SET IDENTITY_INSERT [dbo].[DEPARTAMENTO] OFF
GO
SET IDENTITY_INSERT [dbo].[DOCUMENTO] ON 
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (1, N'Taller 1 - Álgebra Lineal', N'Ejercicios de vectores y operaciones matriciales para la semana 3', N'tarea', N'publicado', 1, CAST(N'2025-02-10' AS Date), CAST(N'2025-02-10' AS Date), 3, N'taller1_algebra.pdf', N'application/pdf', 204800, N'/archivos/2025/algebra/taller1_algebra.pdf', 10, 1)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (2, N'Proyecto Final - Programación I', N'Especificación del proyecto integrador del semestre 2024-II', N'proyecto', N'publicado', 2, CAST(N'2024-08-01' AS Date), CAST(N'2024-09-15' AS Date), 5, N'proyecto_final_prog1.pdf', N'application/pdf', 512000, N'/archivos/2024-II/prog1/proyecto_final.pdf', 4, 7)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (3, N'Examen Parcial - Física Mecánica', N'Evaluación parcial de mecánica clásica — capítulos 1 al 5', N'examen', N'archivado', 1, CAST(N'2024-03-05' AS Date), NULL, 4, N'parcial_fisica.pdf', N'application/pdf', 307200, N'/archivos/2024-I/fisica/parcial_fisica.pdf', 2, 3)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (4, N'Material de Apoyo - Bases de Datos', N'Diapositivas del módulo de modelado entidad-relación', N'material', N'publicado', 3, CAST(N'2024-08-20' AS Date), CAST(N'2024-10-05' AS Date), 5, N'erd_slides.pptx', N'application/vnd.openxmlformats-officedocument.presentationml.presentation', 921600, N'/archivos/2024-II/bd/erd_slides.pptx', 6, 9)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (5, N'Informe de Investigación - Historia', N'Trabajo escrito sobre la Primera Guerra Mundial por Santiago Pérez', N'tarea', N'publicado', 1, CAST(N'2024-04-20' AS Date), NULL, 7, N'informe_historia_sperez.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 153600, N'/archivos/2024-I/historia/informe_historia_sperez.docx', 7, 6)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (6, N'Taller 1 - Álgebra Lineal', N'Ejercicios de vectores y operaciones matriciales para la semana 3', N'tarea', N'publicado', 1, CAST(N'2025-02-10' AS Date), CAST(N'2025-02-10' AS Date), 3, N'taller1_algebra.pdf', N'application/pdf', 204800, N'/archivos/2025/algebra/taller1_algebra.pdf', 10, 1)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (7, N'Proyecto Final - Programación I', N'Especificación del proyecto integrador del semestre 2024-II', N'proyecto', N'publicado', 2, CAST(N'2024-08-01' AS Date), CAST(N'2024-09-15' AS Date), 5, N'proyecto_final_prog1.pdf', N'application/pdf', 512000, N'/archivos/2024-II/prog1/proyecto_final.pdf', 4, 7)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (8, N'Examen Parcial - Física Mecánica', N'Evaluación parcial de mecánica clásica — capítulos 1 al 5', N'examen', N'archivado', 1, CAST(N'2024-03-05' AS Date), NULL, 4, N'parcial_fisica.pdf', N'application/pdf', 307200, N'/archivos/2024-I/fisica/parcial_fisica.pdf', 2, 3)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (9, N'Material de Apoyo - Bases de Datos', N'Diapositivas del módulo de modelado entidad-relación', N'material', N'publicado', 3, CAST(N'2024-08-20' AS Date), CAST(N'2024-10-05' AS Date), 5, N'erd_slides.pptx', N'application/vnd.openxmlformats-officedocument.presentationml.presentation', 921600, N'/archivos/2024-II/bd/erd_slides.pptx', 6, 9)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (10, N'Informe de Investigación - Historia', N'Trabajo escrito sobre la Primera Guerra Mundial por Santiago Pérez', N'tarea', N'publicado', 1, CAST(N'2024-04-20' AS Date), NULL, 7, N'informe_historia_sperez.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 153600, N'/archivos/2024-I/historia/informe_historia_sperez.docx', 7, 6)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (11, N'Taller 2 - Álgebra Lineal', N'Ejercicios de transformaciones lineales semana 5', N'tarea', N'borrador', 1, CAST(N'2026-03-26' AS Date), NULL, 3, N'taller2_algebra.pdf', N'application/pdf', 204800, N'/archivos/2025/algebra/taller2_algebra.pdf', 10, 1)
GO
INSERT [dbo].[DOCUMENTO] ([id_documento], [titulo], [descripcion], [tipo_documento], [estado_documento], [version], [fecha_subida], [fecha_actualizacion], [id_usuario_autor], [nombre_archivo], [tipo_mime], [tamano_archivo], [archivo_url], [id_curso], [id_materia]) VALUES (12, N'Taller 2 - Álgebra Lineal', N'Ejercicios de transformaciones lineales semana 5', N'tarea', N'borrador', 1, CAST(N'2026-03-26' AS Date), NULL, 3, N'taller2_algebra.pdf', N'application/pdf', 204800, N'/archivos/2025/algebra/taller2_algebra.pdf', 10, 1)
GO
SET IDENTITY_INSERT [dbo].[DOCUMENTO] OFF
GO
SET IDENTITY_INSERT [dbo].[DOCUMENTO_ETIQUETA] ON 
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (1, 1, N'álgebra')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (2, 1, N'vectores')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (3, 1, N'matrices')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (4, 2, N'programación')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (5, 2, N'python')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (6, 2, N'proyecto')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (7, 3, N'física')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (8, 3, N'mecánica')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (9, 3, N'examen')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (10, 4, N'bases-datos')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (11, 4, N'SQL')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (12, 4, N'ERD')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (13, 4, N'diapositivas')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (14, 5, N'historia')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (15, 5, N'investigación')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (16, 1, N'álgebra')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (17, 1, N'vectores')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (18, 1, N'matrices')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (19, 2, N'programación')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (20, 2, N'python')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (21, 2, N'proyecto')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (22, 3, N'física')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (23, 3, N'mecánica')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (24, 3, N'examen')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (25, 4, N'bases-datos')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (26, 4, N'SQL')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (27, 4, N'ERD')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (28, 4, N'diapositivas')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (29, 5, N'historia')
GO
INSERT [dbo].[DOCUMENTO_ETIQUETA] ([id_etiqueta], [id_documento], [atiqueta]) VALUES (30, 5, N'investigación')
GO
SET IDENTITY_INSERT [dbo].[DOCUMENTO_ETIQUETA] OFF
GO
SET IDENTITY_INSERT [dbo].[DOCUMENTO_VERSION] ON 
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (1, 1, 1, N'/archivos/2025/algebra/taller1_algebra_v1.pdf', N'taller1_algebra_v1.pdf', CAST(N'2025-02-10' AS Date), 3, N'Versión inicial publicada')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (2, 2, 1, N'/archivos/2024-II/prog1/proyecto_final_v1.pdf', N'proyecto_final_prog1_v1.pdf', CAST(N'2024-08-01' AS Date), 5, N'Borrador inicial')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (3, 2, 2, N'/archivos/2024-II/prog1/proyecto_final_v2.pdf', N'proyecto_final_prog1_v2.pdf', CAST(N'2024-09-15' AS Date), 5, N'Actualización de criterios de evaluación')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (4, 4, 1, N'/archivos/2024-II/bd/erd_slides_v1.pptx', N'erd_slides_v1.pptx', CAST(N'2024-08-20' AS Date), 5, N'Versión inicial')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (5, 4, 2, N'/archivos/2024-II/bd/erd_slides_v2.pptx', N'erd_slides_v2.pptx', CAST(N'2024-09-10' AS Date), 5, N'Corrección de diagramas')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (6, 4, 3, N'/archivos/2024-II/bd/erd_slides_v3.pptx', N'erd_slides_v3.pptx', CAST(N'2024-10-05' AS Date), 5, N'Añadidos ejemplos de normalización')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (7, 1, 1, N'/archivos/2025/algebra/taller1_algebra_v1.pdf', N'taller1_algebra_v1.pdf', CAST(N'2025-02-10' AS Date), 3, N'Versión inicial publicada')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (8, 2, 1, N'/archivos/2024-II/prog1/proyecto_final_v1.pdf', N'proyecto_final_prog1_v1.pdf', CAST(N'2024-08-01' AS Date), 5, N'Borrador inicial')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (9, 2, 2, N'/archivos/2024-II/prog1/proyecto_final_v2.pdf', N'proyecto_final_prog1_v2.pdf', CAST(N'2024-09-15' AS Date), 5, N'Actualización de criterios de evaluación')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (10, 4, 1, N'/archivos/2024-II/bd/erd_slides_v1.pptx', N'erd_slides_v1.pptx', CAST(N'2024-08-20' AS Date), 5, N'Versión inicial')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (11, 4, 2, N'/archivos/2024-II/bd/erd_slides_v2.pptx', N'erd_slides_v2.pptx', CAST(N'2024-09-10' AS Date), 5, N'Corrección de diagramas')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (12, 4, 3, N'/archivos/2024-II/bd/erd_slides_v3.pptx', N'erd_slides_v3.pptx', CAST(N'2024-10-05' AS Date), 5, N'Añadidos ejemplos de normalización')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (13, 11, 1, N'/archivos/2025/algebra/taller2_algebra.pdf', N'taller2_algebra.pdf', CAST(N'2026-03-26' AS Date), 3, N'Versión inicial publicada.')
GO
INSERT [dbo].[DOCUMENTO_VERSION] ([id_version], [id_documento], [numero_version], [archivo_url], [nombre_archivo], [fecha_version], [id_usuario], [notas_version]) VALUES (14, 12, 1, N'/archivos/2025/algebra/taller2_algebra.pdf', N'taller2_algebra.pdf', CAST(N'2026-03-26' AS Date), 3, N'Versión inicial publicada.')
GO
SET IDENTITY_INSERT [dbo].[DOCUMENTO_VERSION] OFF
GO
SET IDENTITY_INSERT [dbo].[ESTUDIANTE] ON 
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (1, N'Laura', N'Gómez', CAST(N'2005-03-14' AS Date), N'Calle 12 # 8-45, Bogotá', N'3001230001', N'laura.gomez@estudiantil.edu.co', CAST(N'2023-01-16' AS Date), N'EST-2023-001')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (2, N'Santiago', N'Pérez', CAST(N'2004-07-22' AS Date), N'Cra. 9 # 22-11, Bogotá', N'3001230002', N'santiago.perez@estudiantil.edu.co', CAST(N'2023-01-16' AS Date), N'EST-2023-002')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (3, N'Valentina', N'López', CAST(N'2005-11-05' AS Date), N'Av. 19 # 30-60, Bogotá', N'3001230003', N'valentina.lopez@estudiantil.edu.co', CAST(N'2023-01-16' AS Date), N'EST-2023-003')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (4, N'Mateo', N'Hernández', CAST(N'2004-05-18' AS Date), N'Calle 80 # 50-20, Bogotá', N'3001230004', N'mateo.hernandez@estudiantil.edu.co', CAST(N'2023-01-16' AS Date), N'EST-2023-004')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (5, N'Isabella', N'Martínez', CAST(N'2005-09-30' AS Date), N'Cra. 15 # 10-05, Bogotá', N'3001230005', N'isabella.martinez@estudiantil.edu.co', CAST(N'2023-01-16' AS Date), N'EST-2023-005')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (6, N'Sebastián', N'García', CAST(N'2004-12-01' AS Date), N'Calle 63 # 12-34, Bogotá', N'3001230006', N'sebastian.garcia@estudiantil.edu.co', CAST(N'2023-01-16' AS Date), N'EST-2023-006')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (7, N'Camila', N'Rodríguez', CAST(N'2005-02-27' AS Date), N'Transv. 40 # 60-15, Bogotá', N'3001230007', N'camila.rodriguez@estudiantil.edu.co', CAST(N'2023-01-16' AS Date), N'EST-2023-007')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (8, N'Daniel', N'Ramírez', CAST(N'2004-08-14' AS Date), N'Cra. 7 # 90-50, Bogotá', N'3001230008', N'daniel.ramirez@estudiantil.edu.co', CAST(N'2023-01-16' AS Date), N'EST-2023-008')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (9, N'Sofía', N'Díaz', CAST(N'2005-04-09' AS Date), N'Calle 26 # 30-40, Bogotá', N'3001230009', N'sofia.diaz@estudiantil.edu.co', CAST(N'2024-01-15' AS Date), N'EST-2024-001')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (10, N'Felipe', N'Morales', CAST(N'2004-10-23' AS Date), N'Av. Suba # 100-22, Bogotá', N'3001230010', N'felipe.morales@estudiantil.edu.co', CAST(N'2024-01-15' AS Date), N'EST-2024-002')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (11, N'Mariana', N'Jiménez', CAST(N'2005-06-17' AS Date), N'Calle 170 # 7-60, Bogotá', N'3001230011', N'mariana.jimenez@estudiantil.edu.co', CAST(N'2024-01-15' AS Date), N'EST-2024-003')
GO
INSERT [dbo].[ESTUDIANTE] ([id_estudiante], [nombre], [apellido], [fecha_nacimiento], [direccion], [telefono], [email], [fecha_inscripcion], [codigo_estudiante]) VALUES (12, N'Tomás', N'Ruiz', CAST(N'2004-01-11' AS Date), N'Cra. 45 # 20-08, Bogotá', N'3001230012', N'tomas.ruiz@estudiantil.edu.co', CAST(N'2024-01-15' AS Date), N'EST-2024-004')
GO
SET IDENTITY_INSERT [dbo].[ESTUDIANTE] OFF
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (1, 1, N'Padre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (2, 2, N'Madre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (3, 3, N'Madre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (4, 4, N'Padre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (5, 5, N'Madre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (6, 6, N'Padre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (6, 9, N'Padre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (7, 7, N'Madre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (7, 10, N'Madre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (8, 8, N'Padre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (9, 9, N'Madre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (10, 10, N'Padre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (11, 11, N'Madre', 1)
GO
INSERT [dbo].[ESTUDIANTE_PADRE] ([id_estudiante], [id_padre], [relacion], [es_principal]) VALUES (12, 12, N'Padre', 1)
GO
SET IDENTITY_INSERT [dbo].[EVALUACION] ON 
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (1, 1, 1, 1, CAST(N'2024-03-10' AS Date), CAST(4.20 AS Decimal(5, 2)), N'Parcial', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (2, 2, 1, 1, CAST(N'2024-03-10' AS Date), CAST(3.80 AS Decimal(5, 2)), N'Parcial', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (3, 3, 1, 1, CAST(N'2024-03-10' AS Date), CAST(4.60 AS Decimal(5, 2)), N'Parcial', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (4, 1, 1, 1, CAST(N'2024-05-20' AS Date), CAST(4.00 AS Decimal(5, 2)), N'Final', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (5, 2, 1, 1, CAST(N'2024-05-20' AS Date), CAST(3.50 AS Decimal(5, 2)), N'Final', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (6, 3, 1, 1, CAST(N'2024-05-20' AS Date), CAST(4.80 AS Decimal(5, 2)), N'Final', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (7, 4, 3, 2, CAST(N'2024-03-12' AS Date), CAST(3.70 AS Decimal(5, 2)), N'Parcial', 2)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (8, 5, 3, 2, CAST(N'2024-03-12' AS Date), CAST(4.10 AS Decimal(5, 2)), N'Parcial', 2)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (9, 6, 4, 3, CAST(N'2024-04-08' AS Date), CAST(4.50 AS Decimal(5, 2)), N'Quiz', 3)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (10, 7, 7, 4, CAST(N'2024-09-15' AS Date), CAST(3.90 AS Decimal(5, 2)), N'Parcial', 5)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (11, 8, 7, 4, CAST(N'2024-09-15' AS Date), CAST(4.30 AS Decimal(5, 2)), N'Parcial', 5)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (12, 1, 8, 5, CAST(N'2024-09-16' AS Date), CAST(4.00 AS Decimal(5, 2)), N'Proyecto', 5)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (13, 2, 9, 6, CAST(N'2024-10-10' AS Date), CAST(3.60 AS Decimal(5, 2)), N'Final', 5)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (14, 9, 10, 9, CAST(N'2025-03-05' AS Date), CAST(4.40 AS Decimal(5, 2)), N'Parcial', 6)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (15, 10, 10, 9, CAST(N'2025-03-05' AS Date), CAST(3.80 AS Decimal(5, 2)), N'Parcial', 6)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (16, 1, 1, 1, CAST(N'2024-03-10' AS Date), CAST(4.20 AS Decimal(5, 2)), N'Parcial', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (17, 2, 1, 1, CAST(N'2024-03-10' AS Date), CAST(3.80 AS Decimal(5, 2)), N'Parcial', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (18, 3, 1, 1, CAST(N'2024-03-10' AS Date), CAST(4.60 AS Decimal(5, 2)), N'Parcial', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (19, 1, 1, 1, CAST(N'2024-05-20' AS Date), CAST(4.00 AS Decimal(5, 2)), N'Final', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (20, 2, 1, 1, CAST(N'2024-05-20' AS Date), CAST(3.50 AS Decimal(5, 2)), N'Final', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (21, 3, 1, 1, CAST(N'2024-05-20' AS Date), CAST(4.80 AS Decimal(5, 2)), N'Final', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (22, 4, 3, 2, CAST(N'2024-03-12' AS Date), CAST(3.70 AS Decimal(5, 2)), N'Parcial', 2)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (23, 5, 3, 2, CAST(N'2024-03-12' AS Date), CAST(4.10 AS Decimal(5, 2)), N'Parcial', 2)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (24, 6, 4, 3, CAST(N'2024-04-08' AS Date), CAST(4.50 AS Decimal(5, 2)), N'Quiz', 3)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (25, 7, 7, 4, CAST(N'2024-09-15' AS Date), CAST(3.90 AS Decimal(5, 2)), N'Parcial', 5)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (26, 8, 7, 4, CAST(N'2024-09-15' AS Date), CAST(4.30 AS Decimal(5, 2)), N'Parcial', 5)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (27, 1, 8, 5, CAST(N'2024-09-16' AS Date), CAST(4.00 AS Decimal(5, 2)), N'Proyecto', 5)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (28, 2, 9, 6, CAST(N'2024-10-10' AS Date), CAST(3.60 AS Decimal(5, 2)), N'Final', 5)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (29, 9, 10, 9, CAST(N'2025-03-05' AS Date), CAST(4.40 AS Decimal(5, 2)), N'Parcial', 6)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (30, 10, 10, 9, CAST(N'2025-03-05' AS Date), CAST(3.80 AS Decimal(5, 2)), N'Parcial', 6)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (33, 6, 1, 1, CAST(N'2026-03-26' AS Date), CAST(4.80 AS Decimal(5, 2)), N'Parcial', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (34, 6, 2, 1, CAST(N'2026-03-26' AS Date), CAST(4.20 AS Decimal(5, 2)), N'Talleres', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (35, 6, 3, 1, CAST(N'2026-03-26' AS Date), CAST(4.50 AS Decimal(5, 2)), N'Examen', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (36, 7, 1, 1, CAST(N'2026-03-26' AS Date), CAST(3.80 AS Decimal(5, 2)), N'General', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (37, 11, 1, 10, CAST(N'2026-03-26' AS Date), CAST(0.00 AS Decimal(5, 2)), N'Tarea', 1)
GO
INSERT [dbo].[EVALUACION] ([id_evaluacion], [id_estudiante], [id_materia], [id_curso], [fecha_evaluacion], [nota], [tipo_evaluacion], [id_calificador]) VALUES (38, 1, 1, 1, CAST(N'2026-03-26' AS Date), CAST(4.20 AS Decimal(5, 2)), N'Parcial 1', 1)
GO
SET IDENTITY_INSERT [dbo].[EVALUACION] OFF
GO
SET IDENTITY_INSERT [dbo].[GU_DETALLE_ROL] ON 
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (1, 1, N'Configuración inicial del rol Administrador', CAST(N'2023-01-01' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (2, 2, N'Configuración inicial del rol Coordinador', CAST(N'2023-01-05' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (3, 3, N'Configuración inicial del rol Profesor', CAST(N'2023-01-10' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (4, 4, N'Configuración inicial del rol Estudiante', CAST(N'2023-01-16' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (5, 5, N'Configuración inicial del rol Padre/Tutor', CAST(N'2023-01-20' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (6, 1, N'Configuración inicial del rol Administrador', CAST(N'2023-01-01' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (7, 2, N'Configuración inicial del rol Coordinador', CAST(N'2023-01-05' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (8, 3, N'Configuración inicial del rol Profesor', CAST(N'2023-01-10' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (9, 4, N'Configuración inicial del rol Estudiante', CAST(N'2023-01-16' AS Date), 1)
GO
INSERT [dbo].[GU_DETALLE_ROL] ([id_detalle], [id_rol], [descripcion], [fecha_mod], [modificado_por]) VALUES (10, 5, N'Configuración inicial del rol Padre/Tutor', CAST(N'2023-01-20' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[GU_DETALLE_ROL] OFF
GO
SET IDENTITY_INSERT [dbo].[GU_HISTORIAL_PASSWORD] ON 
GO
INSERT [dbo].[GU_HISTORIAL_PASSWORD] ([id_historial], [id_usuario], [contrasena_hash], [fecha_cambio]) VALUES (1, 6, N'$2b$12$OldHash001ForLaura', CAST(N'2023-01-16T08:00:00.000' AS DateTime))
GO
INSERT [dbo].[GU_HISTORIAL_PASSWORD] ([id_historial], [id_usuario], [contrasena_hash], [fecha_cambio]) VALUES (2, 6, N'$2b$12$NewHash001ForLaura', CAST(N'2024-06-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[GU_HISTORIAL_PASSWORD] ([id_historial], [id_usuario], [contrasena_hash], [fecha_cambio]) VALUES (3, 7, N'$2b$12$OldHash002ForSantiago', CAST(N'2023-01-16T08:00:00.000' AS DateTime))
GO
INSERT [dbo].[GU_HISTORIAL_PASSWORD] ([id_historial], [id_usuario], [contrasena_hash], [fecha_cambio]) VALUES (4, 6, N'$2b$12$OldHash001ForLaura', CAST(N'2023-01-16T08:00:00.000' AS DateTime))
GO
INSERT [dbo].[GU_HISTORIAL_PASSWORD] ([id_historial], [id_usuario], [contrasena_hash], [fecha_cambio]) VALUES (5, 6, N'$2b$12$NewHash001ForLaura', CAST(N'2024-06-01T09:00:00.000' AS DateTime))
GO
INSERT [dbo].[GU_HISTORIAL_PASSWORD] ([id_historial], [id_usuario], [contrasena_hash], [fecha_cambio]) VALUES (6, 7, N'$2b$12$OldHash002ForSantiago', CAST(N'2023-01-16T08:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[GU_HISTORIAL_PASSWORD] OFF
GO
SET IDENTITY_INSERT [dbo].[GU_INTENTOS_LOGIN] ON 
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (1, 6, CAST(N'2025-03-10T07:15:00.000' AS DateTime), 1, N'192.168.1.10', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (2, 7, CAST(N'2025-03-10T07:22:00.000' AS DateTime), 1, N'192.168.1.11', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (3, 6, CAST(N'2025-03-11T08:00:00.000' AS DateTime), 0, N'192.168.1.10', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (4, 6, CAST(N'2025-03-11T08:01:00.000' AS DateTime), 0, N'192.168.1.10', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (5, 6, CAST(N'2025-03-11T08:01:30.000' AS DateTime), 1, N'192.168.1.10', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (6, 3, CAST(N'2025-03-12T06:55:00.000' AS DateTime), 1, N'190.10.20.30', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (7, 6, CAST(N'2025-03-10T07:15:00.000' AS DateTime), 1, N'192.168.1.10', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (8, 7, CAST(N'2025-03-10T07:22:00.000' AS DateTime), 1, N'192.168.1.11', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (9, 6, CAST(N'2025-03-11T08:00:00.000' AS DateTime), 0, N'192.168.1.10', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (10, 6, CAST(N'2025-03-11T08:01:00.000' AS DateTime), 0, N'192.168.1.10', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (11, 6, CAST(N'2025-03-11T08:01:30.000' AS DateTime), 1, N'192.168.1.10', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (12, 3, CAST(N'2025-03-12T06:55:00.000' AS DateTime), 1, N'190.10.20.30', NULL)
GO
INSERT [dbo].[GU_INTENTOS_LOGIN] ([id_intento], [id_usuario], [fecha_intento], [exitoso], [ip_origen], [bloqueado_hasta]) VALUES (13, 2, CAST(N'2026-03-26T14:59:23.113' AS DateTime), 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[GU_INTENTOS_LOGIN] OFF
GO
SET IDENTITY_INSERT [dbo].[GU_MENU_PERMISO] ON 
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (1, N'Dashboard', N'/dashboard', N'fas fa-home', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (2, N'Estudiantes', N'/estudiantes', N'fas fa-user-graduate', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (3, N'Profesores', N'/profesores', N'fas fa-chalkboard-teacher', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (4, N'Cursos', N'/cursos', N'fas fa-book-open', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (5, N'Evaluaciones', N'/evaluaciones', N'fas fa-clipboard-list', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (6, N'Asistencias', N'/asistencias', N'fas fa-calendar-check', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (7, N'Documentos', N'/documentos', N'fas fa-file-alt', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (8, N'Usuarios', N'/usuarios', N'fas fa-users-cog', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (9, N'Reportes', N'/reportes', N'fas fa-chart-bar', 1)
GO
INSERT [dbo].[GU_MENU_PERMISO] ([id_menu], [nombre_menu], [ruta], [icono], [activo]) VALUES (10, N'Configuración', N'/configuracion', N'fas fa-cog', 1)
GO
SET IDENTITY_INSERT [dbo].[GU_MENU_PERMISO] OFF
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 1, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 2, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 3, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 4, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 5, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 6, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 7, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 8, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 9, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (1, 10, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (2, 1, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (2, 2, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (2, 4, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (2, 5, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (2, 9, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (3, 1, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (3, 5, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (3, 6, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (3, 7, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (4, 1, CAST(N'2023-01-16' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (4, 5, CAST(N'2023-01-16' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (4, 7, CAST(N'2023-01-16' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (5, 1, CAST(N'2023-01-20' AS Date))
GO
INSERT [dbo].[GU_MENU_PERMISO_ROL] ([id_rol], [id_menu], [fecha_asignacion]) VALUES (5, 5, CAST(N'2023-01-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[GU_PARAMETRIZACION] ON 
GO
INSERT [dbo].[GU_PARAMETRIZACION] ([id_param], [modulo], [clave], [valor], [descripcion], [activo], [fecha_mod]) VALUES (1, N'seguridad', N'max_intentos_login', N'5', N'Máximo de intentos antes de bloqueo', 1, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_PARAMETRIZACION] ([id_param], [modulo], [clave], [valor], [descripcion], [activo], [fecha_mod]) VALUES (2, N'seguridad', N'minutos_bloqueo', N'30', N'Minutos de bloqueo tras intentos fallidos', 1, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_PARAMETRIZACION] ([id_param], [modulo], [clave], [valor], [descripcion], [activo], [fecha_mod]) VALUES (3, N'seguridad', N'expiracion_token_minutos', N'60', N'Minutos de validez del token de recuperación', 1, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_PARAMETRIZACION] ([id_param], [modulo], [clave], [valor], [descripcion], [activo], [fecha_mod]) VALUES (4, N'sistema', N'nombre_institucion', N'Colegio San Agustín', N'Nombre oficial de la institución', 1, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_PARAMETRIZACION] ([id_param], [modulo], [clave], [valor], [descripcion], [activo], [fecha_mod]) VALUES (5, N'sistema', N'anio_lectivo_actual', N'2025', N'Año escolar en curso', 1, CAST(N'2025-01-01' AS Date))
GO
INSERT [dbo].[GU_PARAMETRIZACION] ([id_param], [modulo], [clave], [valor], [descripcion], [activo], [fecha_mod]) VALUES (6, N'correo', N'smtp_host', N'smtp.colegio.edu.co', N'Servidor SMTP saliente', 1, CAST(N'2023-01-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[GU_PARAMETRIZACION] OFF
GO
SET IDENTITY_INSERT [dbo].[GU_PERMISO] ON 
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (1, N'VER_ESTUDIANTES', N'Académico')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (2, N'CREAR_ESTUDIANTES', N'Académico')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (3, N'EDITAR_ESTUDIANTES', N'Académico')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (4, N'ELIMINAR_ESTUDIANTES', N'Académico')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (5, N'VER_NOTAS', N'Evaluaciones')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (6, N'REGISTRAR_NOTAS', N'Evaluaciones')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (7, N'VER_ASISTENCIAS', N'Asistencias')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (8, N'REGISTRAR_ASISTENCIAS', N'Asistencias')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (9, N'VER_DOCUMENTOS', N'Documental')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (10, N'SUBIR_DOCUMENTOS', N'Documental')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (11, N'ADMINISTRAR_USUARIOS', N'Usuarios')
GO
INSERT [dbo].[GU_PERMISO] ([id_permiso], [nombre_permiso], [modulo]) VALUES (12, N'VER_REPORTES', N'Reportes')
GO
SET IDENTITY_INSERT [dbo].[GU_PERMISO] OFF
GO
SET IDENTITY_INSERT [dbo].[GU_RECUPERACION_PASSWORD] ON 
GO
INSERT [dbo].[GU_RECUPERACION_PASSWORD] ([id_recuperacion], [id_usuario], [token], [fecha_expiracion], [fecha_solicitud], [fecha_uso], [id_solicitante], [usado]) VALUES (1, 7, N'tok-abc123xyz-unique-2025-001', CAST(N'2025-02-01T10:00:00.000' AS DateTime), CAST(N'2025-02-01T09:00:00.000' AS DateTime), CAST(N'2025-02-01T09:45:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[GU_RECUPERACION_PASSWORD] ([id_recuperacion], [id_usuario], [token], [fecha_expiracion], [fecha_solicitud], [fecha_uso], [id_solicitante], [usado]) VALUES (2, 8, N'tok-def456uvw-unique-2025-002', CAST(N'2025-03-05T15:00:00.000' AS DateTime), CAST(N'2025-03-05T14:00:00.000' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[GU_RECUPERACION_PASSWORD] OFF
GO
SET IDENTITY_INSERT [dbo].[GU_ROL] ON 
GO
INSERT [dbo].[GU_ROL] ([id_rol], [nombre_rol], [descripcion]) VALUES (1, N'Administrador', N'Acceso total al sistema')
GO
INSERT [dbo].[GU_ROL] ([id_rol], [nombre_rol], [descripcion]) VALUES (2, N'Coordinador', N'Gestión académica y reportes')
GO
INSERT [dbo].[GU_ROL] ([id_rol], [nombre_rol], [descripcion]) VALUES (3, N'Profesor', N'Registro de notas y asistencias')
GO
INSERT [dbo].[GU_ROL] ([id_rol], [nombre_rol], [descripcion]) VALUES (4, N'Estudiante', N'Consulta de calificaciones y materiales')
GO
INSERT [dbo].[GU_ROL] ([id_rol], [nombre_rol], [descripcion]) VALUES (5, N'Padre_Tutor', N'Consulta del seguimiento de su hijo/a')
GO
SET IDENTITY_INSERT [dbo].[GU_ROL] OFF
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 1, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 2, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 3, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 4, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 5, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 6, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 7, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 8, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 9, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 10, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 11, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (1, 12, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (2, 1, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (2, 5, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (2, 7, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (2, 9, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (2, 12, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (3, 1, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (3, 5, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (3, 6, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (3, 7, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (3, 8, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (3, 9, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (3, 10, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (4, 5, CAST(N'2023-01-16' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (4, 9, CAST(N'2023-01-16' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (5, 5, CAST(N'2023-01-20' AS Date))
GO
INSERT [dbo].[GU_ROL_PERMISO] ([id_rol], [id_permiso], [fecha_asignacion]) VALUES (5, 7, CAST(N'2023-01-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[GU_Usuario] ON 
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (1, N'admin', N'Administrador', N'Sistema', N'admin@colegio.edu.co', N'admin123', CAST(N'2023-01-01' AS Date), 1, N'admin')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (2, N'coord.academico', N'Juan Pablo', N'Nieto', N'jp.nieto@colegio.edu.co', N'$2b$12$CoordHash001', CAST(N'2023-01-05' AS Date), 1, N'admin')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (3, N'prof.mendoza', N'Carlos', N'Mendoza', N'c.mendoza@colegio.edu.co', N'$2b$12$ProfHash001', CAST(N'2023-01-10' AS Date), 1, N'docente')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (4, N'prof.rios', N'Adriana', N'Ríos', N'a.rios@colegio.edu.co', N'$2b$12$ProfHash002', CAST(N'2023-01-10' AS Date), 1, N'docente')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (5, N'prof.castro', N'Julián', N'Castro', N'j.castro@colegio.edu.co', N'$2b$12$ProfHash003', CAST(N'2023-01-10' AS Date), 1, N'docente')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (6, N'est.lgomez', N'Laura', N'Gómez', N'laura.gomez@estudiantil.edu.co', N'$2b$12$EstHash001', CAST(N'2023-01-16' AS Date), 1, N'estudiante')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (7, N'est.sperez', N'Santiago', N'Pérez', N'santiago.perez@estudiantil.edu.co', N'$2b$12$EstHash002', CAST(N'2023-01-16' AS Date), 1, N'estudiante')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (8, N'est.vlopez', N'Valentina', N'López', N'valentina.lopez@estudiantil.edu.co', N'$2b$12$EstHash003', CAST(N'2023-01-16' AS Date), 1, N'estudiante')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (9, N'padre.jgomez', N'Jorge', N'Gómez', N'jorge.gomez@mail.com', N'$2b$12$PadreHash001', CAST(N'2023-01-20' AS Date), 1, N'acudiente')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (10, N'padre.pperez', N'Patricia', N'Pérez', N'patricia.perez@mail.com', N'$2b$12$PadreHash002', CAST(N'2023-01-20' AS Date), 1, N'acudiente')
GO
INSERT [dbo].[GU_Usuario] ([ID_Usuario], [NOMBRE_USUARIO], [NOMBRES], [APELLIDOS], [CORREO_ELECTRONICO], [CONTRASEÑA], [FECHA_CREACION], [ACTIVO], [ROL]) VALUES (12, N'', N'Jean', N'Pinzon', N'jean.pinzon@estudiantil.edu.co', N'@estudiantil.edu.c4', CAST(N'2026-03-28' AS Date), 1, N'estudiante')
GO
SET IDENTITY_INSERT [dbo].[GU_Usuario] OFF
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (1, 1, CAST(N'2023-01-01' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (2, 2, CAST(N'2023-01-05' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (3, 3, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (4, 3, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (5, 3, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (6, 4, CAST(N'2023-01-16' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (7, 4, CAST(N'2023-01-16' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (8, 4, CAST(N'2023-01-16' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (9, 5, CAST(N'2023-01-20' AS Date))
GO
INSERT [dbo].[GU_USUARIO_ROL] ([id_usuario], [id_rol], [fecha_asignacion]) VALUES (10, 5, CAST(N'2023-01-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[HORARIO] ON 
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (1, 1, 1, 1, N'Lunes', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (2, 1, 1, 1, N'Miércoles', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (3, 2, 4, 2, N'Martes', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (4, 2, 4, 2, N'Jueves', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (5, 3, 2, 3, N'Lunes', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (6, 4, 5, 5, N'Lunes', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (7, 4, 5, 5, N'Miércoles', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (8, 5, 5, 5, N'Martes', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (9, 5, 5, 5, N'Jueves', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (10, 6, 5, 5, N'Viernes', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (11, 7, 3, 4, N'Martes', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (12, 8, 4, 7, N'Miércoles', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (13, 9, 6, 6, N'Lunes', CAST(N'07:00:00' AS Time), CAST(N'08:30:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (14, 10, 1, 1, N'Jueves', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (15, 1, 1, 1, N'Lunes', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (16, 1, 1, 1, N'Miércoles', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (17, 2, 4, 2, N'Martes', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (18, 2, 4, 2, N'Jueves', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (19, 3, 2, 3, N'Lunes', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (20, 4, 5, 5, N'Lunes', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (21, 4, 5, 5, N'Miércoles', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (22, 5, 5, 5, N'Martes', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (23, 5, 5, 5, N'Jueves', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (24, 6, 5, 5, N'Viernes', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (25, 7, 3, 4, N'Martes', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (26, 8, 4, 7, N'Miércoles', CAST(N'10:00:00' AS Time), CAST(N'11:30:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (27, 9, 6, 6, N'Lunes', CAST(N'07:00:00' AS Time), CAST(N'08:30:00' AS Time))
GO
INSERT [dbo].[HORARIO] ([id_horario], [id_curso], [id_aula], [id_profesor], [dia], [hora_inicio], [hora_fin]) VALUES (28, 10, 1, 1, N'Jueves', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[HORARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[INSCRIPCION] ON 
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (1, 1, 1, 2024, CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (2, 2, 1, 2024, CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (3, 3, 1, 2024, CAST(N'2024-01-16' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (4, 4, 2, 2024, CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (5, 5, 2, 2024, CAST(N'2024-01-16' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (6, 6, 3, 2024, CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (7, 7, 4, 2024, CAST(N'2024-07-10' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (8, 8, 4, 2024, CAST(N'2024-07-11' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (9, 9, 9, 2025, CAST(N'2025-01-14' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (10, 10, 9, 2025, CAST(N'2025-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (11, 11, 10, 2025, CAST(N'2025-01-14' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (12, 12, 10, 2025, CAST(N'2025-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (13, 1, 1, 2024, CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (14, 2, 1, 2024, CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (15, 3, 1, 2024, CAST(N'2024-01-16' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (16, 4, 2, 2024, CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (17, 5, 2, 2024, CAST(N'2024-01-16' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (18, 6, 3, 2024, CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (19, 7, 4, 2024, CAST(N'2024-07-10' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (20, 8, 4, 2024, CAST(N'2024-07-11' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (21, 9, 9, 2025, CAST(N'2025-01-14' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (22, 10, 9, 2025, CAST(N'2025-01-15' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (23, 11, 10, 2025, CAST(N'2025-01-14' AS Date))
GO
INSERT [dbo].[INSCRIPCION] ([id_inscripcion], [id_estudiante], [id_curso], [anio], [fecha_inscripcion]) VALUES (24, 12, 10, 2025, CAST(N'2025-01-15' AS Date))
GO
SET IDENTITY_INSERT [dbo].[INSCRIPCION] OFF
GO
SET IDENTITY_INSERT [dbo].[MATERIA] ON 
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (1, N'Álgebra Lineal', N'Vectores, matrices y transformaciones lineales', 4, 4, 1)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (2, N'Cálculo Diferencial', N'Límites, derivadas y aplicaciones', 4, 4, 1)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (3, N'Física Mecánica', N'Cinemática, dinámica y trabajo-energía', 3, 3, 2)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (4, N'Literatura Universal', N'Grandes obras de la literatura mundial', 3, 3, 3)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (5, N'Lengua y Redacción', N'Técnicas de escritura académica', 2, 2, 3)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (6, N'Historia Contemporánea', N'Siglos XIX y XX en perspectiva global', 3, 3, 4)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (7, N'Programación I', N'Lógica de programación y Python', 4, 5, 5)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (8, N'Programación II', N'Estructuras de datos y algoritmos', 4, 5, 5)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (9, N'Bases de Datos', N'Modelado relacional y SQL', 4, 4, 5)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (10, N'Redes de Computadoras', N'Modelos OSI/TCP-IP y protocolos', 3, 3, 6)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (11, N'Biología Celular', N'Estructura y función de la célula', 3, 3, 7)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (12, N'Teoría Musical', N'Solfeo, armonía y lectoescritura musical', 2, 2, 8)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (13, N'Álgebra Lineal', N'Vectores, matrices y transformaciones lineales', 4, 4, 1)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (14, N'Cálculo Diferencial', N'Límites, derivadas y aplicaciones', 4, 4, 1)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (15, N'Física Mecánica', N'Cinemática, dinámica y trabajo-energía', 3, 3, 2)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (16, N'Literatura Universal', N'Grandes obras de la literatura mundial', 3, 3, 3)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (17, N'Lengua y Redacción', N'Técnicas de escritura académica', 2, 2, 3)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (18, N'Historia Contemporánea', N'Siglos XIX y XX en perspectiva global', 3, 3, 4)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (19, N'Programación I', N'Lógica de programación y Python', 4, 5, 5)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (20, N'Programación II', N'Estructuras de datos y algoritmos', 4, 5, 5)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (21, N'Bases de Datos', N'Modelado relacional y SQL', 4, 4, 5)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (22, N'Redes de Computadoras', N'Modelos OSI/TCP-IP y protocolos', 3, 3, 6)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (23, N'Biología Celular', N'Estructura y función de la célula', 3, 3, 7)
GO
INSERT [dbo].[MATERIA] ([id_materia], [nombre_materia], [descripcion], [creditos], [horas_semana], [id_area]) VALUES (24, N'Teoría Musical', N'Solfeo, armonía y lectoescritura musical', 2, 2, 8)
GO
SET IDENTITY_INSERT [dbo].[MATERIA] OFF
GO
SET IDENTITY_INSERT [dbo].[MATRICULA] ON 
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (1, 1, 1, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (2, 2, 1, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (3, 3, 1, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (4, 4, 2, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (5, 5, 2, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (6, 6, 3, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (7, 7, 4, CAST(N'2024-07-12' AS Date), N'2024-II', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (8, 8, 4, CAST(N'2024-07-12' AS Date), N'2024-II', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (9, 1, 5, CAST(N'2024-07-12' AS Date), N'2024-II', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (10, 2, 6, CAST(N'2024-07-12' AS Date), N'2024-II', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (11, 9, 9, CAST(N'2025-01-17' AS Date), N'2025-I', N'Activa', 2025)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (12, 10, 9, CAST(N'2025-01-17' AS Date), N'2025-I', N'Activa', 2025)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (13, 11, 10, CAST(N'2025-01-17' AS Date), N'2025-I', N'Activa', 2025)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (14, 12, 10, CAST(N'2025-01-17' AS Date), N'2025-I', N'Activa', 2025)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (15, 1, 1, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (16, 2, 1, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (17, 3, 1, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (18, 4, 2, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (19, 5, 2, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (20, 6, 3, CAST(N'2024-01-19' AS Date), N'2024-I', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (21, 7, 4, CAST(N'2024-07-12' AS Date), N'2024-II', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (22, 8, 4, CAST(N'2024-07-12' AS Date), N'2024-II', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (23, 1, 5, CAST(N'2024-07-12' AS Date), N'2024-II', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (24, 2, 6, CAST(N'2024-07-12' AS Date), N'2024-II', N'Finalizada', 2024)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (25, 9, 9, CAST(N'2025-01-17' AS Date), N'2025-I', N'Activa', 2025)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (26, 10, 9, CAST(N'2025-01-17' AS Date), N'2025-I', N'Activa', 2025)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (27, 11, 10, CAST(N'2025-01-17' AS Date), N'2025-I', N'Activa', 2025)
GO
INSERT [dbo].[MATRICULA] ([id_matricula], [id_estudiante], [id_curso], [fecha_matricula], [periodo_academico], [estado], [anio]) VALUES (28, 12, 10, CAST(N'2025-01-17' AS Date), N'2025-I', N'Activa', 2025)
GO
SET IDENTITY_INSERT [dbo].[MATRICULA] OFF
GO
SET IDENTITY_INSERT [dbo].[PADRE_TUTOR] ON 
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (1, N'Jorge', N'Gómez', N'3100000001', N'jorge.gomez@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (2, N'Patricia', N'Pérez', N'3100000002', N'patricia.perez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (3, N'Claudia', N'López', N'3100000003', N'claudia.lopez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (4, N'Ricardo', N'Hernández', N'3100000004', N'r.hernandez@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (5, N'Martha', N'Martínez', N'3100000005', N'martha.martinez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (6, N'Gustavo', N'García', N'3100000006', N'gustavo.garcia@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (7, N'Elena', N'Rodríguez', N'3100000007', N'elena.rodriguez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (8, N'Roberto', N'Ramírez', N'3100000008', N'roberto.ramirez@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (9, N'Natalia', N'Díaz', N'3100000009', N'natalia.diaz@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (10, N'Ernesto', N'Morales', N'3100000010', N'ernesto.morales@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (11, N'Carmen', N'Jiménez', N'3100000011', N'carmen.jimenez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (12, N'Alejandro', N'Ruiz', N'3100000012', N'alejandro.ruiz@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (13, N'Jorge', N'Gómez', N'3100000001', N'jorge.gomez@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (14, N'Patricia', N'Pérez', N'3100000002', N'patricia.perez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (15, N'Claudia', N'López', N'3100000003', N'claudia.lopez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (16, N'Ricardo', N'Hernández', N'3100000004', N'r.hernandez@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (17, N'Martha', N'Martínez', N'3100000005', N'martha.martinez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (18, N'Gustavo', N'García', N'3100000006', N'gustavo.garcia@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (19, N'Elena', N'Rodríguez', N'3100000007', N'elena.rodriguez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (20, N'Roberto', N'Ramírez', N'3100000008', N'roberto.ramirez@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (21, N'Natalia', N'Díaz', N'3100000009', N'natalia.diaz@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (22, N'Ernesto', N'Morales', N'3100000010', N'ernesto.morales@mail.com', N'Padre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (23, N'Carmen', N'Jiménez', N'3100000011', N'carmen.jimenez@mail.com', N'Madre')
GO
INSERT [dbo].[PADRE_TUTOR] ([id_padre], [nombre], [apellido], [telefono], [email], [relacion_estudiante]) VALUES (24, N'Alejandro', N'Ruiz', N'3100000012', N'alejandro.ruiz@mail.com', N'Padre')
GO
SET IDENTITY_INSERT [dbo].[PADRE_TUTOR] OFF
GO
SET IDENTITY_INSERT [dbo].[PERIODO] ON 
GO
INSERT [dbo].[PERIODO] ([id_periodo], [nombre], [fecha_inicio], [fecha_fin]) VALUES (1, N'2024-I', CAST(N'2024-01-22' AS Date), CAST(N'2024-06-14' AS Date))
GO
INSERT [dbo].[PERIODO] ([id_periodo], [nombre], [fecha_inicio], [fecha_fin]) VALUES (2, N'2024-II', CAST(N'2024-07-15' AS Date), CAST(N'2024-11-29' AS Date))
GO
INSERT [dbo].[PERIODO] ([id_periodo], [nombre], [fecha_inicio], [fecha_fin]) VALUES (3, N'2025-I', CAST(N'2025-01-20' AS Date), CAST(N'2025-06-13' AS Date))
GO
INSERT [dbo].[PERIODO] ([id_periodo], [nombre], [fecha_inicio], [fecha_fin]) VALUES (4, N'2024-I', CAST(N'2024-01-22' AS Date), CAST(N'2024-06-14' AS Date))
GO
INSERT [dbo].[PERIODO] ([id_periodo], [nombre], [fecha_inicio], [fecha_fin]) VALUES (5, N'2024-II', CAST(N'2024-07-15' AS Date), CAST(N'2024-11-29' AS Date))
GO
INSERT [dbo].[PERIODO] ([id_periodo], [nombre], [fecha_inicio], [fecha_fin]) VALUES (6, N'2025-I', CAST(N'2025-01-20' AS Date), CAST(N'2025-06-13' AS Date))
GO
SET IDENTITY_INSERT [dbo].[PERIODO] OFF
GO
SET IDENTITY_INSERT [dbo].[PROFESOR] ON 
GO
INSERT [dbo].[PROFESOR] ([id_profesor], [nombre], [apellido], [direccion], [telefono], [email], [especialidad], [id_departamento]) VALUES (1, N'Carlos', N'Mendoza', N'Calle 45 # 12-30, Bogotá', N'3001234567', N'c.mendoza@colegio.edu.co', N'Álgebra y Cálculo', 1)
GO
INSERT [dbo].[PROFESOR] ([id_profesor], [nombre], [apellido], [direccion], [telefono], [email], [especialidad], [id_departamento]) VALUES (2, N'Adriana', N'Ríos', N'Av. 68 # 23-10, Bogotá', N'3112345678', N'a.rios@colegio.edu.co', N'Física Clásica', 1)
GO
INSERT [dbo].[PROFESOR] ([id_profesor], [nombre], [apellido], [direccion], [telefono], [email], [especialidad], [id_departamento]) VALUES (3, N'Hernán', N'Salcedo', N'Cra. 7 # 45-60, Bogotá', N'3209876543', N'h.salcedo@colegio.edu.co', N'Literatura y Lingüística', 2)
GO
INSERT [dbo].[PROFESOR] ([id_profesor], [nombre], [apellido], [direccion], [telefono], [email], [especialidad], [id_departamento]) VALUES (4, N'Margarita', N'Torres', N'Calle 100 # 15-20, Bogotá', N'3154321098', N'm.torres@colegio.edu.co', N'Historia', 2)
GO
INSERT [dbo].[PROFESOR] ([id_profesor], [nombre], [apellido], [direccion], [telefono], [email], [especialidad], [id_departamento]) VALUES (5, N'Julián', N'Castro', N'Cra. 30 # 80-55, Bogotá', N'3001112233', N'j.castro@colegio.edu.co', N'Ingeniería de Software', 3)
GO
INSERT [dbo].[PROFESOR] ([id_profesor], [nombre], [apellido], [direccion], [telefono], [email], [especialidad], [id_departamento]) VALUES (6, N'Paola', N'Vargas', N'Calle 72 # 5-18, Bogotá', N'3204445566', N'p.vargas@colegio.edu.co', N'Redes y Telecomunicaciones', 3)
GO
INSERT [dbo].[PROFESOR] ([id_profesor], [nombre], [apellido], [direccion], [telefono], [email], [especialidad], [id_departamento]) VALUES (7, N'Andrés', N'Moreno', N'Transv. 23 # 34-12, Bogotá', N'3107778899', N'a.moreno@colegio.edu.co', N'Biología Molecular', 4)
GO
INSERT [dbo].[PROFESOR] ([id_profesor], [nombre], [apellido], [direccion], [telefono], [email], [especialidad], [id_departamento]) VALUES (8, N'Liliana', N'Suárez', N'Calle 53 # 27-08, Bogotá', N'3156667788', N'l.suarez@colegio.edu.co', N'Educación Musical', 5)
GO
SET IDENTITY_INSERT [dbo].[PROFESOR] OFF
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (1, 1, 2024, 4)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (1, 1, 2025, 4)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (1, 2, 2024, 4)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (2, 3, 2024, 3)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (3, 4, 2024, 3)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (3, 5, 2024, 2)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (4, 6, 2024, 3)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (5, 7, 2024, 5)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (5, 8, 2024, 5)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (5, 9, 2024, 4)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (6, 10, 2025, 3)
GO
INSERT [dbo].[PROFESOR_MATERIA] ([id_profesor], [id_materia], [anio_escolar], [horas_semana]) VALUES (7, 11, 2024, 3)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__AULA__4AABD47EC4CB485A]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[AULA] ADD UNIQUE NONCLUSTERED 
(
	[codigo_aula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ESTUDIAN__59C16A3C629682E4]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[ESTUDIANTE] ADD UNIQUE NONCLUSTERED 
(
	[codigo_estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ESTUDIAN__AB6E61640EB7A476]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[ESTUDIANTE] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_EXINS]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[EXTRA_INSCRIPCION] ADD  CONSTRAINT [UQ_EXINS] UNIQUE NONCLUSTERED 
(
	[id_estudiante] ASC,
	[id_extra_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GU_MENU___272429412F6CF36E]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[GU_MENU_PERMISO] ADD UNIQUE NONCLUSTERED 
(
	[nombre_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GU_PARAM__71DCA3DBA354811B]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[GU_PARAMETRIZACION] ADD UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GU_PERMI__4FC6D0AC00BD0AB4]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[GU_PERMISO] ADD UNIQUE NONCLUSTERED 
(
	[nombre_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GU_RECUP__CA90DA7AA0001BE2]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[GU_RECUPERACION_PASSWORD] ADD UNIQUE NONCLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GU_ROL__673CB435A3196F8D]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[GU_ROL] ADD UNIQUE NONCLUSTERED 
(
	[nombre_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GU_Usuar__1E139900A9016882]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[GU_Usuario] ADD UNIQUE NONCLUSTERED 
(
	[NOMBRE_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__GU_Usuar__30D61C6C49632BD4]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[GU_Usuario] ADD UNIQUE NONCLUSTERED 
(
	[CORREO_ELECTRONICO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PROFESOR__AB6E6164322B5252]    Script Date: 16/04/2026 3:09:37 p. m. ******/
ALTER TABLE [dbo].[PROFESOR] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Calificaciones] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CITACION] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[CITACION] ADD  DEFAULT ((0)) FOR [leido]
GO
ALTER TABLE [dbo].[DOCUMENTO] ADD  DEFAULT ('borrador') FOR [estado_documento]
GO
ALTER TABLE [dbo].[DOCUMENTO] ADD  DEFAULT ((1)) FOR [version]
GO
ALTER TABLE [dbo].[DOCUMENTO] ADD  DEFAULT (getdate()) FOR [fecha_subida]
GO
ALTER TABLE [dbo].[DOCUMENTO_VERSION] ADD  DEFAULT (getdate()) FOR [fecha_version]
GO
ALTER TABLE [dbo].[ESTUDIANTE_PADRE] ADD  DEFAULT ((1)) FOR [es_principal]
GO
ALTER TABLE [dbo].[EXTRA_CURSO] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[EXTRA_INSCRIPCION] ADD  DEFAULT (getdate()) FOR [fecha_inscripcion]
GO
ALTER TABLE [dbo].[EXTRA_INSCRIPCION] ADD  DEFAULT ('Inscrito') FOR [estado]
GO
ALTER TABLE [dbo].[GU_DETALLE_ROL] ADD  DEFAULT (getdate()) FOR [fecha_mod]
GO
ALTER TABLE [dbo].[GU_HISTORIAL_PASSWORD] ADD  DEFAULT (getdate()) FOR [fecha_cambio]
GO
ALTER TABLE [dbo].[GU_INTENTOS_LOGIN] ADD  DEFAULT (getdate()) FOR [fecha_intento]
GO
ALTER TABLE [dbo].[GU_MENU_PERMISO] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[GU_MENU_PERMISO_ROL] ADD  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[GU_PARAMETRIZACION] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[GU_PARAMETRIZACION] ADD  DEFAULT (getdate()) FOR [fecha_mod]
GO
ALTER TABLE [dbo].[GU_RECUPERACION_PASSWORD] ADD  DEFAULT (getdate()) FOR [fecha_solicitud]
GO
ALTER TABLE [dbo].[GU_RECUPERACION_PASSWORD] ADD  DEFAULT ((0)) FOR [usado]
GO
ALTER TABLE [dbo].[GU_ROL_PERMISO] ADD  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[GU_Usuario] ADD  DEFAULT (getdate()) FOR [FECHA_CREACION]
GO
ALTER TABLE [dbo].[GU_Usuario] ADD  DEFAULT ((1)) FOR [ACTIVO]
GO
ALTER TABLE [dbo].[GU_USUARIO_ROL] ADD  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[MATRICULA] ADD  DEFAULT ('Activa') FOR [estado]
GO
ALTER TABLE [dbo].[AREA]  WITH CHECK ADD  CONSTRAINT [FK_AREA_DEPTO] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[DEPARTAMENTO] ([id_departamento])
GO
ALTER TABLE [dbo].[AREA] CHECK CONSTRAINT [FK_AREA_DEPTO]
GO
ALTER TABLE [dbo].[ASISTENCIA]  WITH CHECK ADD  CONSTRAINT [FK_ASIS_EST] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[ESTUDIANTE] ([id_estudiante])
GO
ALTER TABLE [dbo].[ASISTENCIA] CHECK CONSTRAINT [FK_ASIS_EST]
GO
ALTER TABLE [dbo].[ASISTENCIA]  WITH CHECK ADD  CONSTRAINT [FK_ASIS_HOR] FOREIGN KEY([id_horario])
REFERENCES [dbo].[HORARIO] ([id_horario])
GO
ALTER TABLE [dbo].[ASISTENCIA] CHECK CONSTRAINT [FK_ASIS_HOR]
GO
ALTER TABLE [dbo].[ASISTENCIA]  WITH CHECK ADD  CONSTRAINT [FK_ASIS_PROF] FOREIGN KEY([id_profesor])
REFERENCES [dbo].[PROFESOR] ([id_profesor])
GO
ALTER TABLE [dbo].[ASISTENCIA] CHECK CONSTRAINT [FK_ASIS_PROF]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_Nota] FOREIGN KEY([ID_Estudiante])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Estudiante_Nota]
GO
ALTER TABLE [dbo].[CITACION]  WITH CHECK ADD FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[CURSO]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_AREA] FOREIGN KEY([id_area])
REFERENCES [dbo].[AREA] ([id_area])
GO
ALTER TABLE [dbo].[CURSO] CHECK CONSTRAINT [FK_CURSO_AREA]
GO
ALTER TABLE [dbo].[CURSO]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_DEPTO] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[DEPARTAMENTO] ([id_departamento])
GO
ALTER TABLE [dbo].[CURSO] CHECK CONSTRAINT [FK_CURSO_DEPTO]
GO
ALTER TABLE [dbo].[CURSO]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_PERIODO] FOREIGN KEY([id_periodo])
REFERENCES [dbo].[PERIODO] ([id_periodo])
GO
ALTER TABLE [dbo].[CURSO] CHECK CONSTRAINT [FK_CURSO_PERIODO]
GO
ALTER TABLE [dbo].[CURSO_MATERIA]  WITH CHECK ADD  CONSTRAINT [FK_CM_CURSO] FOREIGN KEY([id_curso])
REFERENCES [dbo].[CURSO] ([id_curso])
GO
ALTER TABLE [dbo].[CURSO_MATERIA] CHECK CONSTRAINT [FK_CM_CURSO]
GO
ALTER TABLE [dbo].[CURSO_MATERIA]  WITH CHECK ADD  CONSTRAINT [FK_CM_MAT] FOREIGN KEY([id_materia])
REFERENCES [dbo].[MATERIA] ([id_materia])
GO
ALTER TABLE [dbo].[CURSO_MATERIA] CHECK CONSTRAINT [FK_CM_MAT]
GO
ALTER TABLE [dbo].[DOCUMENTO]  WITH CHECK ADD  CONSTRAINT [FK_DOC_AUTOR] FOREIGN KEY([id_usuario_autor])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[DOCUMENTO] CHECK CONSTRAINT [FK_DOC_AUTOR]
GO
ALTER TABLE [dbo].[DOCUMENTO]  WITH CHECK ADD  CONSTRAINT [FK_DOC_CURSO] FOREIGN KEY([id_curso])
REFERENCES [dbo].[CURSO] ([id_curso])
GO
ALTER TABLE [dbo].[DOCUMENTO] CHECK CONSTRAINT [FK_DOC_CURSO]
GO
ALTER TABLE [dbo].[DOCUMENTO]  WITH CHECK ADD  CONSTRAINT [FK_DOC_MAT] FOREIGN KEY([id_materia])
REFERENCES [dbo].[MATERIA] ([id_materia])
GO
ALTER TABLE [dbo].[DOCUMENTO] CHECK CONSTRAINT [FK_DOC_MAT]
GO
ALTER TABLE [dbo].[DOCUMENTO_ETIQUETA]  WITH CHECK ADD  CONSTRAINT [FK_DE_DOC] FOREIGN KEY([id_documento])
REFERENCES [dbo].[DOCUMENTO] ([id_documento])
GO
ALTER TABLE [dbo].[DOCUMENTO_ETIQUETA] CHECK CONSTRAINT [FK_DE_DOC]
GO
ALTER TABLE [dbo].[DOCUMENTO_VERSION]  WITH CHECK ADD  CONSTRAINT [FK_DV_DOC] FOREIGN KEY([id_documento])
REFERENCES [dbo].[DOCUMENTO] ([id_documento])
GO
ALTER TABLE [dbo].[DOCUMENTO_VERSION] CHECK CONSTRAINT [FK_DV_DOC]
GO
ALTER TABLE [dbo].[DOCUMENTO_VERSION]  WITH CHECK ADD  CONSTRAINT [FK_DV_USR] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[DOCUMENTO_VERSION] CHECK CONSTRAINT [FK_DV_USR]
GO
ALTER TABLE [dbo].[ESTUDIANTE_PADRE]  WITH CHECK ADD  CONSTRAINT [FK_EP_EST] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[ESTUDIANTE] ([id_estudiante])
GO
ALTER TABLE [dbo].[ESTUDIANTE_PADRE] CHECK CONSTRAINT [FK_EP_EST]
GO
ALTER TABLE [dbo].[ESTUDIANTE_PADRE]  WITH CHECK ADD  CONSTRAINT [FK_EP_PADRE] FOREIGN KEY([id_padre])
REFERENCES [dbo].[PADRE_TUTOR] ([id_padre])
GO
ALTER TABLE [dbo].[ESTUDIANTE_PADRE] CHECK CONSTRAINT [FK_EP_PADRE]
GO
ALTER TABLE [dbo].[EVALUACION]  WITH CHECK ADD  CONSTRAINT [FK_EVA_CUR] FOREIGN KEY([id_curso])
REFERENCES [dbo].[CURSO] ([id_curso])
GO
ALTER TABLE [dbo].[EVALUACION] CHECK CONSTRAINT [FK_EVA_CUR]
GO
ALTER TABLE [dbo].[EVALUACION]  WITH CHECK ADD  CONSTRAINT [FK_EVA_EST] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[ESTUDIANTE] ([id_estudiante])
GO
ALTER TABLE [dbo].[EVALUACION] CHECK CONSTRAINT [FK_EVA_EST]
GO
ALTER TABLE [dbo].[EVALUACION]  WITH CHECK ADD  CONSTRAINT [FK_EVA_MAT] FOREIGN KEY([id_materia])
REFERENCES [dbo].[MATERIA] ([id_materia])
GO
ALTER TABLE [dbo].[EVALUACION] CHECK CONSTRAINT [FK_EVA_MAT]
GO
ALTER TABLE [dbo].[EVALUACION]  WITH CHECK ADD  CONSTRAINT [FK_EVA_PROF] FOREIGN KEY([id_calificador])
REFERENCES [dbo].[PROFESOR] ([id_profesor])
GO
ALTER TABLE [dbo].[EVALUACION] CHECK CONSTRAINT [FK_EVA_PROF]
GO
ALTER TABLE [dbo].[EXTRA_CURSO]  WITH CHECK ADD  CONSTRAINT [FK_EXCUR_AULA] FOREIGN KEY([id_aula])
REFERENCES [dbo].[AULA] ([id_aula])
GO
ALTER TABLE [dbo].[EXTRA_CURSO] CHECK CONSTRAINT [FK_EXCUR_AULA]
GO
ALTER TABLE [dbo].[EXTRA_CURSO]  WITH CHECK ADD  CONSTRAINT [FK_EXCUR_PER] FOREIGN KEY([id_periodo])
REFERENCES [dbo].[PERIODO] ([id_periodo])
GO
ALTER TABLE [dbo].[EXTRA_CURSO] CHECK CONSTRAINT [FK_EXCUR_PER]
GO
ALTER TABLE [dbo].[EXTRA_INSCRIPCION]  WITH CHECK ADD  CONSTRAINT [FK_EXINS_CUR] FOREIGN KEY([id_extra_curso])
REFERENCES [dbo].[EXTRA_CURSO] ([id_extra_curso])
GO
ALTER TABLE [dbo].[EXTRA_INSCRIPCION] CHECK CONSTRAINT [FK_EXINS_CUR]
GO
ALTER TABLE [dbo].[EXTRA_INSCRIPCION]  WITH CHECK ADD  CONSTRAINT [FK_EXINS_EST] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[ESTUDIANTE] ([id_estudiante])
GO
ALTER TABLE [dbo].[EXTRA_INSCRIPCION] CHECK CONSTRAINT [FK_EXINS_EST]
GO
ALTER TABLE [dbo].[EXTRA_INSCRIPCION]  WITH CHECK ADD  CONSTRAINT [FK_EXINS_NUEVO] FOREIGN KEY([id_extra_curso_nuevo])
REFERENCES [dbo].[EXTRA_CURSO] ([id_extra_curso])
GO
ALTER TABLE [dbo].[EXTRA_INSCRIPCION] CHECK CONSTRAINT [FK_EXINS_NUEVO]
GO
ALTER TABLE [dbo].[GU_DETALLE_ROL]  WITH CHECK ADD  CONSTRAINT [FK_DR_ROL] FOREIGN KEY([id_rol])
REFERENCES [dbo].[GU_ROL] ([id_rol])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_DETALLE_ROL] CHECK CONSTRAINT [FK_DR_ROL]
GO
ALTER TABLE [dbo].[GU_DETALLE_ROL]  WITH CHECK ADD  CONSTRAINT [FK_DR_USR] FOREIGN KEY([modificado_por])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[GU_DETALLE_ROL] CHECK CONSTRAINT [FK_DR_USR]
GO
ALTER TABLE [dbo].[GU_HISTORIAL_PASSWORD]  WITH CHECK ADD  CONSTRAINT [FK_HP_USR] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_HISTORIAL_PASSWORD] CHECK CONSTRAINT [FK_HP_USR]
GO
ALTER TABLE [dbo].[GU_INTENTOS_LOGIN]  WITH CHECK ADD  CONSTRAINT [FK_IL_USR] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_INTENTOS_LOGIN] CHECK CONSTRAINT [FK_IL_USR]
GO
ALTER TABLE [dbo].[GU_MENU_PERMISO_ROL]  WITH CHECK ADD  CONSTRAINT [FK_MPR_MENU] FOREIGN KEY([id_menu])
REFERENCES [dbo].[GU_MENU_PERMISO] ([id_menu])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_MENU_PERMISO_ROL] CHECK CONSTRAINT [FK_MPR_MENU]
GO
ALTER TABLE [dbo].[GU_MENU_PERMISO_ROL]  WITH CHECK ADD  CONSTRAINT [FK_MPR_ROL] FOREIGN KEY([id_rol])
REFERENCES [dbo].[GU_ROL] ([id_rol])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_MENU_PERMISO_ROL] CHECK CONSTRAINT [FK_MPR_ROL]
GO
ALTER TABLE [dbo].[GU_RECUPERACION_PASSWORD]  WITH CHECK ADD  CONSTRAINT [FK_RP_SOL] FOREIGN KEY([id_solicitante])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
GO
ALTER TABLE [dbo].[GU_RECUPERACION_PASSWORD] CHECK CONSTRAINT [FK_RP_SOL]
GO
ALTER TABLE [dbo].[GU_RECUPERACION_PASSWORD]  WITH CHECK ADD  CONSTRAINT [FK_RP_USR] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_RECUPERACION_PASSWORD] CHECK CONSTRAINT [FK_RP_USR]
GO
ALTER TABLE [dbo].[GU_ROL_PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_RP_PERM] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[GU_PERMISO] ([id_permiso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_ROL_PERMISO] CHECK CONSTRAINT [FK_RP_PERM]
GO
ALTER TABLE [dbo].[GU_ROL_PERMISO]  WITH CHECK ADD  CONSTRAINT [FK_RP_ROL] FOREIGN KEY([id_rol])
REFERENCES [dbo].[GU_ROL] ([id_rol])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_ROL_PERMISO] CHECK CONSTRAINT [FK_RP_ROL]
GO
ALTER TABLE [dbo].[GU_USUARIO_ROL]  WITH CHECK ADD  CONSTRAINT [FK_UR_ROL] FOREIGN KEY([id_rol])
REFERENCES [dbo].[GU_ROL] ([id_rol])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_USUARIO_ROL] CHECK CONSTRAINT [FK_UR_ROL]
GO
ALTER TABLE [dbo].[GU_USUARIO_ROL]  WITH CHECK ADD  CONSTRAINT [FK_UR_USR] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[GU_Usuario] ([ID_Usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GU_USUARIO_ROL] CHECK CONSTRAINT [FK_UR_USR]
GO
ALTER TABLE [dbo].[HORARIO]  WITH CHECK ADD  CONSTRAINT [FK_HOR_AULA] FOREIGN KEY([id_aula])
REFERENCES [dbo].[AULA] ([id_aula])
GO
ALTER TABLE [dbo].[HORARIO] CHECK CONSTRAINT [FK_HOR_AULA]
GO
ALTER TABLE [dbo].[HORARIO]  WITH CHECK ADD  CONSTRAINT [FK_HOR_CURSO] FOREIGN KEY([id_curso])
REFERENCES [dbo].[CURSO] ([id_curso])
GO
ALTER TABLE [dbo].[HORARIO] CHECK CONSTRAINT [FK_HOR_CURSO]
GO
ALTER TABLE [dbo].[HORARIO]  WITH CHECK ADD  CONSTRAINT [FK_HOR_PROF] FOREIGN KEY([id_profesor])
REFERENCES [dbo].[PROFESOR] ([id_profesor])
GO
ALTER TABLE [dbo].[HORARIO] CHECK CONSTRAINT [FK_HOR_PROF]
GO
ALTER TABLE [dbo].[INSCRIPCION]  WITH CHECK ADD  CONSTRAINT [FK_INS_CUR] FOREIGN KEY([id_curso])
REFERENCES [dbo].[CURSO] ([id_curso])
GO
ALTER TABLE [dbo].[INSCRIPCION] CHECK CONSTRAINT [FK_INS_CUR]
GO
ALTER TABLE [dbo].[INSCRIPCION]  WITH CHECK ADD  CONSTRAINT [FK_INS_EST] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[ESTUDIANTE] ([id_estudiante])
GO
ALTER TABLE [dbo].[INSCRIPCION] CHECK CONSTRAINT [FK_INS_EST]
GO
ALTER TABLE [dbo].[MATERIA]  WITH CHECK ADD  CONSTRAINT [FK_MATERIA_AREA] FOREIGN KEY([id_area])
REFERENCES [dbo].[AREA] ([id_area])
GO
ALTER TABLE [dbo].[MATERIA] CHECK CONSTRAINT [FK_MATERIA_AREA]
GO
ALTER TABLE [dbo].[MATRICULA]  WITH CHECK ADD  CONSTRAINT [FK_MAT_CUR] FOREIGN KEY([id_curso])
REFERENCES [dbo].[CURSO] ([id_curso])
GO
ALTER TABLE [dbo].[MATRICULA] CHECK CONSTRAINT [FK_MAT_CUR]
GO
ALTER TABLE [dbo].[MATRICULA]  WITH CHECK ADD  CONSTRAINT [FK_MAT_EST] FOREIGN KEY([id_estudiante])
REFERENCES [dbo].[ESTUDIANTE] ([id_estudiante])
GO
ALTER TABLE [dbo].[MATRICULA] CHECK CONSTRAINT [FK_MAT_EST]
GO
ALTER TABLE [dbo].[PROFESOR]  WITH CHECK ADD  CONSTRAINT [FK_PROF_DEPTO] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[DEPARTAMENTO] ([id_departamento])
GO
ALTER TABLE [dbo].[PROFESOR] CHECK CONSTRAINT [FK_PROF_DEPTO]
GO
ALTER TABLE [dbo].[PROFESOR_MATERIA]  WITH CHECK ADD  CONSTRAINT [FK_PM_MAT] FOREIGN KEY([id_materia])
REFERENCES [dbo].[MATERIA] ([id_materia])
GO
ALTER TABLE [dbo].[PROFESOR_MATERIA] CHECK CONSTRAINT [FK_PM_MAT]
GO
ALTER TABLE [dbo].[PROFESOR_MATERIA]  WITH CHECK ADD  CONSTRAINT [FK_PM_PROF] FOREIGN KEY([id_profesor])
REFERENCES [dbo].[PROFESOR] ([id_profesor])
GO
ALTER TABLE [dbo].[PROFESOR_MATERIA] CHECK CONSTRAINT [FK_PM_PROF]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD CHECK  (([Nota]>=(0) AND [Nota]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[sp_AccesoDocumento]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 11. sp_AccesoDocumento

-- Valida permiso VER_DOCUMENTOS y retorna URL del archivo

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_AccesoDocumento]

@IdUsuario INT,

@IdDocumento INT

AS

BEGIN

SET NOCOUNT ON;

DECLARE @TienePermiso BIT = 0;

SELECT @TienePermiso = 1

FROM GU_USUARIO_ROL ur

JOIN GU_ROL_PERMISO rp ON rp.id_rol = ur.id_rol

JOIN GU_PERMISO p ON p.id_permiso = rp.id_permiso

WHERE ur.id_usuario = @IdUsuario

AND p.nombre_permiso = 'VER_DOCUMENTOS';

IF @TienePermiso = 0

BEGIN

SELECT 1 AS Codigo, 'Acceso denegado. El usuario no tiene el permiso
VER_DOCUMENTOS.' AS Mensaje,

NULL AS ArchivoUrl;

RETURN;

END

DECLARE @EstadoDoc NVARCHAR(50);

DECLARE @TituloDoc NVARCHAR(200);

DECLARE @Url NVARCHAR(500);

SELECT @EstadoDoc = estado_documento, @TituloDoc = titulo, @Url =
archivo_url

FROM DOCUMENTO WHERE id_documento = @IdDocumento;

IF @TituloDoc IS NULL

BEGIN

SELECT 1 AS Codigo, 'El documento no existe.' AS Mensaje, NULL AS
ArchivoUrl;

RETURN;

END

IF @EstadoDoc <> 'publicado'

BEGIN

SELECT 1 AS Codigo, 'El documento no está publicado.' AS Mensaje,
NULL AS ArchivoUrl;

RETURN;

END

EXEC sp_AuditoriaDocumental @IdUsuario = @IdUsuario, @IdDocumento =
@IdDocumento, @Accion = 'DESCARGA';

SELECT 0 AS Codigo, 'Acceso concedido a "' + @TituloDoc + '".'
AS Mensaje, @Url AS ArchivoUrl;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_AlertaAsistencia]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 2. sp_AlertaAsistencia

-- Detecta estudiantes con asistencia bajo el umbral configurado

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_AlertaAsistencia]

@IdCurso INT,

@PorcentajeMinimo INT = NULL

AS

BEGIN

SET NOCOUNT ON;

IF @PorcentajeMinimo IS NULL

BEGIN

SELECT @PorcentajeMinimo = CAST(valor AS INT)

FROM GU_PARAMETRIZACION

WHERE clave = 'porcentaje_minimo_asistencia' AND activo = 1;

SET @PorcentajeMinimo = ISNULL(@PorcentajeMinimo, 75);

END

SELECT

e.nombre AS estudiante,

ROUND(

100.0 * SUM(CASE WHEN a.estado = 'Presente' THEN 1 ELSE 0
END)

/ NULLIF(COUNT(a.id_asistencia), 0), 2

) AS porcentaje_asistencia,

SUM(CASE WHEN a.estado = 'Ausente' THEN 1 ELSE 0 END) AS
ausencias_sin_justificar,

@PorcentajeMinimo AS umbral_requerido,

'RIESGO ACADÉMICO' AS alerta

FROM MATRICULA m

JOIN ESTUDIANTE e ON e.id_estudiante = m.id_estudiante

LEFT JOIN HORARIO h ON h.id_curso = m.id_curso

LEFT JOIN ASISTENCIA a ON a.id_estudiante = m.id_estudiante AND
a.id_horario = h.id_horario

WHERE m.id_curso = @IdCurso

GROUP BY e.id_estudiante, e.nombre

HAVING ROUND(

100.0 * SUM(CASE WHEN a.estado = 'Presente' THEN 1 ELSE 0
END)

/ NULLIF(COUNT(a.id_asistencia), 0), 2

) < @PorcentajeMinimo

ORDER BY porcentaje_asistencia ASC;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ArchivarPeriodo]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 8. sp_ArchivarPeriodo

-- Archiva masivamente documentos publicados al cerrar un período

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_ArchivarPeriodo]

@IdPeriodo INT,

@IdUsuario INT

AS

BEGIN

SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY

IF NOT EXISTS (SELECT 1 FROM PERIODO WHERE id_periodo =
@IdPeriodo)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El período no existe.' AS Mensaje, 0 AS
Archivados, 0 AS Omitidos;

RETURN;

END

IF NOT EXISTS (SELECT 1 FROM GU_Usuario WHERE ID_Usuario = @IdUsuario
AND ACTIVO = 1)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El usuario no existe o está inactivo.' AS
Mensaje, 0 AS Archivados, 0 AS Omitidos;

RETURN;

END

DECLARE @NombrePeriodo NVARCHAR(100);

SELECT @NombrePeriodo = nombre FROM PERIODO WHERE id_periodo =
@IdPeriodo;

DECLARE @Archivados INT = 0;

DECLARE @Omitidos INT = 0;

SELECT @Omitidos = COUNT(*)

FROM DOCUMENTO d

JOIN CURSO c ON c.id_curso = d.id_curso

WHERE c.id_periodo = @IdPeriodo AND d.estado_documento =
'borrador';

UPDATE DOCUMENTO

SET estado_documento = 'archivado',

fecha_actualizacion = GETDATE()

WHERE id_curso IN (SELECT id_curso FROM CURSO WHERE id_periodo =
@IdPeriodo)

AND estado_documento = 'publicado';

SET @Archivados = @@ROWCOUNT;

COMMIT TRANSACTION;

SELECT 0 AS Codigo,

'Período "' + @NombrePeriodo + '" archivado exitosamente.' AS
Mensaje,

@Archivados AS Archivados,

@Omitidos AS Omitidos;

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION;

SELECT 2 AS Codigo, ERROR_MESSAGE() AS Mensaje, 0 AS Archivados, 0 AS
Omitidos;

END CATCH

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_AsignarNuevoHorario]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- P2. sp_AsignarNuevoHorario

-- Asigna un horario a un curso (aula, profesor, día, hora)

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_AsignarNuevoHorario]

@cur_id INT, @aul_id INT, @prof_id INT, @dia NVARCHAR(30), @ini
TIME, @fin TIME

AS

BEGIN

INSERT INTO dbo.HORARIO (id_curso, id_aula, id_profesor, dia,
hora_inicio, hora_fin)

VALUES (@cur_id, @aul_id, @prof_id, @dia, @ini, @fin);

PRINT 'P2: Horario guardado';

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_AsignarRolUsuario]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 5. sp_AsignarRolUsuario

-- Asigna o revoca roles RBAC con validación de exclusividad

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_AsignarRolUsuario]

@IdUsuario INT,

@IdRol INT,

@Accion CHAR(1) = 'A'

AS

BEGIN

SET NOCOUNT ON;

IF NOT EXISTS (SELECT 1 FROM GU_Usuario WHERE ID_Usuario =
@IdUsuario)

BEGIN

SELECT 'Error' AS Codigo, 'Usuario no encontrado.' AS
Mensaje;

RETURN;

END

DECLARE @NombreRol NVARCHAR(80);

SELECT @NombreRol = nombre_rol FROM GU_ROL WHERE id_rol =
@IdRol;

IF @NombreRol IS NULL

BEGIN

SELECT 'Error' AS Codigo, 'Rol no encontrado.' AS Mensaje;

RETURN;

END

IF @Accion = 'A'

BEGIN

IF EXISTS (SELECT 1 FROM GU_USUARIO_ROL WHERE id_usuario = @IdUsuario
AND id_rol = @IdRol)

BEGIN

SELECT 'Info' AS Codigo, 'El usuario ya tiene asignado ese rol.' AS
Mensaje;

RETURN;

END

IF @NombreRol IN ('Docente', 'Estudiante', 'Acudiente')

BEGIN

DECLARE @RolConflicto NVARCHAR(80);

SELECT TOP 1 @RolConflicto = r.nombre_rol

FROM GU_USUARIO_ROL ur

JOIN GU_ROL r ON r.id_rol = ur.id_rol

WHERE ur.id_usuario = @IdUsuario

AND r.nombre_rol IN ('Docente', 'Estudiante',
'Acudiente')

AND ur.id_rol <> @IdRol;

IF @RolConflicto IS NOT NULL

BEGIN

SELECT 'Error' AS Codigo,

'No se puede asignar el rol ' + @NombreRol +

' porque el usuario ya tiene el rol ' + @RolConflicto +

'. Estos roles son mutuamente excluyentes.' AS Mensaje;

RETURN;

END

END

INSERT INTO GU_USUARIO_ROL (id_usuario, id_rol,
fecha_asignacion)

VALUES (@IdUsuario, @IdRol, GETDATE());

SELECT 'OK' AS Codigo, 'Rol ' + @NombreRol + ' asignado
exitosamente.' AS Mensaje;

END

ELSE IF @Accion = 'R'

BEGIN

IF NOT EXISTS (SELECT 1 FROM GU_USUARIO_ROL WHERE id_usuario =
@IdUsuario AND id_rol = @IdRol)

BEGIN

SELECT 'Info' AS Codigo, 'El usuario no tiene ese rol asignado.' AS
Mensaje;

RETURN;

END

DELETE FROM GU_USUARIO_ROL WHERE id_usuario = @IdUsuario AND id_rol =
@IdRol;

SELECT 'OK' AS Codigo, 'Rol ' + @NombreRol + ' revocado
exitosamente.' AS Mensaje;

END

ELSE

BEGIN

SELECT 'Error' AS Codigo,

'Acción no válida. Use ''A'' para asignar o ''R'' para
revocar.' AS Mensaje;

END

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_AuditoriaDocumental]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ============================================================

-- GRUPO 3 --- USUARIOS + DOCUMENTAL

--
-- ============================================================

--
-- ------------------------------------------------------------

-- 9. sp_AuditoriaDocumental

-- Registra y retorna eventos de auditoría sobre documentos

-- (debe crearse ANTES de sp_SubirDocConPermiso y sp_AccesoDocumento)

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_AuditoriaDocumental]

@IdUsuario INT,

@IdDocumento INT,

@Accion NVARCHAR(50)

AS

BEGIN

SET NOCOUNT ON;

DECLARE @TituloDoc NVARCHAR(200);

SELECT @TituloDoc = titulo FROM DOCUMENTO WHERE id_documento =
@IdDocumento;

DECLARE @NombreUsuario NVARCHAR(200);

SELECT @NombreUsuario = NOMBRES + ' ' + APELLIDOS FROM GU_Usuario
WHERE ID_Usuario = @IdUsuario;

SELECT

@Accion AS accion,

@TituloDoc AS documento,

@NombreUsuario AS usuario,

GETDATE() AS fecha_hora;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_AuditoriaSistema]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 14. sp_AuditoriaSistema

-- Log consolidado de eventos de los 3 módulos en un rango de fechas

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_AuditoriaSistema]

@FechaDesde DATE = NULL,

@FechaHasta DATE = NULL,

@TipoEvento NVARCHAR(50) = NULL

AS

BEGIN

SET NOCOUNT ON;

SET @FechaDesde = ISNULL(@FechaDesde, CAST(DATEADD(DAY, -30,
GETDATE()) AS DATE));

SET @FechaHasta = ISNULL(@FechaHasta, CAST(GETDATE() AS
DATE));

SELECT tipo_evento, descripcion, usuario, detalle, fecha_hora

FROM (

-- Eventos de contraseña (módulo Usuarios)

SELECT

'PASSWORD' AS tipo_evento,

'Cambio de contraseña' AS descripcion,

u.NOMBRES + ' ' + u.APELLIDOS AS usuario,

'Contraseña actualizada' AS detalle,

hp.fecha_cambio AS fecha_hora

FROM GU_HISTORIAL_PASSWORD hp

JOIN GU_Usuario u ON u.ID_Usuario = hp.id_usuario

WHERE (@TipoEvento IS NULL OR @TipoEvento = 'PASSWORD')

AND CAST(hp.fecha_cambio AS DATE) BETWEEN @FechaDesde AND
@FechaHasta

UNION ALL

-- Eventos de documentos (módulo Documental)

SELECT

'DOCUMENTO' AS tipo_evento,

'Actualización de documento' AS descripcion,

u.NOMBRES + ' ' + u.APELLIDOS AS usuario,

d.titulo AS detalle,

d.fecha_actualizacion AS fecha_hora

FROM DOCUMENTO d

JOIN GU_Usuario u ON u.ID_Usuario = d.id_usuario_autor

WHERE d.fecha_actualizacion IS NOT NULL

AND (@TipoEvento IS NULL OR @TipoEvento = 'DOCUMENTO')

AND CAST(d.fecha_actualizacion AS DATE) BETWEEN @FechaDesde AND
@FechaHasta

UNION ALL

-- Eventos de matrícula (módulo Académico)

SELECT

'MATRICULA' AS tipo_evento,

'Nueva matrícula registrada' AS descripcion,

e.nombre AS usuario,

c.nombre_curso AS detalle,

m.fecha_matricula AS fecha_hora

FROM MATRICULA m

JOIN ESTUDIANTE e ON e.id_estudiante = m.id_estudiante

JOIN CURSO c ON c.id_curso = m.id_curso

WHERE (@TipoEvento IS NULL OR @TipoEvento = 'MATRICULA')

AND CAST(m.fecha_matricula AS DATE) BETWEEN @FechaDesde AND
@FechaHasta

) AS auditoria

ORDER BY fecha_hora DESC;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_BloquearUsuario]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 2. sp_BloquearUsuario

-- Bloquea o desbloquea manualmente una cuenta de usuario

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_BloquearUsuario]

@IdUsuario INT,

@Bloquear BIT,

@MinutosExtra INT = NULL

AS

BEGIN

SET NOCOUNT ON;

IF NOT EXISTS (SELECT 1 FROM GU_Usuario WHERE ID_Usuario =
@IdUsuario)

BEGIN

SELECT 'Error' AS Codigo, 'Usuario no encontrado.' AS
Mensaje;

RETURN;

END

IF @Bloquear = 1

BEGIN

DECLARE @HastaFecha DATETIME =

CASE

WHEN @MinutosExtra IS NOT NULL THEN DATEADD(MINUTE, @MinutosExtra,
GETDATE())

ELSE '9999-12-31 23:59:59'

END;

INSERT INTO GU_INTENTOS_LOGIN (id_usuario, fecha_intento, exitoso,
ip_origen, bloqueado_hasta)

VALUES (@IdUsuario, GETDATE(), 0, 'ADMIN-MANUAL',
@HastaFecha);

SELECT 'OK' AS Codigo,

'Usuario bloqueado hasta ' + CONVERT(VARCHAR, @HastaFecha, 120) +
'.' AS Mensaje;

END

ELSE

BEGIN

UPDATE GU_INTENTOS_LOGIN

SET bloqueado_hasta = DATEADD(SECOND, -1, GETDATE())

WHERE id_usuario = @IdUsuario

AND bloqueado_hasta > GETDATE();

SELECT 'OK' AS Codigo, 'Usuario desbloqueado exitosamente.' AS
Mensaje;

END

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_BoletinEstudiante]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ============================================================

-- MÓDULO 4: PROCEDIMIENTOS TRANSVERSALES

-- 14 procedimientos que cruzan los 3 módulos del sistema

--
-- ============================================================

--
-- ============================================================

-- GRUPO 1 --- ACADÉMICO + USUARIOS

--
-- ============================================================

--
-- ------------------------------------------------------------

-- 1. sp_BoletinEstudiante

-- Boletín completo de un estudiante en un período académico

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_BoletinEstudiante]

@IdEstudiante INT,

@IdPeriodo INT

AS

BEGIN

SET NOCOUNT ON;

-- SET 1: Resumen general del estudiante en el período

SELECT

e.nombre AS estudiante,

p.nombre AS periodo,

ROUND(AVG(ev.nota), 2) AS promedio_general,

ROUND(

100.0 * SUM(CASE WHEN a.estado = 'Presente' THEN 1 ELSE 0
END)

/ NULLIF(COUNT(a.id_asistencia), 0), 2

) AS porcentaje_asistencia,

SUM(CASE WHEN a.estado = 'Ausente' THEN 1 ELSE 0 END) AS
total_ausencias,

COUNT(DISTINCT m.id_matricula) AS materias_cursadas

FROM ESTUDIANTE e

JOIN MATRICULA m ON m.id_estudiante = e.id_estudiante

JOIN PERIODO p ON p.id_periodo = @IdPeriodo

LEFT JOIN EVALUACION ev ON ev.id_estudiante = e.id_estudiante

LEFT JOIN ASISTENCIA a ON a.id_estudiante = e.id_estudiante

WHERE e.id_estudiante = @IdEstudiante

GROUP BY e.nombre, p.nombre;

-- SET 2: Detalle de notas por materia

SELECT

mat.nombre_materia,

ev.tipo_evaluacion,

ev.nota,

ev.fecha_evaluacion,

ROUND(AVG(ev.nota) OVER (PARTITION BY ev.id_materia), 2) AS
promedio_materia,

CASE WHEN AVG(ev.nota) OVER (PARTITION BY ev.id_materia) >=
3.0

THEN 'Aprobado' ELSE 'Reprobado' END AS estado_materia

FROM EVALUACION ev

JOIN MATERIA mat ON mat.id_materia = ev.id_materia

WHERE ev.id_estudiante = @IdEstudiante

ORDER BY mat.nombre_materia, ev.fecha_evaluacion;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_BorrarInscripcion]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- P7. sp_BorrarInscripcion

-- Elimina un registro de inscripción por su identificador

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_BorrarInscripcion]

@id_ins INT

AS

BEGIN

DELETE FROM dbo.INSCRIPCION WHERE id_inscripcion = @id_ins;

PRINT 'P7: Registro eliminado';

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_BuscarDocumentos]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 3. sp_BuscarDocumentos

-- Busca documentos por etiqueta, curso, materia, tipo y/o estado

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_BuscarDocumentos]

@Etiqueta NVARCHAR(80) = NULL,

@IdCurso INT = NULL,

@IdMateria INT = NULL,

@TipoDocumento NVARCHAR(80) = NULL,

@EstadoDoc NVARCHAR(50) = NULL

AS

BEGIN

SET NOCOUNT ON;

IF @Etiqueta IS NULL AND @IdCurso IS NULL AND @IdMateria IS
NULL

AND @TipoDocumento IS NULL AND @EstadoDoc IS NULL

BEGIN

SELECT 1 AS Codigo, 'Debe proporcionar al menos un criterio de
búsqueda.' AS Mensaje;

RETURN;

END

SELECT

d.id_documento,

d.titulo,

d.tipo_documento,

d.estado_documento,

d.version,

d.fecha_subida,

d.fecha_actualizacion,

d.nombre_archivo,

d.tipo_mime,

d.tamano_archivo,

d.archivo_url,

u.NOMBRES + ' ' + u.APELLIDOS AS autor,

c.nombre_curso AS curso,

m.nombre_materia AS materia,

STUFF((

SELECT ', ' + de2.atiqueta

FROM DOCUMENTO_ETIQUETA de2

WHERE de2.id_documento = d.id_documento

FOR XML PATH(''), TYPE

).value('.','NVARCHAR(MAX)'), 1, 2, '') AS etiquetas

FROM DOCUMENTO d

JOIN GU_Usuario u ON u.ID_Usuario = d.id_usuario_autor

LEFT JOIN CURSO c ON c.id_curso = d.id_curso

LEFT JOIN MATERIA m ON m.id_materia = d.id_materia

WHERE (

@Etiqueta IS NULL

OR EXISTS (

SELECT 1 FROM DOCUMENTO_ETIQUETA de

WHERE de.id_documento = d.id_documento

AND de.atiqueta = @Etiqueta

)

)

AND (@IdCurso IS NULL OR d.id_curso = @IdCurso)

AND (@IdMateria IS NULL OR d.id_materia = @IdMateria)

AND (@TipoDocumento IS NULL OR d.tipo_documento =
@TipoDocumento)

AND (@EstadoDoc IS NULL OR d.estado_documento = @EstadoDoc)

ORDER BY d.fecha_subida DESC;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_CambiarEstadoDoc]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 4. sp_CambiarEstadoDoc

-- Controla el flujo de estados: borrador → publicado → archivado

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_CambiarEstadoDoc]

@IdDocumento INT,

@NuevoEstado NVARCHAR(50),

@IdUsuario INT

AS

BEGIN

SET NOCOUNT ON;

DECLARE @EstadoActual NVARCHAR(50);

DECLARE @TituloDoc NVARCHAR(200);

SELECT @EstadoActual = estado_documento,

@TituloDoc = titulo

FROM DOCUMENTO

WHERE id_documento = @IdDocumento;

IF @EstadoActual IS NULL

BEGIN

SELECT 1 AS Codigo, 'El documento no existe.' AS Mensaje;

RETURN;

END

IF NOT EXISTS (SELECT 1 FROM GU_Usuario WHERE ID_Usuario = @IdUsuario
AND ACTIVO = 1)

BEGIN

SELECT 1 AS Codigo, 'El usuario no existe o está inactivo.' AS
Mensaje;

RETURN;

END

IF @NuevoEstado NOT IN ('borrador', 'publicado',
'archivado')

BEGIN

SELECT 1 AS Codigo,

'Estado inválido. Valores permitidos: borrador, publicado,
archivado.' AS Mensaje;

RETURN;

END

IF @EstadoActual = @NuevoEstado

BEGIN

SELECT 1 AS Codigo,

'El documento ya se encuentra en estado ' + @NuevoEstado + '.' AS
Mensaje;

RETURN;

END

IF @EstadoActual = 'archivado'

BEGIN

SELECT 1 AS Codigo,

'Un documento archivado no puede cambiar de estado. Es un estado
final.' AS Mensaje;

RETURN;

END

IF @EstadoActual = 'borrador' AND @NuevoEstado =
'archivado'

BEGIN

SELECT 1 AS Codigo, 'Un borrador debe publicarse antes de poder
archivarse.' AS Mensaje;

RETURN;

END

IF @EstadoActual = 'publicado' AND @NuevoEstado =
'borrador'

BEGIN

SELECT 1 AS Codigo, 'Un documento publicado no puede regresar a estado
borrador.' AS Mensaje;

RETURN;

END

UPDATE DOCUMENTO

SET estado_documento = @NuevoEstado,

fecha_actualizacion = GETDATE()

WHERE id_documento = @IdDocumento;

SELECT 0 AS Codigo,

'Documento "' + @TituloDoc + '" cambiado de ' + @EstadoActual
+

' a ' + @NuevoEstado + ' exitosamente.' AS Mensaje;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_CambiarPassword]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 4. sp_CambiarPassword

-- Cambia contraseña validando historial y token de recuperación

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_CambiarPassword]

@IdUsuario INT,

@NuevoHash NVARCHAR(256),

@Token NVARCHAR(256) = NULL

AS

BEGIN

SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY

IF @Token IS NOT NULL

BEGIN

DECLARE @TokenValido BIT = 0;

SELECT @TokenValido = 1

FROM GU_RECUPERACION_PASSWORD

WHERE id_usuario = @IdUsuario

AND token = @Token

AND usado = 0

AND fecha_expiracion > GETDATE();

IF @TokenValido = 0

BEGIN

ROLLBACK TRANSACTION;

SELECT 'Error' AS Codigo, 'Token inválido o expirado.' AS
Mensaje;

RETURN;

END

UPDATE GU_RECUPERACION_PASSWORD

SET usado = 1, fecha_uso = GETDATE()

WHERE id_usuario = @IdUsuario AND token = @Token;

END

IF EXISTS (

SELECT 1 FROM GU_HISTORIAL_PASSWORD

WHERE id_usuario = @IdUsuario AND contrasena_hash =
@NuevoHash

)

BEGIN

ROLLBACK TRANSACTION;

SELECT 'Error' AS Codigo, 'La contraseña ya fue utilizada
anteriormente.' AS Mensaje;

RETURN;

END

INSERT INTO GU_HISTORIAL_PASSWORD (id_usuario, contrasena_hash,
fecha_cambio)

SELECT ID_Usuario, CONTRASEÑA, GETDATE()

FROM GU_Usuario

WHERE ID_Usuario = @IdUsuario;

UPDATE GU_Usuario

SET CONTRASEÑA = @NuevoHash

WHERE ID_Usuario = @IdUsuario;

COMMIT TRANSACTION;

SELECT 'OK' AS Codigo, 'Contraseña actualizada exitosamente.' AS
Mensaje;

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION;

SELECT 'Error' AS Codigo, ERROR_MESSAGE() AS Mensaje;

END CATCH

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_CheckAsistencia]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- P4. sp_CheckAsistencia

-- Registra la asistencia de un estudiante en un horario

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_CheckAsistencia]

@est_id INT, @hor_id INT, @prof_id INT, @estado
NVARCHAR(20)

AS

BEGIN

INSERT INTO dbo.ASISTENCIA (id_estudiante, id_horario, id_profesor,
fecha, estado)

VALUES (@est_id, @hor_id, @prof_id, GETDATE(), @estado);

PRINT 'P4: Asistencia guardada';

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarClasesProfe]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- P5. sp_ConsultarClasesProfe

-- Consulta los horarios asignados a un profesor específico

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_ConsultarClasesProfe]

@prof_id INT

AS

BEGIN

SELECT dia, hora_inicio, hora_fin, id_curso, id_aula

FROM dbo.HORARIO WHERE id_profesor = @prof_id;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DashboardEstudiante]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ============================================================

-- GRUPO 4 --- LOS 3 MÓDULOS JUNTOS

--
-- ============================================================

--
-- ------------------------------------------------------------

-- 12. sp_DashboardEstudiante

-- Vista principal del estudiante: cursos, evaluaciones y materiales

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_DashboardEstudiante]

@IdUsuario INT

AS

BEGIN

SET NOCOUNT ON;

DECLARE @IdEstudiante INT;

SELECT @IdEstudiante = e.id_estudiante

FROM ESTUDIANTE e

JOIN GU_Usuario u ON u.CORREO_ELECTRONICO = e.email

WHERE u.ID_Usuario = @IdUsuario;

-- SET 1: Cursos activos con promedio y asistencia

SELECT

c.nombre_curso,

p.nombre AS periodo,

ROUND(AVG(ev.nota), 2) AS promedio_curso,

ROUND(

100.0 * SUM(CASE WHEN a.estado = 'Presente' THEN 1 ELSE 0
END)

/ NULLIF(COUNT(a.id_asistencia), 0), 2

) AS porcentaje_asistencia

FROM MATRICULA m

JOIN CURSO c ON c.id_curso = m.id_curso

JOIN PERIODO p ON p.id_periodo = c.id_periodo

LEFT JOIN EVALUACION ev ON ev.id_estudiante = m.id_estudiante AND
ev.id_curso = m.id_curso

LEFT JOIN HORARIO h ON h.id_curso = m.id_curso

LEFT JOIN ASISTENCIA a ON a.id_estudiante = m.id_estudiante AND
a.id_horario = h.id_horario

WHERE m.id_estudiante = @IdEstudiante AND m.estado =
'Activa'

GROUP BY c.id_curso, c.nombre_curso, p.nombre;

-- SET 2: Últimas 5 evaluaciones

SELECT TOP 5

mat.nombre_materia,

ev.tipo_evaluacion,

ev.nota,

ev.fecha_evaluacion,

CASE WHEN ev.nota >= 3.0 THEN 'Aprobado' ELSE 'Reprobado' END AS
estado,

pr.nombre AS calificador

FROM EVALUACION ev

JOIN MATERIA mat ON mat.id_materia = ev.id_materia

JOIN PROFESOR pr ON pr.id_profesor = ev.id_calificador

WHERE ev.id_estudiante = @IdEstudiante

ORDER BY ev.fecha_evaluacion DESC;

-- SET 3: Materiales publicados de los cursos activos

SELECT

d.titulo,

d.tipo_documento AS tipo,

d.archivo_url,

mat.nombre_materia,

c.nombre_curso

FROM DOCUMENTO d

JOIN MATRICULA m ON m.id_curso = d.id_curso AND m.id_estudiante =
@IdEstudiante AND m.estado = 'Activa'

JOIN CURSO c ON c.id_curso = d.id_curso

LEFT JOIN MATERIA mat ON mat.id_materia = d.id_materia

WHERE d.estado_documento = 'publicado'

ORDER BY d.fecha_subida DESC;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DashboardProfesor]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 13. sp_DashboardProfesor

-- Vista principal del profesor: cursos, alertas y documentos

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_DashboardProfesor]

@IdUsuario INT

AS

BEGIN

SET NOCOUNT ON;

DECLARE @IdProfesor INT;

SELECT @IdProfesor = pr.id_profesor

FROM PROFESOR pr

JOIN GU_Usuario u ON u.CORREO_ELECTRONICO = pr.email

WHERE u.ID_Usuario = @IdUsuario;

DECLARE @UmbralAsistencia INT;

SELECT @UmbralAsistencia = CAST(valor AS INT)

FROM GU_PARAMETRIZACION

WHERE clave = 'porcentaje_minimo_asistencia' AND activo = 1;

SET @UmbralAsistencia = ISNULL(@UmbralAsistencia, 75);

-- SET 1: Cursos activos del profesor

SELECT

c.nombre_curso,

p.nombre AS periodo,

COUNT(DISTINCT m.id_estudiante) AS total_estudiantes,

ROUND(AVG(ev.nota), 2) AS promedio_grupal,

COUNT(DISTINCT h.id_horario) AS sesiones_programadas

FROM HORARIO h

JOIN CURSO c ON c.id_curso = h.id_curso

JOIN PERIODO p ON p.id_periodo = c.id_periodo

LEFT JOIN MATRICULA m ON m.id_curso = c.id_curso AND m.estado =
'Activa'

LEFT JOIN EVALUACION ev ON ev.id_curso = c.id_curso AND
ev.id_calificador = @IdProfesor

WHERE h.id_profesor = @IdProfesor

GROUP BY c.id_curso, c.nombre_curso, p.nombre;

-- SET 2: Alertas de asistencia

SELECT

e.nombre AS estudiante,

c.nombre_curso,

ROUND(

100.0 * SUM(CASE WHEN a.estado = 'Presente' THEN 1 ELSE 0
END)

/ NULLIF(COUNT(a.id_asistencia), 0), 2

) AS porcentaje_asistencia,

@UmbralAsistencia AS umbral_aplicado

FROM HORARIO h

JOIN CURSO c ON c.id_curso = h.id_curso

JOIN MATRICULA m ON m.id_curso = c.id_curso AND m.estado =
'Activa'

JOIN ESTUDIANTE e ON e.id_estudiante = m.id_estudiante

LEFT JOIN ASISTENCIA a ON a.id_estudiante = m.id_estudiante AND
a.id_horario = h.id_horario

WHERE h.id_profesor = @IdProfesor

GROUP BY e.id_estudiante, e.nombre, c.nombre_curso

HAVING ROUND(

100.0 * SUM(CASE WHEN a.estado = 'Presente' THEN 1 ELSE 0
END)

/ NULLIF(COUNT(a.id_asistencia), 0), 2

) < @UmbralAsistencia;

-- SET 3: Documentos subidos por el profesor

SELECT

d.titulo,

d.tipo_documento AS tipo,

d.estado_documento AS estado,

d.version,

c.nombre_curso,

mat.nombre_materia

FROM DOCUMENTO d

LEFT JOIN CURSO c ON c.id_curso = d.id_curso

LEFT JOIN MATERIA mat ON mat.id_materia = d.id_materia

WHERE d.id_usuario_autor = @IdUsuario

ORDER BY d.fecha_subida DESC;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EntregaTarea]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ============================================================

-- GRUPO 2 --- ACADÉMICO + DOCUMENTAL

--
-- ============================================================

--
-- ------------------------------------------------------------

-- 6. sp_EntregaTarea

-- Vincula un documento como entrega de evaluación de un estudiante

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_EntregaTarea]

@IdDocumento INT,

@IdEstudiante INT,

@IdMateria INT,

@IdCurso INT,

@IdCalificador INT

AS

BEGIN

SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY

-- Validar matrícula activa

IF NOT EXISTS (

SELECT 1 FROM MATRICULA

WHERE id_estudiante = @IdEstudiante AND id_curso = @IdCurso AND
estado = 'Activa'

)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El estudiante no tiene matrícula activa en este
curso.' AS Mensaje, NULL AS IdEvaluacion;

RETURN;

END

-- Validar tipo de documento

DECLARE @TipoDoc NVARCHAR(80);

SELECT @TipoDoc = tipo_documento FROM DOCUMENTO WHERE id_documento =
@IdDocumento;

IF @TipoDoc NOT IN ('tarea', 'proyecto')

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El documento debe ser de tipo tarea o proyecto.'
AS Mensaje, NULL AS IdEvaluacion;

RETURN;

END

-- Publicar documento si está en borrador

UPDATE DOCUMENTO

SET estado_documento = 'publicado', fecha_actualizacion =
GETDATE()

WHERE id_documento = @IdDocumento AND estado_documento =
'borrador';

-- Crear registro de evaluación pendiente (nota 0)

INSERT INTO dbo.EVALUACION (id_estudiante, id_curso, id_materia,
tipo_evaluacion, nota, id_calificador, fecha_evaluacion)

VALUES (@IdEstudiante, @IdCurso, @IdMateria, 'Tarea', 0,
@IdCalificador, GETDATE());

DECLARE @IdEval INT = SCOPE_IDENTITY();

COMMIT TRANSACTION;

SELECT 0 AS Codigo, 'Entrega registrada. Pendiente de calificación.'
AS Mensaje, @IdEval AS IdEvaluacion;

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION;

SELECT 2 AS Codigo, ERROR_MESSAGE() AS Mensaje, NULL AS
IdEvaluacion;

END CATCH

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_EstadisticasCurso]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 3. sp_EstadisticasCurso

-- Promedio, aprobación y ranking de un curso

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_EstadisticasCurso]

@IdCurso INT

AS

BEGIN

SET NOCOUNT ON;

-- SET 1: Estadísticas generales del curso

SELECT

c.nombre_curso,

ROUND(AVG(ev.nota), 2) AS promedio_general,

MAX(ev.nota) AS nota_maxima,

MIN(ev.nota) AS nota_minima,

ROUND(

100.0 * SUM(CASE WHEN ev.nota >= 3.0 THEN 1 ELSE 0 END)

/ NULLIF(COUNT(ev.id_evaluacion), 0), 2

) AS tasa_aprobacion_pct,

SUM(CASE WHEN ev.nota >= 4.5 THEN 1 ELSE 0 END) AS excelente,

SUM(CASE WHEN ev.nota >= 3.5 AND ev.nota < 4.5 THEN 1 ELSE 0 END) AS
bueno,

SUM(CASE WHEN ev.nota >= 3.0 AND ev.nota < 3.5 THEN 1 ELSE 0 END) AS
aprobado,

SUM(CASE WHEN ev.nota < 3.0 THEN 1 ELSE 0 END) AS reprobado

FROM EVALUACION ev

JOIN CURSO c ON c.id_curso = @IdCurso

WHERE ev.id_curso = @IdCurso

GROUP BY c.nombre_curso;

-- SET 2: Ranking de estudiantes

SELECT

ROW_NUMBER() OVER (ORDER BY AVG(ev.nota) DESC) AS posicion,

e.nombre AS estudiante,

ROUND(AVG(ev.nota), 2) AS promedio,

COUNT(ev.id_evaluacion) AS evaluaciones_realizadas,

CASE WHEN AVG(ev.nota) >= 3.0 THEN 'Aprobado' ELSE 'Reprobado' END
AS estado

FROM EVALUACION ev

JOIN ESTUDIANTE e ON e.id_estudiante = ev.id_estudiante

WHERE ev.id_curso = @IdCurso

GROUP BY e.id_estudiante, e.nombre

ORDER BY promedio DESC;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_InscribirMatricular]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ============================================================

-- MÓDULO 1: PAE --- PROCEDIMIENTOS ACADÉMICOS BÁSICOS

-- Procedimientos: 7

--
-- ============================================================

--
-- ------------------------------------------------------------

-- P1. sp_InscribirMatricular

-- Registra inscripción y matrícula de un estudiante en un curso

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_InscribirMatricular]

@est_id INT, @cur_id INT, @anio INT, @periodo NVARCHAR(40)

AS

BEGIN

BEGIN TRY

BEGIN TRANSACTION;

INSERT INTO dbo.INSCRIPCION (id_estudiante, id_curso, anio,
fecha_inscripcion)

VALUES (@est_id, @cur_id, @anio, GETDATE());

INSERT INTO dbo.MATRICULA (id_estudiante, id_curso, fecha_matricula,
periodo_academico, estado, anio)

VALUES (@est_id, @cur_id, GETDATE(), @periodo, 'Activa',
@anio);

COMMIT TRANSACTION;

PRINT 'P1: Matrícula exitosa';

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;

PRINT 'Error P1: ' + ERROR_MESSAGE();

END CATCH

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_InscripcionCompleta]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 5. sp_InscripcionCompleta

-- Inscribe al estudiante y crea su usuario en una sola transacción

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_InscripcionCompleta]

@IdEstudiante INT,

@IdCurso INT,

@Anio INT,

@PasswordHash NVARCHAR(256) = NULL

AS

BEGIN

SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY

DECLARE @IdUsuario INT;

DECLARE @UsuarioCreado BIT = 0;

IF NOT EXISTS (SELECT 1 FROM ESTUDIANTE WHERE id_estudiante =
@IdEstudiante)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El estudiante no existe.' AS Mensaje, NULL AS
IdUsuario, 0 AS UsuarioCreado;

RETURN;

END

IF NOT EXISTS (SELECT 1 FROM CURSO WHERE id_curso = @IdCurso)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El curso no existe.' AS Mensaje, NULL AS
IdUsuario, 0 AS UsuarioCreado;

RETURN;

END

IF EXISTS (

SELECT 1 FROM INSCRIPCION

WHERE id_estudiante = @IdEstudiante AND id_curso = @IdCurso AND anio
= @Anio

)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El estudiante ya está inscrito en este curso para
el año indicado.' AS Mensaje,

NULL AS IdUsuario, 0 AS UsuarioCreado;

RETURN;

END

-- Crear usuario si se proporcionó hash y no tiene uno

IF @PasswordHash IS NOT NULL

BEGIN

DECLARE @Correo NVARCHAR(150);

SELECT @Correo = email FROM ESTUDIANTE WHERE id_estudiante =
@IdEstudiante;

SELECT @IdUsuario = ID_Usuario FROM GU_Usuario WHERE
CORREO_ELECTRONICO = @Correo;

IF @IdUsuario IS NULL

BEGIN

DECLARE @NombreUsuario NVARCHAR(50);

DECLARE @Nombres NVARCHAR(100), @Apellidos NVARCHAR(100);

SELECT @Nombres = nombre FROM ESTUDIANTE WHERE id_estudiante =
@IdEstudiante;

SET @NombreUsuario = 'est.' + LOWER(LEFT(REPLACE(@Nombres, ' ',
''), 12));

INSERT INTO GU_Usuario (NOMBRE_USUARIO, CONTRASEÑA, CORREO_ELECTRONICO,
ACTIVO)

VALUES (@NombreUsuario, @PasswordHash, @Correo, 1);

SET @IdUsuario = SCOPE_IDENTITY();

SET @UsuarioCreado = 1;

DECLARE @IdRolEstudiante INT;

SELECT @IdRolEstudiante = id_rol FROM GU_ROL WHERE nombre_rol =
'Estudiante';

INSERT INTO GU_USUARIO_ROL (id_usuario, id_rol,
fecha_asignacion)

VALUES (@IdUsuario, @IdRolEstudiante, GETDATE());

END

END

-- Registrar inscripción y matrícula

INSERT INTO dbo.INSCRIPCION (id_estudiante, id_curso, anio,
fecha_inscripcion)

VALUES (@IdEstudiante, @IdCurso, @Anio, GETDATE());

INSERT INTO dbo.MATRICULA (id_estudiante, id_curso, fecha_matricula,
periodo_academico, estado, anio)

VALUES (@IdEstudiante, @IdCurso, GETDATE(), CAST(@Anio AS NVARCHAR) +
'-I', 'Activa', @Anio);

COMMIT TRANSACTION;

SELECT 0 AS Codigo, 'Inscripción completada exitosamente.' AS
Mensaje,

@IdUsuario AS IdUsuario, @UsuarioCreado AS UsuarioCreado;

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION;

SELECT 2 AS Codigo, ERROR_MESSAGE() AS Mensaje, NULL AS IdUsuario, 0 AS
UsuarioCreado;

END CATCH

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUsuario]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ============================================================

-- MÓDULO 2: GESTIÓN DE USUARIOS / SEGURIDAD

-- Versión: 2.0

-- Procedimientos: 6

--
-- ============================================================

--
-- ------------------------------------------------------------

-- 1. sp_LoginUsuario

-- Valida credenciales y aplica bloqueo automático por intentos fallidos

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_LoginUsuario]

@NombreUsuario NVARCHAR(50),

@PasswordHash NVARCHAR(256),

@IpOrigen NVARCHAR(45) = NULL

AS

BEGIN

SET NOCOUNT ON;

DECLARE @IdUsuario INT;

DECLARE @Activo BIT;

DECLARE @HashAlmacenado NVARCHAR(256);

DECLARE @BloqueadoHasta DATETIME;

DECLARE @MaxIntentos INT;

DECLARE @MinutosBloqueo INT;

DECLARE @IntentosRecientes INT;

DECLARE @UltimoExitoso DATETIME;

SELECT @MaxIntentos = CAST(valor AS INT)

FROM GU_PARAMETRIZACION

WHERE clave = 'max_intentos_login' AND activo = 1;

SELECT @MinutosBloqueo = CAST(valor AS INT)

FROM GU_PARAMETRIZACION

WHERE clave = 'minutos_bloqueo' AND activo = 1;

SET @MaxIntentos = ISNULL(@MaxIntentos, 5);

SET @MinutosBloqueo = ISNULL(@MinutosBloqueo, 30);

SELECT

@IdUsuario = ID_Usuario,

@Activo = ACTIVO,

@HashAlmacenado = CONTRASEÑA

FROM GU_Usuario

WHERE NOMBRE_USUARIO = @NombreUsuario;

IF @IdUsuario IS NULL

BEGIN

SELECT 2 AS Codigo, 'Usuario o contraseña incorrectos.' AS Mensaje,
NULL AS IdUsuario;

RETURN;

END

SELECT TOP 1 @BloqueadoHasta = bloqueado_hasta

FROM GU_INTENTOS_LOGIN

WHERE id_usuario = @IdUsuario

AND bloqueado_hasta IS NOT NULL

AND bloqueado_hasta > GETDATE()

ORDER BY fecha_intento DESC;

IF @BloqueadoHasta IS NOT NULL

BEGIN

SELECT 1 AS Codigo,

'Cuenta bloqueada hasta ' + CONVERT(VARCHAR, @BloqueadoHasta, 120) +
'.' AS Mensaje,

NULL AS IdUsuario;

RETURN;

END

IF @HashAlmacenado = @PasswordHash AND @Activo = 1

BEGIN

INSERT INTO GU_INTENTOS_LOGIN (id_usuario, fecha_intento, exitoso,
ip_origen, bloqueado_hasta)

VALUES (@IdUsuario, GETDATE(), 1, @IpOrigen, NULL);

SELECT 0 AS Codigo, 'Acceso concedido.' AS Mensaje, @IdUsuario AS
IdUsuario;

END

ELSE

BEGIN

SELECT @UltimoExitoso = MAX(fecha_intento)

FROM GU_INTENTOS_LOGIN

WHERE id_usuario = @IdUsuario AND exitoso = 1;

SELECT @IntentosRecientes = COUNT(*)

FROM GU_INTENTOS_LOGIN

WHERE id_usuario = @IdUsuario

AND exitoso = 0

AND fecha_intento >= ISNULL(@UltimoExitoso, '1900-01-01')

AND fecha_intento >= DATEADD(MINUTE, -@MinutosBloqueo,
GETDATE());

DECLARE @NuevoBloqueHasta DATETIME = NULL;

IF (@IntentosRecientes + 1) >= @MaxIntentos

SET @NuevoBloqueHasta = DATEADD(MINUTE, @MinutosBloqueo,
GETDATE());

INSERT INTO GU_INTENTOS_LOGIN (id_usuario, fecha_intento, exitoso,
ip_origen, bloqueado_hasta)

VALUES (@IdUsuario, GETDATE(), 0, @IpOrigen,
@NuevoBloqueHasta);

IF @NuevoBloqueHasta IS NOT NULL

SELECT 1 AS Codigo,

'Cuenta bloqueada por ' + CAST(@MinutosBloqueo AS VARCHAR) + '
minutos.' AS Mensaje,

NULL AS IdUsuario;

ELSE

SELECT 2 AS Codigo, 'Usuario o contraseña incorrectos.' AS Mensaje,
NULL AS IdUsuario;

END

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_MaterialesCurso]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 7. sp_MaterialesCurso

-- Lista materiales publicados de un curso con filtros opcionales

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_MaterialesCurso]

@IdCurso INT,

@TipoDoc NVARCHAR(80) = NULL,

@IdMateria INT = NULL

AS

BEGIN

SET NOCOUNT ON;

SELECT

d.id_documento,

d.titulo,

d.tipo_documento,

d.version,

d.fecha_subida,

d.nombre_archivo,

d.tipo_mime,

d.tamano_archivo,

d.archivo_url,

u.NOMBRES + ' ' + u.APELLIDOS AS autor,

m.nombre_materia AS materia,

STUFF((

SELECT ', ' + de2.atiqueta

FROM DOCUMENTO_ETIQUETA de2

WHERE de2.id_documento = d.id_documento

FOR XML PATH(''), TYPE

).value('.','NVARCHAR(MAX)'), 1, 2, '') AS etiquetas

FROM DOCUMENTO d

JOIN GU_Usuario u ON u.ID_Usuario = d.id_usuario_autor

LEFT JOIN MATERIA m ON m.id_materia = d.id_materia

WHERE d.id_curso = @IdCurso

AND d.estado_documento = 'publicado'

AND (@TipoDoc IS NULL OR d.tipo_documento = @TipoDoc)

AND (@IdMateria IS NULL OR d.id_materia = @IdMateria)

ORDER BY d.fecha_subida DESC;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEstudiante]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- P6. sp_ModificarEstudiante

-- Actualiza el nombre de un estudiante en la base de datos

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_ModificarEstudiante]

@id INT, @nombre NVARCHAR(100)

AS

BEGIN

UPDATE dbo.ESTUDIANTE SET nombre = @nombre WHERE id_estudiante =
@id;

PRINT 'P6: Alumno actualizado';

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_NuevaVersionDoc]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 2. sp_NuevaVersionDoc

-- Crea una nueva versión de un documento existente con historial

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_NuevaVersionDoc]

@IdDocumento INT,

@IdUsuario INT,

@NombreArchivo NVARCHAR(255),

@ArchivoUrl NVARCHAR(500),

@NotasVersion NVARCHAR(MAX) = NULL

AS

BEGIN

SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY

DECLARE @EstadoActual NVARCHAR(50);

DECLARE @VersionActual INT;

DECLARE @NuevaVersion INT;

SELECT @EstadoActual = estado_documento,

@VersionActual = version

FROM DOCUMENTO

WHERE id_documento = @IdDocumento;

IF @EstadoActual IS NULL

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El documento no existe.' AS Mensaje, NULL AS
NuevaVersion;

RETURN;

END

IF @EstadoActual = 'archivado'

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo,

'No se puede crear una nueva versión de un documento archivado.' AS
Mensaje,

NULL AS NuevaVersion;

RETURN;

END

IF NOT EXISTS (SELECT 1 FROM GU_Usuario WHERE ID_Usuario = @IdUsuario
AND ACTIVO = 1)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El usuario no existe o está inactivo.' AS
Mensaje, NULL AS NuevaVersion;

RETURN;

END

SET @NuevaVersion = @VersionActual + 1;

UPDATE DOCUMENTO

SET version = @NuevaVersion,

nombre_archivo = @NombreArchivo,

archivo_url = @ArchivoUrl,

fecha_actualizacion = GETDATE()

WHERE id_documento = @IdDocumento;

INSERT INTO DOCUMENTO_VERSION (

id_documento, numero_version, archivo_url,

nombre_archivo, fecha_version, id_usuario, notas_version

)

VALUES (

@IdDocumento, @NuevaVersion, @ArchivoUrl,

@NombreArchivo, GETDATE(), @IdUsuario,

ISNULL(@NotasVersion, 'Actualización sin descripción.')

);

COMMIT TRANSACTION;

SELECT 0 AS Codigo,

'Nueva versión ' + CAST(@NuevaVersion AS VARCHAR) + ' creada
exitosamente.' AS Mensaje,

@NuevaVersion AS NuevaVersion;

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION;

SELECT 2 AS Codigo, ERROR_MESSAGE() AS Mensaje, NULL AS
NuevaVersion;

END CATCH

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_RecuperarPassword]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 3. sp_RecuperarPassword

-- Genera token único de recuperación con vigencia configurable

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_RecuperarPassword]

@IdUsuario INT,

@IdSolicitante INT = NULL

AS

BEGIN

SET NOCOUNT ON;

IF NOT EXISTS (SELECT 1 FROM GU_Usuario WHERE ID_Usuario = @IdUsuario
AND ACTIVO = 1)

BEGIN

SELECT 'Error' AS Codigo, 'Usuario no encontrado o inactivo.' AS
Mensaje, NULL AS Token;

RETURN;

END

DECLARE @MinutosExpiracion INT;

SELECT @MinutosExpiracion = CAST(valor AS INT)

FROM GU_PARAMETRIZACION

WHERE clave = 'expiracion_token_minutos' AND activo = 1;

SET @MinutosExpiracion = ISNULL(@MinutosExpiracion, 60);

UPDATE GU_RECUPERACION_PASSWORD

SET usado = 1, fecha_uso = GETDATE()

WHERE id_usuario = @IdUsuario

AND usado = 0

AND fecha_expiracion > GETDATE();

DECLARE @NuevoToken NVARCHAR(256) =

LOWER(REPLACE(CAST(NEWID() AS NVARCHAR(36)), '-', ''))

+ LOWER(REPLACE(CAST(NEWID() AS NVARCHAR(36)), '-', ''));

DECLARE @FechaExpiracion DATETIME = DATEADD(MINUTE,
@MinutosExpiracion, GETDATE());

INSERT INTO GU_RECUPERACION_PASSWORD

(id_usuario, token, fecha_expiracion, fecha_solicitud, id_solicitante,
usado)

VALUES

(@IdUsuario, @NuevoToken, @FechaExpiracion, GETDATE(),
@IdSolicitante, 0);

SELECT 'OK' AS Codigo,

'Token generado. Válido por ' + CAST(@MinutosExpiracion AS VARCHAR) +
' minutos.' AS Mensaje,

@NuevoToken AS Token,

@FechaExpiracion AS Expiracion;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_SubirDocConPermiso]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 10. sp_SubirDocConPermiso

-- Sube documento validando permiso RBAC SUBIR_DOCUMENTOS

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_SubirDocConPermiso]

@IdUsuarioSolicitante INT,

@Titulo NVARCHAR(200),

@Descripcion NVARCHAR(MAX) = NULL,

@TipoDocumento NVARCHAR(80),

@IdUsuarioAutor INT,

@NombreArchivo NVARCHAR(255),

@TipoMime NVARCHAR(100),

@TamanoArchivo BIGINT,

@ArchivoUrl NVARCHAR(500),

@IdCurso INT = NULL,

@IdMateria INT = NULL,

@NotasVersion NVARCHAR(MAX) = NULL

AS

BEGIN

SET NOCOUNT ON;

DECLARE @TienePermiso BIT = 0;

SELECT @TienePermiso = 1

FROM GU_USUARIO_ROL ur

JOIN GU_ROL_PERMISO rp ON rp.id_rol = ur.id_rol

JOIN GU_PERMISO p ON p.id_permiso = rp.id_permiso

WHERE ur.id_usuario = @IdUsuarioSolicitante

AND p.nombre_permiso = 'SUBIR_DOCUMENTOS';

IF @TienePermiso = 0

BEGIN

SELECT 1 AS Codigo,

'Acceso denegado. El usuario no tiene el permiso SUBIR_DOCUMENTOS.'
AS Mensaje,

NULL AS IdDocumento;

RETURN;

END

EXEC sp_SubirDocumento

@Titulo = @Titulo,

@Descripcion = @Descripcion,

@TipoDocumento = @TipoDocumento,

@IdUsuarioAutor = @IdUsuarioAutor,

@NombreArchivo = @NombreArchivo,

@TipoMime = @TipoMime,

@TamanoArchivo = @TamanoArchivo,

@ArchivoUrl = @ArchivoUrl,

@IdCurso = @IdCurso,

@IdMateria = @IdMateria,

@NotasVersion = @NotasVersion;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_SubirDocumento]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ============================================================

-- MÓDULO 3: GESTIÓN DOCUMENTAL

-- Versión: 1.0

-- Procedimientos: 4

--
-- ============================================================

--
-- ------------------------------------------------------------

-- 1. sp_SubirDocumento

-- Registra metadatos de un nuevo documento y crea versión inicial

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_SubirDocumento]

@Titulo NVARCHAR(200),

@Descripcion NVARCHAR(MAX) = NULL,

@TipoDocumento NVARCHAR(80),

@IdUsuarioAutor INT,

@NombreArchivo NVARCHAR(255),

@TipoMime NVARCHAR(100),

@TamanoArchivo BIGINT,

@ArchivoUrl NVARCHAR(500),

@IdCurso INT = NULL,

@IdMateria INT = NULL,

@NotasVersion NVARCHAR(MAX) = NULL

AS

BEGIN

SET NOCOUNT ON;

BEGIN TRANSACTION;

BEGIN TRY

IF @TipoDocumento NOT IN ('tarea', 'proyecto', 'examen',
'material')

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo,

'Tipo de documento inválido. Valores permitidos: tarea, proyecto,
examen, material.' AS Mensaje,

NULL AS IdDocumento;

RETURN;

END

IF NOT EXISTS (SELECT 1 FROM GU_Usuario WHERE ID_Usuario =
@IdUsuarioAutor AND ACTIVO = 1)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El usuario autor no existe o está inactivo.' AS
Mensaje, NULL AS IdDocumento;

RETURN;

END

IF @IdCurso IS NOT NULL AND NOT EXISTS (SELECT 1 FROM CURSO WHERE
id_curso = @IdCurso)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'El curso especificado no existe.' AS Mensaje,
NULL AS IdDocumento;

RETURN;

END

IF @IdMateria IS NOT NULL AND NOT EXISTS (SELECT 1 FROM MATERIA WHERE
id_materia = @IdMateria)

BEGIN

ROLLBACK TRANSACTION;

SELECT 1 AS Codigo, 'La materia especificada no existe.' AS Mensaje,
NULL AS IdDocumento;

RETURN;

END

INSERT INTO DOCUMENTO (

titulo, descripcion, tipo_documento, estado_documento,

version, fecha_subida, fecha_actualizacion,

id_usuario_autor, nombre_archivo, tipo_mime,

tamano_archivo, archivo_url, id_curso, id_materia

)

VALUES (

@Titulo, @Descripcion, @TipoDocumento, 'borrador',

1, GETDATE(), NULL,

@IdUsuarioAutor, @NombreArchivo, @TipoMime,

@TamanoArchivo, @ArchivoUrl, @IdCurso, @IdMateria

);

DECLARE @NuevoId INT = SCOPE_IDENTITY();

INSERT INTO DOCUMENTO_VERSION (

id_documento, numero_version, archivo_url,

nombre_archivo, fecha_version, id_usuario, notas_version

)

VALUES (

@NuevoId, 1, @ArchivoUrl,

@NombreArchivo, GETDATE(), @IdUsuarioAutor,

ISNULL(@NotasVersion, 'Versión inicial.')

);

COMMIT TRANSACTION;

SELECT 0 AS Codigo, 'Documento registrado exitosamente.' AS Mensaje,
@NuevoId AS IdDocumento;

END TRY

BEGIN CATCH

ROLLBACK TRANSACTION;

SELECT 2 AS Codigo, ERROR_MESSAGE() AS Mensaje, NULL AS
IdDocumento;

END CATCH

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_SubirNota]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- P3. sp_SubirNota

-- Registra una nota de un estudiante (rango válido: 0 a 5)

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_SubirNota]

@est_id INT, @cur_id INT, @mat_id INT, @tipo NVARCHAR(50), @nota
DECIMAL(3,2), @calif_id INT

AS

BEGIN

IF (@nota BETWEEN 0 AND 5)

BEGIN

INSERT INTO dbo.EVALUACION (id_estudiante, id_curso, id_materia,
tipo_evaluacion, nota, id_calificador, fecha_evaluacion)

VALUES (@est_id, @cur_id, @mat_id, @tipo, @nota, @calif_id,
GETDATE());

PRINT 'P3: Nota registrada exitosamente';

END

ELSE PRINT 'Error P3: Nota fuera de rango';

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarSolapamiento]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 4. sp_ValidarSolapamiento

-- Verifica conflictos de aula y profesor antes de insertar horario

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_ValidarSolapamiento]

@IdCurso INT,

@IdAula INT,

@IdProfesor INT,

@Dia NVARCHAR(15),

@HoraInicio TIME,

@HoraFin TIME,

@IdHorario INT = NULL

AS

BEGIN

SET NOCOUNT ON;

DECLARE @HayConflicto BIT = 0;

DECLARE @TipoConflicto NVARCHAR(20) = 'Ninguno';

DECLARE @Detalle NVARCHAR(200) = 'Sin conflictos
detectados.';

-- Verificar conflicto de aula

IF EXISTS (

SELECT 1 FROM HORARIO h

JOIN CURSO c ON c.id_curso = h.id_curso

WHERE h.id_aula = @IdAula

AND h.dia = @Dia

AND h.id_horario <> ISNULL(@IdHorario, -1)

AND h.hora_inicio < @HoraFin

AND h.hora_fin > @HoraInicio

)

BEGIN

SET @HayConflicto = 1;

SET @TipoConflicto = 'Aula';

SELECT TOP 1 @Detalle = 'El aula ya está ocupada por: ' +
c.nombre_curso

FROM HORARIO h JOIN CURSO c ON c.id_curso = h.id_curso

WHERE h.id_aula = @IdAula AND h.dia = @Dia

AND h.id_horario <> ISNULL(@IdHorario, -1)

AND h.hora_inicio < @HoraFin AND h.hora_fin > @HoraInicio;

END

-- Verificar conflicto de profesor (si aún no hay conflicto de aula)

IF @HayConflicto = 0 AND EXISTS (

SELECT 1 FROM HORARIO h

WHERE h.id_profesor = @IdProfesor

AND h.dia = @Dia

AND h.id_horario <> ISNULL(@IdHorario, -1)

AND h.hora_inicio < @HoraFin

AND h.hora_fin > @HoraInicio

)

BEGIN

SET @HayConflicto = 1;

SET @TipoConflicto = 'Profesor';

SELECT TOP 1 @Detalle = 'El profesor ya tiene clase en: ' +
c.nombre_curso

FROM HORARIO h JOIN CURSO c ON c.id_curso = h.id_curso

WHERE h.id_profesor = @IdProfesor AND h.dia = @Dia

AND h.id_horario <> ISNULL(@IdHorario, -1)

AND h.hora_inicio < @HoraFin AND h.hora_fin > @HoraInicio;

END

SELECT @HayConflicto AS HayConflicto, @TipoConflicto AS
TipoConflicto, @Detalle AS Detalle;

END;

GO
/****** Object:  StoredProcedure [dbo].[sp_VerificarPermiso]    Script Date: 16/04/2026 3:09:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- ------------------------------------------------------------

-- 6. sp_VerificarPermiso

-- Verifica permisos y acceso a menús por cadena RBAC

--
-- ------------------------------------------------------------

CREATE   PROCEDURE [dbo].[sp_VerificarPermiso]

@IdUsuario INT,

@NombrePermiso NVARCHAR(100),

@NombreMenu NVARCHAR(100) = NULL

AS

BEGIN

SET NOCOUNT ON;

DECLARE @TienePermiso BIT = 0;

DECLARE @TieneMenu BIT = NULL;

SELECT @TienePermiso = 1

FROM GU_USUARIO_ROL ur

JOIN GU_ROL_PERMISO rp ON rp.id_rol = ur.id_rol

JOIN GU_PERMISO p ON p.id_permiso = rp.id_permiso

WHERE ur.id_usuario = @IdUsuario

AND p.nombre_permiso = @NombrePermiso;

IF @NombreMenu IS NOT NULL

BEGIN

SET @TieneMenu = 0;

SELECT @TieneMenu = 1

FROM GU_USUARIO_ROL ur

JOIN GU_MENU_PERMISO_ROL mpr ON mpr.id_rol = ur.id_rol

JOIN GU_MENU_PERMISO m ON m.id_menu = mpr.id_menu

WHERE ur.id_usuario = @IdUsuario

AND m.nombre_menu = @NombreMenu

AND m.activo = 1;

END

SELECT @TienePermiso AS TienePermiso, @TieneMenu AS
TieneMenu;

END;

GO
USE [master]
GO
ALTER DATABASE [GestionAcademica] SET  READ_WRITE 
GO
