<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="BSG.Test" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label CssClass="btn btn-default-bkav" Text="text"  runat="server" data-toggle="collapse" data-target="#demo" />
    <div class="collapse" id ="demo">
        
<p>Date: <input type="text" id="datepicker"></p>
    </div>
    <script>
     $( function() {
    $( "#datepicker" ).datepicker({
      showOn: "button",
      buttonImage: "images/calendar.png",
      buttonImageOnly: true,
      buttonText: "Select date"
    });
  } );
  </script>
</asp:Content>
