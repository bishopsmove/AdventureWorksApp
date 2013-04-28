using System;
using System.Data.Entity;
//using Adventureworks.Domain5.ContextExtensions;

namespace Adventureworks.WebMVC4.Models
{
    public class AdventureWorksInitializer : DropCreateDatabaseIfModelChanges<PurchasingContext>
    {
    }
}