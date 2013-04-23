using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Adventureworks.Domain5;
using Adventureworks.WebMVC4.Models;

namespace Adventureworks.WebMVC4.Controllers
{   
    public class ProductsController : Controller
    {
		private readonly IProductSubcategoryRepository productsubcategoryRepository;
		private readonly IProductModelRepository productmodelRepository;
		private readonly IProductRepository productRepository;

		// If you are using Dependency Injection, you can delete the following constructor
        public ProductsController() : this(new ProductSubcategoryRepository(), new ProductModelRepository(), new ProductRepository())
        {
        }

        public ProductsController(IProductSubcategoryRepository productsubcategoryRepository, IProductModelRepository productmodelRepository, IProductRepository productRepository)
        {
			this.productsubcategoryRepository = productsubcategoryRepository;
			this.productmodelRepository = productmodelRepository;
			this.productRepository = productRepository;
        }

        //
        // GET: /Products/

        public ViewResult Index()
        {
            return View(productRepository.AllIncluding(product => product.ProductSubcategory, product => product.ProductModel, product => product.ProductReviews, product => product.ShoppingCartItems)); //, product => product.PurchaseOrderDetails , product => product.WorkOrders
        }

        //
        // GET: /Products/Details/5

        public ViewResult Details(int id)
        {
            return View(productRepository.Find(id));
        }

        //
        // GET: /Products/Create

        public ActionResult Create()
        {
			ViewBag.PossibleProductSubcategories = productsubcategoryRepository.All;
			ViewBag.PossibleProductModels = productmodelRepository.All;
            return View();
        } 

        //
        // POST: /Products/Create

        [HttpPost]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid) {
                productRepository.InsertOrUpdate(product);
                productRepository.Save();
                return RedirectToAction("Index");
            } else {
				ViewBag.PossibleProductSubcategories = productsubcategoryRepository.All;
				ViewBag.PossibleProductModels = productmodelRepository.All;
				return View();
			}
        }
        
        //
        // GET: /Products/Edit/5
 
        public ActionResult Edit(int id)
        {
			ViewBag.PossibleProductSubcategories = productsubcategoryRepository.All;
			ViewBag.PossibleProductModels = productmodelRepository.All;
             return View(productRepository.Find(id));
        }

        //
        // POST: /Products/Edit/5

        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid) {
                productRepository.InsertOrUpdate(product);
                productRepository.Save();
                return RedirectToAction("Index");
            } else {
				ViewBag.PossibleProductSubcategories = productsubcategoryRepository.All;
				ViewBag.PossibleProductModels = productmodelRepository.All;
				return View();
			}
        }

        //
        // GET: /Products/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View(productRepository.Find(id));
        }

        //
        // POST: /Products/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            productRepository.Delete(id);
            productRepository.Save();

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing) {
                productsubcategoryRepository.Dispose();
                productmodelRepository.Dispose();
                productRepository.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

