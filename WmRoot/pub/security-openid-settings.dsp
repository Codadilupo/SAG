<HTML>
  <HEAD>

       <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>

    <TITLE>Integration Server -- OpenID Management</TITLE>
    <SCRIPT LANGUAGE="JavaScript">
        function deleteProvider (name) {
            
            var msg = "OK to delete OpenID Provider '"+name+"'?";
            if (confirm (msg)) {
                    document.deleteform.name.value = name;
                    document.deleteform.submit();
                      return false;
            } else return false;
          }
    </SCRIPT>

  </HEAD>

  <BODY onLoad="setNavigation('security-openid-settings.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_OpenID');">
    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan="2"> Security &gt; OpenID </TD>
      </TR>
      
      %ifvar mode%
          %switch mode%
           %case 'delete'%
             %invoke wm.server.security.openid:deleteIdProvider%
                      %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <TR><TD class="message" colspan="2">%value message%</TD></TR>
                      %endif%
                %onerror%
                        <tr><td colspan="2">&nbsp;</td></tr>
                        <tr><td class="message" colspan=2>%value errorMessage%</td></tr>
               %endinvoke% 
            %case 'reload'%
             %invoke wm.server.security.openid:reloadProviders%
                      %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <TR><TD class="message" colspan="2">%value message%</TD></TR>
                      %endif%
                %onerror%
                        <tr><td colspan="2">&nbsp;</td></tr>
                        <tr><td class="message" colspan=2>%value errorMessage%</td></tr>
               %endinvoke% 
         %endswitch%
     %endif%

      <TR>
        <TD colspan="2">
          <ul class="listitems">
            <LI class="listitem"><A HREF="security-openid-settings.dsp?mode=reload">Reload OpenID Providers</a></li>
          </UL>
        </TD>
      </TR>
      <TR>
        <td>
            <table width="100%">
                <tr>
                    <td>
                        <TABLE class="tableView" width="100%">
           
                <TR>
                  <TD class="heading" colspan="8">OpenID Provider List</TD>
                </TR>

                <TR class="subheading2">
                  <TD>Name</TD>
                  <TD>Issuer</TD>
                  <TD>Client ID</TD>
                  <TD>Delete Provider</TD>
                </TR>
                
                %invoke wm.server.security.openid:getIdProviders%
                %loop providers%
                    <TR>

                      <script>writeTD("rowdata");</script>%value name%</TD>
                      <script>writeTD("rowdata");</script>%value issuer%</TD>
                      <script>writeTD("rowdata");</script>%value client_id%</TD>
                      <script>writeTD("rowdata");</script>               
                          <a class="imagelink"  href="security-openid-settings.dsp" onClick="return deleteProvider('%value name%');">
                          <img src="icons/delete.png" alt="Delete Provider : %value name%" border="none"></a>
                      </TD>

                    </TR>
                    <script>swapRows();</script>
                %endloop%
                %endinvoke%
                
          </TABLE>
                    </td>
                </tr>
            </table>
        </td>
      </TR>
    </TABLE>


    <form name="deleteform" action="security-openid-settings.dsp" method="POST">
        <input type="hidden" name="name">
        <input type="hidden" name="mode" value="delete">
    </form>

  </BODY>
</HTML>

