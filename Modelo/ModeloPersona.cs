using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace Modelo
{
    public class ModeloPersona
    {
        private int idPersona;

        public int gsIdPerson
        {
            get { return idPersona; }
            set { idPersona = value; }
        }
        private string nombrePersona;

        public string gsNombrePersona
        {
            get { return nombrePersona; }
            set { nombrePersona = value; }
        }
        private string apellidoPersona;

        public string gsApellidoPersona
        {
            get { return apellidoPersona; }
            set { apellidoPersona = value; }
        }
        private string usuario;

        public string gsUsuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
        private string pass;

        public string gsPass
        {
            get { return pass; }
            set { pass = value; }
        }
        private int myVar;

        public int MyProperty
        {
            get { return myVar; }
            set { myVar = value; }
        }
        private string salt;

        public string gsSalt
        {
            get { return salt; }
            set { salt = value; }
        }
        private int edad;

        public int gsEdad
        {
            get { return edad; }
            set { edad = value; }
        }
        private int estado;

        public int gsEstado
        {
            get { return estado; }
            set { estado = value; }
        }
        private int tipoPersona;

        public int gsTipoPersona
        {
            get { return tipoPersona; }
            set { tipoPersona = value; }
        }

        #region atributos

        #endregion
        #region propiedades

        #endregion

        private SqlConnection cnx;
        private SqlCommand comando;
        private SqlParameter parametro;
        private SqlDataAdapter adaptador;

        private string cadenaConexion = ConfigurationManager.ConnectionStrings["Aplicacion"].ConnectionString;

        public int sp_CrearMensajero()
        {
            int RowsAffected ;
            using (cnx = new SqlConnection(cadenaConexion))
            {
                cnx.Open();
                comando = new SqlCommand("sp_CrearMensajero", cnx);
                comando.CommandType = CommandType.StoredProcedure;
                parametro = new SqlParameter("@nombrePersona", SqlDbType.VarChar, 50);
                parametro.Value = this.gsNombrePersona;
                comando.Parameters.Add(parametro);

                parametro = new SqlParameter("@apellidoPersona", SqlDbType.VarChar, 50);
                parametro.Value = this.gsApellidoPersona;
                comando.Parameters.Add(parametro);

                parametro = new SqlParameter("@usuario", SqlDbType.VarChar, 20);
                parametro.Value = this.gsUsuario;
                comando.Parameters.Add(parametro);

                parametro = new SqlParameter("@contrasenaPersona", SqlDbType.VarChar, 100);
                parametro.Value = this.gsPass;
                comando.Parameters.Add(parametro);

                parametro = new SqlParameter("@salt", SqlDbType.VarChar, 100);
                parametro.Value = this.gsSalt;
                comando.Parameters.Add(parametro);

                parametro = new SqlParameter("@edad", SqlDbType.TinyInt);
                parametro.Value = this.gsEdad;
                comando.Parameters.Add(parametro);

                try
                {
                    RowsAffected = comando.ExecuteNonQuery();
                }
                catch (Exception ex)
                {

                    RowsAffected = 0; 
                }

            }
            return RowsAffected;
        }

        public int sp_CrearClienteo()
        {
            int RowsAffected = 0;
            return RowsAffected;
        }
    }
}
