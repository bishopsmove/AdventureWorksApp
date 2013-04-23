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
    public class ProductModelRepository : IProductModelRepository
    {
        AdventureWorksEntitiesContainer context = new AdventureWorksEntitiesContainer();

        public IQueryable<ProductModel> All
        {
            get { return context.ProductModels; }
        }

        public IQueryable<ProductModel> AllIncluding(params Expression<Func<ProductModel, object>>[] includeProperties)
        {
            IQueryable<ProductModel> query = context.ProductModels;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public ProductModel Find(int id)
        {
            return context.ProductModels.Find(id);
        }

        public void InsertOrUpdate(ProductModel productmodel)
        {
            if (productmodel.ProductModelID == default(int)) {
                // New entity
                context.ProductModels.Add(productmodel);
            } else {
                // Existing entity
                context.Entry(productmodel).State = EntityState.Modified;
            }
        }

        public void Delete(int id)
        {
            var productmodel = context.ProductModels.Find(id);
            context.ProductModels.Remove(productmodel);
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

    public interface IProductModelRepository : IDisposable
    {
        IQueryable<ProductModel> All { get; }
        IQueryable<ProductModel> AllIncluding(params Expression<Func<ProductModel, object>>[] includeProperties);
        ProductModel Find(int id);
        void InsertOrUpdate(ProductModel productmodel);
        void Delete(int id);
        void Save();
    }
}