using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThaoLuanWeb
{
    public partial class dulieu_sv : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnThucHien_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string hoten = txtHoTen.Text;

                string namsinh = txtNamSinh.Text;
                DateTime ngaySinhVal;
                if (DateTime.TryParse(txtNamSinh.Text, out ngaySinhVal))
                {
                    namsinh = ngaySinhVal.ToString("dd/MM/yyyy");
                }

                string gioitinh = rblGioiTinh.SelectedValue;
                string lop = ddlLop.SelectedValue;
                double diemlt = Convert.ToDouble(txtDiemLT.Text);
                double diemth = Convert.ToDouble(txtDiemTH.Text);

                SinhVien sv = new SinhVien(hoten, namsinh, gioitinh, lop, diemlt, diemth);

                Session["SinhVienObj"] = sv;

                Response.Redirect("ketqua_sv.aspx");
            }
        }
    }
}