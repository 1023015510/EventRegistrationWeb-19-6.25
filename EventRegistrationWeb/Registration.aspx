<%@  Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EventRegistrationWeb.Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>:系统登录</title>    
		<%-- <link href="Styles/login.css" type="text/css" rel="stylesheet" />  --%>
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
        }
        .style2
        {
            color: #000000;
        }
        #txtUsername
        {
            width: 157px;
        }
        #txtPass
        {
            width: 155px;
        }
    </style>
    
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function txtUsername_onclick() {

        }

// ]]>
    </script>
</head>
<body>
  <form id="form1" runat="server">
            <br />   
			<br />
			<br />
			<br />
			<br />
        <table width="650" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="650"><img  height="11" src="images/login_p_img02.gif" width="650" alt = ""/></td>
                    </tr>
					<tr>
                            <td align="center" style="background:url(images/login_p_img03.gif)"><br /> 
                            
							<table width="650" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><table cellspacing="0" cellpadding="0" width="650" border="0">
												<tr>
													<td colspan="2" width="6500" height="80" align="center" valign="top" 
                                                        class="style1">  内河500位监控系统登录 </td>
												</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><img src="images/btbg.gif" width="650" height="3" alt=""/></td>   <%-- a_te01--%>
								</tr>
								<tr>
									<td align="center"> 
									<table width="500" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="123" height="120"><img height="95" src="images/login_p_img05.gif" width="123" border="0" alt=""></td>
												<td align="center"><table cellspacing="0" cellpadding="0" border="0">
														
															<tr>
																<td align="left" height="25"  valign="top">用户名：</td> <td><input class="nemo01" tabindex=1 maxlength="22" size="22" name="user" id="txtUsername"
																		runat="server" onclick="return txtUsername_onclick()">																
                                                                </td>
																<td  rowspan="3" align="right" valign="middle">
																	<asp:ImageButton id="btnLogin" runat="server" TabIndex=1 
                                                                        ImageUrl="images/login_p_img11.gif" onclick="btnLogin_Click" 
                                                                        DescriptionUrl="~/ViewData.aspx"></asp:ImageButton> 
                                                                </td>
															</tr>
                                                          
															<tr>
																<td align="left"  valign="bottom" >密  码：</td> <td><input name="user" type="password" class="nemo01" tabindex=1 size="22" maxlength="22"
																		id="txtPass" runat="server" />
                                                                </td>

                                                                 <td  rowspan="3" align="right" valign="middle" >
                                                                     &nbsp;</td>

															</tr>
                                                           
															<tr>
															  <td valign="bottom" height="13" class="style1"><table width="100%" style = "height:25" border="0" cellpadding="0" cellspacing="0">
                                                              <tr><td><a id="A1" onclick = "OpenUserInfoUpdatePage();" href="#" class="style2"><%--用户资料修改--%></a></td></tr>
                                                          
                                                              </table></td>
												  </tr>
																										
													</table>
													<br />
													<asp:Label id="lblMsg" runat="server" BackColor="Transparent" ForeColor="Red"></asp:Label>
												    
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td bgcolor="#d5d5d5"></td>
								</tr>
                        
							</table>
						</td>
					</tr>
					<tr>
						<td><img height="11" src="images/login_p_img04.gif" width="650" alt = ""/></td>
					</tr>
			</table>
    </form>
</body>
</html>



