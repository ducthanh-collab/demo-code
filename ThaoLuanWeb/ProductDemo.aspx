<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductDemo.aspx.cs" Inherits="ThaoLuanWeb.ProductDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .khung-quan-ly {
            padding: 10px;
        }

        .khung-quan-ly h2 {
            font-size: 20px;
            color: #333;
            margin-bottom: 15px;
        }

        .nhom-nhap {
            margin-bottom: 12px;
        }

        .nhom-nhap label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
        }

        .nhom-nhap input[type="text"] {
            width: 400px;
            padding: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .nut-them {
            margin-bottom: 20px;
        }

        .nut-them input {
            padding: 8px 15px;
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            font-weight: bold;
            font-size: 14px;
        }

        .bang-du-lieu {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background: #fff;
        }

        .bang-du-lieu th {
            background-color: #0056b3;
            color: #fff;
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
            font-size: 14px;
        }

        .bang-du-lieu td {
            padding: 8px;
            border: 1px solid #ddd;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung-quan-ly">
        <h2>Nhập thông tin sản phẩm</h2>

        <div class="nhom-nhap">
            <label>Mã sản phẩm:</label>
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        </div>

        <div class="nhom-nhap">
            <label>Tên sản phẩm:</label>
            <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
        </div>

        <div class="nhom-nhap">
            <label>Giá sản phẩm:</label>
            <asp:TextBox ID="txtGia" runat="server"></asp:TextBox>
        </div>

        <div class="nhom-nhap">
            <label>Danh mục:</label>
            <asp:TextBox ID="txtDanhMuc" runat="server"></asp:TextBox>
        </div>

        <div class="nut-them">
            <asp:Button ID="btnThem" runat="server" Text="Thêm sản phẩm" OnClick="btnThem_Click" />
        </div>

        <h2>Danh sách sản phẩm</h2>
        <asp:GridView ID="gvSanPham" runat="server" CssClass="bang-du-lieu" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:N0} đ" />
                <asp:BoundField DataField="Category" HeaderText="Category" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>