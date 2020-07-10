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
using System.IO;
using Moms_food.Data.ArticlesModels;

namespace Moms_food.Controllers
{
    public class SlidersController : Controller
    {
        private Moms_FoodEntities db = new Moms_FoodEntities();

        // GET: Sliders
        public async Task<ActionResult> Index()
        {
            var slider = db.Slider.Include(s => s.Articles);
            return View(await slider.ToListAsync());
        }

        // GET: Sliders/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slider slider = await db.Slider.FindAsync(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            return View(slider);
        }

        // GET: Sliders/Create
        public ActionResult Create()
        {
            ViewBag.Article_id = new SelectList(db.Articles, "ID", "Title");
            return View();
        }

        // POST: Sliders/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(SliderVoewModel Art)
        {
            Slider slider = new Slider();
            if (ModelState.IsValid)
            {
                string fileName = Path.GetFileNameWithoutExtension(Art.ImgFile.FileName);
                string extension = Path.GetExtension(Art.ImgFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                slider.Photo = "/img/" + fileName;
                fileName = Path.Combine(Server.MapPath("~/img"), fileName);
                Art.ImgFile.SaveAs(fileName);
                slider.link = "/Articles/details/" + Art.Article_id;
                slider.Article_id = Art.Article_id;
                db.Slider.Add(slider);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.Article_id = new SelectList(db.Articles, "ID", "Title", slider.Article_id);
            return View(slider);
        }

        // GET: Sliders/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slider slider = await db.Slider.FindAsync(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            ViewBag.Article_id = new SelectList(db.Articles, "ID", "Title", slider.Article_id);
            return View(slider);
        }

        // POST: Sliders/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Photo,link,Article_id")] Slider slider)
        {
            if (ModelState.IsValid)
            {
                db.Entry(slider).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Article_id = new SelectList(db.Articles, "ID", "Title", slider.Article_id);
            return View(slider);
        }

        // GET: Sliders/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slider slider = await db.Slider.FindAsync(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            return View(slider);
        }

        // POST: Sliders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Slider slider = await db.Slider.FindAsync(id);
            db.Slider.Remove(slider);
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
