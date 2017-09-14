using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas.Models;
using System.Web.Security;
using SimpleCrypto;
namespace Vistas
{
    public partial class Login : System.Web.UI.Page
    {
        private AplicacionDataContext instaciaBD = new AplicacionDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Context.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Inicio.aspx");
                }

            }
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Recuperar.aspx");
        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text.Trim();
            string pas = txtPass.Text.Trim();
            if (user != "" && pas != "")
            {
                var persona = instaciaBD.tbl_persona.Where(x => x.usuarioPersona== user).FirstOrDefault();

               
                if (persona!= null)
                {
                    ICryptoService encripto = new PBKDF2();//INSTANCIO EL ALGORITMO 
                    string pasEncriptada = encripto.Compute(pas, persona.salt);
                    if (encripto.Compare( persona.contrasenaPersona , pasEncriptada))
                    {
                        FormsAuthentication.SetAuthCookie(persona.nombrePersona +" "+ persona.apellidoPersona, true);                       
                        Response.Redirect("Inicio.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "aletarLoginFail", "window.onload = function(){ alert ('Contraseña incorrecta');};", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "aletarLoginFail", "window.onload = function(){ alert ('no existe ');};", true);
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "aletarLoginFail", "window.onload = function(){ alert ('debe ingresar datos');};", true);
            }
        }
    }
}