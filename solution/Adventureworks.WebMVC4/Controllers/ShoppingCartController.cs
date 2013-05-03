using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using StructureMap;
using Adventureworks.Domain5;
using Adventureworks.WebMVC4.Models;

namespace Adventureworks.WebMVC4.Controllers
{   
    public class ShoppingCartController : Controller
    {
		private readonly IProductRepository productRepository;
		private readonly IShoppingCartItemRepository shoppingcartitemRepository;
        private string _cartID;

        //// If you are using Dependency Injection, you can delete the following constructor
        //public ShoppingCartController() : this(new ProductRepository(), new ShoppingCartItemRepository())
        //{
        //}

        public ShoppingCartController(IProductRepository productRepository, IShoppingCartItemRepository shoppingcartitemRepository)
        {
            this.productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
            this.shoppingcartitemRepository = (IShoppingCartItemRepository)ObjectFactory.GetInstance(typeof(IShoppingCartItemRepository));
            //Mocking for CustomerID 20621
            this._cartID = "20621";
        }

        //
        // GET: /ShoppingCart/

        public ViewResult Index()
        {
           //return View(shoppingcartitemRepository.AllIncluding(shoppingcartitem => shoppingcartitem.Product));
            //Original MVC3 site inaccurately associated the cart id with the username. 
            //Should be associated with the CustomerID from Sales.Customer table.

            
            return View(shoppingcartitemRepository.FindByCartID(_cartID).AsEnumerable());
        }

        public JsonResult GetCartItems(int? cartID)
        {
            this._cartID = cartID.HasValue ? string.Format("{0}",cartID.Value) : _cartID; 
            var cartItems =
                this.shoppingcartitemRepository.FindByCartID(_cartID).AsEnumerable();

            var dataRows = (cartItems.Select(cartItem => new
            {
                product = new
                {
                    Id = cartItem.ProductID,
                    cartItem.Product.Name,
                    LargeUrl = VirtualPathUtility.ToAbsolute("~/Image/ProductThumbnail?productPhotoID=" + cartItem.Product.ProductProductPhotoes.FirstOrDefault<ProductProductPhoto>().ProductPhotoID)
                },
                date = cartItem.DateCreated,
                quantity = cartItem.Quantity
            })).ToArray();

            return Json(dataRows, JsonRequestBehavior.AllowGet);
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
            var _item = new ShoppingCartItem();
            _item = SetCartID(_item, _cartID);
            _item.DateCreated = DateTime.Now;
            _item.ModifiedDate = DateTime.Now;

            return View(_item);
        } 

        //
        // POST: /ShoppingCart/Create

        [HttpPost]
        public ActionResult Create(ShoppingCartItem shoppingcartitem)
        {
            if (ModelState.IsValid) {

                shoppingcartitemRepository.InsertOrUpdate(SetCartID(shoppingcartitem, _cartID));
                shoppingcartitemRepository.Save();
                return RedirectToAction("Index");
            } else {
				ViewBag.PossibleProducts = productRepository.All;
				return View();
			}
        }

        [HttpPost]
        public JsonResult JsonAddToCart(int id)
        {
            Product product = productRepository.Find(id);

            if (product != null)
            {
                this.shoppingcartitemRepository.AddToCart(_cartID, id, 1);

                return Json(new
                {
                    Id = product.ProductID,
                    product.Name,
                    LargeUrl = VirtualPathUtility.ToAbsolute("~/Image/ProductThumbnail?productPhotoID=" + product.ProductProductPhotoes.FirstOrDefault<ProductProductPhoto>().ProductPhotoID)
                });
            }
            else {
                string _error = "Product could not be found.";
                ModelState.AddModelError("Error", new Exception(_error));

                return Json(new Exception(_error));

                

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
                shoppingcartitemRepository.InsertOrUpdate(SetCartID(shoppingcartitem, _cartID));
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

        private Func<ShoppingCartItem, string, ShoppingCartItem> SetCartID = delegate(ShoppingCartItem _item, string _ID)
        {
            _item.ShoppingCartID = _ID;

            return _item;
        };

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

