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
    public class lineapresupuestoesController : Controller
    {
        private tiendaelectronicaEntities db = new tiendaelectronicaEntities();

        // GET: lineapresupuestoes
        public ActionResult Index()
        {
            var lineapresupuesto = db.lineapresupuesto.Include(l => l.presupuesto).Include(l => l.producto);
            return View(lineapresupuesto.ToList());
        }

        // GET: lineapresupuestoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            lineapresupuesto lineapresupuesto = db.lineapresupuesto.Find(id);
            if (lineapresupuesto == null)
            {
                return HttpNotFound();
            }
            return View(lineapresupuesto);
        }

        // GET: lineapresupuestoes/Create
        public ActionResult Create()
        {
            ViewBag.idPresupuesto = new SelectList(db.presupuesto, "idPresupuesto", "idPresupuesto");
            ViewBag.idProducto = new SelectList(db.producto, "idProducto", "Nombre");
            return View();
        }

        // POST: lineapresupuestoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idLineaPresupuesto,idPresupuesto,idProducto,PrecioUnit,Cantidad")] lineapresupuesto lineapresupuesto)
        {
            if (ModelState.IsValid)
            {
                db.lineapresupuesto.Add(lineapresupuesto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idPresupuesto = new SelectList(db.presupuesto, "idPresupuesto", "idPresupuesto", lineapresupuesto.idPresupuesto);
            ViewBag.idProducto = new SelectList(db.producto, "idProducto", "Nombre", lineapresupuesto.idProducto);
            return View(lineapresupuesto);
        }

        // GET: lineapresupuestoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            lineapresupuesto lineapresupuesto = db.lineapresupuesto.Find(id);
            if (lineapresupuesto == null)
            {
                return HttpNotFound();
            }
            ViewBag.idPresupuesto = new SelectList(db.presupuesto, "idPresupuesto", "idPresupuesto", lineapresupuesto.idPresupuesto);
            ViewBag.idProducto = new SelectList(db.producto, "idProducto", "Nombre", lineapresupuesto.idProducto);
            return View(lineapresupuesto);
        }

        // POST: lineapresupuestoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idLineaPresupuesto,idPresupuesto,idProducto,PrecioUnit,Cantidad")] lineapresupuesto lineapresupuesto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lineapresupuesto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idPresupuesto = new SelectList(db.presupuesto, "idPresupuesto", "idPresupuesto", lineapresupuesto.idPresupuesto);
            ViewBag.idProducto = new SelectList(db.producto, "idProducto", "Nombre", lineapresupuesto.idProducto);
            return View(lineapresupuesto);
        }

        // GET: lineapresupuestoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            lineapresupuesto lineapresupuesto = db.lineapresupuesto.Find(id);
            if (lineapresupuesto == null)
            {
                return HttpNotFound();
            }
            return View(lineapresupuesto);
        }

        // POST: lineapresupuestoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            lineapresupuesto lineapresupuesto = db.lineapresupuesto.Find(id);
            db.lineapresupuesto.Remove(lineapresupuesto);
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
