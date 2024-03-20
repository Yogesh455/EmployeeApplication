using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Employee.Web.UI.Models
{
    public partial class TblEmployeeDetail
    {
        [Key]
        public int EmployeeId { get; set; }

        [Required]
        public string? FirstName { get; set; }

        [Required]
        public string? LastName { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [DisplayName("Email Address")]
        public string? Email { get; set; }

        [Required]
        [RegularExpression(@"^\d{10}$", ErrorMessage = "Please enter a valid 10-digit phone number.")]
        [MaxLength(10)]
        public string? Phone { get; set; }


        [DisplayName("Deparment Name")]
        public int? DepartmentId { get; set; }

        [Required]
        [DataType(DataType.DateTime)]
        public DateTime? HireDate { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }

        public virtual TblDepartmentDetail? Department { get; set; }
    }
}
