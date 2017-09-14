<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recuperar.aspx.cs" Inherits="Vistas.Recuperar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recuperar Contraseña</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <div class="col-md-offset-4 col-md-12">
                    
                    <asp:Panel runat="server" Visible="false" ID="PanelAlerta">
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Buen trabajo!</strong>
                            <label>
                                se envio correo 
                            </label>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlAlertaError" runat="server" Visible="false">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Oppssss!</strong>
                            <label>
                                Ocurrio un error al intentar enviar el correo. 
                            </label>
                        </div>
                    </asp:Panel>

                    <div class="form-group">
                        <asp:Label Text="Usuario" runat="server" />
                        <asp:TextBox runat="server" ID="txtUser" />
                    </div>

                    <div class="form-group">
                        <asp:Button Text="Enviar Correo " runat="server" ID="btnRecuperar" OnClick="btnRecuperar_Click" CssClass="btn btn-success" />
                        <asp:Button Text="Volver a Login" ID="btnLogin" runat="server" OnClick="btnLogin_Click" CssClass="btn btn-default" />
                    </div>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
