//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Adventureworks.Domain5
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class vVendorWithAddress
    {
        [Key]
    	public int BusinessEntityID { get; set; }
    	public string Name { get; set; }
    	public string AddressType { get; set; }
    	public string AddressLine1 { get; set; }
    	public string AddressLine2 { get; set; }
    	public string City { get; set; }
    	public string StateProvinceName { get; set; }
    	public string PostalCode { get; set; }
    	public string CountryRegionName { get; set; }
    }
}
