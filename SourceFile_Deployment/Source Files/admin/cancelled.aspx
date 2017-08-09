    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="cancelled.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Style Hunt</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
    <style>
        .body{
            padding-top:40px;
        }
        a:hover{
            cursor:pointer;
            
        }
        .dropdown-submenu {
  position: relative;
}
.dropdown-submenu > .dropdown-menu {
  top: 0;
  left: 100%;
  margin-top: -6px;
  margin-left: -1px;
}
.dropdown-submenu:hover > .dropdown-menu {
  display: block;
}
.dropdown-submenu:hover > a:after {
  border-left-color: #fff;
}
.dropdown-submenu.pull-left {
  float: none;
}
.dropdown-submenu.pull-left > .dropdown-menu {
  left: -100%;
  margin-left: 10px;
}
    </style>
   
</head>
<body style="background-image: url('../images/bgpattern.PNG'); background-repeat: repeat">
    <form runat="server">
        <!--Navbar-->
       <!--Navbar-->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <nav class="navbar navbar-default" style="background-color: #5610FA; margin-bottom: 0px" id="navbar1">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                  <a class="navbar-brand" style="font-size: small; color: white">Customer Care :9600402445</a>
                </div>
                <!--End of Navbar Header-->
                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="../index.aspx" style="font-size: small; color: white">Home</a></li>
                        <li><a href="admin_page.aspx" style="font-size: small; color: white">Admin Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-size:small;color:white" role="button" aria-expanded="false">Orders<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="processed.aspx">Processed Orders</a></li>
                                <li><a href="approved.aspx">Approved Orders</a></li>
                                <li><a href="shipped.aspx">Shipped Orders</a></li>
                                <li><a href="delivered.aspx">Delivered Orders</a></li>
                                <li><a href="cancelled.aspx">Cancelled Orders</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-size:small;color:white" role="button" aria-expanded="false">Products<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="admin_product_catagory.aspx">Product Catagories</a></li>
                                <li><a href="admin_product_details.aspx">Product Details</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-size:small;color:white" role="button" aria-expanded="false">Predictions<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="astro.aspx">Astrology</a></li>
                                <li><a href="nemerology.aspx">Numerology</a></li>
                                <li><a href="vastu.aspx">Vastu</a></li>
                            </ul>
                        </li>
                        <%--<li><a href="#" style="font-size: small; color: white"></a></li>
                        <li><a href="#" style="font-size: small; color: white">BE OUR DISTRIBUTORS</a></li>
                        <li><a href="#" style="font-size: small; color: white">COMPANY PROFILE</a></li>
                        <li><a href="#" style="font-size: small; color: white">SHIPPING INFO</a></li>
                        <li><a href="#" style="font-size: small; color: white">REGISTER</a></li>
                        <li><a href="#" style="font-size: small; color: white">LOGIN</a></li>--%>
                    </ul>
                </div>
                <!--End of Navbar Collapse-->
            </div>
            <!--End of Container-->
        </nav>
        <!--End of Top NavBar-->

        <!--Jumbatron-->
       <div class="container" style="margin-top: 0px; margin-bottom: 0px">
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron" style="background-color: transparent">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4 text-left">
                                    <img src="../images/icon.png" class="img-responsive" />
                                </div>
                                <div class="col-md-4 text-center">
                                   
                                </div>
                                <div class="col-md-4 text-right">
                                    <asp:Button ID="lbtnLog" runat="server" OnClick="lbtnLog_Click" CssClass="btn btn-warning" Text="Login" />
                                    <br />
                                    <br />

                                    

                                    <br />
                                    <br />

                                    
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--End of Jumbatron-->
        <!--Jambutron-->
        <!--End of Jumbatron-->
        <!--End of Jumbatron-->
        <br />
        <div class="container">
            <asp:UpdatePanel ID="updatepanel1" runat="server">
                <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">Cancelled Orders</div>
                   
                    <div class="panel-body">
                        <asp:GridView ID="grdPendingOrders" OnPageIndexChanging="grdPendingOrders_PageIndexChanging" PageSize="10" AllowPaging="true" OnRowCommand="grdPendingOrders_RowCommand" CssClass="table table-hover" AutoGenerateColumns="false" runat="server">
                            <Columns>
                                <asp:BoundField HeaderText="Cart Id" DataField="cart_Id" />
                                <asp:BoundField HeaderText="User Name" DataField="cart_user_name" />
                                <asp:BoundField HeaderText="Address" DataField="user_s_address" />
                                <asp:BoundField HeaderText="Mobile" DataField="mobile" />
                                <asp:BoundField HeaderText="Shipping Method" DataField="ship_method" />
                                <asp:BoundField HeaderText="No.Of Items" DataField="total_items" />
                                <asp:BoundField HeaderText="Total Price" DataField="cart_price" />
                                <asp:ButtonField HeaderText="Delete" Text="Delete" CommandName="status" ButtonType="Button" ControlStyle-CssClass="btn btn-danger" />
                                <asp:ButtonField HeaderText="Details" Text="Show" CommandName="show" ButtonType="Button" ControlStyle-CssClass="btn btn-success" />
                            </Columns>
                        </asp:GridView>
                        <asp:HiddenField ID="hidforPendingStatus" runat="server" />
                        <cc1:ModalPopupExtender ID="mdlforPandingStatus" TargetControlID="hidforPendingStatus" runat="server" CancelControlID="btnCloseOPending" DropShadow="true" PopupControlID="pnlPendingStatus"></cc1:ModalPopupExtender>
                        <asp:Panel ID="pnlPendingStatus" runat="server" CssClass="panel" Width="100%" Height="100%">
                            <div class="panel-heading">Order Status</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <asp:HiddenField ID="hidValuCartId" runat="server" />
                                    <label for="status">Set Status</label>
                                    <asp:DropDownList ID="ddlstatuspending" CssClass="form-control" runat="server">
                                        <asp:ListItem>Shipped</asp:ListItem>
                                        <asp:ListItem>Cancelled</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="lblshippdate">Shipped Date</label>
                                    <asp:TextBox ID="txtShipDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    <%--<cc1:CalendarExtender runat="server" Format="dd-MM-yyyy" BehaviorID="txtShipDate_CalendarExtender" TargetControlID="txtShipDate" ID="txtShipDate_CalendarExtender"></cc1:CalendarExtender>--%>
                                </div>
                                <div class="form-group">
                                    <label for="lnlshipDetails">Shipping Details</label>
                                    <asp:TextBox ID="txtShipDetails" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <asp:Button ID="btnPendingStats" Text="Update" OnClick="btnPendingStats_Click" runat="server" CssClass="btn btn-primary" />
                                <asp:Button ID="btnCloseOPending" Text="Close" runat="server" CssClass="btn btn-danger" />
                            </div>
                        </asp:Panel>

                        <asp:HiddenField ID="hidforPendingDetails" runat="server" />
                        <cc1:ModalPopupExtender ID="mdlforPandingDetails" TargetControlID="hidforPendingDetails" runat="server" CancelControlID="btnCloseODetails" DropShadow="true" PopupControlID="pnlPendingDetails"></cc1:ModalPopupExtender>
                        <asp:Panel ID="pnlPendingDetails" runat="server">
                            <div class="panel">
                                <div class="panel-heading">Order Details</div>
                                <div class="panel-body">
                                      <asp:GridView runat="server" ID="grdPendingDetView" AutoGenerateColumns="false" CssClass="table table-bordered">
                                           <Columns>
                                               <asp:BoundField HeaderText="Product Name" DataField="product_name" />
                                               <asp:BoundField HeaderText="Price" DataField="product_price" />
                                               <asp:BoundField HeaderText="Quantity" DataField="cart_pro_quantity" />
                                               <asp:BoundField HeaderText="SubTotal" DataField="sub_total" />
                                           </Columns>
                                       </asp:GridView>
                                     <div class="panel-body text-right" style="background-color:#5610FA">
                                           Grand Total : Rs.<asp:Label ID="lblGrndTotal" runat="server"></asp:Label>
                                       </div>

                                </div>
                                <div class="panel-footer">
                                    <asp:Button ID="btnCloseODetails" CssClass="btn btn-danger" runat="server" Text="Close" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                         </div>
                </div>
            </div>
                    </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <br />

          <!--Well-->
        
   
         <footer style="background-color:white">
            <div style="height:10px;background-color:#df376a"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <br />
                        <div class="well"><span style="color:#df376a;font-size:large">Information</span> </div>
                        <br /><br />
                        <div class="panel" style="font-size:medium;color:black">
                               <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;About Us</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;Privacy Policy</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;Shipping Policy</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;SiteMap</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;Contact Us</div><br />
                        </div>  
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="well"><span style="color:#df376a;font-size:large">Why Buy From Us</span> </div>
                        <br /><br />
                        <div class="panel" style="font-size:medium;color:black">
                               <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Shipping Policy</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Terms of Use</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Payment Options</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Return Policy</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Reward Points</div><br />
                        </div>  
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="well"><span style="color:#df376a;font-size:large">My Account</span> </div>
                        <br /><br />
                        <div class="panel" style="font-size:medium;color:black">
                               <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;Sign In</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;View Cart</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;My Wishlist</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;Track Your Order</div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;Help / FAQ</div><br />
                        </div>  
                    </div>
                </div>
            </div>
        </footer>
        <!--End of Body-->
    </form>

    <script src="../js/jquery-2.1.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
     <script>
         $(function () {
             $("#header").load("admin_header1.aspx")
             $("#footer").load("footer1.aspx");
         });    
    </script>
</body>
</html>
