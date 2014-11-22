<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Demo.Master" AutoEventWireup="true" CodeBehind="NewsPage.aspx.cs" Inherits="DemoSite.Templates.Pages.NewsPage" %>

<%@ Register TagPrefix="site" TagName="Breadcrumbs" Src="../Units/Breadcrumbs.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <site:Breadcrumbs ID="Breadcrumbs1" runat="server" />

  <div class="row">
    <div class="col-lg-9">
      <h1><%=CurrentPage.Headline %></h1>
      <p class="preamble"><%=CurrentPage.Preamble %></p>
      <%=CurrentPage.MainBody %>
    </div>
    <div class="col-lg-3">
      <h2>Related news</h2>
      <asp:Literal runat="server" ID="RelatedPosts" />
    </div>
  </div>
</asp:Content>
