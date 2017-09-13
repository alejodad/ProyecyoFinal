<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroMensajeros.aspx.cs" Inherits="Vistas.RegistroMensajeros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro Mensajero</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <asp:Label Text="Nombre Persona" runat="server" />
                        <asp:TextBox ID="txtNombrePersona" CssClass="form-control" runat="server" placeholder="Ejempl: Andres" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Apellido Persona" runat="server" />
                        <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" placeholder="Ejempl: Sierra" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Edad Persona" runat="server" />
                        <asp:TextBox ID="txtEdad" CssClass="form-control" runat="server" placeholder="Ejempl: 22" />  
                    </div>
                    <div class="form-group">
                        <asp:Label Text="Usuario" runat="server" />
                        <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server" placeholder="Ejempl: alejodad" />  
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
        </div>
    </form>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
