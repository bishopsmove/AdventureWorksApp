using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Adventureworks.Domain5;
using Adventureworks.WebMVC4.Models;

namespace Adventureworks.WebMVC4.Controllers
{   
    public class ShoppingCartController : Controller
    {
		private readonly IProductRepository productRepository;
		private readonly IShoppingCartItemRepository shoppingcartitemRepository;

		// If you are using Dependency Injection, you can delete the following constructor
        public ShoppingCartController() : this(new ProductRepository(), new ShoppingCartItemRepository())
        {
        }

        public ShoppingCartController(IProductRepository productRepository, IShoppingCartItemRepository shoppingcartitemRepository)
        {
			this.productRepository = productRepository;
			this.shoppingcartitemRepository = shoppingcartitemRepository;
        }

        //
        // GET: /ShoppingCart/

        public ViewResult Index()
        {
            return View(shoppingcartitemRepository.AllIncluding(shoppingcartitem => shoppingcartitem.Product));
        }

        //
        // GET: /ShoppingCart/Details/5

        public ViewResult Details(int id)
        {
            return View(shoppingcartitemRepository.Find(id));
        }

        //
        // GET: /ShoppingCart/Create

        public ActionResult Create()
        {
			ViewBag.PossibleProducts = productRepository.All;
            return View();
        } 

        //
        // POST: /ShoppingCart/Create

        [HttpPost]
        public ActionResult Create(ShoppingCartItem shoppingcartitem)
        {
            if (ModelState.IsValid) {
                shoppingcartitemRepository.InsertOrUpdate(shoppingcartitem);
                shoppingcartitemRepository.Save();
                return RedirectToAction("Index");
            } else {
				ViewBag.PossibleProducts = productRepository.All;
				return View();
			}
        }
        
        //
        // GET: /ShoppingCart/Edit/5
 
        public ActionResult Edit(int id)
        {
			ViewBag.PossibleProducts = productRepository.All;
             return View(shoppingcartitemRepository.Find(id));
        }

        //
        // POST: /ShoppingCart/Edit/5

        [HttpPost]
        public ActionResult Edit(ShoppingCartItem shoppingcartitem)
        {
            if (ModelState.IsValid) {
                shoppingcartitemRepository.InsertOrUpdate(shoppingcartitem);
                shoppingcartitemRepository.Save();
                return RedirectToAction("Index");
            } else {
				ViewBag.PossibleProducts = productRepository.All;
				return View();
			}
        }

        //
        // GET: /ShoppingCart/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View(shoppingcartitemRepository.Find(id));
        }

        //
        // POST: /ShoppingCart/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            shoppingcartitemRepository.Delete(id);
            shoppingcartitemRepository.Save();

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing) {
                productRepository.Dispose();
                shoppingcartitemRepository.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

