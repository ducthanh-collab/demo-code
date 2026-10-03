<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UploadDemo.aspx.cs" Inherits="ThaoLuanWeb.UploadDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .khung-upload {
            padding: 10px;
        }

        .khung-upload h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
        }

        .dong-chon-file {
            margin-bottom: 15px;
        }

        .nhom-nut-tai {
            margin-bottom: 15px;
        }

        .nhom-nut-tai input {
            padding: 6px 15px;
            background-color: #2b579a;
            color: #fff;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        .thong-bao {
            font-weight: bold;
            color: green;
            margin-bottom: 15px;
            display: block;
        }

        .khung-hien-anh {
            border: 1px solid #ccc;
            padding: 5px;
            background: #fff;
            display: inline-block;
        }

        .khung-hien-anh img {
            max-width: 300px;
            height: auto;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung-upload">
        <h2>Thực hành Upload Hình Ảnh</h2>

        <div class="dong-chon-file">
            <asp:FileUpload ID="fileUploadAnh" runat="server" />
        </div>
        <div class="nhom-nut-tai">
            <asp:Button ID="btnUpload" runat="server" Text="Upload Ảnh" OnClick="btnUpload_Click" />
        </div>
        <asp:Label ID="lblThongBao" runat="server" CssClass="thong-bao"></asp:Label>

        <div class="khung-hien-anh">
            <asp:Image ID="imgKetQua" runat="server" Visible="false" />
        </div>
    </div>
</asp:Content>