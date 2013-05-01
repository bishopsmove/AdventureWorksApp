using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Threading;
using System.Web.Mvc;
using WebMatrix.WebData;
using StructureMap;
using Adventureworks.WebMVC4.Models;
using Adventureworks.WebMVC4.StructureMap;
//using Adventureworks.Domain5.ContextExtensions;
using Adventureworks.Domain5;

namespace Adventureworks.WebMVC4.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class InitializePurchaseContextAttribute : ActionFilterAttribute
    {
        //private static PurchasingInitializer _initializer;
        //private static object _initializerLock = new object();
        //private static bool _isInitialized;

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // Ensure Purchasing LocalDB is initialized only once per app start
            //LazyInitializer.EnsureInitialized(ref _initializer, ref _isInitialized, ref _initializerLock);
            Database.SetInitializer(new PurchasingInitializer());
        }

        
    }

    public class PurchasingInitializer : //DropCreateDatabaseAlways<PurchaseMessageSender>
       DropCreateDatabaseIfModelChanges<PurchaseMessageSender>
    {

        protected override void Seed(PurchaseMessageSender context)
        {
            SeedDatabase(context);
        }

        public static void SeedDatabase(PurchaseMessageSender context)
        {
            _baseCreatedAtDate = new DateTime(2013, 4, 3, 14, 30, 0);

            var proposals = new[] {
                // VendorId, Date, Value
                CreateProposal(1492, _baseCreatedAtDate.AddDays(-10), 2400),
                CreateProposal(1546, _baseCreatedAtDate.AddDays(-5), 3000),
                CreateProposal(1672, _baseCreatedAtDate.AddDays(-3), 2900)
                
           };

            Array.ForEach(proposals, t => context.VendorProposals.Add(t));

            context.SaveChanges(); // Save 'em
        }

        private static VendorProposal CreateProposal(
            int _VendorID, DateTime _submitDate, double _submitValue)
        {
            _baseCreatedAtDate = _baseCreatedAtDate.AddMinutes(1);
            return new VendorProposal
            {
                VendorId = _VendorID,
                Date = _submitDate,
                Value = _submitValue
            };
        }

        private static DateTime _baseCreatedAtDate;

        public static void PurgeDatabase(PurchasingContext context)
        {
            var proposals = context.VendorProposals;
            foreach (var proposal in proposals)
            {
                proposals.Remove(proposal);
            }

            context.SaveChanges();
        }

    }
}