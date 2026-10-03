using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;

namespace ThaoLuanWeb
{
    public partial class StudentDemo : Page
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
            List<Student> danhSach = new List<Student>
    {
        new Student(1, "Hoàng Dũng", "hoangdung@example.com", "~/Images/hoangdung.jpg"),
        new Student(2, "Soobin Hoàng Sơn", "soobin@example.com", "~/Images/soobin.jpg"),
        new Student(3, "Thái Học", "thaihoc@example.com", "~/Images/thaihoc.jpg")
    };

            ViewState["DanhSachSV"] = danhSach;
            HienThiDuLieu();
        }

        private void HienThiDuLieu()
        {
            if (ViewState["DanhSachSV"] != null)
            {
                List<Student> danhSach = (List<Student>)ViewState["DanhSachSV"];
                gvSinhVien.DataSource = danhSach;
                gvSinhVien.DataBind();
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (ViewState["DanhSachSV"] != null)
            {
                List<Student> danhSach = (List<Student>)ViewState["DanhSachSV"];

                int idMoi = danhSach.Count + 1;
                string hoTen = txtHoTen.Text;
                string email = txtEmail.Text;
                string duongDanAnh = "~/Images/book-gold.jpg";

                if (fileUploadAnh.HasFile)
                {
                    string tenFile = Path.GetFileName(fileUploadAnh.FileName);
                    string duongDanLuu = Server.MapPath("~/Images/" + tenFile);
                    fileUploadAnh.SaveAs(duongDanLuu);
                    duongDanAnh = "~/Images/" + tenFile;
                }

                Student svMoi = new Student(idMoi, hoTen, email, duongDanAnh);
                danhSach.Add(svMoi);

                ViewState["DanhSachSV"] = danhSach;
                HienThiDuLieu();

                txtHoTen.Text = "";
                txtEmail.Text = "";
            }
        }
    }
}