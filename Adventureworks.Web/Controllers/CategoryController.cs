using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Adventureworks.Domain.Interfaces;
using Adventureworks.SQLRepository;
using Adventureworks.Domain;

namespace Adventureworks.Web.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryRepository _categoryRepository;

        public CategoryController(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }

        [OutputCache(Duration = 10)]
        [ChildActionOnly]
        public ActionResult Index(int? subcategoryId)
        {
            ProductSubcategory prodSubcat = _categoryRepository.GetProductSubcategoryById(subcategoryId.GetValueOrDefault(1));
            var productCategories = _categoryRepository.GetProductCategories();

            ViewBag.CurrentProductCategoryId = prodSubcat.ProductCategoryID;
            ViewBag.CurrentProductSubcategoryId = prodSubcat.ProductSubcategoryID;

            return PartialView(productCategories);
        }

        // GET: /Category/Browse/5
        public ActionResult Browse(string id)
        {
            return View();
        }
    }
}
