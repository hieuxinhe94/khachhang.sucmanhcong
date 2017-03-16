<%@ Page Title="TÀI KHOẢN" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Customer_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .btn-left-select {
            border: none;
            background-color: #367fa9;
        }
    </style>
    <script>
        function btnTichLuyThang_Click() {
            alert('Số tiền tích lũy : <% Response.Write(this.tichluythang); %> Vnđ ');
        }

    </script>
    <div class="container">
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-2">
              
             
            </div>
            <div id="div_col_mobile_user"   class="col-md-8">
                <div class="row">
                    <div class="panel panel-success">
                        <!-- Default panel contents -->
                        <div class="panel-heading">Hồ sơ của tôi</div>
                        <div class="panel-body">

                            <div  id="div-col-profile" class="col-md-12" style="float: left">
                                <div class="col-md-4" style="margin-left:0%; border-radius:2px;">
                                <div id="MainContent_lblImg1" style="width: auto; float: left;">
                                    <asp:Label ID="lblImg1" runat="server" Style="width: auto; height: 100%; overflow: hidden" Text=""></asp:Label>
                                </div> 
                                </div>
                                  <div id="div-content-profile" class="col-md-8"> 
                             <p><span id="span_text_card" style="width:100%;"></span>  <% Response.Write(strCard); %></p>
                            <p><span  id="span_text_card" style="width:100px;"> Mã Thẻ :</span><% Response.Write(strIdCard); %></p>
                            <p id="span_text_card">Ngày kích hoạt :  <% Response.Write(strDaycreate); %></p>
                                    <% if(strCard == "Thẻ Đồng"){ %>   ★<%} %>
                                    <% if(strCard == "Thẻ Bạc"){ %>   ★★<%} %>
                                    <% if(strCard == "Thẻ Vàng"){ %>   ★★★<%} %>

                           </div>
                         
                       </div></div>
                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item" style="text-align:left; "><label  for="inputEmail3" class="col-sm-3 control-label lbl" >Tên tài khoản : </label> <% Response.Write(strName); %></li>
                            <li class="list-group-item" style="text-align:left"> <label for="inputEmail3" class="col-sm-3 control-label lbl">Địa chỉ : </label> <% Response.Write(strAddress); %></li>
                            <li class="list-group-item" style="text-align:left"> <label for="inputEmail3" class="col-sm-3 control-label lbl" >Điện Thoại : </label> <% Response.Write(strPhone); %></li>
                            <li class="list-group-item" style="text-align:left"> <label for="inputEmail3" class="col-sm-3 control-label lbl"  >Ngày sinh : </label> <% Response.Write(strBirthday); %></li>
                            <li class="list-group-item" style="text-align:left"> <label for="inputEmail3" class="col-sm-3 control-label lbl" >Số CMND : </label> <% Response.Write(strCMND); %></li>
                            <li class="list-group-item" style="text-align:left"> <label for="inputEmail3" class="col-sm-3 control-label lbl"  >Email : </label> <% Response.Write(strEmail); %></li>
                        </ul>
                    </div>
                </div>

                <div class="row">
                    <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text=" Cần Cập nhật thông tin" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <style>
            div.DialogueBackground {
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                background-color: #696969;
                background-color: rgba(0,0,0,0.6);
                overflow: hidden;
                text-align: center;
                color: #000000;
                overflow: hidden;
                z-index: 35;
            }

                div.DialogueBackground div.Dialogue {
                    position: fixed;
                    left: 50%;
                    top: 50%;
                    margin-left: -150px;
                    margin-top: -150px;
                    color: #000000;
                    margin-top: -200px;
                    margin-left: -300px;
                    border-radius: 5px;
                    -webkit-border-radius: 5px;
                    -moz-border-border-radius: 5px;
                }

            .popup {
                padding: 2px;
                margin: 5px auto 0px auto;
                border: 6px solid #333333;
                -webkit-border-radius: 5px;
                -moz-border-border-radius: 5px;
                z-index: 99999;
            }
        </style>
        <asp:Panel runat="server" ID="panel" CssClass="DialogueBackground" Visible="false">
            <div class="Dialogue">
                <div class="popup" style="background-color: whitesmoke; font-family: Arial; font-size: 25px;">
                    <%Response.Write(this.html); %>

                    <div class="clear10">
                    </div>
                    <asp:Button ID="can1" runat="server" Text="Đóng" BorderStyle="None" CssClass="btn" BackColor="Yellow" OnClick="can1_Click" />
                    <div class="clr">
                    </div>
                </div>
            </div>
        </asp:Panel>

    </div>
</asp:Content>

