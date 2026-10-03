using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System .Data;
using System.Data.SqlClient;
namespace ThaoLuanWeb
{
    public class KetNoi1
    {public SqlDataAdapter da;

        public SqlConnection con;
        public SqlCommand cmd;
        public string chuoikn= @"Data Source=DESKTOP-6M7L2G0;Initial Catalog=QLBanHang;Integrated Security=True";   
        public void openKetNoi()
        {
            con = new SqlConnection(chuoikn);
            con.Open();
        }
        public void closeKetNoi()
        {
            con.Close();
        }
        public DataTable gettable(string sql)
        {
           cmd = new SqlCommand(sql, con);
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        //Các lệnh insert, update, delete   
        public void thucthi(string sql)
            {
                cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
        }
    }
}