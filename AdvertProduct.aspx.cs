﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductEdit : System.Web.UI.Page
{
    #region declare objects
    private DataProduct objProduct = new DataProduct();
    private Partner objPartner = new Partner();
    private Location objLocation = new Location();

    private int itemId = 0;
    private int partnerId = 0;
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        txtContent.config.toolbar = new object[]
        {
            new object[] { "Source", "-", "Save", "NewPage", "Preview", "-", "Templates" },
            new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
            new object[] { "Undo", "Redo", "-", "Find", "Replace", "-", "SelectAll", "RemoveFormat" },
            new object[] { "Form", "Checkbox", "Radio", "TextField", "Textarea", "Select", "Button", "ImageButton", "HiddenField" },
            "/",
            new object[] { "Bold", "Italic", "Underline", "Strike", "-", "Subscript", "Superscript" },
            new object[] { "NumberedList", "BulletedList", "-", "Outdent", "Indent", "Blockquote", "CreateDiv" },
            new object[] { "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyBlock" },
            new object[] { "BidiLtr", "BidiRtl" },
            new object[] { "Link", "Unlink", "Anchor" },
            new object[] { "Image", "Flash", "Table", "HorizontalRule", "Smiley", "SpecialChar", "PageBreak", "Iframe" },
            "/",
            new object[] { "Styles", "Format", "Font", "FontSize" },
            new object[] { "TextColor", "BGColor" },
            new object[] { "Maximize", "ShowBlocks", "-", "About" }
        };

        CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
        _FileBrowser.BasePath = "/ckfinder";
        _FileBrowser.SetupCKEditor(this.txtContent);
        try
        {
            this.itemId = int.Parse(Request["id"].ToString());
        }
        catch
        {
            this.itemId = 0;
        }

        try
        {
            this.partnerId = int.Parse(Request["partnerId"].ToString());
        }
        catch
        {
            this.partnerId = 0;
        }

        if (!Page.IsPostBack)
        {
          
            this.getProductGroup();
        }
    }
    #endregion

    #region method getProductGroup
    public void getProductGroup()
    {
        DataTable objData = this.objProduct.getProductGroupIdUpperName();
        if(objData.Rows.Count > 0)
        {
            this.ddlProductGroup.DataSource = objData;
            this.ddlProductGroup.DataTextField = "Name";
            this.ddlProductGroup.DataValueField = "Id";
            this.ddlProductGroup.DataBind();
        }
    }
    #endregion

    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim() == "") return;
        if (upImage1.PostedFile.FileName != "")
            if (!saveImage1())
            {
                return;
            }

        float Price = 0;
        try{
            Price = Int32.Parse(this.txtPrice.Text);
        } catch {}

        float Discount = 0;
        try{
            Discount = Int32.Parse(this.txtDiscount.Text);
        } catch {}

        int GroupId = 0;
        try{
            GroupId = Int32.Parse(this.ddlProductGroup.SelectedValue.ToString());
        } catch {}

        int PartnerId = 0;
        int ret = this.objProduct.UpdateOrInsertAdvertProducTabletById(this.itemId, this.txtName.Text, Price, Discount, this.txtContent.Text, this.txtImage.Text, this.ckbBestSale.Checked, this.ckbVIP.Checked, this.ckbState.Checked,GroupId,PartnerId);
        if(ret > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this,this.GetType(), "msg", "confirm('Yêu cầu của quý khách được gửi đi thành công , Chúng tôi sẻ xem xét và trả lời bạn trong thời gian sớm nhất !'); ",true);
            txtName.Text = "";
            txtName.Enabled = false;
        }
    } 
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Bạn có muốn rồi đi không !'); ", true);
        Response.Redirect("MyProfile.aspx");
    } 
    #endregion

    #region method saveImage1
    private bool saveImage1()
    {
        string strBaseLoactionImg = "";
        try
        {
            strBaseLoactionImg = Server.MapPath(System.Configuration.ConfigurationSettings.AppSettings["PRODUCTIMAGE"].ToString());
            if (upImage1.PostedFile.ContentLength > 5048576)
            {
                return false;
            }
            else
            {
                string sFileName = "A" + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + "-" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second + DateTime.Now.Millisecond.ToString();
                string strEx = System.IO.Path.GetFileName(upImage1.PostedFile.FileName);
                strEx = strEx.Substring(strEx.LastIndexOf("."), strEx.Length - strEx.LastIndexOf("."));
                strBaseLoactionImg += sFileName + strEx;
                strBaseLoactionImg = strBaseLoactionImg.Replace("/", "\\");
                upImage1.PostedFile.SaveAs(strBaseLoactionImg);
                this.txtImage.Text = sFileName + strEx;
                this.lblImg1.Text = "<img width = \"125px\" height = \"100px\"  src = \"../Images/Products/" + sFileName + strEx + "\">";
                return true;
            }
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return false;
    }
    #endregion   
}