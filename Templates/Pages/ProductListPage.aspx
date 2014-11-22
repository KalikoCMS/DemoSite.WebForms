<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductListPage.aspx.cs" Inherits="DemoSite.Templates.Pages.ProductListPage" MasterPageFile="../MasterPages/Demo.Master" %>
<%@ Import Namespace="DemoSite.FakeStore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="row">
    <div class="col-lg-9">
      <h1><%=CurrentPage.Headline %></h1>
      
      <%=CurrentPage.MainBody %>

      <asp:Repeater runat="server" ID="ProductList">
        <HeaderTemplate>
          <ul class="list-unstyled products">
        </HeaderTemplate>
        <ItemTemplate>
          <li>
            <h2><a href="<%#string.Format("{0}{1}/", CurrentPage.PageUrl, ((Product)Container.DataItem).Id) %>"><%#((Product)Container.DataItem).Name %></a></h2>
            <p><%#((Product)Container.DataItem).Description %></p>
          </li>
        </ItemTemplate>
        <FooterTemplate>
          </ul>
        </FooterTemplate>
      </asp:Repeater>

    </div>
  </div>
</asp:Content>
