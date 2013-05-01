using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StructureMap;
using Adventureworks.Domain5;
using Adventureworks.WebMVC4.Filters;
using Adventureworks.WebMVC4.StructureMap;

namespace Adventureworks.WebMVC4.Controllers
{   
    [InitializePurchaseContext]
    public class PurchaseController : Controller
    {
        private PurchaseMessageSender context = (PurchaseMessageSender)ObjectFactory.GetInstance(typeof(PurchaseMessageSender));

        //
        // GET: /Default1/

        public ViewResult Index()
        {
            return View(context.VendorProposals.ToList());
        }

        //
        // GET: /Default1/Details/5

        public ViewResult Details(int id)
        {
            VendorProposal vendorproposal = context.VendorProposals.Single(x => x.VendorProposalId == id);
            return View(vendorproposal);
        }

        //
        // GET: /Default1/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Default1/Create

        [HttpPost]
        public ActionResult Create(VendorProposal vendorproposal)
        {
            if (ModelState.IsValid)
            {
                context.VendorProposals.Add(vendorproposal);
                context.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(vendorproposal);
        }
        
        //
        // GET: /Default1/Edit/5
 
        public ActionResult Edit(int id)
        {
            VendorProposal vendorproposal = context.VendorProposals.Single(x => x.VendorProposalId == id);
            return View(vendorproposal);
        }

        //
        // POST: /Default1/Edit/5

        [HttpPost]
        public ActionResult Edit(VendorProposal vendorproposal)
        {
            if (ModelState.IsValid)
            {
                //context.Entry(vendorproposal).State = EntityState.Modified;
                context.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vendorproposal);
        }

        //
        // GET: /Default1/Delete/5
 
        public ActionResult Delete(int id)
        {
            VendorProposal vendorproposal = context.VendorProposals.Single(x => x.VendorProposalId == id);
            return View(vendorproposal);
        }

        //
        // POST: /Default1/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            VendorProposal vendorproposal = context.VendorProposals.Single(x => x.VendorProposalId == id);
            context.VendorProposals.Remove(vendorproposal);
            context.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing) {
                context.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}