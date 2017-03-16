<%@ Page  Title="ĐĂNG KÝ KHÁCH HÀNG" Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - SUCMANHCONG.COM</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/TVSStyle.css" rel="stylesheet" />

    <!-- BAT DAU PHAN MENU -->
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <script>
        $(function () {
            $(".dropdown").hover(
                    function () {
                        $('.dropdown-menu', this).stop(true, true).fadeIn("fast");
                        $(this).toggleClass('open');
                        $('b', this).toggleClass("caret caret-up");
                    },
                    function () {
                        $('.dropdown-menu', this).stop(true, true).fadeOut("fast");
                        $(this).toggleClass('open');
                        $('b', this).toggleClass("caret caret-up");
                    });
        });


    </script>
    <!-- KET THUC PHAN MENU -->
     <style type="text/css">
        body {
            /*background-image: url('/images/looping-bg.jpg');*/
        }
        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
            max-width:350px;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
           
        }
        .form-signin .form-control {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .input[type="text"],input[type="password"] {
          max-width: 350px  !important;
}
    </style>
     <link href="~/SMC.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="/css/styles.css" />
    <link rel="stylesheet" href="/css/font-awesome.min.css" />
  
    <script type="text/javascript">

        jQuery(document).ready(function ($) {
            var $filter = $('.nav_menu');
            var $filterSpacer = $('<div />', {
                "class": "vnkings-spacer",
                "height": $filter.outerHeight()
            });
            if ($filter.size()) {
                $(window).scroll(function () {
                    if (!$filter.hasClass('fix') && $(window).scrollTop() > $filter.offset().top) {
                        $filter.before($filterSpacer);
                        $filter.addClass("fix");
                    }
                    else if ($filter.hasClass('fix') && $(window).scrollTop() < $filterSpacer.offset().top) {
                        $filter.removeClass("fix");
                        $filterSpacer.remove();
                    }
                });
            }

        });

    </script>
     
    <script type="text/javascript" src="/js/dropdowncontent.js">
    </script>
     <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    
</head>
<body>
     <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="/">
                        <img src="../images/Logo.png" alt="SUCMANHCONG.COM" class="SMCLogo">
                    </a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">THÔNG TIN TÀI KHOẢN<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="MyProfile.aspx">Hồ sơ của tôi</a></li>
                                <li><a href="#">Đội nhóm</a></li>
                                <li><a href="javascript:vold(0)">Tài chính</a>
                                  <ul class="pull-right">
                                        <li><a href="#" onclick="show_tichluythang();">Tích luỹ tháng</a></li>

                                        <li><a href="#" onclick="show_tongsodu();">Tổng số dư</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Chia sẻ link</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">DOANH SỐ GIAO DỊCH<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Giao dịch trong tuần</a></li>
                                <li><a href="#">Giao dịch trong tháng</a></li>
                                <li><a href="#">Tất cả giao dich</a></li>
                                <li><a href="#" onclick="show_diemtichluy();">Điểm tích luỹ</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">HÀNG HÓA GIAO DỊCH<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Sản phẩm có thể mua</a></li>
                                <li><a href="#">Sản phẩm quảng cáo</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
      
       <div class="container">
        <br />
        <div class="row">
            <div class="col-md-4">
                <h3 style ="margin-top:0px;">Đăng ký thành viên</h3>
                <br />
                <p style="text-align: justify;">
                    SUCMANHCONG.COM hân hạnh chào đón bạn đến với cộng đồng của chúng tôi, nơi các bạn được hưởng những lợi ích từ những nhà cung cấp hàng đầu, uy tín và có trách nhiệm.
                                Nơi mà chính bạn góp phần tạo nên những giá trị cho bản thân và cộng đồng.
                                <br />
                    <br />
                    Để trở thành thành viên của chúng tôi, bạn vui lòng cung cấp đầy đủ và chính xác thông tin theo mẫu sau và gửi về cho chúng tôi, thông tin của bạn sẽ được chúng
                                tôi xét duyệt và trả lời bạn trong thời gian sớm nhất<br />
                    <br />
                </p>
                <p style="text-align: justify;">1. Cung cấp thông tin và gửi về SUCMANHCONG.COM</p>
                <br />
                <p style="text-align: justify;">2. SUCMANHCONG.COM xác thực thông tin và cấp thẻ khách hàng</p>
                <br />
                <p style="text-align: justify;">3. Khách hàng kích hoạt thẻ và sử dụng dịch vụ</p>
                <br />
                <p style="text-align: justify;">4. Sử dụng thẻ, nâng cấp thẻ</p>
            </div>
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">THÔNG TIN ĐĂNG KÝ
                        </h3>
                    </div>
                    <div class="panel-body">
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtName" runat="server" placeholder="Họ tên">
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtAddress" runat="server" placeholder="Địa chỉ">
                                </div>
                            </div>
                        </div>
                         <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="number" class="form-control" value="" id="txtPhone" runat="server" placeholder="Điện thoại">
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="date" class="form-control" id="txtBirthday" value="dd/mm/yyyy" runat="server" placeholder="Ngày sinh">
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="email" class="form-control" id="txtEmail"  runat="server" placeholder="Địa chỉ email">
                                </div>
                            </div>
                        </div>
                         <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtIdCard" runat="server" placeholder="Số CMND">
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12">
                                <asp:Label ID="lblMsg" Text = "-:-" runat="server" Style="height: 30px; line-height: 30px; width: 99%; font-size: 13px; font-family: Arial; color: red"></asp:Label>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12">
                                <asp:Button ID="btnRegister" CssClass="btn btn-primary" runat="server" Text="Gửi thông tin đăng ký" OnClick="btnRegister_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-default" runat="server" Text="Bỏ qua" OnClick="btnCancel_Click" />
                            </div>
                        </div>

                        <br />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
        
       <div class="MainFooter">
            <div class="container">
                <div class="col-md-2 MainFooterBottom1" style="margin-left: 0px; padding-left: 0px;">
                      <a class="navbar-brand" runat="server" href="Default.aspx">
                    <img src="../images/Logo.png" alt="SUCMANHCONG.COM" class="SMCLogo">
                          </a>
                </div>
                <div class="col-md-10" style="margin-left: 0px; padding-left: 160px;">
                        <% Response.Write(this.footer);  %>
                 
                </div>
            </div>
        </div>
    </form>
</body>
</html>
