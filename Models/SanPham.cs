namespace FashionStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }

        [Display(Name = "Mã sản phẩm")]
        [Key]
        public int MaSP { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được để trống")]
        [StringLength(100, ErrorMessage = "Tên sản phẩm không được vượt quá 100 ký tự")]
        [Display(Name = "Tên sản phẩm")]
        public string TenSP { get; set; }

        [Required(ErrorMessage = "Giá bán không được để trống")]
        [Range(0, double.MaxValue, ErrorMessage = "Giá bán phải lớn hơn 0")]
        [Display(Name = "Giá bán")]
        public decimal? GiaBan { get; set; }

        [Required(ErrorMessage = "Số lượng không được để trống")]
        [Range(0, int.MaxValue, ErrorMessage = "Số lượng phải lớn hơn hoặc bằng 0")]
        [Display(Name = "Số lượng")]
        public int? SoLuong { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn loại sản phẩm")]
        [Display(Name = "Loại sản phẩm")]
        public int? MaLoai { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn nhà cung cấp")]
        [Display(Name = "Nhà cung cấp")]
        public int? MaNCC { get; set; }

        [Display(Name = "Ảnh sản phẩm")]
        public string AnhSP { get; set; }

        [StringLength(500, ErrorMessage = "Mô tả không được vượt quá 500 ký tự")]
        [AllowHtml]
        public string MoTa { get; set; }
     
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual LoaiHang LoaiHang { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }
    }
}
