<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="Orderplaced.aspx.cs" Inherits="Home_Appliences_for__rent.user.Orderplaced" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 60px;
        }

        .auto-style8 {
            width: 636px;
        }

        .auto-style11 {
            height: 16px;
        }

        .auto-style12 {
            height: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <form id="form1" runat="server">
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

                            <%--<asp:Button ID="Button1" class="  btn btn-outline-primary" runat="server" Text="Sign-Out" />--%>
                        </span>
                    </div>
                </div>
            </nav>

            <!--navbar end-->
            <br />
            <br />

            <br />
            <br />
            <div class="container">
                <div class="row align-items-end" id="success" runat="server">
                    <div class="col-md-6 offset-md-3 text-center shadow rounded-5" style="background-color: white;">
                        <img src="NewFolder1/places.gif" class="rounded-5  w-50 mt-4" alt="gif image" />
                        <h2 class="mb-3" style="font-family: 'Calisto MT'; color: green;">Order Placed Successfully !!</h2>
                        <hr style="border: 4px solid green;" />
                        <div class="py-3 text-muted">
                            <h4>Thank You for Renting with Us !</h4>
                            <p>Your Desired Appliences/Furniture will be Delevered to You Shortly..</p>
                             <asp:Button ID="btnRecipt" class="btn btn-primary w-25" runat="server" Text="Download Receipt" OnClick="btnRecipt_Click" />
                            <a href="UserHome.aspx" class="btn btn-outline-primary w-25">Back to Home</a>
                            <br />
                           
                        </div>
                    </div>

                </div>

            </div>
            <br />
            <div class="container">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="shadow" style="background-color: white;" id="recipt" runat="server">


                        <table border="1" class="table table-bordered" style="border: medium solid #808080; table-layout: auto; border-spacing: inherit; ">
                            <tr>
                                <td style="background-color: white;" class="auto-style12">

                                    <h2 style="font-family: 'Calisto MT'; font-weight: bold; color: orangered; text-align: center;">Rentspace Rental Receipt</h2>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <div>
                                        <h3>Order Id :<span id="orderno" runat="server"> </span></h3>
                                        <h3>Rental Date :<span id="orderdate" runat="server"></span></h3>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td class="auto-style8">
                                                <div>
                                                    <h3>User Address</h3>
                                                    <p id="address" runat="server"> </p>
                                                </div>
                                            </td>
                                            <td>
                                                <div>
                                                    <h3>Company Address</h3>
                                                    <p>Rentspace Private Limited 5th Floor, L-148, 4th Main, Sector 2, thane, Navi Mumbai, Maharastra, Pin - 400603</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GvProductdetails" class="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <Columns>
                                            <asp:BoundField DataField="Products" HeaderText="Products" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                            <asp:BoundField DataField="Months" HeaderText="Months" />
                                            <asp:BoundField DataField="RentalDate" HeaderText="Rental Date" />
                                            <asp:BoundField DataField="Returndate" HeaderText="Return Date" />
                                        </Columns>
                                        <AlternatingRowStyle BackColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style11">

                                    <table class="w-100">
                                        <tr>
                                            <td>
                                                <p>Total Deposit : <span id="dprice" runat="server"></span></p>
                                            </td>
                                            <td>
                                                <p>Total Rental Price : <span id="rprice" runat="server"></span></p>
                                            </td>
                                            <td>
                                                <p>Total Paid : <span id="totalpaid" runat="server"></span></p>
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <div>
                                        <h4 style="text-align: center;">This is Computer Generated Receipt. it does not require Signature</h4>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                </asp:Panel>
            </div>
        </form>
    </div>
</asp:Content>
