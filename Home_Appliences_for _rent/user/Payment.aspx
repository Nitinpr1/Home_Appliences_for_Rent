<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Home_Appliences_for__rent.user.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>RentSpace | Payment</title>
    <style>
        .fill {
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden
        }

            .fill img {
                flex-shrink: 0;
                min-width: 100%;
                min-height: 100%
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        <div class="container">
            <div class="row shadow rounded-3" style="background-color: white;">
                <div class="col-12 col-md-6 fill">

                    <img src="NewFolder1/payment.png" class="img-fluid" />
                </div>
                <div class="col-12 col-md-6 mt-5 mt-lg-0">

                    <h2 class="text-center mt-3" style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: uppercase; color: #FF6600;">Delevery Address</h2>

                    <div class="row g-3 w-100  m-auto">
                        <div class="col-md-12">
                            <label for="txtname" class="form-label">Name</label>
                            <asp:TextBox ID="txtname" placeholder="Name..." class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtname" runat="server" ErrorMessage="Enter Name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtname" ErrorMessage="Enter valid Name" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-12">
                            <label for="txtemail" class="form-label">Email</label>
                            <asp:TextBox ID="txtemail" placeholder="abc@gmail.com" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtemail" runat="server" ErrorMessage=" *" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-12">
                            <label for="txtconumber" class="form-label">Contact No.</label>
                            <asp:TextBox ID="txtconumber" placeholder="Your message here...." class="form-control" TextMode="SingleLine" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtconumber" runat="server" ErrorMessage=" *" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter Valid Number" ControlToValidate="txtconumber" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-12">
                            <label for="txtaddress" class="form-label">Address</label>
                            <asp:TextBox ID="txtaddress" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtaddress" runat="server" ErrorMessage=" *" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="txtcity" class="form-label">City</label>
                                    <asp:TextBox ID="txtcity" class="form-control" TextMode="SingleLine" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtcity" runat="server" ErrorMessage=" *" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtzip" class="form-label">Zip</label>
                                    <asp:TextBox ID="txtzip" class="form-control" TextMode="SingleLine" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtzip" runat="server" ErrorMessage=" *" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtzip" ErrorMessage="Enter valid Zip" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 mb-3">
                            <%-- <button id="toggle" class="btn btn-secondary" onclick="function ()"> Next</button>--%>
                            <%-- <asp:Button ID="toggle" class="btn btn-primary" runat="server" Text="Next"/>--%>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <br />
        <br />
        <div class="container">
            <div class="row" id="pay" runat="server">

                <div class="col-md-6">
                    <div class="shadow rounded-3 " style="background-color: white;">
                        <br />
                        <h2 class="text-center mb-3" style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: uppercase; color: #FF6600;">Products Detail</h2>

                        <asp:GridView ID="Gvproducts" class="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="Pname" HeaderText="Product Name" />
                                <asp:BoundField DataField="PQuantity" HeaderText="Quantity" />
                                <asp:BoundField DataField="dprice" HeaderText="DPrice" />
                                <asp:BoundField DataField="rprice" HeaderText="RPrice" />
                                <asp:BoundField DataField="months" HeaderText="Months" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <div class="mt-3">
                        <h2 class="text-center mb-3" style="font-family: 'Calisto MT'; font-size: large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: uppercase; color: #FF6600;">Return Date</h2>

                            <asp:GridView ID="GvReturndate" class="table" runat="server" CellPadding="4" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                                    <asp:BoundField DataField="mo" HeaderText="Return Date" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </div>
                        <hr />
                        <h2 class="text-center" style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: uppercase; color: #FF6600;">Payment Details</h2>

                        <br />
                        <div class="row row-cols-1 row-cols-md-2 mb-2">
                            <div class="col-6">
                                <h5 class="ms-5">Total Deposit :</h5>
                            </div>
                            <div class="col-6 text-end">
                                <h6 class="me-5" id="totaldprice" runat="server"></h6>
                            </div>
                        </div>
                        <div class="row row-cols-1 row-cols-md-2 mb-2">
                            <div class="col-6">
                                <h5 class="ms-5">Total Rent :</h5>
                            </div>
                            <div class="col-6 text-end">
                                <h6 class="me-5" id="totalrprice" runat="server"></h6>
                            </div>
                        </div>
                        <div class="row row-cols-1 row-cols-md-2 mb-3">
                            <div class="col-6">
                                <h5 class="ms-5">Grand Total :</h5>
                            </div>
                            <div class="col-6 text-end">
                                <h6 class="me-5" id="grandtotal" runat="server"></h6>
                            </div>
                        </div>
                        <asp:Label ID="Label1" runat="server"></asp:Label>

                        <br />
                    </div>
                </div>
                <div class="col-md-6 shadow mt-5 mt-lg-0 rounded-3" style="background-color: white;">
                    <br />
                    <h2 class="text-center" style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: uppercase; color: #FF6600;">Pay with</h2>

                    <div class="row g-3 w-100  m-auto">
                        <div class="col-md-12 w-100 h-25 ">
                            <%-- <img src="NewFolder1/card.png"  />--%>
                            <img src="NewFolder1/pay.jpg" class="img-fluid rounded-5" />
                        </div>

                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="txtcard" class="form-label">Card Number</label>
                                    <asp:TextBox ID="txtcard" class="form-control" TextMode="SingleLine" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtcard" runat="server" ErrorMessage="Enter your card number" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtcard" ErrorMessage="Enter valid number" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{16}"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtexpirydate" class="form-label">Expiry Date</label>
                                    <asp:TextBox ID="txtexpirydate" class="form-control" TextMode="Date" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtexpirydate" runat="server" ErrorMessage="Enter Expiry date" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtexpirydate" ErrorMessage="Enter valid date" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{8}"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="txtcvv" class="form-label">CVV</label>
                                    <asp:TextBox ID="txtcvv" class="form-control" TextMode="SingleLine" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtcvv" runat="server" ErrorMessage="Enter CVV" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtcvv" ErrorMessage="Enter valid CVV" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{3}"></asp:RegularExpressionValidator>

                                </div>
                                <div class="col-md-6 mt-4">
                                    <p class="mt-2">You are Paying :<span id="totalpay" runat="server"></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 mb-5">
                            <asp:Button ID="btnPayment" class="btn btn-primary mt-2 w-100" runat="server" Text="Pay Now" OnClick="btnPayment_Click" />
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <%--  <script>
        const targetDiv = document.getElementById("pay");
        const btn = document.getElementById("toggle");
        btn.onclick = function () {
            if (targetDiv.style.display !== "none") {
                targetDiv.style.display = "none";
            } else {
                targetDiv.style.display = "block";
            }
        };


    </script>--%>
</asp:Content>
