<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="QuanLyNguoiDung.aspx.cs" Inherits="ThaoLuanWeb.QuanLyNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .khung-quan-ly {
            padding: 10px;
        }

        .tieu-de-trang {
            text-align: center;
            font-size: 22px;
            color: #1e3799;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .bang-nhap-du-lieu {
            width: 100%;
            margin-bottom: 15px;
        }

        .bang-nhap-du-lieu td {
            padding: 8px 10px;
            font-size: 14px;
        }

        .bang-nhap-du-lieu input[type="text"],
        .bang-nhap-du-lieu input[type="password"] {
            width: 100%;
            padding: 7px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .hang-nut-bam {
            text-align: center;
            margin: 20px 0;
        }
        .nut-chuc-nang {
            padding: 8px 22px;
            margin-right: 8px;
            font-weight: bold;
            cursor: pointer;
            background-color: #1e3799;
            color: #ffffff;
            border: none;
            border-radius: 4px;
        }
        .nut-chuc-nang:hover {
            background-color: #4a69bd;
        }
        .bang-hien-thi {
            width: 100%;
            border-collapse: collapse;
            background: #ffffff;
            margin-top: 15px;
        }
        .bang-hien-thi th {
            background-color: #1e3799;
            color: #ffffff;
            padding: 10px 8px;
            border: 1px solid #ddd;
            font-size: 13px;
            text-align: center;
        }
        .bang-hien-thi td {
            padding: 8px;
            border: 1px solid #ddd;
            font-size: 13px;
            text-align: center;
        }
        .bang-hien-thi a {
            color: #1e3799;
            font-weight: bold;
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung-quan-ly">
        <h2 class="tieu-de-trang">QUẢN LÝ NGƯỜI DÙNG</h2>

        <table class="bang-nhap-du-lieu">
            <tr>
                <td style="width: 12%;">Tài khoản:</td>
                <td style="width: 21%;"><asp:TextBox ID="txtTaiKhoan" runat="server"></asp:TextBox></td>
                <td style="width: 12%;">Mật khẩu:</td>
                <td style="width: 21%;"><asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password"></asp:TextBox></td>
                <td style="width: 12%;">Họ tên:</td>
                <td style="width: 22%;"><asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <div class="hang-nut-bam">
            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="nut-chuc-nang" OnClick="btnThem_Click" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="nut-chuc-nang" OnClick="btnXoa_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="nut-chuc-nang" OnClick="btnHuy_Click" />
        </div>

        <asp:GridView ID="gvNguoiDung" runat="server" CssClass="bang-hien-thi" AutoGenerateColumns="False" OnSelectedIndexChanged="gvNguoiDung_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Chọn" HeaderText="Thao tác" />
                <asp:BoundField DataField="TaiKhoan" HeaderText="Tài khoản" />
                <asp:BoundField DataField="HoTen" HeaderText="Họ và tên" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>