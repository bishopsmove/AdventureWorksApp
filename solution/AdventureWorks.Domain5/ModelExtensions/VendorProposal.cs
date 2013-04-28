//-----------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//-----------------------------------------------------------------------------

using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Adventureworks.Domain5
{

    [Table("VendorProposals")]
    public class VendorProposal
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int VendorProposalId { get; set; }
        public int VendorId { get; set; }
        public DateTime Date { get; set; }
        public double Value { get; set; }

        public VendorProposal() 
        { 
        }

        public VendorProposal(int vendorId)
        {
            this.VendorId = vendorId;
            this.Value = 0;
        }
    }
}
