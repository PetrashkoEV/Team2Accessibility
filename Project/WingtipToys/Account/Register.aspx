<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WingtipToys.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2 role="heading" aria-level="1"><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4 role="heading" aria-level="2">Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" aria-atomic="true"/>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox aria-required="true" aria-label="Enter your email" aria-invalid="false" runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator aria-hidden="true" ID="EmailError" runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox aria-required="true" aria-label="Enter your password" aria-invalid="false" aria-describedby="passwordDescription" runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator aria-hidden="true" runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
            <span id="passwordDescription" class="invisible-block" tabindex="-1">The password must: · Have a minimum of 6 characters!!!! · Contain at least one of these special characters: ^,*,@ · Not be one of your last 2 passwords · Contain upper and lowercase letters · Contain at least one number!!!! </span>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox aria-required="true" aria-label="Enter your confirm password" aria-invalid="false" 
                    runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" aria-describedby="confirmedPasswordDescription" />
                
                <asp:RequiredFieldValidator aria-hidden="true" runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator aria-hidden="true" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
            <span id="confirmedPasswordDescription" class="invisible-block" tabindex="-1">Please repeat the password</span>

        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnRegister" runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            $('body').append("<p class='invisible-block' aria-hidden='true' id='roleAtomicErrors'></p>");

            $("*[type='submit'").on('click', function () {
                checkAccessibilityValidation();
                putErrorsToAtomicContainer();
            });
        });

    </script>

</asp:Content>
