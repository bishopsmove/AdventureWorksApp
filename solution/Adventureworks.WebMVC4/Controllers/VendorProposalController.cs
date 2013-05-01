using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Adventureworks.Domain5;
using Adventureworks.Domain5.Interfaces;
using Adventureworks.WebMVC4.Models;
using Adventureworks.WebMVC4.Filters;
using StructureMap;
using Microsoft.Practices.ServiceLocation;

namespace Adventureworks.WebMVC4.Controllers
{   
	[InitializePurchaseContext]
	public class VendorProposalController : Controller
	{
		private readonly IVendorProposalRepository vendorproposalRepository;

		//// If you are using Dependency Injection, you can delete the following constructor
		//public VendorProposalController() : this(new VendorProposalRepository())
		//{
		//}

		public VendorProposalController(IVendorProposalRepository vendorproposalRepository)
		{
			this.vendorproposalRepository = vendorproposalRepository; //(IVendorProposalRepository)ObjectFactory.GetInstance(typeof(IVendorProposalRepository));
		}

		//
		// GET: /VendorProposal/

		public ViewResult Index()
		{
			//vendorproposalRepository = ObjectFactory.GetInstance<IVendorProposalRepository>();
			return View(vendorproposalRepository.All);
		}

		//
		// GET: /VendorProposal/Details/5

		public ViewResult Details(int id)
		{
			return View(vendorproposalRepository.Find(id));
		}

		//
		// GET: /VendorProposal/Create

		public ActionResult Create()
		{
			return View();
		} 

		//
		// POST: /VendorProposal/Create

		[HttpPost]
		public ActionResult Create(VendorProposal vendorproposal)
		{
			if (ModelState.IsValid) {
				vendorproposalRepository.InsertOrUpdate(vendorproposal);
				vendorproposalRepository.Save();
				return RedirectToAction("Index");
			} else {
				return View();
			}
		}
		
		//
		// GET: /VendorProposal/Edit/5
 
		public ActionResult Edit(int id)
		{
			 return View(vendorproposalRepository.Find(id));
		}

		//
		// POST: /VendorProposal/Edit/5

		[HttpPost]
		public ActionResult Edit(VendorProposal vendorproposal)
		{
			if (ModelState.IsValid) {
				vendorproposalRepository.InsertOrUpdate(vendorproposal);
				vendorproposalRepository.Save();
				return RedirectToAction("Index");
			} else {
				return View();
			}
		}

		//
		// GET: /VendorProposal/Delete/5
 
		public ActionResult Delete(int id)
		{
			return View(vendorproposalRepository.Find(id));
		}

		//
		// POST: /VendorProposal/Delete/5

		[HttpPost, ActionName("Delete")]
		public ActionResult DeleteConfirmed(int id)
		{
			vendorproposalRepository.Delete(id);
			vendorproposalRepository.Save();

			return RedirectToAction("Index");
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				vendorproposalRepository.Dispose();
			}
			base.Dispose(disposing);
		}
	}
}

