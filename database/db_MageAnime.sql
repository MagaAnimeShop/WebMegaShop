USE [master]
GO
/****** Object:  Database [MageAnime]    Script Date: 1/30/2024 12:53:34 PM ******/
CREATE DATABASE [MageAnime]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MageAnime', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HOANGVINH\MSSQL\DATA\MageAnime.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MageAnime_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HOANGVINH\MSSQL\DATA\MageAnime_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MageAnime].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MageAnime] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MageAnime] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MageAnime] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MageAnime] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MageAnime] SET ARITHABORT OFF 
GO
ALTER DATABASE [MageAnime] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MageAnime] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MageAnime] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MageAnime] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MageAnime] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MageAnime] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MageAnime] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MageAnime] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MageAnime] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MageAnime] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MageAnime] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MageAnime] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MageAnime] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MageAnime] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MageAnime] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MageAnime] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MageAnime] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MageAnime] SET RECOVERY FULL 
GO
ALTER DATABASE [MageAnime] SET  MULTI_USER 
GO
ALTER DATABASE [MageAnime] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MageAnime] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MageAnime] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MageAnime] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MageAnime] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MageAnime] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MageAnime', N'ON'
GO
ALTER DATABASE [MageAnime] SET QUERY_STORE = ON
GO
ALTER DATABASE [MageAnime] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MageAnime]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 1/30/2024 12:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 1/30/2024 12:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateLike] [datetime] NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 1/30/2024 12:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[PlaceDelivery] [nvarchar](max) NOT NULL,
	[PHONE] [nchar](15) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[TotalMoney] [money] NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/30/2024 12:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameProduct] [nvarchar](255) NOT NULL,
	[Descriptions] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[Images] [nvarchar](max) NOT NULL,
	[CharacterName] [nvarchar](255) NOT NULL,
	[MageAnime] [nvarchar](255) NOT NULL,
	[Height] [char](15) NOT NULL,
	[Wight] [char](15) NOT NULL,
	[Gram] [char](15) NOT NULL,
	[IdUser] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/30/2024 12:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SttOders]    Script Date: 1/30/2024 12:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SttOders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Statuss] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Descriptions] [nvarchar](max) NULL,
	[IdUser] [int] NOT NULL,
	[IdInvoice] [int] NOT NULL,
 CONSTRAINT [StatusOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/30/2024 12:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](100) NOT NULL,
	[Birthday] [date] NULL,
	[Gender] [bit] NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[Phone] [nchar](15) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[LocaAddress] [nvarchar](255) NULL,
	[Username] [nchar](30) NOT NULL,
	[PassW] [nchar](30) NOT NULL,
	[CreateDate] [datetime] NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (82, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 2, 1092)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (85, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 2, 1100)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (91, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 2, 1100)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (94, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 1, 1100)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (102, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 1, 1100)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (103, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 1, 1097)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (106, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1070)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (108, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1098)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (110, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1100)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (111, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1100)
