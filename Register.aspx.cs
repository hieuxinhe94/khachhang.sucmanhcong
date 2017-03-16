using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    private DataTable objTableAboutUs = new DataTable();
    private tblAbouts objAbout = new tblAbouts();
    public string footer = "";



    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

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

    #region method setCustomer
    public void setCustomer()
    {
        try
        {
            this.lblMsg.Text = "";
            if (this.txtName.Value.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập tên thành viên";
                return;
            }
            if (this.txtIdCard.Value.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập số CMND của thành viên";
                return;
            }
            if (this.txtBirthday.Value.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập ngày sinh của thành viên";
                return;
            }
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblCustomers WHERE Id = @Id)";
            sqlQuery += "BEGIN INSERT INTO tblCustomers(Name,Address,Birthday,IdCard,Phone,Email,State) VALUES(@Name,@Address,@Birthday,@IdCard,@Phone,@Email,@State) END ";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = 0;
            Cmd.Parameters.Add("Name", SqlDbType.NVarChar).Value = this.txtName.Value;
            Cmd.Parameters.Add("Address", SqlDbType.NVarChar).Value = this.txtAddress.Value;
            try
            {
                Cmd.Parameters.Add("Birthday", SqlDbType.DateTime).Value = this.txtBirthday.Value;
            }
            catch
            {
                Cmd.Parameters.Add("Birthday", SqlDbType.DateTime).Value = DateTime.Now;
            }
            Cmd.Parameters.Add("Phone", SqlDbType.NVarChar).Value = this.txtPhone.Value;
            Cmd.Parameters.Add("Email", SqlDbType.NVarChar).Value = this.txtEmail.Value;
            Cmd.Parameters.Add("IdCard", SqlDbType.NVarChar).Value = this.txtIdCard.Value;
            Cmd.Parameters.Add("State", SqlDbType.Bit).Value = false;
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();

            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "confirm('Thông tin đăng ký đã được gửi đến ban quản trị, chúng tôi sẽ xem xét và phản hồi bạn, Xin cảm ơn!');", true);
            this.lblMsg.Text = "Thao tác đã thực hiện thành công !";
            this.btnRegister.Enabled = false;
            this.btnCancel.Text = "Tiếp tục";
            clearTextbox();
        }
        catch
        {
            this.lblMsg.Text = "Lỗi. Bạn cần kiểm tra lại định dạng thông tin truyền vào cho chính xác!";
            Page.ClientScript.RegisterStartupScript(GetType(), "msg", "confirm('Lỗi. Bạn cần kiểm tra lại định dạng thông tin truyền vào cho chính xác!');", true);
        }
    }
    #endregion

    #region method btnRegister_Click
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        this.setCustomer();
    }
    #endregion

    #region method clearTextbox
    protected void clearTextbox()
    {
        this.txtName.Value = "";
        this.txtAddress.Value = "";
        this.txtBirthday.Value = "";
        this.txtPhone.Value = "";
        this.txtEmail.Value = "";
        this.txtIdCard.Value = "";


    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("/");
    }
    #endregion
}