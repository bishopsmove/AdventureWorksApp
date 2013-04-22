using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Linq;
using System.Text;
using System.Web;
using Adventureworks.Domain.Interfaces;
using Adventureworks.Domain;
using System.Data.Objects.DataClasses;
using System.IO;
using System.Drawing;

namespace Adventureworks.SQLRepository
{
    [Export(typeof(IProductRepository))]
    public class ProductRepository : IProductRepository
    {
        private readonly AdventureWorks2008R2Entities _db = new AdventureWorks2008R2Entities();

        public IQueryable<Product> GetFeaturedProducts()
        {
            IList<Product> products = new List<Product>();
            Product product;
            ProductPhoto prodPhoto;
            ProductProductPhoto prodProdPhoto;

            product = new Product();            
            product.Name = "Road-150 Red, 48";
            prodPhoto = new ProductPhoto();
            prodPhoto.PhotoPath = "~/Content/Images/SampleCycles/cycle1.gif";
            prodProdPhoto = new ProductProductPhoto() { ProductPhoto = prodPhoto };
            product.ProductProductPhotoes.Add(prodProdPhoto);
            products.Add(product);

            product = new Product();
            product.Name = "Touring-2000 Blue, 60";
            prodPhoto = new ProductPhoto();
            prodPhoto.PhotoPath = "~/Content/Images/SampleCycles/cycle2.gif";
            prodProdPhoto = new ProductProductPhoto() { ProductPhoto = prodPhoto };
            product.ProductProductPhotoes.Add(prodProdPhoto);
            products.Add(product);

            product = new Product();
            product.Name = "Mountain-100 Black, 42";
            prodPhoto = new ProductPhoto();
            prodPhoto.PhotoPath = "~/Content/Images/SampleCycles/cycle3.gif";
            prodProdPhoto = new ProductProductPhoto() { ProductPhoto = prodPhoto };
            product.ProductProductPhotoes.Add(prodProdPhoto);
            products.Add(product);

            product = new Product();
            product.Name = "Road-350-W Yellow, 44";
            prodPhoto = new ProductPhoto();
            prodPhoto.PhotoPath = "~/Content/Images/SampleCycles/cycle4.jpg";
            prodProdPhoto = new ProductProductPhoto() { ProductPhoto = prodPhoto };
            product.ProductProductPhotoes.Add(prodProdPhoto);
            products.Add(product);


            return products.AsQueryable<Product>();
        }

        public IQueryable<Product> GetTop100Products()
        {
            return this._db.Products.Top("100");
        }

        public Product GetProductById(int productID)
        {
            Product product = _db.Products.Where<Product>(p => p.ProductID == productID).FirstOrDefault<Product>();
            return product;
        }

        public MemoryStream GetProductThumbnail(int productPhotoID)
        {
            byte[] thumbNailPhoto = _db.ProductPhotoes.Where<ProductPhoto>(pp => pp.ProductPhotoID == productPhotoID).FirstOrDefault<ProductPhoto>().ThumbNailPhoto;
            MemoryStream ms = new MemoryStream(thumbNailPhoto);
            Image image = Image.FromStream(ms);
            return ms;
        }

        public MemoryStream GetProductPhoto(int productPhotoID)
        {
            byte[] largePhoto = _db.ProductPhotoes.Where<ProductPhoto>(pp => pp.ProductPhotoID == productPhotoID).FirstOrDefault<ProductPhoto>().LargePhoto;
            MemoryStream ms = new MemoryStream(largePhoto);
            Image image = Image.FromStream(ms);
            return ms;
        }

        public IQueryable<Product> GetProductsByCategory(int productSubcategoryID)
        {
            return _db.Products.Include("ProductProductPhotoes").OrderBy("it.ProductID").Where(p => p.ProductSubcategoryID == productSubcategoryID);
        }

        public void CreateProduct(Product product)
        {
            this._db.Products.AddObject(product);
            this._db.SaveChanges();
        }


        public bool ProductExists(string productName)
        {
            Product product = _db.Products.Where<Product>(p => p.Name == productName).FirstOrDefault<Product>();
            return product != null;
        }
    }
}
