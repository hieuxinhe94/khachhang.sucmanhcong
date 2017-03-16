<%@ Page Title="KHÁCH HÀNG" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        var scWidth = screen.width;
        if (scWidth < 991)
        {
                window.location = '<%= ResolveUrl("~/MyProfile.aspx") %>'
        }


        function alert_upgrade2() {
            confirm(' Nâng cấp tự động khi tích lũy thẻ của bạn >= 360.000 đ '); return;
        }
        function alert_upgrade3() {
            confirm(' Nâng cấp tự động khi tích lũy thẻ của bạn >= 3.600.000 đ '); return;
        }
    </script>
    <h3 style="margin-top:60px;margin-bottom:-40px; margin-left:30%; font-family:Arial;"> HỆ THỐNG THẺ SUCMANHCONG</h3>
    <div class="container CustomerHomePage">

       <div class ="row CustomerHomePageRow1">
           <div class ="col-md-4 ColMd4-1">THẺ ĐỒNG</div>
             <div class ="col-md-4 ColMd4-2">THẺ BẠC </div>
        <div class ="col-md-4 ColMd4-3">THẺ VÀNG</div>
       </div>
        <!-- +++ -->

        <div class ="row CustomerHomePageRow2">
           <div class ="col-md-4 ColMd4-1" style="padding-right:108px;">36,000 đ </div>
             <div class ="col-md-4 ColMd4-2"> 360,000 đ  </div>
        <div class ="col-md-4 ColMd4-3" "> 3,600,000 đ </div>
               <!-- +++ -->
       </div>
        <div class ="row CustomerHomePageRow3">
           <div class ="col-md-4 ColMd4-1" style="padding-right:190px;"> <a href="http://www.sucmanhcong.com/NewsDetailt?Id=1" style="color:white">Xem chi tiết </a>   </div>   
             <div class ="col-md-4">
                 <div style="float:left; display:inline; padding-left:22px;" class="col-md-6"  >
                     <a href="http://www.sucmanhcong.com/NewsDetailt?Id=2" style="color:white;margin-left:-20px; padding-right:-30px;">Xem chi tiết </a></div>
               
                  <div style="float:right; padding-right:105px; display:inline;" class="col-md-6" >
                      <% try
                         {
                             if (float.Parse(this.tichluythang.ToString()) <= 360000)
                             { %>
                         <div  class="btn btn-success" style="margin-top:-7.5px;margin-left:-15px;"> <a href="#" onclick="alert_upgrade2()" style="color:white;float:right">Nâng cấp </a>  
                            </div>
                      <%}
                             else
                             { %>
                        <div style="margin-top:-7.5px;margin-left:-15px; margin-bottom:-30px;margin-top:-10px; background-color:white; height:40px;width:100px;">
                            </div>
                      <%}
                         }
                         catch
                         { 
                                %>
                      <%
                         } %>  
                  </div> 
             </div>   
                   <div class ="col-md-4">
                   <div style="float:left; display:inline; padding-left:35px;" class="col-md-6"  >
                       <a href="http://www.sucmanhcong.com/NewsDetailt?Id=3" style="color:white;margin-left:-80px; padding-right:100px;">Xem chi tiết </a></div>
               
                  <div style="float:right; padding-right:0px; display:inline;" class="col-md-6" >
                         <% try
                            {
                                if (float.Parse(this.tichluythang.ToString()) <= 3600000)
                                { %>
                         <div  class="btn btn-success" style="margin-top:-7.5px;float:left; margin-left:-77px;"> <a href="#" onclick="alert_upgrade3()"  style="color:white;float:right">Nâng cấp </a> 
                      </div>
                      <%}
                             else
                             { %>
                        <div style="margin-top:-7.5px;margin-left:-85px; margin-bottom:-30px;margin-top:-10px; background-color:white; height:40px;width:100px;">
                            </div>
                      <%}
                         }
                            catch { } %>  
                            </div>   
                      </div>
        </div>
        <div class ="row CustomerHomePageRow4">
           <div class ="col-md-6 Col-new"> <a href="http://www.sucmanhcong.com//NewsDetailt?Id=1" style="color:black">Thẻ Đồng </a>   
               <span style="color:black;font-size:12px; font-family:'Comic Sans MS'"></span>   </div> 
                    </div>  
        <div class ="row">
           <div class ="col-md-6 Col-new"> <a href="http://www.sucmanhcong.com//NewsDetailt?Id=2" style="color:black">Thẻ Bạc </a> 
             <span style="color:black"> </span>   </div>  
        
                  </div>   
        <div class ="row">
           <div class ="col-md-6 Col-new"> <a href="http://www.sucmanhcong.com//NewsDetailt?Id=3" style="color:black">Thẻ Vàng </a>   
             <span style="color:black"></span>   </div>   
                  
        </div>  
   

    </div>

</asp:Content>
