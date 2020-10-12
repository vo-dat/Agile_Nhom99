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
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            USER user = db.USERS.SingleOrDefault(x => x.USER_NAME == username && x.PASSWORD == password && x.Allowed == 1);
            if (user != null)
            {
                Session["userid"] = user.USER_ID;
                Session["username"] = user.USER_NAME;
                if (username == "admin")
                {
                    return Redirect("~/Admin/Home/Index");
                }
                Session["TaiKhoan"] = user;
                Session["isLogin"] = "T";
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.Message = "Wrong Username or Password";
                return View();
            }
        }

        [HttpGet]
        public ActionResult Register()
        {
            ViewBag.error = false;
            return View();
        }

        [HttpPost]
        public ActionResult Register(string username, string password, string mail, string phone)
        {
            var taikhoan = (from a in db.USERS select a.USER_NAME).ToList();
            foreach (var tk in taikhoan)
            {
                if (username == tk)
                {
                    ViewBag.Message = "User already exists";
                    ViewBag.error_tk = true;
                    ViewBag.tentk = username;
                    ViewBag.sdt = phone;
                    ViewBag.mail = mail;
                    return View("Register");
                }
            }
            var sodt = (from p in db.USERS select p.SODT).ToList();
            foreach (var so in sodt)
            {
                if (phone == so)
                {
                    ViewBag.Message = "Number already exists";
                    ViewBag.error_sodt = true;
                    ViewBag.tentk = username;
                    ViewBag.sdt = phone;
                    ViewBag.mail = mail;
                    return View("Register");
                }
            }
            var email = (from e in db.USERS select e.EMAIL).ToList();
            foreach (var maill in email)
            {
                if (mail == maill)
                {
                    ViewBag.Message = "Email already exists";
                    ViewBag.error_email = true;
                    ViewBag.tentk = username;
                    ViewBag.sdt = phone;
                    ViewBag.mail = mail;
                    return View("Register");
                }
            }

            var ngdung = (from m in db.USERS where m.SODT == null select m).Single();
            ngdung.USER_NAME = username;
            ngdung.PASSWORD = password;
            ngdung.SODT = phone;
            ngdung.EMAIL = mail;
            db.Entry(ngdung).State = EntityState.Modified;

            string ID = ngdung.USER_ID;
            int num = int.Parse(ID.Substring(2)) + 1;
            string IDnext = "US" + num.ToString();

            USER IDmoi = new USER();
            IDmoi.USER_ID = IDnext;
            db.USERS.Add(IDmoi);

            db.SaveChanges();
            ViewBag.Message = "Success!";
            return View("Login");
        }
    }
}