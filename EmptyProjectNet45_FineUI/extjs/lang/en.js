Ext.apply(F.ajax,{errorMsg:"Error! {0} ({1})",timeoutErrorMsg:"Request timeout, please refresh the page and try again!"});Ext.apply(F.util,{alertTitle:"Alert Dialog",confirmTitle:"Confirm Dialog",formAlertTitle:"Form Invalid",loading:"Loading..."});Ext.apply(F.wnd,{closeButtonTooltip:"Close this window",formChangeConfirmMsg:"Current form has been modified, abandon changes?"});Ext.ux.TabCloseMenu&&Ext.apply(Ext.ux.TabCloseMenu.prototype,{closeTabText:"Close Tab",closeOthersTabsText:"Close Other Tabs",closeAllTabsText:"Close All Tabs"});Ext.ux.form&&Ext.ux.form.FileUploadField&&Ext.apply(Ext.ux.form.FileUploadField.prototype,{buttonText:"Browse..."});Ext.panel.Panel&&Ext.apply(Ext.panel.Panel.prototype,{collapseToolText:"Collapse panel",expandToolText:"Expand panel"});Ext.window.Window&&Ext.apply(Ext.window.Window.prototype,{closeToolText:"Close window"});Ext.window.MessageBox&&Ext.apply(Ext.window.MessageBox.prototype,{closeToolText:"Close dialog"});Ext.form.field.Number&&Ext.apply(Ext.form.field.Number.prototype,{negativeText:"The value cannot be negative"})