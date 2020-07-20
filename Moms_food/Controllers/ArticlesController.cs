using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Moms_food.Data;
using Moms_food.Data.ArticlesModels;

namespace Moms_food.Controllers
{
    //[Authorize(Roles ="Admin")]
    public class ArticlesController : Controller
    {
        private Moms_FoodEntities db = new Moms_FoodEntities();

        // GET: Articles
        public ActionResult Index()
        {
            var articles = db.Articles.Include(a => a.User);
            return View(articles.ToList());
        }

        // GET: Articles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Articles articles = db.Articles.Find(id);
            if (articles == null)
            {
                return HttpNotFound();
            }
            return View(articles);
        }

        // GET: Articles/Create
        public ActionResult Create()
        {
            ViewBag.Categorie_id = new SelectList(db.Food_categories, "Id", "name");

            return View();
        }

        // POST: Articles/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        public async Task<ActionResult> Create(ArticleViewModel Art)
        {
            string idUserR = User.Identity.GetUserId();
            if (Art.Reviews == null && Art.reviews_response==null)
            {
                Articles articles = new Articles();
                try
                {

                    string fileName = Path.GetFileNameWithoutExtension(Art.ImgFile.FileName);
                    string extension = Path.GetExtension(Art.ImgFile.FileName);
                    fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                    articles.Photos = "/img/" + fileName;
                    fileName = Path.Combine(Server.MapPath("~/img"), fileName);
                    Art.ImgFile.SaveAs(fileName);
                    articles.Title = Art.Title;
                    articles.Description = Art.Description;
                    string iduser = User.Identity.GetUserId();
                    articles.UserID = db.User.FirstOrDefault(p => p.id_identity == iduser).ID;
                    articles.Date_creation = DateTime.Now;
                    articles.Status__Articles = "waiting review";

                    articles.Categorie_id = Art.Categorie_id;

                    db.Articles.Add(articles);
                    await db.SaveChangesAsync();
                    List<ingredient> ingrs = new List<ingredient>();
                    foreach (var a in Art.ingredient)
                    {
                        ingredient ingr = new ingredient();
                        ingr.ingredients = a;
                        ingr.Article_id = articles.ID;
                        ingrs.Add(ingr);
                    }

                    db.ingredient.AddRange(ingrs);
                    await db.SaveChangesAsync();
                    List<Steps> stps = new List<Steps>();
                    foreach (var a in Art.step)
                    {
                        Steps stp = new Steps();
                        stp.ArticlesID = articles.ID;
                        stp.Description = a;
                        stps.Add(stp);
                    }
                    db.Steps.AddRange(stps);
                    ingredient ing = new ingredient();
                    ing.Article_id = articles.ID;

                    ViewBag.Categorie_id = new SelectList(db.Food_categories, "Id", "name");
                    return RedirectToAction("Index");
                }
                catch (Exception e)
                {
                    ViewBag.Categorie_id = new SelectList(db.Food_categories, "Id", "name", Art.Categorie_id);

                    return View(articles);
                }
            }
            else if( Art.reviews_response==null)
            {
                Reviews rv = new Reviews();
                rv.ArticlesID = Art.ID;
               
                rv.UserID = db.User.FirstOrDefault(p => p.id_identity == idUserR).ID;
                rv.Description = Art.Reviews.Description;
                rv.note = Art.Reviews.note;
                db.Reviews.Add(rv);
                await db.SaveChangesAsync();
                return RedirectToAction("Details", new { @id = Art.ID });
            }
            else if (Art.reviews_response != null)
            {
                Art.reviews_response.UserID = db.User.FirstOrDefault(p => p.id_identity == idUserR).ID;

                db.Reviews_response.Add(Art.reviews_response);
                await db.SaveChangesAsync();
                return RedirectToAction("Details", new { @id = Art.ID });

            }
            return View("Details", Art.ID);
        }

        // GET: Articles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Articles articles = db.Articles.Find(id);
            if (articles == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.Food_categories, "ID", "Name", articles.Categorie_id);
            return View(articles);
        }

        // POST: Articles/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserID,Title,Description,Photos,Status__Articles")] Articles articles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(articles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.User, "ID", "Name", articles.UserID);
            return View(articles);
        }
        [HttpPost]
        public ActionResult CreateReviews(Reviews reviews)
        {
            return View();
        }

        // GET: Articles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Articles articles = db.Articles.Find(id);
            if (articles == null)
            {
                return HttpNotFound();
            }
            return View(articles);
        }

        // POST: Articles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Articles articles = db.Articles.Find(id);
            db.Articles.Remove(articles);
            db.SaveChanges();
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
