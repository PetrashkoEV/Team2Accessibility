<%@ Page Title="shopping cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WingtipToys.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead">
        <h1>Shopping Cart</h1>
    </div>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="WingtipToys.Models.CartItem" SelectMethod="GetShoppingCartItems"
        CssClass="table table-striped table-bordered shopping-cart-grid"
        Caption="Shopping Cart">
        <Columns>
            <%-- &nbsp; to the row does not collapse --%>
            <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" FooterText="&nbsp;<span class='invisible-block'>footer</span>"/>
            <asp:BoundField DataField="Product.ProductName" HeaderText="Name" FooterText="<span class='invisible-block'>footer</span>" />
            <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}" FooterText="<span class='invisible-block'>footer</span>" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" aria-label="current quantity" Text="<%#: Item.Quantity %>"></asp:TextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <span class="invisible-block">footer</span>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item Total">
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>
                <FooterTemplate>
                    <span class="invisible-block">footer</span>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remove Item">
                <ItemTemplate>
                    <asp:CheckBox ID="Remove" runat="server" aria-labelledby="checkboxHelper"></asp:CheckBox>
                    <span id="checkboxHelper" class="invisible-block">you may delete current item by checking this checkbox</span>
                </ItemTemplate>
                <FooterTemplate>
                    <span class="invisible-block">footer</span>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div>
        <p aria-hidden="true"></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong>
    </div>
    <span aria-hidden="true">
        <br />
    </span>
    <table>
        <tr>
            <td>
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
            </td>
            <td>
                <asp:ImageButton ID="CheckoutImageBtn" runat="server"
                    ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
                    Width="145" AlternateText="Check out with PayPal"
                    OnClick="CheckoutBtn_Click"
                    BackColor="Transparent" BorderWidth="0" />
            </td>
        </tr>
    </table>
</asp:Content>