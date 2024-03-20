namespace Employee.Web.UI.Models
{
    public class EmployeeDetailAll
    {
        public int EmployeeId { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public int? DepartmentId { get; set; }
        public DateTime? HireDate { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }

        public string? DeparmentName { get; set; }
    }
}
