using FashionStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace FashionStore.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {

        // GET: Admin/Home
        public ActionResult Index()
        {
            var u = Session["use"] as FashionStore.Models.TaiKhoan;
            //Kiểm tra nếu tên quyền Administrator mới được truy cập trang admin
            if(u.PhanQuyen.TenQuyen == "Adminstrator")
            {
                return View();
            }

            return RedirectPermanent("~/Home/Index");
        }
    }
}