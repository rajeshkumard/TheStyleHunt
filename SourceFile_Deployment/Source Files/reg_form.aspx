<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reg_form.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Style Hunt</title>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
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
<%-- <script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
      appId: '733080083503463',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.5' // use graph api version 2.5
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
  (function (d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) { return; }
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    //FB.api('/me', function(response) {
    //  console.log('Successful login for: ' + response.name);
    //  document.getElementById('status').innerHTML =
    //    'Thanks for logging in, ' + response.email + '!';
    //});
    FB.api('/me', function (response) {
        console.log(JSON.stringify(response));
        document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + JSON.stringify(response) + '!';
    });
    FB.login(function (response) {
        console.log(response);
    }, { scope: 'user_about_me' });
  }
</script>--%>
    <div id="fb-root"></div>
<script src="http://connect.facebook.net/en_US/all.js"></script>
<script>
    FB.init({
        appId: '733080083503463', status: true,
		cookie: true, xfbml: true, oauth: true
	});
</script>
    <form runat="server">
        <!--Navbar-->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
       
            <!--Well-->
        <div class="container" style="margin-top: 5px; margin-bottom: 0px">
            <div class="row">
                <div class="col-md-12">
                    <div class="well">
                        <div class="container">
                            <div class="row">
                             <h4>&nbsp;&nbsp;&nbsp;Login or Create an Account</h4>
                            </div>
                        </div>
                    </div>
               </div>
                </div>
            </div>
        <!--End of Well-->
       
         <!--Body-->
        <div class="container" style="margin-top:5px">
           <%-- <div class="row">--%>
               
                    
                <div class="col-md-5">
                     <div class="row">
                  <div class="panel">
                      <div class="panel-heading">
                      Login</div>
                      <div class="panel-body">
                          <table style="width: 100%;" class="table table-responsive">
                              <tr>
                                  <td>
                                      <asp:Label ID="Label1"  runat="server" Text="User Name"></asp:Label></td>
                                  <td>
                                      <asp:TextBox ID="txtUName" CssClass="form-control" runat="server"></asp:TextBox></td>
                                  
                              </tr>
                              <tr>
                                  <td>
                                      <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                  </td>
                                 
                              </tr>
                              <tr>
                                  <td>
                                      &nbsp;</td>
                                  <td>
                                      <asp:LinkButton ID="lbtnForgetPassword" runat="server" Text="Forget Passowrd?" OnClick="lbtnForgetPassword_Click" CausesValidation="false" ></asp:LinkButton>
                                  </td>
                                 
                              </tr>
                          </table>
                      </div>
                      <div class="panel-footer">
                          <asp:Button ID="btnLogin" CssClass="btn btn-primary" CausesValidation="false" runat="server" Text="Login" OnClick="btnLogin_Click" />
                          &nbsp;&nbsp;<%--<fb:login-button scope="public_profile,email,user_about_me" onlogin="checkLoginState();"></fb:login-button>--%>
                          <fb:login-button scope="email" onlogin="window.location.href='/reg_form.aspx?dest=<%= Server.UrlEncode(Request.Url.PathAndQuery) %>';">Login with Facebook</fb:login-button>

                           <asp:Label ID="lblLoginMsg" CssClass="label label-warning" runat="server" Text=""></asp:Label>
                  
                      </div>
                      <div id="status"></div>
                      <asp:Panel ID="pnlFaceBookUser" runat="server" Visible="true">
<hr />
<!--<table class="table table-responsive">
    <tr>
        <td rowspan="5" valign="top">
            <asp:Image ID="ProfileImage" runat="server" Width="50" Height="50" />
        </td>
    </tr>
    <tr>
        <td>ID:<asp:Label ID="lblId" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>UserName:<asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>Name:<asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>Email:<asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
    </tr>
</table>-->
</asp:Panel>
                  </div>

                   </div>
                </div>
             <div class="col-md-7"  style="margin-left:5px;margin-right:-10px">

                    <div class="row">
                  <div class="panel">
                      <div class="panel-heading">
                      New Customer</div>
                      <div class="panel-body">
                          <table style="width: 100%;" class="table table-responsive">
                              <tr>
                                  <td>First Name</td>
                                  <td>
                                      <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="label label-warning" ControlToValidate="txtFName" runat="server" ErrorMessage="Enter your Name"></asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td>Last Name</td>
                                  <td>
                                      <asp:TextBox ID="txtLName" CssClass="form-control" runat="server"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td>Email</td>
                                  <td>
                                      <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                                      <asp:RequiredFieldValidator CssClass="label label-warning" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail" ErrorMessage="Email is Required. It will be your username"></asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td>Password</td>
                                  <td>
                                      <asp:TextBox ID="txtPass_reg" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="label label-warning" ControlToValidate="txtPass_reg" runat="server" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
                                  </td>
                              </tr>
                              <tr>
                                  <td>Confirm Password</td>
                                  <td>
                                      <asp:TextBox ID="txtConPass_reg" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td>&nbsp;</td>
                                  <td>
                                      <asp:Label ID="lblRegMsg" CssClass="label label-warning" runat="server" Text=""></asp:Label>
                                  </td>
                              </tr>
                          </table>
                      </div>
                      <div class="panel-footer">
                         
                          <asp:Button ID="btnReg" CssClass="btn btn-success" runat="server" Text="Register" OnClick="btnReg_Click" />

                         
                      </div>
                  </div>

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
        Copyright © 2017, iDigit Technology. All rights reserved.
        </footer>
        <!--End of Body-->
    </form>

    <script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script>
         $(function () {
             $("#header").load("header1.aspx");
             $("#footer").load("footer.html");
         });
    </script>
</body>
</html>
