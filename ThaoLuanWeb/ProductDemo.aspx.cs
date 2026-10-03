using System;
using System.Collections.Generic;
using System.Web.UI;

namespace ThaoLuanWeb
{
    public partial class ProductDemo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KhoiTaoDuLieuMau();
            }
        }
        private void KhoiTaoDuLieuMau()
        {
            List<Product> danhSach = new List<Product>
            {
                new Product(1, "iPhone 15", 19999000, "Điện thoại"),
                new Product(2, "MacBook Air M2", 24999000, "Laptop"),
                new Product(3, "AirPods Pro 2", 5990000, "Phụ kiện")
            };

            ViewState["DanhSachSP"] = danhSach;
            HienThiDuLieu();
        }

        private void HienThiDuLieu()
        {
            if (ViewState["DanhSachSP"] != null)
            {
                List<Product> danhSach = (List<Product>)ViewState["DanhSachSP"];
                gvSanPham.DataSource = danhSach;
                gvSanPham.DataBind();
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (ViewState["DanhSachSP"] != null)
            {
                List<Product> danhSach = (List<Product>)ViewState["DanhSachSP"];

                int id = Convert.ToInt32(txtID.Text);
                string ten = txtTen.Text;
                decimal gia = Convert.ToDecimal(txtGia.Text);
                string danhmuc = txtDanhMuc.Text;

                Product spMoi = new Product(id, ten, gia, danhmuc);
                danhSach.Add(spMoi);

                ViewState["DanhSachSP"] = danhSach;
                HienThiDuLieu();

                txtID.Text = "";
                txtTen.Text = "";
                txtGia.Text = "";
                txtDanhMuc.Text = "";
            }
        }
    }
}