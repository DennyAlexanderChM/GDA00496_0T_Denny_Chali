USE [master]
GO
/****** Object:  Database [GDA00496_0T_Denny_Chali]    Script Date: 22/12/2024 12:41:47 ******/
CREATE DATABASE [GDA00496_0T_Denny_Chali]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GDA00496_0T_Denny_Chali', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GDA00496_0T_Denny_Chali.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GDA00496_0T_Denny_Chali_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\GDA00496_0T_Denny_Chali_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GDA00496_0T_Denny_Chali].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET ARITHABORT OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET RECOVERY FULL 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET  MULTI_USER 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GDA00496_0T_Denny_Chali', N'ON'
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET QUERY_STORE = ON
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GDA00496_0T_Denny_Chali]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[FK_CategoriaID] [int] NOT NULL,
	[FK_UsuarioID] [int] NOT NULL,
	[Nombre_Producto] [varchar](45) NOT NULL,
	[Marca] [varchar](45) NOT NULL,
	[Codigo] [varchar](45) NOT NULL,
	[Stock] [int] NOT NULL,
	[FK_EstadoID] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[Foto] [varchar](100) NOT NULL,
	[Fecha_Creacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TotalProductosActivos]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TotalProductosActivos]
AS
SELECT
	COUNT(*) AS TotalProductos
FROM Productos
WHERE FK_EstadoID = 1 and Stock > 0;
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[OrdenID] [int] IDENTITY(1,1) NOT NULL,
	[FK_UsuarioID] [int] NOT NULL,
	[FK_EstadoID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion_Envio] [varchar](255) NOT NULL,
	[Correo] [varchar](320) NOT NULL,
	[Total_Orden] [float] NOT NULL,
	[Fecha_Entrega] [date] NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Fecha_Creacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrdenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TotalVentasAgosto]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TotalVentasAgosto]
AS
SELECT
	YEAR(Fecha_Creacion) AS Anio,
	MONTH(Fecha_Creacion) AS Mes,
	SUM(Total_Orden) AS TotalVentas
FROM Orden
WHERE 
	MONTH(Fecha_Creacion) = 8
	AND YEAR(Fecha_Creacion) = YEAR(GETDATE())
	GROUP BY YEAR(Fecha_Creacion), MONTH(Fecha_Creacion);
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[FK_RolID] [int] NOT NULL,
	[FK_EstadoID] [int] NOT NULL,
	[Correo] [varchar](320) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Razon_Social] [varchar](100) NOT NULL,
	[Nombre_Comercial] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Telefono] [varchar](45) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Fecha_Creacion] [datetime] NOT NULL,
	[Direccion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TopClientes]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TopClientes]
AS
SELECT TOP 10
	C.UsuarioID,
	C.Nombre,
	COUNT(O.OrdenID) AS TotalOrdenes,
	SUM(O.Total_Orden) AS ConsumoTotal
FROM Usuarios C
INNER JOIN Orden O ON C.UsuarioID = O.FK_UsuarioID
GROUP BY C.UsuarioID, C.Nombre
ORDER BY ConsumoTotal DESC;
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenDetalles](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[FK_OrdenID] [int] NOT NULL,
	[FK_ProductosID] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[Sub_Total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TopProductos]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TopProductos]
AS
SELECT TOP 10
	P.ProductoID,
	P.Nombre_Producto,
	-- suma el total de las ventas del producto --
	SUM(O.Cantidad) AS CantidadVentas
	
