<%@ Page Language="C#" AutoEventWireup="true" CodeFile="privacyPolicy.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Style Hunt</title>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/docs.min.css" rel="stylesheet" />
    <style>
        .body {
            padding-top: 40px;
        }

        a:hover {
            cursor: pointer;
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
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="row">


                <div class="col-md-12">

                    <div class="panel">
                       <%-- <div class="panel-heading"><span class="glyphicon glyphicon-apple"></span><span style="color: #ff6a00"><b>ADDRESS BOOK</b></span></div>--%>
                       <div class="panel-heading">
                        <span style="font-size:x-large">Privacy Policy</span>
                       </div>
                        <div class="panel-body">
                          
                           
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam.in is committed to respecting and protecting your personal privacy. Our Privacy Policy and your control over the information you provide us is outlined below.</span></p>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">INFORMATION COLLECTED FROM YOU OR YOUR COMPUTER</span></h3>
                            <ul style="margin: 0px 0px 1em; padding: 0px 0px 0px 1.5em; list-style: disc outside; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">You can visit our site and use many of our services without having to tell us who you are or reveal any personally identifiable information to us. It is only when you buy items from our site, make specific queries from us or leave reviews for items or articles on our website, through our website or through direct emails to any e-mail address, ending with @srijothedam.in , that you will be asked to provide us with personally identifiable information.</span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Whenever you visit Srijothedam, our web server logs automatically receive and record anonymous information from your web browser including your IP Address, Referring page, the <span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam </span>page(s) you request, and any search terms you query in our site.</span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam </span><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">uses this anonymous information to customize your experience on our site, maintain computer-specific shopping carts and to improve our services. We ordinarily do not attempt to link this information to a specific person, with certain important exceptions.</span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">By providing <span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam</span> with personally identifiable information, you agree to receive communication from our end, which may or may not be limited to the resolution of a query posed by you. Please take a look at the<span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; font-weight: bold;">INFORMATION REMOVAL OR UPDATION</strong><span class="Apple-converted-space">&nbsp;</span>section below for asking us to remove you from our mailing/services database.</span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam</span><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);"> uses personally identifiable information for three main purposes: to fulfill your orders for our products, to tell you about special offers and new products and services, and to send you articles of cultural interest. Regular sending of emails, (in the form of newsletters) will be limited to users who have signed up as members or have placed an order with us. Periodically , we will send sms&nbsp; and emails with festive offers , discount coupons or special schemes and offers to our loyal customers.</span></li>
                            </ul>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">INFORMATION REMOVAL OR UPDATION</span></h3>
                            <ul style="margin: 0px 0px 1em; padding: 0px 0px 0px 1.5em; list-style: disc outside; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Users, whose email/contact information are with us, may choose not to receive any future mailings/services from us by writing to<span class="Apple-converted-space">&nbsp;</span><a href="mailto:admin@srijothedam.in" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(0, 0, 0);"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">admin@srijothedam.in</strong></span></span></a>. By writing in to us you can:Users, whose email/contact information are with us, may choose to update their contact information with us by writing to<span class="Apple-converted-space">&nbsp;</span><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><a href="mailto:admin@srijothedam.in" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">admin@srijothedam.in</strong></span></a></span><span class="Apple-converted-space">&nbsp;</span>.</span><ul style="margin: 0.5em 0px; padding: 0px 0px 0px 1.5em; list-style: circle outside;">
                                    <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: 'trebuchet ms', geneva; font-size: small;">Request us to remove any personally identifiable information with us. This also implies that there cannot be any form of checking from our side to any future subscriptions to our services/mailings to contact addresses (physical or email) which points to you.</span></li>
                                    <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: 'trebuchet ms', geneva; font-size: small;">Request us to block any future mailings to your contact addresses (physical or email).</span></li>
                                    <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; color: rgb(128, 0, 0); font-family: 'trebuchet ms', geneva; font-size: small;"><span style="margin: 0px; padding: 0px; color: rgb(0, 0, 0);">Request us to remove them from our sms lists</span>.</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">PRIVACY OF INFORMATION</span></h3>
                            <ul style="margin: 0px 0px 1em; padding: 0px 0px 0px 1.5em; list-style: disc outside; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <li style="margin: 0px; padding: 0px;"><span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam</span><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);"> will not share personally identifiable information with other companies or individuals untill &amp; unless:Except as we&#39;ve just explained above, <span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam</span> will not sell or disclose your personally identifiable information to anyone.</span><ul style="margin: 0.5em 0px; padding: 0px 0px 0px 1.5em; list-style: circle outside;">
                                    <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">We have your express permission to share the information</span></li>
                                    <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">We need to share your information with any of our partner companies/individuals in order to provide a product or service that you have requested. Unless we tell you otherwise, these partners do not have the right to use your personal information we share with them beyond what is necessary to deliver your requested product or service.</span></li>
                                    <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">We comply with subpoenas or court orders</span></li>
                                    </ul>
                                </li>
                            </ul>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">INFORMATION SECURITY</span></h3>
                            <ul style="margin: 0px 0px 1em; padding: 0px 0px 0px 1.5em; list-style: disc outside; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <li style="margin: 0px; padding: 0px;"><span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam </span><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">has security measures in place to protect the loss, misuse and alteration of the information under our control.</span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam</span><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);"> and its partner electronic payment gateway collects all financial information required for Billing in a 256 bit<span class="Apple-converted-space">&nbsp;</span><strong style="margin: 0px; padding: 0px; font-weight: bold;">SSL Secure Environment</strong>.</span></li>
                            </ul>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">PRIVACY POLICY MODIFICATIONS</span></h3>
                            <ul style="margin: 0px 0px 1em; padding: 0px 0px 0px 1.5em; list-style: disc outside; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <li style="margin: 0px; padding: 0px;"><span style="font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">Srijothedam</span><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);"> may modify its privacy policy from time to time. The responsibility of updating your knowledge about the same rests with you and the same can be done by visiting this page at regular intervals.</span></li>
                            </ul>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">SRIJOTHEDAM CONTACT INFORMATION REGARDING CONCERNS</span></h3>
                            <ul style="margin: 0px 0px 1em; padding: 0px 0px 0px 1.5em; list-style: disc outside; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">To request for unsubscription OR removal from our customer database:<span class="Apple-converted-space">&nbsp;</span><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><a href="mailto:admin@srijothedam.in" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">admin@srijothedam.in</strong></span></a></span></span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">To request for modification or updation of customer information:<span class="Apple-converted-space">&nbsp;</span><a href="mailto:admin@srijothedam.in" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(0, 0, 0);"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">admin@srijothedam.in</strong></span></span></a></span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: rgb(0, 0, 0);">To request for clarifications on our privacy policy:<span class="Apple-converted-space">&nbsp;</span><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><a href="mailto:admin@srijothedam.in" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">admin@srijothedam.in</strong></span></a></span></span></li>
                            </ul>
                          
                           
                        </div>
                    </div>

                    <br />




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
                            <span style="font-size: large">Sampurn 12 Jyotirlinga Chowki with Shiva idol</span>
                            <span style="font-size: medium">
                                <br />
                                Rs.2,100 </span>
                            <br />
                            Price in Points : 2100
                    <br />
                            Points Earned : 210

                    
                    <blockquote>
                        <header>Quick Overview</header>
                        <p style="font-size: small">
                            Lord Shiva is considered most superior among all gods. One can attain anything by worshiping Lord Shiva. By worshiping Lord Shiva on the auspicious occasion of Shivratri all beneficial results can be obtained. If for any reason it is not possible for you to do Darshana of 12 Jyotirlingas then 12 Jyotirlinga Chowki can be established at your place of worship to achieve auspicious objectives like salvation and blessings of Lord Shiva. This is very powerful yantra chowki for worshipping Lord Shiva. It has images of the 12 Jyotirlingas. In the center sits a brass idol of Lord Shiva surrounded by panchakshri mantra "Om Namah Shivaye" and 4 tridents at the borders.
                        </p>
                    </blockquote>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
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
