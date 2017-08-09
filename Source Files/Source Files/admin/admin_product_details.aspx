<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="admin_product_details.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Style Hunt</title>
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .body{
            padding-top:40px;
        }
        a:hover{
            cursor:pointer;
            
        }
    </style>
    
   <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script> 
    <script src="tinymce/tinymce.min.js"></script>
  <script>tinymce.init({ selector: 'textarea' });</script>
   <script type="text/javascript">
       function OnProductSelectedItem(source,eventArgs)
       {
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
                <div class="col-md-12">
                    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
                     <ul class="nav nav-tabs" role="tablist">
    <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">View Details</a></li>
    <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Add Details</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
      
    <div role="tabpanel" class="tab-pane" id="home">
        <br /><asp:UpdatePanel runat="server">
          <ContentTemplate>
        <asp:GridView ID="grdCatagory" AutoGenerateColumns="false" PageSize="3" OnPageIndexChanging="grdCatagory_PageIndexChanging" AllowPaging="true" OnRowCommand="grdCatagory_RowCommand" CssClass="table table-hover table-condensed" DataKeyNames="product_id" runat="server">
            <Columns>
            <asp:ButtonField CommandName="editRecord" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record">
                                                   <ControlStyle CssClass="btn btn-info" />
                                                   </asp:ButtonField>
                                               <asp:ButtonField CommandName="deleteRecord" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Delete" HeaderText="Delete Record">
                                                  <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                                   </asp:ButtonField>
                <asp:BoundField DataField="product_name" HeaderText="Name" />
                
                                               <asp:BoundField DataField="product_catagory" HeaderText="Catagory" />
                                               <asp:BoundField DataField="product_sub_catagory" HeaderText="Sub Catagory1" />
                <asp:BoundField DataField="product_overview" HeaderText="Overview" />
                <asp:BoundField DataField="product_details" HeaderText="Details" />
<asp:BoundField DataField="product_price" HeaderText="Price" />
                <asp:BoundField DataField="product_availability" HeaderText="Availability" />
                                            
                </Columns>
        </asp:GridView>

              <asp:HiddenField ID="hidForCataEdit" runat="server" />
       <cc1:ModalPopupExtender ID="updateModal" TargetControlID="hidForCataEdit" runat="server" CancelControlID="btnClose" DropShadow="true" PopupControlID="editModal"></cc1:ModalPopupExtender>
      <asp:Panel runat="server" ID="editModal" CssClass="panel" Width="100%" Height="600px" ScrollBars="Auto">
                                <div class="modal-header">
                                    <h3>Edit Catagory</h3>
                                </div>
                                <%-- <asp:UpdatePanel ID="upEdit" runat="server">
                                       <ContentTemplate>--%>

                                <div class="modal-body">
                                    <table style="width: 100%;" class="table table-responsive">
            <tr>
                <td>Product Name</td>
                <td>
                    <asp:TextBox ID="txtProductName_E" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Product Catagory</td>
                <td>
                    <asp:TextBox ID="txtProductCat_E" runat="server"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td>Product Subcatagory</td>
                <td>
                    <asp:TextBox ID="txtProductSubCat_E" runat="server"></asp:TextBox>
                   
                </td>
            </tr>
                 <tr>
                <td>Product Overview</td>
                <td>
                    <textarea runat="server" id="txtareaProductOver_E"></textarea>
                   </td>
            </tr>
               <tr>
                <td>Product Details</td>
                <td>
                    <textarea runat="server" id="txtareaProductDet_E"></textarea>
                   </td>
            </tr>
                <tr>
                <td>Product Price</td>
                <td>
                   <asp:TextBox ID="txtProductPrice_E" runat="server"></asp:TextBox>
                   </td>
            </tr>
                <tr>
                <td>Availability</td>
                <td>
                    <asp:DropDownList ID="drpProductAvailable_E" runat="server">
                        <asp:ListItem>In Stock</asp:ListItem>
                        <asp:ListItem>Out of Stock</asp:ListItem>
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
      <%-- <asp:UpdatePanel runat="server">
           <ContentTemplate>--%>
           <table style="width: 100%;" class="table table-responsive">
            <tr>
                <td>Product Name</td>
                <td>
                    <asp:TextBox ID="txtProductName_A" CssClass="form-control" runat="server"></asp:TextBox>
                    <cc1:AutoCompleteExtender ID="auto23" runat="server" TargetControlID="txtProductName_A" MinimumPrefixLength="2" EnableCaching="true" CompletionSetCount="1" CompletionInterval="10" ServiceMethod="GetCompleteList3"></cc1:AutoCompleteExtender>
                </td>

            </tr>
            <tr>
                <td>Product Catagory</td>
                <td>
                    <asp:TextBox ID="drpProductCatagory_A" CssClass="form-control" runat="server" />
                    <cc1:AutoCompleteExtender ID="auto1" runat="server" OnClientItemSelected="OnProductSelectedItem" TargetControlID="drpProductCatagory_A" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="10" ServiceMethod="GetCompletionList"></cc1:AutoCompleteExtender>
                  
                   <%-- <asp:DropDownList ID="drpProductCatagory_A" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="product_catagory" DataValueField="product_catagory">
                        <asp:ListItem>Select your Catagory</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:project16ConnectionString %>' ProviderName='<%$ ConnectionStrings:project16ConnectionString.ProviderName %>' SelectCommand="SELECT DISTINCT product_catagory FROM product_catagory order by product_catagory"></asp:SqlDataSource>--%>
                </td>
            </tr>
          <tr>
                <td>Product Subcatagory</td>
                <td> 
                    <asp:TextBox ID="drpSubCatagory_A" CssClass="form-control" runat="server" />
                   <cc1:AutoCompleteExtender ID="auto2" runat="server" TargetControlID="drpSubCatagory_A" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="10" ServiceMethod="GetCompleteList2"></cc1:AutoCompleteExtender>
                   
                </td>
            </tr>
                 <tr>
                <td>Product Overview</td>
                <td>
                    <textarea runat="server" id="txtAreaProductOver_A"></textarea>
                   </td>
            </tr>
               <tr>
                <td>Product Details</td>
                <td>
                    <textarea runat="server" id="txtAreaProductDet_A"></textarea>
                   </td>
            </tr>
                <tr>
                <td>Product Price</td>
                <td>
                   <asp:TextBox ID="txtProductPrice_A" runat="server"></asp:TextBox>
                   </td>
            </tr>
                <tr>
                <td>Availability</td>
                <td>
                    <asp:DropDownList ID="drpAvailability_A" runat="server">
                        <asp:ListItem>In Stock</asp:ListItem>
                        <asp:ListItem>Out of Stock</asp:ListItem>
                    </asp:DropDownList>
                   </td>
            </tr>
               <tr>
                   <td>Choose your Image</td>
                   <td>
                       <asp:FileUpload ID="imgUpload_A" AllowMultiple="true" runat="server" />
                       </td>
               </tr>
        </table>
              <%-- </ContentTemplate>
       </asp:UpdatePanel>--%>
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
    </form>

    <script src="../js/jquery-2.1.4.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    
    
   
</body>
</html>
