namespace FashionStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("ChiTietDonHang")]
    public partial class ChiTietDonHang
    {
        [Key]
        [Display(Name = "Chi tiết mã đơn hàng")]
        public int CTMaDon { get; set; }

        [Display(Name = "Mã đơn hàng")]
        [ForeignKey("DonHang")]
        public int MaDon { get; set; }

        [Display(Name = "Tên sản phẩm")]
        [ForeignKey("SanPham")]
        public int MaSP { get; set; }

        [Display(Name = "Số lượng")]
        public int? SoLuong { get; set; }

        [Display(Name = "Đơn giá")]
        [Column(TypeName = "decimal")]
        [Range(0, double.MaxValue, ErrorMessage = "Đơn giá phải lớn hơn hoặc bằng 0")]
        public decimal? DonGia { get; set; }

        [Display(Name = "Thành tiền")]
        [Column(TypeName = "decimal")]
        [Range(0, double.MaxValue, ErrorMessage = "Thành tiền phải lớn hơn hoặc bằng 0")]
        public decimal? ThanhTien { get; set; }

        [Display(Name = "Phương thức thanh toán")]
        public int? PhuongThucThanhToan { get; set; }

        // Điều hướng đến DonHang
        public virtual DonHang DonHang { get; set; }

        // Điều hướng đến SanPham
        public virtual SanPham SanPham { get; set; }
    }
}
