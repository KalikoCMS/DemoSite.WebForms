namespace DemoSite.Models {
    using System;
    using KalikoCMS.Attributes;
    using KalikoCMS.Core;

    /// <summary>
    /// This is a page type that will only act as a container and therefor has no additional properties.
    /// Setting AllowedTypes to only allow creation of other news lists and news pages under a news list page.
    /// </summary>
    [PageType("NewsList", "News list", "~/Templates/Pages/NewsListPage.aspx", 
        PageTypeDescription = "Used for news archives", 
        AllowedTypes = new[] { typeof(NewsListPageType), typeof(NewsPageType) },
        PreviewImage = "/Assets/Images/newslistpage.png")]
    public class NewsListPageType : CmsPage {
    }
}
