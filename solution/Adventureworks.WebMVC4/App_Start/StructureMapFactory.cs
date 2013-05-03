using System;
using System.Data.Entity;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using StructureMap;
using StructureMap.Configuration.DSL;
using MvcExtensions.StructureMap;
using System.Collections.Specialized;
using Adventureworks.Domain5;
using Adventureworks.Domain5.Interfaces;
using Adventureworks.WebMVC4.Models;

namespace Adventureworks.WebMVC4
{

    //Thanks to Dr. Song Li for this section: http://www.codeproject.com/Articles/135114/Dependency-Injection-with-StructureMap-in-ASP-NET
    // StructureMap ContollerFactory
    public class StructureMapControllerFactory : DefaultControllerFactory
    {
        protected override IController GetControllerInstance(RequestContext requestContext, Type controllerType)
        {
            try
            {
                return ((requestContext == null) || (controllerType == null)) ? base.GetControllerInstance(requestContext, controllerType)
                       : ObjectFactory.GetInstance(controllerType) as IController;

                //    return null;

                //return (Controller)ObjectFactory.GetInstance(controllerType);
            }
            catch (StructureMapException)
            {
                System.Diagnostics.Debug.WriteLine(ObjectFactory.WhatDoIHave());
                throw new Exception(ObjectFactory.WhatDoIHave());
            }
        }
    }

    public static class Bootstrapper
    {
        public static void Run()
        {
            

            //I don't prefer to use XML at this point.
            //ObjectFactory.Initialize(x =>
            //{
            //    x.AddConfigurationFromXmlFile("StructureMap.xml");
            //});

            //Does same thing as above. Only this will require a line for each Interface and Concrete "pluggable" in the Registry.
            ObjectFactory.Initialize(x => { x.AddRegistry<RepositoryRegistry>(); });
            

            ControllerBuilder.Current
                .SetControllerFactory(new StructureMapControllerFactory());

        }
    }

    public class RepositoryRegistry : Registry
    {
        public RepositoryRegistry()
        {
            //For<DbContext>().HttpContextScoped().Use(() => new AdventureWorksEntitiesContainer());
            //For<IVendorProposalRepository>().HttpContextScoped().Use<VendorProposalRepository>(); //.Ctor<string>("connectionString").Named("VendorProposalConnection");
            For<IProductSubcategoryRepository>().Use<ProductSubcategoryRepository>();
            For<IProductModelRepository>().HttpContextScoped().Use<ProductModelRepository>();
            For<IProductRepository>().HttpContextScoped().Use<ProductRepository>();
            For<IShoppingCartItemRepository>().HttpContextScoped().Use<ShoppingCartItemRepository>();
            For<IVendorPlusRepository>().HttpContextScoped().Use<VendorPlusRepository>();
            For<IProductCategoryRepository>().HttpContextScoped().Use<ProductCategoryRepository>();
            //For<PurchasingContext>().HttpContextScoped().Use(() => new IDatabaseInitializer<PurchasingContext>());
        }
    }
}