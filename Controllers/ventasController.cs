using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TiendaElectronica;

namespace TiendaElectronica.Controllers
{
    public class ventasController : Controller
    {
        private tiendaelectronicaEntities db = new tiendaelectronicaEntities();

        // GET: ventas/Historial

        public ActionResult Historial(int idCliente =1)
        {
            var venta = db.venta.Include(v => v.presupuesto);
            var presupuesto = db.presupuesto.SqlQuery("Select * from presupuesto where idCliente = @p0", idCliente).ToList();
            ViewBag.idCliente = idCliente;
            ViewBag.presupuesto = presupuesto;
            return View(venta.ToList());
        }
        // GET: ventas
        public ActionResult Index()
        {
            var venta = db.venta.Include(v => v.presupuesto);
            return View(venta.ToList());
        }

        // GET: ventas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            venta venta = db.venta.Find(id);
            if (venta == null)
            {
                return HttpNotFound();
            }
            return View(venta);
        }

        // GET: ventas/Create
        public ActionResult Create()
        {
            ViewBag.IdPresupuesto = new SelectList(db.presupuesto, "idPresupuesto", "idPresupuesto");
            return View();
        }

        // POST: ventas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idVenta,FechaVenta,IdPresupuesto,FacturaNro")] venta venta)
        {
            if (ModelState.IsValid)
            {
                db.venta.Add(venta);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdPresupuesto = new SelectList(db.presupuesto, "idPresupuesto", "idPresupuesto", venta.IdPresupuesto);
            return View(venta);
        }

        // GET: ventas/Edit/5
        public ActionResult Edit(int? id, int? idCliente)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            venta venta = db.venta.Find(id);
            if (venta == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdPresupuesto = new SelectList(db.presupuesto, "idPresupuesto", "idPresupuesto", venta.IdPresupuesto);
            ViewBag.idCliente = idCliente;
            return View(venta);
        }

        // POST: ventas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idVenta,FechaVenta,IdPresupuesto,FacturaNro")] venta venta)
        {
            if (ModelState.IsValid)
            {
                db.Entry(venta).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdPresupuesto = new SelectList(db.presupuesto, "idPresupuesto", "idPresupuesto", venta.IdPresupuesto);
            return View(venta);
        }

        // GET: ventas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            venta venta = db.venta.Find(id);
            if (venta == null)
            {
                return HttpNotFound();
            }
            return View(venta);
        }

        // POST: ventas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            venta venta = db.venta.Find(id);
            db.venta.Remove(venta);
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
