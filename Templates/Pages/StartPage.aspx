<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="DemoSite.Templates.Pages.StartPage" MasterPageFile="../MasterPages/Demo.Master" %>

<%@ Register TagPrefix="cms" Namespace="KalikoCMS.WebForms.WebControls" Assembly="KalikoCMS.WebForms" %>

<asp:Content ContentPlaceHolderID="HeadlineContent" runat="server">
  <div id="carousel-jumbotron" class="carousel slide" data-ride="carousel">
    <div class="container">

      <div class="carousel-inner" role="listbox">
        <%
          var count = 0;
          foreach (var slide in CurrentPage.Slides.Items) { %>
          <div class="item <%=count==0 ? "active" : "" %>">
            <div class="jumbotron">
              <div class="container">
                <h1><%=slide.Header %></h1>
                <p><%=slide.Description %></p>
                <a href="<%=slide.Url %>" class="btn btn-primary btn-lg">Learn more &raquo;</a>
              </div>
            </div>
          </div>
        <% 
           count++;
          } %>
      </div>
      
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <% for (var i = 0; i < count; i++) { %>
          <li data-target="#carousel-jumbotron" data-slide-to="<%=i %>" class="<%=i == 0 ? "active" : "" %>"></li>
        <% } %>
      </ol>

    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-jumbotron" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-jumbotron" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="row add-space flex-boxes">
    <div class="col-lg-4">
        <h2><%=CurrentPage.MainFeature.Header %></h2>
        <p><%=CurrentPage.MainFeature.Description %></p>
        <a href="<%=CurrentPage.MainFeature.Url %>" class="btn btn-primary">Learn more »</a>
    </div>
    <div class="col-lg-4">
        <h2><%=CurrentPage.SecondaryFeature.Header %></h2>
        <p><%=CurrentPage.SecondaryFeature.Description %></p>
        <a href="<%=CurrentPage.SecondaryFeature.Url %>" class="btn btn-primary">Learn more »</a>
    </div>
    <div class="col-lg-4">
        <h2>Latest news:</h2>
        <cms:PageList ID="NewsList" AutoBind="True" PageSize="5" runat="server">
          <HeaderTemplate>
            <ul class="list-unstyled">
          </HeaderTemplate>
          <ItemTemplate>
            <li><%#Container.CurrentPage.StartPublish.Value.ToShortDateString() %> <a href="<%#Container.CurrentPage.PageUrl %>"><%#Container.CurrentPage.PageName %></a></li>
          </ItemTemplate>
          <FooterTemplate>
            </ul>
          </FooterTemplate>
        </cms:PageList>
        <a href="/news/" class="btn btn-primary">More news »</a>
      </div>
  </div>
</asp:Content>
