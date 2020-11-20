<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs"
    Inherits="EmptyProjectNet20.login" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>学校汽车进出管理系统</title>
</head>
<body style="background-image:url(图片/manu-schwendener-DSwBHyWKiVw-unsplash.jpg); background-repeat:no-repeat;">
    <div style="float: left;">
        <br />
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black;font-family:  Microsoft YaHei;font-size: 40px"><br></span></div>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Title="登录" IsModal="false" EnableClose="false"
            WindowPosition="GoldenSection" Width="350px">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" BodyPadding="10px"
                    LabelWidth="60px" ShowHeader="false">
                    <Items>
                        <f:TextBox ID="tbxUserName" Label="用户名" Required="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" TextMode="Password" Required="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxCaptcha" Label="验证码" Required="true" runat="server">
                        </f:TextBox>
                        <f:Panel CssStyle="padding-left:65px;" ShowBorder="false" ShowHeader="false" runat="server">
                            <Items>
                                <f:Image ID="imgCaptcha" CssStyle="float:left;width:160px;" runat="server">
                                </f:Image>
                                <f:LinkButton CssStyle="float:left;margin-top:8px;" ID="btnRefresh" Text="看不清？"
                                    runat="server" OnClick="btnRefresh_Click">
                                </f:LinkButton>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button ID="btton" Text="管理员登陆" Type="Submit" ValidateForms="SimpleForm1" ValidateTarget="Top" runat="server" OnClick="btton_Click"></f:Button>
                        <f:Button ID="Button1" Text="注册" Type="Submit"  runat="server" OnClick="Button1_Click"></f:Button>
                        <f:Button ID="btnReset" Text="重置" Type="Reset" EnablePostBack="false" runat="server"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
</body>
</html>
