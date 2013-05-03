using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.IO;
using System.Drawing;
using Adventureworks.Domain5;

namespace Adventureworks.WebMVC4.Models
{ 
    public class ProductRepository : IProductRepository
    {
        AdventureWorksEntitiesContainer context = new AdventureWorksEntitiesContainer();

        public ProductRepository()
        {

        }

        public IQueryable<Product> All
        {
            get { return context.Products; }
        }

        public IQueryable<Product> AllIncluding(params Expression<Func<Product, object>>[] includeProperties)
        {
            IQueryable<Product> query = context.Products;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public IQueryable<Product> GetFeaturedProducts()
        {
            IList<Product> products = new List<Product>();
            Product product;
            ProductPhoto prodPhoto;
            ProductProductPhoto prodProdPhoto;

            product = new Product();
            product.Name = "Road-150 Red, 48";
            prodPhoto = new ProductPhoto();
            prodPhoto.LargePhotoFileName = "~/Content/Images/SampleCycles/cycle1.gif";
            prodProdPhoto = new ProductProductPhoto() { ProductPhoto = prodPhoto };
            product.ProductProductPhotoes.Add(prodProdPhoto);
            products.Add(product);

            product = new Product();
            product.Name = "Touring-2000 Blue, 60";
            prodPhoto = new ProductPhoto();
            prodPhoto.LargePhotoFileName = "~/Content/Images/SampleCycles/cycle2.gif";
            prodProdPhoto = new ProductProductPhoto() { ProductPhoto = prodPhoto };
            product.ProductProductPhotoes.Add(prodProdPhoto);
            products.Add(product);

            product = new Product();
            product.Name = "Mountain-100 Black, 42";
            prodPhoto = new ProductPhoto();
            prodPhoto.LargePhotoFileName = "~/Content/Images/SampleCycles/cycle3.gif";
            prodProdPhoto = new ProductProductPhoto() { ProductPhoto = prodPhoto };
            product.ProductProductPhotoes.Add(prodProdPhoto);
            products.Add(product);

            product = new Product();
            product.Name = "Road-350-W Yellow, 44";
            prodPhoto = new ProductPhoto();
            prodPhoto.LargePhotoFileName = "~/Content/Images/SampleCycles/cycle4.jpg";
            prodProdPhoto = new ProductProductPhoto() { ProductPhoto = prodPhoto };
            product.ProductProductPhotoes.Add(prodProdPhoto);
            products.Add(product);


            return products.AsQueryable<Product>();
        }

        public IQueryable<Product> GetTop100Products()
        {
            return context.Products.Take(100);
        }

        public Product Find(int id)
        {
            return context.Products.Find(id);
        }

        public IQueryable<Product> GetProductsByCategory(int productSubcategoryID)
        {

            IQueryable<Product> query = context.Products;

            query = query.Include(p => p.ProductProductPhotoes).OrderBy(p => p.ProductID).Where(p => p.ProductSubcategoryID == productSubcategoryID);
            
            return query;
        }

        public MemoryStream GetProductThumbnail(int productPhotoID)
        {
            byte[] thumbNailPhoto = context.ProductPhotoes.Where<ProductPhoto>(pp => pp.ProductPhotoID == productPhotoID).FirstOrDefault<ProductPhoto>().ThumbNailPhoto;
            MemoryStream ms = new MemoryStream(thumbNailPhoto);
            Image image = Image.FromStream(ms);
            return ms;
        }

        public MemoryStream GetProductPhoto(int productPhotoID)
        {
            byte[] largePhoto = context.ProductPhotoes.Where<ProductPhoto>(pp => pp.ProductPhotoID == productPhotoID).FirstOrDefault<ProductPhoto>().LargePhoto;
            MemoryStream ms = new MemoryStream(largePhoto);
            Image image = Image.FromStream(ms);
            return ms;
        }

        public void InsertOrUpdate(Product product)
        {
            if (product.ProductID == default(int)) {
                // New entity
                context.Products.Add(product);
            } else {
                // Existing entity
                context.Entry(product).State = EntityState.Modified;
            }
        }

        public void Delete(int id)
        {
            var product = context.Products.Find(id);
            context.Products.Remove(product);
        }

        public bool ProductExists(string productName)
        {
            Product product = context.Products.Where<Product>(p => p.Name == productName).FirstOrDefault<Product>();
            return product != null;
        }

        public void Save()
        {
            context.SaveChanges();
        }

        public void Dispose() 
        {
            context.Dispose();
        }
    }

    public interface IProductRepository : IDisposable
    {
        IQueryable<Product> All { get; }
        IQueryable<Product> AllIncluding(params Expression<Func<Product, object>>[] includeProperties);
        IQueryable<Product> GetFeaturedProducts();
        IQueryable<Product> GetProductsByCategory(int subCatID);
        MemoryStream GetProductThumbnail(int productPhotoID);
        MemoryStream GetProductPhoto(int productPhotoID);
        Product Find(int id);
        void InsertOrUpdate(Product product);
        void Delete(int id);
        bool ProductExists(string productName);
        void Save();
    }
}