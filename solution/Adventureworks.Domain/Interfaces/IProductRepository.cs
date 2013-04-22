using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Adventureworks.Domain.Interfaces
{
    public interface IProductRepository
    {
        IQueryable<Product> GetFeaturedProducts();
        IQueryable<Product> GetTop100Products();
        Product GetProductById(int productID);
        MemoryStream GetProductThumbnail(int productPhotoID);
        MemoryStream GetProductPhoto(int productPhotoID);
        IQueryable<Product> GetProductsByCategory(int productSubcategoryID);
        void CreateProduct(Product product);
        bool ProductExists(string productName);
    }
}
