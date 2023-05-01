<%@ Page Title="" Language="C#" MasterPageFile="~/user/userMaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Home_Appliences_for__rent.user.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>RentSpace | AboutUs</title>  
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">

    </script>

    <script>
        $(document).ready(function myfunction() {
            $("#btncart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

       
       
    </script>
    <style>
        .imgn{
            max-height:280px;
            margin-inline-start:30px;
            border-radius:10px;
            margin-top:5px;
            border:5px solid gray;
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
                                <a href="UserHome.aspx" class="nav-link px-2 me-lg-3 link-dark">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link link-dark px-2 me-lg-3" href="Electronic.aspx">Electronic</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link link-dark px-2 me-lg-3" href="Furniture.aspx">Furniture</a>
                            </li>
                            <li class="nav-item">
                                <a href="AboutUs.aspx" class="nav-link  px-2 me-lg-3 link-primary">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a href="ContactUs.aspx" class="nav-link link-dark px-2 me-lg-3 link-dark">Contact Us</a>
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
            </form>
            <!--navbar end-->
     <br /><br /><br /> 
    <div class="container-fulid">
            <div class="row mx-2 mt-2">
                <div class="col-12 border-bottom shadow rounded-3 text-center about" style="background-image: url('NewFolder1/12_VLDB_1920x720_MSR_Event_Page_Banner.png'); background-repeat: no-repeat; background-attachment: scroll;">
                    <h1 style="font-family: 'Calisto MT'; margin-top: 100px; font-size: xx-large; font-weight: bold; color:black;">About Us</h1>
                    <br />
                    <br />
                    <p   style="font-size: large; color:black; ">
                        Why renting, you ask? Well, because we understand that unnecessary furniture and appliance costs aren’t the best investment options. So we decided to come up with an easier solution instead.
                    We provide more than online rental services, we help you explore a world of possibilities. With our assured quality and prompt services,you can say goodbye to all the hassles that come with buying and say hello to convenience.
                    </p>
                    <br />
                    <br />
                </div>
            
            <div class="col-12 text-center mt-4 mb-4 border shadow rounded-4" style="background-color:#FE6726">
                <h4><b>Our Team</b></h4>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-cols-1 row-cols-md-2 g-4" style="background-color:white;">
            <div class="col-md-9 border-end" >
               
               <h2 class="ms-2 py-3" style="font-family: 'Calisto MT';  font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Nitin Prajapati</h2>
                
                <p class=" text-muted" style=" text-align:justify; text-justify:inter-word;">
                  A Full Stack Web Developer. I have expertise in HTML, CSS, JavaScript, Bootstrap, ASP.NET, SQL Server and React Js. With my strong foundation in front-end technologies and back-end frameworks, I am capable of building responsive, dynamic, and interactive websites and web applications. 
                    With my knowledge of SQL Server, I am well-equipped to develop and manage data-driven web applications. I am excited to begin my career as a Full stack Web Developer. Throughout my academic journey, I have developed a strong foundation in Web Development, and I am eager to apply my knowledge to real-world projects.
                </p>
            </div>
            <div class="col-md-3">
              
                <img alt="img" src="NewFolder1/nitin.jpg" class="imgn shadow"/>
            </div> 
             
            <div class="col-md-9 border-end" style="background-color:white;">
              <h2 class="ms-2 py-3" style="font-family: 'Calisto MT';  font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Mayuresh Yewale</h2>

                <p class=" text-muted" style=" text-align:justify; text-justify:inter-word;">
               A  Front End Developer. As a front end web developer and UI designer, I bring a unique blend of technical expertise and creative flair to every project. With experience in HTML, CSS, JavaScript, and bootstrap, 
                    I have the skills to build responsive and user-friendly websites that are both functional and visually appealing.  I am excited to begin my career as a Front End Web developer. Throughout my academic journey, I have developed a strong foundation in Front End Development, and I am eager to apply my knowledge to real-world projects.
                </p>

            </div>
            <div class=" col-md-3">
               <img alt="img" src="NewFolder1/mayuresh.png" class="imgn" />
            </div>

        </div>



    </div>
</asp:Content>
