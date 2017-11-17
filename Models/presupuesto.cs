using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TiendaElectronica
{
    public partial class presupuesto
    {
        
        public double subtotal
        {
            get
            {
                double aux=0;
                tiendaelectronicaEntities db = new tiendaelectronicaEntities();
                var linea = db.lineapresupuesto.SqlQuery("Select * from lineapresupuesto where idPresupuesto = @p0", this.idPresupuesto).ToList();
                foreach (var l in linea)
                {
                    aux = aux + l.subtotal;
                }
                return aux;
            }            
        }
        
    }
}