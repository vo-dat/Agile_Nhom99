using Nhom99_Agile.Models;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Nhom99_Agile.Areas.Admin.Controllers
{

    public class SANPHAMController : Controller
    {
        private BanBanhEntities db = new BanBanhEntities();
        // GET: Admin/SANPHAM
        public ActionResult Index()
        {
            var data = db.sp_LaySP();
            return View(data.ToList());
        
        }
        #region Detail
        // GET: Admin/SANPHAM/Details/5      
        public ActionResult Details(string id)
        {
            var d = db.sp_LayidSP(id).SingleOrDefault();
            return View(d);
        }
        #endregion
        #region Create
        // GET: Admin/SANPHAM/Create
        public ActionResult Create()
        {
            ViewBag.MALOAISP = new SelectList(db.LOAISPs, "MALOAISP", "TENLOAISP");
            return View();
        }

        // POST: Admin/SANPHAM/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MASP,TENSP,DVT,NOISX,GIA,MOTA,NGAYCAPNHAT,MALOAISP,HINH")] SANPHAM sANPHAM)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.sp_ThemSP(sANPHAM.TENSP, sANPHAM.DVT, sANPHAM.NOISX, sANPHAM.GIA, sANPHAM.MOTA, sANPHAM.MALOAISP, sANPHAM.HINH);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.MALOAISP = new SelectList(db.LOAISPs, "MALOAISP", "TENLOAISP", sANPHAM.MALOAISP);
                return View(sANPHAM);
            }
            catch { return View(); }
        }

        #endregion

        #region Edit
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
           // ViewBag.MALOAISP = new SelectList(db.LOAISPs, "MALOAISP", "TENLOAISP", sANPHAM.MALOAISP);
            return View(sANPHAM);
        }

        // POST: Admin/SANPHAM/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MASP,TENSP,DVT,NOISX,GIA,MOTA,NGAYCAPNHAT,MALOAISP,HINH")] SANPHAM sANPHAM)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.sp_CapNhatSP(sANPHAM.MASP, sANPHAM.TENSP, sANPHAM.DVT, sANPHAM.NOISX, sANPHAM.GIA, sANPHAM.MOTA, sANPHAM.NGAYCAPNHAT);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
               // ViewBag.MALOAISP = new SelectList(db.LOAISPs, "MALOAISP", "TENLOAISP", sANPHAM.MALOAISP);
                return View(sANPHAM);
            }
            catch { return View(); }

        }

        #endregion

        #region Delete
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SANPHAM sANPHAM = db.SANPHAMs.Find(id);
            if (sANPHAM == null)
            {
                return HttpNotFound();
            }
            return View(sANPHAM);
        }

        // POST: Admin/SANPHAM/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            try
            {
                SANPHAM sANPHAM = db.SANPHAMs.Find(id);
                db.sp_XoaSP(sANPHAM.MASP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch { return View(); }

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        #endregion
    }
}


        
   