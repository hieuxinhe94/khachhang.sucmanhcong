﻿<%@ Page Title="THÔNG TIN HÓA ĐƠN" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BillNote.aspx.cs" Inherits="Customer_BillNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .card-small {
            font-size: 12px;
        }

        .body-bill {
            font-size: 12px;
        }
    </style>
    <div class="container">
      
            <div  id="div-spiner" style="width: 100%;">
                 
                <div  id="div-noname" style="width: 20%; float: left; font-size: 10px; margin-left: 0%; background-color: whitesmoke">
                    <h3 style="color: darkgoldenrod; margin-left: 1px;">• Thông tin hóa đơn </h3>
                    <div style="width: 100%; height: 40px; line-height: 40px; font-weight: bold; font-size: 12px; overflow: hidden">
                        <% Response.Write(this.strPartnerName); %>
                    </div>
                    <div style="width: 100%; height: 30px; line-height: 30px;" class="body-bill">
                        <div style="width: 50%; float: left;" class="card-small">
                            Ngày hóa đơn
                        </div>
                        <div style="width: 50%; float: right; text-align: left;">
                            <% Response.Write(this.strNgayHoaDon); %>
                        </div>
                    </div>
                    <div style="width: 100%; height: 30px; line-height: 30px;">
                        <div style="width: 50%; float: left;" class="card-small">
                            Tiền hóa đơn
                        </div>
                        <div style="width: 50%; float: right; text-align: left;">
                            <% Response.Write(this.strTotalMoney); %>
                        </div>
                    </div>
                    <div style="width: 100%; height: 30px; line-height: 30px;">
                        <div style="width: 50%; float: left;" class="card-small">
                            Chiết khấu
                        </div>
                        <div style="width: 50%; float: right; text-align: left;">
                            <% Response.Write(this.strTotalMoneyDiscount); %>
                        </div>
                    </div>
                    <div style="width: 100%; height: 30px; line-height: 30px;">
                        <div style="width: 50%; float: left;" class="card-small">
                            Mức chiết khấu
                        </div>
                        <div style="width: 50%; float: right; text-align: left;">
                            <% Response.Write(this.strDiscount); %> %
                        </div>
                    </div>
                    <div style="width: 100%; height: 30px; line-height: 30px;">
                        <div style="width: 50%; float: left;" class="card-small">
                            Tiền phải thanh toán 
                        </div>
                        <div style="width: 50%; float: right; text-align: left;">
                            <% Response.Write(this.strTotalPeyment); %>
                        </div>
                    </div>
                </div>
                      
            </div>
            <!-- KHách hàng yêu cầu thêm-->
            <div id="spiner2" style="width: 55%; float: left; margin-left: 5px; margin-right: -200px">
                <h3 style="margin-left: 85px; color: goldenrod">Hàng Hóa</h3>

                <p>Chi tiết các mặt hàng :</p>
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th>Tên hàng hóa</th>
                            <th>Số lượng</th>
                            <th>Giá tiền </th>
                            <th>Giá đã chiết khấu </th>
                            <th>Thành tiền </th>
                            <th>Giảm giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < this.objTableProduct.Rows.Count; i++)
                           { %>
                        <tr>

                            <td style="overflow: hidden"><% Response.Write(this.objTableProduct.Rows[i]["Name"].ToString()); %></td>
                            <td><% Response.Write(this.objTableProduct.Rows[i]["ProductNumber"].ToString()); %></td>
                            <td><%  Response.Write(this.objTableProduct.Rows[i]["Price"].ToString()); %></td>
                            <td><%  int tmp1 = 0;
                                    try
                                    {
                                        tmp1 = Int32.Parse(this.objTableProduct.Rows[i]["Price"].ToString()) * Int32.Parse(this.objTableProduct.Rows[i]["Discount"].ToString()) / 100;
                                    }
                                    catch
                                    { tmp1 = 0; }
                                    Response.Write(tmp1); %></td>
                            <td><% 
                                    int tmp = 0;
                                    try
                                    {
                                        tmp = Int32.Parse(this.objTableProduct.Rows[i]["ProductNumber"].ToString()) * Int32.Parse(this.objTableProduct.Rows[i]["Price"].ToString()) - tmp1;
                                    }
                                    catch
                                    {
                                        tmp = 0;
                                    }
                                    Response.Write(tmp.ToString());  %></td>
                            <td style="text-align: center"><% if (tmp != 0) Response.Write("Có"); else { Response.Write("Không"); } %>     </td>

                        </tr>
                        <% } %>

                        <!---- NO Discount--->
                        <tr style="background-color: ThreeDDarkShadow; border-radius: 0px !important;">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <% for (int i = 0; i < this.objTableProductNoDiscount.Rows.Count; i++)
                           { %>
                        <tr>

                            <td style="overflow: hidden"><% Response.Write(this.objTableProductNoDiscount.Rows[i]["ProductName"].ToString()); %></td>
                            <td><% Response.Write(this.objTableProductNoDiscount.Rows[i]["ProductNumber"].ToString()); %></td>
                            <td><%  Response.Write(this.objTableProductNoDiscount.Rows[i]["ProductPrice"].ToString()); %></td>
                            <td>0
                            </td>
                            <td><% 
                                    int tmp = 0;
                                    try
                                    {
                                        tmp = Int32.Parse(this.objTableProductNoDiscount.Rows[i]["ProductNumber"].ToString()) * Int32.Parse(this.objTableProductNoDiscount.Rows[i]["ProductPrice"].ToString());
                                    }
                                    catch
                                    {
                                        tmp = 0;
                                    }
                                    Response.Write(tmp.ToString());  %></td>
                            <td style="text-align: center">Không    </td>

                        </tr>
                        <% } %>
                    </tbody>
                </table>

            </div>
            <!-- KHách hàng yêu cầu thêm-->

            <div id="spiner3" style="width: 30%; float: right;">
                <h3 style="margin-left: 85px; color: goldenrod">Đánh giá đơn hàng</h3>
                <div style="width: 100%; height: 30px; line-height: 30px;">

                    <div style="width: 75%; float: right; text-align: left;">
                        <asp:DropDownList ID="ddlBillNote" runat="server" Style="width: 100%; height: 26px; line-height: 26px; margin-top: 3px;"></asp:DropDownList>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">

                    <div style="width: 75%; float: right; text-align: left;">
                        <asp:TextBox ID="txtNote" TextMode="MultiLine" Width="100%" Rows="6" runat="server" Font-Names="Arial" placeholder="Nội Dung Khác"></asp:TextBox>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">

                    <div style="width: 75%; float: right; text-align: left; height: 40px; line-height: 40px;">
                        <asp:Button ID="btnSave" runat="server" Text="Lưu thông tin" CssClass="btn btn-default" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    
</asp:Content>
