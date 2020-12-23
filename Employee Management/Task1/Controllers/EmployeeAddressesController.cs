using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Task1.Models;

namespace Task1.Controllers
{
    public class EmployeeAddressesController : Controller
    {
        private Model1 db = new Model1();

        // GET: EmployeeAddresses
        public async Task<ActionResult> Index(int? id)
        {
            var employeeAddresses = db.EmployeeAddresses.Include(e => e.city1).Include(e => e.country1).Include(e => e.Employee).Include(e => e.state1);
            if (id != null && id > 0)
                employeeAddresses.Where(e => e.eid == id);
            return View(await employeeAddresses.ToListAsync());
        }

        // GET: EmployeeAddresses/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeAddress employeeAddress = await db.EmployeeAddresses.FindAsync(id);
            if (employeeAddress == null)
            {
                return HttpNotFound();
            }
            return View(employeeAddress);
        }

        // GET: EmployeeAddresses/Create
        public ActionResult Create(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeAddress employeeAddress = new EmployeeAddress();
            ViewBag.country = new SelectList(db.countries, "id", "name");
            employeeAddress.eid = Convert.ToInt32(id);
            return View(employeeAddress);
        }

        // POST: EmployeeAddresses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(EmployeeAddress employeeAddress)
        {
            if (ModelState.IsValid)
            {
                employeeAddress.status = 1;
                db.EmployeeAddresses.Add(employeeAddress);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.country = new SelectList(db.countries, "id", "name", employeeAddress.country);
            return View(employeeAddress);
        }

        // GET: EmployeeAddresses/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeAddress employeeAddress = await db.EmployeeAddresses.FindAsync(id);
            if (employeeAddress == null)
            {
                return HttpNotFound();
            }
            BindDropDown(employeeAddress);
            return View(employeeAddress);
        }

        private void BindDropDown(EmployeeAddress employeeAddress)
        {
            ViewBag.country = new SelectList(db.countries.Where(e => e.status == 1).OrderBy(o => o.name), "id", "name", employeeAddress.country);
            ViewBag.state = new SelectList(db.states.Where(e => e.status == 1).OrderBy(o => o.name), "id", "name", employeeAddress.state);
            ViewBag.city = new SelectList(db.cities.Where(e => e.status == 1).OrderBy(o => o.name), "id", "name", employeeAddress.city);
        }
        // POST: EmployeeAddresses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(EmployeeAddress employeeAddress)
        {
            if (ModelState.IsValid)
            {
                EmployeeAddress empadd = await db.EmployeeAddresses.FindAsync(employeeAddress.id);
                if (empadd != null)
                {

                    empadd.addressline1 = employeeAddress.addressline1;
                    empadd.addressline2 = employeeAddress.addressline2;
                    empadd.landmark = employeeAddress.landmark;
                    empadd.country = employeeAddress.country;
                    empadd.state = employeeAddress.state;
                    empadd.city = employeeAddress.city;
                    empadd.pin = employeeAddress.pin;
                    empadd.contact = employeeAddress.contact;
                    empadd.ispermanant = employeeAddress.ispermanant;
                    empadd.status = employeeAddress.status;
                    db.Entry(empadd).State = EntityState.Modified;
                    await db.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
            }
            BindDropDown(employeeAddress);
            return View(employeeAddress);
        }

        // GET: EmployeeAddresses/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeAddress employeeAddress = await db.EmployeeAddresses.FindAsync(id);
            if (employeeAddress == null)
            {
                return HttpNotFound();
            }
            return View(employeeAddress);
        }

        // POST: EmployeeAddresses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            EmployeeAddress employeeAddress = await db.EmployeeAddresses.FindAsync(id);
            db.EmployeeAddresses.Remove(employeeAddress);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
