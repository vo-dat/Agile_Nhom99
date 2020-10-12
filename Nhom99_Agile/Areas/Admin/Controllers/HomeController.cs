using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Nhom99_Agile.Models;
using System.Web.Mvc;

namespace Nhom99_Agile.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        BanBanhEntities db = new BanBanhEntities();
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}