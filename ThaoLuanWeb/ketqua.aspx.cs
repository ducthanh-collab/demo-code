using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThaoLuanWeb
{
    public partial class ketqua : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["HoTen"] != null)
                {
                    txtHoTen.Text = Session["HoTen"].ToString();
                    txtNamSinh.Text = Session["NamSinh"].ToString();
                    txtGioiTinh.Text = Session["GioiTinh"].ToString();
                    txtChucVu.Text = Session["ChucVu"].ToString();
                    txtHeSoLuong.Text = Session["HeSoLuong"].ToString();
                    txtLuongCoBan.Text = Convert.ToDouble(Session["LuongCoBan"]).ToString("N0");
                    txtLuong.Text = Convert.ToDouble(Session["TongLuong"]).ToString("N0");
                }
            }
        }
        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("dulieu.aspx");
        }
    }
}