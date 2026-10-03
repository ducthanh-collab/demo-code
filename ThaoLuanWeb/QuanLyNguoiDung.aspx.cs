using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThaoLuanWeb.BUS;
using ThaoLuanWeb.DTO;

namespace ThaoLuanWeb
{
    public partial class QuanLyNguoiDung : Page
    {
        DangNhapBUS dangNhapBUS = new DangNhapBUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HienThiDanhSach();
            }
        }
        private void HienThiDanhSach()
        {
            gvNguoiDung.DataSource = dangNhapBUS.LayDanhSach();
            gvNguoiDung.DataBind();
        }
        protected void gvNguoiDung_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvNguoiDung.SelectedRow;
            if (row != null)
            {
                txtTaiKhoan.Text = HttpUtility.HtmlDecode(row.Cells[1].Text).Trim();
                txtHoTen.Text = HttpUtility.HtmlDecode(row.Cells[2].Text).Trim();
                txtTaiKhoan.ReadOnly = true;
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            DangNhapDTO nd = new DangNhapDTO();
            nd.TaiKhoan = txtTaiKhoan.Text.Trim();
            nd.MatKhau = txtMatKhau.Text.Trim();
            nd.HoTen = txtHoTen.Text.Trim();

            dangNhapBUS.Them(nd);
            HienThiDanhSach();
            LamSach();
        }
        protected void btnXoa_Click(object sender, EventArgs e)
        {
            dangNhapBUS.Xoa(txtTaiKhoan.Text.Trim());
            HienThiDanhSach();
            LamSach();
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            LamSach();
        }
        private void LamSach()
        {
            txtTaiKhoan.Text = string.Empty;
            txtMatKhau.Text = string.Empty;
            txtHoTen.Text = string.Empty;
            txtTaiKhoan.ReadOnly = false;
            gvNguoiDung.SelectedIndex = -1;
        }
    }
}