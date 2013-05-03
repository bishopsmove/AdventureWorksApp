using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StructureMap;
using Adventureworks.WebMVC4.Models;

namespace Adventureworks.WebMVC4.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductRepository _productRepository;

        public HomeController(IProductRepository productRepository)
        {

            this._productRepository = (IProductRepository)ObjectFactory.GetInstance(typeof(IProductRepository));
        }

        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to AdventureWorks cycle store";

            var products = _productRepository.GetFeaturedProducts();

            return View(products);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
