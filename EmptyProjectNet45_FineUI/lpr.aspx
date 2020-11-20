<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lpr.aspx.cs" Inherits="EmptyProjectNet45_FineUI.lpr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<style>
        .photo {
            height: 150px;
            line-height: 150px;
            overflow: hidden;
        }

            .photo img {
                height: 150px;
                vertical-align: middle;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" Width="550px" EnableCollapse="true"
            ShowBorder="True" Title="车辆识别" ShowHeader="True">
            <Items>
                <f:Image ID="imgPhoto" CssClass="photo" ImageUrl="~/res/images/blank.png" ShowEmptyLabel="true" runat="server">
                </f:Image>
                <f:FileUpload runat="server" ID="filePhoto" ShowRedStar="false" ShowEmptyLabel="true"
                    ButtonText="上传车辆照片" ButtonOnly="true" Required="false" ButtonIcon="ImageAdd"
                    AutoPostBack="true" OnFileSelected="filePhoto_FileSelected">
                </f:FileUpload>
                
                <f:DatePicker runat="server" Required="true" Label="日期" EmptyText="请选择日期"
                            ID="DatePicker1" SelectedDate="2014-07-10" ShowRedStar="True">
                        </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidateForms="SimpleForm1"
                    Text="提交">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
</body>
</html>