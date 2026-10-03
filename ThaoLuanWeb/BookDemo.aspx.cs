using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThaoLuanWeb.BUS;
using ThaoLuanWeb.DTO;

namespace ThaoLuanWeb
{
    public partial class BookDemo : Page
    {
        SachBUS sachBUS = new SachBUS();
        TheLoaiBUS theLoaiBUS = new TheLoaiBUS();
        DangNhapBUS dangNhapBUS = new DangNhapBUS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NapTheLoai();
                HienThiSach();
                CapNhatThongKe();
            }
        }

        private void NapTheLoai()
        {
            DataTable dt = theLoaiBUS.LayTatCaTheLoai();
            ddlMaLoai.DataSource = dt;
            ddlMaLoai.DataTextField = "TenLoai";
            ddlMaLoai.DataValueField = "MaLoai";
            ddlMaLoai.DataBind();

            ddlLocTheLoai.Items.Clear();
            ddlLocTheLoai.Items.Add(new ListItem("-- Tất cả thể loại --", ""));
            foreach (DataRow r in dt.Rows)
            {
                ddlLocTheLoai.Items.Add(new ListItem(r["TenLoai"].ToString(), r["MaLoai"].ToString()));
            }
        }

        private void HienThiSach()
        {
            DataTable dt = sachBUS.LayTatCaSach();
            gvSach.DataSource = dt;
            gvSach.DataBind();
        }

        private void CapNhatThongKe()
        {
            DataTable dtSach = sachBUS.LayTatCaSach();
            lblTongDauSach.Text = dtSach.Rows.Count.ToString();

            int tonKho = 0;
            foreach (DataRow r in dtSach.Rows)
            {
                if (r["SoLuong"] != DBNull.Value)
                    tonKho += Convert.ToInt32(r["SoLuong"]);
            }
            lblTongTonKho.Text = tonKho.ToString();

            DataTable dtLoai = theLoaiBUS.LayTatCaTheLoai();
            lblTongTheLoai.Text = dtLoai.Rows.Count.ToString();

            DataTable dtAdmin = dangNhapBUS.LayDanhSach();
            lblTongQuanTri.Text = dtAdmin.Rows.Count.ToString();
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            DataTable dt = sachBUS.LayTatCaSach();
            DataView dv = dt.DefaultView;
            string filter = "1=1";

            if (!string.IsNullOrEmpty(txtTimKiem.Text.Trim()))
            {
                filter += $" AND TenSach LIKE '%{txtTimKiem.Text.Trim()}%'";
            }

            if (!string.IsNullOrEmpty(ddlLocTheLoai.SelectedValue))
            {
                filter += $" AND MaLoai = '{ddlLocTheLoai.SelectedValue}'";
            }

            dv.RowFilter = filter;
            gvSach.DataSource = dv;
            gvSach.DataBind();
        }

        protected void btnTatCa_Click(object sender, EventArgs e)
        {
            txtTimKiem.Text = string.Empty;
            ddlLocTheLoai.SelectedIndex = 0;
            HienThiSach();
        }

        protected void gvSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvSach.SelectedRow;
            if (row != null)
            {
                txtMaSach.Value = HttpUtility.HtmlDecode(row.Cells[1].Text).Trim();
                txtTenSach.Text = HttpUtility.HtmlDecode(row.Cells[2].Text).Trim();
                txtTacGia.Text = HttpUtility.HtmlDecode(row.Cells[3].Text).Trim();

                string gia = HttpUtility.HtmlDecode(row.Cells[4].Text).Replace("đ", "").Replace(",", "").Trim();
                txtGia.Text = gia;

                txtSoLuong.Text = HttpUtility.HtmlDecode(row.Cells[5].Text).Trim();

                string maLoai = HttpUtility.HtmlDecode(row.Cells[8].Text).Trim();
                ListItem item = ddlMaLoai.Items.FindByValue(maLoai);
                if (item != null)
                {
                    ddlMaLoai.ClearSelection();
                    item.Selected = true;
                }

                string moTa = HttpUtility.HtmlDecode(row.Cells[9].Text).Trim();
                txtMoTa.Text = (moTa == "&nbsp;") ? "" : moTa;

                string script = $"if (CKEDITOR.instances['{txtMoTa.ClientID}']) {{ CKEDITOR.instances['{txtMoTa.ClientID}'].setData({HttpUtility.JavaScriptStringEncode(txtMoTa.Text, true)}); }}";
                ClientScript.RegisterStartupScript(this.GetType(), "LoadCKEditorData", script, true);
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            SachDTO s = new SachDTO();
            s.TenSach = txtTenSach.Text.Trim();
            s.TacGia = txtTacGia.Text.Trim();
            decimal gia = 0;
            decimal.TryParse(txtGia.Text.Trim(), out gia);
            s.Gia = gia;
            int soLuong = 0;
            int.TryParse(txtSoLuong.Text.Trim(), out soLuong);
            s.SoLuong = soLuong;
            s.MaLoai = ddlMaLoai.SelectedValue;
            s.MoTa = txtMoTa.Text;
            s.AnhSach = "default.jpg";

            if (fileUploadAnh.HasFile)
            {
                s.AnhSach = Path.GetFileName(fileUploadAnh.FileName);
                string thuMuc = Server.MapPath("~/Images/");
                if (!Directory.Exists(thuMuc)) Directory.CreateDirectory(thuMuc);
                fileUploadAnh.SaveAs(Path.Combine(thuMuc, s.AnhSach));
            }

            sachBUS.Them(s);
            HienThiSach();
            CapNhatThongKe();
            LamSachForm();
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaSach.Value)) return;

            SachDTO s = new SachDTO();
            s.MaSach = Convert.ToInt32(txtMaSach.Value);
            s.TenSach = txtTenSach.Text.Trim();
            s.TacGia = txtTacGia.Text.Trim();
            decimal gia = 0;
            decimal.TryParse(txtGia.Text.Trim(), out gia);
            s.Gia = gia;
            int soLuong = 0;
            int.TryParse(txtSoLuong.Text.Trim(), out soLuong);
            s.SoLuong = soLuong;
            s.MaLoai = ddlMaLoai.SelectedValue;
            s.MoTa = txtMoTa.Text;
            s.AnhSach = "default.jpg";

            if (fileUploadAnh.HasFile)
            {
                s.AnhSach = Path.GetFileName(fileUploadAnh.FileName);
                string thuMuc = Server.MapPath("~/Images/");
                if (!Directory.Exists(thuMuc)) Directory.CreateDirectory(thuMuc);
                fileUploadAnh.SaveAs(Path.Combine(thuMuc, s.AnhSach));
            }

            sachBUS.Sua(s);
            HienThiSach();
            CapNhatThongKe();
            LamSachForm();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaSach.Value)) return;
            sachBUS.Xoa(Convert.ToInt32(txtMaSach.Value));
            HienThiSach();
            CapNhatThongKe();
            LamSachForm();
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            LamSachForm();
        }

        private void LamSachForm()
        {
            txtMaSach.Value = string.Empty;
            txtTenSach.Text = string.Empty;
            txtTacGia.Text = string.Empty;
            txtGia.Text = string.Empty;
            txtSoLuong.Text = string.Empty;
            txtMoTa.Text = string.Empty;
            if (ddlMaLoai.Items.Count > 0) ddlMaLoai.SelectedIndex = 0;
            gvSach.SelectedIndex = -1;

            string script = $"if (CKEDITOR.instances['{txtMoTa.ClientID}']) {{ CKEDITOR.instances['{txtMoTa.ClientID}'].setData(''); }}";
            ClientScript.RegisterStartupScript(this.GetType(), "ClearCKEditorData", script, true);
        }
    }
}