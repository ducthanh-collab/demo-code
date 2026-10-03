using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThaoLuanWeb
{
    public partial class ViewStateDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ViewState["TenNguoiDung"] != null)
                {
                    lblKetQua.Text = ViewState["TenNguoiDung"].ToString();
                }
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            ViewState["TenNguoiDung"] = txtTen.Text;
            lblKetQua.Text = ViewState["TenNguoiDung"].ToString();
        }
    }
}