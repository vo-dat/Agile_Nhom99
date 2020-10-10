using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nhom99_Agile.Models;
using System.Data.Entity;
using System.Web.Mvc;


namespace Nhom99_Agile.Controllers
{
    public class HomeController : Controller
    {
        BanBanhEntities db = new BanBanhEntities();

        public ActionResult Index()
        {
            ViewBag.Sanphammoi = db.SANPHAMs.OrderByDescending(x => x.NGAYCAPNHAT).Take(8).ToList();
            //Sản phẩm hot best seller
            var sp = db.f_slBan().OrderByDescending(x => x.SLBan).Take(6).ToList();
            return View();
        }
        public ActionResult Details(string id)
        {
            var a = db.f_slBan().OrderByDescending(x => x.SLBan).Take(6).ToList();
            ViewBag.SLBanchay = a;
            SANPHAM sp = db.SANPHAMs.SingleOrDefault(x => x.MASP == id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            return View(sp);
        }
        public ActionResult About()
        {
           
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}