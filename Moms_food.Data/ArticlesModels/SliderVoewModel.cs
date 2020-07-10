using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Moms_food.Data.ArticlesModels
{
  public  class SliderVoewModel
    {

        public string Photo { get; set; }
        public string link { get; set; }
        public Nullable<int> Article_id { get; set; }
        [DisplayName("Posted File")]
        public HttpPostedFileBase ImgFile { get; set; }
    }
}
