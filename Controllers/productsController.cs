using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication5.Models;

namespace WebApplication5.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TodoController : ControllerBase
    {
        private readonly productsContext _context;

        public TodoController(productsContext context) => _context = context;


        [HttpGet]
        public ActionResult<List<Product>> GetAll()
        {
            return _context.Product.ToList();
        }
        [HttpGet("{id}")]

    public IActionResult Get(int id)
        {
            Product prod = _context.Product.Where(s => s.PId == id).FirstOrDefault<Product>();

            return Ok(prod);
        }
        [HttpPut]
        public IActionResult Put([FromBody] Product prod)
        {
            var existingprod = _context.Product.Where(s => s.PId == prod.PId).FirstOrDefault<Product>();

            if (existingprod != null)
            {
                existingprod.PName = prod.PName;
                existingprod.PDesc = prod.PDesc;
                existingprod.Count = prod.Count;

                _context.SaveChanges();
            }
            else
            {
                return NotFound();
            }

            return Ok();


        }
        [HttpDelete]
        public IActionResult Delete(int id)
        {
            _context.Product.Remove(_context.Product.FirstOrDefault(e => e.PId == id));
            _context.SaveChanges();


            return Ok();
        }
    }
}