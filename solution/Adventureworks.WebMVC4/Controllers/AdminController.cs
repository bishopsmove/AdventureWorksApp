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
        private IProductCategoryRepository productcategoryRepository;
        private IProductSubcategoryRepository productsubcategoryRepository;

        //Product section

        // GET api/admin/
        public IEnumerable<Product> GetAllProducts()
        {
            productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
            return productRepository.All;
        }

        // GET api/admin/5
        public Product GetProduct(int id)
        {
            productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
            return productRepository.Find(id);
        }

        // POST api/admin/
        public void AddProduct([FromBody]Product value)
        {
            productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
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
        public void EditProduct(int id, [FromBody]Product value)
        {
            productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
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
        public void DeleteProduct(int id)
        {
            productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
            productRepository.Delete(id);
            productRepository.Save();
        }


    }
}
