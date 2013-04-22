//-----------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//-----------------------------------------------------------------------------

using System;

namespace Adventureworks.Domain
{

    [Serializable]
    public class VendorProposal
    {
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
