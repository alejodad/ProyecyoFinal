<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroClientes.aspx.cs" Inherits="Vistas.RegistroClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro Cliente</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">
        body { padding-top: 70px; }
    </style>
</head>
     <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
      <span class="sr-only">Desplegar navegación</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">Logotipo</a>
  </div>
 
  <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li ><a href="Inicio.aspx">Inico</a></li>
      <li class="active"><a href="#">Registro Clientes</a></li>
      <li><a href="RegistroMensajeros.aspx">Registro Mensajeros</a></li>      
    </ul>
  </div>
</nav>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <asp:Panel runat="server" Visible="false" ID="PanelAlerta">
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Buen trabajo!</strong>
                            <label>
                               La accion se ejecuto correctamente
                            </label>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlAlertaError" runat="server" Visible="false">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Oppssss!</strong>
                            <label>
                                Ocurrio un error al intentarejecutar la accion. 
                            </label>
                        </div>
                    </asp:Panel>

                    <div class="form-group">
                        <asp:TextBox ID="txtid" CssClass="form-control" runat="server" Visible="false" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Nombre Persona" runat="server" />
                        <asp:TextBox ID="txtNombrePersona" CssClass="form-control" runat="server" placeholder="Ejempl: Cliente Andres" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Apellido Persona" runat="server" />
                        <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" placeholder="Ejempl: Cliente Sierra" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Edad Persona" runat="server" />
                        <asp:TextBox ID="txtEdad" CssClass="form-control" runat="server" placeholder="Ejempl: Cliente 22" TextMode="Number" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Usuario" runat="server" />
                        <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" placeholder="Ejempl: alejodad" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Correo Electronico" runat="server" />
                        <asp:TextBox ID="txtCorreo" CssClass="form-control" runat="server" placeholder="Ejempl: alguie@hotmail.com" TextMode="Email" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Contraseña" runat="server" />
                        <asp:TextBox ID="txtContrasena" CssClass="form-control" runat="server" placeholder="Ejempl: 123" TextMode="Password" />  
                    </div>
                    <div class="form-group">
                        <asp:Button Text="Guardar"  ID="btnGuardar" CssClass="btn btn-success" runat="server" OnClick="btnGuardar_Click"/>
                    </div>
                </div>
            </div>

            <asp:GridView runat="server" ID="datosClientes" AutoGenerateColumns="false" CssClass="table table-hover" OnRowCommand="datosClientes_RowCommand"  >  
                <Columns>
                    <asp:BoundField HeaderText="Codigo" DataField="idPersona" />             
                    <asp:BoundField HeaderText="Nombre" DataField="nombrePersona" />   
                    <asp:BoundField HeaderText="Apellido" DataField="apellidoPersona" />   
                    <asp:BoundField HeaderText="Edad" DataField="edad" />  
                   <asp:TemplateField>
                       <ItemTemplate>
                           <asp:Button Text="Editar" runat="server" CommandName="Editar" CommandArgument="<%#(( GridViewRow)Container).RowIndex %>" CssClass="btn btn-primary" />
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField>
                       <ItemTemplate>
                           <asp:Button Text="Eliminar" runat="server" CommandName="Eliminar" CommandArgument="<%#(( GridViewRow)Container).RowIndex %>" CssClass="btn btn-danger" />
                       </ItemTemplate>
                   </asp:TemplateField>


                </Columns>
            </asp:GridView>
        </div>
    </form>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
