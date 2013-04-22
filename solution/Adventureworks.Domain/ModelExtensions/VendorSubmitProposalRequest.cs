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
    public class VendorSubmitProposalRequest
    {
        [DataMember(IsRequired = true)]
        public Guid ID { get; set; }

        [DataMember(IsRequired = true)]
        public int VendorId { get; set; }

        [DataMember(IsRequired = true)]
        public double Value { get; set; }


        public VendorSubmitProposalRequest()
        {
        }
    }
}
