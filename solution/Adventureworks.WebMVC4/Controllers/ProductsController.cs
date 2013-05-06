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
	public class ProductsController : Controller
	{
		private readonly IProductSubcategoryRepository productsubcategoryRepository;
		private readonly IProductModelRepository productmodelRepository;
		private readonly IProductRepository productRepository; 

		// If you are using Dependency Injection, you can delete the following constructor
		//public ProductsController()
		//    //: this(new ProductSubcategoryRepository(), new ProductModelRepository(), new ProductRepository())
		//{
		//    this.productsubcategoryRepository = (IProductSubcategoryRepository)ObjectFactory.GetInstance(typeof(IProductSubcategoryRepository));
		//    this.productmodelRepository = (IProductModelRepository)ObjectFactory.GetInstance(typeof(IProductModelRepository));
		//    this.productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
		//}

		public ProductsController(IProductSubcategoryRepository productsubcategoryRepository, IProductModelRepository productmodelRepository, IProductRepository productRepository)
		{
			this.productsubcategoryRepository = (IProductSubcategoryRepository)ObjectFactory.GetInstance(typeof(IProductSubcategoryRepository));
			this.productmodelRepository = (IProductModelRepository)ObjectFactory.GetInstance(typeof(IProductModelRepository));
			this.productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
		}

		//
		// GET: /Products/

		public ViewResult Index(int subcategoryId)
		{
			var products = productRepository.AllIncluding(product => product.ProductSubcategory, product => product.ProductModel, product => product.ProductReviews, product => product.ShoppingCartItems)
							.Where(product => product.ProductSubcategoryID == subcategoryId);
			ViewBag.TotalCount = products.Count();
			ViewBag.SubcategoryName = productsubcategoryRepository.Find(subcategoryId).Name; // _categoryRepository.GetProductSubcategoryById(subcategoryId).Name;
			ViewBag.ProductSubcategoryId = subcategoryId;

            return View(products); //, product => product.PurchaseOrderDetails , product => product.WorkOrders
		}

		//
		// GET: /Products/Details/5

		public ViewResult Details(int id)
		{
			
			return View(productRepository.Find(id));
		}

		public PartialViewResult ProductGrid(int subcategoryId, int? page)
		{
			int currentPage = page.GetValueOrDefault(1);
			IQueryable<Product> products = productRepository.GetProductsByCategory(subcategoryId);

			ViewBag.CurrentPage = currentPage;
			ViewBag.TotalCount = products.Count();
			ViewBag.ProductSubcategoryId = subcategoryId;

			return PartialView(products.Skip((currentPage - 1) * 3).Take(3));
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
            if (ModelState.IsValid)
            {
                productRepository.InsertOrUpdate(product);
                productRepository.Save();
                return RedirectToAction("Index");
            }
            else
            {
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
            if (ModelState.IsValid)
            {
                productRepository.InsertOrUpdate(product);
                productRepository.Save();
                return RedirectToAction("Index");
            }
            else
            {
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

