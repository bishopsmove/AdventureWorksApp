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
    public class vVendorWithAddressRepository : IvVendorWithAddressRepository
    {
        AdventureWorksEntitiesContainer context = new AdventureWorksEntitiesContainer();

        public IQueryable<vVendorWithAddress> All
        {
            get { return context.vVendorWithAddresses; }
        }

        public IQueryable<vVendorWithAddress> AllIncluding(params Expression<Func<vVendorWithAddress, object>>[] includeProperties)
        {
            IQueryable<vVendorWithAddress> query = context.vVendorWithAddresses;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public vVendorWithAddress Find(int id)
        {
            return context.vVendorWithAddresses.Find(id);
        }

        public void InsertOrUpdate(vVendorWithAddress vvendorwithaddress)
        {
            if (vvendorwithaddress.BusinessEntityID == default(int)) {
                // New entity
                context.vVendorWithAddresses.Add(vvendorwithaddress);
            } else {
                // Existing entity
                context.Entry(vvendorwithaddress).State = EntityState.Modified;
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

    public interface IvVendorWithAddressRepository : IDisposable
    {
        IQueryable<vVendorWithAddress> All { get; }
        IQueryable<vVendorWithAddress> AllIncluding(params Expression<Func<vVendorWithAddress, object>>[] includeProperties);
        vVendorWithAddress Find(int id);
        void InsertOrUpdate(vVendorWithAddress vvendorwithaddress);
        void Delete(int id);
        void Save();
    }
}