﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Moms_food.Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Moms_FoodEntities : DbContext
    {
        public Moms_FoodEntities()
            : base("name=Moms_FoodEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<Articles> Articles { get; set; }
        public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<Contact> Contact { get; set; }
        public virtual DbSet<Food_categories> Food_categories { get; set; }
        public virtual DbSet<ingredient> ingredient { get; set; }
        public virtual DbSet<Photos> Photos { get; set; }
        public virtual DbSet<Reviews> Reviews { get; set; }
        public virtual DbSet<Reviews_response> Reviews_response { get; set; }
        public virtual DbSet<Slider> Slider { get; set; }
        public virtual DbSet<Steps> Steps { get; set; }
        public virtual DbSet<Table> Table { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<User> User { get; set; }
    }
}
