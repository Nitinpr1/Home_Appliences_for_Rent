<%@ Page Title="" Language="C#" MasterPageFile="~/GuestUser/GuestMaster.Master" AutoEventWireup="true" CodeBehind="Guestview.aspx.cs" Inherits="Home_Appliences_for__rent.GuestUser.Guestview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous">

    </script>

    <script>
        $(document).ready(function myfunction() {
            $("#btncart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

        function changeQuantity(type) {
            var currentQty = $("#txtQuantity").val();
            if (type == 'plus') {
                $("#txtQuantity").val(parseInt(currentQty, 10) + 1);
            }
            else if (currentQty < 2) {
                $("#txtQuantity").val('1');
            }
            else {
                $("#txtQuantity").val(parseInt(currentQty, 10) - 1);
            }
        }

        function changeMonths(type) {
            var currentQty = $("#txtmonths").val();
            if (type == 'Monthsplus') {
                $("#txtmonths").val(parseInt(currentQty, 10) + 1);
            }
            else if (currentQty < 2) {
                $("#txtmonths").val('1');
            }
            else {
                $("#txtmonths").val(parseInt(currentQty, 10) - 1);
            }
        }
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }


        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
        function lfunction() {
            alert('Sign In Required!!');
        }

    </script>
    <style>
        #txtQuantity {
            max-width: 30px;
        }

        #txtmonths {
            max-width: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="container">
            <div class="row row-cols-1 row-cols-md-2 mt-3" style="background-color:white;">

                <asp:Repeater ID="rptrProductView" runat="server">
                    <ItemTemplate>
                        <div class="col-md-6 border-end">

                            <img src="../<%#Eval("Pimg") %>" class="w-100 rounded-3 shadow" alt=".." />
                        </div>
                        <div class="col-md-6 mt-4 mt-lg-0  text-justify ">
                            <h3 style="font-family: 'Calisto MT'; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;"><%#Eval("PName") %></h3>
                            <hr class="" style="width: 80px; border: 2px solid red;" />
                            <p class="text-muted mb-2" style="text-align: justify; text-justify: inter-word;">
                                <%#Eval("PDescription") %>
                            </p>
                            <div class="border-top mt-4">
                                <h4 class="mt-2" style="font-family: 'Calisto MT'; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Product Features</h4>
                                <p class="text-muted" style="text-align: justify; text-justify: inter-word;">
                                    <%#Eval("PProductFeature") %>
                                </p>
                            </div>
                            <br />
                            <div class="row  row-cols-1 row-cols-md-2">
                                <div class="col-md-6 justify-content-md-between border-end">
                                    <h5 class="text-muted">Monthly Rent :  <%#Eval("RPrice","{0:c}") %>/mo</h5>
                                </div>
                                <div class="col-md-6">
                                    <h5 class="text-muted">Refundable Deposit :  <%#Eval("DPrice","{0:c}") %>/mo</h5>
                                </div>

                            </div>

                            <div class="col-md-12 justify-content-center  mt-4">
                                <asp:Button ID="btnAddtoCart" class="btn btn-primary" runat="server" Text="Add to Cart" OnClientClick="lfunction()" />

                            </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="row mt-3">
                    <div class="col-6">
                        <h5 style="font-family: 'Calisto MT'; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Select Quantity</h5>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-secondary" onclick="changeQuantity('minus');" id="minus-btn">-</button>
                            </div>
                            <asp:TextBox ID="txtQuantity" CssClass="form-control form-control-sm w-25" runat="server" value="1" min="1" ClientIDMode="Static" />
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-secondary" id="plus-btn" onclick="changeQuantity('plus');">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <h5 style="font-family: 'Calisto MT'; font-style: normal; font-variant: normal; text-transform: none; color: #FF6600;">Select Month</h5>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-secondary" onclick="changeMonths('Monthsminus');" id="btn-minus">-</button>
                            </div>
                            <asp:TextBox ID="txtmonths" CssClass="form-control form-control-sm w-25" runat="server" value="1" min="1" ClientIDMode="Static" />
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-secondary" id="btn-plus" onclick="changeMonths('Monthsplus');">+</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</asp:Content>
