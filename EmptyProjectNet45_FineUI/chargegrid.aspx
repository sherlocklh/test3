﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chargegrid.aspx.cs" Inherits="EmptyProjectNet45_FineUI.chargegrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
    <div class="line">
                            <asp:Button ID="DISPLAY" runat="server" Text="显示全表" CssClass="buttom" OnClick="DISPLAY_Click" />
                        </div>
                        <div class="line">
                            共有<asp:Label ID="rowcount" runat="server" Text=""></asp:Label>条记录
                        <br />
                        </div>
                        <div class="line">
                            <asp:TextBox ID="txtfind" runat="server" CssClass="box" />
                        <asp:Button ID="FINDBUTTOM" runat="server" Text="搜索"   OnClick="FINDBUTTOM_Click" CssClass="buttom" />
                        </div>
    </div>
            <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CssClass="gridview"
                            OnRowEditing="GridView2_RowEditing" OnRowDeleting="GridView2_RowDeleting" OnPageIndexChanging="GridView2_PageIndexChanging"
                            OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowUpdating="GridView2_RowUpdating"  OnRowCommand="GridView2_RowCommand" DataKeyNames="NUM" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ord" HeaderText="序号" ReadOnly="True" SortExpression="ord" />
                        <asp:BoundField DataField="licensenum" HeaderText="车牌号" SortExpression="licensenum" />
                        <asp:BoundField DataField="approver" HeaderText="审批人" SortExpression="approver" />
                        <asp:BoundField DataField="date" HeaderText="日期" SortExpression="date" />
                        <asp:BoundField DataField="enter" HeaderText="进入时间" SortExpression="enter" />
                        <asp:BoundField DataField="leave" HeaderText="离开时间" SortExpression="leave" />
                        <asp:BoundField DataField="hour" HeaderText="小时" SortExpression="hour" />
                        <asp:BoundField DataField="min" HeaderText="分钟" SortExpression="min" />
                        <asp:BoundField DataField="state" HeaderText="是否违规" SortExpression="state" />
                        <asp:BoundField DataField="receivables" HeaderText="应收款" SortExpression="receivables" />
                        <asp:BoundField DataField="Payment" HeaderText="实收款" SortExpression="Payment" />
                    <asp:CommandField HeaderText="选中行" ShowHeader="True" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="编辑" ShowEditButton="True" ShowHeader="True" />
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" ShowHeader="True" />
                    <asp:ButtonField ButtonType="Button" CommandName="Note_Operation" HeaderText="提示" ShowHeader="True" Text="操作提示" />
                 </Columns>
        <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
    </form>
</body>
</html>