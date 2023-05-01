<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmaster.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Home_Appliences_for__rent.Admin.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-md-6 offset-md-3" style="background-color: white;">

                <main class="row  m-auto border shadow g-3 p-5 rounded-5">

                    <h3  style="font-family: 'Calisto MT'; font-size: xx-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;" class="text-center">Add Product</h3>
                    <div class="col-md-12">
                        <label for="txtProductname" class="form-label">Product Name</label>
                        <asp:TextBox ID="txtProductname" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Product Name" ControlToValidate="txtProductname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </div>
                    <div class="col-md-6">
                        <label for="ddlcategory" class="form-label">Category</label>
                        <asp:DropDownList ID="ddlcategory" class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged"></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select category" ControlToValidate="ddlcategory" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                        <label for="ddlsubcategory" class="form-label">Sub-Category</label>
                        <asp:DropDownList ID="ddlsubcategory" class="form-control" runat="server"></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select SubCategory" ControlToValidate="ddlsubcategory" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-md-12">
                        <label for="txtpdis" class="form-label">Product Description</label>
                        <asp:TextBox ID="txtpdis" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Product Discription" ControlToValidate="txtpdis" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        

                    </div>

                    <div class="col-md-12">
                        <label for="txtpfet" class="form-label">Product Features</label>
                        <asp:TextBox ID="txtpfet" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Product Features" ControlToValidate="txtpfet" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                         

                    </div>
                    <div class="col-md-6">
                        <label for="txtdprice" class="form-label">Deposit Price</label>
                        <asp:TextBox ID="txtdprice" class="form-control" runat="server" ToolTip="Enter Price in Rs"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Deposit Price" ControlToValidate="txtdprice" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>

                    <div class="col-md-6">
                        <label for="txtprice" class="form-label">Monthly Rental Price</label>
                        <asp:TextBox ID="txtprice" class="form-control" runat="server" ToolTip="Enter Price in Rs"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Rental Price" ControlToValidate="txtprice" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>

                    <div class="col-md-6">
                        <label for="ProImg" class="form-label">Product Image</label>
                        <asp:FileUpload ID="ProImg" class="form-control" runat="server" ToolTip="Choose the Image" /><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Choose a Image" ControlToValidate="ProImg" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    <br />
                    <div class="col-md-12">
                        <asp:Button ID="btnaddProduct" class="btn btn-primary" runat="server" Text="Add Product" OnClick="btnaddProduct_Click" />
                    </div>
                </main>

            </div>
        </div>
        <br />
       
    </div>
</asp:Content>
