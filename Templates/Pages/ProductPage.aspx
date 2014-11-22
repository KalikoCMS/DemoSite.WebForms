<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="DemoSite.Templates.Pages.ProductPage" MasterPageFile="../MasterPages/Demo.Master" %>
<%@ Register TagPrefix="site" tagName="Breadcrumbs" src="../Units/Breadcrumbs.ascx" %>
<%@ Import Namespace="DemoSite.FakeStore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="row">
    <div class="left-menu col-lg-2">
      <asp:Repeater runat="server" ID="ProductList">
        <HeaderTemplate>
          <div class="list-group">
            <span class="list-group-item active">Products</span>
        </HeaderTemplate>
        <ItemTemplate>
          <a href="<%#string.Format("{0}{1}/", CurrentPage.PageUrl, ((Product)Container.DataItem).Id) %>" class="list-group-item"><%#((Product)Container.DataItem).Name %></a>
        </ItemTemplate>
        <FooterTemplate>
          </div>
        </FooterTemplate>
      </asp:Repeater>
    </div>
    <div class="col-lg-8">
      <h1><asp:Literal runat="server" ID="Heading" /></h1>
      <p class="preamble"><asp:Literal runat="server" ID="Description" /></p>
      <p>
        This is no ordinary page. Although it has it's own URL all this information is kept in another system. This page is generated from a fake product database 
        using the <code>IPageExtender</code> functionality. This is a great way to present information without the need to store them in two places.
      </p>
      <p>
        We can always access the ancestor page (the one implementing the extender) by using <code>CurrentPage</code>. In this case our ancestor is <b><%=CurrentPage.PageName %></b>.
      </p>
      <p>
        To learn more about how to extend your pages with content from other systems <a href="http://kaliko.com/cms/get-started/page-extenders/">learn about page extenders here</a>.
      </p>
    </div>
  </div>
</asp:Content>
