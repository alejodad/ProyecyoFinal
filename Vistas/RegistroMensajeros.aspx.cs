using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using SimpleCrypto;
namespace Vistas
{
    public partial class RegistroMensajeros : System.Web.UI.Page
    {
        ICryptoService encripto = new PBKDF2();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombrePersona.Text.Trim();
            string apellido = txtApellido.Text.Trim();
            string user = txtUsuario.Text.Trim();
            string contra = txtContrasena.Text.Trim();
            int edad = int.Parse(txtEdad.Text);

            ModeloPersona persona = new ModeloPersona();

            string saltAlgoritmoEncriptacion = encripto.GenerateSalt();
            string contrasenaEncriptada = encripto.Compute(contra);
            persona.gsNombrePersona = nombre;
            persona.gsApellidoPersona = apellido;
            persona.gsEdad = edad;
            persona.gsUsuario = user;
            persona.gsPass = contrasenaEncriptada;
            persona.gsSalt = saltAlgoritmoEncriptacion;

            int resultado = persona.sp_CrearMensajero();
            if (resultado >0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alertaExito", "window.onload = function(){ alert('se guardo'); }", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "alertaError", "window.onload = function(){ alert('no se guardo'); }", true);
            }
        }
    }
}