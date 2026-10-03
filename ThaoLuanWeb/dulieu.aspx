<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dulieu.aspx.cs" Inherits="ThaoLuanWeb.dulieu" %>

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
        .error {
            color: red;
            font-size: 12px;
            margin-left: 5px;
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
            <td>
                <asp:TextBox ID="txtHoTen" runat="server" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvHoTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="(*)" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Năm sinh</td>
            <td>
                <asp:TextBox ID="txtNamSinh" runat="server" Width="180px" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNamSinh" runat="server" ControlToValidate="txtNamSinh" ErrorMessage="(*)" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Giới tính</td>
            <td>
                <asp:RadioButtonList ID="rblGioiTinh" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="Nam">Nam</asp:ListItem>
                    <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>Chức vụ</td>
            <td>
                <asp:DropDownList ID="ddlChucVu" runat="server" Width="100px">
                    <asp:ListItem Value="GĐ">GĐ</asp:ListItem>
                    <asp:ListItem Value="TP">TP</asp:ListItem>
                    <asp:ListItem Value="NV">NV</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Hệ số lương</td>
            <td>
                <asp:TextBox ID="txtHeSoLuong" runat="server" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvHSL" runat="server" ControlToValidate="txtHeSoLuong" ErrorMessage="(*)" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvHSL" runat="server" ControlToValidate="txtHeSoLuong" Type="Double" MinimumValue="2.34" MaximumValue="4.98" ErrorMessage="Hệ số lương từ 2.34 đến 4.98" CssClass="error" Display="Dynamic"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>Lương cơ bản</td>
            <td>
                <asp:TextBox ID="txtLuongCoBan" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLCB" runat="server" ControlToValidate="txtLuongCoBan" ErrorMessage="(*)" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revLCB" runat="server" ControlToValidate="txtLuongCoBan" ValidationExpression="^\d{9}$" ErrorMessage="Lương cơ bản phải là số và đúng 9 chữ số" CssClass="error" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="btnThucHien" runat="server" Text="Thực hiện" OnClick="btnThucHien_Click" />
            </td>
        </tr>
    </table>
</asp:Content>