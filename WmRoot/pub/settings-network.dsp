<HTML>
<HEAD>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">
<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
<SCRIPT SRC="webMethods.js.txt"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
  
  function confirmDelete (alias) {
    var msg = "OK to delete the proxy alias '"+alias+"'?";
    if (confirm (msg)) {
        document.settingsNetwork.proxyAlias.value = alias;
        document.settingsNetwork.action.value = "delete";
        document.settingsNetwork.submit();
        return false;
    } 
    else 
        return false;
  }

  function confirmStatusChange(alias, action)
  {
    var msg = "";
    if ( action == "enable") {
        msg = "Are you sure you want to enable the proxy alias '"+alias+"'?";
    }
    else if ( action == "disable") {
        msg = "Are you sure you want to disable the proxy alias '"+alias+"'?";
    }

    if (confirm (msg)) {
        document.settingsNetwork.proxyAlias.value = alias;
        document.settingsNetwork.action.value = action;
        document.settingsNetwork.submit();
        return false;
    } 
    else 
        return false;
  }
  
</SCRIPT>
<base target="_self">
    <style>
      .listbox  { width: 50%; }
    </style>
</HEAD>
<BODY onLoad="setNavigation('settings-network.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_ProxyServersScrn');">
<FORM name="settingsNetwork" action="settings-network.dsp" method="POST">
  <INPUT type="hidden" name="action" value="">
  <INPUT type="hidden" name="proxyAlias">
  <TABLE width="100%">
    <TR>
        <TD class="breadcrumb" colspan="2">
        Settings &gt;
        Proxy Servers </TD>
    </TR>

    %ifvar action%
        %switch action%
        %case 'add'%
            %invoke wm.server.proxy:createProxyServerAlias%
                %ifvar message%
                  <tr><td colspan="2">&nbsp;</td></tr>
				  <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %endif%
                %onerror%
                    %ifvar errorMessage%
                        <tr><td colspan="2">&nbsp;</td></tr>
						<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endif%
            %endinvoke%
        %case 'edit'%
            %invoke wm.server.proxy:createProxyServerAlias%
                %ifvar message%
                  <tr><td colspan="2">&nbsp;</td></tr>
				  <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %endif%
                %onerror%
                    %ifvar errorMessage%
                        <tr><td colspan="2">&nbsp;</td></tr>
						<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endif%
            %endinvoke%
        %case 'editBypass'%
            %invoke wm.server.admin:setSettings%
                %ifvar message%
                  <tr><td colspan="2">&nbsp;</td></tr>
				  <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %endif%
                %onerror%
                    %ifvar errorMessage%
                        <tr><td colspan="2">&nbsp;</td></tr>
						<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endif%
            %endinvoke%
        %case 'delete'%
            %invoke wm.server.proxy:deleteProxyServerAlias%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %endif%
                %onerror%
                    %ifvar errorMessage%
                        <tr><td colspan="2">&nbsp;</td></tr>
						<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endif%
            %endinvoke%
        %case 'disable'%
            %invoke wm.server.proxy:disableProxyServerAlias%
                %ifvar message%
                  <tr><td colspan="2">&nbsp;</td></tr>
				  <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %endif%
                %onerror%
                    %ifvar errorMessage%
                        <tr><td colspan="2">&nbsp;</td></tr>
						<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endif%
            %endinvoke%   
        %case 'enable'%
            %invoke wm.server.proxy:enableProxyServerAlias%
                %ifvar message%
                  <tr><td colspan="2">&nbsp;</td></tr>
				  <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %endif%
                %onerror%
                    %ifvar errorMessage%
                        <tr><td colspan="2">&nbsp;</td></tr>
						<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endif%
            %endinvoke%   
        %endswitch%
    %endif%
        
    <tr>
        <td colspan="2">
            <ul class="listitems">
                <li class="listitem"><a href="settings-proxy-addedit.dsp?action=add">Create Proxy Server Alias</a></li>
                <li class="listitem"><a href="settings-proxy-addedit.dsp?action=editBypass">Edit Proxy Bypass</a></li>
            </ul>
        </td>
    </tr>
    %invoke wm.server.proxy:getProxyServerList%
    <TR>
        <TD>
        <TABLE class="tableView" width=100%>
            <TR>
                <TD class="heading" colspan=8>Proxy Servers List</TD>
            </TR>
            <TR>
               <TD class="oddcol">Default</TD>  
               <TD class="oddcol-l">Alias</TD>
               <TD class="oddcol">Protocol</TD>            
               <TD class="oddcol">Host</TD>
               <TD class="oddcol">Port</TD>
               <TD class="oddcol">User</TD>   
               <TD class="oddcol">Enabled</TD>   
               <TD class="oddcol">Delete</TD>
            </TR>
            %loop -struct proxyServerList%
            %scope #$key%
            <TR>
                    <script>writeTD("rowdata");</script>
                        %ifvar isDefault equals('Y')%
                            <IMG SRC="images/green_check.png">
                        %endif%
                    </TD>               
                    <script>writeTD("rowdata-l");</script>
				        <a href="settings-proxy-addedit.dsp?action=edit&isDefault=%value isDefault encode(url) %&protocol=%value protocol encode(url)%&socksVersion=%value socksVersion encode(url)%&ftpType=%value ftpType encode(url)%&proxyAlias=%value proxyAlias encode(url)%&status=%value status encode(url)%&host=%value host encode(url)%&port=%value port encode(url)%&username=%value username encode(url)%&password=%value password encode(url)%"
				        >%value proxyAlias encode(html)%</a>
                    </TD>
				    <script>writeTD("rowdata");</script>%value protocol encode(html)%</TD>					    
				    <script>writeTD("rowdata");</script>%value host encode(html)%</TD>
				    <script>writeTD("rowdata");</script>%value port encode(html)%</TD>
				    <script>writeTD("rowdata");</script>%value username encode(html)%</TD>
                    <script>writeTD("rowdata");</script>
                        %ifvar status equals('Disabled')%
						   	<a href="settings-network.dsp" onClick="return confirmStatusChange('%value proxyAlias encode(javascript)%', 'enable');">No</a>
                        %else%
						    <a href="settings-network.dsp" onClick="return confirmStatusChange('%value proxyAlias encode(javascript)%', 'disable');">Yes</a>
                        %endif%
                    <script>writeTD("rowdata");</script>
                        <a class="imagelink" onClick="return confirmDelete('%value proxyAlias encode(javascript)%');">
                            <img src="icons/delete.png" alt="Delete alias : %value proxyAlias encode(htmlattr)%" border=0>
                        </a>
                    </TD>
            %endscope%
            </TR>
            <script>swapRows();</script>
            %endloop%
        %endinvoke%   
        </TABLE>
        </TD>
    </TR>
    
    %invoke wm.server.query:getSettings%    
        <TABLE class="tableView" width=100%>

    <TR><TD class="heading">Proxy Bypass</TD></TR>
    <tr>
        <td class="oddrowdata-l"><script>
            writeEdit("%value ../doc encode(javascript)%", "watt.net.proxySkipList",
                "%value watt.net.proxySkipList encode(html_javascript)%");
        </script></td>
    </tr>
</table>
    %endinvoke%
</table>
</form>
</body>
</html>
