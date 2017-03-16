<%@ Page Title="QUẢN TRỊ NỘI DUNG" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="AdvertProduct.aspx.cs" Inherits="ProductEdit" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script>
        var scWidth = screen.width;
        if (scWidth < 991) {
            confirm('Mục này không có sẳn trên di động .Quý khách vui lòng sử dụng máy tính cá nhân. ');
            window.location = '<%= ResolveUrl("~/MyProfile.aspx") %>'
        }

    </script>

    <div style="width: 85%; height: 32px; line-height: 30px; margin-top: 30px; margin-left:12.5%; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left; width: 12%;">&nbsp;&nbsp;SẢN PHẨM </div>
        <div style="float: right; width: 85.5%;">

            <div style="float: left; width: 20%;">
                <asp:DropDownList ID="ddlProductGroup" runat="server" Style="width: 100%; height: 26px; line-height: 26px; margin-top: 3px;">
                </asp:DropDownList>
            </div>


            <div style="float: right; width: 30%; text-align: right; height:auto">
                <asp:Button ID="btnSave" runat="server" Text="Gửi yêu cầu"  CssClass=" btn btn-success" Style="height: auto;" OnClick="btnSave_Click" />
             
            </div>
        </div>
    </div>
    <div style="width: 100%; height: 30px; line-height: 30px;">
     
        <div style="width: 85.5%; height: 30px; line-height: 30px; float: left; margin-left:12.5%;">
            <asp:TextBox ID="txtName" runat="server" CssClass="tvsInput" placeholder="Tên sản phẩm" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
  
      <div style="width: 12%; height: 30px; line-height: 30px; float: left; margin-top:-30px; font-size: 13px; font-family: Arial;">
        
            <asp:Label ID="lblImg1" Text="Tải ảnh minh hoạ" CssClass="MQTT_Normal_Text" runat="server"></asp:Label>
            
            <asp:TextBox ID="txtImage" CssClass="tvsInput" runat="server" Width="10px" Visible="false"></asp:TextBox>

            <label class="file-upload" style="margin-top: -12px;">
              
                <asp:FileUpload ID="upImage1" runat="server"  Width="100px" CssClass="FileUploadImage" 
                    Height="22px" />
            </label>
        </div>
        </div>
    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12.5%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
        
        </div>
        <div style="width: 10%; height: 30px; line-height: 30px; float: left;">
            <asp:TextBox ID="txtPrice" CssClass="tvsInput" placeholder="Giá niêm yết" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>

        <div style="width: 10%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Giảm giá (%) :
        </div>
        <div style="width: 10%; height: 30px; line-height: 30px; float: left;">
            <asp:TextBox ID="txtDiscount" CssClass="tvsInput" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>

        <div style="width: 10%; height: 30px; line-height: 30px; float: left; padding-left: 20px;">
            <asp:CheckBox ID="ckbBestSale" Text=" Bán chạy %" runat="server" Checked="false" Enabled="false" />
        </div>

        <div style="width: 10%; height: 30px; line-height: 30px; float: left;">
            <asp:CheckBox ID="ckbVIP" Text="  Bán chạy VIP" runat="server" Enabled="false" Checked="false" />
        </div>
    </div>

    <div style="width: 100%; height: 450px; line-height: 450px; margin-top: 5px;">
      
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <CKEditor:CKEditorControl ID="txtContent" CssClass="editor1" runat="server" Height="305"
                Width="99%" BasePath="~/ckeditor">Nội dung sản phẩm </CKEditor:CKEditorControl>
        </div>
    </div>
    <div style="width: 100%; height: 35px; line-height: 35px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right; font-family: Arial; font-size: 12px;">
            <asp:CheckBox ID="ckbState" Text="  Trạng thái" runat="server" />
        </div>
    </div>
</asp:Content>
