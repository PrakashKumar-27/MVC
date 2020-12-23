namespace Task1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EmployeeAddress")]
    public partial class EmployeeAddress
    {
        public int id { get; set; }

        public int eid { get; set; }

        public bool ispermanant { get; set; }

        [StringLength(500)]
        public string addressline1 { get; set; }

        [StringLength(500)]
        public string addressline2 { get; set; }

        [StringLength(50)]
        public string landmark { get; set; }

        public int? country { get; set; }

        public int? state { get; set; }

        public int? city { get; set; }

        [StringLength(50)]
        public string pin { get; set; }

        [StringLength(15)]
        public string contact { get; set; }

        public byte status { get; set; }

        public virtual city city1 { get; set; }

        public virtual country country1 { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual state state1 { get; set; }
    }
}
