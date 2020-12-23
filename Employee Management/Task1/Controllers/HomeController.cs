using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Task1.Models;

namespace Task1.Controllers
{
    public class HomeController : Controller
    {
        private Model1 db = new Model1();

        public async Task<JsonResult> GetStates(int? id)
        {
            List<state> states = new List<state>();
            if (id != null)
                states = await db.states.Where(s => s.status == 1 && s.countryid == id).ToListAsync();
            else states = await db.states.Where(s => s.status == 1).ToListAsync();
            List<SelectListItem> result = new List<SelectListItem>();
            foreach (var item in states)
            {
                result.Add(
                        new SelectListItem
                        {
                            Text = Convert.ToString(item.name),
                            Value = Convert.ToString(item.id)
                        });
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public async Task<JsonResult> GetCities(int? id)
        {
            List<city> cities = new List<city>();
            if (id != null)
                cities = await db.cities.Where(s => s.status == 1 && s.stateid == id).ToListAsync();
            else cities = await db.cities.Where(s => s.status == 1).ToListAsync();
            List<SelectListItem> result = new List<SelectListItem>();
            foreach (var item in cities)
            {
                result.Add(
                        new SelectListItem
                        {
                            Text = Convert.ToString(item.name),
                            Value = Convert.ToString(item.id)
                        });

            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}