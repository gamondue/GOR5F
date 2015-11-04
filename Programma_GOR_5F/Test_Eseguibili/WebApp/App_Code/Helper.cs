using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Descrizione di riepilogo per Helper
/// </summary>
public static class Helper
{
    /// <summary>
    /// Manda un messaggio tramite una finestra.
    /// </summary>
    /// <param name="page"></param>
    /// <param name="message">Messaggio.</param>
	public static void Alert(this Page page, string message)
    {
        page.Response.Write("<script>alert('" + message + "')</script>");
    }
}