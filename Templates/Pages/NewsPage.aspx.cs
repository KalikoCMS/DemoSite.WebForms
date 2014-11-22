namespace DemoSite.Templates.Pages {
    using System;
    using System.Text;
    using KalikoCMS.Search;
    using KalikoCMS.WebForms.Framework;
    using Models;

    public partial class NewsPage : PageTemplate<NewsPageType> {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);

            RelatedPosts.Text = RenderRelatedPosts();
        }

        private string RenderRelatedPosts() {
            // Get the first 5 most simular pages based on the current page
            var searchResult = SearchManager.Instance.FindSimular(CurrentPage, 0, 5);

            // Build a list of the result
            var stringBuilder = new StringBuilder();
            stringBuilder.Append("<ul class=\"list-unstyled related\">");
            foreach (var searchHit in searchResult.Hits) {
                stringBuilder.AppendFormat("<li><a href=\"{0}\">{1}</a></li>", searchHit.Path, searchHit.Title);
            }
            stringBuilder.Append("</ul>");

            return stringBuilder.ToString();
        }
    }
}