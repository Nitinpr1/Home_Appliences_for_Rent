<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Home_Appliences_for__rent.user.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <title>RentSpace | ContactUs</title>
    <style>
        .con {
            background-image: url('NewFolder1/custbg.jpg');
            background-position: center;
            background-attachment: scroll;
            background-repeat: no-repeat;
            object-fit:fill;
            height:500px;
        }

        .conheading {
            margin-left: 180px;
            margin-top: 140px;
        }

        .loc {
            margin-left: 50px;
            margin-top: 150px;
        }

        .emailmargin {
            margin-top: 250px;
        }

        .icon {
            color: lightslategray;
        }

            .icon:hover {
                color: orangered !important;
            }
    </style>
        <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">

    </script>

    <script>
        $(document).ready(function myfunction() {
            $("#btncart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

       
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1"  runat="server">
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
                                <a href="UserHome.aspx" class="nav-link px-2 me-lg-3 link-dark ">Home</a>
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
                                <a href="ContactUs.aspx" class="nav-link link-dark px-2 me-lg-3 link-primary">Contact Us</a>
                            </li>
                           <li class="nav-item" id="profile" runat="server">
                                <a href="UserProfile.aspx" class="nav-link link-dark px-2 me-lg-3 link-dark">Profile</a>
                            </li>
                        </ul>
                        <span id="cartshow" class="navbar-text me-lg-5" runat="server">
                            <a class="icons me-3" style="text-decoration: none; position: relative; width: 40px;">
                                <i id="btncart" class="bi bi-cart4 fs-3 me-3"></i>
                                <span id="pCount" runat="server" class="badge rounded-pill text-bg-secondary" style="position: absolute; bottom: 15px; left: 15px; display: block;"></span>

                            </a>
                           <%-- <i class="bi bi-person-circle me-1 fs-4" style="color: #FF6600;"></i>
                            <a href="UserProfile.aspx" style="text-decoration: none;">
                                <asp:Label ID="lblsuccess" class="me-3" Style="color: #FF6600; font-size: large;" runat="server"></asp:Label></a>
                            <asp:Button ID="Btnlogout" class="  btn btn-outline-primary" runat="server" Text="Sign-Out"  />--%>
                        </span>
                    </div>
                </div>
            </nav>

    <!--navbar end-->
    <br /><br /><br /><br /><br /> 
    <div class="container">
        <div class="row con" style="background-color:white;">
            <div class=" col-12 col-md-6 w-100">
                <div class=" ms-5 mt-5">
                    <h2 class="" style="font-family: 'Calisto MT'; font-size: 40px; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: orangered;">Contact Us</h2>

                    <p class="mt-3 text-muted" style="font-size: 20px">
                        This Page has been Designed to stay
                        <br />
                        in touch with our Customers....
                    </p>
                </div>
            </div>
            <div class=" col-12 col-md-6 w-100">

                <div class=" float-lg-end d-flex mt-5 rounded-5 shadow" style="background-color:white;">
                    <div class="me-4 ms-3 mt-2 ">

                        <h6><i class="bi bi-envelope-fill me-2 icon fs-4"></i><a href="mailto:senjuarjun1@gmail.com" class="icon mb-5">Rentspace@gmail.com</a></h6>

                    </div>
                    <div class="me-4 mt-2 ">
                        <h6 class="icon"><i class="bi bi-telephone-outbound-fill me-2 fs-4 icon"></i>+919044097472</h6>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <br />
    <div class="container">
        <br />
        <div class="row">
            <div class="col-12 col-md-6">
                <div class="mt-5">
                    <main class="w-75 ms-5 mt-5 ">
                        <div class="text-center">
                            <div class="mt-5 ">
                                <h5 class="mb-3 " style="font-size: xx-large;"><b>Location</b></h5>
                                <div class="mb-3">
                                    <h6 style="color: orangered; font-size: x-large;"><b>Rentspace Main Office - Navi Mumbai</b></h6>
                                    <br />
                                    <p class="text-muted">
                                        Rentspace Private Limited 5th Floor, L-148, 4th Main, Sector 2, thane, Navi Mumbai, Maharastra, Pin - 400603
                                    </p>
                                </div>
                            </div>
                        </div>

                    </main>
                </div>
            </div>

            <div class="col-12 col-md-6 mt-sm-5 mt-lg-0" style="background-color:white;">
                <h2 class="text-center" style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: uppercase; color: #FF6600;">We will love to help You..!!</h2>

                <div class="row g-3 w-100  m-auto">
                    <div class="col-md-12">
                        <label for="txtname" class="form-label">Name</label>
                        <asp:TextBox ID="txtname" placeholder="Name..." class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtname" runat="server" ErrorMessage=" *" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-12">
                        <label for="txtemail" class="form-label">Email</label>
                        <asp:TextBox ID="txtemail" placeholder="abc@gmail.com" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtemail" runat="server" ErrorMessage=" *" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid Email" ForeColor="Red" ControlToValidate="txtemail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-12">
                        <label for="txtmsg" class="form-label">Message</label>
                        <asp:TextBox ID="txtmsg" placeholder="Your message here...." class="form-control" TextMode="MultiLine" runat="server" Height="70px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtmsg" runat="server" ErrorMessage=" *" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-12 mb-3">
                        <asp:Button ID="btnContact" class="btn btn-primary" runat="server" Text="Submit" OnClick="btnContact_Click" />
                    </div>
                </div>
               
            </div>
        </div>
    </div>
     </form>
</asp:Content>
