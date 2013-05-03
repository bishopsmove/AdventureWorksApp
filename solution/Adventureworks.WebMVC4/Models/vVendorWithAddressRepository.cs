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
    public class VendorPlusRepository : IVendorPlusRepository
    {
        AdventureWorksEntitiesContainer context = new AdventureWorksEntitiesContainer();

        public IQueryable<VendorPlus> All
        {
            get { return context.VendorsPlus; }
        }

        public IQueryable<VendorPlus> AllIncluding(params Expression<Func<VendorPlus, object>>[] includeProperties)
        {
            IQueryable<VendorPlus> query = context.VendorsPlus;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public VendorPlus Find(int id)
        {
            return context.VendorsPlus.Find(id);
        }

        public void InsertOrUpdate(VendorPlus vendorPlus)
        {
            if (vendorPlus.BusinessEntityID == default(int))
            {
                // New entity
                context.VendorsPlus.Add(vendorPlus);
            } else {
                // Existing entity
                context.Entry(vendorPlus).State = EntityState.Modified;
            }
        }

        public void Delete(int id)
        {
            var vvendorwithaddress = context.vVendorWithAddresses.Find(id);
            context.vVendorWithAddresses.Remove(vvendorwithaddress);
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

    public interface IVendorPlusRepository : IDisposable
    {
        IQueryable<VendorPlus> All { get; }
        IQueryable<VendorPlus> AllIncluding(params Expression<Func<VendorPlus, object>>[] includeProperties);
        VendorPlus Find(int id);
        void InsertOrUpdate(VendorPlus vendorPlus);
        void Delete(int id);
        void Save();
    }
}