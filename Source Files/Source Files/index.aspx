<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Style Hunt</title>
    <link rel="shortcut icon" type="image/x-icon" href="logo.png" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <style>
        .body {
            padding-top: 40px;
        }

        a:hover {
            cursor: pointer;
        }

        @-webkit-keyframes greenPulse {
            /*from {  -webkit-box-shadow: 0 0 20px #a11491; }
    50% { -webkit-box-shadow: 0 0 28px green; }
  to {  -webkit-box-shadow: 0 0 20px #591bb4; }*/
            from {
                box-shadow: 0 0 20px #00ffbb;
            }

            50% {
                box-shadow: 0 0 28px green;
            }

            to {
                box-shadow: 0 0 20px #20b392;
            }
        }

        .abc {
            /*-webkit-animation-name: example; /* Chrome, Safari, Opera */
            /*-webkit-animation-duration: 10s;*/ /* Chrome, Safari, Opera */
            /*animation-name: example;
    animation-duration: 10s;
    animation-iteration-count: infinite;*/
            -webkit-animation-name: greenPulse;
            -webkit-animation-duration: 2s;
            -webkit-animation-iteration-count: infinite;
        }
        /* Chrome, Safari, Opera */
        @-webkit-keyframes example {
            0% {
                border-color: red;
                left: 0px;
                top: 0px;
            }

            25% {
                border-color: yellow;
                left: 200px;
                top: 0px;
            }

            50% {
                border-color: blue;
                left: 200px;
                top: 200px;
            }

            75% {
                border-color: green;
                left: 0px;
                top: 200px;
            }

            100% {
                border-color: red;
                left: 0px;
                top: 0px;
            }
        }

        /* Standard syntax */
        @keyframes example {
            0% {
                border-color: red;
            }

            25% {
                border-color: yellow;
            }

            50% {
                border-color: blue;
            }

            75% {
                border-color: green;
            }

            100% {
                border-color: red;
            }
        }
    </style>

</head>


