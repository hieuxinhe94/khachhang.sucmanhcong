<%@ Page Title="DOANH SỐ" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerBill.aspx.cs" Inherits="Customer_CustomerBill" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .card-small {
            font-size: 12px;
        }

        .body-bill {
            font-size: 12px;
        }
        .content-bill-left
        {
            width: 100%; height: 40px; line-height: 40px; font-weight: bold; font-size: 12px; overflow: hidden

        }
        .row-bill {
         
            float: left;
            border: solid 1px #f3f1f1;
            border-right: none;
            text-align: center;
            font-weight: bold;
            height: 30px;
            line-height: 30px;
            color: #000;
        }
    </style>
    <div class="container">


        <div id="div-spiner" class="row" style="margin-top: 20px;">

             <div id="div-noname" style="width: 20%; float: left; font-size: 14px; margin-left: 0%; margin-top:50px; background-color: whitesmoke">
                <h4 style="color: darkgoldenrod; margin-left: 1px;">• DOANH SỐ GIAO DỊCH </h4>
                <div style="width: 100%; height: 40px; line-height: 40px; font-weight: bold; font-size: 12px; overflow: hidden">
                Doanh số  ngày:        <% Response.Write(this.strDSInDay); %>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;" class="body-bill">
                    <div style="width: 50%; float: left;" class="card-small">
                    Doanh số  tuần :
                    </div>
                    <div style="width: 50%; float: right; text-align: left;">
                        <% Response.Write(this.strDSInWeek); %>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 50%; float: left;" class="card-small">
                       Doanh số tháng :
                    </div>
                    <div style="width: 50%; float: right; text-align: left;">
                        <% Response.Write(this.strDSInMonth); %>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 50%; float: left;" class="card-small">
                       Tổng doanh số :
                    </div>
                    <div style="width: 50%; float: right; text-align: left;">
                        <% Response.Write(this.strDSTotal); %>
                    </div>
                </div>
                  
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 50%; float: left;" class="card-small">
                     Tích luỹ thẻ : 
                    </div>
                    <div style="width: 50%; float: right; text-align: left;">
                        <% Response.Write(this.strDSCard); %> 
                    </div>
                </div>
              
            </div>


         
            <div id="div-spin-date" class="col-md-9">
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-md-1" style="height: 100%">
                        Từ 
                    </div>
                    <div class="col-md-3">
                        <input runat="server" id="txtFromDate" type="date" class="form-control" value="" placeholder="yyy-mm-dd" />
                    </div>
                    <div class="col-md-1">
                        đến 
                    </div>
                    <div class="col-md-3">
                        <input type="date" runat="server" id="txtToDate" class="form-control" value="" placeholder="yyy-mm-dd" />
                    </div>
                    <div class="col-md-2">
                        <select class="form-control" name="optType" >
                            <option value="0">Tất cả</option>
                            <option value="1" <% if (this.Type == 1) Response.Write("selected='selected'"); %>>Tiền mặt</option>
                            <option value="2" <% if (this.Type == 2) Response.Write("selected='selected'"); %>>Dùng thẻ</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="submit" style="float: left" class="btn btn-default" value="Lọc kết quả" />
                    </div>
                </div>
                 <% if(this.Message != ""){ %>
        <div class="row" >
            <pre><%= this.Message %></pre>
        </div>
        <% } %>
                <div class="col-md-12">
                <div class="row">
                 <div style="width: 100%; margin-top: 0px;">
                        <div id="tn1" class="table_header_item" style="width: 5%;">
                            TT   
                        </div>
                          <div id="tn3" class="table_header_item1" style="width: 12%;">
                            Thời gian
                        </div>
                        <div id="tn4" class="table_header_item2" style="width: 15%;">
                            Tổng tiền
                        </div>
                        <div  id="tn5"class="table_header_item2" style="width: 10%;">
                            Tiền CK
                        </div>
                        <div id="tn6" class="table_header_item2" style="width: 5%;">
                            CK(%)
                        </div>
                        <div id="tn7" class="table_header_item2" style="width: 5%;">
                            TL(%)
                        </div>
                        <div id="tn8" class="table_header_item2" style="width: 5%;">
                            QC(%)
                        </div>
                        <div id="tn9" class="table_header_item2" style="width: 10%;">
                            Thanh toán
                        </div>
                        <div id="tn10" class="table_header_item2" style="width: 25%;">
                            Ghi chú
                        </div>
                        <div id="tn11" class="table_header_item2" style="width: 8%;">
                         Chi tiết
                        </div>
                    </div>

                    
                <% Response.Write(this.strHtml); %>
            </div>
        </div></div>
                    </div>
    </div>
</asp:Content>

