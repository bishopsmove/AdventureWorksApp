

namespace Adventureworks.Domain5.ContextExtensions
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PurchasingContext : DbContext
    {
        public PurchasingContext() : base()
        {

        }

        public DbSet<VendorProposal> VendorProposals { get; set; }
        public DbSet<RequestForProposal> RequestForProposals { get; set; }
        public DbSet<ResponseForProposal> ResponseForProposals { get; set; }
        public DbSet<VendorSubmitProposalRequest> VendorSubmitProposalRequests { get; set; }
    }
}
