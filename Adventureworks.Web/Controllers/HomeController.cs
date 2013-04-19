using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Adventureworks.Domain.Interfaces;
using Adventureworks.SQLRepository;
using System.ComponentModel.Composition;

namespace Adventureworks.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductRepository _productRepository;

        [ImportingConstructor]
        public HomeController(IProductRepository productRepository)
        {
            this._productRepository = productRepository;
        }

        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to AdventureWorks cycle store";

            var products = _productRepository.GetFeaturedProducts();

            return View(products);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