FROM Productos P
INNER JOIN OrdenDetalles O ON P.ProductoID = O.FK_ProductosID
GROUP BY P.ProductoID, P.Nombre_Producto
ORDER BY CantidadVentas ASC;
GO
/****** Object:  Table [dbo].[CategoriasProductos]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasProductos](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[FK_UsuariosID] [int] NOT NULL,
	[Nombre_Categoria] [varchar](45) NOT NULL,
	[FK_EstadosID] [int] NOT NULL,
	[Fecha_Creacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Razon_Social] [nvarchar](255) NULL,
	[Nombre_Comercial] [nvarchar](255) NULL,
	[Direccion_Entrega] [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[Correo] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[EstadoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Estado] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EstadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 22/12/2024 12:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[RolID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Rol] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoriasProductos] ON 

INSERT [dbo].[CategoriasProductos] ([CategoriaID], [FK_UsuariosID], [Nombre_Categoria], [FK_EstadosID], [Fecha_Creacion]) VALUES (1, 4, N'Electrónica', 1, CAST(N'2024-12-19T10:50:17.583' AS DateTime))
INSERT [dbo].[CategoriasProductos] ([CategoriaID], [FK_UsuariosID], [Nombre_Categoria], [FK_EstadosID], [Fecha_Creacion]) VALUES (2, 4, N'Accesorios', 1, CAST(N'2024-12-19T10:50:49.560' AS DateTime))
INSERT [dbo].[CategoriasProductos] ([CategoriaID], [FK_UsuariosID], [Nombre_Categoria], [FK_EstadosID], [Fecha_Creacion]) VALUES (3, 1, N'Periféricos', 1, CAST(N'2024-12-19T10:51:16.993' AS DateTime))
INSERT [dbo].[CategoriasProductos] ([CategoriaID], [FK_UsuariosID], [Nombre_Categoria], [FK_EstadosID], [Fecha_Creacion]) VALUES (4, 1, N'Móviles y Tablets', 1, CAST(N'2024-12-19T10:51:34.680' AS DateTime))
INSERT [dbo].[CategoriasProductos] ([CategoriaID], [FK_UsuariosID], [Nombre_Categoria], [FK_EstadosID], [Fecha_Creacion]) VALUES (5, 1, N'Audio y Video', 1, CAST(N'2024-12-19T10:51:49.587' AS DateTime))
INSERT [dbo].[CategoriasProductos] ([CategoriaID], [FK_UsuariosID], [Nombre_Categoria], [FK_EstadosID], [Fecha_Creacion]) VALUES (6, 1, N'Informática', 1, CAST(N'2024-12-19T10:52:04.183' AS DateTime))
INSERT [dbo].[CategoriasProductos] ([CategoriaID], [FK_UsuariosID], [Nombre_Categoria], [FK_EstadosID], [Fecha_Creacion]) VALUES (7, 2, N'Muebles', 2, CAST(N'2024-12-22T12:02:36.460' AS DateTime))
SET IDENTITY_INSERT [dbo].[CategoriasProductos] OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([EstadoID], [Nombre_Estado]) VALUES (1, N'Activo')
INSERT [dbo].[Estados] ([EstadoID], [Nombre_Estado]) VALUES (2, N'Inactivo')
INSERT [dbo].[Estados] ([EstadoID], [Nombre_Estado]) VALUES (3, N'Pendiente')
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[Orden] ON 

INSERT [dbo].[Orden] ([OrdenID], [FK_UsuarioID], [FK_EstadoID], [Nombre], [Direccion_Envio], [Correo], [Total_Orden], [Fecha_Entrega], [Telefono], [Fecha_Creacion]) VALUES (2, 3, 2, N'Mufi Mellsop', N'227244 Valley Edge Drive', N'mmellsop2@friendfeed.com', 12709.82, CAST(N'2025-01-11' AS Date), N'507-588-1384', CAST(N'2024-12-19T13:26:46.113' AS DateTime))
INSERT [dbo].[Orden] ([OrdenID], [FK_UsuarioID], [FK_EstadoID], [Nombre], [Direccion_Envio], [Correo], [Total_Orden], [Fecha_Entrega], [Telefono], [Fecha_Creacion]) VALUES (3, 5, 3, N'Patrizius Ferrettini', N'94 4th Court', N'pferrettini4@unicef.org', 1000, CAST(N'2025-10-10' AS Date), N'325-480-6955', CAST(N'2024-12-21T23:25:33.860' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orden] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenDetalles] ON 

INSERT [dbo].[OrdenDetalles] ([DetalleID], [FK_OrdenID], [FK_ProductosID], [Cantidad], [Precio], [Sub_Total]) VALUES (1, 2, 1, 10, 1200.99, 12009.9)
INSERT [dbo].[OrdenDetalles] ([DetalleID], [FK_OrdenID], [FK_ProductosID], [Cantidad], [Precio], [Sub_Total]) VALUES (2, 2, 2, 5, 79.99, 399.95)
INSERT [dbo].[OrdenDetalles] ([DetalleID], [FK_OrdenID], [FK_ProductosID], [Cantidad], [Precio], [Sub_Total]) VALUES (3, 2, 4, 3, 99.99, 299.97)
INSERT [dbo].[OrdenDetalles] ([DetalleID], [FK_OrdenID], [FK_ProductosID], [Cantidad], [Precio], [Sub_Total]) VALUES (4, 3, 1, 1, 1200.99, 1200.99)
INSERT [dbo].[OrdenDetalles] ([DetalleID], [FK_OrdenID], [FK_ProductosID], [Cantidad], [Precio], [Sub_Total]) VALUES (5, 3, 2, 1, 79.99, 79.99)
INSERT [dbo].[OrdenDetalles] ([DetalleID], [FK_OrdenID], [FK_ProductosID], [Cantidad], [Precio], [Sub_Total]) VALUES (6, 3, 4, 3, 99.99, 299.97)
SET IDENTITY_INSERT [dbo].[OrdenDetalles] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (1, 1, 1, N'Laptop Gamer XYZ', N'XYZ', N'LPT-12345', 50, 1, 1200.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:04:17.727' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (2, 2, 1, N'Auriculares Bluetooth ABC', N'ABC', N'AUR-67890', 150, 2, 79.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:05:56.333' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (4, 3, 4, N'Teclado Mecánico RGB', N'Defender', N'TEC-11223', 35, 1, 99.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:06:56.770' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (6, 1, 4, N'Tablet Pro Z', N'ProTech', N'TAB-32451', 60, 2, 499.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:07:40.943' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (7, 5, 1, N'Smart TV 55 pulgadas 4K', N'UltraVision', N'TV-65432', 25, 1, 649.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:08:05.573' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (8, 2, 1, N'Funda Protectora para Smartphone', N'CasePro', N'FND-87645', 200, 2, 15.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:08:26.650' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (9, 3, 1, N'Mouse Óptico RGB', N'HyperClick', N'MSE-34567', 120, 1, 29.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:09:01.520' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (11, 4, 1, N'Smartphone 5G Model X', N'ModelX', N'SM5G-45678', 20, 1, 899.49, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:12:07.610' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (12, 4, 1, N'Smartphone Económico M2', N'EconoPhone', N'SM2-98234', 100, 1, 299.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:14:15.243' AS DateTime))
INSERT [dbo].[Productos] ([ProductoID], [FK_CategoriaID], [FK_UsuarioID], [Nombre_Producto], [Marca], [Codigo], [Stock], [FK_EstadoID], [Precio], [Foto], [Fecha_Creacion]) VALUES (13, 1, 4, N'Laptop Ultrafina P6', N'TechPro', N'LPT-99876', 35, 1, 899.99, N'https://img.icons8.com/?size=100&id=QIR8MMgvNEzB&format=png&color=000000', CAST(N'2024-12-19T11:15:00.070' AS DateTime))
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([RolID], [Nombre_Rol]) VALUES (1, N'Operador')
INSERT [dbo].[Rol] ([RolID], [Nombre_Rol]) VALUES (2, N'Cliente')
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioID], [FK_RolID], [FK_EstadoID], [Correo], [Nombre], [Razon_Social], [Nombre_Comercial], [Password], [Telefono], [Fecha_Nacimiento], [Fecha_Creacion], [Direccion]) VALUES (1, 1, 1, N'pcousans0@netscape.com', N'Pyotr Cousans', N'Vinder', N'Privado', N'$2a$08$kz7bXsiaU523tAyp3PG7SOBxDGu9aZLcIMs9ZdhPRW7QbbMgA3swK', N'690-846-3978', CAST(N'2000-01-28' AS Date), CAST(N'2024-12-19T10:15:27.263' AS DateTime), N'01259 Barnett Junction')
INSERT [dbo].[Usuarios] ([UsuarioID], [FK_RolID], [FK_EstadoID], [Correo], [Nombre], [Razon_Social], [Nombre_Comercial], [Password], [Telefono], [Fecha_Nacimiento], [Fecha_Creacion], [Direccion]) VALUES (2, 1, 1, N'nshrimplin1@earthlink.net', N'Nikolai Shrimplin', N'Twitternation', N'Privado', N'$2a$08$xJvjHtwcWsrJ4ykw2o8yDO8v8FzYuChFjYP63G/hv/r0ZFQj2l04.', N'772-996-7852', CAST(N'2024-08-13' AS Date), CAST(N'2024-12-19T10:24:41.163' AS DateTime), N'9 Washington Hill')
INSERT [dbo].[Usuarios] ([UsuarioID], [FK_RolID], [FK_EstadoID], [Correo], [Nombre], [Razon_Social], [Nombre_Comercial], [Password], [Telefono], [Fecha_Nacimiento], [Fecha_Creacion], [Direccion]) VALUES (3, 2, 1, N'mmellsop2@friendfeed.com', N'Mufi Mellsop', N'Realpoint', N'Privado', N'$2a$08$1qPPaCKIpi4TCsABcUZmYe80/bI7eUjERgaPJn4706UTOHw9qAhMq', N'507-588-1384', CAST(N'2024-08-09' AS Date), CAST(N'2024-12-19T10:25:05.627' AS DateTime), N'27244 Valley Edge Drive')
INSERT [dbo].[Usuarios] ([UsuarioID], [FK_RolID], [FK_EstadoID], [Correo], [Nombre], [Razon_Social], [Nombre_Comercial], [Password], [Telefono], [Fecha_Nacimiento], [Fecha_Creacion], [Direccion]) VALUES (4, 1, 2, N'lgammet3@geocities.com', N'Lorrie Gammet', N'Twitterlist', N'Privado', N'$2a$08$ROOkCmXoknzViqczhyIaceDnA5ePdn5rxnR5g8qQYIKLcuJPPZmBK', N'513-713-3128', CAST(N'2024-11-26' AS Date), CAST(N'2024-12-19T10:25:25.453' AS DateTime), N'91751 Homewood Alley')
INSERT [dbo].[Usuarios] ([UsuarioID], [FK_RolID], [FK_EstadoID], [Correo], [Nombre], [Razon_Social], [Nombre_Comercial], [Password], [Telefono], [Fecha_Nacimiento], [Fecha_Creacion], [Direccion]) VALUES (5, 2, 1, N'pferrettini4@unicef.org', N'Patrizius Ferrettini', N'Privado', N'Divavu', N'$2a$08$OMnIdV/FyEV.6VshQqUUZ.mB.lVkgVg4QEuzG3AcTKkEX7SuxMZ3C', N'325-480-6955', CAST(N'1998-05-23' AS Date), CAST(N'2024-12-19T10:26:24.303' AS DateTime), N'94 4th Court')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[CategoriasProductos] ADD  DEFAULT (getdate()) FOR [Fecha_Creacion]
GO
ALTER TABLE [dbo].[Orden] ADD  DEFAULT (getdate()) FOR [Fecha_Creacion]
GO
ALTER TABLE [dbo].[Productos] ADD  DEFAULT (getdate()) FOR [Fecha_Creacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [Fecha_Creacion]
GO
ALTER TABLE [dbo].[CategoriasProductos]  WITH CHECK ADD  CONSTRAINT [FK_CategoriasProductos_Estados] FOREIGN KEY([FK_EstadosID])
REFERENCES [dbo].[Estados] ([EstadoID])
GO
ALTER TABLE [dbo].[CategoriasProductos] CHECK CONSTRAINT [FK_CategoriasProductos_Estados]
GO
ALTER TABLE [dbo].[CategoriasProductos]  WITH CHECK ADD  CONSTRAINT [FK_CategoriasProductos_Usuarios] FOREIGN KEY([FK_UsuariosID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[CategoriasProductos] CHECK CONSTRAINT [FK_CategoriasProductos_Usuarios]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Estado] FOREIGN KEY([FK_EstadoID])
REFERENCES [dbo].[Estados] ([EstadoID])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_Orden_Estado]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Usuarios] FOREIGN KEY([FK_UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_Orden_Usuarios]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenDetalles_Orden] FOREIGN KEY([FK_OrdenID])
REFERENCES [dbo].[Orden] ([OrdenID])
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FK_OrdenDetalles_Orden]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenDetalles_Productos] FOREIGN KEY([FK_ProductosID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FK_OrdenDetalles_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_CategoriaProducto] FOREIGN KEY([FK_CategoriaID])
REFERENCES [dbo].[CategoriasProductos] ([CategoriaID])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_CategoriaProducto]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Estados] FOREIGN KEY([FK_EstadoID])
REFERENCES [dbo].[Estados] ([EstadoID])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Estados]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Usuarios] FOREIGN KEY([FK_UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Estados] FOREIGN KEY([FK_EstadoID])
REFERENCES [dbo].[Estados] ([EstadoID])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Estados]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Rol] FOREIGN KEY([FK_RolID])
REFERENCES [dbo].[Rol] ([RolID])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Rol]
GO
/****** Object:  StoredProcedure [dbo].[P_CrearCategoriaProducto]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Creacion de procedimientos*/
CREATE PROCEDURE [dbo].[P_CrearCategoriaProducto]
	@UsuariosID int,
	@EstadoID int,
	@Nombre_Categoria varchar(45)
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF EXISTS (SELECT 1 FROM CategoriasProductos WHERE Nombre_Categoria = @Nombre_Categoria)
			BEGIN
				PRINT 'CATEGORIA EXISTENTE';
			END
			ELSE
			BEGIN
				INSERT INTO CategoriasProductos(FK_UsuariosID, FK_EstadosID, Nombre_Categoria)
				VALUES(@UsuariosID, @EstadoID, @Nombre_Categoria);

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL INSERTAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_CrearEstados]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_CrearEstados]
	@Nombre_Estado varchar(45)

AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF EXISTS (SELECT 1 FROM Estados WHERE Nombre_Estado = @Nombre_Estado)
			BEGIN
				PRINT 'DATO EXISTENTE';
			END
			ELSE
			BEGIN
				INSERT INTO Estados(Nombre_estado)
				VALUES(@Nombre_Estado);

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
				COMMIT TRANSACTION;
				/*MENSAJE DE CONFIRMACION*/
			END
			
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL INSERTAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_CrearOrden]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_CrearOrden]
        @UsuarioID INT,
		@FechaEntrega DATE,
		@TotalOrden FLOAT,
        @jsonProductos NVARCHAR(MAX)
    AS
    BEGIN
        BEGIN TRY
			BEGIN TRANSACTION
            DECLARE @OrdenID INT;
            DECLARE @ProductoID INT;
            DECLARE @Cantidad INT;
			DECLARE @NombreUsuario VARCHAR(100);
			DECLARE @Direccion VARCHAR(255);
			DECLARE @Correo VARCHAR (320);
			DECLARE @Telefono VARCHAR (20);

			SELECT 
				@NombreUsuario = Nombre,
				@Direccion = Direccion,
				@Correo = Correo,
				@Telefono = Telefono
			FROM Usuarios
			WHERE UsuarioID = @UsuarioID;


            -- Crear una nueva orden con el ID del usuario
			-- El id del estado inicial es 3 (Pendiente)
            INSERT INTO Orden (FK_UsuarioID, FK_EstadoID, Nombre, Direccion_Envio, Correo, Total_Orden, Fecha_Entrega, Telefono)
            VALUES (@UsuarioID, 3, @NombreUsuario, @Direccion, @Correo, @TotalOrden, @FechaEntrega, @Telefono);

            -- Obtener el ID de la nueva orden creada
            SET @OrdenID = SCOPE_IDENTITY();

            -- Insertar los productos en la tabla de detalles de la orden
			-- Declaramos una tabla
            INSERT INTO OrdenDetalles(FK_OrdenID, FK_ProductosID, Cantidad, Precio, Sub_Total)
            SELECT @OrdenID, ProductoID, Cantidad, Precio, SubTotal
            FROM OPENJSON(@jsonProductos)
            WITH (
                ProductoID INT,
                Cantidad INT,
				Precio FLOAT,
				SubTotal FLOAT 
            );

            
            COMMIT TRANSACTION;
        END TRY
        BEGIN CATCH
            -- Manejo de errores
			ROLLBACK TRANSACTION;
			THROW;
        END CATCH;
    END;
