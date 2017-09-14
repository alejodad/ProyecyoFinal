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

        ModeloPersona persona = new ModeloPersona();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            if (btnGuardar.Text == "Guardar")
            {
                Guardar();
            }
            else
            {
                Actualizar();
            }

        }

        private void Guardar()
        {
            pnlAlertaError.Visible = false;
            PanelAlerta.Visible = false;

            string nombre = txtNombrePersona.Text.Trim();
            string apellido = txtApellido.Text.Trim();
            string user = txtUsuario.Text.Trim();
            string mail = txtCorreo.Text.Trim();
            string contra = txtContrasena.Text.Trim();
            int edad = int.Parse(txtEdad.Text);


            string saltAlgoritmoEncriptacion = encripto.GenerateSalt();
            string contrasenaEncriptada = encripto.Compute(contra);
            persona.gsNombrePersona = nombre;
            persona.gsApellidoPersona = apellido;
            persona.gsEdad = edad;
            persona.gsEmail = mail;
            persona.gsUsuario = user;
            persona.gsPass = contrasenaEncriptada;
            persona.gsSalt = saltAlgoritmoEncriptacion;

            int resultado = persona.sp_CrearMensajero();
            if (resultado > 0)
            {
                PanelAlerta.Visible = true;
                LimpiarCmapos();
                Listar();
            }
            else
            {
                pnlAlertaError.Visible = true;
            }
        }

        private void Actualizar()
        {
            pnlAlertaError.Visible = false;
            PanelAlerta.Visible = false;
            persona.gsNombrePersona = txtNombrePersona.Text.Trim();
            persona.gsApellidoPersona = txtApellido.Text.Trim();
            persona.gsEdad = int.Parse(txtEdad.Text);
            persona.gsIdPerson = int.Parse(txtid.Text);

            
                int resultado = persona.ActualizarCliente();
                if (resultado > 0)
                {

                    PanelAlerta.Visible = true;
                    LimpiarCmapos();
                    btnGuardar.Text = "Guardar";
                    btnGuardar.CssClass = "btn btn-success";
                    Listar();

                }
                else
                {

                    pnlAlertaError.Visible = true;
                   
                }
            
        }

        private void Listar()
        {
            datosClientes.DataSource = persona.Listar();
            datosClientes.DataBind();
        }

        protected void datosClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                GridViewRow fila = datosClientes.Rows[indice];

                txtid.Text = fila.Cells[0].Text;
                txtNombrePersona.Text = fila.Cells[1].Text;
                txtApellido.Text = fila.Cells[2].Text;
                txtEdad.Text = fila.Cells[3].Text;
                btnGuardar.Text = "Actualizar";
                btnGuardar.CssClass = "btn btn-primary";

            }else if(e.CommandName == "Eliminar")
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                GridViewRow fila = datosClientes.Rows[indice];
                persona.gsIdPerson = int.Parse(fila.Cells[0].Text);
                int resultado = persona.EliminarCliente();
                if (resultado >0)
                {
                    
                    Listar();
                    PanelAlerta.Visible = true;
                }
                else
                {
                    pnlAlertaError.Visible = true;
                }
            }

        }
        
        private void LimpiarCmapos()
        {
            txtApellido.Text = "";
            txtContrasena.Text = "";
            txtEdad.Text = "";
            txtid.Text = "";
            txtNombrePersona.Text = "";
            txtUsuario.Text = "";
        }
    }
}