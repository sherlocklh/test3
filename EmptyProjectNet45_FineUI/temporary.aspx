<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="temporary.aspx.cs" Inherits="EmptyProjectNet45_FineUI.temporary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form1" MessageTarget="Qtip" Width="600px" BodyPadding="5px" Title="表单" runat="server">
            <items>
                <f:Panel ID="Panel2" ShowHeader="false" CssClass="formitem" ShowBorder="false"
                    Layout="Column" runat="server">
                    <Items>
                        <f:Label ID="Label2" Width="100px" runat="server" CssClass="marginr" ShowLabel="false"
                            Text="车牌号：">
                        </f:Label>
                        <f:TextBox ID="TextBox2" ShowLabel="false" Label="车牌号" Required="true" Width="150px" CssClass="marginr" runat="server">
                        </f:TextBox>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel1" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="formitem"
                    runat="server">
                    <Items>
                        <f:Label ID="Label1" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="进出时间：">
                        </f:Label>
                        <f:DatePicker ID="DatePicker1" ShowLabel="false" Label="进入时间" Required="true" CssClass="marginr" Width="150px" runat="server">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker2" ShowLabel="false" Label="离开时间" Required="true" CompareControl="DatePicker1" CompareOperator="GreaterThan"
                            CompareMessage="离开日期应该大于进入日期！" Width="150px" runat="server">
                        </f:DatePicker>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="formitem"
                    runat="server">
                    <Items>
                        <f:Label ID="Label4" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="进入时长：">
                        </f:Label>
                        <f:TextBox Width="40px" ShowLabel="false" Label="工作时间（小时）" Required="true" ID="TextBox11" runat="server">
                        </f:TextBox>
                        <f:Label runat="server" Text="&nbsp;小时&nbsp;">
                        </f:Label>
                        <f:TextBox Width="40px" ShowLabel="false" Label="工作时间（分钟）" Required="true" ID="TextBox1" runat="server">
                        </f:TextBox>
                        <f:Label ID="Label5" runat="server" Text="&nbsp;分钟">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Button ID="Button1" Text="提交表单" ValidateForms="Form1" ValidateMessageBox="true" runat="server" OnClick="Button1_Click">
                </f:Button>
            </items>
        </f:Form>
        <br />
    </form>
</body>
</html>