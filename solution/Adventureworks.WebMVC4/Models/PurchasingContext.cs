

namespace Adventureworks.WebMVC4.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using Adventureworks.Domain5;
    using Adventureworks.WebMVC4.Filters;
    
    public partial class PurchasingContext : DbContext
    {
        public PurchasingContext()
        {
            Database.SetInitializer(new PurchasingInitializer());
            //PurchasingInitializer.SeedDatabase(this);
        }

        public DbSet<VendorProposal> VendorProposals { get; set; }
        public DbSet<RequestForProposal> RequestForProposals { get; set; }
        public DbSet<ResponseForProposal> ResponseForProposals { get; set; }
        public DbSet<VendorSubmitProposalRequest> VendorSubmitProposalRequests { get; set; }

        public DbSet<Adventureworks.WebMVC4.Models.VendorProposalRepository> VendorProposalRepositories { get; set; }
    }
}
