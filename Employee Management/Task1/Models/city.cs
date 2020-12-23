namespace Task1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("city")]
    public partial class city
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public city()
        {
            EmployeeAddresses = new HashSet<EmployeeAddress>();
        }

        public int id { get; set; }

        public int countryid { get; set; }

        public int stateid { get; set; }

        [Required]
        [StringLength(3)]
        public string code { get; set; }

        [Required]
        [StringLength(50)]
        public string name { get; set; }

        public byte status { get; set; }

        public virtual country country { get; set; }

        public virtual state state { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmployeeAddress> EmployeeAddresses { get; set; }
    }
}
