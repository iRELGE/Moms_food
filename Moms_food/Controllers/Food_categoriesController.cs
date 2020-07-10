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

namespace Moms_food.Controllers
{
    public class Food_categoriesController : Controller
    {
        private Moms_FoodEntities db = new Moms_FoodEntities();

        // GET: Food_categories
        public async Task<ActionResult> Index()
        {
            return View(await db.Food_categories.ToListAsync());
        }

        // GET: Food_categories/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food_categories food_categories = await db.Food_categories.FindAsync(id);
            if (food_categories == null)
            {
                return HttpNotFound();
            }
            return View(food_categories);
        }

        // GET: Food_categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Food_categories/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,name,Date_creation,Description")] Food_categories food_categories)
        {
            if (ModelState.IsValid)
            {
                food_categories.Date_creation = DateTime.Now;
                db.Food_categories.Add(food_categories);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(food_categories);
        }

        // GET: Food_categories/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food_categories food_categories = await db.Food_categories.FindAsync(id);
            if (food_categories == null)
            {
                return HttpNotFound();
            }
            return View(food_categories);
        }

        // POST: Food_categories/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,name,Date_creation,Description")] Food_categories food_categories)
        {
            if (ModelState.IsValid)
            {
                db.Entry(food_categories).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(food_categories);
        }

        // GET: Food_categories/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food_categories food_categories = await db.Food_categories.FindAsync(id);
            if (food_categories == null)
            {
                return HttpNotFound();
            }
            return View(food_categories);
        }

        // POST: Food_categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Food_categories food_categories = await db.Food_categories.FindAsync(id);
            db.Food_categories.Remove(food_categories);
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
