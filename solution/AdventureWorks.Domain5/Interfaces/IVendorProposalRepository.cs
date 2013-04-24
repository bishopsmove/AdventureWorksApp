using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Adventureworks.Domain5;

namespace Adventureworks.Domain5.Interfaces
{
    public interface IVendorProposalRepository : IDisposable
    {
        IQueryable<VendorProposal> All { get; }
        IQueryable<VendorProposal> AllIncluding(params Expression<Func<VendorProposal, object>>[] includeProperties);
        VendorProposal Find(int id);
        void InsertOrUpdate(VendorProposal vendorproposal);
        void Delete(int id);
        void Save();
    }
}
