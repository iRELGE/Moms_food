using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Moms_food.Data;
using Moms_food.Data.ArticlesModels;
using System.IO;
using System.Data.Entity.Migrations;
using Microsoft.AspNet.Identity;

namespace Moms_food.Controllers
{
    [Authorize]
    public class UsersController : Controller
    {
        private Moms_FoodEntities db = new Moms_FoodEntities();

        // GET: Users
        public async Task<ActionResult> Index()
        {
            var user = db.User.Include(u => u.AspNetUsers);
            return View(await user.ToListAsync());
        }

        // GET: Users/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = await db.User.FindAsync(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            ViewBag.id_identity = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Users/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ID,Name,LastName,Sexe,Country,City,Adress,Telephone,Email,IsBanned,Status,photo,id_identity")] User user)
        {
            if (ModelState.IsValid)
            {
                db.User.Add(user);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.id_identity = new SelectList(db.AspNetUsers, "Id", "Email", user.id_identity);
            return View(user);
        }

        // GET: Users/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
           
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            List<string> Sexe = new List<string>();
            Sexe.Add("Man");
            Sexe.Add("Women");
            User user = await db.User.FindAsync(id);
            ViewBag.City = new SelectList("Value", "City");
            ViewBag.Country = new SelectList("Value", "Country");
          
            if (user == null)
            {
                return HttpNotFound();
            }
           
            return View(user);
        }
        #region getUser info
        public JsonResult GetUserInfo()
        {
            string idUser = User.Identity.GetUserId();

            UserViewModel us = new UserViewModel();
            var infos = db.User.FirstOrDefault(p => p.id_identity == idUser);

            us.photo = infos.photo;
            us.ID = infos.ID;

            return Json(us, JsonRequestBehavior.AllowGet);
        }
        #endregion

        // POST: Users/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit( UserViewModel user)
        {
            User us = new User();
            var userInfo = db.User.Find(user.ID);
            if (user.ImgFile != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(user.ImgFile.FileName);
                string extension = Path.GetExtension(user.ImgFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                us.photo = "/img/" + fileName;
                fileName = Path.Combine(Server.MapPath("~/img"), fileName);
                user.ImgFile.SaveAs(fileName);
            }
            else
            {
                us.photo = userInfo.photo;
            }
           
            us.ID = user.ID;
            us.Name = user.Name;
            us.LastName = user.LastName;
           
            us.Sexe = user.Sexe;
            if (user.Country != null)
            {
                us.Country = user.Country;
                us.City = user.City;
            }
            else
            {
                us.Country = userInfo.Country;
                us.City = userInfo.City;
            }
            us.Adress = user.Adress;
            us.Telephone = user.Telephone;
            us.Email = user.Email;
            us.IsBanned = user.IsBanned;
            us.Status = user.Status;
            us.id_identity = user.id_identity;
            us.About = user.About;
            us.Date_inscription = userInfo.Date_inscription;


            try
            {
                db.Set<User>().AddOrUpdate(us);
                await db.SaveChangesAsync();
                ViewBag.City = new SelectList("Value", "City");
                ViewBag.Country = new SelectList("Value", "Country");
                return RedirectToAction("Index", "Home");
            }
            catch (Exception e)
            {
                ViewBag.City = new SelectList("Value", "City");
                ViewBag.Country = new SelectList("Value", "Country");
                return View(user);
            }
           
        }

        // GET: Users/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = await db.User.FindAsync(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            User user = await db.User.FindAsync(id);
            db.User.Remove(user);
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
