<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="Ulogin.aspx.cs" Inherits="Home_Appliences_for__rent.user.Ulogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <title>RentSpace | Sign In</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
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
                            <li class="nav-item">sq
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
                                  <a href="Usignup.aspx" class="btn btn-primary">Sign-up </a>
                        </span>
                    </div>
                </div>
            </nav>
            
            <!--navbar end-->
    <br /><br /><br /><br />
    <div class="row align-items-end">
        <div class="col-sm-4 offset-sm-4" style="background-color:white;">
        <main class="border shadow p-5 rounded-5">
            <form id="form1" runat="server" >
                <div class="text-center">
                <i class="bi bi-person-circle fs-1" style="color:orangered;"></i>
                <h1 class="h3 mb-3 fw-normal">Sign In</h1>
                    </div>
                <div class="form-floating">
                    <asp:TextBox ID="txtmail" class="form-control" placeholder="name@example.com" runat="server" TextMode="Email"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email Required" ControlToValidate="txtmail" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter valid Email!!" ForeColor="Red" ControlToValidate="txtmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <label for="txtmail">Email address</label>
                </div>
                <br />
                <div class="form-floating">
                    <asp:TextBox ID="txtpass" class="form-control" placeholder="password" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Required" ControlToValidate="txtpass" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label for="txtpass">Password</label>
                </div>

                <div class="checkbox my-3 float-start">
                    <label>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        Remember me
                    </label>
                   
                </div>
                <div class="float-end  my-3 "> <a href="ForgotPassword.aspx" >Forgot Password?</a></div>  
                <div class="my-3 ">

                    <asp:Button ID="btnSignIn" class="w-100 btn btn-lg btn-primary" runat="server" Text="Sign In" OnClick="btnSignIn_Click" />
                    <hr />
                   
                    
                </div>
            </form>
            <div class="text-center">
             <p>Don't have an Account?</p>
            <a href="Usignup.aspx" class="w-50 btn btn-lg btn-outline-primary mt-1 border-top">Sign-up </a>
              </div>
        </main>
            </div>
    </div>
</asp:Content>
