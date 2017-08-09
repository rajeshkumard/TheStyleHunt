<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addcart.aspx.cs" Inherits="addcart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .body{
            padding-top:40px;
        }
        a:hover{
            cursor:pointer;
        }
        .auto-style1 {
            width: 170px;
            height: 141px;
        }
        .accordionContent {
background-color: white;
border-color: -moz-use-text-color #2F4F4F #2F4F4F;
border-right: 1px dashed #2F4F4F;
border-style: none dashed dashed;
border-width: medium 1px 1px;
padding: 10px 5px 5px;
/*width:20%;*/
}
.accordionHeaderSelected {
background-color: #5610FA;
border: 1px solid #2F4F4F;
color: white;
cursor: pointer;
font-family: Arial,Sans-Serif;
font-size: 12px;
font-weight: bold;
margin-top: 5px;
padding: 5px;
/*width:20%;*/
}
.accordionHeader {
background-color: #5610FA;
border: 1px solid #2F4F4F;
color: white;
cursor: pointer;
font-family: Arial,Sans-Serif;
font-size: 12px;
font-weight: bold;
margin-top: 5px;
padding: 5px;
/*width:20%;*/
}
.href
{
color:White; 
font-weight:bold;
text-decoration:none;
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
                                        <%--<Items>
                                            <asp:MenuItem Text="Predictions" Value="Predictions">
                                                <asp:MenuItem Text="Astrology" NavigateUrl="~/asrto_form.aspx" Value="Astrology"></asp:MenuItem>
                                                <asp:MenuItem Text="Numerology" NavigateUrl="~/numerology_form.aspx" Value="Numerology"></asp:MenuItem>
                                                <asp:MenuItem Text="Vastu" NavigateUrl="~/vastu_form.aspx" Value="Vastu"></asp:MenuItem>
                                            </asp:MenuItem>
                                        </Items>--%>
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
            
            <asp:Menu ID="headerMenu" runat="server" BackColor="#5610FA" DynamicHorizontalOffset="2" StaticEnableDefaultPopOutImage="false" OnMenuItemClick="headerMenu_MenuItemClick" Font-Names="Verdana" Font-Size="1.0em" ForeColor="White" StaticSubMenuIndent="10px" Orientation="Horizontal" StaticMenuItemStyle-BorderStyle="Groove" StaticMenuStyle-BorderStyle="None" StaticHoverStyle-BorderStyle="None" BorderColor="#FFC880" BorderStyle="Solid" StaticMenuItemStyle-BorderColor="#FFC880">
                <DynamicHoverStyle BackColor="#990000" ForeColor="White"></DynamicHoverStyle>

                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="1px"></DynamicMenuItemStyle>

                <DynamicMenuStyle BackColor="#5610FA"></DynamicMenuStyle>

                <DynamicSelectedStyle BackColor="#5610FA"></DynamicSelectedStyle>

                <Items>
                    <asp:MenuItem Text="Home" NavigateUrl="~/index.aspx" Value="Home"></asp:MenuItem>
                </Items>

                <StaticHoverStyle BackColor="#5610FA" ForeColor="White"></StaticHoverStyle>

                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="1px"></StaticMenuItemStyle>

                <StaticSelectedStyle BackColor="#FFCC66"></StaticSelectedStyle>
            </asp:Menu>
        </div>

        <!--End of Jumbatron-->

        <br />
       
        <br />
        <!--Body-->
          <asp:UpdatePanel ID="pnl1" runat="server">
                        <ContentTemplate>
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                     <div style="color:white;background-color:#5610FA">
                   &nbsp;&nbsp;&nbsp;<span style ="font-size:large">Shopping Cart</span></div>
                   
                </div>
                <div class="col-md-3 text-right">
                   <%-- <asp:Button ID="btnShop" Text="Proceed to Checkout" runat="server" CssClass="btn btn-info" />--%>
                </div>
            </div>
            <br />
            <br />
            
            <div class="row">
                <div class="col-md-12">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                  
                    <asp:GridView ID="cart_main_grid" DataKeyNames="cart_pro_Id" OnRowCommand="cart_main_grid_RowCommand" CssClass="table-responsive text-center" Width="100%" runat="server" AutoGenerateColumns="false" FooterStyle-ForeColor="White" FooterStyle-BackColor="#FF0066" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

                        <RowStyle BackColor="White" ForeColor="#330099"></RowStyle>

                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
                        <Columns>
                            <asp:TemplateField HeaderText="Product Image" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Image ID="image_main_grid" ImageUrl='<%# Eval("Image") %>' Width="30%" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="product_name" HeaderStyle-CssClass="text-center" ItemStyle-Width="20%" HeaderText="Product Name" SortExpression="product_name" />
                            <asp:BoundField DataField="product_price" HeaderStyle-CssClass="text-center" ItemStyle-Width="10%" HeaderText="Unit Price" SortExpression="unit_price" />
                            <asp:ButtonField CommandName="increase_quatity" HeaderStyle-CssClass="text-center" ItemStyle-Width="5%" ButtonType="Button" Text="-" ControlStyle-Width="20px" />
                            <asp:TemplateField HeaderText="Quantity" HeaderStyle-CssClass="text-center" ItemStyle-Width="10%">
                           
                                     <ItemTemplate>
                                         
                                    <asp:TextBox ID="quantity_main_grid" runat="server" Text='<%# Eval("quantity_main_grid") %>' Enabled="false" Width="50px"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField CommandName="decrease_quatity" ItemStyle-Width="5%" ButtonType="Button" Text="+" ControlStyle-Width="20px" />
                            <asp:TemplateField HeaderText="Sub Total" HeaderStyle-CssClass="text-center" ItemStyle-Width="20%">
                                <ItemTemplate>
                                    <asp:Label ID="sub_total_main_grid" Text='<%# Eval("sub_total_main_grid") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:ButtonField CommandName="delete" ButtonType="Button" Text="Delete" ControlStyle-CssClass="btn btn-danger text-center" HeaderText="Remove" />
                           
                        </Columns>
                        
                    </asp:GridView>
                          
                </div>
            </div>
            <br />
            <div class="row">
                <%--<div class="col-md-4">
                    <div class="panel" style="background-color:rgba(128, 128, 128, 0.22)">
                        <div class="panel-heading"><span class="glyphicon glyphicon-asterisk"></span><span style="font-size:large;color:#5610FA">&nbsp;&nbsp;&nbsp;&nbsp;DISCOUNT CODES</span></div>
                        <div class="panel-body">Enter your coupen code if you have one.
                            <br />
                            <br />
                            <asp:TextBox ID="TextBox2" CssClass="btn btn-lg" runat="server"></asp:TextBox>
                            <br />
                            
                            </div>
                            <div class="panel-footer">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Apply Coupen" />
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel" style="background-color:rgba(128, 128, 128, 0.22)">
                        <div class="panel-heading"><span class="glyphicon glyphicon-asterisk"></span><span style="font-size:large;color:#5610FA">&nbsp;&nbsp;&nbsp;&nbsp;ESTIMATE SHIPPING & TAX</span></div>
                        <div class="panel-body">Enter your destination to get a shipping estimate.
                            <br />
                            <br />
                            Country
                            <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server">
                                <asp:ListItem>India</asp:ListItem>
                                <asp:ListItem>United States</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            State/Province
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            Zip/Postal Code
                            <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="panel-footer">
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Get a Quote" />
                        </div>
                    </div>
                </div>--%>

                <div class="col-md-offset-8 col-md-4 text-right" >
                    <div class="panel" style="background-color:rgba(235, 109, 147, 0.21)">
                        <div class="panel-body">
                           
                            <br />
                           <span style="font-size:medium"> Shipping Charge </span>&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" Font-Size="Medium" CssClass="label label-success" runat="server" Text="Rs.0"></asp:Label><hr />
                           <span style="font-size:larger"> Grand Total </span>&nbsp;&nbsp;&nbsp; <asp:Label ID="Label4" Font-Size="Large" CssClass="label label-success" runat="server" Text="Rs.0"></asp:Label>

                            
                            </div>
                           <%-- <div class="panel-footer">
                            <asp:Button ID="Button3" runat="server" PostBackUrl="#checkout_fill" CssClass="btn btn-info" Text="Proceed to Checkout" />
                        </div>--%>
                    </div>
                </div>
                
            </div>

            <div class="row">

            </div>
        
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12" id="checkout_fill">
                    <cc1:Accordion ID="accordian_Menu" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent" SelectedIndex="0" FadeTransitions="true"
                        SuppressHeaderPostbacks="true" TransitionDuration="250" FramesPerSecond="40" RequireOpenedPane="false" runat="server">
                        <Panes>
                            <cc1:AccordionPane ID="bill_pane" runat="server">
                                <Header>Billing Information</Header>
                                <Content>
                                    <div class="col-md-12">
                                        <asp:GridView ID="grdAddr" CssClass="table table-responsive" OnRowCommand="grdAddr_RowCommand" runat="server" DataKeyNames="Id" AutoGenerateColumns="false" AllowSorting="True" AllowPaging="True">
                                            <Columns>
                                                <asp:ButtonField CommandName="select" Text="Select" ButtonType="Button" ControlStyle-CssClass="btn btn-danger" />
                                                <asp:BoundField HeaderText="Id" DataField="Id" Visible="false" />
                                                <asp:TemplateField HeaderText="Address1">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="literalAddr" runat="server" Text='<%# Eval("Address") %>'></asp:Literal>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Selected Address">
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="rbnAddrInside" runat="server" GroupName="rbnAddr" AutoPostBack="true" Checked="false" Enabled="false" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                            </Columns>
                                        </asp:GridView>
                                        <asp:LinkButton ID="add_new_addr" runat="server" CausesValidation="false" OnClick="add_new_addr_Click" Text="Add New Address"></asp:LinkButton>
                              <%--Address Modal--%>  
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
                                                  <td><span style="color:red">*</span>Name</td>
                                                  <td>
                                                      <asp:TextBox ID="txtNameEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtNameEditNew" runat="server" ForeColor="Red" ErrorMessage="Name Required"></asp:RequiredFieldValidator>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                               <tr>
                                                  <td><span style="color:red">*</span>Mobile</td>
                                                  <td>
                                                      <asp:TextBox ID="txtMobileEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtMobileEditNew" runat="server" ForeColor="Red" ErrorMessage="Mobile No. Required"></asp:RequiredFieldValidator>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                               <tr>
                                                  <td><span style="color:red">*</span>Email</td>
                                                  <td>
                                                      <asp:TextBox ID="txtEmailEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailEditNew" ForeColor="Red" ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td><span style="color:red">*</span>Address Line 1</td>
                                                  <td>
                                                      <asp:TextBox ID="txtAddr1EditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddr1EditNew" ForeColor="Red" ErrorMessage="Address Required" ></asp:RequiredFieldValidator>
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
                                                  <td><span style="color:red">*</span>City</td>
                                                  <td>
                                                      <asp:TextBox ID="txtCityEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtCityEditNew" ForeColor="Red" runat="server" ErrorMessage="City Required"></asp:RequiredFieldValidator>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td><span style="color:red">*</span>State</td>
                                                  <td>
                                                      <asp:TextBox ID="txtStateEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtStateEditNew" ForeColor="Red" runat="server" ErrorMessage="State Required"></asp:RequiredFieldValidator>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td><span style="color:red">*</span>Country</td>
                                                  <td>
                                                      <asp:TextBox ID="txtCountryEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtCountryEditNew" ForeColor="Red" runat="server" ErrorMessage="Country Required"></asp:RequiredFieldValidator>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td><span style="color:red">*</span>Pincode</td>
                                                  <td>
                                                      <asp:TextBox ID="txtPinEditNew" CssClass="input-sm" runat="server"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtPinEditNew" ForeColor="Red" runat="server" ErrorMessage="Pincode Required"></asp:RequiredFieldValidator>
                                                  </td>
                                                  <td>&nbsp;</td>
                                              </tr>
                                             
                                          </table>
                                      </div>
                                   </div>
                                          
          <div class="panel-footer">                      
           
 <!-- Label in the Panel to turn off the popup -->
              <asp:Button ID="btnSaveAddr" runat="server" CssClass="btn btn-success" CausesValidation="true" Text="Save" OnClick="btnSaveAddr_Click" />&nbsp;&nbsp;&nbsp;
              <asp:Button runat="server" CssClass="btn btn-warning" ID="btnCloseAddr" Text="Close"></asp:Button><asp:Label ID="lblAddrMsg" runat="server" CssClass="label label-danger"></asp:Label></div></asp:Panel>
                              <%--End of Address Region--%>
                                    </div>
                                </Content>
                            </cc1:AccordionPane>
                            <cc1:AccordionPane ID="ship_method" runat="server">
                                <Header>Shipping Method</Header>
                                <Content>
                                    <div class="panel">
                                        <%--<div class="panel-heading">Courier</div>--%>
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <asp:RadioButton ID="rbneconomy" runat="server" AutoPostBack="true" Checked="true" OnCheckedChanged="rbneconomy_CheckedChanged" Text="Economy Courier" GroupName="cori_method" />
                                                &nbsp;Rs.<asp:Label ID="lbleconomy" runat="server" Text="70"></asp:Label>&nbsp;Suitable for Books(Not packed in secret cover)
                                            </div>
                                            <div class="form-group">
                                                <asp:RadioButton ID="rbninPost" runat="server" Text="Indian Post" AutoPostBack="true" OnCheckedChanged="rbninPost_CheckedChanged" GroupName="cori_method" />
                                                &nbsp;Rs.<asp:Label ID="lblIndianPost" runat="server" Text="75"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </Content>
                            </cc1:AccordionPane>
                            <cc1:AccordionPane ID="pay_method_pane" runat="server">
                                <Header>Payment Method</Header>
                                <Content>
                                    <div class="panel">
                                       <div class="panel-body">
                                            <div class="form-group">
                                                <asp:RadioButton ID="rbnPauyumoney" AutoPostBack="true" OnCheckedChanged="rbnPauyumoney_CheckedChanged" runat="server" Text="All Indian Credit / Debit cards and Net banking" GroupName="pay_method" /><img src="images/payumoney.png" class="img-responsive" /><br />
                                                <asp:Label ID="lblPauymoney" runat="server" Visible="false"></asp:Label>
                                            </div>
                                           <div class="form-group">
                                                <asp:RadioButton ID="rbnBankTra" AutoPostBack="true" OnCheckedChanged="rbnBankTra_CheckedChanged" runat="server" Text="Bank Transfer Payment" GroupName="pay_method" /><br />
                                               <asp:TextBox ID="lblBanktra" runat="server" Visible="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:RadioButton ID="rbnChkDD" AutoPostBack="true" OnCheckedChanged="rbnChkDD_CheckedChanged" runat="server" Text="Check / DD" GroupName="pay_method" /><br />
                                                <asp:TextBox ID="lblChkDD" runat="server" Visible="false"></asp:TextBox>
                                            </div>
                                       </div>
                                    </div>
                                </Content>
                            </cc1:AccordionPane>
                            <cc1:AccordionPane ID="Order_rev_pane" runat="server">
                                <Header>Order Review</Header>
                                <Content>
                                    <div class="panel">
                                    <div class="panel-body">
                                        <asp:GridView ID="reviewGrid" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField HeaderText="Product Name" DataField="product_name" />
                                                <asp:BoundField HeaderText="Price" DataField="product_price" />
                                                <asp:BoundField HeaderText="Quantity" DataField="quantity_main_grid" />
                                                <asp:BoundField HeaderText="Sub Total" DataField="sub_total_main_grid" />
                                            </Columns>
                                        </asp:GridView>
                                       
                                        <div class="text-right col-md-offset-8 col-md-4" style="background-color:#f6b2c6">
                                            Sub Total : <span style="font-size:larger">Rs.</span><asp:Label ID="lblSubReview" runat="server" Font-Size="Larger"></asp:Label><hr />
                                            You will earn : <asp:Label ID="lblyouWill" runat="server" Font-Size="Larger"></asp:Label> points<hr />
                                            Shipping Charge : Rs.<asp:Label ID="lblShippingCharge" Text="0" runat="server" Font-Size="Larger"></asp:Label><hr />
                                            Grand Total : <span style="font-size:larger">Rs.</span><asp:Label ID="lblGrandRevview" runat="server" Font-Size="Larger"></asp:Label>

                                        </div>
                                            
                                    </div>
                                        <div class="panel-footer">
                                           
                                        </div>
                                        </div>
                                </Content>
                            </cc1:AccordionPane>
                        </Panes>

                    </cc1:Accordion>

                </div>
            </div>
        </div>
         </ContentTemplate>
                    </asp:UpdatePanel>
        <br />
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-right">
                     <input type="hidden" runat="server" id="key" name="key" />
                                            <input type="hidden" runat="server" id="hash" name="hash"  />
                                            <input type="hidden" runat="server" id="txnid" name="txnid" />
                                            <input type="hidden" runat="server" id="enforce_paymethod" name="enforce_paymethod" />
                                            <asp:Button ID="btnFinalSubmit" CausesValidation="false" OnClick="btnFinalSubmit_Click" runat="server" Text="Place Order" CssClass="btn btn-success" /><asp:Label ID="lblMsg" runat="server" CssClass="label label-danger"></asp:Label>
                </div>
            </div>
        </div>
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
            <div style="height:10px;background-color:#5610FA"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <br />
                        <div class="well"><span style="color:#5610FA;font-size:large">Information</span> </div>
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
                        <div class="well"><span style="color:#5610FA;font-size:large">Why Buy From Us</span> </div>
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
                        <div class="well"><span style="color:#5610FA;font-size:large">My Account</span> </div>
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
     <script>
         $(function () {
             $("#header").load("header1.aspx");
             $("#footer").load("footer1.aspx");
         });
    </script>
</body>
</html>
