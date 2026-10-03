<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewStateDemo.aspx.cs" Inherits="ThaoLuanWeb.ViewStateDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .khung-chua {
            padding: 20px;
            background: #fff;
            border: 1px solid #ddd;
        }

        .khung-chua h2 {
            font-size: 26px;
            font-weight: bold;
            color: #111;
            margin-bottom: 5px;
        }

        .khung-chua p {
            color: #0056b3;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .dong-nhap-lieu {
            margin-bottom: 15px;
        }

        .dong-nhap-lieu label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .dong-nhap-lieu input[type="text"] {
            width: 400px;
            padding: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .nhom-nut-bam {
            margin-bottom: 20px;
        }

        .nhom-nut-bam input {
            padding: 8px 15px;
            background-color: #1d6fa5;
            color: #fff;
            border: none;
            cursor: pointer;
            font-weight: bold;
            margin-right: 10px;
        }

        .vung-ket-qua {
            font-weight: bold;
            color: #002752;
            font-size: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung-chua">
        <h2>Thực hành ViewState</h2>
        <p>ASP.NET WebForms</p>

        <div class="dong-nhap-lieu">
            <label>Nhập tên của bạn:</label>
            <asp:TextBox ID="txtTen" runat="server" placeholder="Nhập tên của bạn..."></asp:TextBox>
        </div>

        <div class="nhom-nut-bam">
            <asp:Button ID="btnLuu" runat="server" Text="Lưu vào ViewState" OnClick="btnLuu_Click" />
            <asp:Button ID="btnPostback" runat="server" Text="Chỉ Postback" />
        </div>

        <div class="vung-ket-qua">
            Giá trị lấy từ ViewState: <asp:Label ID="lblKetQua" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>