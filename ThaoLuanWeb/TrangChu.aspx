<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookDemo.aspx.cs" Inherits="ThaoLuanWeb.BookDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .khung-quan-ly-sach {
            padding: 5px;
        }

        .khung-quan-ly-sach h2 {
            text-align: center;
            font-size: 22px;
            color: #2c3e50;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .bang-nhap-lieu {
            width: 100%;
            margin-bottom: 20px;
        }

        .bang-nhap-lieu td {
            padding: 8px 10px;
            font-size: 14px;
            vertical-align: top;
        }

        .bang-nhap-lieu input[type="text"], 
        .bang-nhap-lieu select, 
        .bang-nhap-lieu textarea {
            width: 100%;
            padding: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .nhom-nut-lenh {
            text-align: center;
            margin-bottom: 25px;
        }

        .nhom-nut-lenh input {
            padding: 8px 20px;
            margin-right: 8px;
            font-weight: bold;
            cursor: pointer;
            background-color: #2980b9;
            color: #fff;
            border: none;
            border-radius: 4px;
        }

        .nhom-nut-lenh input:hover {
            background-color: #1abc9c;
        }

        .bang-du-lieu {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            margin-top: 10px;
        }

        .bang-du-lieu th {
            background-color: #2980b9;
            color: #fff;
            padding: 10px 8px;
            border: 1px solid #ddd;
            font-size: 13px;
            text-align: center;
        }

        .bang-du-lieu td {
            padding: 8px;
            border: 1px solid #ddd;
            font-size: 13px;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung-quan-ly-sach">
        <h2>QUẢN LÝ SÁCH</h2>

        <!-- Ô ẩn chứa mã sách để phục vụ sửa/xóa -->
        <asp:HiddenField ID="txtMaSach" runat="server" />

        <table class="bang-nhap-lieu">
            <tr>
                <td style="width: 12%;">Tên sách:</td>
                <td style="width: 38%;"><asp:TextBox ID="txtTenSach" runat="server"></asp:TextBox></td>
                <td style="width: 12%;">Tác giả:</td>
                <td style="width: 38%;"><asp:TextBox ID="txtTacGia" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Giá:</td>
                <td><asp:TextBox ID="txtGia" runat="server"></asp:TextBox></td>
                <td>Số lượng:</td>
                <td><asp:TextBox ID="txtSoLuong" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Mô tả:</td>
                <td><asp:TextBox ID="txtMoTa" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox></td>
                <td>Ảnh sách:</td>
                <td>
                    <asp:FileUpload ID="fileUploadAnh" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Mã loại:</td>
                <td>
                    <asp:DropDownList ID="ddlMaLoai" runat="server">
                        <asp:ListItem Value="Khoa hoc">Khoa học</asp:ListItem>
                        <asp:ListItem Value="Cong nghệ">Công nghệ</asp:ListItem>
                        <asp:ListItem Value="Van hoc">Văn học</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td colspan="2"></td>
            </tr>
        </table>

        <div class="nhom-nut-lenh">
            <asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
            <asp:Button ID="btnSua" runat="server" Text="Sửa" OnClick="btnSua_Click" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" OnClick="btnXoa_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
        </div>

        <asp:GridView ID="gvSach" runat="server" CssClass="bang-du-lieu" AutoGenerateColumns="False" OnSelectedIndexChanged="gvSach_SelectedIndexChanged">
            <Columns>
                <asp:ButtonField CommandName="Select" Text="Chọn" HeaderText="Thao tác" ControlStyle-ForeColor="#2980b9" >
<ControlStyle ForeColor="#2980B9"></ControlStyle>
                </asp:ButtonField>
                <asp:BoundField DataField="MaSach" HeaderText="Mã sách" />
                <asp:BoundField DataField="TenSach" HeaderText="Tên sách" />
                <asp:BoundField DataField="TacGia" HeaderText="Tác giả" />
                <asp:BoundField DataField="Gia" HeaderText="Giá" DataFormatString="{0:N0} đ" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                <asp:BoundField DataField="AnhSach" HeaderText="Tên file ảnh" />
                <asp:BoundField DataField="MaLoai" HeaderText="Mã loại" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>