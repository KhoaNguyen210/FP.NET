using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FashionStore.Models;
using PagedList;
using System.IO;

namespace FashionStore.Areas.Admin.Controllers

{
    public class SanPhamsController : Controller
    {
        private FashionStoreEntities db = new FashionStoreEntities();

        // GET: SanPhams
        public ActionResult Index(string searchString)
        {
            ViewBag.SearchString = searchString;

            var sanPhams = db.SanPhams.Include(s => s.LoaiHang).Include(s => s.NhaCungCap);

            // Filter by product name if searchString is not empty
            if (!string.IsNullOrEmpty(searchString))
            {
                sanPhams = sanPhams.Where(s => s.TenSP.Contains(searchString));
            }

            var u = Session["use"] as FashionStore.Models.TaiKhoan;
            if (u.PhanQuyen.TenQuyen == "Adminstrator")
            {
                return View(sanPhams.OrderByDescending(s => s.MaSP).ToList());
            }

            return RedirectPermanent("~/Home/Index");
        }

        public ActionResult GetProductImage(string imageName)
        {
            if (string.IsNullOrEmpty(imageName))
            {
                return null;
            }

            var imagePath = Server.MapPath("~/Images/" + imageName);
            if (System.IO.File.Exists(imagePath))
            {
                return File(imagePath, "image/jpeg"); // hoặc "image/png" tùy vào định dạng ảnh
            }
            return null;
        }


        // GET: SanPhams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: SanPhams/Create
        // GET: SanPhams/Create
        public ActionResult Create()
        {
            ViewBag.MaLoai = new SelectList(db.LoaiHangs, "MaLoai", "TenLoai");
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC");
            return View();
        }

        // POST: SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SanPham sanPham, HttpPostedFileBase AnhSP)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    if (sanPham.GiaBan.ToString().Contains(","))
                    {
                        string giaBanStr = sanPham.GiaBan.ToString().Replace(",", "");
                        decimal giaBan;
                        if (decimal.TryParse(giaBanStr, out giaBan))
                        {
                            sanPham.GiaBan = giaBan;
                        }
                    }

                    // Kiểm tra nếu người dùng chọn ảnh
                    if (AnhSP != null && AnhSP.ContentLength > 0)
                    {
                        // Tạo tên ảnh mới (chắc chắn không trùng lặp)
                        string fileName = Path.GetFileName(AnhSP.FileName);
                        string filePath = Path.Combine(Server.MapPath("~/Images"), fileName);

                        // Lưu ảnh vào thư mục "Images/Products" trong dự án
                        AnhSP.SaveAs(filePath);

                        // Lưu tên ảnh vào thuộc tính AnhSP của sản phẩm
                        sanPham.AnhSP = fileName;
                    }

                    // Thêm sản phẩm vào database
                    db.SanPhams.Add(sanPham);
                    db.SaveChanges();

                    // Chuyển hướng về trang Index sau khi thêm sản phẩm thành công
                    TempData["SuccessMessage"] = "Thêm sản phẩm thành công!";
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex) {
                TempData["ErrorMessage"] = "Có lỗi xảy ra: " + ex.Message;
            }

            // Nếu có lỗi, hiển thị lại form với thông tin đã nhập
            ViewBag.MaLoai = new SelectList(db.LoaiHangs, "MaLoai", "TenLoai", sanPham.MaLoai);
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC", sanPham.MaNCC);
            return View(sanPham);
        }



        // GET: SanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoai = new SelectList(db.LoaiHangs, "MaLoai", "TenLoai", sanPham.MaLoai);
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps, "MaNCC", "TenNCC", sanPham.MaNCC);
            return View(sanPham);
        }

        // POST: SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,TenSP,GiaBan,SoLuong,MoTa,MaLoai,MaNCC,AnhSP")] SanPham sanPham, HttpPostedFileBase imageInput)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (sanPham.GiaBan.ToString().Contains(","))
                    {
                        string giaBanStr = sanPham.GiaBan.ToString().Replace(",", "");
                        decimal giaBan;
                        if (decimal.TryParse(giaBanStr, out giaBan))
                        {
                            sanPham.GiaBan = giaBan;
                        }
                    }

                    // Xử lý upload ảnh nếu có
                    if (imageInput != null && imageInput.ContentLength > 0)
                    {
                        var fileName = Path.GetFileName(imageInput.FileName);
                        var uniqueFileName = Guid.NewGuid().ToString() + "_" + fileName; // Tạo tên file duy nhất
                        var path = Path.Combine(Server.MapPath("~/Images"), uniqueFileName);
                        imageInput.SaveAs(path);
                        sanPham.AnhSP = uniqueFileName; // Cập nhật tên file mới
                    }


                    db.Entry(sanPham).State = EntityState.Modified;
                    db.SaveChanges();

                    return Json(new { success = true });
                }
                return Json(new { success = false, message = "Dữ liệu không hợp lệ" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Có lỗi xảy ra: " + ex.Message });
            }
        }


        // GET: SanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
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