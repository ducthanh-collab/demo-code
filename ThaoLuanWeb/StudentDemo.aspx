<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentDemo.aspx.cs" Inherits="ThaoLuanWeb.StudentDemo" %>

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
            vertical-align: middle;
        }

        .anh-dai-dien {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="khung-quan-ly">
        <h2>Thêm sinh viên mới</h2>

        <div class="nhom-nhap">
            <label>Họ tên *</label>
            <asp:TextBox ID="txtHoTen" runat="server" placeholder="Nhập họ tên sinh viên"></asp:TextBox>
        </div>

        <div class="nhom-nhap">
            <label>Email *</label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Nhập địa chỉ email"></asp:TextBox>
        </div>

        <div class="nhom-nhap">
            <label>Ảnh đại diện *</label>
            <asp:FileUpload ID="fileUploadAnh" runat="server" />
        </div>

        <div class="nut-them">
            <asp:Button ID="btnThem" runat="server" Text="Thêm sinh viên" OnClick="btnThem_Click" />
        </div>

        <h2>Danh sách sinh viên</h2>
        <asp:GridView ID="gvSinhVien" runat="server" CssClass="bang-du-lieu" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Họ tên" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:TemplateField HeaderText="Ảnh đại diện">
                    <ItemTemplate>
                        <asp:Image ID="imgAvatar" runat="server" ImageUrl='<%# Eval("ImagePath") %>' CssClass="anh-dai-dien" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>