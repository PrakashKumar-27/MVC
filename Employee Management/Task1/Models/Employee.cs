namespace Task1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Employee")]
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            EmployeeAddresses = new HashSet<EmployeeAddress>();
        }

        [Key]
        public int eid { get; set; }

        [StringLength(5)]
        public string eno { get; set; }

        [Required(ErrorMessage = "Employee Name is mandatory")]
        [StringLength(50)]
        public string ename { get; set; }

        [StringLength(50)]
        public string edept { get; set; }

        [StringLength(10)]
        public string econtact { get; set; }

        [Required(ErrorMessage = "Email Address is mandatory")]
        [StringLength(50, ErrorMessage = "Max 50 characters")]
        [RegularExpression("^[a-z0-9_\\+-]+(\\.[a-z0-9_\\+-]+)*@[a-z0-9-]+(\\.[a-z0-9]+)*\\.([a-z]{2,4})$", ErrorMessage = "Invalid email format.")]
        public string eemail { get; set; }

        public byte estatus { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeAddress> EmployeeAddresses { get; set; }
    }
}
