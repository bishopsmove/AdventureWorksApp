//-----------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation.  All rights reserved.
//-----------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ComponentModel.DataAnnotations;

namespace Adventureworks.Domain5
{

    [DataContract(Namespace="http://adventureworks.com/contracts/purchasing")]
    public class VendorSubmitProposalRequest
    {
        [Key]
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
