<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArticlePage.aspx.cs" Inherits="DemoSite.Templates.Pages.ArticlePage" MasterPageFile="../MasterPages/Demo.Master" %>
<%@ Register TagPrefix="site" tagName="Breadcrumbs" src="../Units/Breadcrumbs.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <site:Breadcrumbs runat="server" />

  <div class="row">
    <div class="left-menu col-lg-3">
      <cms:MenuTree ID="LeftMenu" AutoBind="True" runat="server">
        <StartItemTemplate><li></StartItemTemplate>
        <EndItemTemplate></li></EndItemTemplate>
        <NewLevelTemplate><ul class="nav nav-pills nav-stacked"></NewLevelTemplate>
        <EndLevelTemplate></ul></EndLevelTemplate>
        <ItemTemplate>
          <a href="<%#Container.CurrentPage.PageUrl %>"><%#Container.CurrentPage.PageName %></a>
        </ItemTemplate>
        <SelectedItemTemplate>
          <a href="<%#Container.CurrentPage.PageUrl %>" class="active"><%#Container.CurrentPage.PageName %></a>
        </SelectedItemTemplate>
      </cms:MenuTree>
    </div>
    <div class="col-lg-9">
      <%=CurrentPage.TopImage.ToHtml() %>
      <h1><%=CurrentPage.Headline %></h1>
      <p class="preamble"><%=CurrentPage.Preamble %></p>
      <%=CurrentPage.MainBody %>
      <% if (CurrentPage.Tags.Tags.Count > 0) { %>
        <p class="tags">
          This article was tagged with: <strong><%=CurrentPage.Tags %></strong>
        </p>
      <% } %>
    </div>
  </div>
</asp:Content>
