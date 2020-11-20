<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default1.aspx.cs" Inherits="EmptyProjectNet45_FineUI.default1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        #header table {
            width: 100%;
            border-spacing: 0;
            border-collapse: separate;
        }

            #header table td {
                padding: 0;
            }

        #header .title a,
        #header .pro a {
            font-weight: bold;
            font-size: 24px;
            text-decoration: none;
            line-height: 50px;
            margin-left: 10px;
        }

        #header .pro {
            position: absolute;
            top: 0;
            right: 10px;
        }

        .bottomtable {
            width: 100%;
            font-size: 12px;
        }


        /* 主题相关样式 - neptune */
        .f-theme-neptune #header,
        .f-theme-neptune .bottomtable,
        .f-theme-neptune .x-splitter {
            background-color: #1475BB;
            color: #fff;
        }

            .f-theme-neptune #header a,
            .f-theme-neptune .bottomtable a {
                color: #fff;
            }

            .f-theme-neptune #header .x-btn-over.x-btn-default-small {
                background-color: #3487c3;
            }


        /* 主题相关样式 - blue/classic */
        .f-theme-classic #header,
        .f-theme-classic .bottomtable {
            background-color: #DFE8F6;
            color: #000;
        }

            .f-theme-classic #header a,
            .f-theme-classic .bottomtable a {
                color: #000;
            }

            .f-theme-classic #header .x-btn-over.x-btn-default-small {
                background-color: #e4f3ff;
            }


        /* 主题相关样式 - gray */
        .f-theme-gray #header,
        .f-theme-gray .bottomtable {
            background-color: #E0E0E0;
            color: #333;
        }

            .f-theme-gray #header a,
            .f-theme-gray .bottomtable a {
                color: #333;
            }

            .f-theme-gray #header .x-btn-over.x-btn-default-small {
                background-color: #f3f3f3;
            }


        /* 主题相关样式 - crisp */
        .f-theme-crisp #header,
        .f-theme-crisp .bottomtable,
        .f-theme-crisp .x-splitter {
            background-color: #E1E1E1;
            color: #000;
        }

            .f-theme-crisp #header a,
            .f-theme-crisp .bottomtable a {
                color: #000;
            }

            .f-theme-crisp #header .x-btn-inner-default-small {
                color: #000;
            }

            .f-theme-crisp #header .x-btn-over.x-btn-default-small .x-btn-inner-default-small {
                color: #fff;
            }

            .f-theme-crisp #header .x-btn-over.x-btn-default-small {
                background-color: #3487c3;
            }


        /* 主题相关样式 - triton */
        .f-theme-triton #header,
        .f-theme-triton .bottomtable,
        .f-theme-triton .x-splitter {
            background-color: #477aa6;
            color: #fff;
        }

            .f-theme-triton #header a,
            .f-theme-triton .bottomtable a {
                color: #fff;
            }

            .f-theme-triton #header .x-btn-over.x-btn-default-small {
                background-color: #5795cb;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
        <f:RegionPanel ID="RegionPanel1" ShowBorder="false" runat="server">
            <Regions>
                <f:Region ID="Region1" ShowBorder="false" Height="50px" ShowHeader="false"
                    Position="Top" Layout="Fit" runat="server">
                    <Content>
                        <div id="header">
                            <table>
                                <tr>
                                    <td>
                                        <div class="title">
                                            <a href="./default.aspx">学校车辆进出管理系统</a>
                                        </div>
                                    </td>
                                    <td>
                                    <div class="title">
                                            <a href="./login.aspx">退出系统</a>
                                        </div></td>
                                </tr>
                            </table>
                        </div>
                    </Content>
                </f:Region>
                <f:Region ID="Region2" Split="true" Width="200px" ShowHeader="true" Title="菜单"
                    EnableCollapse="true" Layout="Fit" Position="Left" runat="server">
                    <Items>
                        <f:Tree runat="server" ShowBorder="false" ShowHeader="false" EnableArrows="true" EnableLines="true" ID="leftMenuTree">
                            <Nodes>
                                <f:TreeNode Text="临时车辆管理" Expanded="true">
                                    <f:TreeNode Text="扫描车辆信息" NavigateUrl="~/lpr.aspx"></f:TreeNode>
                                    <f:TreeNode Text="临时车辆信息录入" NavigateUrl="~/temporary.aspx"></f:TreeNode>
                                    <f:TreeNode Text="临时车辆表单" NavigateUrl="~/temgrid.aspx"></f:TreeNode>
                                </f:TreeNode>
                                 <f:TreeNode Text="车辆办证管理" Expanded="true">
                                    <f:TreeNode Text="注册车辆信息" NavigateUrl="~/apply.aspx"></f:TreeNode>
                                    <f:TreeNode Text="车辆办证表单" NavigateUrl="~/gridpage.aspx"></f:TreeNode>
                                </f:TreeNode>
                                 <f:TreeNode Text="车辆进出管理" Expanded="true">
                                    <f:TreeNode Text="车辆收费信息录入" NavigateUrl="~/charge.aspx"></f:TreeNode>
                                    <f:TreeNode Text="车辆收费信息记录" NavigateUrl="~/chargegrid.aspx"></f:TreeNode>
                                </f:TreeNode>
                                <f:TreeNode Text="车位管理" Expanded="true">
                                    <f:TreeNode Text="车位查询" NavigateUrl="~/parking.aspx"></f:TreeNode>
                                </f:TreeNode>
                            </Nodes>
                        </f:Tree>
                    </Items>
                </f:Region>
                <f:Region ID="mainRegion" ShowHeader="false" Layout="Fit" Position="Center"
                    runat="server">
                    <Items>
                        <f:TabStrip ID="mainTabStrip" EnableTabCloseMenu="true" ShowBorder="false" runat="server">
                            <Tabs>
                                <f:Tab ID="Tab1" Title="首页" Layout="Fit" Icon="House" runat="server">
                                    <Items>
                                        <f:ContentPanel ID="ContentPanel2" ShowBorder="false" BodyPadding="10px" ShowHeader="false" AutoScroll="true"
                                            runat="server">
                                            <h2><asp:Label runat="server" ID="name"></asp:Label>&nbsp;&nbsp;欢迎您使用本系统！</h2>
                                        </f:ContentPanel>
                                    </Items>
                                </f:Tab>
                            </Tabs>
                        </f:TabStrip>
                    </Items>
                </f:Region>
                <f:Region ID="bottomPanel" RegionPosition="Bottom" ShowBorder="false" ShowHeader="false" EnableCollapse="false" runat="server" Layout="Fit">
                    <Items>
                        <f:ContentPanel ID="ContentPanel3" runat="server" ShowBorder="false" ShowHeader="false">
                            <table class="bottomtable">
                            </table>
                                     </f:ContentPanel>
                    </Items>
                </f:Region>
            </Regions>
        </f:RegionPanel>
    </form>
    <script>
        var menuClientID = '<%= leftMenuTree.ClientID %>';
        var tabStripClientID = '<%= mainTabStrip.ClientID %>';

        // 页面控件初始化完毕后，会调用用户自定义的onReady函数
        F.ready(function () {

            var treeMenu = F(menuClientID);
            var mainTabStrip = F(tabStripClientID);

            // 初始化主框架中的树(或者Accordion+Tree)和选项卡互动，以及地址栏的更新
            // treeMenu： 主框架中的树控件实例，或者内嵌树控件的手风琴控件实例
            // mainTabStrip： 选项卡实例
            // updateHash: 切换Tab时，是否更新地址栏Hash值（默认值：true）
            // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame（默认值：false）
            // refreshWhenTabChange: 切换选项卡时，是否刷新内部IFrame（默认值：false）
            // maxTabCount: 最大允许打开的选项卡数量
            // maxTabMessage: 超过最大允许打开选项卡数量时的提示信息
            F.initTreeTabStrip(treeMenu, mainTabStrip, {
                maxTabCount: 10,
                maxTabMessage: '请先关闭一些选项卡（最多允许打开 10 个）！'
            });

        });
    </script>
</body>
</html>
