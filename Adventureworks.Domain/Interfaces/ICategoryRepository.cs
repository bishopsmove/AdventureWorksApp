using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Adventureworks.Domain.Interfaces
{
    public interface ICategoryRepository
    {
        IQueryable<ProductCategory> GetProductCategories();
        ProductSubcategory GetProductSubcategoryById(int subcategoryId);
    }
}
