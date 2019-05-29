namespace DemoSite.Models {
    using KalikoCMS.Attributes;
    using KalikoCMS.Core;
    using KalikoCMS.PropertyType;

    [SiteSettings(AllowedTypes = new[] { typeof(NewsListPageType), typeof(StartPageType), typeof(ProductListType), typeof(ArticlePageType), typeof(SearchPageType) })]
    public class DemoSite : CmsSite {
        [Property("Company name")]
        public virtual StringProperty CompanyName { get; set; }
    }
}