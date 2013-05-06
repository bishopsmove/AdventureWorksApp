using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using StructureMap;
using Adventureworks.WebMVC4.Models;
using Adventureworks.Domain5;

namespace Adventureworks.WebMVC4.Controllers
{
    public class AdminController : ApiController
    {
        private IProductRepository productRepository;
        // GET api/admin
        public IEnumerable<Product> GetAll()
        {
            productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
            return productRepository.All;
        }

        // GET api/admin/5
        public Product Get(int id)
        {
            productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
            return productRepository.Find(id);
        }

        // POST api/admin
        public void Add([FromBody]Product value)
        {
            if (ModelState.IsValid)
            {
                productRepository.InsertOrUpdate(value);
                productRepository.Save();
            }
            else
            {
                ModelState.AddModelError("error", new Exception("Unknown error occurred. Please check Product fields and resubmit."));
            }

        }

        // PUT api/admin/5
        public void Edit(int id, [FromBody]Product value)
        {

            if (ModelState.IsValid)
            {
                productRepository.InsertOrUpdate(value);
                productRepository.Save();
            }
            else
            {
                ModelState.AddModelError("error", new Exception("Unknown error occurred. Please check Product fields and resubmit."));
            }
        }

        // DELETE api/admin/5
        public void Delete(int id)
        {
            productRepository.Delete(id);
            productRepository.Save();
        }
    }
}
