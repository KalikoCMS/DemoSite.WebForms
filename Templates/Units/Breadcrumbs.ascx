<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Breadcrumbs.ascx.cs" Inherits="DemoSite.Templates.Units.Breadcrumbs" %>

<cms:Breadcrumbs ID="Breadcrumbs1" AutoBind="True" RenderCurrentPage="false" runat="server">
  <HeaderTemplate>
    <ol class="breadcrumb">
  </HeaderTemplate>
  <ItemTemplate>
    <li><a href="<%#Container.CurrentPage.PageUrl %>"><%#Container.CurrentPage.PageName %></a></li>
  </ItemTemplate>
  <FooterTemplate>
    </ol>
  </FooterTemplate>
</cms:Breadcrumbs>