using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Vistas.Models;
using SimpleCrypto;
namespace Vistas
{
    public partial class RegistroClientes : System.Web.UI.Page
    {
        ICryptoService encripto = new PBKDF2();
        AplicacionDataContext instanciaBd = new AplicacionDataContext();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (btnGuardar.Text== "Guardar")
            {
                Guardar();
            }
            else if(btnGuardar.Text == "Actualizar")
            {
                Actualizar();
            }
        }

        protected void datosClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Editar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int celdaElegida = int.Parse( datosClientes.Rows[index].Cells[0].Text);
                var persona = instanciaBd.tbl_persona.Where(x => x.idPersona == celdaElegida).FirstOrDefault();
                txtNombrePersona.Text = persona.nombrePersona;
                txtApellido.Text = persona.apellidoPersona;
                txtEdad.Text = persona.edad.ToString();
                txtUsuario.Text = persona.usuarioPersona;
                txtid.Text = persona.idPersona.ToString();
                txtContrasena.Text = persona.contrasenaPersona;
                btnGuardar.Text = "Actualizar";
                btnGuardar.CssClass = "btn btn-primary";
            }
            else if (e.CommandName == "Eliminar")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int celdaElegida = int.Parse(datosClientes.Rows[index].Cells[0].Text);
                var personaBorrar = instanciaBd.tbl_persona.Where(x => x.idPersona == celdaElegida).FirstOrDefault();
                instanciaBd.tbl_persona.DeleteOnSubmit(personaBorrar);
                instanciaBd.SubmitChanges();
                Listar();
            }
        }

        private void Guardar()
        {
            pnlAlertaError.Visible = false;
            PanelAlerta.Visible = false;

            string nombre = txtNombrePersona.Text.Trim();
            string apellido = txtApellido.Text.Trim();
            string user = txtUsuario.Text.Trim();
            string contra = txtContrasena.Text.Trim();
            string mail = txtCorreo.Text.Trim();
            int edad = int.Parse(txtEdad.Text.Trim());
            /*instanciaBd.sp_CrearCliente(nombre, apellido, user, contra, "", byte.Parse(edad.ToString()));*/
            tbl_persona una = new tbl_persona();
            //GENERAR ENCRIPTACION
            string saltAlgoritmoEncriptacion = encripto.GenerateSalt();
            string contrasenaEncriptada = encripto.Compute(contra);
            una.nombrePersona = nombre;
            una.apellidoPersona = apellido;
            una.usuarioPersona = user;
            una.contrasenaPersona = contrasenaEncriptada;
            una.edad = Convert.ToByte(edad);
            una.salt = saltAlgoritmoEncriptacion;
            una.estado = 1;
            una.idTipoPersona = 2;
            una.emailPersona = mail;

            try
            {
                instanciaBd.tbl_persona.InsertOnSubmit(una);
                instanciaBd.SubmitChanges();
                LimpiarCmapos();
                Listar();
                PanelAlerta.Visible = true;
            }
            catch (Exception)
            {

                pnlAlertaError.Visible = true;
            }
        }

        private void Actualizar()
        {

            pnlAlertaError.Visible = false;
            PanelAlerta.Visible = false;

            int idPersona = int.Parse(txtid.Text);
            var persona = instanciaBd.tbl_persona.Where(x => x.idPersona == idPersona).FirstOrDefault();
            persona.nombrePersona = txtNombrePersona.Text.Trim();
            persona.apellidoPersona = txtApellido.Text.Trim();
            persona.edad = Convert.ToByte(txtEdad.Text);
            try
            {
                instanciaBd.SubmitChanges();
                LimpiarCmapos();
                btnGuardar.Text = "Guardar";
                btnGuardar.CssClass = "btn btn-success";
                Listar();
                PanelAlerta.Visible = true;
            }
            catch (Exception)
            {

                pnlAlertaError.Visible = true;
            }

        }
        private void LimpiarCmapos()
        {
            txtApellido.Text="";
            txtContrasena.Text = "";
            txtEdad.Text = "";
            txtid.Text = "";
            txtNombrePersona.Text = "";
            txtUsuario.Text = "";
        }
        private void Listar()
        {
            datosClientes.DataSource = instanciaBd.tbl_persona.Where(x => x.idTipoPersona == 2).ToList();
            datosClientes.DataBind();
        }
    }
}