<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myaccount.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Style Hunt</title>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/docs.min.css" rel="stylesheet" />
    <style>
        .body{
            padding-top:40px;
        }
        a:hover{
            cursor:pointer;
            
        }
    </style>
   
</head>
<body style="background-image: url('../images/bgpattern.PNG'); background-repeat: repeat">
    <form runat="server">
        
      <!--Navbar-->
        <nav class="navbar navbar-default" style="background-color: #5610FA;margin-bottom:0px" id="navbar1">
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
                        <li><a href="contactus.aspx" style="font-size: small; color: white">Contact Us</a></li>
                        <li><a href="testimonial.aspx" style="font-size:small; color:white">Testimonials</a></li>
                    </ul>
                    <div class="navbar-form navbar-left" style="font-size:small" role="search">
                        <div class="form-group">
                            <asp:TextBox ID="txtSearchHeader" placeholder="Search Here..." runat="server" CssClass="input input-sm"></asp:TextBox>
                            <cc1:AutoCompleteExtender ID="searchAutoExtend" TargetControlID="txtSearchHeader" runat="server" MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="10" ServiceMethod="getSearchBarResult"></cc1:AutoCompleteExtender>
                            <asp:Button ID="btnHeaderSearch" runat="server" CssClass="btn btn-info btn-sm" Text="Search" OnClick="btnHeaderSearch_Click"></asp:Button>
                        </div>
                      
                        </div>
                    <div class="navbar-form navbar-right">

                        <div class="form-group">
                        <asp:Button ID="lbtnReg" CssClass="btn btn-warning btn-sm" runat="server" Text="Register" OnClick="lbtnReg_Click" />
                        <asp:Button ID="lbtnLog" runat="server" CssClass="btn btn-warning btn-sm" Text="Login" OnClick="lbtnLog_Click" />
                        
                   </div> </div>

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
                                    <img src="images/icon2.png" />
                                </div>
                                <div class="col-md-3 col-md-offset-2 col-md-2 text-center">
                                    <br />
                                           <asp:Menu ID="Menu1" runat="server" CssClass="abc img-rounded" Font-Bold="true" BackColor="#FFFBD6" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Small" ForeColor="#990000" StaticEnableDefaultPopOutImage="false" StaticSubMenuIndent="10px">
                                        <DynamicHoverStyle BackColor="#990000" ForeColor="White"></DynamicHoverStyle>

                                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px"></DynamicMenuItemStyle>

                                        <DynamicMenuStyle BackColor="#FFFBD6"></DynamicMenuStyle>

                                        <DynamicSelectedStyle BackColor="#FFCC66"></DynamicSelectedStyle>
                                        <Items>
                                            <asp:MenuItem Text="Predictions" Value="Predictions">
                                                <asp:MenuItem Text="Astrology" NavigateUrl="~/asrto_form.aspx" Value="Astrology"></asp:MenuItem>
                                                <asp:MenuItem Text="Numerology" NavigateUrl="~/numerology_form.aspx" Value="Numerology"></asp:MenuItem>
                                                <asp:MenuItem Text="Vastu" NavigateUrl="~/vastu_form.aspx" Value="Vastu"></asp:MenuItem>
                                            </asp:MenuItem>
                                        </Items>
                                        <StaticHoverStyle BackColor="#990000" ForeColor="White"></StaticHoverStyle>

                                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px"></StaticMenuItemStyle>

                                        <StaticSelectedStyle BackColor="#FFCC66"></StaticSelectedStyle>
                                    </asp:Menu>
                                    <br />
                                     <span style="font-size:larger"> <asp:LinkButton ID="lbtncart" CssClass="badge bg-info" Visible="true" runat="server" PostBackUrl="~/addcart.aspx"><span style="font-size:larger">My Cart</span>&nbsp;<asp:Label ID="lblCartQuan" CssClass="badge bg-danger" Text="0" runat="server"></asp:Label></asp:LinkButton></span>
                                </div>
                                <div class="col-md-4 text-right">
                                    
                                    <br />
                                    <br />
                                  
                                    <h4><span class="label label-success"> Email : helpdesk@thestylehunt.in</span></h4>
                                    <h4><span class="label label-warning"> Mobile : 9444069162</span></h4>

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
        <div class="container" style="margin-bottom:-20px;margin-top:0px">
            
            <asp:Menu ID="headerMenu" runat="server" BackColor="#df376a" DynamicHorizontalOffset="2" StaticEnableDefaultPopOutImage="false" OnMenuItemClick="headerMenu_MenuItemClick" Font-Names="Verdana" Font-Size="1.0em" ForeColor="White" StaticSubMenuIndent="10px" Orientation="Horizontal" StaticMenuItemStyle-BorderStyle="Groove" StaticMenuStyle-BorderStyle="None" StaticHoverStyle-BorderStyle="None" BorderColor="#FFC880" BorderStyle="Solid" StaticMenuItemStyle-BorderColor="#FFC880">
                <DynamicHoverStyle BackColor="#990000" ForeColor="White"></DynamicHoverStyle>

                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="1px"></DynamicMenuItemStyle>

                <DynamicMenuStyle BackColor="#df376a"></DynamicMenuStyle>

                <DynamicSelectedStyle BackColor="#df376a"></DynamicSelectedStyle>

                <Items>
                    <asp:MenuItem Text="Home" NavigateUrl="~/index.aspx" Value="Home"></asp:MenuItem>
                </Items>

                <StaticHoverStyle BackColor="#df376a" ForeColor="White"></StaticHoverStyle>

                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="1px"></StaticMenuItemStyle>

                <StaticSelectedStyle BackColor="#FFCC66"></StaticSelectedStyle>
            </asp:Menu>
        </div>

        <!--End of Jumbatron-->
        <br />
        <br />
        <!--Body-->
        <div class="container">
           <%-- <div class="row">--%>
                
                    <div class="row">
                        <div class="col-md-3">
                         <div style="color:white;background-color:#df376a">
                   &nbsp;&nbsp;&nbsp;<span style ="font-size:large">My Account</span>
                    </div>
                        <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm">
                            <ul class="nav bs-docs-sidenav">

                                <li><a href="#account_dashboard">Account Dashboard</a> </li>
                                <li><a href="#address_book">Address Book</a></li>
                                <li><a href="#my_orders">My Orders</a></li>
                                <li><a href="#billing_agreements">Billing Agreements</a></li>
                               <%-- <li><a href="#recurring_profiles">Recurring Profiles</a></li>
                                <li><a href="#my_tags">My Tags</a></li>
                                <li><a href="#my_wishlist">My Wishlist</a></li>
                                <li><a href="#my_application">My Application</a></li>
                                <li><a href="#newsletter_subscription">Newsletter Subscriptions</a></li>
                                <li><a href="#my_downloadable_products">My Downloadable Products</a></li>
                                <li><a href="#my_rewards">My Rewards</a></li>--%>
                                <li><a href="#header">Go to Top</a></li>
                            </ul>
                        </nav>
                    </div>

                    <div class="col-md-9">
                  <section>
                     <div class="page-header" style="background-color:#5610FA;margin-top:-20px"  id="account_dashboard">
  				<h2><small style="color:white">&nbsp;&nbsp;My Dashboard</small></h2>
  			</div>
                      
                   <span style="color:#ff6a00">Hello, <asp:Label ID="lblUname" runat="server" Text=""></asp:Label></span>&nbsp;&nbsp;&nbsp;<asp:Button ID="foradmin" runat="server" CssClass="btn btn-danger" Text="Orders" OnClick="foradmin_Click" Visible="false" />
                      <br />
                      From your My Account Dashboard you have the ability to view a snapshot of your recent account activity and update your account information. Select a link below to view or edit information.
                      <br />
                      <br />
                      <div class="panel">
                      <div class="panel-heading"><span class="glyphicon glyphicon-apple"></span><span style="color:#ff6a00"><b>REWARD INFORMATION</b></span></div>
                           <div class="panel-body">
                          Your balance is <asp:Label ID="lblPoint" CssClass="badge bg-success" runat="server" Text=""></asp:Label>
                      </div>
                          </div>
                      <br />
                      <div class="panel">
                      <div class="panel-heading"><span class="glyphicon glyphicon-apple"></span><span style="color:#ff6a00"><b>ACCOUNT INFORMATION</b></span></div>
                           <div class="panel-body">
                               
                               <table style="width: 100%;" class="table-responsive">
                                   <tr style="color:#df376a; border-bottom-style: dashed; border-bottom-width: thin;">
                                       <th style="width:40%">User Information</th>
                                       <th class="text-right" style="width:10%">
                                           </th>
                                       <th class="text-right" style="width:10%">
                                           &nbsp;</th>
                                       <th style="width:40%">Newsletters</th>
                                       <th class="text-right" style="width:10%">
                                          </th>
                                   </tr>
                                   <tr>
                                       <td colspan="2">
                                           <asp:Label ID="lblFName" runat="server" Text=""></asp:Label>&nbsp;
                                           <asp:Label ID="lblLName" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblPriMobile" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblFax" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblCompany" runat="server" Text=""></asp:Label>
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                       <td colspan="2">
                                           &nbsp;<asp:Label ID="lblNewsInfo" runat="server" Text=""></asp:Label>
                                       </td>
                                   </tr>
                                   <tr>
                                       
                                       <td colspan="5"><asp:LinkButton ID="lbtnChangePass" runat="server" OnClick="lbtnChangePass_Click"><b>Manage Account Information</b></asp:LinkButton></td>
                                   </tr>
                               </table>
                              <asp:HiddenField ID="hidForModel" runat="server" />
                               <cc1:ModalPopupExtender ID="WarningModal" TargetControlID="hidForModel" runat="server" CancelControlID="btnWarning" DropShadow="true" PopupControlID="pnlIssues"></cc1:ModalPopupExtender>
                               <asp:Panel ID="pnlIssues" runat="server" CssClass="panel" Width="100%"  Height="100%">
                                   <div class="panel-heading">
                                       Manage Account Information
                                   </div>
                                   <div class="panel-body">
                                      <div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">User Details</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Password</a></li>
    <li role="presentation"><a href="#newsletter" aria-controls="newsletter" role="tab" data-toggle="tab">Newsletter</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
        <br />
        <table style="width: 100%;" class="table table-responsive">
            <tr>
                <td>First Name</td>
                <td>
                    <asp:TextBox ID="txtFnameEdit" CssClass="input-sm" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td>
                    <asp:TextBox ID="txtLnameEdit" CssClass="input-sm" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Company</td>
                <td>
                    <asp:TextBox ID="txtCompany" CssClass="input-sm" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Mobile</td>
                <td>
                    <asp:TextBox ID="txtPrimaryMobile" CssClass="input-sm" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Fax</td>
                <td>
                    <asp:TextBox ID="txtFax" CssClass="input-sm" runat="server"></asp:TextBox></td>
            </tr>
        </table>
    </div>
    <div role="tabpanel" class="tab-pane" id="profile"> <br />
        <br />
        <table style="width: 100%;" class="table table-responsive">
            <tr>
                <td>Current Password</td>
                <td>
                    <asp:TextBox ID="txtCPass" CssClass="input-sm" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>New Password</td>
                <td>
                    <asp:TextBox ID="txtNewPass" CssClass="input-sm" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Confirm New Password</td>
                <td>
                    <asp:TextBox ID="txtNewPassConf" CssClass="input-sm" runat="server"></asp:TextBox></td>
            </tr>
        </table></div>
    <div role="tabpanel" class="tab-pane" id="newsletter">
        <br />
        <asp:CheckBox ID="chkNewsEdit" Text="General Subscription" runat="server" />
    </div>
    
  </div>

