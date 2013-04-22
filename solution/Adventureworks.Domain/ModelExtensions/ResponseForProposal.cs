using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Adventureworks.Domain
{
    [DataContract(Namespace = "http://adventureworks.com/contracts/purchasing")]
    public class ResponseForProposal
    {
        [DataMember(IsRequired = true)]
        public Guid RfpID { get; set; }
    }
}
