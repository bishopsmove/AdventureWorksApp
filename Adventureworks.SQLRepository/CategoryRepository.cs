using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Linq;
using System.Text;

using Adventureworks.Domain.Interfaces;
using Adventureworks.Domain;

namespace Adventureworks.SQLRepository
{
    [Export(typeof(ICategoryRepository))]
    public class CategoryRepository : ICategoryRepository
    {
        private readonly AdventureWorks2008R2Entities _db = new AdventureWorks2008R2Entities();

        public IQueryable<ProductCategory> GetProductCategories()
        {
            return _db.ProductCategories.Include("ProductSubcategories");
        }

        public ProductSubcategory GetProductSubcategoryById(int subcategoryId)
        {
            return _db.ProductSubcategories.Single<ProductSubcategory>(cat => cat.ProductSubcategoryID == subcategoryId);
        }
    }
}
