<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ketqua_sv.aspx.cs" Inherits="ThaoLuanWeb.ketqua_sv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .table-form {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border: 1px solid #000;
        }
        .table-form th {
            background-color: #00ff66;
            color: #000;
            text-align: center;
            padding: 8px;
            font-size: 15px;
            border: 1px solid #000;
        }
        .table-form td {
            padding: 6px 10px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table-form">
        <tr>
            <th colspan="2">TÍNH ĐIỂM SINH VIÊN</th>
        </tr>
        <tr>
            <td style="width: 30%;">Họ và tên</td>
            <td><asp:TextBox ID="txtHoTen" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Năm sinh</td>
            <td><asp:TextBox ID="txtNamSinh" runat="server" Width="180px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Giới tính</td>
            <td><asp:TextBox ID="txtGioiTinh" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Lớp</td>
            <td><asp:TextBox ID="txtLop" runat="server" Width="120px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Điểm lý thuyết</td>
            <td><asp:TextBox ID="txtDiemLT" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Điểm Thực hành</td>
            <td><asp:TextBox ID="txtDiemTH" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Điểm TH (Trung bình)</td>
            <td><asp:TextBox ID="txtDiemTB" runat="server" Width="150px" ReadOnly="true" Font-Bold="true" ForeColor="Blue"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Xếp loại</td>
            <td><asp:TextBox ID="txtXepLoai" runat="server" Width="150px" ReadOnly="true" Font-Bold="true" ForeColor="Red"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="btnQuayLai" runat="server" Text="Quay lại" OnClick="btnQuayLai_Click" Width="80px" />
            </td>
        </tr>
    </table>
</asp:Content>