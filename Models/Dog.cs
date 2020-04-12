using System;
using System.Collections.Generic;

namespace WebApplication5.Models
{
    public partial class Dog
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Breed { get; set; }
        public bool? IsVaccinated { get; set; }
        public int Count { get; set; }
    }
}
