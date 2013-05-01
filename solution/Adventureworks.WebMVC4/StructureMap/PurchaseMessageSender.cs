using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Adventureworks.Domain5;
using Adventureworks.WebMVC4.Filters;

namespace Adventureworks.WebMVC4.StructureMap
{
    public class PurchaseMessageSender : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        
        

        public DbSet<VendorProposal> VendorProposals { get; set; }
        //public DbSet<RequestForProposal> RequestForProposals { get; set; }
        public DbSet<ResponseForProposal> ResponseForProposals { get; set; }
        public DbSet<VendorSubmitProposalRequest> VendorSubmitProposalRequests { get; set; }
    }
}