<body>
    <%--<body style="background-image: url('../Star-Logo.png'); background-repeat: repeat">--%>
    <form runat="server">
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
                    <a class="navbar-brand" style="font-size: small; color: white">Customer Care : 044-26154001,26158001,26155501</a>
                </div>
                <!--End of Navbar Header-->
                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="contactus.aspx" style="font-size: small; color: white">Contact Us</a></li>
                        <li><a href="testimonial.aspx" style="font-size: small; color: white">Testimonials</a></li>
                    </ul>
                    <div class="navbar-form navbar-left" style="font-size: small" role="search">
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

                        </div>
                    </div>

                </div>
                <!--End of Navbar Collapse-->
            </div>
            <!--End of Container-->
        </nav>
        <!--End of Top NavBar-->

        <!--Jumbatron-->
        <div class="container" style="margin-top: 0px; margin-bottom: -20px">
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron" style="background-color: transparent">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4 text-left">
                                    <img src="images/Logo.png" />
                                </div>
                                <div class="col-md-3 col-md-offset-2 col-md-2 text-center">
                                    <br />
                                    <asp:Menu ID="Menu1" runat="server" CssClass="abc img-rounded" Font-Bold="true" BackColor="#FFFBD6" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Small" ForeColor="#990000" StaticEnableDefaultPopOutImage="false" StaticSubMenuIndent="10px">
                                        <DynamicHoverStyle BackColor="#990000" ForeColor="White"></DynamicHoverStyle>

                                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px"></DynamicMenuItemStyle>

                                        <DynamicMenuStyle BackColor="#FFFBD6"></DynamicMenuStyle>

                                        <DynamicSelectedStyle BackColor="#FFCC66"></DynamicSelectedStyle>
                                        <%--  <Items>
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
                                    <span style="font-size: larger">
                                        <asp:LinkButton ID="lbtncart" CssClass="badge bg-info" Visible="true" runat="server" PostBackUrl="~/addcart.aspx"><span style="font-size: larger">My Cart</span>&nbsp;<asp:Label ID="lblCartQuan" CssClass="badge bg-danger" Text="0" runat="server"></asp:Label></asp:LinkButton></span>
                                </div>
                                <div class="col-md-4 text-right">

                                    <br />
                                    <br />

                                    <h4><span class="label label-success">Email : helpdesk@thestylehunt.in</span></h4>
                                    <h4><span class="label label-warning">Mobile : 9444069162</span></h4>

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
        <div class="container" style="margin-bottom: -20px; margin-top: 0px">

            <asp:Menu ID="headerMenu" runat="server" BackColor="#5610FA" DynamicHorizontalOffset="2" StaticEnableDefaultPopOutImage="false" OnMenuItemClick="headerMenu_MenuItemClick" Font-Names="Verdana" Font-Size="1.0em" ForeColor="White" StaticSubMenuIndent="10px" Orientation="Horizontal" StaticMenuItemStyle-BorderStyle="Solid" StaticMenuStyle-BorderStyle="None" StaticHoverStyle-BorderStyle="None">
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
        <br />

        <!--Well-->
        <div class="container" style="margin-top: -15px; margin-bottom: 0px">
            <div class="row">
                <div class="col-md-12">
                    <div class="well">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-offset-8 col-md-4">
                                    <span style="color: #ff6a00; font-size: medium">Follow Us : </span>
                                    <a href="#" class="fa fa-facebook-square fa-lg"></a>
                                    <a href="#" style="color: skyblue" class="fa fa-twitter-square fa-lg"></a>
                                    <a href="#" style="color: red" class="fa fa-google-plus-square fa-lg"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Well-->
        <br />
        <!--Body-->
        <div class="container">
            <%-- <div class="row">--%>
            <div class="col-md-3">
                <div class="row">
                    <div style="color: white; background-color: #5610FA">
                        &nbsp;&nbsp;&nbsp;    <span class="">
                        <%--    <img src="images/om.png" />&nbsp;&nbsp;</span>--%>
                        <span style="font-size: large"> Top Searches</span>
                    </div>
                    <br />
                    <asp:DataList ID="dataTopSearches" runat="server" BackColor="#82B4E6" Font-Size="Small" Font-Underline="false" CssClass="table table-hover" RepeatColumns="1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnTopSearches" ForeColor="Black" CommandArgument='<%#Eval("product_id") %>' OnCommand="lbtnTopSearches_Command" Text='<%#Eval("product_name") %>' runat="server"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:DataList>
                    <%--  <table style="width: 100%;" class="table table-hover">
                            <tr>
                                <td>Chakra</td>
                            </tr>
                            <tr>
                                <td>Ganesha</td>
                            </tr>
                            <tr>
                                <td>Mala</td>
                            </tr>
                            <tr>
                                <td>Music</td>
                            </tr>
                            <tr>
                                <td>Parad Mala</td>
                            </tr>
                            <tr>    
                                <td>Shivling</td>
                            </tr>
                            <tr>
                                <td>Siddha Mala</td>
                            </tr>
                           
                            <tr>
                                <td>Siva</td>
                            </tr>
                        </table>--%>
                </div>
                <div class="row">

                    <img src="images/paypal_seal.jpg" class="img-responsive" />
                </div>
            </div>

            <div class="col-md-9" style="margin-left: 4px; margin-right: -8px">
                <div class="row">
                    <div class="carousel slide" id="screenshot-carousel" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#screenshot-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#screenshot-carousel" data-slide-to="1"></li>
                            <li data-target="#screenshot-carousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="images/productphotos/1009_1.jpg" alt="Text of the image" />
                            </div>
                            <div class="item">
                                <img src="images/productphotos/1010_1.jpg" alt="Text of the image" />
                            </div>
                            <div class="item">
                                <img src="images/productphotos/10021_1.jpg" alt="Text of the image" />
                            </div>

                        </div>
                        <!-- End Carousel inner -->
                        <a href="#screenshot-carousel" class="left carousel-control" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a href="#screenshot-carousel" class="right carousel-control" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
    <%--            <br />

                <div class="row">
                    <div style="color: white; background-color: #5610FA">
                        &nbsp;&nbsp;&nbsp;<span style="font-size: large"> Fashion</span>

                    </div>

                    <br />
                    <div class="panel">
                        <div class="panel-body">
                            <asp:DataList ID="dataList1" runat="server" OnItemDataBound="dataList1_ItemDataBound" OnItemCommand="dataList1_ItemCommand" RepeatDirection="Horizontal" RepeatColumns="3" GridLines="Both" ItemStyle-BorderColor="OrangeRed" ItemStyle-BorderStyle="Groove" ItemStyle-BorderWidth="5px" CellSpacing="-1">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <br />
                                        <asp:Image ID="imgYantra" runat="server" Width="150" Height="150" /><br />
                                        <asp:HiddenField ID="hidProId" Value='<%#Eval("product_id") %>' runat="server" />
                                        <asp:LinkButton ID="lbtnProName" CommandArgument='<%#Eval("product_id") %>' OnCommand="lbtnProName_Command" runat="server" Text='<%# Eval("product_name") %>' Width="273px"></asp:LinkButton><br />
                                        Rs.<asp:Label ID="lblprice" runat="server" Text='<%# Eval("product_price") %>'></asp:Label><br />
                                        <asp:Button ID="btnAddCart1" runat="server" CommandName="addCart" Text="Add to Cart" CssClass="btn btn-danger" />
                                        <br />
                                        <br />
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>--%>

                <%--<div class="row">
                     <div style="color:white;background-color:#5610FA">
                   &nbsp;&nbsp;&nbsp;<span style ="font-size:large"> Malas</span>

                     </div>

                    <br />
                  <div class="panel">
                        <div class="panel-body">
                            <asp:DataList ID="dataList2" runat="server" OnItemCommand="dataList2_ItemCommand" OnItemDataBound="dataList2_ItemDataBound" RepeatDirection="Horizontal" RepeatColumns="3" GridLines="Both" CellSpacing="-1" ItemStyle-BorderColor="SandyBrown" ItemStyle-BorderStyle="Groove" ItemStyle-BorderWidth="5px">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <br />
                                        <asp:Image ID="imgMalas" runat="server" Width="150" Height="150" /><br />
                                        <asp:HiddenField ID="hidProId1" Value='<%#Eval("product_id") %>' runat="server" />
                                        <asp:LinkButton ID="lbtnProName1" runat="server" CommandArgument='<%#Eval("product_id") %>' OnCommand="lbtnProName1_Command" Text='<%# Eval("product_name") %>' Width="273px"></asp:LinkButton><br />
                                        Rs.<asp:Label ID="lblprice1" runat="server" Text='<%# Eval("product_price") %>'></asp:Label><br />
                                        <asp:Button ID="btnAddCart2" runat="server" CommandName="addCart" Text="Add to Cart" CssClass="btn btn-danger" />
                                        <br />
                                        <br />
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>--%>
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
        <footer style="background-color: white">
            <div style="height: 10px; background-color: #5610FA"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <br />
                        <div class="well"><span style="color: #5610FA; font-size: large">Information</span> </div>
                        <br />
                        <br />
                        <div class="panel" style="font-size: medium; color: black">
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;About Us</div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a href="privacyPolicy.aspx" style="color: black">Privacy Policy</a></div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a href="shippingpolicy.aspx" style="color: black">Shipping Policy</a></div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a href="returnpolicy.aspx" style="color: black">Return Policy</a></div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a href="termsofuse.aspx" style="color: black">Terms & Conditions</a></div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon-alert gly-spin"></span>&nbsp;&nbsp;<a style="color: black" href="contactus.aspx">Contact Us</a></div>
                            <br />
                        </div>
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="well"><span style="color: #5610FA; font-size: large">Why Buy From Us</span> </div>
                        <br />
                        <br />
                        <div class="panel" style="font-size: medium; color: black">
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Shipping Policy</div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Terms of Use</div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Payment Options</div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Return Policy</div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-th-large gly-spin"></span>&nbsp;&nbsp;Reward Points</div>
                            <br />
                        </div>
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="well"><span style="color: #5610FA; font-size: large">My Account</span> </div>
                        <br />
                        <br />
                        <div class="panel" style="font-size: medium; color: black">
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;<a style="color: black" href="reg_form.aspx">Sign In</a></div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;<a style="color: black" href="addcart.aspx">View Cart</a></div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;<a style="color: black" href="trackorder.aspx">Track Your Order</a></div>
                            <br />
                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty gly-spin"></span>&nbsp;&nbsp;Help / FAQ</div>
                            <br />
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
    <!-- ClickDesk Live Chat Service for websites -->
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
        (function () {
            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = 'https://embed.tawk.to/562736366071ea8e77d5e8fe/default';
            s1.charset = 'UTF-8';
            s1.setAttribute('crossorigin', '*');
            s0.parentNode.insertBefore(s1, s0);
        })();
    </script>
    <!--End of Tawk.to Script-->
    <!-- End of ClickDesk -->
</body>
</html>
