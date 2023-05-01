<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Home_Appliences_for__rent.user.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>RentSpace | ForgotPassword</title>
<style>
   .icon{
       color:orangered;
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
                         
                    </ul>
                    <span class="navbar-text me-lg-5">
                       <%-- <a class="icons me-3" style="text-decoration: none; position: relative; width: 40px;">
                            <i id="btncart" class="bi bi-cart4 fs-3 me-3"></i>
                            <span id="pCount" runat="server" class="badge rounded-pill text-bg-secondary" style="position: absolute; bottom: 15px; left: 15px; display: block;"></span>

                        </a>--%>
                   <%--     <i class="bi bi-person-circle me-1 fs-4" style="color: #FF6600;"></i>
                        <a href="UserProfile.aspx" style="text-decoration: none;">
                            <asp:Label ID="lblsuccess" class="me-3" Style="color: #FF6600; font-size: large;" runat="server"></asp:Label></a>--%>
                        <asp:Button ID="Btnlogout" class="  btn btn-outline-primary" runat="server" Text="Sign-In" />
                    </span>
                </div>
            </div>
        </nav>
        <!--navbar end-->
        <br />
        <br /><br /><br /><br />
        <div class="container ">
            <div class="row align-items-end">
           <div class="col-md-4 offset-md-4" style="background-color:white;">
               <div class="border shadow p-5 rounded-5  bgcolor"  >
               <main class="text-center border-bottom " >
           <i class="bi bi-exclamation-diamond-fill fs-1 icon"></i>
                <h1 class="h3 mb-3 fw-normal">Forgot Password </h1>
                   <p class="text-muted mb-3">Please Enter Your Email.<br /> We will Send it on Mail.</p>
                     </main>
                    <label for="txtpass1" class="form-label ms-2 mt-3"> Your Email</label>
                        <asp:TextBox ID="txtemail" class="form-control"  runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter valid Email!!" ForeColor="Red" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>,<br />
                    <asp:Label ID="lblsu" runat="server"></asp:Label>
                   <asp:Button ID="btnForgotPassword" class="btn btn-primary mb-3 w-100" runat="server" Text="Get Link" OnClick="btnForgotPassword_Click" />
                   <br />
                   <div class="text-center">
                   <asp:HyperLink ID="hyperlogin"  runat="server" NavigateUrl="~/user/Ulogin.aspx">Back to SignIn</asp:HyperLink></div>
               </div>
            </div>
        </div>
         </div>
    </form>
</asp:Content>
