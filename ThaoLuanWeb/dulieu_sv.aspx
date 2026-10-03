<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dulieu_sv.aspx.cs" Inherits="ThaoLuanWeb.dulieu_sv" %>

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
            <th colspan="2">TÍNH ĐIỂM SINH VIÊN</th>
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
            <td>Lớp</td>
            <td>
                <asp:DropDownList ID="ddlLop" runat="server" Width="120px">
                    <asp:ListItem Value="TT1Đ20">TT1Đ20</asp:ListItem>
                    <asp:ListItem Value="TT1Đ21">TT1Đ21</asp:ListItem>
                    <asp:ListItem Value="TT1Đ22">TT1Đ22</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Điểm lý thuyết</td>
            <td>
                <asp:TextBox ID="txtDiemLT" runat="server" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLT" runat="server" ControlToValidate="txtDiemLT" ErrorMessage="(*)" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvLT" runat="server" ControlToValidate="txtDiemLT" Type="Double" MinimumValue="0" MaximumValue="10" ErrorMessage="Điểm từ 0 đến 10" CssClass="error" Display="Dynamic"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>Điểm Thực hành</td>
            <td>
                <asp:TextBox ID="txtDiemTH" runat="server" Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTH" runat="server" ControlToValidate="txtDiemTH" ErrorMessage="(*)" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvTH" runat="server" ControlToValidate="txtDiemTH" Type="Double" MinimumValue="0" MaximumValue="10" ErrorMessage="Điểm từ 0 đến 10" CssClass="error" Display="Dynamic"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="btnThucHien" runat="server" Text="Thực hiện" OnClick="btnThucHien_Click" />
            </td>
        </tr>
    </table>
</asp:Content>