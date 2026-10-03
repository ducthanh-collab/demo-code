using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThaoLuanWeb
{
    public class SinhVien
    {
        private string hoTen;
        private string namSinh;
        private string gioiTinh;
        private string lop;
        private double diemLyThuyet;
        private double diemThucHanh;
        public SinhVien()
        {
        }
        public SinhVien(string ht, string ns, string gt, string l, double lt, double th)
        {
            hoTen = ht;
            namSinh = ns;
            gioiTinh = gt;
            lop = l;
            diemLyThuyet = lt;
            diemThucHanh = th;
        }
        public string GetHoTen() { return hoTen; }
        public void SetHoTen(string value) { hoTen = value; }

        public string GetNamSinh() { return namSinh; }
        public void SetNamSinh(string value) { namSinh = value; }

        public string GetGioiTinh() { return gioiTinh; }
        public void SetGioiTinh(string value) { gioiTinh = value; }

        public string GetLop() { return lop; }
        public void SetLop(string value) { lop = value; }

        public double GetDiemLyThuyet() { return diemLyThuyet; }
        public void SetDiemLyThuyet(double value) { diemLyThuyet = value; }

        public double GetDiemThucHanh() { return diemThucHanh; }
        public void SetDiemThucHanh(double value) { diemThucHanh = value; }

        public double TinhDiemTB()
        {
            return (diemLyThuyet * 0.4) + (diemThucHanh * 0.6);
        }

        public string XepLoai()
        {
            double dtb = TinhDiemTB();
            if (dtb >= 8.5)
            {
                return "Giỏi";
            }
            else if (dtb >= 7.0)
            {
                return "Khá";
            }
            else if (dtb >= 5.0)
            {
                return "Trung bình";
            }
            else
            {
                return "Yếu";
            }
        }
    }
}