<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registe.aspx.cs" Inherits="EmptyProjectNet45_FineUI.registe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-image:url(图片/manu-schwendener-DSwBHyWKiVw-unsplash.jpg); background-repeat:no-repeat;">
<div style="float: left;">
        <br />
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black;font-family:  Microsoft YaHei;font-size: 40px"><br></span></div>
    <form id="form2" runat="server">
        <f:PageManager ID="PageManager2" runat="server" />
        <f:Window ID="Window2" runat="server" Title="注册" IsModal="false" EnableClose="false"
            WindowPosition="GoldenSection" Width="350px">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" BodyPadding="10px"
                    LabelWidth="60px" ShowHeader="false">
                    <Items>
                        <f:TextBox ID="tbxUserName" Label="用户名" Required="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" TextMode="Password" Required="true" runat="server">
                        </f:TextBox>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="btnRegister" Text="注册" Type="Submit" ValidateForms="SimpleForm1" ValidateTarget="Top" runat="server" OnClick="btnRegister_Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
</body>
</html>