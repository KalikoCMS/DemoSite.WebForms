

namespace DemoSite.Templates.Pages {
    using KalikoCMS.WebForms.Framework;
    using DemoSite.Models;
    using System;

    public partial class ArticlePage : PageTemplate<ArticlePageType> {
        protected void Page_Load(object sender, EventArgs e) {
            LeftMenu.PageLink = CurrentPage.RootId;
        }
    }
}