<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroClientes.aspx.cs" Inherits="Vistas.RegistroClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro Cliente</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
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
                        <asp:TextBox ID="txtEdad" CssClass="form-control" runat="server" placeholder="Ejempl: Cliente 22" />  
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
