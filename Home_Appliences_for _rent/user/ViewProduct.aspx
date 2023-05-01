<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="Home_Appliences_for__rent.user.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>RentSpace | ViewProduct</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">

    </script>

    <script>
        $(document).ready(function myfunction() {
            $("#btncart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

        function changeQuantity(type) {
            var currentQty = $("#txtQuantity").val();
            if (type == 'plus') {
                $("#txtQuantity").val(parseInt(currentQty, 10) + 1);
            }
            else if (currentQty < 2) {
                $("#txtQuantity").val('1');
            }
            else {
                $("#txtQuantity").val(parseInt(currentQty, 10) - 1);
            }
        }

        function changeMonths(type) {
            var currentQty = $("#txtmonths").val();
            if (type == 'Monthsplus') {
                $("#txtmonths").val(parseInt(currentQty, 10) + 1);
            }
            else if (currentQty < 2) {
                $("#txtmonths").val('1');
            }
            else {
                $("#txtmonths").val(parseInt(currentQty, 10) - 1);
            }
        }
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
    <style>
        #txtQuantity {
            max-width: 30px;
        }
        #txtmonths {
            max-width: 30px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <!--navbar-->
    
        <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top shadow " style="background-color:#F8F8FF;">
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
                        <li class="nav-item">
                            <a href="UserProfile.aspx" class="nav-link link-dark px-2 me-lg-3 link-dark">Profile</a>
                        </li>
                    </ul>
                    <span class="navbar-text me-lg-5">
                        <a class="icons me-3" style="text-decoration: none; position: relative; width: 40px;">
                            <i id="btncart" class="bi bi-cart4 fs-3 me-3"></i>
                            <span id="pCount" runat="server" class="badge rounded-pill text-bg-secondary" style="position: absolute; bottom: 15px; left: 15px; display: block;"></span>

                        </a>
                       <%-- <i class="bi bi-person-circle me-1 fs-4" style="color: #FF6600;"></i>
                        <a href="UserProfile.aspx" style="text-decoration: none;">
                            <asp:Label ID="lblsuccess" class="me-3" Style="color: #FF6600; font-size: large;" runat="server"></asp:Label></a>
                        <asp:Button ID="Btnlogout" class="  btn btn-outline-primary" runat="server" Text="Sign-Out" />--%>
                    </span>
                </div>
            </div>
        </nav>
        <br />
        <br />
        <br />
        <br />
        <!--navbar end-->
        <div class="container">
            <div class="row row-cols-1 row-cols-md-2 mt-3" style="background-color:white;">

                <asp:Repeater ID="rptrProductView" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6 border-end">

                            <img src="../<%#Eval("Pimg") %>" class="w-100 rounded-3 shadow" alt=".." />
                        </div>
                        <div class="col-md-6 mt-4 mt-lg-0  text-justify ">
                            <h3 style="font-family: 'Calisto MT'; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;"><%#Eval("PName") %></h3>
                            <hr class="" style="width: 80px; border: 2px solid red;" />
                            <p class="text-muted mb-2" style="text-align: justify; text-justify: inter-word;">
                                <%#Eval("PDescription") %>
                            </p>
                            <div class="border-top mt-4">
                                <h4 class="mt-2" style="font-family: 'Calisto MT'; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Product Features</h4>
                                <p class="text-muted" style="text-align: justify; text-justify: inter-word;">
                                    <%#Eval("PProductFeature") %>
                                </p>
                            </div>
                            <br />
                            <div class="row  row-cols-1 row-cols-md-2">
                                <div class="col-md-6 justify-content-md-between border-end">
                                    <h5 class="text-muted">Monthly Rent :  <%#Eval("RPrice","{0:c}") %>/mo</h5>
                                </div>
                                <div class="col-md-6">
                                    <h5 class="text-muted">Refundable Deposit :  <%#Eval("DPrice","{0:c}") %>/mo</h5>
                                </div>

                            </div>

                            <div class="col-md-12 justify-content-center  mt-4">
                                <asp:Button ID="btnAddtoCart" class="btn btn-primary" runat="server" Text="Add to Cart" OnClick="btnAddtoCart_Click" />

                            </div>
                         
                    </ItemTemplate>
                </asp:Repeater>

                <div class="row mt-3">
                    <div class="col-6">
                        <h5 style="font-family: 'Calisto MT'; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Select Quantity</h5>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-secondary" onclick="changeQuantity('minus');" id="minus-btn">-</button>
                            </div>
                            <asp:TextBox ID="txtQuantity" CssClass="form-control form-control-sm w-25" runat="server" value="1" min="1" ClientIDMode="Static" />
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-secondary" id="plus-btn" onclick="changeQuantity('plus');">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                         <h5 style="font-family: 'Calisto MT'; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Select Month</h5>
                      <%--  <asp:DropDownList ID="ddlmonths" CssClass="form-control w-50" AutoPostBack="true"  runat="server">
                            <asp:ListItem Value="1">1 month</asp:ListItem>
                            <asp:ListItem Value="2">2 months</asp:ListItem>
                            <asp:ListItem Value="3">3 months</asp:ListItem>
                            <asp:ListItem Value="6">6 months</asp:ListItem>
                            <asp:ListItem Value="12">12 months</asp:ListItem>
                         </asp:DropDownList>--%>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-secondary" onclick="changeMonths('Monthsminus');" id="btn-minus">-</button>
                            </div>
                            <asp:TextBox ID="txtmonths" CssClass="form-control form-control-sm w-25" runat="server" value="1" min="1" ClientIDMode="Static" />
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-secondary" id="btn-plus" onclick="changeMonths('Monthsplus');">+</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</asp:Content>
