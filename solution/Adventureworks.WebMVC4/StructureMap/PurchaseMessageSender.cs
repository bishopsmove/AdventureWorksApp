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
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, add the following
        // code to the Application_Start method in your Global.asax file.
        // Note: this will destroy and re-create your database with every model change.
        // 
        public PurchaseMessageSender()
	{
       

        

	}
        

        public DbSet<VendorProposal> VendorProposals { get; set; }
        //public DbSet<RequestForProposal> RequestForProposals { get; set; }
        public DbSet<ResponseForProposal> ResponseForProposals { get; set; }
        public DbSet<VendorSubmitProposalRequest> VendorSubmitProposalRequests { get; set; }
    }
}