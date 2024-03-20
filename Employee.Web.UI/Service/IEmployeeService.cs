using Employee.Web.UI.Models;
using System;

namespace Employee.Web.UI.Service
{
    public interface IEmployeeService
    {
        List<TblEmployeeDetail> GetEmployees();
        TblEmployeeDetail GetEmployeeDetail(int id);
        List<TblDepartmentDetail> GetDepartments();
        int SaveEmployees(string? FirstName, string? LastName, string? Email, string? Phone, int? DepartmentId, DateTime? HireDate);
        int DeleteEmployees(int? EmployeeId);
        int UpdateEmployees(int? EmployeeId, string? FirstName, string? LastName, string? Email, string? Phone, int? DepartmentId, DateTime? HireDate);

    }
}
