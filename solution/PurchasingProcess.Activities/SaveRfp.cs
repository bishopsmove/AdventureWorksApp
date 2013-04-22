//  ----------------------------------------------------------------------------------
//  Microsoft Developer & Platform Evangelism
//  
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  
//  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
//  EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES 
//  OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
//  ----------------------------------------------------------------------------------
//  The example companies, organizations, products, domain names,
//  e-mail addresses, logos, people, places, and events depicted
//  herein are fictitious.  No association with any real company,
//  organization, product, domain name, email address, logo, person,
//  places, or events is intended or should be inferred.
//  ----------------------------------------------------------------------------------
using System;
using System.Activities;
using System.Activities.Hosting;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using Adventureworks.Domain;
using Adventureworks.FileRepository.Common;

namespace PurchasingProcess.Activities
{
    public class SaveRfp : CodeActivity<ResponseForProposal>
    {
        public InArgument<RequestForProposal> Rfp { get; set; }

        protected override ResponseForProposal Execute(CodeActivityContext context)
        {
            var requestForProposal = Rfp.Get(context);
            requestForProposal.ID = context.WorkflowInstanceId;

            //IOHelper.EnsureAllRfpFileExists();

            //// load the document
            //XElement doc = XElement.Load(IOHelper.GetAllRfpsFileName());

            //// get the Xml version of the Rfp, add it to the document and save it
            //if (requestForProposal != null)
            //{
            //    XElement e = SerializeRfp(requestForProposal);
            //    doc.Add(e);
            //}

            //doc.Save(IOHelper.GetAllRfpsFileName());

            IOHelper.EnsureAllRfpFileExists();

            // load the document
            XElement doc = XElement.Load(IOHelper.GetAllRfpsFileName());

            IEnumerable<XElement> current =
                                    from r in doc.Elements("requestForProposal")
                                    where r.Attribute("id").Value.Equals(requestForProposal.ID.ToString())
                                    select r;

            if (requestForProposal.Status == "Closed")
            {
                // erase nodes for the current rfp                    
                foreach (XElement xe in current)
                {
                    xe.Attribute("status").Value = "finished";
                }
            }
            else
            {
                // erase nodes for the current rfp                    
                foreach (XElement xe in current)
                {
                    xe.Remove();
                }

                // get the Xml version of the Rfp, add it to the document and save it
                if (requestForProposal != null)
                {
                    XElement e = SerializeRfp(requestForProposal);
                    doc.Add(e);
                }
            }

            doc.Save(IOHelper.GetAllRfpsFileName());

            return new ResponseForProposal
                        {
                            RfpID = requestForProposal.ID
                        };
        }

        XElement SerializeRfp(RequestForProposal rfp)
        {
            // main body of the rfp
            XElement ret =
               new XElement("requestForProposal",
                   new XAttribute("id", rfp.ID.ToString()),
                   new XAttribute("status", rfp.Status),
                       new XElement("creationDate", rfp.CreationDate),
                       new XElement("completionDate", rfp.CompletionDate),
                       new XElement("title", rfp.Title),
                       new XElement("description", rfp.Description));

            // add invited vendors
            XElement invitedVendors = new XElement("invitedVendors");
            foreach (Vendor vendor in rfp.InvitedVendors)
            {
                invitedVendors.Add(
                    new XElement("vendor",
                        new XAttribute("id", vendor.Id)));
            }
            ret.Add(invitedVendors);

            // add vendor proposals            
            XElement vendorProposals = new XElement("vendorProposals");
            foreach (VendorProposal proposal in rfp.VendorProposals.Values)
            {
                vendorProposals.Add(
                    new XElement("vendorProposal",
                        new XAttribute("vendorId", proposal.VendorId),
                        new XAttribute("date", proposal.Date),
                        new XAttribute("value", proposal.Value)));
            }
            ret.Add(vendorProposals);

            // add best proposal
            if (rfp.BestProposal != null && rfp.BestProposal.VendorId != 0)
            {
                ret.Add(
                    new XElement("bestProposal",
                        new XAttribute("vendorId", rfp.BestProposal.VendorId),
                        new XAttribute("date", rfp.BestProposal.Date),
                        new XAttribute("value", rfp.BestProposal.Value)));
            }

            return ret;
        }
    }
}