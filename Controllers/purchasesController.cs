using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication5.Models;

namespace WebApplication5.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class purchasesController : ControllerBase
    {
        private readonly productsContext _context;

        public purchasesController(productsContext context) => _context = context;


        [HttpGet]
        public ActionResult<List<Purchases>> GetAll()
        {
            return _context.Purchases.ToList();
        }
        [HttpPost]
        public IActionResult Post([FromBody] Purchases a )
        {

            Purchases item = new Purchases()
            {
                Idprod = a.Idprod
            };

            _context.Purchases.Add(item);
            _context.SaveChanges();

            return Ok(item);
        }
    }
}