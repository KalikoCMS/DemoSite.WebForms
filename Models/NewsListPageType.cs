namespace DemoSite.Models {
    using KalikoCMS.Attributes;
    using KalikoCMS.Core;

    /// <summary>
    /// This is a page type that will only act as a container and therefor has no additional properties.
    /// </summary>
    [PageType("NewsList", "News list", "~/Templates/Pages/NewsListPage.aspx", PageTypeDescription = "Used for news archives")]
    public class NewsListPageType : CmsPage {
    }
}