</div>
                                   </div>
                                   <div class="panel-footer">                      
 
           
 <!-- Label in the Panel to turn off the popup -->
              <asp:Button ID="btnSaveEditUserInfo" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnSaveEditUserInfo_Click" />&nbsp;&nbsp;&nbsp;
              <asp:Button runat="server" CssClass="btn btn-warning" ID="btnWarning" Text="Close"></asp:Button></div>
                               </asp:Panel>
                             
                      </div>
                          </div>
                     
                     
                  </section> 
                   
                     <section>
                        <div class="page-header" style="background-color:#5610FA"  id="address_book">
  				<h2><small style="color:white">&nbsp;&nbsp;Address Book</small></h2>
  			</div>
           <div class="panel">
                      <div class="panel-heading"><span class="glyphicon glyphicon-apple"></span><span style="color:#ff6a00"><b>DEFAULT ADDRESS INFORMATION</b></span></div>
                           <div class="panel-body">
                                 <table style="width: 100%;" class="table-responsive">
                                   <tr style="color:#df376a; border-bottom-style: dashed; border-bottom-width: thin;">
                                       <th style="width:40%">Address Book</th>
                                       <th class="text-right" style="width:10%"></th>
                                           
                                       <th class="text-right" style="width:10%">
                                           &nbsp;</th>
                                       <th style="width:20%">&nbsp;&nbsp;</th>
                                       <th class="text-right" style="width:30%">    
                                           </th>
                                   </tr>
                                   <tr>
                                       <td colspan="2">
                                          <span style="color:#df376a">DEFAULT BILLING ADDRESS</span>
                                           <br />
                                           <asp:Label ID="lblAdd1" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblAdd2" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblCity" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblState" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblcountry" runat="server" Text=""></asp:Label>&nbsp;-&nbsp;<asp:Label ID="lblPincode" runat="server" Text=""></asp:Label>
                                           <br />
                                           Mobile:<asp:Label ID="lblMobile" runat="server" Text=""></asp:Label>
                                           <br />
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                       <td colspan="2">
                                           
                                           <span style="color:#df376a">DEFAULT SHIPPING ADDRESS</span>
                                           <br />
                                           <asp:Label ID="lblSAdd1" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblSAdd2" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblSCity" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblSState" runat="server" Text=""></asp:Label>
                                           <br />
                                           <asp:Label ID="lblSCountry" runat="server" Text=""></asp:Label>&nbsp;-&nbsp;<asp:Label ID="lblSPin" runat="server" Text=""></asp:Label>
                                           <br />
                                           Mobile:<asp:Label ID="lblSMobile" runat="server" Text=""></asp:Label>
                                           <br />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td colspan="5"><asp:LinkButton ID="lbtnManageAddress" OnClick="lbtnManageAddress_Click" runat="server"><b>Add New Address</b></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbtnAddrMan" runat="server" OnClick="lbtnAddrMan_Click"><b>Manage Addresses</b></asp:LinkButton>
                                       </td>
                                   </tr>
                               </table>
                               
                              <asp:HiddenField ID="hidFieldAddr" runat="server" />
                               <cc1:ModalPopupExtender ID="moDelAddress" TargetControlID="hidFieldAddr" runat="server" CancelControlID="btnCloseAddr" DropShadow="true" PopupControlID="pnlAddrModel"></cc1:ModalPopupExtender>
                               <asp:Panel ID="pnlAddrModel" runat="server" CssClass="panel" Width="100%"  Height="100%">
                                   <div class="panel-heading">
                                       Add New Address
                                   </div>
                                   <div class="panel-body">
                                      <div>
                                          <table style="width: 100%;" class="table table-responsive">
                                              <tr>
                                                  <td>Address Line 1</td>
                                                  <td>
                                                      <asp:TextBox ID="txtAddr1EditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>Address Line 2</td>
                                                  <td>
                                                      <asp:TextBox ID="txtAddr2EditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>City</td>
                                                  <td>
                                                      <asp:TextBox ID="txtCityEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>State</td>
                                                  <td>
                                                      <asp:TextBox ID="txtStateEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>Country</td>
                                                  <td>
                                                      <asp:TextBox ID="txtCountryEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>Pincode</td>
                                                  <td>
                                                      <asp:TextBox ID="txtPinEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>Mobile</td>
                                                  <td>
                                                      <asp:TextBox ID="txtMobileEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>&nbsp;</td>
                                                  <td>
                                                      <asp:CheckBox ID="chkbxMakeAsDefEdit" CssClass="checkbox checkbox-inline" Text="Make as Default Billing Address" runat="server" />
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>&nbsp;</td>
                                                  <td>
                                                      <asp:CheckBox ID="chkbxMakeAsShippingEdit" CssClass="checkbox checkbox-inline" Text="Make as Default Shipping Address" runat="server" />
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td>&nbsp;</td>
                                                  <td>
                                                      <asp:Label ID="lblAddModelWar" runat="server" CssClass="lable label-warning" Text=""></asp:Label>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                          </table>
                                      </div>
                                   </div>
          <div class="panel-footer">                      
           
 <!-- Label in the Panel to turn off the popup -->
              <asp:Button ID="btnSaveAddr" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnSaveAddr_Click" />&nbsp;&nbsp;&nbsp;
              <asp:Button runat="server" CssClass="btn btn-warning" ID="btnCloseAddr" Text="Close"></asp:Button></div></asp:Panel>
                      </div>
                          </div>
                    </section>
                     <section>
                        <div class="page-header" style="background-color:#5610FA"  id="my_orders">
  				<h2><small style="color:white">&nbsp;&nbsp;My Orders</small></h2>
  			</div>
            <asp:GridView ID="grd_placed_order" OnRowCommand="grd_placed_order_RowCommand" CssClass="table table-hover" AutoGenerateColumns="false" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="Order Id" DataField="cart_Id" />
                    <asp:BoundField HeaderText="Order Date" DataField="cart_order_date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField HeaderText="Price" DataField="cart_price" />
                    <asp:BoundField HeaderText="Status" DataField="cart_status" />
                    <asp:ButtonField CommandName="details" ButtonType="Button" Text="Details" ControlStyle-CssClass="btn btn-primary" HeaderText="Order Details" />
                    <asp:ButtonField CommandName="track" ButtonType="Button" Text="Track" ControlStyle-CssClass="btn btn-danger" HeaderText="Track Order" />
                </Columns>
            </asp:GridView>
                         <asp:HiddenField ID="hidforOrderDet" runat="server" />
                               <cc1:ModalPopupExtender ID="mdlPopforOrderDet" TargetControlID="hidforOrderDet" runat="server" CancelControlID="btnOrderClose" DropShadow="true" PopupControlID="pnlOrderDet"></cc1:ModalPopupExtender>
                               <asp:Panel ID="pnlOrderDet" runat="server" CssClass="panel" Width="400px"  Height="400px" ScrollBars="Auto">
                                   <div class="panel-heading">
                                       Order Details
                                   </div>
                                   <div class="panel-body">
                                       <asp:GridView runat="server" ID="grdOrderDetView" AutoGenerateColumns="false" CssClass="table table-bordered">
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
                                      
                                       <asp:Button ID="btnOrderClose" Text="Close" CssClass="btn btn-danger" runat="server" />
                                   </div>
                                          </asp:Panel>
                         <asp:HiddenField ID="hidforOrderTrack" runat="server" />
                         <cc1:ModalPopupExtender ID="mdlPopforOrderTrack" TargetControlID="hidforOrderTrack" runat="server" CancelControlID="btnOrderTrackCancel" DropShadow="true" PopupControlID="pnlOrderTrck"></cc1:ModalPopupExtender>
                         <asp:Panel ID="pnlOrderTrck" runat="server" CssClass="panel" ScrollBars="Auto">
                             <div class="panel-heading">Track Status</div>
                             <div class="panel-body">
                                 <asp:Image ID="imgTrck" runat="server" />
                             </div>
                             <div class="panel-footer">
                                 <asp:Button ID="btnOrderTrackCancel" Text="Close" runat="server" CssClass="btn btn-danger" />
                             </div>
                         </asp:Panel>
                    </section>
                     <section>
                        <div class="page-header" style="background-color:#5610FA"  id="billing_agreements">
  				<h2><small style="color:white">&nbsp;&nbsp;Billing Agreements</small></h2>
  			</div>
            There are no billing agreements yet.
                    </section>


               <%--      <section>
                        <div class="page-header" style="background-color:#5610FA"  id="recurring_profiles">
  				<h2><small style="color:white">&nbsp;&nbsp;Recurring Profiles</small></h2>
  			</div>
            There are no recurring profiles yet.
                    </section>
                    <section>
                        <div class="page-header" style="background-color:#5610FA"  id="my_tags">
  				<h2><small style="color:white">&nbsp;&nbsp;My Tags</small></h2>
  			</div>
            You have not tagged any products yet.
                    </section>
                     <section>
                        <div class="page-header" style="background-color:#5610FA"  id="my_wishlist">
  				<h2><small style="color:white">&nbsp;&nbsp;My Wishlist</small></h2>
  			</div>
            You have no items in your wishlist.
                    </section>
                     <section>
                        <div class="page-header" style="background-color:#5610FA"  id="my_application">
  				<h2><small style="color:white">&nbsp;&nbsp;My Application</small></h2>
  			</div>
            You have no applications.
                    </section>
                     <section>
                        <div class="page-header" style="background-color:#5610FA"  id="newsletter_subscription">
  				<h2><small style="color:white">&nbsp;&nbsp;Newsletter Subscription</small></h2>
  			</div>
            <div class="panel">
                      <div class="panel-heading"><span class="glyphicon glyphicon-apple"></span><span style="color:#ff6a00"><b>NEWSLETTER SUBSCRIPTION</b></span></div>
                           <div class="panel-body">
                          <asp:CheckBox ID="chkNews" Text="General Subscription" runat="server" />
                      </div>
                <div class="panel-footer">
                    <asp:Button ID="btn_news_subs" CssClass="btn btn-primary" runat="server" Text="Save" />
                </div>
                          </div>

                    </section>
                    <section>
                        <div class="page-header" style="background-color:#5610FA"  id="my_downloadable_products">
  				<h2><small style="color:white">&nbsp;&nbsp;My Downloadable Products</small></h2>
  			</div>
            You have not purchased any downloadable products yet.
                    </section>
                    <section>
                        <div class="page-header" style="background-color:#5610FA"  id="my_rewards">
  				<h2><small style="color:white">&nbsp;&nbsp;My Rewards</small></h2>
  			</div>
            <div class="panel">
                      <div class="panel-heading"><span class="glyphicon glyphicon-baby-formula"></span><span style="color:#ff6a00"><b>REWARD INFORMATION</b></span></div>
                           <div class="panel-body">
                          Your balance is <asp:Label ID="lblPnt" runat="server" Text="Label"></asp:Label> &nbsp;Point
                               <br />
                               <br />
                               <br />
                               <b>How you can earn points</b><br />
