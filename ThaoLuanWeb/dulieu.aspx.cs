using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThaoLuanWeb
{
    public partial class dulieu : System.Web.UI.Page
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
                string chucvu = ddlChucVu.SelectedValue;
                double hesoluong = Convert.ToDouble(txtHeSoLuong.Text);
                double luongcoban = Convert.ToDouble(txtLuongCoBan.Text);

                double luong = hesoluong * luongcoban;

                Session["HoTen"] = hoten;
                Session["NamSinh"] = namsinh;
                Session["GioiTinh"] = gioitinh;
                Session["ChucVu"] = chucvu;
                Session["HeSoLuong"] = hesoluong;
                Session["LuongCoBan"] = luongcoban;
                Session["TongLuong"] = luong;

                Response.Redirect("ketqua.aspx");
            }
        }
    }
}