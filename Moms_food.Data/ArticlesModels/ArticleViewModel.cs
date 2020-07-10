using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;


namespace Moms_food.Data.ArticlesModels
{
   public class ArticleViewModel
    {
        public  int ID { get; set; }
        public string Title { get; set; }
   
        public string Description { get; set; }
        public string Photos { get; set; }
        public int Categorie_id { get; set; }
        [DisplayName("Posted File")]
        public HttpPostedFileBase ImgFile { get; set; }
        public List<string> ingredient { get; set; }
        public List<string> step { get; set; }
        public Reviews Reviews { get; set; }
        public Reviews_response reviews_response { get; set; }

    }
}