Each <b> Rs100.00</b> spent for your order will earn <b>10 Points</b>.
                               <br />
                               <br />
                               <b>How you can spend points</b><br />
Each <b> 1 Point</b> can be redeemed for <b>Rs1.00</b>.
                               <br />
                               <br />
                               <b>A transaction will expire after 365 days since its creating date..</b><br />
View transaction history to follow when the transaction expires. 
                      </div>
                          </div>
                    </section>--%>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                </div>
                   </div>
                    
                
            
         </div>
                
               
           <%-- </div>--%><!--End of Row-->
            <br />
            
        

        <hr class="dl-horizontal" />
        <!--End of Body-->
        <!--Model-->
        <div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Sampurn 12 Jyotirlinga Chowki with Shiva idol</h4>
      </div>
      <div class="modal-body">
                <div class="col-md-4">
                    <img src="images/yantra1.PNG" />
                </div>
                <div class="col-md-8">
                  <span style="font-size:large">Sampurn 12 Jyotirlinga Chowki with Shiva idol</span>
                  <span style="font-size:medium">  <br />Rs.2,100 </span>
                    <br />Price in Points : 2100
                    <br />Points Earned : 210

                    
                    <blockquote>
                       <header> Quick Overview</header>
                        <p style="font-size:small">
                            Lord Shiva is considered most superior among all gods. One can attain anything by worshiping Lord Shiva. By worshiping Lord Shiva on the auspicious occasion of Shivratri all beneficial results can be obtained. If for any reason it is not possible for you to do Darshana of 12 Jyotirlingas then 12 Jyotirlinga Chowki can be established at your place of worship to achieve auspicious objectives like salvation and blessings of Lord Shiva. This is very powerful yantra chowki for worshipping Lord Shiva. It has images of the 12 Jyotirlingas. In the center sits a brass idol of Lord Shiva surrounded by panchakshri mantra "Om Namah Shivaye" and 4 tridents at the borders.
                        </p>
                    </blockquote>
                </div>
           
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
        <!--End of Model-->
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
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a href="privacyPolicy.aspx" style="color:black">Privacy Policy</a></div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a href="shippingpolicy.aspx" style="color:black">Shipping Policy</a></div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a href="returnpolicy.aspx" style="color:black">Return Policy</a></div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a href="termsofuse.aspx" style="color:black">Terms & Conditions</a></div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a style="color:black" href="contactus.aspx">Contact Us</a></div><br />
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
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;<a style="color:black" href="reg_form.aspx">Sign In</a></div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;<a style="color:black" href="addcart.aspx">View Cart</a></div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;<a style="color:black" href="trackorder.aspx">Track Your Order</a></div><br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;Help / FAQ</div><br />
                        </div>  
                    </div>
                </div>
            </div>
        Copyright © 2015, M/s Srijothedam. All rights reserved.
        </footer>
        <!--End of Body-->
    </form>

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
     <script>
         $(function () {
             $("#header").load("header1.aspx");
             $("#footer").load("footer1.aspx");
         });
    </script>
  
</body>
</html>
