namespace Question1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class UserPermission
    {
        public int Id { get; set; }

        public int RoleID { get; set; }

        [Required]
        [StringLength(50)]
        public string Page { get; set; }

        [Required]
        [StringLength(50)]
        public string Controller { get; set; }

        [Required]
        [StringLength(50)]
        public string Action { get; set; }

        public byte Status { get; set; }

        public virtual Role Role { get; set; }
    }
}
