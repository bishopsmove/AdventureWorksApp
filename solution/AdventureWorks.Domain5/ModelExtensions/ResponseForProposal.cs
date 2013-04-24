using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Adventureworks.Domain5
{
    [DataContract(Namespace = "http://adventureworks.com/contracts/purchasing")]
    public class ResponseForProposal
    {
        [Key]
        [DataMember(IsRequired = true)]
        public Guid RfpID { get; set; }
    }
}
