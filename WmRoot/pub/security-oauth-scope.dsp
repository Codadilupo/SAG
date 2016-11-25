<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  
  <SCRIPT LANGUAGE="JavaScript">
      function confirmDeleteScope(name) {
        var msg = "OK to Delete Scope '"+name+"' ?";
        if (confirm (msg)) {
          return true;
        } else return false;
      }
  </SCRIPT>

  <body onLoad="setNavigation('security-oauth-scopes.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_OAuthScopeManagementScrn');">
   
    <table width="100%">
    <tr>
        <td class="breadcrumb" colspan="2"> Security &gt; OAuth &gt; Scope Management</td>
    </tr>

      %ifvar action equals('delete')%
        %invoke wm.server.oauth:removeScope%
            <TR><TD colspan="2">&nbsp;</TD></TR>
            <TR><TD class="message" colspan=2>%value message encode(html)%</TD></TR>
            <TR><TD colspan="2">&nbsp;</TD></TR>
        %onerror%
            <tr><td colspan="2">&nbsp;</td></tr>
			<tr><td class="message" colspan=2>%value errorMessage encode(html)% Scope %value name encode(html)% not deleted.</td></tr>			
        %endinvoke%   
      %endif%

      %ifvar action equals('add')%
        %invoke wm.server.oauth:putScope%
            %ifvar message%
                <tr><td colspan="2">&nbsp;</td></tr>
				<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
            %endif%
            %onerror%
                <tr><td colspan="2">&nbsp;</td></tr>
				<tr><td class="message" colspan=2>%value errorMessage encode(html)% Scope %value name encode(html)% not added.</td></tr>
        %endinvoke%
      %endif%     
      
      %ifvar action equals('edit')%
          %ifvar isChanged equals('true')%
            %invoke wm.server.oauth:putScope%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)% Scope %value name encode(html)% not updated.</td></tr>				
            %endinvoke%
          %else%
            <TR>
              <TD colspan="2">&nbsp;</td>
            </TR>
            <TR>
			  <TD class="message" colspan=2>No changes made to Scope %value name encode(html)%.</TD>
            </TR>
          %endif%
     %endif%      
      
      <tr>
        <td colspan="2">
          <ul class="listitems">
            <li><a href="security-oauth-settings.dsp">Return to OAuth</a></li>
            <li><a href="security-oauth-scope-addedit.dsp?action=add">Add Scope</a></li>
            <li><a href="security-oauth-scope-client-associations.dsp">Associate Scopes to Clients</a></li>
          </ul>
        </td>
      </tr>     

      <TR> 
        <TD width="100%">
           <TABLE width="70%" class="tableView">
           <TR> 
         
          <TD class="heading" colspan="3">Defined Scopes</TD>
        </TR>
       
        <TR>
          <TD class="oddcol-l" nowrap>Name</TD>
          <TD class="oddcol-l" nowrap>Folders and services</TD>
          <TD class="oddcol">Delete</TD>
        </TR>

    %invoke wm.server.oauth:listScopes%     
    %loop scopes%
              <TR>
                  <SCRIPT>writeTDnowrap("row-l");</SCRIPT>
				  <A href="security-oauth-scope-addedit.dsp?action=edit&name=%value name encode(url)%">
				   %value name encode(html)%
                     </A>
                  </TD>

                  <SCRIPT>writeTD("row-l");</SCRIPT>
					 %loop values%%value encode(html)%%loopsep ';'% %endloop%
                  </TD>
                  
                  <SCRIPT>writeTDspan("rowdata","1");</SCRIPT>
					<A href="security-oauth-scope.dsp?action=delete&name=%value name encode(url)%" onClick="return confirmDeleteScope('%value name encode(javascript)%');">
                      <IMG src="icons/delete.png" border="none">
                    </A>
                  </TD>     
                  <SCRIPT>swapRows();</SCRIPT>
              </TR>
    %endloop%
        
        
        </TABLE>
      
      
     </table>
  </body>   
</head>
