using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo
{
    public partial class Demo_Three : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) {
        }

        [WebMethod]
        public static Hashtable returnAjax(string Name, string Age, string EffDate, string ExpDate, string TransType, string ClientID)
        {
            Hashtable info = new Hashtable();       // Creating a hashtable and populating it with the parameters passed to it.

            // Perform your data manuipulation here, add it to the table, send to database, modify, or return to view.
            info.Add("Name", Name);
            info.Add("Age", Age);
            info.Add("EffDate", EffDate);
            info.Add("ExpDate", ExpDate);
            info.Add("TransType", TransType);
            info.Add("ClientID", ClientID);

            return info;                            // Return modified data.
        }
    }
}