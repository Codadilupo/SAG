<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  <script language="JavaScript">
    <!--add jscript here-->
    function populateForm(form , glNm ,oper)
    {
        if('edit' == oper)
            form.operation.value = "edit";
        if('delete' == oper)
        {
            if (!confirm ("OK to delete '"+glNm+"'?")) {
                return false;
            }
            form.operation.value = 'delete';    
        }
        form.alias.value = glNm;
        return true
    }
    
  </script>
  
  <body onLoad="setNavigation('settings-sftp-client.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_SFTP');">
   
    <table width="100%">
        <tr>
            <td class="breadcrumb" colspan="2"> Settings &gt; SFTP </td>
        </tr>
            %ifvar operation equals('add')%
            %invoke wm.server.sftpclient:createServerAlias%
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
            %invoke wm.server.sftpclient:updateServerAlias%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
        %endif% 
        %ifvar operation equals('delete')%
            %invoke wm.server.sftpclient:deleteServerAlias%
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
                    <li class="listitem"><a href="settings-sftp-client-serveralias-addedit.dsp?operation=add">Create&nbsp;Server&nbsp;Alias</a></li>
                    <li class="listitem"><a href="settings-sftp-client-usersettings.dsp">User Alias Settings</a></li>
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
                                    <td class="heading" colspan="6">SFTP Server List</td>
                                </tr>
                                <tr>
                                    <td class="oddcol-l">Alias</td>
                                    <td class="oddcol">Host</td>
                                    <td class="oddcol">Port</td>
									<td class="oddcol">Proxy Alias</td>
                                    <td class="oddcol">Host Key Fingerprint</td>
                                    <td class="oddcol">Delete</td>
                                </tr>
                                %invoke wm.server.sftpclient:listServerAliases%
                                    %loop SFTPServerAliases%
                                        <tr>
                                            <script>writeTD("row-l");</script>
												<a href="javascript:document.htmlform_sa_edit.submit();" onClick="return populateForm(document.htmlform_sa_edit,'%value alias encode(javascript)%','edit');">
												   %value alias encode(html)%
                                                </a>   
                                            </td>
                                            <script>writeTD("rowdata");</script>
												 %value hostName encode(html)%
                                            </td>                       
                                            <script>writeTD("rowdata");</script>
												 %value port encode(html)%
                                            </td>
											<script>writeTD("rowdata");</script>
												%ifvar proxyAlias%
													%value proxyAlias encode(html)%
												%else%
													&lt;None&gt;
												%endif%  
                                            </td>
                                            <script>writeTD("rowdata");</script>
                                                 %value fingerprint encode(html)%
                                            </td>
                                            <script>writeTD("rowdata");</script>
												<a href="javascript:document.htmlform_sa_delete.submit();" onClick="return populateForm(document.htmlform_sa_delete,'%value alias encode(javascript)%','delete');">
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
    <form name="htmlform_sa_edit" action="settings-sftp-client-serveralias-addedit.dsp" method="POST">
        <input type="hidden" name="operation">
        <input type="hidden" name="alias">
    </form>
    <form name="htmlform_sa_delete" action="settings-sftp-client.dsp" method="POST">
        <input type="hidden" name="operation">
        <input type="hidden" name="alias">
    </form>
  </body>   
</head>
