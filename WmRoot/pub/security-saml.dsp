<HTML>
<HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
<SCRIPT SRC="webMethods.js.txt"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
  function confirmDelete (IssuerName) {
    var msg = "OK to delete saml issuer '"+IssuerName+"' from configuration?";
    if (confirm (msg)) {
        document.deleteform.IssuerName.value = IssuerName;
            document.deleteform.submit();
          return false;
    } else return false;
  }


</SCRIPT>
</HEAD>
<BODY onLoad="setNavigation('security-saml.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_SAMLScrn');">
<TABLE width="100%">
<TR>
    <TD class="breadcrumb" colspan="2">
    Security &gt;
    SAML </TD>
</TR>


%ifvar action%
%switch action%
%case 'add'%
  %invoke wm.server.saml:addIssuer%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endif%
%case 'edit'%
  %invoke wm.server.saml:addIssuer%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endif%
%case 'delete'%
  %invoke wm.server.saml:deleteIssuer%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endif%
%endswitch%
%endif%


<tr>
    <td colspan="2">
        <ul class="listitems">
            <li class="listitem"><a href="security-saml-addedit.dsp">Add SAML Token Issuer</a></li>
        </ul>
    </td>
</tr>
<TR>
    <TD>
    <TABLE class="tableView" width=100%>

    <TR>
        <TD class="heading" colspan=10>Trusted SAML Token Issuers List</TD>
    </TR>
%invoke wm.server.saml:listIssuers%
<TR>
   <TD class="oddcol-l">Issuer Name</TD>
   <TD class="oddcol">Truststore Alias</TD>
   <TD class="oddcol">Certificate Alias</TD>
   <TD class="oddcol">Clock Skew</TD>
   <TD class="oddcol">Delete</TD>
</TR>

%loop -struct issuers%
%scope #$key%
<TR>
    <script>writeTD("rowdata-l");</script>
        <a
	   href="security-saml-addedit.dsp?action=edit&IssuerName=%value IssuerName encode(url)%&TruststoreAlias=%value TruststoreAlias encode(url)%&CertAlias=%value CertAlias encode(url)%&ClockSkew=%value ClockSkew encode(url)%"
        >%value IssuerName encode(html)%</a>
    </TD>
    <script>writeTD("rowdata");</script>%value TruststoreAlias encode(html)%</TD>
    <script>writeTD("rowdata");</script>%value CertAlias encode(html)%</TD>
    <script>writeTD("rowdata");</script>%value ClockSkew encode(html)%</TD>
    <script>writeTD("rowdata");</script>
     %ifvar nodelete%
      &nbsp;
     %else%
  <a class="imagelink" href="" onClick="return confirmDelete('%value IssuerName encode(javascript)%');">
      <img src="icons/delete.png" border="none"></a>
     %endif%</TD>

</TR>

    <script>swapRows();</script>
%endscope%
%endloop%
%endinvoke%
</TABLE>
</TD>
</TR>
</TABLE>

<FORM name="deleteform" action="security-saml.dsp" method="POST">
  <INPUT type="hidden" name="action" value="delete">
  <INPUT type="hidden" name="IssuerName">
</FORM>

</BODY>
</HTML>
