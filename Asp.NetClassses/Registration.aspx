<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Asp.NetClassses.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="auto-style1">
                <tr>
                    <td colspan="4" style="text-align: center; vertical-align: top">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Registration "></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td colspan="4"></td>

                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center">
                        <asp:Label ID="Label6" runat="server" Font-Size="X-Large" Text="User Name :"></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtUserName" runat="server" Font-Size="X-Large"></asp:TextBox>
                       
                    </td>

                </tr>
                <tr>
                    <td colspan="4" style="text-align: center"> <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtUserName" ErrorMessage="Please enter full name" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center">
                        <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="UserId :"></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtBoxUserId" runat="server" Font-Size="X-Large"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtBoxUserId" ErrorMessage="Please enter user Id" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center">
                        <asp:Label ID="Label3" runat="server" Font-Size="X-Large" Text="Password :"></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtBoxPasword" runat="server" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtBoxPasword" ErrorMessage="Please enter password" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center">
                        <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Email :"></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtEmail" runat="server" Font-Size="X-Large"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtEmail" ErrorMessage="Please enter email" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: center">&nbsp;&nbsp;
                        <asp:Button ID="btnRegister" BorderStyle="None" Font-Size="X-Large" runat="server" Text="Register" OnClick="btnRegister_Click" />
                    </td>
                    <td></td>

                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Font-Size="X-Large"></asp:Label>
                    </td>
                    <td></td>

                </tr>
                <tr>
                    <td colspan="4" style="text-align: center">
                        <asp:Button ID="btnLogin" runat="server" BorderStyle="None" Font-Size="X-Large" Visible="false" Text="Log In" OnClick="Button1_Click" />
                    </td>


                </tr>
            </table>

        </div>
    </form>
</body>
</html>
