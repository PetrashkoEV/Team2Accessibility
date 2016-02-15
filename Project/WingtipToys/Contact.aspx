<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WingtipToys.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" tabindex="-1">
    <h2 role="heading" aria-level="1"><%: Title %>.</h2>
    <h3 role="heading" aria-level="2">Your contact page.</h3>
    <span id="addressText" class="invisible-block">address of our company</span>

    <div aria-labelledby="addressText" role="article">
        <address>
            <span id="cityName" class="invisible-block">city </span>
            <span aria-labelledby="cityName">One Microsoft Way</span><br />
             Redmond
            <span id="streetName" class="invisible-block"> street </span>
            <span aria-labelledby="streetName">WA 98052-6399</span><br />
            <p id="phone-label" class="invisible-block sr-only">Phone number</p>
            <abbr title="Phone" aria-labelledby="phone-label" aria-hidden="true">P:</abbr>
            425.555.0100
        </address>
    </div>


    <address >
        <strong>Support:</strong><a href="mailto:Support@example.com">Support@example.com</a><br/>
        <strong>Marketing:</strong><a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
