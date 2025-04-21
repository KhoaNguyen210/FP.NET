using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.Entity.Core.Objects;
using System.Linq;
using FashionStore.Models;
using System.Data.Entity.Infrastructure;

namespace FashionStore.Models
{
    public class FashionStoreEntities : DbContext
    {
        public FashionStoreEntities()
            : base("name=FashionStoreEntities")
        {
        }

        // DbSet cho từng bảng trong database
        public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public virtual DbSet<DonHang> DonHangs { get; set; }
        public virtual DbSet<LoaiHang> LoaiHangs { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<PhanQuyen> PhanQuyens { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }

        // Stored Procedure để tìm kiếm sản phẩm
        public virtual ObjectResult<SanPham> SanPham_TimKiem(string tenSP, string tenLoai, string tenNCC)
        {
            var tenSPParameter = tenSP != null ? new ObjectParameter("TenSP", tenSP) : new ObjectParameter("TenSP", typeof(string));
            var tenLoaiParameter = tenLoai != null ? new ObjectParameter("TenLoai", tenLoai) : new ObjectParameter("TenLoai", typeof(string));
            var tenNCCParameter = tenNCC != null ? new ObjectParameter("TenNCC", tenNCC) : new ObjectParameter("TenNCC", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SanPham>("SanPham_TimKiem", tenSPParameter, tenLoaiParameter, tenNCCParameter);
        }

        // Cấu hình các thuộc tính của bảng khi khởi tạo
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // Tắt các quy ước tự động thêm 's' vào tên bảng
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            // Cấu hình cho bảng DonHang
            modelBuilder.Entity<DonHang>()
                .Property(e => e.TongTien)
                .HasPrecision(18, 0);

            // Cấu hình cho bảng ChiTietDonHang
            modelBuilder.Entity<ChiTietDonHang>()
                .Property(e => e.ThanhTien)
                .HasPrecision(18, 0);

            // Cấu hình cho bảng SanPham
            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaBan)
                .HasPrecision(18, 0);

            // Cấu hình quan hệ DonHang và ChiTietDonHang
            modelBuilder.Entity<DonHang>()
                .HasMany(e => e.ChiTietDonHang)
                .WithRequired(e => e.DonHang)
                .WillCascadeOnDelete(false);

            // Cấu hình quan hệ SanPham và ChiTietDonHang
            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietDonHangs)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);

            // Cấu hình cho bảng TaiKhoan
            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.Email)
                .IsUnicode(false);
            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.DienThoai)
                .IsUnicode(false);
            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);
        }
    }
}
