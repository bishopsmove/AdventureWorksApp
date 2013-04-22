//-----------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//-----------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using Adventureworks.Domain;

namespace Adventureworks.Domain
{

    [DataContract(Namespace="http://adventureworks.com/contracts/purchasing")]
    public class RequestForProposal
    {
        [DataMember(IsRequired = true)]
        public Guid ID { get; set; }

        [DataMember(IsRequired = true)]
        public string Title { get; set; }

        [DataMember(IsRequired = true)]
        public string Description { get; set; }

        [DataMember(IsRequired = true)]
        public IList<Vendor> InvitedVendors { get; set; }

        [DataMember(IsRequired = true)]
        public DateTime CreationDate { get; set; }

        [DataMember(IsRequired = true)]
        public string Status { get; set; }

        [DataMember(IsRequired = false)]
        public IDictionary<int, VendorProposal> VendorProposals { get; set; }

        public VendorProposal BestProposal { get; set; }
        public DateTime CompletionDate { get; set; }

        public RequestForProposal()
        {
            this.InvitedVendors = new List<Vendor>();
            this.VendorProposals = new Dictionary<int, VendorProposal>();
            this.CreationDate = DateTime.Now;
            this.Status = "active";
        }

        // register a proposal from a vendor within this instance
        public void RegisterProposal(int vendorId, double value)
        {
            VendorProposals.Add(
                vendorId,
                new VendorProposal
                {
                    VendorId = vendorId,
                    Value = value,
                    Date = DateTime.Now
                });
        }

        // returns true if a vendor is invited to submit a proposal within this instance
        public bool IsInvited(int vendorId)
        {
            foreach (Vendor vendor in this.InvitedVendors)
            {
                if (vendor.Id.Equals(vendorId))
                    return true;
            }
            return false;
        }

        // returns true if this RfP is finished
        public bool IsFinished()
        {
            return this.Status.Equals("finished");
        }

        // returns a string with all the invited vendors.
        public string GetInvitedVendorsStatus()
        {
            return GetInvitedVendorsStatus(false);
        }        

        // returns a string with all the invited vendors. If the status flag is
        // true, it also add the status of each vendor proposal
        public string GetInvitedVendorsStatus(bool addStatus)
        {
            string ret = string.Empty;                
            foreach (Vendor vendor in this.InvitedVendors)
            {
                if (ret != string.Empty)
                    ret += ",";

                ret += vendor.Name;

                if (addStatus)
                {
                    if (this.VendorProposals.ContainsKey(vendor.Id))
                    {
                        ret += " (received)";
                    }
                    else
                    {
                        ret += " (waiting)";
                    }
                }
            }

            return ret;
        }
        
    }
}
