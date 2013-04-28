using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using Adventureworks.Domain5;
using Adventureworks.Domain5.Interfaces;
//using Adventureworks.Domain5.ContextExtensions;

namespace Adventureworks.WebMVC4.Models
{ 
    public class VendorProposalRepository : IVendorProposalRepository
    {
        PurchasingContext context = new PurchasingContext();

        public IQueryable<VendorProposal> All
        {
            get { return context.VendorProposals; }
        }

        public IQueryable<VendorProposal> AllIncluding(params Expression<Func<VendorProposal, object>>[] includeProperties)
        {
            IQueryable<VendorProposal> query = context.VendorProposals;
            foreach (var includeProperty in includeProperties) {
                query = query.Include(includeProperty);
            }
            return query;
        }

        public VendorProposal Find(int id)
        {
            return context.VendorProposals.Find(id);
        }

        public void InsertOrUpdate(VendorProposal vendorproposal)
        {
            if (vendorproposal.VendorId == default(int)) {
                // New entity
                context.VendorProposals.Add(vendorproposal);
            } else {
                // Existing entity
                context.Entry(vendorproposal).State = EntityState.Modified;
            }
        }

        public void Delete(int id)
        {
            var vendorproposal = context.VendorProposals.Find(id);
            context.VendorProposals.Remove(vendorproposal);
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


}