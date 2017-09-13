<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recuperar.aspx.cs" Inherits="Vistas.Recuperar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Recuperar Contraseña</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label Text="Usuario" runat="server" />
        <asp:TextBox runat="server" ID="txtUser" />  
        <asp:Button Text="Enviar Correo " runat="server" ID="btnRecuperar" OnClick="btnRecuperar_Click" />
    </form>
</body>
</html>
