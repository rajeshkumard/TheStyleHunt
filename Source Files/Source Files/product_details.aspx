<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product_details.aspx.cs" Inherits="_Default" %>

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

        #myImg {
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

            #myImg:hover {
                opacity: 0.7;
            }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
        }

        /* Modal Content (image) */
        .modal-content {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
        }

        /* Caption of Modal Image */
        #caption {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
            text-align: center;
            color: #ccc;
            padding: 10px 0;
            height: 150px;
        }

        /* Add Animation */
        .modal-content, #caption {
            -webkit-animation-name: zoom;
            -webkit-animation-duration: 0.6s;
            animation-name: zoom;
            animation-duration: 0.6s;
        }

        @-webkit-keyframes zoom {
            from {
                -webkit-transform: scale(0);
            }

            to {
                -webkit-transform: scale(1);
            }
        }

        @keyframes zoom {
            from {
                transform: scale(0);
            }

            to {
                transform: scale(1);
            }
        }

        /* The Close Button */
        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }

        /* 100% Image Width on Smaller Screens */
        @media only screen and (max-width: 700px) {
            .modal-content {
                width: 100%;
            }
        }
    </style>

</head>
    <script>
        // Get the modal
        function myFunction() {
            debugger;
            var modal = document.getElementById('myModal1');

            // Get the image and insert it inside the modal - use its "alt" text as a caption
            var img = document.getElementById('imgProduct');
            var modalImg = document.getElementById("img01");
            var captionText = document.getElementById("caption");

            modal.style.display = "block";
            modalImg.src = img.src;
            captionText.innerHTML = img.alt;
            return false;             
        }
       
        function MyFunctionClose() {
            debugger;
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks on <span> (x), close the modal
            modal.style.display = "none";
            return false;
        }

        // Get the <span> element that closes the modal
        
</script>
<body style="background-image: url('../images/bgpattern.PNG'); background-repeat: repeat">
    <div id="myModal1" class="modal">
        <span class="close">&times;</span>
        <img class="modal-content" id="img01">
    </div>
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


                <div class="col-md-9">

                    <div class="panel">
                        <%-- <div class="panel-heading"><span class="glyphicon glyphicon-apple"></span><span style="color: #ff6a00"><b>ADDRESS BOOK</b></span></div>--%>
                        <div class="panel-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-3">
                                        <%--<asp:Image id="imgProduct" CssClass="img-responsive" runat="server" />--%>
                                        <asp:ImageButton ID="imgProduct" CssClass="img-responsive" runat="server"/>
                                        <%--<asp:ImageButton ID="imgProduct" CssClass="img-responsive" runat="server"  OnClientClick="myFunction()"/>--%>
                                        <%--<asp:ImageButton ID="imgProduct" CssClass="img-responsive" runat="server" OnClick="imgProduct_Click" />--%>
                                    </div>
                                    <div class="col-md-9">
                                        <asp:Label ID="lblProductName" Width="500px" runat="server" Text="" Font-Size="Large"></asp:Label>
                                        <br />
                                        <br />
                                        <span style="font-size: smaller">Availability : </span>
                                        <asp:Label ID="lblAvailability" runat="server" Text="" Font-Size="Smaller"></asp:Label>
                                        <br />
                                        <span style="font-size: medium; color: #DD0058"><b>Rs.</b></span><asp:Label ID="lblPrice" runat="server" Text="" Font-Size="Medium" Font-Bold="True" ForeColor="#DD0058"></asp:Label>
                                        <br />
                                        <span style="font-size: small">Price in Points : </span>
                                        <asp:Label ID="lblPriceinPoints" runat="server" Text="" Font-Size="Small"></asp:Label>
                                        <br />
                                        <span style="font-size: small">Points Earned : </span>
                                        <asp:Label ID="lblPointsEarned" runat="server" Text="" Font-Size="Small"></asp:Label>
                                        <br />
                                        Qty :
                                        <asp:TextBox ID="txtQuantity" Width="30px" Text="1" runat="server"></asp:TextBox>
                                        &nbsp;&nbsp;<asp:Button ID="btnAddCart" runat="server" CssClass="btn btn-info" Text="Add to Cart" OnClick="btnAddCart_Click" />
                                        <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" CssClass="btn btn-success" OnClick="btnBuyNow_Click" />
                                        <br />
                                        <br />
                                        <span style="font-size: large" class="page-header"><b>Quick Overview</b></span>
                                        <br />
                                        <br />
                                        <div style="width: 400px; height: 200px">
                                            <asp:Literal runat="server" ID="txtareaOverview"></asp:Literal>
                                        </div>
                                    </div>
                                    <div id="divBackground" class="modal">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="page-header"><span style="font-size: medium"><b>Details</b></span></div>
                                        <div style="width: 700px; height: auto">
                                            <asp:Literal runat="server" ID="txtAreaDetails"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:HiddenField ID="hidforOrderDet" runat="server" />
                    <cc1:ModalPopupExtender ID="mdlPopImageShow" TargetControlID="hidforOrderDet" runat="server" CancelControlID="btnOrderClose" DropShadow="true" PopupControlID="pnlOrderDet"></cc1:ModalPopupExtender>
                    <asp:Panel ID="pnlOrderDet" runat="server" CssClass="panel" Width="500 px" Height="400px" ScrollBars="Both" BorderStyle="Solid" BorderWidth="2px">
                        <div class="panel-heading">
                            <asp:Label ID="lblheader" CssClass="label label-primary" runat="server"></asp:Label>
                        </div>
                        <div class="panel-body">
                            <asp:Image ID="zoomImage" CssClass="img-rounded" runat="server" />
                        </div>
                        <div class="panel-footer">

                            <asp:Button ID="btnOrderClose" Text="Close" CssClass="btn btn-danger" runat="server" />
                        </div>
                    </asp:Panel>
                    <br />




                </div>

                <div class="col-md-3">
                    <div class="panel">
                        <div class="panel-heading" style="background-color: rgba(255, 216, 0, 0.32)">Follow Us</div>

                        <div class="panel-body" style="background-color: rgba(255, 216, 0, 0.32)">
                            <a href="#" class="fa fa-facebook-square fa-3x"></a>
                            <a href="#" style="color: skyblue" class="fa fa-twitter-square fa-3x"></a>
                            <a href="#" style="color: red" class="fa fa-google-plus-square fa-3x"></a>
                        </div>
                    </div>

                    <img src="images/satisfaction-guarantee.png" class="img-rounded img-responsive" />
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
        <footer style="background-color: white">
            <div style="height: 10px; background-color: #df376a"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <br />
                        <div class="well"><span style="color: #df376a; font-size: large">Information</span> </div>
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
                        <div class="well"><span style="color: #df376a; font-size: large">Why Buy From Us</span> </div>
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
                        <div class="well"><span style="color: #df376a; font-size: large">My Account</span> </div>
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
    <script src="js/docs.min.js"></script>
    <script>
        $(function () {
            $("#header").load("header1.aspx");
            $("#footer").load("footer1.aspx");
        });
    </script>

</body>
</html>