GO
/****** Object:  StoredProcedure [dbo].[P_CrearProducto]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_CrearProducto]
	@CategoriaID int,
	@UsuarioID int,
	@Nombre_Producto varchar(45),
	@Marca varchar(45), 
	@Codigo varchar(45),
	@Stock int,
	@EstadoID int,
	@Precio float,
	@Foto varchar(100)

AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF EXISTS (SELECT 1 FROM Productos WHERE Nombre_Producto = @Nombre_Producto)
				BEGIN
					PRINT 'NOMBRE EXISTENTE';
				END
			ELSE
			BEGIN
				INSERT INTO Productos(FK_CategoriaID, FK_UsuarioID, Nombre_Producto, Marca, Codigo, Stock, FK_EstadoID, Precio, Foto)
				VALUES(@CategoriaID, @UsuarioID, @Nombre_Producto, @Marca, @Codigo, @Stock, @EstadoID, @Precio, @Foto);

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL INSERTAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_CrearRol]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_CrearRol]
	@Nombre_Rol varchar(45)

AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF EXISTS (SELECT 1 FROM Rol WHERE Nombre_Rol = @Nombre_Rol)
			BEGIN
				PRINT 'NOMBRE EXISTENTE';
			END
			ELSE
			BEGIN
				INSERT INTO Rol(Nombre_Rol)
				VALUES(@Nombre_Rol);
			
			/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
			COMMIT TRANSACTION;

			/*MENSAJE DE CONFIRMACION*/

			PRINT 'CORRECTO';

			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL INSERTAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_CrearUsuarios]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Creacion de procedimientos*/
