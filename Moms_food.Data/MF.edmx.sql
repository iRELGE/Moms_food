
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/03/2020 15:29:57
-- Generated from EDMX file: C:\Users\rabia\source\repos\Moms_food\Moms_food.Data\MF.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Moms_Food];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Articles_categ]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_Articles_categ];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_ingredient_ToArticles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ingredient] DROP CONSTRAINT [FK_ingredient_ToArticles];
GO
IF OBJECT_ID(N'[dbo].[FK_Slider_ToArticle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Slider] DROP CONSTRAINT [FK_Slider_ToArticle];
GO
IF OBJECT_ID(N'[dbo].[FK_User_identityId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_identityId];
GO
IF OBJECT_ID(N'[dbo].[FK_FKArticles_T473217]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles_Tag] DROP CONSTRAINT [FK_FKArticles_T473217];
GO
IF OBJECT_ID(N'[dbo].[FK_FKArticles_T79318]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles_Tag] DROP CONSTRAINT [FK_FKArticles_T79318];
GO
IF OBJECT_ID(N'[dbo].[FK_FKArticles220110]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_FKArticles220110];
GO
IF OBJECT_ID(N'[dbo].[FK_FKPhotos857504]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Photos] DROP CONSTRAINT [FK_FKPhotos857504];
GO
IF OBJECT_ID(N'[dbo].[FK_FKReviews156781]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_FKReviews156781];
GO
IF OBJECT_ID(N'[dbo].[FK_FKReviews92030]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews] DROP CONSTRAINT [FK_FKReviews92030];
GO
IF OBJECT_ID(N'[dbo].[FK_FKReviews-re306697]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews-response] DROP CONSTRAINT [FK_FKReviews-re306697];
GO
IF OBJECT_ID(N'[dbo].[FK_FKReviews-re484737]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reviews-response] DROP CONSTRAINT [FK_FKReviews-re484737];
GO
IF OBJECT_ID(N'[dbo].[FK_FKSteps414313]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Steps] DROP CONSTRAINT [FK_FKSteps414313];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[Articles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articles];
GO
IF OBJECT_ID(N'[dbo].[Articles_Tag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articles_Tag];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Contact]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contact];
GO
IF OBJECT_ID(N'[dbo].[Food_categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Food_categories];
GO
IF OBJECT_ID(N'[dbo].[ingredient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ingredient];
GO
IF OBJECT_ID(N'[dbo].[Photos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Photos];
GO
IF OBJECT_ID(N'[dbo].[Reviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reviews];
GO
IF OBJECT_ID(N'[dbo].[Reviews-response]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reviews-response];
GO
IF OBJECT_ID(N'[dbo].[Slider]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Slider];
GO
IF OBJECT_ID(N'[dbo].[Steps]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Steps];
GO
IF OBJECT_ID(N'[dbo].[Table]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Table];
GO
IF OBJECT_ID(N'[dbo].[Tag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tag];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'Articles'
CREATE TABLE [dbo].[Articles] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [Title] varchar(255)  NULL,
    [Description] varchar(255)  NULL,
    [Photos] varchar(255)  NULL,
    [Status__Articles] varchar(255)  NULL,
    [Date_creation] datetime  NULL,
    [Categorie_id] int  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Contact'
CREATE TABLE [dbo].[Contact] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NULL,
    [Email] nvarchar(250)  NULL,
    [Subject] nvarchar(250)  NULL,
    [Message] nvarchar(1000)  NULL
);
GO

-- Creating table 'Food_categories'
CREATE TABLE [dbo].[Food_categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(200)  NOT NULL,
    [Date_creation] datetime  NULL,
    [Description] nvarchar(500)  NULL
);
GO

-- Creating table 'ingredient'
CREATE TABLE [dbo].[ingredient] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ingredients] nvarchar(1000)  NULL,
    [Article_id] int  NULL
);
GO

-- Creating table 'Photos'
CREATE TABLE [dbo].[Photos] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [StepsID] int  NOT NULL,
    [Photos1] varchar(255)  NULL,
    [Name] varchar(255)  NULL
);
GO

-- Creating table 'Reviews'
CREATE TABLE [dbo].[Reviews] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ArticlesID] int  NOT NULL,
    [UserID] int  NOT NULL,
    [Description] varchar(255)  NULL,
    [Photos] varchar(255)  NULL,
    [note] float  NULL
);
GO

-- Creating table 'Reviews_response'
CREATE TABLE [dbo].[Reviews_response] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ReviewsID] int  NOT NULL,
    [UserID] int  NOT NULL,
    [Description] varchar(255)  NULL,
    [Photos] varchar(255)  NULL,
    [note] float  NULL
);
GO

-- Creating table 'Slider'
CREATE TABLE [dbo].[Slider] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Photo] nvarchar(100)  NULL,
    [link] nvarchar(150)  NULL,
    [Article_id] int  NULL
);
GO

-- Creating table 'Steps'
CREATE TABLE [dbo].[Steps] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ArticlesID] int  NOT NULL,
    [Title] varchar(255)  NULL,
    [Description] varchar(255)  NULL
);
GO

-- Creating table 'Table'
CREATE TABLE [dbo].[Table] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NULL,
    [Email] nvarchar(250)  NULL,
    [Subject] nvarchar(250)  NULL,
    [Message] nvarchar(1000)  NULL
);
GO

-- Creating table 'Tag'
CREATE TABLE [dbo].[Tag] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NULL,
    [Icon] varchar(255)  NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NULL,
    [LastName] varchar(255)  NULL,
    [Sexe] varchar(255)  NULL,
    [Country] varchar(255)  NULL,
    [City] varchar(255)  NULL,
    [Adress] varchar(255)  NULL,
    [Telephone] varchar(255)  NULL,
    [Email] varchar(255)  NULL,
    [IsBanned] bit  NOT NULL,
    [Status] varchar(255)  NULL,
    [photo] varchar(255)  NULL,
    [id_identity] nvarchar(128)  NOT NULL,
    [About] nvarchar(1000)  NULL,
    [Date_inscription] datetime  NULL
);
GO

-- Creating table 'Articles_Tag'
CREATE TABLE [dbo].[Articles_Tag] (
    [Tag_ID] int  NOT NULL,
    [Articles_ID] int  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [ID] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [PK_Articles]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contact'
ALTER TABLE [dbo].[Contact]
ADD CONSTRAINT [PK_Contact]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Food_categories'
ALTER TABLE [dbo].[Food_categories]
ADD CONSTRAINT [PK_Food_categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ingredient'
ALTER TABLE [dbo].[ingredient]
ADD CONSTRAINT [PK_ingredient]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [PK_Photos]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [PK_Reviews]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Reviews_response'
ALTER TABLE [dbo].[Reviews_response]
ADD CONSTRAINT [PK_Reviews_response]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'Slider'
ALTER TABLE [dbo].[Slider]
ADD CONSTRAINT [PK_Slider]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Steps'
ALTER TABLE [dbo].[Steps]
ADD CONSTRAINT [PK_Steps]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'Table'
ALTER TABLE [dbo].[Table]
ADD CONSTRAINT [PK_Table]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Tag'
ALTER TABLE [dbo].[Tag]
ADD CONSTRAINT [PK_Tag]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Tag_ID], [Articles_ID] in table 'Articles_Tag'
ALTER TABLE [dbo].[Articles_Tag]
ADD CONSTRAINT [PK_Articles_Tag]
    PRIMARY KEY CLUSTERED ([Tag_ID], [Articles_ID] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Categorie_id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_Articles_categ]
    FOREIGN KEY ([Categorie_id])
    REFERENCES [dbo].[Food_categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Articles_categ'
CREATE INDEX [IX_FK_Articles_categ]
ON [dbo].[Articles]
    ([Categorie_id]);
GO

-- Creating foreign key on [Article_id] in table 'ingredient'
ALTER TABLE [dbo].[ingredient]
ADD CONSTRAINT [FK_ingredient_ToArticles]
    FOREIGN KEY ([Article_id])
    REFERENCES [dbo].[Articles]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ingredient_ToArticles'
CREATE INDEX [IX_FK_ingredient_ToArticles]
ON [dbo].[ingredient]
    ([Article_id]);
GO

-- Creating foreign key on [Article_id] in table 'Slider'
ALTER TABLE [dbo].[Slider]
ADD CONSTRAINT [FK_Slider_ToArticle]
    FOREIGN KEY ([Article_id])
    REFERENCES [dbo].[Articles]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Slider_ToArticle'
CREATE INDEX [IX_FK_Slider_ToArticle]
ON [dbo].[Slider]
    ([Article_id]);
GO

-- Creating foreign key on [UserID] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_FKArticles220110]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[User]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKArticles220110'
CREATE INDEX [IX_FK_FKArticles220110]
ON [dbo].[Articles]
    ([UserID]);
GO

-- Creating foreign key on [ArticlesID] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_FKReviews156781]
    FOREIGN KEY ([ArticlesID])
    REFERENCES [dbo].[Articles]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKReviews156781'
CREATE INDEX [IX_FK_FKReviews156781]
ON [dbo].[Reviews]
    ([ArticlesID]);
GO

-- Creating foreign key on [ArticlesID] in table 'Steps'
ALTER TABLE [dbo].[Steps]
ADD CONSTRAINT [FK_FKSteps414313]
    FOREIGN KEY ([ArticlesID])
    REFERENCES [dbo].[Articles]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKSteps414313'
CREATE INDEX [IX_FK_FKSteps414313]
ON [dbo].[Steps]
    ([ArticlesID]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [id_identity] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [FK_User_identityId]
    FOREIGN KEY ([id_identity])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_User_identityId'
CREATE INDEX [IX_FK_User_identityId]
ON [dbo].[User]
    ([id_identity]);
GO

-- Creating foreign key on [StepsID] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [FK_FKPhotos857504]
    FOREIGN KEY ([StepsID])
    REFERENCES [dbo].[Steps]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKPhotos857504'
CREATE INDEX [IX_FK_FKPhotos857504]
ON [dbo].[Photos]
    ([StepsID]);
GO

-- Creating foreign key on [UserID] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [FK_FKReviews92030]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[User]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKReviews92030'
CREATE INDEX [IX_FK_FKReviews92030]
ON [dbo].[Reviews]
    ([UserID]);
GO

-- Creating foreign key on [ReviewsID] in table 'Reviews_response'
ALTER TABLE [dbo].[Reviews_response]
ADD CONSTRAINT [FK_FKReviews_re484737]
    FOREIGN KEY ([ReviewsID])
    REFERENCES [dbo].[Reviews]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKReviews_re484737'
CREATE INDEX [IX_FK_FKReviews_re484737]
ON [dbo].[Reviews_response]
    ([ReviewsID]);
GO

-- Creating foreign key on [UserID] in table 'Reviews_response'
ALTER TABLE [dbo].[Reviews_response]
ADD CONSTRAINT [FK_FKReviews_re306697]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[User]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FKReviews_re306697'
CREATE INDEX [IX_FK_FKReviews_re306697]
ON [dbo].[Reviews_response]
    ([UserID]);
GO

-- Creating foreign key on [Tag_ID] in table 'Articles_Tag'
ALTER TABLE [dbo].[Articles_Tag]
ADD CONSTRAINT [FK_Articles_Tag_Tag]
    FOREIGN KEY ([Tag_ID])
    REFERENCES [dbo].[Tag]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Articles_ID] in table 'Articles_Tag'
ALTER TABLE [dbo].[Articles_Tag]
ADD CONSTRAINT [FK_Articles_Tag_Articles]
    FOREIGN KEY ([Articles_ID])
    REFERENCES [dbo].[Articles]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Articles_Tag_Articles'
CREATE INDEX [IX_FK_Articles_Tag_Articles]
ON [dbo].[Articles_Tag]
    ([Articles_ID]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------