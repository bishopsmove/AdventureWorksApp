using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
//using System.Web.Http;
using System.Web.Mvc;
using Adventureworks.Domain5;
using Adventureworks.WebMVC4.Models;

namespace Adventureworks.WebMVC4.Controllers
{   
	public class AWContextController : Controller
	{
		private readonly IProductSubcategoryRepository productsubcategoryRepository;
		private readonly IProductModelRepository productmodelRepository;
		private readonly IProductRepository productRepository;

		// If you are using Dependency Injection, you can delete the following constructor
		public AWContextController() : this(new ProductSubcategoryRepository(), new ProductModelRepository(), new ProductRepository())
		{
		}

		public AWContextController(IProductSubcategoryRepository productsubcategoryRepository, IProductModelRepository productmodelRepository, IProductRepository productRepository)
		{
			this.productsubcategoryRepository = productsubcategoryRepository;
			this.productmodelRepository = productmodelRepository;
			this.productRepository = productRepository;
		}

		//
		// GET: /AWContext/

		public ViewResult Index()
		{
			return View(productRepository.AllIncluding(product => product.ProductSubcategory, product => product.ProductModel, product => product.ProductReviews, product => product.PurchaseOrderDetails, product => product.ShoppingCartItems, product => product.WorkOrders));
		}

		//
		// GET: /AWContext/Details/5

		public ViewResult Details(int id)
		{
			return View(productRepository.Find(id));
		}

		//
		// GET: /AWContext/Create

		public ActionResult Create()
		{
			ViewBag.PossibleProductSubcategories = productsubcategoryRepository.All;
			ViewBag.PossibleProductModels = productmodelRepository.All;
			return View();
		} 

		//
		// POST: /AWContext/Create

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
		// GET: /AWContext/Edit/5
 
		public ActionResult Edit(int id)
		{
			ViewBag.PossibleProductSubcategories = productsubcategoryRepository.All;
			ViewBag.PossibleProductModels = productmodelRepository.All;
			 return View(productRepository.Find(id));
		}

		//
		// POST: /AWContext/Edit/5

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
		// GET: /AWContext/Delete/5
 
		public ActionResult Delete(int id)
		{
			return View(productRepository.Find(id));
		}

		//
		// POST: /AWContext/Delete/5

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

