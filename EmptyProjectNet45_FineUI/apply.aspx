<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apply.aspx.cs" Inherits="EmptyProjectNet45_FineUI.apply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .redcolor {
        }
    </style>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form Width="600px" LabelWidth="100px" BodyPadding="5px" EnableCollapse="true"
            ID="Form2" runat="server" Title="申请单">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="Label3" Required="true" ShowRedStar="true" Label="电话" EmptyText="请输入常用电话" runat="server"></f:TextBox>
                        <f:TextBox ID="Label16" Required="true" ShowRedStar="true" runat="server" EmptyText="请输入姓名" Label="申请人">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="Label4" Required="true" ShowRedStar="true" Label="车牌号" EmptyText="请输入车牌号" runat="server"></f:TextBox>
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL" EmptyText="请输入常用电子邮箱"
                            RegexMessage="请输入有效的邮箱地址！" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" Required="true" EmptyText="请选择审批人" runat="server" ShowRedStar="True" AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                    </Items>
                </f:FormRow>
<f:FormRow>
                    <Items>
                        <f:DatePicker runat="server" Required="true" Label="日期" EmptyText="请选择日期"
                            ID="DatePicker1" SelectedDate="2014-07-10" ShowRedStar="True">
                        </f:DatePicker>
                        <f:TimePicker ID="TimePicker1" ShowRedStar="True" Label="时间" Increment="30"
                            Required="true" Text="08:30" EmptyText="请选择时间" runat="server">
                        </f:TimePicker>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowRedStar="True" Required="True">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false"
                            ShowHeader="false">
                            <Items>
                                <f:Button ID="btnSubmitForm2" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
                                    ValidateForms="Form2">
                                </f:Button>
                                <f:Button ID="btnResetForm2" EnablePostBack="false" Text="重置申请表" runat="server">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
    </form>
</body>
</html>