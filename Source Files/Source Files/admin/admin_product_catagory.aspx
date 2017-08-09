    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_product_catagory.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Style Hunt</title>
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script> 
    <style>
        .body{
            padding-top:40px;
        }
        a:hover{
            cursor:pointer;
            
        }
    </style>
   <script type="text/javascript">
       function OnProductSelectedItem(source, eventArgs) {
           PageMethods.SetDownloadPath(eventArgs.get_value());
           //sessionStorage.setItem("ProductNameJS", eventArgs.get_value());
       }
   </script>
</head>
<body style="background-image: url('../images/bgpattern.PNG'); background-repeat: repeat">
    <form runat="server">
          <!--Navbar-->
           <nav class="navbar navbar-default" style="background-color: #5610FA; margin-bottom: 0px" id="navbar1">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" style="font-size: small; color: white">Customer Care : 044-26154001,26158001,26155501</a>
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
        <br />
        
        <br />
        <div class="container" style="background-color:white">
            <div class="row">
                <br />
                <div class="col-md-offset-2 col-md-8 col-md-offset-2">
                    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">View Catagories</a></li>
    <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Add Catagories</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane" id="home">
        <br />
        <asp:UpdatePanel runat="server">
          <ContentTemplate>
        <asp:GridView ID="grdCatagory" AutoGenerateColumns="false" OnPageIndexChanging="grdCatagory_PageIndexChanging" AllowPaging="true" OnRowCommand="grdCatagory_RowCommand" CssClass="table table-hover table-condensed" DataKeyNames="product_catagory_id" runat="server">
            <Columns>
            <asp:ButtonField CommandName="editRecord" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record">
                                                   <ControlStyle CssClass="btn btn-info" />
                                                   </asp:ButtonField>
                                               <asp:ButtonField CommandName="deleteRecord" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Delete" HeaderText="Delete Record">
                                                  <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                                   </asp:ButtonField>
                                               <asp:BoundField DataField="product_catagory" HeaderText="Catagory" />
                                               <asp:BoundField DataField="product_sub_catagory" HeaderText="Sub Catagory1" />
                                                <asp:BoundField DataField="product_catagory_type" HeaderText="Type" />
                </Columns>
        </asp:GridView>
         <asp:HiddenField ID="hidForCataEdit" runat="server" />
       <cc1:ModalPopupExtender ID="updateModal" TargetControlID="hidForCataEdit" runat="server" CancelControlID="btnClose" DropShadow="true" PopupControlID="editModal"></cc1:ModalPopupExtender>
      <asp:Panel runat="server" ID="editModal" CssClass="panel" Width="100%" Height="100%">
                                <div class="modal-header">
                                    <h3>Edit Catagory</h3>
                                </div>
                                <%-- <asp:UpdatePanel ID="upEdit" runat="server">
                                       <ContentTemplate>--%>

                                <div class="modal-body">
                                    <table class="table">
                                        <tr>
                                            <td>Catagory</td>
                                            <td>
                                                <asp:TextBox ID="txtCatagory" runat="server"></asp:TextBox>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>Sub Catagory</td>
                                            <td>
                                                <asp:TextBox ID="txtSCatagory" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>Type</td>
                                            <td>
                                                <asp:DropDownList ID="drpEditTypeCatagory" runat="server">
                                                    <asp:ListItem>Product</asp:ListItem>
                                                    <asp:ListItem>Custom</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                   
                                    <asp:Button ID="btnSave" runat="server" Text="Update" OnClick="btnSave_Click" CssClass="btn btn-info" CausesValidation="False" />
                                    <asp:Button ID="btnClose" CssClass="btn btn-info" Text="Close" runat="server" CausesValidation="False"></asp:Button>
                                </div>

                                <%--</ContentTemplate>
                                       <Triggers>
                                           <%--<asp:AsyncPostBackTrigger ControlID="grdAddr" EventName="RowCommand" />--%>
                                <%-- <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                           <asp:AsyncPostBackTrigger ControlID="btnClose" EventName="Click" />
                                       </Triggers>
                                   </asp:UpdatePanel>--%>
                            </asp:Panel>
              </ContentTemplate>
            </asp:UpdatePanel>
    </div>
   
       <div role="tabpanel" class="tab-pane active" id="profile"> <br />
       
           <table style="width: 100%;" class="table table-responsive">
            <tr>
                <td>Catagory</td>
                <td>
                    <asp:TextBox ID="txtCataEntry" CssClass="input-sm" runat="server"></asp:TextBox>
                    <cc1:AutoCompleteExtender ID="auto1" runat="server" OnClientItemSelected="OnProductSelectedItem" TargetControlID="txtCataEntry" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="10" ServiceMethod="GetCompletionList"></cc1:AutoCompleteExtender>

                </td>
            </tr>
            <tr>
                <td>Sub Catagory</td>
                <td>
                    <asp:TextBox ID="txtSCataEntry" CssClass="input-sm" runat="server"></asp:TextBox></td>
                 <cc1:AutoCompleteExtender ID="auto2" runat="server" TargetControlID="txtSCataEntry" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="10" ServiceMethod="GetCompleteList2"></cc1:AutoCompleteExtender>
            </tr>
          <tr>
                <td>Type</td>
                <td>
                    <asp:DropDownList ID="drpTypeCatagory" CssClass="input-sm" runat="server">
                        <asp:ListItem>Product</asp:ListItem>
                        <asp:ListItem>Custom</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
        </table>
           <div class="panel-footer">
               <asp:Button ID="btnSaveCatagory" CssClass="btn btn-info" OnClick="btnSaveCatagory_Click" runat="server" Text="Save" />
           <asp:Button ID="btnResetCatagory" CssClass="btn btn-danger" runat="server" Text="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMsg" CssClass="label label-success" runat="server" Text=""></asp:Label></div>
       </div>
      
    
  </div>
                    
                </div>
            </div>
        </div>
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
    
</body>
</html>