CREATE PROCEDURE [dbo].[P_CrearUsuarios]

	@RolID int,
	@EstadoID int,
	@Correo varchar(320),
	@Nombre varchar(100),
	@Nombre_Comercial varchar(100),
	@Razon_Social varchar(100),
	@Password_Usuario varchar(100),
	@Telefono varchar(45),
	@Fecha_Nacimiento date,
	@Direccion varchar(255)
	
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			
		INSERT INTO Usuarios(
		FK_RolID,
		FK_EstadoID,
		Correo,
		Nombre,
		Razon_Social,
		Nombre_Comercial, 
		Password,
		Telefono,
		Fecha_Nacimiento,
		Direccion
		) 
		VALUES (@RolID,
		@EstadoID,
		@Correo,
		@Nombre,
		@Razon_Social,
		@Nombre_Comercial, 
		@Password_Usuario,
		@Telefono,
		@Fecha_Nacimiento,
		@Direccion);

		/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
		COMMIT TRANSACTION;

		/*MENSAJE DE CONFIRMACION*/
		PRINT 'CORRECTO';
		
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL EDITAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_ModificarCategoriaProducto]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_ModificarCategoriaProducto]
	@CategoriaID int,
	@UsuariosID int,
	@EstadoID int,
	@Nombre_Categoria varchar(45)
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF NOT EXISTS (SELECT 1 FROM CategoriasProductos WHERE CategoriaID  = @CategoriaID)
			BEGIN
				PRINT 'NO ENCONTRADO';
			END
			ELSE
			BEGIN
				UPDATE CategoriasProductos
				SET
					FK_UsuariosID = @UsuariosID,
					FK_EstadosID = @EstadoID, 
					Nombre_Categoria = @Nombre_Categoria
				WHERE CategoriaID = @CategoriaID;

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL INSERTAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_ModificarEstado]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_ModificarEstado]
	@EstadoID int,
	@Nombre_Estado varchar(45)
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF NOT EXISTS (SELECT 1 FROM Estados WHERE EstadoID = @EstadoID)
			BEGIN
				PRINT 'No encontrado';
			END
			ELSE
			BEGIN
				UPDATE Estados
				SET
					Nombre_Estado = @Nombre_Estado

				WHERE EstadoID = @EstadoID;

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
			
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL EDITAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_ModificarEstadoOrden]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_ModificarEstadoOrden]
	@OrdenID int,
	@EstadoID int
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF NOT EXISTS (SELECT 1 FROM Orden WHERE OrdenID  = @OrdenID)
			BEGIN
				PRINT 'NO ENCONTRADO';
			END
			ELSE
			BEGIN
				UPDATE Orden
				SET
					
					FK_EstadoID = @EstadoID

				WHERE OrdenID = @OrdenID;

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL EDITAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_ModificarOrden]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[P_ModificarOrden] (
	@OrdenID int,
	@EstadoID int,
	@Nombre varchar(100),
	@Direccion varchar(255), 
	@Correo varchar(320),
	@Total_Orden float,
	@Fecha_Entrega date, 
	@Telefono varchar(20))
	
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF NOT EXISTS (SELECT 1 FROM Orden WHERE OrdenID  = @OrdenID)
			BEGIN
				PRINT 'No encontrado';
				-- Genera una excepción y transfiere la ejecución a un CATCH bloque de un TRY
				THROW 51000, 'No encontado', 1;
			END
			ELSE
			BEGIN
				UPDATE Orden
				SET
					FK_EstadoID = @EstadoID,
					Nombre = @Nombre, 
					Direccion_Envio = @Direccion,
					Correo = @Correo,
					Total_Orden = @Total_Orden,
					Fecha_Entrega = @Fecha_Entrega, 
					Telefono = Telefono
				WHERE OrdenID = @OrdenID;

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL INSERTAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_ModificarProducto]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Creacion de procedimientos*/
CREATE PROCEDURE [dbo].[P_ModificarProducto]
	@ProductoID int,
	@CategoriaID int,
	@UsuarioID int,
	@EstadoID int,
	@Nombre_Producto varchar(45),
	@Marca varchar(45),
	@Codigo varchar(45),
	@Stock float,
	@Precio float,
	@Foto varchar(100)
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF NOT EXISTS (SELECT 1 FROM Productos WHERE ProductoID  = @ProductoID)
			BEGIN
				PRINT 'NO ENCONTRADO';
			END
			ELSE
			BEGIN
				UPDATE Productos
				SET
					FK_CategoriaID = @CategoriaID,
					FK_UsuarioID = @UsuarioID,
					FK_EstadoID = @EstadoID, 
					Nombre_Producto = @Nombre_Producto,
					Marca = @Marca,
					Codigo = @Codigo,
					Stock = @Stock,
					Precio = @Precio,
					Foto = @Foto

				WHERE ProductoID = @ProductoID;

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL EDITAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_ModificarRol]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Creacion de procedimientos*/
CREATE PROCEDURE [dbo].[P_ModificarRol]
	@RolID int,
	@Nombre_Rol varchar(45)
	
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF NOT EXISTS (SELECT 1 FROM Rol WHERE RolID  = @RolID)
			BEGIN
				PRINT 'NO ENCONTRADO';
			END
			ELSE
			BEGIN
				UPDATE Rol
				SET
					Nombre_Rol = @Nombre_Rol

				WHERE RolID = @RolID;

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL EDITAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[P_ModificarUsuarios]    Script Date: 22/12/2024 12:41:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Creacion de procedimientos*/
CREATE PROCEDURE [dbo].[P_ModificarUsuarios]

	@UsuarioID int,
	@RolID int,
	@EstadoID int,
	@Correo varchar(320),
	@Nombre varchar(100),
	@Nombre_Comercial varchar(100),
	@Razon_Social varchar(100),
	@Password_Usuario varchar(100),
	@Telefono varchar(45),
	@Fecha_Nacimiento date,
	@Direccion varchar(255)
	
