%ifvar operation equals('addNewProvider')%
    %invoke wm.server.net.listeners:addSecurityProvider%
    %endinvoke%
%endif%

<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    <TITLE>Integration Server -- Port Access Management</TITLE>
  </HEAD>

  <BODY onLoad="setNavigation('security-keystoremgt.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_SecurityProviderAdd', 'foo');">
    <TABLE width="100%">

    <TR>
      <TD class="breadcrumb" colspan=2>
        Security &gt;
        Keystore &gt;
        Add Security Provider 
      </TD>
    </TR>
    %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
      <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html)%</TD></TR>
    %endif%

    <TR><TD colspan="2">
    <UL class="listitems">
      <li><a href="security-keystoremgt.dsp">Return to Keystore</a></li>
    </UL>

    </TD>
    </TR>
    <TR>
      <TD>
        <TABLE class="tableView">

        <tr>
          <td class="heading" colspan="2">Add Security Provider</td>
        </tr>
        <form name="addsecprov" action="add-javasecurity-provider.dsp" method="post">
        <input type="hidden" name="operation" value="addNewProvider">
        <tr>
            <td class="oddrow">Security Provider Class</td>
            <td class="oddrow-l">
               <script>writeEdit('edit','keyStoreProviderClass',"%value keyStoreProviderClass encode(html_javascript)%");</script>
            </td>
        </tr>
        <tr>
            <td class="action" colspan="2"><input type="submit" value="Add Provider"></td>
        </tr>

        </form>
      </TABLE>
    </TD>
  </TR>
</TABLE>
</BODY>
</HTML>
