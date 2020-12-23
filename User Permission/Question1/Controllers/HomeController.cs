using Question1.API;
using Question1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Mvc;

namespace Question1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }


        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session["user"] = null;
            return RedirectToAction("Login");
        }

        // POST: api/Users
        [ResponseType(typeof(User))]
        public async Task<ActionResult> PostLogin(User user)
        {
            User _user = new User();
            ModelState["Name"].Errors.Clear();
            if (!ModelState.IsValid)
            {
                Session["user"] = null;
                return RedirectToAction("Login");
            }
            else
            {
                UsersController usersController = new UsersController();
                _user = await usersController.GetUser(user.Username, user.Password);
                if(_user==null)
                {
                    return RedirectToAction("Login");
                }
                Session["user"] = _user;
                return RedirectToAction("Index", "Home");
               
            }
        }

        private IHttpActionResult BadRequest(ModelStateDictionary modelState)
        {
            throw new NotImplementedException();
        }
    }
}