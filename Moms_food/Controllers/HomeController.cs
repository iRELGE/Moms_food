using Moms_food.Data;
using Moms_food.Data.ArticlesModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Moms_food.Controllers
{
    public class HomeController : Controller
    {
        private Moms_FoodEntities db = new Moms_FoodEntities();
        public ActionResult Index()
        {
            HomeViewModel hvm = new HomeViewModel();
            hvm.article= db.Articles.ToList();
            hvm.slider = db.Slider.ToList();
            return View(hvm);
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
    }
}