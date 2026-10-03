using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThaoLuanWeb
{
    public partial class ketqua_sv : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SinhVienObj"] != null)
                {
                    SinhVien sv = (SinhVien)Session["SinhVienObj"];

                    txtHoTen.Text = sv.GetHoTen();
                    txtNamSinh.Text = sv.GetNamSinh();
                    txtGioiTinh.Text = sv.GetGioiTinh();
                    txtLop.Text = sv.GetLop();
                    txtDiemLT.Text = sv.GetDiemLyThuyet().ToString();
                    txtDiemTH.Text = sv.GetDiemThucHanh().ToString();

                    txtDiemTB.Text = sv.TinhDiemTB().ToString("0.00");
                    txtXepLoai.Text = sv.XepLoai();
                }
            }
        }
        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("dulieu_sv.aspx");
        }
    }
}