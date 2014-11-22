
namespace DemoSite.Templates.Pages {
    using System;
    using System.Text;
    using KalikoCMS.WebForms.Framework;
    using KalikoCMS.Search;
    using Models;

    public partial class SearchPage : PageTemplate<SearchPageType> {
        private const int PageSize = 5;

        protected void Page_Load(object sender, EventArgs e) {
            // Get the search terms from the querystring
            var query = Request.QueryString["q"];
            
            // Try to get the pager value, defaults to first page
            int page;
            int.TryParse(Request.QueryString["p"], out page);

            Query.Text = query;

            // If a search term was defined perform the search
            if (!string.IsNullOrEmpty(query)) {
                PerformSearch(query, page);
            }
        }


        private void PerformSearch(string searchString, int page) {
            // Build the query and tell the search engine that we want the additional fields "category" and "summary"
            var searchQuery = new SearchQuery(searchString) {
                MetaData = new[] {"category", "summary"},
                NumberOfHitsToReturn = PageSize,
                ReturnFromPosition = PageSize*page
            };

            // Perform the searh
            var result = SearchManager.Instance.Search(searchQuery);

            var stringBuilder = new StringBuilder();

            if (result.NumberOfHits > 0) {
                stringBuilder.AppendFormat("<p>{0} hits ({1} seconds)</p>", result.NumberOfHits, decimal.Round((decimal)result.SecondsTaken, 3));
                RenderResultList(result, stringBuilder);
                RenderPager(searchString, page, result, stringBuilder);
            }
            else {
                stringBuilder.Append("<p><i>No pages were found matching the search criteria.</i></p>");
            }

            Result.Text = stringBuilder.ToString();
        }

        private void RenderPager(string searchString, int page, SearchResult result, StringBuilder stringBuilder) {
            var numberOfPages = (int)Math.Ceiling((double)result.NumberOfHits/PageSize);

            stringBuilder.Append("<ul class=\"pagination\">");
            for (var i = 0; i < numberOfPages; i++) {
                var url = Request.Path + "?q=" + Server.UrlEncode(searchString) + "&p=" + i;
                stringBuilder.AppendFormat("<li {0}><a href=\"{1}\">{2}</a></li>", (i == page ? "class=\"active\"" : ""), url, (i + 1));
            }
            stringBuilder.Append("</ul>");
        }

        private static void RenderResultList(SearchResult result, StringBuilder stringBuilder) {
            foreach (var hit in result.Hits) {
                // Render link and title
                stringBuilder.AppendFormat("<p><a href=\"{0}\">{1}</a><br/>", hit.Path, hit.Title);
                
                // Render textual link and hidden comment with the search score for this particular hit
                stringBuilder.AppendFormat("<span class=\"url\">{0}</span><!-- [{1}]--><br/>", hit.Path, hit.Score);
                
                // Get the exerpt
                var summary = hit.Excerpt;

                // If no exerpt was found, try get the summary
                if (string.IsNullOrEmpty(summary) && hit.MetaData.ContainsKey("summary")) {
                    summary = hit.MetaData["summary"];
                }

                // If exerpt or summary present, render it
                if (!string.IsNullOrEmpty(summary)) {
                    stringBuilder.AppendFormat("{0}<br/>", summary);
                }

                // Render the category that the page is indexed in
                stringBuilder.AppendFormat("<span class=\"label label-warning\">{0}</span></p>", hit.MetaData["category"]);
            }
        }
    }
}