AS
BEGIN
	/*TRY CATCH EN CASE DE ERRORES*/
	BEGIN TRY
		
		/*INICIAMOS UNA TRANSACCION*/
		BEGIN TRANSACTION
			IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE UsuarioID  = @UsuarioID)
			BEGIN
				PRINT 'NO ENCONTRADO';
			END
			ELSE
			BEGIN
				UPDATE Usuarios
				SET
					FK_RolID = @RolID,
					FK_EstadoID = @EstadoID,
					Correo = @Correo,
					Nombre = @Nombre,
					Razon_Social = @Razon_Social,
					Nombre_Comercial = @Nombre_Comercial, 
					Password = @Password_Usuario,
					Telefono = @Telefono,
					Fecha_Nacimiento = @Fecha_Nacimiento,
					Direccion = @Direccion

				WHERE UsuarioID = @UsuarioID;

				/*SI TODO FUE CORRECTO GUARDAMOS DATOS*/
			
				COMMIT TRANSACTION;

				/*MENSAJE DE CONFIRMACION*/
				PRINT 'CORRECTO';
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
		/*EN CASO DE ERRORES*/
		PRINT 'ERROR AL EDITAR DATO' + ERROR_MESSAGE()
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [GDA00496_0T_Denny_Chali] SET  READ_WRITE 
GO
