

namespace DemoSite.Templates.Pages {
    using KalikoCMS.WebForms.Framework;
    using FakeStore;
    using System;

    public partial class ProductPage : PageTemplate {
        protected void Page_Load(object sender, EventArgs e) {
            // Our IPageExtender should have attached a productid
            var productId = Request.QueryString["productid"];

            // Get the product from our fake product store
            var product = FakeProductDatabase.GetProduct(productId);

            // Lets populate the controls with out product data
            Heading.Text = product.Name;
            Description.Text = product.Description;

            // Get all the products and bind it to our menu repeater
            ProductList.DataSource = FakeProductDatabase.GetProducts();
            ProductList.DataBind();
        }
    }
}