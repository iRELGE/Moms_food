//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Moms_food.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Photos
    {
        public int ID { get; set; }
        public int StepsID { get; set; }
        public string Photos1 { get; set; }
        public string Name { get; set; }
    
        public virtual Steps Steps { get; set; }
    }
}
