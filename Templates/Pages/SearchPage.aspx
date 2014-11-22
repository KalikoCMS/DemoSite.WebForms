<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Demo.Master" AutoEventWireup="true" CodeBehind="SearchPage.aspx.cs" Inherits="DemoSite.Templates.Pages.SearchPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="row">
    <div class="col-lg-6 col-lg-push-3">
      <div id="searchfield" class="input-group">
        <asp:TextBox ID="Query" CssClass="form-control" runat="server" />
        <span class="input-group-btn">
          <button id="searchButton" class="btn btn-primary" type="button"><i class="glyphicon glyphicon-search"></i> Search</button>
        </span>
      </div>
    </div>
  </div>
  
  <div id="searchresults">
    <asp:Literal ID="Result" runat="server" />
  </div>
  
  <script>
    $(document).ready(function () {
      $("#searchButton").click(doSearch);

      $('#<%=Query.ClientID %>').keypress(function (event) {

        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
          doSearch();
          return false;
        }
      });

      function doSearch() {
        var query = $("#<%=Query.ClientID %>").val();
        var url = document.location.pathname + "?q=" + escape(query);
        document.location = url;
      };
    });
  </script>
</asp:Content>
