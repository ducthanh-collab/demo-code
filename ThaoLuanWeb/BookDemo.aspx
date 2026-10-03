<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookDemo.aspx.cs" Inherits="ThaoLuanWeb.BookDemo" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <style>
        .luoi-thong-ke {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-bottom: 25px;
        }

        .the-thong-ke {
            border-radius: 8px;
            padding: 16px 20px;
            color: #ffffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.06);
        }

        .the-xanh-duong { background: linear-gradient(135deg, #1e3799, #4a69bd); }
        .the-xanh-la { background: linear-gradient(135deg, #079992, #38ada9); }
        .the-cam { background: linear-gradient(135deg, #e55039, #eb2f06); }
        .the-tim { background: linear-gradient(135deg, #6c5ce7, #a29bfe); }

        .chi-so-thong-ke h3 {
            font-size: 26px;
            font-weight: 700;
            margin: 0 0 4px 0;
        }

        .chi-so-thong-ke p {
            font-size: 13px;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            opacity: 0.9;
        }

        .bieu-tuong-thong-ke i {
            font-size: 36px;
            opacity: 0.35;
        }

        .khung-chuc-nang {
            background: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 22px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
        }

        .tieu-de-khung {
            font-size: 15px;
            font-weight: 700;
            color: #2c3e50;
            text-transform: uppercase;
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            gap: 10px;
            border-bottom: 2px solid #f1f2f6;
            padding-bottom: 10px;
        }

        .tieu-de-khung i {
            color: #1e3799;
        }

        .thanh-tim-kiem {
            display: flex;
            gap: 12px;
            margin-bottom: 18px;
            background: #f8f9fa;
            padding: 12px 15px;
            border-radius: 6px;
            border: 1px solid #edf2f7;
            align-items: center;
        }

        .bang-nhap-lieu {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        .bang-nhap-lieu td {
            padding: 4px 8px;
            font-size: 13px;
            font-weight: 600;
            color: #495057;
            vertical-align: top;
        }

        .o-nhap-lieu, 
        .hop-chon-lua {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 13px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.2s;
        }

        .o-nhap-lieu:focus, 
        .hop-chon-lua:focus {
            border-color: #1e3799;
            box-shadow: 0 0 0 2px rgba(30, 55, 153, 0.15);
        }

        .cum-nut-bam {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }

        .nut-bam {
            padding: 8px 24px;
            font-size: 13px;
            font-weight: 700;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .nut-them { background-color: #1e3799; color: #ffffff; }
        .nut-them:hover { background-color: #0c2461; }

        .nut-sua { background-color: #079992; color: #ffffff; }
        .nut-sua:hover { background-color: #006266; }

        .nut-xoa { background-color: #b71540; color: #ffffff; }
        .nut-xoa:hover { background-color: #6a0d24; }

        .nut-huy { background-color: #636e72; color: #ffffff; }
        .nut-huy:hover { background-color: #2d3436; }

        .bang-hien-thi {
            width: 100%;
            border-collapse: collapse;
            background: #ffffff;
            border-radius: 6px;
            overflow: hidden;
        }

        .bang-hien-thi th {
            background-color: #1e3799;
            color: #ffffff;
            padding: 12px 10px;
            font-size: 13px;
            font-weight: 600;
            text-align: center;
            border: 1px solid #2948b8;
        }

        .bang-hien-thi td {
            padding: 10px;
            border: 1px solid #e9ecef;
            font-size: 13px;
            text-align: center;
            vertical-align: middle;
        }

        .bang-hien-thi tr:hover {
            background-color: #f8faff;
        }

        .the-phan-loai {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
            background-color: #e8f0fe;
            color: #1e3799;
        }

        .khung-cuon-mota {
            max-width: 320px;
            max-height: 100px;
            overflow-y: auto;
            text-align: left !important;
            padding-right: 6px;
            font-size: 12px;
            line-height: 1.5;
            color: #333;
        }

        .anh-thu-nho {
            width: 60px;
            height: 75px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #dee2e6;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            display: block;
            margin: 0 auto;
        }

        .an-cot {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Khối thẻ thống kê -->
    <div class="luoi-thong-ke">
        <div class="the-thong-ke the-xanh-duong">
            <div class="chi-so-thong-ke">
                <h3><asp:Label ID="lblTongDauSach" runat="server" Text="0"></asp:Label></h3>
                <p>Tổng đầu sách</p>
            </div>
            <div class="bieu-tuong-thong-ke"><i class="fa-solid fa-book"></i></div>
        </div>
        <div class="the-thong-ke the-xanh-la">
            <div class="chi-so-thong-ke">
                <h3><asp:Label ID="lblTongTonKho" runat="server" Text="0"></asp:Label></h3>
                <p>Tổng tồn kho</p>
            </div>
            <div class="bieu-tuong-thong-ke"><i class="fa-solid fa-boxes-stacked"></i></div>
        </div>
        <div class="the-thong-ke the-cam">
            <div class="chi-so-thong-ke">
                <h3><asp:Label ID="lblTongTheLoai" runat="server" Text="0"></asp:Label></h3>
                <p>Số thể loại</p>
            </div>
            <div class="bieu-tuong-thong-ke"><i class="fa-solid fa-layer-group"></i></div>
        </div>
        <div class="the-thong-ke the-tim">
            <div class="chi-so-thong-ke">
                <h3><asp:Label ID="lblTongQuanTri" runat="server" Text="0"></asp:Label></h3>
                <p>Quản trị viên</p>
            </div>
            <div class="bieu-tuong-thong-ke"><i class="fa-solid fa-user-shield"></i></div>
        </div>
    </div>

    <!-- Khung nhập dữ liệu -->
    <div class="khung-chuc-nang">
        <div class="tieu-de-khung">
            <i class="fa-solid fa-pen-to-square"></i> Cập nhật thông tin sách
        </div>

        <asp:HiddenField ID="txtMaSach" runat="server" />

        <table class="bang-nhap-lieu">
            <tr>
                <td style="width: 12%;">Tên sách:</td>
                <td style="width: 38%;"><asp:TextBox ID="txtTenSach" runat="server" CssClass="o-nhap-lieu"></asp:TextBox></td>
                <td style="width: 12%;">Tác giả:</td>
                <td style="width: 38%;"><asp:TextBox ID="txtTacGia" runat="server" CssClass="o-nhap-lieu"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Giá bán:</td>
                <td><asp:TextBox ID="txtGia" runat="server" CssClass="o-nhap-lieu"></asp:TextBox></td>
                <td>Số lượng:</td>
                <td><asp:TextBox ID="txtSoLuong" runat="server" CssClass="o-nhap-lieu"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Thể loại:</td>
                <td><asp:DropDownList ID="ddlMaLoai" runat="server" CssClass="hop-chon-lua"></asp:DropDownList></td>
                <td>Ảnh bìa:</td>
                <td><asp:FileUpload ID="fileUploadAnh" runat="server" CssClass="o-nhap-lieu" /></td>
            </tr>
            <tr>
                <td>Mô tả chi tiết:</td>
                <td colspan="3">
                    <asp:TextBox ID="txtMoTa" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </td>
            </tr>
        </table>

        <div class="cum-nut-bam">
            <asp:Button ID="btnThem" runat="server" Text="Thêm mới" CssClass="nut-bam nut-them" OnClick="btnThem_Click" />
            <asp:Button ID="btnSua" runat="server" Text="Lưu sửa" CssClass="nut-bam nut-sua" OnClick="btnSua_Click" />
            <asp:Button ID="btnXoa" runat="server" Text="Xóa dòng" CssClass="nut-bam nut-xoa" OnClick="btnXoa_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Làm mới" CssClass="nut-bam nut-huy" OnClick="btnHuy_Click" />
        </div>
    </div>

    <!-- Khung bảng danh sách và tìm kiếm -->
    <div class="khung-chuc-nang">
        <div class="tieu-de-khung">
            <i class="fa-solid fa-list-check"></i> Danh mục sách trong kho
        </div>

        <div class="thanh-tim-kiem">
            <span style="font-size: 13px; font-weight: 600;"><i class="fa-solid fa-magnifying-glass"></i> Tra cứu:</span>
            <asp:TextBox ID="txtTimKiem" runat="server" CssClass="o-nhap-lieu" placeholder="Nhập tên sách..." style="max-width: 250px;"></asp:TextBox>
            <asp:DropDownList ID="ddlLocTheLoai" runat="server" CssClass="hop-chon-lua" style="max-width: 180px;"></asp:DropDownList>
            <asp:Button ID="btnTimKiem" runat="server" Text="Tìm kiếm" CssClass="nut-bam nut-them" OnClick="btnTimKiem_Click" />
            <asp:Button ID="btnTatCa" runat="server" Text="Hiện tất cả" CssClass="nut-bam nut-huy" OnClick="btnTatCa_Click" />
        </div>

        <asp:GridView ID="gvSach" runat="server" CssClass="bang-hien-thi" AutoGenerateColumns="False" OnSelectedIndexChanged="gvSach_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Chọn" HeaderText="Thao tác" ControlStyle-CssClass="the-phan-loai" />
                <asp:BoundField DataField="MaSach" HeaderText="Mã" />
                <asp:BoundField DataField="TenSach" HeaderText="Tên sách" ItemStyle-Font-Bold="true" />
                <asp:BoundField DataField="TacGia" HeaderText="Tác giả" />
                <asp:BoundField DataField="Gia" HeaderText="Giá" DataFormatString="{0:N0} đ" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                <asp:BoundField DataField="TenLoai" HeaderText="Thể loại" />

                <asp:TemplateField HeaderText="Hình ảnh">
                    <ItemTemplate>
                        <asp:Image ID="imgSach" runat="server" CssClass="anh-thu-nho" 
                            ImageUrl='<%# "~/Images/" + Eval("AnhSach") %>' 
                            onerror="this.src='https://via.placeholder.com/60x75?text=No+Img';" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="MaLoai" HeaderText="Mã loại" HeaderStyle-CssClass="an-cot" ItemStyle-CssClass="an-cot" />

                <asp:TemplateField HeaderText="Mô tả">
                    <ItemTemplate>
                        <div class="khung-cuon-mota">
                            <%# Eval("MoTa") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <script type="text/javascript">
        CKEDITOR.replace('<%= txtMoTa.ClientID %>', {
            versionCheck: false,
            entities: false,
            basicEntities: false,
            entities_latin: false,
            entities_greek: false
        });
    </script>
</asp:Content>