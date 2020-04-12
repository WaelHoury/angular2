using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace WebApplication5.Models
{
    public partial class productsContext : DbContext
    {
        public productsContext()
        {
        }

        public productsContext(DbContextOptions<productsContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Dog> Dog { get; set; }
        public virtual DbSet<Dog1> Dog1 { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<Purchases> Purchases { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseNpgsql("Host=localhost;Database=products;Username=postgres;Password=test123");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Dog>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("dog");

                entity.Property(e => e.Breed)
                    .HasColumnName("breed")
                    .HasMaxLength(255);

                entity.Property(e => e.Count)
                    .HasColumnName("count")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsVaccinated).HasColumnName("is_vaccinated");

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<Dog1>(entity =>
            {
                entity.HasKey(x => x.Index)
                    .HasName("dog1_pkey");

                entity.ToTable("dog1");

                entity.Property(e => e.Index).HasColumnName("index");

                entity.Property(e => e.Breed)
                    .HasColumnName("breed")
                    .HasMaxLength(255);

                entity.Property(e => e.Count)
                    .HasColumnName("count")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.IsVaccinated).HasColumnName("is_vaccinated");

                entity.Property(e => e.Name1)
                    .HasColumnName("name1")
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(x => x.PId)
                    .HasName("product_pkey");

                entity.ToTable("product");

                entity.HasIndex(x => x.PName)
                    .HasName("product_p_name_key")
                    .IsUnique();

                entity.Property(e => e.PId).HasColumnName("p_id");

                entity.Property(e => e.Count)
                    .HasColumnName("count")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.PDesc)
                    .IsRequired()
                    .HasColumnName("p_desc")
                    .HasMaxLength(500);

                entity.Property(e => e.PName)
                    .IsRequired()
                    .HasColumnName("p_name")
                    .HasMaxLength(25);
            });

            modelBuilder.Entity<Purchases>(entity =>
            {
                entity.ToTable("purchases");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.xCreatedAt)
                    .HasColumnName("created_at")
                    .HasColumnType("timestamp with time zone")
                    .HasDefaultValueSql("now()");

                entity.Property(e => e.Idprod)
                    .HasColumnName("idprod")
                    .ValueGeneratedOnAdd();
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
