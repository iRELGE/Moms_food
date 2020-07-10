using Moms_food.Data;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Moms_food.Controllers
{
    public class RecipesController : Controller
    {
        private Moms_FoodEntities db = new Moms_FoodEntities();
        // GET: Recipes
        public  ActionResult Index(string search, int? i)
        {
            
            return View(db.Articles.ToList().ToPagedList(i ?? 1, 12));
            
        }
    }
}