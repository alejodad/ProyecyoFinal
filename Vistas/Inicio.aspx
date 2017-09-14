<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio</title>
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
      <li class="active"><a href="#">Inico</a></li>
      <li "><a href="RegistroClientes.aspx">Registro Clientes</a></li>
      <li><a href="RegistroMensajeros.aspx">Registro Mensajeros</a></li>      
    </ul>
  </div>
</nav>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <div class="form-group">

                    </div>

                    <div class="form-group">
                        <asp:Button Text="Cerrar Sesion" ID="out" runat="server" OnClick="out_Click" CssClass="btn btn-default" />
                    </div>
            </div>
        </div>

        <div>
        </div>
    </form>
</body>
</html>
