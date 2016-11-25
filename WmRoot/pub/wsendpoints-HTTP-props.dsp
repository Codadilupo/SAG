<TR>
    %ifvar action equals('create')%
    <TD colspan="2" class="heading"><span id="httpTransportHeader"></span>&nbsp;Transport Properties<span id="httpTransportHeaderOpt"></span></TD>
  %else%
		<TD colspan="2" class="heading"><span id="httpTransportHeader"></span>%value transportType encode(html)% Transport Properties<span id="httpTransportHeaderOpt"></span></TD>
  %endif%
</TR>
<tbody id="provConsHTTPDiv">
<TR>
  <TD class="oddrow">Host Name or IP Address</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value host encode(html)%
    %else%
			<INPUT NAME="host" VALUE="%value host encode(htmlattr)%" style="width:100%">
    %endif%
  </TD>
</TR>
<TR>
  <TD class="evenrow">Port Number</TD>
  <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value port encode(html)%
    %else%
			<INPUT NAME="port" VALUE="%value port encode(htmlattr)%" SIZE=5 MAXLENGTH=5 style="width:40%">
    %endif%
  </TD>
</TR>
</tbody>
<tbody id="consumerHTTPDiv">
<TR>
  <TD class="oddrow">Authentication Type</TD>
  <TD class="oddrow-l">
      %ifvar ../../action equals('view')%
                  %switch authType%
                     %case 'digest'%Digest
                     %case 'NTLM'%NTLM
                     %case%Basic
                  %end%
      %else%
      <select name="authType">
        <option value="basic" selected>Basic</option>
        <option value="digest" %ifvar authType equals('digest')%selected%endif%>Digest</option>
        <option value="NTLM" %ifvar authType equals('NTLM')%selected%endif%>NTLM</option>
      </select>
       %endif%
  </TD>
</TR>
<TR>
  <TD class="evenrow">User Name</TD>
  <TD class="evenrow-l">
      %ifvar ../../action equals('view')%
			%value user encode(html)%
    %else%
			<INPUT NAME="transportUser" VALUE="%value user encode(htmlattr)%" style="width:40%">
    %endif%
  </TD>
</TR>

%ifvar ../../action equals('view')%

%else%
<TR>
  <TD class="oddrow">Password</TD>
  <TD class="oddrow-l">
		<INPUT TYPE="password" NAME="transportPassword" autocomplete="off" VALUE="%value password encode(htmlattr)%" style="width:40%" />
  </TD>
</TR>
<TR>
  <TD class="evenrow">Retype Password</TD>
  <TD class="evenrow-l">
			<INPUT TYPE="password" NAME="retype_transportPassword" autocomplete="off" VALUE="%value password encode(htmlattr)%" style="width:40%" />
  </TD>
</TR>
%endif%
<TR>
  <TD class="oddrow">Proxy Alias</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value proxyAlias encode(html)%
    %else%
      <SELECT NAME="proxyAlias" class="listbox" style="width:40%">
    %endif%
  
</tbody>

<tbody id="consumerHTTPSDiv">
<TR>
  <TD class="evenrow">Keystore Alias</TD>
  <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value keyStoreAlias encode(html)%
    %else%
      <SELECT NAME="transportKeyStoreAlias" class="listbox" onchange="changeval('transportKeyStoreAlias')" style="width:40%"></SELECT>
    %endif%
  </TD>
</TR>
<TR>
  <TD class="oddrow">Key Alias</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value keyAlias encode(html)%
    %else%
      <select name="transportPrivateKeyAlias" class="listbox" style="width:40%"></select>
    %endif%
  </TD>
</TR>
</tbody>
