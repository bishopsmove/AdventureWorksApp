# AdventureWorksApp

Currently building at [Qhode.com](http://www.qhode.com/projects/3b878cd2-5cec-42c9-99c8-a1ab017394c3)

This VS2010 solution is based on the work posted by [SuperTigerZou](http://www.codeplex.com/site/users/view/supertigerzou) at https://advsampleapp.codeplex.com/. This posting of the original solution is in keeping with Section 3.1 of the [CDDL](http://advsampleapp.codeplex.com/license). It provides a working sample of ASP.Net MVC3, WF, MEF, EF and WCF technology and achitecture utillizing the AdventureWorks sample database. The solution on Codeplex was last updated (as of this posting) 23 Feb 2011.

## Solution Origins

SuperTigerZou developed a good structure with this solution, evident by the compartmentalization of the different data source repositories and Entity Framework to their respective projects. The MVC layout was probably more typical boilerplate of 2011 MVC3, with a separation of layouts between desktop and mobile platforms and lack of resource bundling, but also with a healthy dose of jquery and jquery-ui to support the UX.

##Solution Update

I attempted to contact SuperTigerZou before posting this update to Github to allow his feedback and look at joining efforts. The original solution on Codeplex is currectly managed via TFS, so forking directly was not an option. If his solution is ever switched over to Git, instead of TFS, then I will adjust this posting accordingly. SuperTigerZou deserves most of the credit for assembling the solution and posting to Codeplex, regardless of the solution's origins before that.

I have been recently frustrated in the poor examples established in VS2010 MVC project templates of a flexible design. Previous samples of MVC4 that I had worked with involved the simplified ToDo database/app , but I wanted a sample with a more complex data model. I found this solution in a search for any samples utilizing MVC, Entity Framework and the AdventureWorks sample database. I already had the database set up locally. So, with a slight adjustment to the web application, switching it to a web project, and an adjustment to the web.config and .csproj file of the web project to properly resolve the web.webpages assembly, once the solution was properly built, the MVC project started up without a hitch. 

From this point, all effort has been to update and improve without reducing functionality. Improvement should be defined here as a reduction in code/markup, positively impacting the maintenance needs of the solution. Web.Optimization is in use, as this assembly was not available until Sept 2011, about 6 months after the last update of the original solution. I have also established a stricter demarcation of the MVC project and companion test project, renaming it to .WebMVC3 and .MebMVC3.Tests, respectively. This allows me the freedom to add an MVC4/Tests project series to the solution, providing a side-by-side comparison between MVC3 and MVC4 projects and hopefully providing a needed spotlight on the benefits of MVC4 over MVC3.

Some of the MVC4 retro-fit is leveraged through MvcScaffolding and the EF 5.x DbContext, with the end goal of a more robust feature-set in the sample app than the original MVC3 edition had with less initial effort. 

My hope from this effort is to help anyone who is trying to grapple with MVC3/4, Entity Framework, or some of the newer aspects of HTML5/CSS3/MVC4 utilizing toolsets like requireJS, KnockoutJS, SammyJS, jquery and/or jquery-ui. Additionally, I hope to see how MEF integrates with WebAPI in a Database First fashion and what that means to the likes of BreezeJS or JayData.

### Contact

Blog (currently down): http://blog.ownby.net
Twitter: [Bishops_move](http:twitter.com/Bishops_move)


## License

The [CDDL](http://advsampleapp.codeplex.com/license) that governs the Codeplex-hosted solution is still in play for this solution.