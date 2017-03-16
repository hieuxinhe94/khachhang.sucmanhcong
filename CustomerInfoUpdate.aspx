<%@ Page Title="TÀI KHOẢN" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerInfoUpdate.aspx.cs" Inherits="Customer_CustomerInfoUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-2">
        
            </div>
            <div class="col-md-9">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Cập nhật thông tin</h3>
                        </div>
                        <div class="panel-body">

                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3 control-label">Họ tên</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtName" runat="server" Enabled="false" CssClass="form-control" Style="height: 35px; line-height: 35px; width: 100%; font-size: 15px; font-family: Arial;"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="form-group" style="margin-top: 20px;">
                                <label for="inputEmail3" class="col-sm-3 control-label">Địa chỉ</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Style="height: 35px; line-height: 35px; width: 100%; font-size: 15px; font-family: Arial;"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="form-group" style="margin-top: 30px;">
                                <label for="inputEmail3" class="col-sm-3 control-label">Điện thoại</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Style="height: 35px; line-height: 35px; width: 100%; font-size: 15px; font-family: Arial;"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="form-group" style="margin-top: 30px;">
                                <label for="inputEmail3" class="col-sm-3 control-label">Ngày sinh</label>
                                <div class="col-sm-9">
                                
                                    <asp:TextBox ID="txtBirthday" runat="server" CssClass="form-control" Style="height: 35px; line-height: 35px; width: 100%; font-size: 15px; font-family: Arial;"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="form-group" style="margin-top: 30px;">
                                <label for="inputEmail3" class="col-sm-3 control-label">Địa chỉ Email</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Style="height: 35px; line-height: 35px; width: 100%; font-size: 15px; font-family: Arial;"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="form-group" style="margin-top: 30px;">
                                <label for="inputEmail3" class="col-sm-3 control-label">Số CMND</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtIdCard" runat="server"  Enabled="false" CssClass="form-control" Style="height: 35px; line-height: 35px; width: 100%; font-size: 15px; font-family: Arial;"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="form-group" style="margin-top: 30px;">
                                <label for="inputEmail3" class="col-sm-3 control-label">Số hiệu thẻ</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtAccount" runat="server"  Enabled="false" CssClass="form-control" Style="height: 35px; line-height: 35px; width: 100%; font-size: 15px; font-family: Arial;"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="form-group" style="margin-top: 30px;">
                                <label for="inputEmail3" class="col-sm-3 control-label">&nbsp;</label>
                                <div class="col-sm-9">
                                    <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
                                        <asp:Label ID="lblImg1" Text="Ảnh minh hoạ" CssClass="MQTT_Normal_Text" runat="server"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtAvatar" runat="server" Width="10px" Visible="false"></asp:TextBox>
                                        <label class="file-upload" style="margin-top: -12px;">
                                            <span><strong>Upload Image</strong></span>
                                            <asp:FileUpload ID="upImage1" runat="server" Width="100px" CssClass="FileUploadImage" Height="22px" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="form-group" style="margin-top: 50px;">
                                <label for="inputEmail3" class="col-sm-3 control-label">&nbsp;</label>
                                <div class="col-sm-6" style="color: red; margin-left:-30px;margin-top:-35px; float:right; text-align:center">
                                    <% Response.Write(this.strMsg); %>
                                </div>
                            </div>
                            <br />
                            <div id="div-submit" class="form-group" style="margin-top: -68px; float:left;margin-left:-150px;">
                                <div  class="col-sm-12">
                                    <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Lưu thông tin" OnClick="btnSave_Click" />
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

