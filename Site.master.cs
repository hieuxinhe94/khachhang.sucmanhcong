using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : MasterPage
{

    #region declare objects
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;
    public string strHeader = "", currPartnerId = "", strFullName = "";
    private TVSFunc objFunc = new TVSFunc();
    public string[] ProductGroup = new string[7] { "", "", "", "", "", "", "" };
    private DataTable objTableProductGroup = new DataTable();
    public String tichluythang = "", tongsodu = "";
    public string footer = "";
    public Customers objCustomers = new Customers();
    public DataRow objCustomer;
    private DataTable objTableAboutUs = new DataTable();
    private tblAbouts objAbout = new tblAbouts();
    #endregion

    #region method Page_Init
    protected void Page_Init(object sender, EventArgs e)
    {
        // fake SesionACoount 
 
        if (Session["ACCOUNT"] == null || Session["ACCOUNT"].ToString() == "")
        {
            Response.Redirect("Login.aspx");
            sessionhidden.Value = Session["ACCOUNT"].ToString();
            return;
        }
        DataTable objData = objCustomers.getCustomerByAccount(Session["ACCOUNT"].ToString());
        if (objData.Rows.Count > 0)
        {
            this.objCustomer = objData.Rows[0];
        }
        else
        {
            Response.Redirect("/");
        }


        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;

    }
    #endregion

    #region method master_Page_PreLoad
    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        this.tichluythang = String.Format("{0:0,0}", getCustomerTotalDiscountCardOnMonth(Session["ACCOUNT"].ToString()));
        this.tongsodu = String.Format("{0:0,0}", this.getCustomerTotalDiscountCard(Session["ACCOUNT"].ToString()));// - objCustomers.getSalesCardByCustomerAccout(Session["ACCOUNT"].ToString()));

        this.strFullName = "<B>Xin chào " + Session["ACCOUNT"].ToString() + " | <a href = \"../Logout.aspx\">Thoát</a></B>";
        this.objTableAboutUs = this.objAbout.getAbouts();
        if (this.objTableAboutUs.Rows.Count > 0)
        {
            footer = " <h6 style='margin-top: 6px; margin-bottom: -2px; color: #000; font-weight: bold; font-size: 17px;font-family: Arial; font-size: 15px; font-weight: bold; color: #4e4e57;'>";
            footer += objTableAboutUs.Rows[0]["Name"].ToString().ToUpper() + "</h6>";
            footer += " <p style='margin-top: 6px; margin-bottom: 0px; color: #000;'>";
            footer += objTableAboutUs.Rows[0]["Address"].ToString();
            footer += " </p>" +
                    "<p style='color: #000;'>";
            footer += "Điện thoại :" + objTableAboutUs.Rows[0]["Phone"].ToString() + "  Email  :" + objTableAboutUs.Rows[0]["Email"];
            footer += " </p>";
        }
        upGradeCard();


    }
    #endregion

    #region method getProductGroup
    public DataTable getProductGroup()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, * FROM tblProductGroup";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        sqlCon.Close();
        sqlCon.Dispose();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["TT"] = (i + 1);
        }
        return ds.Tables[0];
    }
    #endregion

    #region method getCustomerTotalDiscountCard
    public double getCustomerTotalDiscountCard(string CustomerAccount)
    {
        double tmpValue = 0, tmpValue1 = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = " SELECT ISNULL(SUM((TotalMoneyDiscount*DiscountCard)/100),0) AS Discount FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount";
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = CustomerAccount;
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["Discount"].ToString());
            }
            Rd.Close();
            SqlCommand Cmd1 = sqlCon.CreateCommand();

            Cmd1.CommandText = "SELECT ISNULL(SUM(TotalPeymentCard),0) AS TotalMoney FROM tblCustomersPaymentByCard WHERE CustomerAccount = @CustomerAccount";
            Cmd1.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = CustomerAccount;
            SqlDataReader Rd1 = Cmd1.ExecuteReader();
            while (Rd1.Read())
            {
                tmpValue1 = double.Parse(Rd1["TotalMoney"].ToString());
            }
            Rd1.Close();
            tmpValue = tmpValue - tmpValue1;

            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
        return tmpValue;
    }
    #endregion

    #region method getCustomerTotalDiscountCardOnMonth
    public double getCustomerTotalDiscountCardOnMonth(string CustomerAccount)
    {
        double tmpValue = 0, tmpValue1 = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = " SELECT ISNULL(SUM((TotalMoneyDiscount*DiscountCard)/100),0) AS Discount FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount AND Year(DayCreate) = Year(CURRENT_TIMESTAMP) AND Month(DayCreate) = Month(CURRENT_TIMESTAMP)  ";
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = CustomerAccount;
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["Discount"].ToString());
            }
            Rd.Close();

            SqlCommand Cmd1 = sqlCon.CreateCommand();
            Cmd1.CommandText = "SELECT ISNULL(SUM(TotalMoney),0) AS TotalMoney FROM tblCustomersPaymentByCard WHERE CustomerAccount = @CustomerAccount AND Year(DayCreate) = Year(CURRENT_TIMESTAMP) AND Month(DayCreate) = Month(CURRENT_TIMESTAMP) ";
            Cmd1.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = CustomerAccount;
            SqlDataReader Rd1 = Cmd1.ExecuteReader();
            while (Rd1.Read())
            {
                tmpValue1 = double.Parse(Rd1["TotalMoney"].ToString());
            }
            Rd1.Close();

            tmpValue = tmpValue - tmpValue1;

            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
        return tmpValue;
    }
    #endregion

    #region method Unnamed_LoggingOut
    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
    }
    #endregion

    #region date
    public DateTime MondayOfWeek(DateTime date)
    {
        var dayOfWeek = date.DayOfWeek;
        
        if (dayOfWeek == DayOfWeek.Sunday)
        {
             
            return date.AddDays(0);  
            // nếu xét chủ nhật là ngày cuối tuần  
          //  return date.AddDays(-6);
        }
         /* */
        // nếu không phải thứ 2 thì lùi ngày lại cho đến thứ 2  
        int offset = dayOfWeek - DayOfWeek.Sunday + 1;
        return date.AddDays(-offset);
    }

    public DateTime SundayOfWeek(DateTime date)
    {
        return this.MondayOfWeek(date).AddDays(6);
    }

    #endregion

    #region upGradeCard()
    public void upGradeCard()
    {
        try {
            double tongsodu = this.getCustomerTotalDiscountCard(Session["ACCOUNT"].ToString());   // -objCustomers.getSalesCardByCustomerAccout(Session["ACCOUNT"].ToString());
        string accoutTypeNow = this.objCustomers.getCustomerByAccount(Session["ACCOUNT"].ToString()).Rows[0]["AccountType"].ToString();
       
        if (tongsodu >= 360000 && tongsodu < 3600000 && accoutTypeNow == "CustomerAccount" )
        {
            objCustomers.updateCard(Session["ACCOUNT"].ToString(), "CustomerAccount1");
            // tu dong len bac
            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "if(confirm('Số dư khả dụng của bạn >= 360,000.Bạn đả được nâng cấp lên Thẻ Bạc ')) {window.location.reload(false);}", true);
            return; }
        if (tongsodu >= 3600000 && accoutTypeNow == "CustomerAccount1")
        {
            objCustomers.updateCard(Session["ACCOUNT"].ToString(), "CustomerAccount2");
            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "if(confirm('Số dư khả dụng của bạn >= 3,600,000.Bạn đả được nâng cấp lên Thẻ Vàng ')) {window.location.reload(false);}", true);
            return;
        }
            }
        catch { }


    }
    #endregion
}