using FashionStore.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Data.Entity;
using System.IO;

namespace FashionStore.Controllers
{
    public class SanphamController : Controller
    {
        private FashionStoreEntities db = new FashionStoreEntities();

        // GET: Sanpham
        public ActionResult Index()
        {
            var sanPhams = db.SanPhams
                             .Include(s => s.LoaiHang)
                             .Include(s => s.NhaCungCap)
                             .ToList();
            return View(sanPhams);
        }

        public ActionResult GetProductImage(string imageName)
        {
            if (string.IsNullOrEmpty(imageName))
                return File(Server.MapPath("~/Images/default-product.jpg"), "image/jpeg");

            var path = Server.MapPath("~/Images/" + imageName);
            if (!System.IO.File.Exists(path))
                return File(Server.MapPath("~/Images/default-product.jpg"), "image/jpeg");

            // Đọc file và trả về
            return File(path, "image/jpeg", imageName);
        }

        public ActionResult SanPhamBanChay()
        {
            var sanPhamBanChay = db.SanPhams
                .Include(s => s.LoaiHang)
                .Include(s => s.NhaCungCap)
                .OrderByDescending(p => p.SoLuong) // Sắp xếp theo số lượng bán giảm dần
                .Take(8) // Lấy 10 sản phẩm bán chạy nhất
                .ToList();

            return View(sanPhamBanChay);
        }


        public ActionResult AoBestSeller()
        {
            var ip = db.SanPhams.Where(n => n.MaLoai == 1).Take(4).ToList();
            return PartialView("suapartial", ip);
        }

        public ActionResult QuanBestSeller()
        {
            var ip = db.SanPhams.Where(n => n.MaLoai == 2).Take(4).ToList();
            return PartialView("QuanBestSeller", ip);
        }

        public ActionResult VayDamBestSeller()
        {
            var ip = db.SanPhams.Where(n => n.MaLoai == 3).Take(4).ToList();
            return PartialView("VayDamBestSeller", ip);
        }

        public ActionResult xemchitiet(int Masp = 0)
        {
            var chitiet = db.SanPhams.SingleOrDefault(n => n.MaSP == Masp);
            if (chitiet == null)
            {
                return HttpNotFound("Sản phẩm không tồn tại");
            }
            return View(chitiet);
        }

        public ActionResult xemchitietdanhmuc(int MaLoai)
        {
            var ip = db.SanPhams.Where(n => n.MaLoai == MaLoai).ToList();
            if (ip == null || !ip.Any())
            {
                return HttpNotFound("Không tìm thấy sản phẩm cho loại này");
            }
            return PartialView(ip);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
