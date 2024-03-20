using Employee.Web.UI.Models;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using System;

namespace Employee.Web.UI.Service
{
    public class EmployeeService : IEmployeeService
    {
        public EmployeeDBContext employeeDBContext;
        public EmployeeService(EmployeeDBContext _employeeDBContext)
        {
            employeeDBContext = _employeeDBContext;
        }    
        public int DeleteEmployees(int? EmployeeId)
        {
           return employeeDBContext.Database.ExecuteSqlRaw("EXEC dbo.DeletedEmployeeRecords {0}", EmployeeId);
        }

        public List<TblDepartmentDetail> GetDepartments()
        {
            var DepartmentDetails = employeeDBContext.TblDepartmentDetails.FromSqlRaw<TblDepartmentDetail>("GetDepartmentRecords").ToList();
            return DepartmentDetails;
        }

        public TblEmployeeDetail GetEmployeeDetail(int id)
        {
           var recordTblEmployeeDetails = employeeDBContext.TblEmployeeDetails.FromSqlRaw<TblEmployeeDetail>("GetEmployeeRecordsByID {0}", id).ToList().FirstOrDefault();
            if (recordTblEmployeeDetails != null)
            {
                return recordTblEmployeeDetails;
            }
            else 
            {
                return null;
            }
        }

        public List<TblEmployeeDetail> GetEmployees()
        {
            return employeeDBContext.TblEmployeeDetails.FromSqlRaw<TblEmployeeDetail>("GetEmployeeRecords").ToList();
        }

        public int SaveEmployees(string? FirstName, string? LastName, string? Email, string? Phone, int? DepartmentId, DateTime? HireDate)
        {
           return employeeDBContext.Database.ExecuteSqlRaw("EXEC dbo.InsertEmployeeRecords {0}, {1}, {2}, {3}, {4}, {5}", FirstName, LastName, Email, Phone, DepartmentId, HireDate);

        }

        public int UpdateEmployees(int? EmployeeId, string? FirstName, string? LastName, string? Email, string? Phone, int? DepartmentId, DateTime? HireDate)
        {
           return employeeDBContext.Database.ExecuteSqlRaw("EXEC dbo.UpdateEmployeeRecords {0}, {1}, {2}, {3}, {4}, {5}, {6}", EmployeeId, FirstName, LastName, Email, Phone, DepartmentId, HireDate);

        }
    }
}
