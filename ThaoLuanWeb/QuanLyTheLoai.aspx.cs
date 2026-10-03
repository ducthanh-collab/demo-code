using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThaoLuanWeb.BUS;
using ThaoLuanWeb.DTO;

namespace ThaoLuanWeb
{
    public partial class QuanLyTheLoai : Page
    {
        TheLoaiBUS theLoaiBUS = new TheLoaiBUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HienThiDanhSach();
            }
        }
        private void HienThiDanhSach()
        {
            gvTheLoai.DataSource = theLoaiBUS.LayTatCaTheLoai();
            gvTheLoai.DataBind();
        }
        protected void gvTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvTheLoai.SelectedRow;
            if (row != null)
            {
                txtMaLoai.Text = HttpUtility.HtmlDecode(row.Cells[1].Text).Trim();
                txtTenLoai.Text = HttpUtility.HtmlDecode(row.Cells[2].Text).Trim();
                txtMaLoai.ReadOnly = true;
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            TheLoaiDTO tl = new TheLoaiDTO();
            tl.MaLoai = txtMaLoai.Text.Trim();
            tl.TenLoai = txtTenLoai.Text.Trim();

            theLoaiBUS.Them(tl);
            HienThiDanhSach();
            LamSach();
        }
        protected void btnSua_Click(object sender, EventArgs e)
        {
            TheLoaiDTO tl = new TheLoaiDTO();
            tl.MaLoai = txtMaLoai.Text.Trim();
            tl.TenLoai = txtTenLoai.Text.Trim();

            theLoaiBUS.Sua(tl);
            HienThiDanhSach();
            LamSach();
        }
        protected void btnXoa_Click(object sender, EventArgs e)
        {
            theLoaiBUS.Xoa(txtMaLoai.Text.Trim());
            HienThiDanhSach();
            LamSach();
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            LamSach();
        }
        private void LamSach()
        {
            txtMaLoai.Text = string.Empty;
            txtTenLoai.Text = string.Empty;
            txtMaLoai.ReadOnly = false;
            gvTheLoai.SelectedIndex = -1;
        }
    }
}