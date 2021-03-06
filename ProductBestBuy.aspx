﻿<%@ Page Title="BEST BUY" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ProductBestBuy.aspx.cs" Inherits="ListProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

     <!-- This script to excute  button like menthod , Do not move diff file -->
    <script>

        function like(product_id) {
         
            if (product_id == 0) return;
            document.getElementById("btn" + product_id).hidden = true;
            document.getElementById("<%=hidden.ClientID %>").value = "" + product_id;
            var element = (document.getElementById('like' + product_id));
            var likecount = element.innerText || element.textContent;
            document.getElementById('like' + product_id).innerHTML = parseInt(likecount) + 1;
            <% 
        try
        {
            int id = int.Parse(hidden.Value.ToString().Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries)[0].ToString());
            this.objProduct.like(id);

            return;
        }
        catch { } %>
                                           <% %>
        }

        function like2(product_id) {
            var canclick = document.getElementById('sessionhidden').value;
            if (canclick.trim() == "" || typeof (canclick) == "undefined") { alert('Vui lòng đăng nhập để bình chọn cho sản phầm bạn thích !'); return };
            if (canclick.trim == "") return;
            document.getElementById("btn2" + product_id).hidden = true;
            document.getElementById("<%=hidden.ClientID %>").value = "" + product_id;
            var element = (document.getElementById('like2' + product_id));
            var likecount = element.innerText || element.textContent;
            document.getElementById('like2' + product_id).innerHTML = parseInt(likecount) + 1;
            <%
        try
        {
            int id = int.Parse(hidden.Value.ToString().Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries)[0].ToString());
            this.objProduct.like(id);

            return;
        }
        catch { } %>
            <% %>
        }


    </script>
    <!--/-->

    <script>
        function urlrl(vp, gr,page) {
            var str = "?";
            if (vp != 0) {
                str += "Type=" + vp;
            }

            if (gr != 0) {
                if (str != "?") str += "&";
                str += "Group=" + gr;
            }

            if (page != 0) {
                if (str != "?") str += "&";
                str += "Page=" + page;
            }

            return str;
        }
    </script>

    <div class="container">
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-5">
                <div style="font-family: Arial; font-size: 15px; font-weight: bold; text-transform: uppercase; display: table; vertical-align: middle;">
                   Sản phẩm tốt nhất dành cho bạn 
                    <br />
                    <span style="font-size: 12px; font-weight: normal;">Hiện tại có <%= this.ncount %> sản phẩm
                    </span>
                </div>
            </div>
            <div id="ddl-product-right" class="col-md-3" style="float: right">
                <div class="dropdown">
                    <select class="form-control" onchange="window.location=urlrl(<%=this.VBType %>,this.value,0)">
                        <option value="0"> Nhóm sản phẩm </option>
                        <% for (int i = 0; i < this.objRowProductGroup.Count; i++){ %>
                        <option value="<%= this.objRowProductGroup[i]["Id"] %>" <% if (this.ProductGroup == (int)this.objRowProductGroup[i]["Id"]) Response.Write("selected='selected'"); %>><%= this.objRowProductGroup[i]["Name"] %></option>
                        <% } %>
                    </select>
                </div>
            </div>
            <div id="ddl-product-left" class="col-md-2" style="float: right">
                <div class="dropdown">
                    <select class="form-control" onchange="window.location=urlrl(this.value,<%=this.ProductGroup %>,0)">
                        <option value="0">Tất cả</option>
                        <option value="1" <% if (this.VBType == 1) Response.Write("selected='selected'"); %>>Vip</option>
                        <option value="2" <% if (this.VBType == 2) Response.Write("selected='selected'"); %>>Bán chạy</option>
                    </select>
                </div>
            </div>
        </div>
        <hr />
    </div>
      <asp:UpdatePanel runat="server">
                <ContentTemplate>

    <div class="container sanpham">
           
          
        <%for (int i = 0; i < this.objTableProduct.Rows.Count; i++) {  %>
        <%--<% if (this.objTableProduct.Rows[i]["Image"] == "" || this.objTableProduct.Rows[i]["Image"] == null) this.objTableProduct.Rows[i]["Image"] = "noImg.jpg"; %>--%>
            <div class="col-md-3" style="margin-top: 10px">
                <div class="sanpham_background">
                    <a class="fw" href="http://www.sucmanhcong.com/detailt.aspx?id= "++"<%= this.objTableProduct.Rows[i]["Id"].ToString() %>">
                        <img src="http://www.sucmanhcong.com/images/Products/<%= this.objTableProduct.Rows[i]["Image"].ToString() %>"  class="sanpham_avata" alt=" Nổi bật" onerror=" this.onerror = null  ; this.src ='/img/noImg.jpg'" />
                    </a>
                    <p class="ProductLink sanpham_title">
                        <a href="/detailt.aspx?id=<%= this.objTableProduct.Rows[i]["Id"].ToString() %> ">
                            <%= this.objTableProduct.Rows[i]["Name"].ToString() %>
                        </a>
                    </p>
                    <div style="text-align: right; margin-top: -2px;">
                        <div class="sanpham_like">

                              <asp:HiddenField ID="hidden" runat="server" ClientIDMode="Static" />

                                            <button class="btn-like-click" id="btn<%= this.objTableProduct.Rows[i]["Id"].ToString()%>" onclick="like(<%= this.objTableProduct.Rows[i]["Id"].ToString()%>);"
                                                style="border: none !important; background-color: white !important; float: left; margin-right: 10px;">
                                                <i class="glyphicon  glyphicon-thumbs-up" style="border: none !important; background-color: none !important;"></i>
                                            </button>
                                            <button runat="server" class="btn-like" id="Button1" style="border: none !important; background-color: white !important; float: left; margin-right: 10px;">
                                         
                                            </button>

                                            <img src="http://www.sucmanhcong.com/images/User.png" 
                                                 id="<%= this.objTableProduct.Rows[i]["Id"].ToString()%>"
                                                alt="So nguoi thich" class="sanpham_like_img" style="width: 20px; margin-right: 10px" />
                                            <span id="like<%= this.objTableProduct.Rows[i]["Id"].ToString()%>"><%= this.objTableProduct.Rows[i]["CountLike"].ToString() %></span>
                         <%--   <img src="http://www.sucmanhcong.com/images/User.png" alt="So nguoi thich" class="sanpham_like_img" style="width: 20px" />
                            <%= this.objTableProduct.Rows[i]["CountLike"].ToString() %>--%>
                        </div>
                    </div>
                    <div class="sanpham_price_line">
                        <span class="sanpham_price">
                                 <%                  
                       TVSFunc tvsPrice = new TVSFunc();
                       Response.Write(tvsPrice.formatPrice(this.objTableProduct.Rows[i]["Price"].ToString()));
                                %>
                          
                        </span>
                        <div class="sanpham_Discount">
                            &nbsp; -
                                <%= this.objTableProduct.Rows[i]["Discount"].ToString() %>% &nbsp;
                        </div>
                        <input type="button" value="Đã mua: <%= this.objTableProduct.Rows[i]["CountBuy"].ToString() %>" style="float: right;" />
                    </div>

                </div>

            </div>
            <% } %>
    </div>
                     </ContentTemplate>
            </asp:UpdatePanel>

    <div class="sotrang">
        <table>
            <tr>
                <td><a href="<%= this.GetUrlPage((this.nPage-1 > 0)?(this.nPage-1):1) %>"><i class="fa fa-angle-left"></i></a></td>
                <% if (this.nPage != 1){ %>
                <td><a href="<%=this.GetUrlPage(1) %>">1</a></td>
                <% } %>

                <% for (int i = ((this.nPage - 4 > 1) ? (this.nPage - 4) : 2); i < this.nPage; i++){ %>
                <td><a href="<%=this.GetUrlPage(i) %>"><%=i.ToString() %></a></td>
                <% } %>

                <td style="border-radius: 0%; background-color: aqua;"><%=this.nPage.ToString() %></td>

                <% for (int i = (this.nPage + 1); i < this.MaxPage && i < (this.nPage + 6); i++){ %>
                <td><a href="<%=this.GetUrlPage(i) %>"><%=i.ToString() %></a></td>
                <% } %>

                <% if (this.nPage < this.MaxPage){ %>
                <td><a href="<%=this.GetUrlPage(this.MaxPage) %>"><%= this.MaxPage.ToString() %></a></td>
                <% } %>
                <td><a href="<%=this.GetUrlPage((this.nPage+1 < this.MaxPage)?(this.nPage+1):this.MaxPage) %>"><i class="fa fa-angle-right"></i></a></td>

            </tr>
        </table>
    </div>

</asp:Content>

