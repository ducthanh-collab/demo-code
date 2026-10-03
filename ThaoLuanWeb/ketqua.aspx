<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ketqua.aspx.cs" Inherits="ThaoLuanWeb.ketqua" %>

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
            <th colspan="2">TÍNH LƯƠNG NHÂN VIÊN</th>
        </tr>
        <tr>
            <td style="width: 30%;">Họ và tên</td>
            <td><asp:TextBox ID="txtHoTen" runat="server" Width="300px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Năm sinh</td>
            <td><asp:TextBox ID="txtNamSinh" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Giới tính</td>
            <td><asp:TextBox ID="txtGioiTinh" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Chức vụ</td>
            <td><asp:TextBox ID="txtChucVu" runat="server" Width="100px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Hệ số lương</td>
            <td><asp:TextBox ID="txtHeSoLuong" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Lương cơ bản</td>
            <td><asp:TextBox ID="txtLuongCoBan" runat="server" Width="200px" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Lương</td>
            <td><asp:TextBox ID="txtLuong" runat="server" Width="200px" ReadOnly="true" Font-Bold="true" ForeColor="Red"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="btnQuayLai" runat="server" Text="Quay lại" OnClick="btnQuayLai_Click" Width="80px" />
            </td>
        </tr>
    </table>
</asp:Content>