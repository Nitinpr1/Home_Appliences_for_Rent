<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="Electronic.aspx.cs" Inherits="Home_Appliences_for__rent.user.Electronic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <title>RentSpace | Electronics</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<script>
    $(document).ready(function myfunction() {
        $("#btncart").click(function myfunction() {
            window.location.href = "Cart.aspx";
        });
    });

  
</script>
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
                                <a href="UserHome.aspx" class="nav-link px-2 me-lg-3 link-dark">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link link-primary px-2 me-lg-3" href="Electronic.aspx">Electronic</a>
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
                            <asp:Button ID="Btnlogout" class="  btn btn-outline-primary" runat="server" Text="Sign-Out"   />--%>
                        </span>
                    </div>
                </div>
            </nav>
            
            <!--navbar end-->
    <br /><br /><br /><br /><br />
   
        <!--card item-->
        <div class="container">
            <div class="row row-cols-2 row-cols-md-4 g-4">
                <asp:Repeater ID="rptrProducts" runat="server">
                    <ItemTemplate>

                        <div class="col">
                            <a href="ViewProduct.aspx?Pid=<%# Eval("Pid") %>" style="text-decoration: none; color: black;">
                                <div class="card h-100 sitems">
                                    <img src="../<%#Eval("Pimg") %>" class="card-img-top" alt="img.." />
                                    <div class="card-body ">
                                        <h5 class="card-title"><%#Eval("PName") %></h5>
                                        <p class="card-text text-muted" style="text-align: justify; text-justify: inter-word;">
                                            <%#Eval("PDescription") %>
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <small>Starts from  ₹<%#Eval("RPrice","{0:c}") %>/mo</small>
                                       <asp:Button ID="Button1" class="btn btn-sm btn-primary float-end ffbtn" runat="server" Text="Add to Cart"/> 
                                    </div>
                                </div>
                            </a>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
          </form>
</asp:Content>
