<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="Usignup.aspx.cs" Inherits="Home_Appliences_for__rent.user.Usignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>RentSpace | SignUp</title>
    <style>
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

                </ul>
                <span class="navbar-text me-lg-5">
                    <a href="Ulogin.aspx" class="btn btn-primary">Sign-In</a>
                </span>
            </div>
        </div>
    </nav>

    <!--navbar end-->
    <br />
    <br />
    <br />
    <br />
    <br />

    <div class="container">
        <div class="row align-items-end">
            <div class="col-md-10  offset-md-1" style="background-color: white;">
                <div style="background-color: white;" class="shadow rounded-4">

                    <h2 class="border-bottom py-3" style="text-align: center; font-family: 'Calisto MT'; font-style: normal; font-variant: normal; font-weight: bold; text-transform: none; color: #FF6600;">Sign-Up</h2>

                    <form id="form1" class="row g-3 p-3" runat="server">

                        <div class="col-md-6">
                            <label for="name" class="form-label">Name</label>
                            <div class="d-flex">
                                <div class="col-3 me-1 w-50" id="name">
                                    <asp:TextBox ID="txtfname" placeholder="First Name" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtfname" runat="server" ErrorMessage="Enter First Name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Enter valid Name" ControlToValidate="txtfname" ForeColor="red" Display="Dynamic" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col-3 w-50">
                                    <asp:TextBox ID="txtlname" placeholder="Last Name" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtlname" runat="server" ErrorMessage="Enter Last Name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter valid Name" ControlToValidate="txtlname" ForeColor="red" Display="Dynamic" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator>

                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <label for="txtemail" class="form-label">Email</label>
                            <asp:TextBox ID="txtemail" class="form-control" placeholder="abc@gmail.com" runat="server" TextMode="Email"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter the valid E-mail!!" ControlToValidate="txtemail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-6">
                            <label for="txtpass1" class="form-label">Password</label>
                            <div class="d-flex">
                                <div class="col-3 me-1 w-50" id="txtpass1">
                                    <asp:TextBox ID="txtpass" class="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Strong Password" ControlToValidate="txtpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-3 w-50">
                                    <asp:TextBox ID="txtconpass" class="form-control" placeholder=" Confirm-Password" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtconpass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="password mismatched" ControlToCompare="txtpass" ControlToValidate="txtconpass" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="txtcontact" class="form-label">Contact Number</label>
                            <asp:TextBox ID="txtcontact" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Mobile Number" ControlToValidate="txtcontact" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Number" ControlToValidate="txtcontact" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                        </div>
                        <div class="col-md-6">
                            <label for="txtadd" class="form-label">Address</label>
                            <asp:TextBox ID="txtadd" class="form-control" placeholder="1234 Main St" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Address" ControlToValidate="txtadd" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6">
                            <label for="txtaadhar" class="form-label">Aadhar Card No.</label>
                            <asp:TextBox ID="txtaadhar" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Aadhar Number" ControlToValidate="txtaadhar" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please Enter Valid Aadhar number" ControlToValidate="txtaadhar" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>

                        </div>
                        <div class="col-md-6">
                            <label for="txtcity" class="form-label">City</label>
                            <asp:TextBox ID="txtcity" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter City" ControlToValidate="txtcity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                        <div class="col-md-6">
                            <label for="txtzip" class="form-label">Zip</label>
                            <asp:TextBox ID="txtzip" class="form-control w-25" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter zip" ControlToValidate="txtzip" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please Enter Valid Zip" ControlToValidate="txtzip" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-12 d-flex">
                            <asp:Button ID="UserSignUp" class="btn btn-primary" runat="server" Text="Sign Up" OnClick="UserSignUp_Click" /><p class="ms-5 m-auto">Already Have An Account..?<a href="Ulogin.aspx">Sign-In</a></p>

                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
