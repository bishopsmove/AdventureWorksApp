using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace Adventureworks.Domain5.Interfaces
{
    public interface IPurchasingRepository
    {
        IEnumerable<RequestForProposal> RetrieveActive();
        IEnumerable<RequestForProposal> RetrieveFinished();
        RequestForProposal MapFrom(XElement elem);
        RequestForProposal Retrieve(Guid id);
    }
}
