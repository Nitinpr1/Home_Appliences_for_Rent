<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Home_Appliences_for__rent.user.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>RentSpace | ChangePassword</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">

    </script>
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

        $(document).ready(function myfunction() {
            $("#btncart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });
    </script>
    <style>
        .icon {
            color: orangered;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top shadow " style="background-color: #F8F8FF;">
                <div class="container-fluid">
                    <a class="navbar-brand ms-lg-5 me-5" href="UserHome.aspx">
                        <h3 class="ms-2" style="font-family: 'Calisto MT'; font-size: xx-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Rentspace</h3>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse " id="navbarText">
                        <ul class="navbar-nav  me-auto mb-2 mb-lg-0">

                            <li class="nav-item ms-lg-5">
                                <a href="UserHome.aspx" class="nav-link px-2 me-lg-3  link-dark">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link link-dark px-2 me-lg-3" href="Electronic.aspx">Electronic</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link link-dark px-2 me-lg-3" href="Furniture.aspx">Furniture</a>
                            </li>
                            <li class="nav-item">
                                <a href="AboutUs.aspx" class="nav-link link-dark px-2 me-lg-3 link-dark">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a href="ContactUs.aspx" class="nav-link link-dark px-2 me-lg-3 link-dark">Contact Us</a>
                            </li>
                            <li class="nav-item" id="profile" runat="server">
                                <a href="UserProfile.aspx" class="nav-link link-dark px-2 me-lg-3 link-dark">Profile</a>
                            </li>
                        </ul>
                        <span class="navbar-text me-lg-5">
                            <a class="icons me-3" style="text-decoration: none; position: relative; width: 40px;" id="cartid" runat="server">
                                <i id="btncart" class="bi bi-cart4 fs-3 me-3"></i>
                                <span id="pCount" runat="server" class="badge rounded-pill text-bg-secondary" style="position: absolute; bottom: 15px; left: 15px; display: block;"></span>

                            </a>
                        </span>
                    </div>
                </div>
            </nav>
        </div>
        <!--navbar end-->
        <br />
        <br />
        <br />
        <br />

        <div class="container ">
            <div class="row align-items-end">
                <div class="col-md-4 offset-md-4" style="background-color: white;">
                    <div class="border shadow p-5 rounded-5">
                        <main class="text-center border-bottom ">
                            <i class="bi bi-check-circle-fill fs-1 icon"></i>

                            <h1 class="h3 mb-3 fw-normal">Change Password </h1>

                        </main>
                        <div>
                            <label id="Label1" for="txtoldpass" class="form-label ms-2 mt-3" runat="server">Your Old Password</label>
                            <asp:TextBox ID="txtoldpass" class="form-control" TextMode="Password" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="txtoldpass" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="error" Display="Dynamic" ControlToValidate="txtoldpass" ValidationExpression="^\w[a-zA-Z@#0-9.]*$"></asp:RegularExpressionValidator>
                        </div>
                        <div>
                            <label id="lblpass" for="txtpass1" class="form-label ms-2" runat="server">Your New Password</label>
                            <asp:TextBox ID="txtnewpass" class="form-control" TextMode="Password" runat="server" onblur="javascript:value=value.replace(/\s/g,'');"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtnewpass" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label id="lblconpass" for="txtpass1" class="form-label ms-2" runat="server">Confirm Password</label>
                            <asp:TextBox ID="txtconpass" class="form-control" TextMode="Password" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="txtconpass" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpass" ControlToValidate="txtconpass" Display="Dynamic" ErrorMessage="Password Missmatch" ForeColor="Red"></asp:CompareValidator>
                        </div>
                        <asp:Label ID="lblsu" runat="server"></asp:Label>
                        <asp:Button ID="btnRecoverPassword" class="btn btn-primary mb-3 w-100" runat="server" Text="Submit" OnClick="btnRecoverPassword_Click" />
                        <br />
                        <div class="text-center">
                            <asp:HyperLink ID="hyperlogin" runat="server" NavigateUrl="~/user/Ulogin.aspx">Back to SignIn</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
