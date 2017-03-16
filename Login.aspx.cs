using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    #region declare objects
    private TVSFunc objFunc = new TVSFunc();
    private DataTable objTableAboutUs = new DataTable();
    private tblAbouts objAbout = new tblAbouts();
    public string footer = "";
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ACCOUNT"] = null;

        if (Page.IsPostBack)
        {
            if (this.txtAccount.Value.ToString() == "")
            {
                this.lblMsg.Text = "Tên đăng nhập không hợp lệ";
                return;
            }
            if (this.txtPassWord.Value.ToString() == "")
            {
                this.lblMsg.Text = "Mật khẩu nhập không hợp lệ";
                return;
            }

            DataTable accout = this.GetAccount(this.txtAccount.Value.ToString());
            if (accout.Rows.Count == 0)
            {
                this.lblMsg.Text = "Tài khoản không tồn tại";
                return;
            }

            if (accout.Rows[0]["Acct_Pass"].ToString() != this.objFunc.CryptographyMD5(this.txtPassWord.Value.ToString()))
            {
                this.lblMsg.Text = "Mật khẩu không chính xác";
                return;
            }


            int type = (int)accout.Rows[0]["Acct_Type"];
            if (type == 0)
            {

                Partner objPartner = new Partner();
                DataRowCollection objRow = objPartner.getPartnerInforByAccount(accout.Rows[0]["Acct_Name"].ToString()).Rows;
                if (objRow.Count > 0)
                {
                    if ((bool)objRow[0]["State"])
                    {
                        this.lblMsg.Text = "Tài Khoản hoặc mật khẩu không chính xác";
                        return;
                    }
                    else
                    {
                        this.lblMsg.Text = "tài khoản của bạn chưa được kích hoạt. Xin liên hệ với quản lý để xử lý!";
                        return;
                    }
                }
                else
                {
                    this.lblMsg.Text = "Có lỗi xảy ra với tài khoản này. Xin liên hệ với quản lý để xử lý!";
                    return;
                }


            }
            else if (type == 1)
            {
                Customers objCustomers = new Customers();
                DataRowCollection objRow = objCustomers.getCustomerByAccount(accout.Rows[0]["Acct_Name"].ToString()).Rows;
                if (objRow.Count > 0)
                {
                    if ((bool)objRow[0]["State"])
                    {
                        Session["ACCOUNT"] = accout.Rows[0]["Acct_Name"].ToString();
                        Response.Redirect("Default.aspx", true);
                    }
                    else
                    {
                        this.lblMsg.Text = "tài khoản của bạn chưa được kích hoạt. Xin liên hệ với quản lý để xử lý!";
                        return;
                    }
                }
                else
                {
                    this.lblMsg.Text = "Có lỗi xảy ra với tài khoản này. Xin liên hệ với quản lý để xử lý!";
                    return;
                }
            }
        }

        /**/
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
    }
    #endregion

    #region method GetAccount
    protected DataTable GetAccount(string account)
    {
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblAccount WHERE Acct_Name = @account";
            Cmd.Parameters.Add("account", SqlDbType.NVarChar).Value = account;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlCon.Close();
            sqlCon.Dispose();
            return ds.Tables[0];
        }
        catch
        {
            return new DataTable();
        }
    }
    #endregion
}