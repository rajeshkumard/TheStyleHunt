<%@ Page Language="C#" AutoEventWireup="true" CodeFile="termsofuse.aspx.cs" Inherits="_Default" %>

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
                    <a class="navbar-brand" style="font-size: small; color: white">Customer Care :9600402445</a>
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
                                    <h4><span class="label label-warning"> Mobile : 9600402445</span></h4>

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
                        <span style="font-size:x-large">Terms & Conditions</span>
                       </div>
                        <div class="panel-body">
                                 
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">Overview:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">The following rules and regulations apply to all visitors to or users of the Srijothedam Web Site, the home page of which is at<span class="Apple-converted-space">&nbsp;</span><a href="http://www.srijothedam.in/" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">www.srijothedam.in<span class="Apple-converted-space">&nbsp;</span></strong></span></a>. By using this Web site, you agree to be bound by any rules and regulations, as they may be modified by Srijothedam at any time and posted on any webpage of this Web site. In the event of a violation of these rules and regulations, Srijothedam reserves the right to seek all remedies available by law and in equity.</span></p>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">Limited License:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">Srijothedam Web Site and all of its materials, including, but not limited to, its software or HTML code, scripts, text, artwork, photographs, and images (collectively, &quot;Materials&quot; ) are protected by copyright laws and other Indian and international laws and treaties. All Materials are provided by Srijothedam as a service to its current and prospective customers and may be used only for personal informational and product ordering purposes and only if you also retain all copyright and other proprietary notices contained on the Materials. No right, title or interest in our Materials is conveyed to you This is a limited license, not a transfer of title to our Materials, and such license is subject to the following restrictions: (a) you may not copy, reproduce, publish, transmit, distribute, perform, display, post, modify, create derivative works from, sell, license or otherwise exploit this site or 
                                any of its Materials without our prior written permission; (b) you may not access or use the Srijothedam Web Site for any competitive or commercial purpose; and (c) you will not permit any copying of our Materials. Any unauthorized copying, alteration, distribution, transmission, performance, display, or other use of these Materials is prohibited. Srijothedam may revoke this limited license at any time for any or no reason. All rights not expressly granted are reserved by Srijothedam.</span></p>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">Linking:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">Periodically, links may be established from this Web Site to one or more external web sites or resources operated by third parties (the &quot;Third Party Sites&quot;). These links are provided for your convenience only. In addition, certain Third Party Sites also may provide links to the Srijothedam Web Site. None of such links should be deemed to imply that Srijothedam endorses the Third Party Sites or any content therein.</span></p>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">Srijothedam does not control and is not responsible or liable for any Third Party Sites or any content, advertising, products, or other materials on or available from such Third Party Sites. Access to any Third Party Sites is at your own risk and Srijothedam will have no liability arising out of or related to such web sites and/or their content or for any damages or loss caused or alleged to be caused by or in connection with any purchase, use of or reliance on any such content, goods, or services available on or through any such Third Party Site.</span></p>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">Disclaimer of Warranty:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">Access to Srijothedam Web Site is provided to our customers and prospective customers &quot;AS IS&quot; and &quot;AS AVAILABLE&quot; and without warranty of any kind, whether express or implied, INCLUDING BUT NOT LIMITED TO, THOSE OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE OR NONINFRINGEMENT. Some jurisdictions do not allow the disclaimer of implied warranties. In such jurisdictions, the foregoing disclaimer may not apply to you. Srijothedam reserves the right to block or deny access to the Web Site to anyone at any time for any reason.</span></p>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">Your Communications:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">When you visit the Site or send e-mails to us, you are communicating with us electronically. You consent to receive communications from us electronically. We will communicate with you by e-mail or by posting notices on the Site. You agree that all agreements, notices, disclosures and other communications that we provide to you electronically satisfy any legal requirement that such communications be in writing.</span></p>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">Srijothedam shall be free to use any ideas, concepts, know-how, or techniques contained in any communication you send to the Web Site for any purpose whatsoever including, but not limited to, developing, manufacturing and marketing products using such information. Any personally identifiable information you provide to Srijothedam through the Web Site or through e-mail shall be subject to the Web Site’s<span class="Apple-converted-space">&nbsp;</span><a href="http://srijothedam.in/privacyPolicy.aspx" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">Privacy Policy</strong></span>.</a></span></p>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">Membership:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">Use of the Web Site is available only to persons who can form legally binding contracts under applicable law. Persons who are &quot;incompetent to contract&quot; within the meaning of the Indian Contract Act, 1872 including minors, un-discharged insolvents etc. are not eligible to use the Web Site. If you are a minor i.e. under the age of 18 years, you cannot register as a member of the Web Site and purchase any item visible on the Web Site. If you wish to purchase an item on the Web Site such purchase or sale may be made by your legal guardian or parents who have registered as users of the Web Site.</span></p>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">Any discounts extended to you as a user of this Web Site are liable to be changed or withdrawn by Srijothedam as and when deemed necessary, without any prior notice. Discounts may or may not be applicable to certain items or may be applicable in varying degrees to various items and the same may be modified without any prior notice by Srijothedam.</span></p>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">Ordering:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">When you place an order for one or more items/service from our website, you implicitly agree to the various terms and conditions and policies available on our website. These policies/terms can be accessed through the following links:</span></p>
                            <ul style="margin: 0px 0px 1em; padding: 0px 0px 0px 1.5em; list-style: disc outside; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;"><a href="http://srijothedam.in/shippingpolicy.aspx" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">Shipping Policy</strong></span></a></span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;"><a href="http://srijothedam.in/returnpolicy.aspx" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">Returns Policy</strong></span></a></span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;"><a href="http://srijothedam.in/termsofuse.aspx" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">Terms &amp; Conditions</strong></span></a></span></li>
                                <li style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;"><a href="http://srijothedam.in/privacyPolicy.aspx" style="margin: 0px; padding: 0px; color: rgb(132, 78, 28); text-decoration: underline;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);"><strong style="margin: 0px; padding: 0px; font-weight: bold;">Privacy Policy</strong></span></a></span></li>
                            </ul>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color: #df376a;">Limitation of Liability:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">IN NO EVENT Srijothedam WILL BE LIABLE TO ANY PARTY FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL OR PUNITIVE DAMAGES FOR USE OF THIS SITE OR ANY OTHER HYPERLINKED WEB SITES INCLUDING, WITHOUT LIMITATION, LOST PROFITS OR REVENUES, COSTS OF REPLACEMENT, BUSINESS INTERRUPTIONS, LOSS OF DATA OR DAMAGES RESULTING FROM USE OF OR RELIANCE ON THE INFORMATION PRESENT, EVEN IF Srijothedam IS EXPRESSLY ADVISED ABOUT THE POSSIBILITY OF SUCH DAMAGES. In some jurisdictions, limitations of liability are not permitted. In such jurisdictions, the foregoing limitations on liability may not apply to you.</span></p>
                            <h3 style="margin: 0px 0px 5px; padding: 0px; line-height: 1.35; color: rgb(132, 78, 28); font-size: 16px; font-weight: bold; font-family: 'Trebuchet MS'; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small; color:#df376a">Revisions:</span></h3>
                            <p style="margin: 0px 0px 1em; padding: 0px; color: rgb(47, 47, 47); font-family: 'Trebuchet MS'; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">
                                <span style="margin: 0px; padding: 0px; font-family: 'trebuchet ms', geneva; font-size: small;">Srijothedam&nbsp; may terminate, change, suspend or discontinue any aspect of this Web Site, including the availability of any features of the site or scheme at any time and without notice. Srijothedam also reserves the right, at its sole discretion, to change, modify, add or remove any portion of these terms in whole or in part, at any time and without notice. Srijothedam may terminate the authorization, rights and license given above at any time and without notice. Your continued use of this Web Site after any changes to these terms are posted will be considered acceptance of those changes.</span></p>
                                 
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
        Copyright © 2017, iDigit Technology. All rights reserved.
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
