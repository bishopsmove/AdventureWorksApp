using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Adventureworks.Domain;
using Adventureworks.Domain.Interfaces;

namespace Adventureworks.Web.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly IProductRepository _productRepository;
        private readonly IShoppingCartRepository _shoppingCartRepository;

        [ImportingConstructor]
        public ShoppingCartController(IShoppingCartRepository shoppingCartRepository, IProductRepository productRepository)
        {
            this._shoppingCartRepository = shoppingCartRepository;
            this._productRepository = productRepository;
        }

        //
        // GET: /ShoppingCart/

        public ActionResult Index()
        {
            var cartItems =
                this._shoppingCartRepository.GetCartItemsByID(this.HttpContext.User.Identity.Name).AsEnumerable();
            ViewBag.CartTotal = this._shoppingCartRepository.GetTotal(this.HttpContext.User.Identity.Name);

            return View(cartItems);
        }

        public ActionResult AddToCart(int id)
        {
            this._shoppingCartRepository.AddToCart(this.HttpContext.User.Identity.Name, id, 1);

            return RedirectToAction("Index");
        }

        [HttpPost]
        public JsonResult JsonAddToCart(int id)
        {
            this._shoppingCartRepository.AddToCart(this.HttpContext.User.Identity.Name, id, 1);

            Product product = _productRepository.GetProductById(id);

            return Json(new
            {
                Id = product.ProductID,
                product.Name,
                LargeUrl = VirtualPathUtility.ToAbsolute("~/Image/ProductThumbnail?productPhotoID=" + product.ProductProductPhotoes.FirstOrDefault<ProductProductPhoto>().ProductPhotoID)
            });
        }

        //
        // AJAX: /ShoppingCart/RemoveFromCart/5

        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            // Display the confirmation message
            var results = new {
                Message = Server.HtmlEncode(id.ToString()) +
                    " has been removed from your shopping cart.",
                CartTotal = _shoppingCartRepository.GetTotal(this.HttpContext.User.Identity.Name),
                CartCount = _shoppingCartRepository.GetCount(this.HttpContext.User.Identity.Name),
                ItemCount = this._shoppingCartRepository.RemoveFromCart(this.HttpContext.User.Identity.Name, id),
                DeleteId = id
            };

            return Json(results);
        }

        public JsonResult GetCartItems()
        {
            var cartItems =
                this._shoppingCartRepository.GetCartItemsByID(this.HttpContext.User.Identity.Name).AsEnumerable();

            var dataRows = (cartItems.Select(cartItem => new {
                                                                 product = new {
                                                                                 Id = cartItem.ProductID,
                                                                                 cartItem.Product.Name, 
                                                                                 LargeUrl = VirtualPathUtility.ToAbsolute("~/Image/ProductThumbnail?productPhotoID=" + cartItem.Product.ProductProductPhotoes.FirstOrDefault<ProductProductPhoto>().ProductPhotoID) },
                                                                 date = cartItem.DateCreated,
                                                                 quantity = cartItem.Quantity
                                                             })).ToArray();

            return Json(dataRows, JsonRequestBehavior.AllowGet);
        }
    }
}
