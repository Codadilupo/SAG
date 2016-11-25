<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  <script language="JavaScript">
    <!--add jscript here-->
    function populateForm(form , aliasNM ,oper)
    {
        if('edit' == oper)
            form.operation.value = "edit";
        if('test' == oper)
            form.operation.value = "test";  
        if('remove' == oper)
        {
            if (!confirm ("OK to delete '"+aliasNM+"'?")) {
                return false;
            }
            form.operation.value = 'remove';    
        }
        form.alias.value = aliasNM;
        return true
    }
    
  </script>
  
  <body onLoad="setNavigation('settings-sftp-client-usersettings.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_SFTP_UserAliasSettings');">
   
    <table width="100%">
        <tr>
            <td class="breadcrumb" colspan="2"> Settings &gt; SFTP &gt; User Alias Settings</td>
        </tr>
        %ifvar operation equals('add')%
            %invoke wm.server.sftpclient:createUserAlias%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
        %endif%   
        %ifvar operation equals('edit')%
            %invoke wm.server.sftpclient:updateUserAlias%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
        %endif% 
        %ifvar operation equals('remove')%
            %invoke wm.server.sftpclient:removeUserAlias%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
        %endif%     
        %ifvar operation equals('test')%
            %invoke wm.server.sftpclient:testConnection%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
        %endif%     
        <tr>
            <td colspan="2">
                <ul class="listitems">
                    <li class="listitem"><a href="settings-sftp-client.dsp">Return to SFTP</a></li>
                    <li class="listitem"><a href="settings-sftp-client-useralias-addedit.dsp?operation=add">Create&nbsp;User&nbsp;Alias</a></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <table width="50%">
                    <tr>
                        <td>    
                            <table class="tableView" width="100%">
                                <tr>
                                    <td class="heading" colspan="7">SFTP User List</td>
                                </tr>
                                <tr>
                                    <td class="oddcol-l">SFTP User Alias</td>
                                    <td class="oddcol">SFTP Server Alias</td>
                                    <td class="oddcol">User</td>
                                    <td class="oddcol">Authentication Type</td>
                                    <td class="oddcol">Test</td>
                                    <td class="oddcol">Delete</td>
                                </tr>
                                %invoke wm.server.sftpclient:listUserAliases%
                                    %loop SFTPUserAliases%
                                        <tr>
                                            <script>writeTD("row-l");</script>
												<a href="javascript:document.htmlform_sftpUser_edit.submit();" onClick="return populateForm(document.htmlform_sftpUser_edit,'%value alias encode(javascript)%','edit');">
												   %value alias encode(html)%
                                                </a>   
                                            </td>
                                            <script>writeTD("rowdata");</script>
												 %value sftpServerAlias encode(html)%
                                            </td>
                                            <script>writeTD("rowdata");</script>
												 %value userName encode(html)%
                                            </td>                       
                                            <script>writeTD("rowdata");</script>
                                            %ifvar authenticationType equals('password')%
                                                Password
                                            %else%
                                                %ifvar authenticationType equals('publicKey')%
                                                    Public Key 
                                                %else%
													%value authenticationType encode(html)%
                                                %endif%
                                            %endif%
                                            </td>
                                            <script>writeTD("rowdata");</script>
												<a href="javascript:document.htmlform_sftpUser_delete.submit();" onClick="return populateForm(document.htmlform_sftpUser_delete,'%value alias encode(javascript)%','test');">
                                                    <img src="icons/checkdot.png" border="none" width="14" height="14">
                                                </a>
                                            </td>
                                            <script>writeTD("rowdata");</script>
												<a href="javascript:document.htmlform_sftpUser_delete.submit();" onClick="return populateForm(document.htmlform_sftpUser_delete,'%value alias encode(javascript)%','remove');">
                                                    <img src="icons/delete.png" border="no">
                                                </a>    
                                            </td>
                                        </tr>
                                        <script>swapRows();</script>
                                    %endloop%
                                %endinvoke% 
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form name="htmlform_sftpUser_edit" action="settings-sftp-client-useralias-addedit.dsp" method="POST">
        <input type="hidden" name="operation">
        <input type="hidden" name="alias">
    </form>
    <form name="htmlform_sftpUser_delete" action="settings-sftp-client-usersettings.dsp" method="POST">
        <input type="hidden" name="operation">
        <input type="hidden" name="alias">
    </form>
  </body>   
</head>
