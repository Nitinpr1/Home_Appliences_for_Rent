<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmaster.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Home_Appliences_for__rent.Admin.AddCategory" %>

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
            <div class="col-md-4 offset-md-4" style="background-color: white;">
                <main class="row p-5 m-auto g-3 border rounded-5 shadow">
                    <h4 style="font-family: 'Calisto MT'; font-size: xx-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;" class="text-center">Add Category</h4>
                    <div class="col-md-12">
                        <label for="txtCategoryName" class="form-label">Category Name</label>
                        <asp:TextBox ID="txtCategoryName" class="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategoryName" ErrorMessage="Please Enter Category Name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter valid Category Name"  ControlToValidate="txtCategoryName" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9 ]*$"></asp:RegularExpressionValidator>

                    </div>
                    <div class="col-md-12">
                        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Add" OnClick="Button1_Click" />
                    </div>
                </main>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="container border-top mb-4">
        <div class="row">
            <div class="col-md-12 text-center mt-3">
                <h3 style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;" class="text-center">Categories</h3>
            </div>
            <div class="col-12 mt-3 ">
                <asp:GridView ID="Gvcategory" class="table table-hover table-striped table-bordered border-dark" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="CatId" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="CatId" HeaderText="CatId" InsertVisible="False" ReadOnly="True" SortExpression="CatId" />
                        <asp:BoundField DataField="CatName" HeaderText="CatName" SortExpression="CatName" />
                        <asp:TemplateField HeaderText="Edit">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" class="btn btn-outline-primary" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="Btndet" class="btn btn-outline-primary" OnClientClick="return confirm('If you delete this Category, the Subcategory and Products related to it will also be deleted. Are you sure you want to delete?');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RentspaceDB %>" DeleteCommand="DELETE FROM [tblcategory] WHERE [CatId] = @CatId" InsertCommand="INSERT INTO [tblcategory] ([CatName]) VALUES (@CatName)" SelectCommand="SELECT * FROM [tblcategory]" UpdateCommand="UPDATE [tblcategory] SET [CatName] = @CatName WHERE [CatId] = @CatId">
                    <DeleteParameters>
                        <asp:Parameter Name="CatId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CatName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CatName" Type="String" />
                        <asp:Parameter Name="CatId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>


</asp:Content>
