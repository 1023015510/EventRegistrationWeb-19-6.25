﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EventRegistrationWeb.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="UpdatePanel7" runat="server">
      <ContentTemplate>
       <asp:Timer ID="Timer5" runat="server" Interval="2000" OnTick="Timer1_Tick">
          </asp:Timer>
     
          </ContentTemplate>
          </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
