<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Home_Appliences_for__rent.Admin.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hes {
            background: #FF416C;
            background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
            background: linear-gradient(to right, #FF4B2B, #FF416C);
        }

        .add {
            background: #ff9966;
            background: -webkit-linear-gradient(to right, #ff5e62, #ff9966);
            background: linear-gradient(to right, #ff5e62, #ff9966);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div class="container">
        <div class="col-12 mb-3 ">
            <h3 style="font-family: 'Calisto MT'; font-size: xx-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: white;" class="py-4 text-center border rounded-3 shadow hes">Welcome Back Admin, <span id="success" runat="server"></span>!</h3>

        </div>
        <hr />
        <div class="row row-cols-1 row-cols-md-3 g-4">

            <div class="col">
                <a href="AddProduct.aspx" style="text-decoration: none;">
                    <div class="card sitems w-100 text-center add">
                        <h3 class="py-5 text-white">Add Product</h3>
                    </div>
                </a>
            </div>
            <div class="col">
                <a href="AddCategory.aspx" style="text-decoration: none;">
                    <div class="card sitems h-100 text-center add">
                        <h3 class="py-5 text-white">Add Category</h3>
                    </div>
                </a>
            </div>
            <div class="col">
                <a href="AddSubCategory.aspx" style="text-decoration: none;">
                    <div class="card sitems h-100 text-center add">
                        <h3 class="py-5 text-white">Add Sub-Category</h3>
                    </div>
                </a>
            </div>
        </div>
        <br />
        <div class="row g-4">
            <div class="col-12 col-md-6">
                <a href="ManageUser.aspx" style="text-decoration: none;">
                    <div class="card sitems h-100 text-center add">
                        <h3 class="py-5 text-white">Manage Users</h3>
                    </div>
                </a>
            </div>
            <div class=" col-12 col-md-6">
                <a href="Reports.aspx" style="text-decoration: none;">
                    <div class="card sitems h-100 text-center add">
                        <h3 class="py-5 text-white">Reports</h3>
                    </div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
