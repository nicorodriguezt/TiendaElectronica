using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TiendaElectronica
{
    public partial class lineapresupuesto
    {
        public double subtotal
        {
            get
            {
                return this.Cantidad * this.PrecioUnit;
            }
        }
    }
}