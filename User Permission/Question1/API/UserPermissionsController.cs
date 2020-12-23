using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using Question1.Models;

namespace Question1.API
{
    public class UserPermissionsController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/UserPermissions
        public async Task<List<Models.UserPermission>> GetUserPermissions()
        {
            return await db.UserPermissions.ToListAsync();
        }

        // GET: api/UserPermissions/5
        [ResponseType(typeof(UserPermission))]
        public async Task<IHttpActionResult> GetUserPermission(int id)
        {
            UserPermission userPermission = await db.UserPermissions.FindAsync(id);
            if (userPermission == null)
            {
                return NotFound();
            }

            return Ok(userPermission);
        }

        // PUT: api/UserPermissions/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutUserPermission(int id, byte value)
        {
            UserPermission userPermission = await db.UserPermissions.FindAsync(id);
            userPermission.Status = value;
            if (id != userPermission.Id)
            {
                return BadRequest();
            }
            db.Entry(userPermission).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserPermissionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/UserPermissions
        [ResponseType(typeof(UserPermission))]
        public async Task<IHttpActionResult> PostUserPermission(UserPermission userPermission)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.UserPermissions.Add(userPermission);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = userPermission.Id }, userPermission);
        }

        // DELETE: api/UserPermissions/5
        [ResponseType(typeof(UserPermission))]
        public async Task<IHttpActionResult> DeleteUserPermission(int id)
        {
            UserPermission userPermission = await db.UserPermissions.FindAsync(id);
            if (userPermission == null)
            {
                return NotFound();
            }

            db.UserPermissions.Remove(userPermission);
            await db.SaveChangesAsync();

            return Ok(userPermission);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserPermissionExists(int id)
        {
            return db.UserPermissions.Count(e => e.Id == id) > 0;
        }
    }
}