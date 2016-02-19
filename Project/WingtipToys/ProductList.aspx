<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ProductList.aspx.cs" Inherits="WingtipToys.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                <h2 role="heading" aria-level="1"><%: Page.Title %></h2>
            </hgroup>

            <asp:ListView ID="productList" runat="server"
                DataKeyNames="ProductID" GroupItemCount="4"
                ItemType="WingtipToys.Models.Product" SelectMethod="GetProducts" OnItemDataBound="productList_ItemDataBound">
                <EmptyDataTemplate>
                    <table>
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <%--<EmptyItemTemplate>
                    <td />
                </EmptyItemTemplate>
                    if you uncomment this block, there will be empty TD elements counted
                --%>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server" role="presentation">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server" role="listitem">
                        <table>
                            <tr aria-hidden="true">
                                <td>
                                    <a href="<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>" aria-hidden="true" class="non-focusable" tabindex="-1">
                                        <image src='/Catalog/Images/Thumbs/<%#:Item.ImagePath%>'
                                            width="100" height="75" border="1" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a ID="lnkProductName" runat="server" href='<%#: GetRouteUrl("ProductByNameRoute", new {productName = Item.ProductName}) %>'  >
                                        <%#:Item.ProductName%>
                                    </a>
                                    <span aria-hidden="true"><br /></span>
                                    <span runat="server" ID="price">
                                        <strong>Price: </strong><%#:String.Format("{0:c}", Item.UnitPrice)%>
                                    </span>
                                    <span aria-hidden="true"><br /></span>
                                    <a href="/AddToCart.aspx?productID=<%#:Item.ProductID %>">
                                        <span class="ProductListItem">
                                            <strong>Add To Cart</strong>
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            <tr aria-hidden="true">
                                <td aria-hidden="true">&nbsp;</td>
                            </tr>
                        </table>
                        <%--<span aria-hidden="true"></p></span> Even hidden aria doesn't work. We comment this line because it nothing changees on the UI, but screenreader reads it as "blank"--%>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width: 100%" role="list">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr aria-hidden="true">
                                <td></td>
                            </tr>
                            <tr  aria-hidden="true"></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>
