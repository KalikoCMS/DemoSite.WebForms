namespace DemoSite.Templates.MasterPages {
    using KalikoCMS.Configuration;
    using KalikoCMS.WebForms.Framework;

    public partial class Demo : PageMaster {
        protected override void OnLoad(System.EventArgs e) {
            base.OnLoad(e);

            TopMenu.PageLink = SiteSettings.RootPage;

            if (CurrentPage.PageId == SiteSettings.Instance.StartPageId) {
                Container.CssClass = "startpage";
            }
        }
    }
}