INSERT [dbo].[Carts] ([Id], [CreateDate], [IdUser], [IdProduct]) VALUES (112, CAST(N'2024-01-25T00:00:00.000' AS DateTime), 1, 1088)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (6, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1104)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (7, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1098)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (8, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1087)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (9, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1070)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (10, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1090)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (11, CAST(N'2024-01-21T00:00:00.000' AS DateTime), 2, 1093)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (18, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1, 1090)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (20, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1, 1094)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (21, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1, 1093)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (23, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1, 1095)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (24, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1, 1099)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (25, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1, 1098)
INSERT [dbo].[Favorites] ([Id], [DateLike], [IdUser], [IdProduct]) VALUES (26, CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1, 1091)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (6, 1, N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'0399989849     ', CAST(N'2024-01-18T00:00:00.000' AS DateTime), 1200450.0000, 1, 1088)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (7, 1, N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'0399989849     ', CAST(N'2024-01-18T00:00:00.000' AS DateTime), 1440500.0000, 1, 1092)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (8, 1, N'Kênh T4, phường Phước Long, quận Bình Chánh, Tp HCM', N'0981028857     ', CAST(N'2024-01-18T00:00:00.000' AS DateTime), 700000.0000, 2, 1093)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (9, 3, N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'0399989849     ', CAST(N'2024-01-18T00:00:00.000' AS DateTime), 2100000.0000, 1, 1090)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (10, 1, N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'0399989849     ', CAST(N'2024-01-18T00:00:00.000' AS DateTime), 3500000.0000, 1, 1087)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (11, 4, N'19a Tân Thuận Tây, Phường Bình Thuận, Quận 7, TP HCM', N'0394378614     ', CAST(N'2024-01-19T00:00:00.000' AS DateTime), 6180000.0000, 1021, 1070)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (12, 1, N'Kênh T4, phường Phước Long, quận Bình Chánh, Tp HCM', N'0981028857     ', CAST(N'2024-01-20T00:00:00.000' AS DateTime), 1545000.0000, 2, 1070)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (13, 1, N'Kênh T4, phường Phước Long, quận Bình Chánh, Tp HCM', N'0981028857     ', CAST(N'2024-01-20T00:00:00.000' AS DateTime), 1545000.0000, 2, 1070)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (14, 2, N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'0399989849     ', CAST(N'2024-01-21T00:00:00.000' AS DateTime), 800000.0000, 1, 1100)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (15, 2, N'Kênh T4, phường Phước Long, quận Bình Chánh, Tp HCM', N'0981028857     ', CAST(N'2024-01-21T00:00:00.000' AS DateTime), 800000.0000, 2, 1100)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (16, 1, N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'0399989849     ', CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1440500.0000, 1, 1092)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (17, 3, N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'0981028857     ', CAST(N'2024-01-25T00:00:00.000' AS DateTime), 3601350.0000, 1, 1088)
INSERT [dbo].[Invoices] ([Id], [Quantity], [PlaceDelivery], [PHONE], [CreateDate], [TotalMoney], [IdUser], [IdProduct]) VALUES (18, 3, N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'0981028857     ', CAST(N'2024-01-25T00:00:00.000' AS DateTime), 1500000.0000, 1, 1099)
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1070, N'Bộ mô hình Fushigibana (2023', N'1. Fushigidane (Bulbasaur):
Ngoại Hình:

Fushigidane là một Pokémon nhỏ với kích thước vừa phải, có thân hình tròn trịa và màu xanh lá cây dễ thương.
Có đôi tai lớn, mũi nhỏ, và đôi mắt nâu to tròn.
Lưng của Fushigidane có một chiếc nắp mở, giống như một hộp phía sau chứa hạt giống.
Đặc Điểm Nổi Bật:

Fushigidane luôn giữ một hạt giống trên lưng, đó là nguồn năng lượng cho sự phát triển của nó.
2. Fushigisou (Ivysaur):
Ngoại Hình:

Khi tiến hóa thành Fushigisou, Pokémon trở nên lớn hơn với chiều cao và thân hình mạnh mẽ hơn.
Đầu của Fushigisou có một chiếc gai trên mũi, và mắt có vẻ nghiêm túc hơn so với giai đoạn trước.
Đặc Điểm Nổi Bật:

Fushigisou đã phát triển thêm nhiều loại lá xanh tươi mới, tăng cường khả năng hấp thụ năng lượng từ môi trường.
3. Fushigibana (Venusaur):
Ngoại Hình:

Trong giai đoạn cuối cùng, Fushigidane tiến hóa thành Fushigibana, trở thành một Pokémon lớn và mạnh mẽ.
Lưng của Fushigibana phát triển thành một bức thảm cây lớn, tạo nên hình ảnh của một cổ điển, quyền lực.
Đặc Điểm Nổi Bật:

Fushigibana giữ nguyên hạt giống từ giai đoạn trước, nhưng bây giờ nó đã mở ra hoa rộ và phát triển thêm các chiếc lá màu xanh đậm.
Bộ mô hình Fushigidane, Fushigisou, và Fushigibana không chỉ thể hiện sự phát triển về kích thước và hình dáng mà còn là biểu tượng của sức sống và sức mạnh trong thế giới Pokémon. Đây là một nhóm Pokémon đầy ý nghĩa và đẹp mắt cho bất kỳ người chơi Pokémon nào.





', 1545000.0000, N'vinhnh2312/pokemon4.jpg', N'Fushigidane, Fushigisou, Fushigibana', N'Pokemon', N'20             ', N'35             ', N'1kg5           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1087, N'Bộ Group Pokemon 2023', N'Bộ Group Pokémon Độc Đáo
1. Pikachu (Pikachu):

Pikachu, Pokémon Điện, là biểu tượng của sự đáng yêu và năng lượng tích cực. Với vẻ ngoại hình hấp dẫn, tai lớn và đuôi dễ thương, Pikachu là điểm nhấn hoàn hảo cho bộ sưu tập của bạn.
2. Charizard (Lizardon):

