using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using Adventureworks.Domain5;

namespace Adventureworks.WebMVC4.Models
{ 
    public class ProductSubcategoryRepository : IProductSubcategoryRepository
    {
        AdventureWorksEntitiesContainer context = new AdventureWorksEntitiesContainer();

        public IQueryable<ProductSubcategory> All
        {
            get { return context.ProductSubcategories; }
        }

        public IQueryable<ProductSubcategory> AllIncluding(params Expression<Func<ProductSubcategory, object>>[] includeProperties)
        {
            IQueryable<ProductSubcategory> query = context.ProductSubcategories;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public ProductSubcategory Find(int id)
        {
            return context.ProductSubcategories.Find(id);
        }

        public void InsertOrUpdate(ProductSubcategory productsubcategory)
        {
            if (productsubcategory.ProductSubcategoryID == default(int)) {
                // New entity
                context.ProductSubcategories.Add(productsubcategory);
            } else {
                // Existing entity
                context.Entry(productsubcategory).State = EntityState.Modified;
            }
        }

        public void Delete(int id)
        {
            var productsubcategory = context.ProductSubcategories.Find(id);
            context.ProductSubcategories.Remove(productsubcategory);
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

    public interface IProductSubcategoryRepository : IDisposable
    {
        IQueryable<ProductSubcategory> All { get; }
        IQueryable<ProductSubcategory> AllIncluding(params Expression<Func<ProductSubcategory, object>>[] includeProperties);
        ProductSubcategory Find(int id);
        void InsertOrUpdate(ProductSubcategory productsubcategory);
        void Delete(int id);
        void Save();
    }
}