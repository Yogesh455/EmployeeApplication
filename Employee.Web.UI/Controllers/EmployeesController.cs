using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Employee.Web.UI.Models;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore;
using System.Collections;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using Employee.Web.UI.Service;

namespace Employee.Web.UI.Controllers
{
    public class EmployeesController : Controller
    {
        public IEmployeeService employeeService;

        public EmployeesController(EmployeeService _employeeService) {
            employeeService = _employeeService;
        }

        // GET: EmployeesController
        public ActionResult Index(int pageNo=1)
        {
            var DepartmentDetails = employeeService.GetDepartments().ToList();

           var recordCount = employeeService.GetEmployees().Count();
            var empRecord = employeeService.GetEmployees().ToList();

            int NoofRecordPerPage = 5;
            int NoofPages = Convert.ToInt32(Math.Ceiling(Convert.ToDouble(recordCount)/Convert.ToDouble(NoofRecordPerPage)));
            int NoofRecordToSkip = (pageNo-1)* NoofRecordPerPage;

            ViewBag.PageNo = pageNo;
            ViewBag.NoofPages = NoofPages;
            empRecord= empRecord.Skip(NoofRecordToSkip).Take(NoofRecordPerPage).ToList();

            return View(empRecord);
            //return View(employeeService.GetEmployees().ToList());
        }

        // GET: EmployeesController/Details/5
        public ActionResult Details(int id)
        {
          
            var record = employeeService.GetEmployeeDetail(id);

            if (record != null) 
            {
               var value = employeeService.GetDepartments().Where(x=>x.Id==record.DepartmentId).ToList().FirstOrDefault();
                if (value != null)
                {
                    record.Department.DeparmentName = value.DeparmentName;
                }
            }

            return View(record);
        }

        // GET: EmployeesController/Create
        public ActionResult Create()
        {
            var DepartmentDetails = employeeService.GetDepartments().ToList();

            ViewBag.DepartmentDetails = new SelectList(DepartmentDetails.ToList(), "Id", "DeparmentName");

            return View();
        }

        // POST: EmployeesController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {

                TblEmployeeDetail objemp = new TblEmployeeDetail();
                {
                    objemp.FirstName = collection["FirstName"].ToString();
                    objemp.LastName = collection["LastName"].ToString();
                    objemp.Email = collection["Email"].ToString();
                    objemp.Phone = collection["Phone"].ToString();
                    objemp.DepartmentId = Convert.ToInt32(collection["DepartmentId"]);
                    objemp.HireDate = Convert.ToDateTime(collection["HireDate"]);
                    objemp.EmployeeId = 0;
                    objemp.CreatedDate = DateTime.Now;
                }

                employeeService.SaveEmployees(objemp.FirstName, objemp.LastName, objemp.Email, objemp.Phone, objemp.DepartmentId, objemp.HireDate);

                var DepartmentDetails = employeeService.GetDepartments().ToList();
                ViewBag.DepartmentDetails = new SelectList(DepartmentDetails.ToList(), "Id", "DeparmentName");
                return View("Create");
            }
            catch
            {
                var DepartmentDetails = employeeService.GetDepartments().ToList();
                ViewBag.DepartmentDetails = new SelectList(DepartmentDetails.ToList(), "Id", "DeparmentName");
                ViewBag.ErrorMessage = "Something Went Wrong";
                return View();
            }
        }

        // GET: EmployeesController/Edit/5
        public ActionResult Edit(int id)
        {

            var DepartmentDetails = employeeService.GetDepartments().ToList();
            ViewBag.DepartmentDetails = new SelectList(DepartmentDetails.ToList(), "Id", "DeparmentName");
            var record = employeeService.GetEmployeeDetail(id);

            if (record != null)
            {
                var value = employeeService.GetDepartments().Where(x => x.Id == record.DepartmentId).ToList().FirstOrDefault();
                if (value != null)
                {
                    record.Department.DeparmentName = value.DeparmentName;
                }
            }

            return View(record);
        }

        // POST: EmployeesController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {

                // Retrieve the related TblEmployee entity based on employee ID
                  int EmpId = Convert.ToInt32(collection["EmployeeId"]); // Assuming you have the EmployeeId in your collection
                var employeeRec = employeeService.GetEmployeeDetail(id);

                if (employeeRec != null)
                {
                    employeeRec.FirstName = collection["FirstName"].ToString();
                    employeeRec.LastName = collection["LastName"].ToString();
                    employeeRec.Email = collection["Email"].ToString();
                    employeeRec.Phone = collection["Phone"].ToString();
                    employeeRec.DepartmentId = Convert.ToInt32(collection["DepartmentId"]);
                    employeeRec.HireDate = Convert.ToDateTime(collection["HireDate"]);
                    employeeRec.EmployeeId = EmpId;
                    employeeRec.UpdatedDate = DateTime.Now;
                }

                employeeService.UpdateEmployees(employeeRec.EmployeeId, employeeRec.FirstName, employeeRec.LastName, employeeRec.Email, employeeRec.Phone, employeeRec.DepartmentId, employeeRec.HireDate);

                return RedirectToAction("Index");
            }
            catch
            {
                var DepartmentDetails = employeeService.GetDepartments().ToList();
                ViewBag.DepartmentDetails = new SelectList(DepartmentDetails.ToList(), "Id", "DeparmentName");
                ViewBag.ErrorMessage = "Something Went Wrong";
                return View("Index");
            }
        }

        // GET: EmployeesController/Delete/5
        public ActionResult Delete(int id)
        {
            var record = employeeService.GetEmployeeDetail(id);

            if (record != null)
            {
                var value = employeeService.GetDepartments().Where(x => x.Id == record.DepartmentId).ToList().FirstOrDefault();
                if (value != null)
                {
                    record.Department.DeparmentName = value.DeparmentName;
                }
            }
            return View(record);
        }

        // POST: EmployeesController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                employeeService.DeleteEmployees(id);

                return RedirectToAction("Index");
            }
            catch
            {
                return View("Index");
            }
        }
    }
}
