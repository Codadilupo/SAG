<HTML>
<HEAD>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">
<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
<SCRIPT SRC="webMethods.js.txt"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
  function confirmDelete (alias) {
    var msg = "OK to delete alias '"+alias+"' from configuration?";
    if (confirm (msg)) {
        document.deleteform.alias.value = alias;
        document.deleteform.submit();
          return false;
    } else return false;
  }
</SCRIPT>
</HEAD>

<BODY onLoad="setNavigation('settings-alias.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_URL_Aliases');">
<TABLE width="100%">
<TR>
    <TD class="breadcrumb" colspan="2">
    Settings &gt;
    URL Aliases </TD>
</TR>

%value message encode(html)%

%ifvar action%
%switch action%
%case 'add'%
  %invoke wm.server.httpUrlAlias:addAlias%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endinvoke%
%case 'edit'%
  %invoke wm.server.httpUrlAlias:updateAlias%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endinvoke%
%case 'delete'%
  %invoke wm.server.httpUrlAlias:deleteAlias%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endinvoke%
%endswitch%
%endif%

<tr>
    <td colspan="2">
        <ul class="listitems">
            <li class="listitem"><a href="settings-alias-addedit.dsp?association=1&isDev=false">Create URL Alias</a></li>
        </ul>
    </td>
</tr>
<TR>
    <TD>
    <TABLE class="tableView" width=100%>

    <TR>
        <TD class="heading" colspan=10>HTTP URL Alias List</TD>
    </TR>
%invoke wm.server.httpUrlAlias:listAlias%
<TR>
   <TD class="oddcol-l">Alias</TD>
   <TD class="oddcol">Default URL Path</TD>
   <TD class="oddcol">Port Mappings</TD>
   <TD class="oddcol">Association</TD>
   <TD class="oddcol">Package</TD>
   <TD class="oddcol">Delete</TD>
</TR>

%loop aliasList%
<TR>
    <script>writeTD("rowdata-l");</script>
        <a
       href="settings-alias-addedit.dsp?action=edit&alias=%value alias encode(url)%&urlPath=%value urlPath encode(url)%&portList=%value portList encode(url)%&association=%value association encode(url)%&package=%value package encode(url)%&isDev=%switch association%%case '0'%false%case '1'%false%case%true%endif%"
        >%ifvar alias equals('_DEFAULT_ALIAS_')%
          &lt;EMPTY&gt;
         %else%
            %value alias encode(html)%
         %endif%</a>
    </TD>
    <script>writeTD("rowdata");</script>%value urlPath encode(html)%</TD>
    <script>writeTD("rowdata");</script>%loop portList% %value%<br>%endloop%</TD>
    <script>writeTD("rowdata");</script>
      %switch association%
      %case '0'%
        Server
      %case '1'%
        Package
      %case%
        %value association encode(html)%
      %endif%
    </TD>  
    <script>writeTD("rowdata");</script>%value package encode(html)%</TD>
    <script>writeTD("rowdata");</script>
     %ifvar nodelete%
      &nbsp;
     %else%
  <a class="imagelink" href="" onClick="return confirmDelete('%value alias encode(javascript)%');">
      <img src="icons/delete.png" border="none"></a>
     %endif%</TD>

</TR>

    <script>swapRows();</script>
%endloop%
%endinvoke%
</TABLE>
</TD>
</TR>
</TABLE>

<FORM name="deleteform" action="settings-alias.dsp" method="POST">
  <INPUT type="hidden" name="action" value="delete">
  <INPUT type="hidden" name="alias">
</FORM>

</BODY>
</HTML>
