using Moms_food.Data;
using Moms_food.Data.ArticlesModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Moms_food.Controllers
{
    public class SearchController : Controller
    {
        private Moms_FoodEntities db = new Moms_FoodEntities();
        // GET: Search
        public JsonResult GetCategorie()
        {
            List<CategorieViewModel> cvms = new List<CategorieViewModel>();
            foreach(var a in db.Food_categories.ToList())
            {
                CategorieViewModel cvm = new CategorieViewModel();
                cvm.name = a.name;
                cvm.Id = a.Id;
                cvms.Add(cvm);
            }
            return Json(cvms, JsonRequestBehavior.AllowGet);
        }
    }
}