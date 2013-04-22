using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.ComponentModel.Composition;
using Adventureworks.Domain;
using Adventureworks.Domain.Interfaces;
using Adventureworks.WebMVC3.PurchasingService;
using Adventureworks.FileRepository;

namespace Adventureworks.Web.Controllers
{
    public class PurchasingController : Controller
    {
        private readonly IPurchasingRepository _purchasingRepository;

        [ImportingConstructor]
        public PurchasingController(IPurchasingRepository purchasingRepository)
        {
            this._purchasingRepository = purchasingRepository;
        }

        //
        // GET: /Purchasing/

        public ActionResult Index()
        {
            IEnumerable<RequestForProposal> activeRfps = _purchasingRepository.RetrieveActive();

            return View(activeRfps);
        }

        public ActionResult CreateRfp()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateRfp(RequestForProposal rfp)
        {
            IPurchasingService purchasingService = new PurchasingServiceClient();
            rfp.Status = "active";
            string[] invitedVendors = Request.Form["InvitedVendors"].Split(',');
            foreach (var invitedVendor in invitedVendors)
            {
                rfp.InvitedVendors.Add(VendorRepository.Retrieve(int.Parse(invitedVendor)));
            }

            try
            {
                SubmitPurchasingProposalResponse response = purchasingService.SubmitPurchasingProposal(new SubmitPurchasingProposalRequest(rfp));
            }
            catch (Exception)
            {
                
                throw;
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult VendorProposal(VendorSubmitProposalRequest svp)
        {
            IPurchasingService purchasingService = new PurchasingServiceClient();

            try
            {
                purchasingService.SubmitVendorProposal(new SubmitVendorProposalRequest(svp));
            }
            catch (Exception)
            {
                
                throw;
            }

            return RedirectToAction("Index");
        }

        public ActionResult VendorProposal(Guid id, int vendorId)
        {
            RequestForProposal rfp = _purchasingRepository.Retrieve(id);
            ViewBag.VendorId = vendorId;

            return View(rfp);
        }

        public ActionResult FinishedProposals()
        {
            IEnumerable<RequestForProposal> finishedRfps = _purchasingRepository.RetrieveFinished();

            return View(finishedRfps);
        }
    }
}
