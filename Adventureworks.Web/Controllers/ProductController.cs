using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Adventureworks.Domain;
using Adventureworks.SQLRepository;
using Adventureworks.Domain.Interfaces;

namespace Adventureworks.Web.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductRepository _productRepository;
        private readonly ICategoryRepository _categoryRepository;

        [ImportingConstructor]
        public ProductController(IProductRepository productRepository, ICategoryRepository categoryRepository)
        {
            this._productRepository = productRepository;
            this._categoryRepository = categoryRepository;
        }

        public ActionResult Index(int subcategoryId)
        {
            IQueryable<Product> products = _productRepository.GetProductsByCategory(subcategoryId);

            ViewBag.TotalCount = products.Count();
            ViewBag.SubcategoryName = _categoryRepository.GetProductSubcategoryById(subcategoryId).Name;
            ViewBag.ProductSubcategoryId = subcategoryId;

            return View();
        }

        public ActionResult ProductGrid(int subcategoryId, int? page)
        {
            int currentPage = page.GetValueOrDefault(1);
            IQueryable<Product> products = _productRepository.GetProductsByCategory(subcategoryId);

            ViewBag.CurrentPage = currentPage;
            ViewBag.TotalCount = products.Count();
            ViewBag.ProductSubcategoryId = subcategoryId;

            return PartialView(products.Skip((currentPage - 1) * 3).Take(3));
        }

        //
        // GET: /Product/Details/id

        public ActionResult Details(int id)
        {
            Product product = _productRepository.GetProductById(id);

            return View(product);
        }

        public JsonResult JsonDetails(int id)
        {
            Product product = _productRepository.GetProductById(id);

            return Json(new
                        {
                            Id = product.ProductID,
                            product.Name,
                            LargeUrl = VirtualPathUtility.ToAbsolute("~/Image/ProductThumbnail?productPhotoID=" + product.ProductProductPhotoes.FirstOrDefault<ProductProductPhoto>().ProductPhotoID)
                        }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult IsProductName_Available(string name)
        {

            if (!_productRepository.ProductExists(name))
                return Json(true, JsonRequestBehavior.AllowGet);

            string suggestedUID = String.Format(CultureInfo.InvariantCulture,
                "{0} is not available.", name);

            for (int i = 1; i < 100; i++)
            {
                string altCandidate = name + i.ToString();
                if (!_productRepository.ProductExists(altCandidate))
                {
                    suggestedUID = String.Format(CultureInfo.InvariantCulture,
                   "{0} is not available. Try {1}.", name, altCandidate);
                    break;
                }
            }
            return Json(suggestedUID, JsonRequestBehavior.AllowGet);
        }

    }
}
