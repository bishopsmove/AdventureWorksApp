//-----------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//-----------------------------------------------------------------------------

using System;
using System.ComponentModel.DataAnnotations;

namespace Adventureworks.Domain5
{

    
    public class VendorProposal
    {
        [Key]
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
