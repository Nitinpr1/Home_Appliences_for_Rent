<%@ Page Title="" Language="C#" MasterPageFile="~/GuestUser/GuestMaster.Master" AutoEventWireup="true"  CodeBehind="GuestHome.aspx.cs" Inherits="Home_Appliences_for__rent.GuestUser.GuestHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
        function  lfunction() {
            alert('Sign In Required!!');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <!--carousel-->
        <div class="container">
            <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="true">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/user/NewFolder1/homeap.png" class="d-block w-100" alt="carousel-img" />
                    </div>
                    <div class="carousel-item">
                        <img src="/user/NewFolder1/homeap1.jpg" class="d-block w-100" alt="carousel-img" />
                    </div>
                    <div class="carousel-item">
                        <img src="/user/imga.jpg" class="d-block w-100" alt="carousel-img" />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!--carousel end-->
        <br />
    <form id="form1" runat="server">

         <!--card item-->
        <div class="container">
            <div class="row row-cols-1 row-cols-md-4 g-4">
                <asp:Repeater ID="rptrProducts" runat="server">
                    <ItemTemplate>

                        <div class="col">
                            <a href="Guestview.aspx?Pid=<%# Eval("Pid") %>" style="text-decoration: none; color: black;">
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
                                        <asp:Button ID="Button1" class="btn btn-sm btn-primary float-end ffbtn" runat="server" Text="Add to Cart" OnClick="Button1_Click"/>
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
