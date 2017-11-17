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
    public class presupuestoesController : Controller
    {
        private tiendaelectronicaEntities db = new tiendaelectronicaEntities();

        // GET: presupuestoes
        public ActionResult Index(int? id, int? idCliente)
        {
            var presupuesto = db.presupuesto.Include(p => p.cliente);            
            ViewBag.idCliente = idCliente;
            return View(presupuesto.ToList());
        }

        // GET: presupuestoes/Details/5
        public ActionResult Details(int? id, int? idCliente)
        {
            ViewBag.idPresupuesto = id;
            ViewBag.idCliente = idCliente;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            presupuesto presupuesto = db.presupuesto.Find(id);
            if (presupuesto == null)
            {
                return HttpNotFound();
            }
            return View(presupuesto);
        }

        // GET: presupuestoes/DetailsCompra/5
        public ActionResult DetailsCompra(int? id, int? idCliente)
        {
            ViewBag.idPresupuesto = id;
            ViewBag.idCliente = idCliente;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            presupuesto presupuesto = db.presupuesto.Find(id);
            if (presupuesto == null)
            {
                return HttpNotFound();
            }
            return View(presupuesto);
        }

        // GET: presupuestoes/Create
        public ActionResult Create(int? idCliente)
        {
            ViewBag.idCliente = idCliente;
            ViewBag.Cliente = new SelectList(db.cliente.Where(c => c.idCliente==idCliente), "idCliente", "RazonSocial");
            return View();
        }

        // POST: presupuestoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPresupuesto,PresupuestoNro,FechaRealizado,FechaFin,IdCliente")] presupuesto presupuesto)
        {
            if (ModelState.IsValid)
            {
                db.presupuesto.Add(presupuesto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdCliente = new SelectList(db.cliente, "idCliente", "RazonSocial", presupuesto.IdCliente);
            return View(presupuesto);
        }

        // GET: presupuestoes/Edit/5
        public ActionResult Edit(int? id, int? idCliente)
        {
            ViewBag.idCliente = idCliente;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            presupuesto presupuesto = db.presupuesto.Find(id);
            if (presupuesto == null)
            {
                return HttpNotFound();
            }
            ViewBag.Cliente = new SelectList(db.cliente.Where(c => c.idCliente == idCliente), "idCliente", "RazonSocial");
            return View(presupuesto);
        }

        // POST: presupuestoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPresupuesto,PresupuestoNro,FechaRealizado,FechaFin,IdCliente")] presupuesto presupuesto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(presupuesto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index",new { idCliente = presupuesto.IdCliente});
            }
            ViewBag.IdCliente = new SelectList(db.cliente, "idCliente", "RazonSocial", presupuesto.IdCliente);
            return View(presupuesto);
        }

        // GET: presupuestoes/Delete/5
        public ActionResult Delete(int? id, int? idCliente)
        {
            ViewBag.idCliente = idCliente;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            presupuesto presupuesto = db.presupuesto.Find(id);
            if (presupuesto == null)
            {
                return HttpNotFound();
            }
            return View(presupuesto);
        }

        // POST: presupuestoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            presupuesto presupuesto = db.presupuesto.Find(id);
            db.presupuesto.Remove(presupuesto);
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
