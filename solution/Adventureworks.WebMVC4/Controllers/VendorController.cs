using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StructureMap;
using Adventureworks.Domain5;
using Adventureworks.WebMVC4.Models;

namespace Adventureworks.WebMVC4.Controllers
{   
    public class VendorController : Controller
    {
        //private AdventureWorksEntitiesContainer context = ObjectFactory.GetInstance(typeof())
        private readonly IVendorPlusRepository vendorContext = (IVendorPlusRepository)ObjectFactory.GetInstance(typeof(IVendorPlusRepository));

        //
        // GET: /Vendor/

        public ViewResult Index()
        {
            return View(vendorContext.All.ToList());
        }

        //
        // GET: /Vendor/Details/5

        public ViewResult Details(int id)
        {
            VendorPlus vvendorwithaddress = vendorContext.Find(id);
            return View(vvendorwithaddress);
        }

        //
        // GET: /Vendor/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Vendor/Create

        [HttpPost]
        public ActionResult Create(VendorPlus vvendorwithaddress)
        {
            if (ModelState.IsValid)
            {
                vendorContext.InsertOrUpdate(vvendorwithaddress);
                vendorContext.Save();
                return RedirectToAction("Index");  
            }

            return View(vvendorwithaddress);
        }
        
        //
        // GET: /Vendor/Edit/5
 
        public ActionResult Edit(int id)
        {
            VendorPlus vvendorwithaddress = vendorContext.Find(id);
            return View(vvendorwithaddress);
        }

        //
        // POST: /Vendor/Edit/5

        [HttpPost]
        public ActionResult Edit(VendorPlus vvendorwithaddress)
        {
            if (ModelState.IsValid)
            {
                //vendorContext.Find(vvendorwithaddress.BusinessEntityID)).State = EntityState.Modified;
                vendorContext.Save();
                return RedirectToAction("Index");
            }
            return View(vvendorwithaddress);
        }

        //
        // GET: /Vendor/Delete/5
 
        public ActionResult Delete(int id)
        {
            VendorPlus vvendorwithaddress = vendorContext.Find(id);
            return View(vvendorwithaddress);
        }

        //
        // POST: /Vendor/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            //vVendorWithAddress vvendorwithaddress = vendorContext.Find(id);
            vendorContext.Delete(id);
            vendorContext.Save();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing) {
                vendorContext.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}