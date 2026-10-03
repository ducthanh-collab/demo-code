using System;
using System.IO;
using System.Web.UI;

namespace ThaoLuanWeb
{
    public partial class UploadDemo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
         
            if (fileUploadAnh.HasFile)
            {
      
                string duoiFile = Path.GetExtension(fileUploadAnh.FileName).ToLower();

                if (duoiFile == ".jpg" || duoiFile == ".jpeg" || duoiFile == ".png" || duoiFile == ".gif")
                {
                    try
                    {
                        
                        string tenFile = Path.GetFileName(fileUploadAnh.FileName);

                       
                        string duongDanLuu = Server.MapPath("~/Images/" + tenFile);

                  
                        fileUploadAnh.SaveAs(duongDanLuu);

                      
                        lblThongBao.Text = "Upload thành công!";
                        lblThongBao.ForeColor = System.Drawing.Color.Green;

                    
                        imgKetQua.ImageUrl = "~/Images/" + tenFile;
                        imgKetQua.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        lblThongBao.Text = "Lỗi khi lưu file: " + ex.Message;
                        lblThongBao.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblThongBao.Text = "Chỉ cho phép upload file ảnh (.jpg, .jpeg, .png, .gif)!";
                    lblThongBao.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblThongBao.Text = "Vui lòng chọn một file ảnh trước khi bấm Upload!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}