<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Adminmaster.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Home_Appliences_for__rent.Admin.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fulid">
        <div class="d-flex justify-content-between mb-2 mt-3">
            <div class="text-uppercase ms-5">
                <h2 style="font-family: 'Calisto MT'; font-size: xx-large; font-weight: bold; color: gray;">Reports</h2>
            </div>
            <div class="d-flex me-5">
                <asp:Button ID="btnOrderReport" class="btn btn-outline-primary me-3" runat="server" Text="Download Order Report" OnClick="btnOrderReport_Click" />
                <asp:Button ID="btnPaymentReport" class="btn btn-outline-primary" runat="server" Text="Download Payment Report" OnClick="btnPaymentReport_Click" />

            </div>
        </div>
        <hr style="border: 3px dashed red;" />

        <div class="mt-4 mx-3">
            <h3 style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; color: gray;" class="text-uppercase text-center py-2">Orders done by users</h3>
            <asp:GridView ID="GvOrders" class="table table-hover table-striped table-bordered border-dark" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="OrderedProId" HeaderText="Order ID" />
                    <asp:BoundField DataField="OrderNumber" HeaderText="Order Number" />
                    <asp:BoundField DataField="UserId" HeaderText="User ID" />
                    <asp:BoundField DataField="UName" HeaderText="User Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="UAddress" HeaderText="Address" />
                    <asp:BoundField DataField="ContactNo" HeaderText="Contact No." />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="TotalPaid" HeaderText="Total Paid" />
                    <asp:BoundField DataField="Products" HeaderText="Products" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Months" HeaderText="Months" />
                    <asp:BoundField DataField="RentalDate" HeaderText="Rental Date" />
                    <asp:BoundField DataField="Returndate" HeaderText="Return Date" />
                    <asp:BoundField DataField="Paymentstatus" HeaderText="Payment Status" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" />
                </Columns>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>

        <div class="mt-4 mx-3">
            <h3 style="font-family: 'Calisto MT'; font-size: x-large; font-weight: bold; color: gray;" class="text-uppercase text-center py-2">Payments</h3>
            <asp:GridView ID="GvPayments" class="table table-hover table-striped table-bordered border-dark" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="PaymetId" HeaderText="Payment ID" />
                    <asp:BoundField DataField="UserId" HeaderText="User ID" />
               <%--     <asp:BoundField DataField="UName" HeaderText="User Name" />--%>
                    <asp:BoundField DataField="CardNo" HeaderText="Card Number" />
                    <asp:BoundField DataField="Expirydate" HeaderText="Expiry Date of Card" />
                    <asp:BoundField DataField="TotalPaid" HeaderText="Total Paid" />
                    <asp:BoundField DataField="Paymentstatus" HeaderText="Payment Status" />
                     <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" />
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
        </div>
    </div>

</asp:Content>
