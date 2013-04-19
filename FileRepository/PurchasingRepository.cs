using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Adventureworks.Domain;
using Adventureworks.Domain.Interfaces;
using Adventureworks.FileRepository.Common;

namespace Adventureworks.FileRepository
{
    [Export(typeof(IPurchasingRepository))]
    public class PurchasingRepository : IPurchasingRepository
    {
        public IEnumerable<RequestForProposal> RetrieveActive()
        {
            //  if no persistence file, exit
            if (!File.Exists(IOHelper.GetAllRfpsFileName()))
                return new List<RequestForProposal>();

            // load the document
            XElement doc = XElement.Load(IOHelper.GetAllRfpsFileName());

            // fetch active rfps
            return
                from rfp in doc.Descendants("requestForProposal")
                where (rfp.Attribute("status").Value.Equals("active"))
                select MapFrom(rfp);
        }

        // retrieve all finished Requests for Proposals
        public IEnumerable<RequestForProposal> RetrieveFinished()
        {
            //  if no persistence file, exit
            if (!File.Exists(IOHelper.GetAllRfpsFileName()))
                return new List<RequestForProposal>();

            // load the document
            XElement doc = XElement.Load(IOHelper.GetAllRfpsFileName());

            // fetch active rfps
            return
                from rfp in doc.Descendants("requestForProposal")
                where (rfp.Attribute("status").Value.Equals("finished"))
                select MapFrom(rfp);
        }

        // retrieve a Request for Proposal from the repository by Id 
        public RequestForProposal Retrieve(Guid id)
        {
            // load the document
            XElement doc = XElement.Load(IOHelper.GetAllRfpsFileName());

            // erase nodes for the current rfp
            IEnumerable<RequestForProposal> current =
                                    from r in doc.Elements("requestForProposal")
                                    where r.Attribute("id").Value.Equals(id.ToString())
                                    select MapFrom(r);

            return current.First<RequestForProposal>();
        }

        // map a Request for Proposal from a Linq to Xml XElement
        public RequestForProposal MapFrom(XElement elem)
        {
            RequestForProposal rfp = new RequestForProposal();

            rfp.ID = new Guid(elem.Attribute("id").Value);
            rfp.Status = elem.Attribute("status").Value;
            rfp.Title = elem.Element("title").Value;
            rfp.Description = elem.Element("description").Value;
            rfp.CreationDate = DateTime.Parse(elem.Element("creationDate").Value, new CultureInfo("EN-us"));

            if (elem.Element("completionDate") != null)
                rfp.CompletionDate = DateTime.Parse(elem.Element("completionDate").Value, new CultureInfo("EN-us"));

            // invited vendors
            foreach (XElement vendorElem in elem.Element("invitedVendors").Elements("vendor"))
            {
                Vendor vendor = VendorRepository.Retrieve(Convert.ToInt32(vendorElem.Attribute("id").Value, new CultureInfo("EN-us")));
                rfp.InvitedVendors.Add(vendor);
            }

            // map received proposals in the list
            foreach (var proposal in elem.Element("vendorProposals").Elements("vendorProposal"))
            {
                Vendor vendor = VendorRepository.Retrieve(int.Parse(proposal.Attribute("vendorId").Value, new CultureInfo("EN-us")));
                VendorProposal vendorProposal = new VendorProposal(vendor.Id);
                vendorProposal.Value = double.Parse(proposal.Attribute("value").Value, new CultureInfo("EN-us"));
                vendorProposal.Date = DateTime.Parse(proposal.Attribute("date").Value, new CultureInfo("EN-us"));
                rfp.VendorProposals.Add(vendor.Id, vendorProposal);
            }

            // map best proposal
            if (elem.Element("bestProposal") != null)
            {
                Vendor bestVendor = VendorRepository.Retrieve(Convert.ToInt32(elem.Element("bestProposal").Attribute("vendorId").Value, new CultureInfo("EN-us")));
                rfp.BestProposal = new VendorProposal(bestVendor.Id);
                rfp.BestProposal.Value = double.Parse(elem.Element("bestProposal").Attribute("value").Value, new CultureInfo("EN-us"));
                rfp.BestProposal.Date = DateTime.Parse(elem.Element("bestProposal").Attribute("date").Value, new CultureInfo("EN-us"));
            }

            return rfp;
        }
    }
}