Charizard, Pokémon Hỏa và Bay, đại diện cho sức mạnh và sự uyển chuyển. Với đôi cánh lửa mạnh mẽ, Charizard là nguồn cảm hứng cho những người hâm mộ thích sự mạnh mẽ và tự do.
3. Bulbasaur (Fushigidane):

Bulbasaur, Pokémon Cỏ và Độc, mang đến vẻ ngoại hình dễ thương và tính cách trung thực. Bông hoa đặc biệt trên lưng của nó là biểu tượng của sức mạnh tăng cường.
4. Jigglypuff (Purin):

Jigglypuff, Pokémon Nhạc Sĩ, có vẻ ngoại hình tròn trịa và khả năng hát bài hát để khiến người nghe ngủ say. Nó mang đến một khía cạnh vui nhộn và âm nhạc cho bộ sưu tập.
5. Eevee (Eievui):

Eevee, Pokémon Đa Dạng, là nguồn cảm hứng với khả năng tiến hóa thành nhiều dạng khác nhau. Sự đa dạng của Eevee là biểu tượng của sự linh hoạt và khám phá.
6. Snorlax (Kabigon):

Snorlax, Pokémon Lười Biếng, là biểu tượng của sự thoải mái và sự ấm áp. Nó là một người bạn lý tưởng để thêm vào bộ sưu tập, tượng trưng cho sự bình yên.
7. Meowth (Nyarth):

Meowth, Pokémon Giống Mèo, mang lại vẻ đẹp và sự quyến rũ của mèo. Nó có khả năng đặc biệt là nói chuyện và làm cho mô hình thêm phần độc đáo.
8. Mewtwo (Myūtsū):

Mewtwo, Pokémon Huyền Bí, là biểu tượng của sự mạnh mẽ và tâm linh. Với sức mạnh đặc biệt, Mewtwo là điểm nhấn quan trọng của bộ sưu tập.
Bộ group Pokémon của bạn không chỉ là một bộ sưu tập, mà còn là một tập hợp các cá thể độc đáo, mỗi cá thể mang lại một cảm xúc và ý nghĩa khác nhau. Cùng nhau, chúng tạo ra một hành trình đáng nhớ qua thế giới kỳ diệu của Pokémon.', 3500000.0000, N'vinhnh2312/pokemon2.jpg', N'Group Pokemon', N'Pokemon', N'20             ', N'30             ', N'2kg3           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1088, N'Mega Mewtwo - Biểu Tượng Của Sức Mạnh Tinh Tế', N'Mega Mewtwo - Biểu Tượng Của Sức Mạnh Tinh Tế
Mega Mewtwo là một hiện thân của sức mạnh và trí tuệ trong thế giới Pokémon. Với việc tiến hóa thông qua Mega Stone đặc biệt, Mewtwo trở nên mạnh mẽ và đẳng cấp hơn bao giờ hết.

Ngoại Hình:

Chiều cao của Mega Mewtwo tăng lên, tạo ra một hình dáng mảnh mai và quý phái. Lông mượt mà bao phủ toàn bộ cơ thể, tạo nên một vẻ đẹp đặc biệt và lôi cuốn.
Mắt Đặc Biệt:

Mắt sáng bóng của Mega Mewtwo là trung tâm của sự tập trung và trí tuệ. Ánh sáng xanh lấp lánh trong đôi mắt, thể hiện sức mạnh tâm linh và khả năng đọc tâm.
Đặc Điểm Độc Đáo:

Mega Mewtwo có một chiếc đuôi dài và linh hoạt, thể hiện sự điều khiển tối ưu của cơ thể. Điều này tạo ra một hình ảnh độc đáo và mạnh mẽ khi nó đứng đối mặt với mọi thách thức.
Khả Năng Chiến Đấu:

Trí tuệ và sức mạnh của Mega Mewtwo xuất sắc trong chiến đấu. Khả năng đọc tâm linh và tấn công từ xa bằng năng lực tâm linh là những điểm mạnh của nó.
Aura Năng Lượng:

Xung quanh Mega Mewtwo, có một aura năng lượng màu xanh đặc trưng, tạo nên một bức tranh huyền bí và đầy quyền lực.
Biểu Tượng Của Tinh Tế:

