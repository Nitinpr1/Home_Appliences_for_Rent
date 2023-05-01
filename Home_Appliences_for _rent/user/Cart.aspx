<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Home_Appliences_for__rent.user.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <title>RentSpace | UserCart</title>
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
    <style>
        .error{
            color:red;
            font-weight:bold;
            font-size:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <!--navbar-->
     
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
                            <a href="UserHome.aspx" class="nav-link px-2 me-lg-3 link-dark">Home</a>
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

                        <asp:Button ID="Button1" class="  btn btn-outline-primary" runat="server" Text="Sign-Out" />
                    </span>
                </div>
            </div>
        </nav>

        <!--navbar end-->
        <br />
        <br />
        <br />
        <br />
        <div class="container d-flex">
            <div class="w-75 me-5">
                <div class="d-flex">
                    <h3 class="mb-3" style="font-family: 'Calisto MT'; font-size: x-large; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">My Cart - <span id="mycart" runat="server"></span></h3>
              <%--    <a href="UserHome.aspx" class="btn btn-secondary  ms-5"> << Home </a> --%>
                     <asp:Label ID="lblerror" class="ms-5 error" runat="server" Text="Can't be less than 1..!!"></asp:Label>
                </div>
               <br />
                <div class="row row-cols-1 row-cols-md-2 g-5" style="background-color:white;">
                    <asp:Repeater ID="rptrCartItem" OnItemCommand="rptrCartItem_ItemCommand" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4 border-end">
                                <img src="../<%#Eval("Pimg") %>" class="w-100" alt="img" />
                            </div>
                            <div class="col-md-8">
                                <h4 class="mb-2" style="font-family: 'Calisto MT'; font-size: x-large; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;"><%#Eval("Pname") %></h4>
                                <div class="row row-cols-1  row-cols-md-2 mb-2">
                                    <div class="col-6 text-muted">
                                        <span>Deposit Price :</span><br />
                                        <span>Monthly Rent Price :</span><br />
                                        <span>Quantity : </span>
                                        <br />
                                        <br />
                                        <span>For Months : </span>
                                    </div>
                                    <div class="col-6 mb-2 text-muted">
                                        <span><%#Eval("dprice","{0:c}") %> /-</span><br />
                                        <span><%#Eval("rprice","{0:c}") %> /-</span><br />
                                        <%-- <span><%#Eval("PQuantity") %></span>--%>
                                        <span>
                                            <div class="pull-right d-flex form-inline mb-2">
                                                <asp:Button ID="BtnMinus" class="btn btn-secondary" CommandArgument='<%# Eval("PId") %>' CommandName="QtyMinus" runat="server" Text="-" />&nbsp
                                    <asp:TextBox ID="txtQty" runat="server" Width="40" class="form-control" TextMode="SingleLine" Style="text-align: center" Text='<%# Eval("PQuantity") %>'></asp:TextBox>&nbsp
                                     <asp:Button ID="BtnPlus" class="btn btn-secondary" CommandArgument='<%# Eval("PId") %>' CommandName="QtyPlus" runat="server" Text="+" />&nbsp&nbsp&nbsp                                          
                                            </div>
                                        </span>
                                        <span>
                                            <div class="pull-right d-flex form-inline mb-2">
                                                <asp:Button ID="btnMonthsminus" class="btn btn-secondary" CommandArgument='<%# Eval("PId") %>' CommandName="MonthsMinus" runat="server" Text="-" />&nbsp
                                    <asp:TextBox ID="txtmonts" runat="server" Width="40" class="form-control" TextMode="SingleLine" Style="text-align: center" Text='<%# Eval("months") %>'></asp:TextBox>&nbsp
                                     <asp:Button ID="btnMonthsplus" class="btn btn-secondary" CommandArgument='<%# Eval("PId") %>' CommandName="MonthsPlus" runat="server" Text="+" />&nbsp&nbsp&nbsp                                          
                                            </div>
                                        </span>
                                    </div>
                                </div>
                                <div>
                                    <asp:Button CommandArgument='<%#Eval("CartId") %>' CommandName="RemoveThisCart" ID="btnRemove" class="btn btn-outline-primary" runat="server" Text="Remove" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="w-25 pull-right" style="background-color:white;">
                <div class="col-12">
                    <h3 class="text-center border-bottom mb-4" style="font-family: 'Calisto MT'; font-size: xx-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Cart Total</h3>
                    <div class="row row-cols-1 row-cols-md-2 mb-2">
                        <div class="col-6">
                            <h5>Total Deposit :</h5>
                        </div>
                        <div class="col-6 text-end">
                            <h6 id="totaldprice" runat="server"></h6>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-md-2 mb-2">
                        <div class="col-6">
                            <h5>Total Rent :</h5>
                        </div>
                        <div class="col-6 text-end">
                            <h6 id="totalrprice" runat="server"></h6>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-md-2 mb-3">
                        <div class="col-6">
                            <h5>Grand Total :</h5>
                        </div>
                        <div class="col-6 text-end">
                            <h6 id="grandtotal" runat="server"></h6>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnRentnow" class="  btn btn-primary w-100" runat="server" Text="Rent Now" OnClick="btnRentnow_Click" />
                    </div>

                </div>
            </div>

        </div>
    </form>
</asp:Content>
