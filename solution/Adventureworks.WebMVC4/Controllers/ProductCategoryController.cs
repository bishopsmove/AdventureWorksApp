using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StructureMap;
using Adventureworks.Domain5;
using Adventureworks.WebMVC4.Models;

namespace Adventureworks.WebMVC4.Controllers
{   
    public class ProductCategoryController : Controller
    {
		private readonly IProductCategoryRepository productcategoryRepository;
        private readonly IProductSubcategoryRepository productsubcategoryRepository;

        //// If you are using Dependency Injection, you can delete the following constructor
        //public ProductCategoryController() : this(new ProductCategoryRepository())
        //{
        //}

        public ProductCategoryController(IProductCategoryRepository productcategoryRepository)
        {
            this.productcategoryRepository = (IProductCategoryRepository)ObjectFactory.GetInstance(typeof(IProductCategoryRepository));
            this.productsubcategoryRepository = (IProductSubcategoryRepository)ObjectFactory.GetInstance(typeof(IProductSubcategoryRepository));
        }

        //
        // GET: /ProductCategory/

        //public ViewResult Index()
        //{
        //    return View(productcategoryRepository.AllIncluding(productcategory => productcategory.ProductSubcategories));
        //}

        [OutputCache(Duration = 10)]
        [ChildActionOnly]
        public ActionResult Index(int? subcategoryId)
        {
            ProductSubcategory prodSubcat = productsubcategoryRepository.Find(subcategoryId.GetValueOrDefault(1));
            var productCategories = productcategoryRepository.All;

            ViewBag.CurrentProductCategoryId = prodSubcat.ProductCategoryID;
            ViewBag.CurrentProductSubcategoryId = prodSubcat.ProductSubcategoryID;

            return PartialView(productCategories);
        }

        // GET: /Category/Browse/5
        public ActionResult Browse(string id)
        {
            return View();
        }

        //
        // GET: /ProductCategory/Details/5

        public ViewResult Details(int id)
        {
            return View(productcategoryRepository.Find(id));
        }

        //
        // GET: /ProductCategory/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /ProductCategory/Create

        [HttpPost]
        public ActionResult Create(ProductCategory productcategory)
        {
            if (ModelState.IsValid) {
                productcategoryRepository.InsertOrUpdate(productcategory);
                productcategoryRepository.Save();
                return RedirectToAction("Index");
            } else {
				return View();
			}
        }
        
        //
        // GET: /ProductCategory/Edit/5
 
        public ActionResult Edit(int id)
        {
             return View(productcategoryRepository.Find(id));
        }

        //
        // POST: /ProductCategory/Edit/5

        [HttpPost]
        public ActionResult Edit(ProductCategory productcategory)
        {
            if (ModelState.IsValid) {
                productcategoryRepository.InsertOrUpdate(productcategory);
                productcategoryRepository.Save();
                return RedirectToAction("Index");
            } else {
				return View();
			}
        }

        //
        // GET: /ProductCategory/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View(productcategoryRepository.Find(id));
        }

        //
        // POST: /ProductCategory/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            productcategoryRepository.Delete(id);
            productcategoryRepository.Save();

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing) {
                productcategoryRepository.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

