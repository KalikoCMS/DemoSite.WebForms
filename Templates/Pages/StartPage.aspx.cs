
namespace DemoSite.Templates.Pages {
    using KalikoCMS;
    using KalikoCMS.Configuration;
    using KalikoCMS.Core;
    using KalikoCMS.Core.Collections;
    using KalikoCMS.WebForms.Framework;
    using Models;
    using System;

    public partial class StartPage : PageTemplate<StartPageType> {
        protected void Page_Load(object sender, EventArgs e) {
            PopulateNewsList();
        }

        private void PopulateNewsList() {
            // Get the page type based on our NewsPageType deinition
            var pageType = PageType.GetPageType(typeof (NewsPageType));
            
            // Add a filter to only include pages that are news pages
            NewsList.Filter = page => page.PageTypeId == pageType.PageTypeId;
            
            // Get all pages from the web site
            var pageCollection = PageFactory.GetPageTreeFromPage(SiteSettings.RootPage, PublishState.Published);
            
            // Sort the pages on publishing dates
            pageCollection.Sort(SortOrder.StartPublishDate, SortDirection.Descending);
            
            // Feed the collection to our news list control
            NewsList.DataSource = pageCollection;
        }
    }
}