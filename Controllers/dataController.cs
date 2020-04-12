using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication5.Models;
using WebApplication5.Views;

namespace WebApplication5.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class dataController : ControllerBase
    {
        charts c = new charts();
        private readonly productsContext _context; public dataController(productsContext context)
        {
            _context = context;
        }


        [HttpGet]
        public List<data> GetAll()
        {
            return c.GetData();
        }
    }
}