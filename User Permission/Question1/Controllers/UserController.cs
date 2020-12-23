using Question1.API;
using Question1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Question1.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public async Task<ActionResult> Index()
        {
            UsersController usersController = new UsersController();
            List<User> users =await usersController.GetUsers();
            return View(users);
        }

        public async Task<ActionResult> Userpermission()
        {
            UserPermissionsController permissionsController = new UserPermissionsController();
            List<UserPermission> userPermissions = await permissionsController.GetUserPermissions();
            return View(userPermissions);
        }

        

        [HttpPost]
        public async Task<ActionResult> updatepermissionAsync(int Id, byte Value)
        {
            try
            {
                UserPermissionsController permissionsController = new UserPermissionsController();
                var userPermissions = await permissionsController.PutUserPermission(Id, Value);
                return RedirectToAction("Userpermission");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }
        // GET: User/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: User/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: User/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: User/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: User/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: User/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: User/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
