using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApplication5.Models;

namespace WebApplication5.Views
{

    public class charts
    {
        List<data> datalist = new List<data>();
        public List<data> GetData()
        {
            using (var context = new productsContext())
            {

                context.Product.ToList().ForEach(i => {
                    data data = new data();
                    data.name = i.PName;
                    data.value = i.Count;
                    datalist.Add(data);
                });
                return datalist;
            }
        }

    }
}
