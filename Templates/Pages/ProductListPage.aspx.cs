namespace DemoSite.Templates.Pages {
    using KalikoCMS.WebForms.Framework;
    using Models;
    using FakeStore;

    public partial class ProductListPage : PageTemplate<ProductListType> {
        protected override void OnLoad(System.EventArgs e) {
            base.OnLoad(e);

            ProductList.DataSource = FakeProductDatabase.GetProducts();
            ProductList.DataBind();
        }
    }
}