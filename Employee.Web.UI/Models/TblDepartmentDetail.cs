using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Employee.Web.UI.Models
{
    public partial class TblDepartmentDetail
    {
        public TblDepartmentDetail()
        {
            TblEmployeeDetails = new HashSet<TblEmployeeDetail>();
        }

        public int Id { get; set; }

        [DisplayName("Deparment Name")]
        public string? DeparmentName { get; set; }
        public DateTime? CreatedDate { get; set; }

        public virtual ICollection<TblEmployeeDetail> TblEmployeeDetails { get; set; }
    }
}