Mega Mewtwo không chỉ là biểu tượng của sức mạnh vượt trội mà còn là biểu tượng của tinh tế và sự tinh tế. Mọi đường nét trên cơ thể đều được chăm chút đến từng chi tiết.
Mega Mewtwo là một Pokémon không chỉ gây ấn tượng bởi vẻ ngoại hình mạnh mẽ, mà còn bởi sức mạnh tâm linh và trí tuệ vô song. Đây là một biểu tượng không thể thiếu cho bất kỳ bộ sưu tập Pokémon nào.', 1200450.0000, N'vinhnh2312/MewTwo.jpg', N'Mewtwo ', N'Pokemon', N'30             ', N'25             ', N'1kg4           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1090, N'Pokemon Mega Swampert   ', N'', 700000.0000, N'vinhnh2312/s-l1600.jpg', N'Swampert   ', N'Pokemon', N'25             ', N'23             ', N'1kg5           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1091, N'Mega Construx Pokemon Gyarados Set Construccion ', N'', 1450000.0000, N'vinhnh2312/71TliogTLkL.jpg', N'Gyarados ', N'Pokemon', N'15             ', N'35             ', N'1kh3           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1092, N'Lizardon Mega X | Từ điển Pokémon |', N'', 1440500.0000, N'vinhnh2312/ca3db4aad5c85a525d9be86852b26db1db7a22c0.png', N'Lizardon ', N'Pokemon', N'34             ', N'34             ', N'2kg2           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1093, N'Denryu Mega | Từ điển Pokémon', N'', 700000.0000, N'vinhnh2312/0939e1f03014073fe58f5b80c3222ffc8592f5e0.png', N'Denryu ', N'Pokemon', N'33             ', N'20             ', N'2kg1           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1094, N'Mega Garchomp - Pokemon X and Y Guide ', N'', 1477002.0000, N'vinhnh2312/Mega_garchomp.webp', N'Garchomp ', N'Pokemon', N'25             ', N'20             ', N'2kg1           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1095, N'Mega Pokemon Jumbo Eevee', N'', 400000.0000, N'vinhnh2312/ua5y8hdo2jp7ijc6zlsp.webp', N'Jumbo ', N'Pokemon', N'34             ', N'35             ', N'1kg1           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1096, N'MEGA Pokemon Building Toy Kit Charmander Set with 3 Action Figures (300 Pieces)', N'', 900000.0000, N'vinhnh2312/MEGA-Pokemon-Building-Toy-Kit-Charmander-Set-with-3-Action-Figures-300-Pieces-for-Kids_bbee38a9-3889-406e-bcb3-2b925fddbc3f.8adae7c05a826a4f12ca0f4cfdc27111.webp', N'Charmander Set with 3 Action Figures', N'Pokemon', N'25             ', N'20             ', N'1kg2           ', 1, CAST(N'2024-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1097, N'Kamado Tanjiro', N'', 900000.0000, N'vinhnh2312/card1.png', N'Kamado Tanjiro', N'Kimetsu no Yaiba', N'15             ', N'10             ', N'900            ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1098, N'Kamado Nezuko', N'', 450000.0000, N'vinhnh2312/card2.png', N'Kamado Nezuko', N'Kimetsu no Yaiba', N'25             ', N'18             ', N'850            ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1099, N'Hashibira Inosuke', N'', 500000.0000, N'vinhnh2312/Inosuke_anime_design.webp', N'Hashibira Inosuke', N'Kimetsu no Yaiba', N'30             ', N'20             ', N'600            ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1100, N'Agatsuma Zenitsu', N'', 400000.0000, N'vinhnh2312/Zenitsu_anime_design.webp', N'Agatsuma Zenitsu', N'Kimetsu no Yaiba', N'25             ', N'20             ', N'600            ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1101, N'Kibutsuji Muzan', N'', 6000000.0000, N'vinhnh2312/Muzan_Kibutsuji_Full_Body_29.webp', N'Kibutsuji Muzan', N'Kimetsu no Yaiba', N'25             ', N'20             ', N'30             ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1102, N'Kaigaku', N'', 600000.0000, N'vinhnh2312/AN-0205-kit168.com_.jpg', N'Kaigaku', N'Kimetsu no Yaiba', N'34             ', N'20             ', N'780            ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1103, N'Shinazugawa Genya', N'', 850000.0000, N'vinhnh2312/Genya_Shinazugawa_Full_Body_29.webp', N'Shinazugawa Genya', N'Kimetsu no Yaiba', N'33             ', N'20             ', N'1kg5           ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1104, N'Shinazugawa Sanemi', N'', 900000.0000, N'vinhnh2312/Sanemi_anime_design.webp', N'Shinazugawa Sanemi', N'Kimetsu no Yaiba', N'25             ', N'23             ', N'1kg5           ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([Id], [NameProduct], [Descriptions], [Price], [Images], [CharacterName], [MageAnime], [Height], [Wight], [Gram], [IdUser], [CreateDate]) VALUES (1105, N'Iguro Obanai', N'', 400000.0000, N'vinhnh2312/Obanai_anime_design.webp', N'Iguro Obanai', N'Kimetsu no Yaiba', N'34             ', N'32             ', N'1kg5           ', 1, CAST(N'2024-01-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Position]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([Id], [Position]) VALUES (2, N'user')
INSERT [dbo].[Roles] ([Id], [Position]) VALUES (3, N'shipper')
INSERT [dbo].[Roles] ([Id], [Position]) VALUES (4, N'
staff')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SttOders] ON 

INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (1, N'Đã giao', CAST(N'2024-01-18T00:00:00.000' AS DateTime), N'Đơn hàng đã giao thành công!', 1, 6)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (2, N'Đã giao', CAST(N'2024-01-18T00:00:00.000' AS DateTime), NULL, 1, 7)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (3, N'Hủy mua', CAST(N'2024-01-18T00:00:00.000' AS DateTime), N'Sản phẩm này đã hết!', 2, 8)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (4, N'Đã giao', CAST(N'2024-01-18T00:00:00.000' AS DateTime), NULL, 1, 9)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (5, N'Đã giao', CAST(N'2024-01-18T00:00:00.000' AS DateTime), NULL, 1, 10)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (6, N'Đã giao', CAST(N'2024-01-19T00:00:00.000' AS DateTime), NULL, 1021, 11)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (7, N'Đã giao', CAST(N'2024-01-20T00:00:00.000' AS DateTime), N'Đơn hàng đã giao thành công!', 2, 12)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (8, N'Đang xử lý', CAST(N'2024-01-20T00:00:00.000' AS DateTime), NULL, 2, 13)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (9, N'Đang giao', CAST(N'2024-01-21T00:00:00.000' AS DateTime), N'Đơn hàng đang vận chuyển tới bạn
', 1, 14)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (10, N'Chờ duyệt', CAST(N'2024-01-21T00:00:00.000' AS DateTime), NULL, 2, 15)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (11, N'Hủy mua', CAST(N'2024-01-22T00:00:00.000' AS DateTime), N'Người mua hàng đã hủy vào lúc Thu Jan 25 10:26:28 ICT 2024', 1, 16)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (12, N'Chờ duyệt', CAST(N'2024-01-25T00:00:00.000' AS DateTime), NULL, 1, 17)
INSERT [dbo].[SttOders] ([Id], [Statuss], [CreateDate], [Descriptions], [IdUser], [IdInvoice]) VALUES (13, N'Chờ duyệt', CAST(N'2024-01-25T00:00:00.000' AS DateTime), NULL, 1, 18)
SET IDENTITY_INSERT [dbo].[SttOders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1, N'Nguyễn Hoàng Vinh', CAST(N'2001-12-23' AS Date), 1, N'vinhnh2312/zyro-image.png', N'0981028857     ', N'vinh.nguyenbk7979@hcmut.edu.vn', N'19A Tân Thuận Tây, phường Bình Thuận, quận 7, Tp HCM', N'vinhnh2312                    ', N'123456789                     ', CAST(N'2024-01-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (2, N'Nguyễn Thị Kim Khánh', CAST(N'2001-01-31' AS Date), 0, N'khanhntk/pngtree-user-application-avatar-black-business-picture-image_8045374.png', N'0981028857     ', N'khanhntk@gmail.com', N'Kênh T4, phường Phước Long, quận Bình Chánh, Tp HCM', N'khanhntk                      ', N'123asd                        ', CAST(N'2024-01-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1010, N'Dương Thị Thúy Lin', CAST(N'2024-01-15' AS Date), 0, N'lindtt/avatar-icon-design-vector-png_296561.jpg', N'0356987621     ', N'lindtt@gmail.com', N'44/59 Bùi Văn Ba, phường Tân Thuận Đông, quận 7, Tp Hồ Chí Minh', N'lindtt                        ', N'ádfghjkl                      ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1011, N'Nguyễn Huỳnh Kim Yến', CAST(N'2024-01-15' AS Date), 0, N'profile.jpg', N'0399989849     ', N'yenhuynh@gmail.com', N'Tân Mỹ, Tân Bình, huyện Mỏ Cày Bắc, Bến Tre', N'yen1234                       ', N'qưertyuio                     ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1012, N'Lê Tuấn Kiệt', CAST(N'2024-01-15' AS Date), 1, N'kietlt/pngtree-avatar-icon-design-vector-png-image_5243655.png', N'0366547895     ', N'kiet@gmail.com', N'22 Lê Lợi, phương 5, quận 5, Tp Hồ Chí Minh', N'kietlt                        ', N'123456789                     ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1013, N'Nguyễn Chí Tài', CAST(N'2024-01-15' AS Date), 1, N'profile.jpg', N'0322122564     ', N'tai132@gmail.com', N'55 Nguyễn Chính Thánh, phương 11, Quận 5, Tp Hồ Chí Minh', N'tai123456                     ', N'plkmjnhgbv                    ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1014, N'Nguyễn Van A', CAST(N'2024-01-15' AS Date), 1, NULL, N'0123456789     ', N'nguyenvana@example.com', N'Dia chi A', N'nguyenvana                    ', N'passwordA                     ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1016, N'Nguy?n Van C', CAST(N'2024-01-15' AS Date), 1, NULL, N'0123456787     ', N'nguyenvanc@example.com', N'Dia chi C', N'nguyenvanc                    ', N'passwordC                     ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1017, N'Nguy?n Van B', CAST(N'2024-01-15' AS Date), 0, N'hinh_anh_b.jpg', N'0123456788     ', N'nguyenvanb@example.com', N'Dia chi B', N'nguyenvanb                    ', N'passwordB                     ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1018, N'Nguy?n Van D', CAST(N'2024-01-15' AS Date), 0, N'hinh_anh_d.jpg', N'0123456786     ', N'nguyenvand@example.com', N'Dia chi D', N'nguyenvand                    ', N'passwordD                     ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1019, N'Nguy?n Van E', CAST(N'2024-01-15' AS Date), 1, NULL, N'0123456785     ', N'nguyenvane@example.com', N'Dia chi E', N'nguyenvane                    ', N'passwordE                     ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1020, N'Tr?n Th? F', CAST(N'2024-01-15' AS Date), 0, NULL, N'0123456784     ', N'tranf@example.com', N'Dia chi F', N'tranf                         ', N'passwordF                     ', CAST(N'2024-01-15T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1021, N'Nguyễn Chí Tài', CAST(N'2024-01-19' AS Date), 1, N'taifhoiwdz/pngtree-avatar-icon-design-vector-png-image_1588219.jpg', N'               ', N'taizxc123ss@gmail.com', N'19a Tân Thuận Tây, Phường Bình Thuận, Quận 7, TP HCM', N'taifhoiwdz                    ', N'0394378614                    ', CAST(N'2024-01-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Users] ([Id], [Fullname], [Birthday], [Gender], [Avatar], [Phone], [Email], [LocaAddress], [Username], [PassW], [CreateDate], [IdRole]) VALUES (1022, N'Nguyễn Kim Phúc', CAST(N'2003-12-06' AS Date), 1, N'phucnk/Muzan_Kibutsuji_Full_Body_29.webp', N'               ', N'lin.dtt@gmail.com', N'19A Tân Thuận Tây', N'phucnk                        ', N'123456789                     ', CAST(N'2024-01-22T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_CartsProduct] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_CartsProduct]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_CartsUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_CartsUser]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteProduct] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_FavoriteProduct]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_FavoriteUser]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesProduct] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_InvoicesProduct]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_InvoicesUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_InvoicesUser]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductUser]
GO
ALTER TABLE [dbo].[SttOders]  WITH CHECK ADD  CONSTRAINT [FK_StatusOrdersInvoice] FOREIGN KEY([IdInvoice])
REFERENCES [dbo].[Invoices] ([Id])
GO
ALTER TABLE [dbo].[SttOders] CHECK CONSTRAINT [FK_StatusOrdersInvoice]
GO
ALTER TABLE [dbo].[SttOders]  WITH CHECK ADD  CONSTRAINT [FK_StatusOrdersUser] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SttOders] CHECK CONSTRAINT [FK_StatusOrdersUser]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_RoleUser] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_RoleUser]
GO
USE [master]
GO
ALTER DATABASE [MageAnime] SET  READ_WRITE 
GO
