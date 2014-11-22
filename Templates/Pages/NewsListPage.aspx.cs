namespace DemoSite.Templates.Pages {
    using System;
    using KalikoCMS;
    using KalikoCMS.Core;
    using KalikoCMS.Core.Collections;
    using KalikoCMS.WebForms.Framework;
    using Models;

    public partial class NewsListPage : PageTemplate<NewsListPageType> {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);

            PopulateNewsList();

            NewsPager.TargetControl = NewsList;

            YearList.PageLink = CurrentPage.RootId;
        }

        private void PopulateNewsList() {
            // Get the page type for our news pages
            var pageType = PageType.GetPageType(typeof (NewsPageType));

            // Add this as a filter predicate to our page list controll
            NewsList.Filter = page => page.PageTypeId == pageType.PageTypeId;

            // Get all pages under this page
            var pageCollection = PageFactory.GetPageTreeFromPage(CurrentPage.PageId, PublishState.Published);

            // Sort by publish date
            pageCollection.Sort(SortOrder.StartPublishDate, SortDirection.Descending);

            // Set the data source
            NewsList.DataSource = pageCollection;

            // SIDE NOTE:
            //
            // The list will apply the filter when rendering. You can also get the page collection pre-filtered by 
            // using the following call:
            //
            //   PageFactory.GetPageTreeFromPage(CurrentPage.PageId, p => p.IsAvailable && p.PageTypeId == pageType.PageTypeId);
            //
            // p.IsAvailable ensures that the page is published, without it you will get unpublished pages as well
        }
    }
}