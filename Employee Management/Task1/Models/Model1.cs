namespace Task1.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<city> cities { get; set; }
        public virtual DbSet<country> countries { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<EmployeeAddress> EmployeeAddresses { get; set; }
        public virtual DbSet<state> states { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<city>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<city>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<city>()
                .HasMany(e => e.EmployeeAddresses)
                .WithOptional(e => e.city1)
                .HasForeignKey(e => e.city);

            modelBuilder.Entity<country>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<country>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<country>()
                .HasMany(e => e.cities)
                .WithRequired(e => e.country)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<country>()
                .HasMany(e => e.EmployeeAddresses)
                .WithOptional(e => e.country1)
                .HasForeignKey(e => e.country);

            modelBuilder.Entity<country>()
                .HasMany(e => e.states)
                .WithRequired(e => e.country)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.eno)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.ename)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.edept)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.econtact)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.eemail)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .HasMany(e => e.EmployeeAddresses)
                .WithRequired(e => e.Employee)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EmployeeAddress>()
                .Property(e => e.addressline1)
                .IsUnicode(false);

            modelBuilder.Entity<EmployeeAddress>()
                .Property(e => e.addressline2)
                .IsUnicode(false);

            modelBuilder.Entity<EmployeeAddress>()
                .Property(e => e.landmark)
                .IsUnicode(false);

            modelBuilder.Entity<EmployeeAddress>()
                .Property(e => e.pin)
                .IsUnicode(false);

            modelBuilder.Entity<EmployeeAddress>()
                .Property(e => e.contact)
                .IsUnicode(false);

            modelBuilder.Entity<state>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<state>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<state>()
                .HasMany(e => e.cities)
                .WithRequired(e => e.state)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<state>()
                .HasMany(e => e.EmployeeAddresses)
                .WithOptional(e => e.state1)
                .HasForeignKey(e => e.state);
        }
    }
}
