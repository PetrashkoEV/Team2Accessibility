<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WingtipToys.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 role="heading" aria-level="1"><%: Title %>.</h2>
    <h3 role="heading" aria-level="2">Your contact page.</h3>
    <div aria-label="address of our company" role="article">
        <address>
            <span class="invisible-block">city </span>One Microsoft Way<br />
             Redmond<span class="invisible-block"> street </span><span>WA 98052-6399</span><br />
            <span class="invisible-block">phone-number</span><abbr title="Phone">P:</abbr>
            425.555.0100
        </address>
    </div>


    <address >
        <strong>Support:</strong><a href="mailto:Support@example.com">Support@example.com</a><br/>
        <strong>Marketing:</strong><a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
