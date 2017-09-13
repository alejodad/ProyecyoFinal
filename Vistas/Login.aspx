<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Login </title>

</head>
<body>
    <form id="form1" runat="server">
        <div calss=container>
            <div class="row">
                <div class="col-md-offset-4 col-md-4">
                    <div class="panel panel-default">
                        <didv class="panel-heading">Iniciar sesion</didv>
                        <div class="panel-body">
                            <div class="form-group">
                                <asp:Label Text="Usuario" runat="server" />
                                <asp:TextBox runat="server" ID="txtUser" CssClass="form-control" />  
                            </div>
                            
                            <div class="form-group">
                                <asp:Label Text="Contraseña" runat="server" />
                                <asp:TextBox runat="server" ID="txtPass" TextMode="Password" CssClass="form-control" />  
                            </div>
                            <div class="form-group">
                                <asp:Button Text="Iniciar" ID="btnIniciar" CssClass ="btn btn-success" runat="server" OnClick="btnIniciar_Click" />
                                <asp:Button Text="Recupera Contraseña" ID="btnRecuperar" CssClass="btn btn-default" runat="server" OnClick="btnRecuperar_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
