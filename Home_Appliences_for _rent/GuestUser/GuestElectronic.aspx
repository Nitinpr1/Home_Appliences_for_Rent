<%@ Page Title="" Language="C#" MasterPageFile="~/GuestUser/GuestMaster.Master" AutoEventWireup="true" CodeBehind="GuestElectronic.aspx.cs" Inherits="Home_Appliences_for__rent.GuestUser.GuestElectronic" %>
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
     <br />
      <form id="form1" runat="server">
        <!--card item-->
        <div class="container">
            <div class="row row-cols-2 row-cols-md-4 g-4">
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
                                        <asp:Button ID="Button1" class="btn btn-sm btn-primary float-end ffbtn" runat="server" Text="Add to Cart"  OnClientClick="lfunction()" />
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
