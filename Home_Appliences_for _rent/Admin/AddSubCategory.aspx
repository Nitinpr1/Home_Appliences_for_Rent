<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmaster.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="Home_Appliences_for__rent.Admin.AddSubCategory" %>

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
                    <h4 style="font-family: 'Calisto MT'; font-size: xx-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;" class="text-center">Add Sub-Category</h4>
                    <div class="col-md-12">
                        <label for="ddlcategory" class="form-label">Category Name</label>
                        <asp:DropDownList ID="ddlcategory" class="form-control" runat="server"></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlcategory" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select Category" Display="Dynamic" ForeColor="Red" ControlToValidate="ddlcategory"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-md-12">
                        <label for="txtSubcategoryName" class="form-label">Sub-Category Name</label>
                        <asp:TextBox ID="txtSubcategoryName" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter SubCategory Name" Display="Dynamic" ForeColor="Red" ControlToValidate="txtSubcategoryName"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter valid SubCategory" ControlToValidate="txtSubcategoryName" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9 ]*$"></asp:RegularExpressionValidator>

                    </div>
                    <div class="col-md-12">
                        <asp:Button ID="Button1" class="btn btn-primary w-25" runat="server" Text="Add" OnClick="Button1_Click" />
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
                <h3 style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;" class="text-center">Sub-Categories</h3>
            </div>
            <div class="col-12 mt-3 ">
                <asp:GridView ID="Gvsubcat" class="table table-hover table-striped table-bordered border-dark" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="SubcatId" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="SubcatId" HeaderText="SubcatId" InsertVisible="False" ReadOnly="True" SortExpression="SubcatId" />
                        <asp:BoundField DataField="SubcatName" HeaderText="SubcatName" SortExpression="SubcatName" />
                        <asp:BoundField DataField="MaincatId" HeaderText="MaincatId" SortExpression="MaincatId" />
                        <asp:TemplateField HeaderText="Edit">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" class="btn btn-outline-primary" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Butedit" class="btn btn-outline-primary" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" class="btn btn-outline-primary" runat="server" OnClientClick="return confirm('If you delete this SubCategory, the Products related to it will also be deleted. Are you sure you want to delete?');" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RentspaceDB %>" DeleteCommand="DELETE FROM [tblSubcategory] WHERE [SubcatId] = @SubcatId" InsertCommand="INSERT INTO [tblSubcategory] ([SubcatName], [MaincatId]) VALUES (@SubcatName, @MaincatId)" SelectCommand="SELECT * FROM [tblSubcategory]" UpdateCommand="UPDATE [tblSubcategory] SET [SubcatName] = @SubcatName, [MaincatId] = @MaincatId WHERE [SubcatId] = @SubcatId">
                    <DeleteParameters>
                        <asp:Parameter Name="SubcatId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SubcatName" Type="String" />
                        <asp:Parameter Name="MaincatId" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SubcatName" Type="String" />
                        <asp:Parameter Name="MaincatId" Type="Int32" />
                        <asp:Parameter Name="SubcatId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
               
            </div>
        </div>
    </div>



</asp:Content>
