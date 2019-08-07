using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo
{
    public partial class Demo_Two : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) {
        }

        [WebMethod]
        public static List<string> returnAjax()
        {
            // You could make several references here, RESTful API calls, DB pulls & commits, web service connections.
            // Get whatever data needed here and return it where it needs to go.
            List<string> values = new List<string>();       // This could be any kind of container filled with any kind of data. (Maps, Tupples, Vectors, hashtables, stacks, queues.)
            values.Add("Thingamabob");
            values.Add("Doohickey");
            values.Add("RootyTooty");
            return values;                                  // Return them from the controller.
        }
    }
}