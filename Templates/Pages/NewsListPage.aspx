<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Demo.Master" AutoEventWireup="true" CodeBehind="NewsListPage.aspx.cs" Inherits="DemoSite.Templates.Pages.NewsListPage" %>
<%@ Register TagPrefix="site" tagName="Breadcrumbs" src="../Units/Breadcrumbs.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <site:Breadcrumbs ID="Breadcrumbs1" runat="server" />

  <h1><%=CurrentPage.PageName %></h1>
  <div class="row">
    <div class="col-lg-9">
      <cms:PageList ID="NewsList" AutoBind="True" PageSize="10" runat="server">
        <HeaderTemplate>
          <ul class="list-unstyled">
        </HeaderTemplate>
        <ItemTemplate>
          <li>
            <h2><a href="<%#Container.CurrentPage.PageUrl %>"><%#Container.CurrentPage.PageName %></a></h2>
            <p>
              (<%#Container.CurrentPage.StartPublish.Value.ToShortDateString() %>)
              <%#Container.CurrentPage.Property["Preamble"] %>
              <a href="<%#Container.CurrentPage.PageUrl%>">Read more</a>
            </p>
          </li>
        </ItemTemplate>
        <FooterTemplate>
          </ul>
        </FooterTemplate>
      </cms:PageList>
      <cms:Pager ID="NewsPager" AutoBind="True" runat="server" />
    </div>
    <div class="col-lg-3">
      <cms:MenuList ID="YearList" AutoBind="True" SortOrder="PageName" runat="server">
        <HeaderTemplate>
          <div class="list-group">
          <span class="list-group-item active">Archive</span>
        </HeaderTemplate>
        <ItemTemplate>
          <a href="<%#Container.CurrentPage.PageUrl %>" class="list-group-item"><%#Container.CurrentPage.PageName %></a>
        </ItemTemplate>
        <FooterTemplate>
          </div>
        </FooterTemplate>
      </cms:MenuList>
    </div>
  </div>
</asp:Content>
