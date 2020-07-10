using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Moms_food.Data.ArticlesModels
{
   public class UserViewModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Sexe { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Adress { get; set; }
        public string Telephone { get; set; }
        public string Email { get; set; }
        public bool IsBanned { get; set; }
        public string Status { get; set; }
        public string photo { get; set; }
        public string id_identity { get; set; }
        public string About { get; set; }
        public Nullable<System.DateTime> Date_inscription { get; set; }
        [DisplayName("Posted File")]
        public HttpPostedFileBase ImgFile { get; set; }
    }
}
