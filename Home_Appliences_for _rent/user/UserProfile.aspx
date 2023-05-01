<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Home_Appliences_for__rent.user.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>RentSpace | Profile</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<script>
    $(document).ready(function myfunction() {
        $("#btncart").click(function myfunction() {
            window.location.href = "Cart.aspx";
        });
    });

    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }

</script>

    <style>
        .color {
            color: orangered;
            font-weight: bold;
            /*text-shadow:2px 2px gray*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--navbar-->
 
    <form id="form1" runat="server">
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
                                <a href="UserHome.aspx" class="nav-link px-2 me-lg-3 link-primary">Home</a>
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
                           
                            
                        </span>
                    </div>
                </div>
            </nav>
    <br />
    <br />
    <br />
    <!--navbar end-->
    
        <div class="container-fulid">
            <div class="row border-bottom mt-5 mt-md-2 shadow rounded-3" style="background-image: url('NewFolder1/pimg.jpg'); background-repeat: no-repeat; background-size: cover; width: auto;">
                <div class=" col-6">

                    <h2 class="mt-5 ms-5 color" style="font-family: 'Times New Roman', Times, serif; text-transform: uppercase;">
                        <asp:Label ID="lblfname" CssClass="me-2" runat="server" Text="Label"></asp:Label><asp:Label ID="lbllname" runat="server" Text="Label"></asp:Label></h2>
                    <hr class="ms-5" style="width: 70px; border: 2px solid gray; z-index: 3;" />
                    <p class="mb-5  ms-5" style="color: gray;">
                        <asp:Label ID="lblcity1" runat="server" Text="Label"></asp:Label></p>
                </div>
                <div class="col-6 text-end">
                    <div class="mt-5 me-5">
                        <asp:Button ID="btnlogout" runat="server" class="btn btn-primary" Text="SignOut" OnClick="btnlogout_Click" />
                    </div>
                </div>
            </div>
        </div>


        <br />
        <div class="container">
            <div class="row shadow" style="background-color:white;">
                <div class="col-2 col-md-4">
                    <img src="NewFolder1/acust.jpg" class="img-fluid" />
                </div>
                <div class="col-md-8">
                    <div class="col-12">
                        <h1 class="mt-2">My Account</h1>
                        <hr style="width: 80px; border: 2px solid red;" />

                    </div>
                    <div class=" row mt-1 d-flex g-3 ">

                        <div class="col-6 text-muted">Name</div>
                        <div class="col-6  ">
                            <asp:Label ID="lblfname1" runat="server" class="me-2" Text="Label"></asp:Label><asp:Label ID="lbllname1" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div class="col-6 text-muted">Email</div>
                        <div class="col-6 ">
                            <asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label></div>
                        <div class="col-6 text-muted">Contact No.</div>
                        <div class="col-6 ">
                            <asp:Label ID="lblcontact" runat="server" Text="Label"></asp:Label></div>
                        <div class="col-6 text-muted">Aadhar No.</div>
                        <div class="col-6 ">
                            <asp:Label ID="lblaadhar" runat="server" Text="Label"></asp:Label></div>
                        <div class="col-6 text-muted">City</div>
                        <div class="col-6 ">
                            <asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label></div>
                        <div class="col-6 text-muted">Address</div>
                        <div class="col-6  mb-3 ">
                            <asp:Label ID="lbladd" runat="server" Text="Label"></asp:Label></div>
                        <div class="col-6">
                            <asp:Button ID="btnChangePassword" class="btn btn-outline-primary" runat="server" Text="Change Password" OnClick="btnChangePassword_Click"  ></asp:Button>
                        </div>
                        <div class="col-6 mb-3 ">
                              <asp:Button ID="btnEditProfile" class="btn btn-primary" runat="server" Text="Edit Profile" OnClick="btnEditProfile_Click" />

                        </div>
                          

                        </div>
                    </div>
                </div>
            </div>
             
            <br />
            <br />
            <div class="container">
                <div id="edit" class="row g-3 shadow p-5 " runat="server" style="background-color:white;">

                    <div class="col-md-6">
                        <label for="name" class="form-label">Name</label>
                        <div class="d-flex">
                            <div class="col-3 me-1 w-50" id="name">
                                <asp:TextBox ID="txtfname" placeholder="First Name" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtfname" runat="server" ErrorMessage="please enter first name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-3 w-50">
                                <asp:TextBox ID="txtlname" placeholder="Last Name" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                   <%-- <div class="col-md-6">
                        <label for="txtemail" class="form-label">Email</label>
                        <asp:TextBox ID="txtemail" class="form-control" placeholder="abc@gmail.com" runat="server" TextMode="Email"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter the valid E-mail!!" ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>--%>
                    <%--  <div class="col-md-6">
                    <label for="txtpass1" class="form-label">Password</label>
                    <div class="d-flex">
                         <div class="col-3 me-1 w-50" id="txtpass1">
                    <asp:TextBox ID="txtpass" class="form-control" placeholder="Password"  runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
               </div>
                        <div class="col-3 w-50">
                            <asp:TextBox ID="txtconpass" class="form-control" placeholder=" Confirm-Password" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtconpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="password mismatched" ControlToCompare="txtpass" ControlToValidate="txtconpass" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                        </div>

                             </div>
                    </div>--%>
                    <div class="col-md-6">
                        <label for="txtcontact" class="form-label">Contact Number</label>
                        <asp:TextBox ID="txtcontact" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="please enter valid contact number" ControlToValidate="txtcontact" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                        <label for="txtadd" class="form-label">Address</label>
                        <asp:TextBox ID="txtadd" class="form-control" placeholder="1234 Main St" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="please enter address" ControlToValidate="txtadd" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                        <label for="txtaadhar" class="form-label">Aadhar Card No.</label>
                        <asp:TextBox ID="txtaadhar" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter valid aadhar number" ControlToValidate="txtaadhar" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-md-6 ">
                        <label for="txtcity" class="form-label">City</label>
                        <asp:TextBox ID="txtcity" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="please enter city" ControlToValidate="txtcity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-md-6">
                        <label for="txtzip" class="form-label">Zip</label>
                        <asp:TextBox ID="txtzip" class="form-control w-25" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="please enter zip" ControlToValidate="txtzip" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-12">
                        <asp:Button ID="btnUpdate" class="btn btn-primary me-3" runat="server" Text="Update Profile" OnClick="btnUpdate_Click" />
                          <button id="toggle" class="btn btn-secondary" onclick="function()">Hide ^</button>
                    </div>
                    

                </div>

            </div>
    </form>

    <script>
        const targetDiv = document.getElementById("edit");
        const btn = document.getElementById("toggle");
        btn.onclick = function () {
            if (targetDiv.style.display !== "none") {
                targetDiv.style.display = "none";
            } else {
                targetDiv.style.display = "block";
            }
        };

        
    </script>
</asp:Content>
