<tbody id="headerMsgDiv">
<TR>
    <TD colspan="2" class="heading">WS Security Properties (Optional)</TD>
</TR>
</tbody>
<tbody id="usernameMsgDiv">
<TR>
    <TD class="oddrow">User Name</TD>
    <TD class="oddrow-l">
        %ifvar ../../action equals('view')%
			%value user encode(html)%
        %else%
			<INPUT NAME="messageUser" VALUE="%value user encode(htmlattr)%" style="width:40%">
        %endif% 
    </TD>
</TR>

%ifvar action ../../action equals('view')%
%else%
<TR>
    <TD class="evenrow">Password</TD>
    <TD class="evenrow-l">
		<INPUT TYPE="password" NAME="messagePassword" autocomplete="off" VALUE="%value password encode(htmlattr)%" style="width:40%" />
    </TD>
</TR>

<TR>
    <TD class="oddrow">Retype Password</TD>
    <TD class="oddrow-l">
		<INPUT TYPE="password" NAME="retype_messagePassword" autocomplete="off" VALUE="%value password encode(htmlattr)%" style="width:40%" />
    </TD>
</TR>
%endif%
</tbody>
<tbody id="partnerCertMsgDiv">
<TR>
    <TD class="evenrow">Partner's Certificate</TD>
    <TD class="evenrow-l">
        %ifvar ../../action equals('view')%
			%value partnerPublicKeyFileName encode(html)%
        %else%
			<INPUT NAME="messagePartnerPublicKeyFileName" VALUE="%value partnerPublicKeyFileName encode(htmlattr)%" style="width:100%">
        %endif% 
    </TD>
</TR>
</tbody>
<tbody id="keystoreMsgDiv">
<TR>
    <TD class="oddrow">Keystore Alias</TD>
    <TD class="oddrow-l">
        %ifvar ../../action equals('view')%
			%value keyStoreAlias encode(html)%
        %else%
            <SELECT NAME="messageKeyStoreAlias" style="width:40%" class="listbox"  onchange="changeval('messageKeyStoreAlias')"></SELECT>
        %endif%
    </TD>
</TR>
<TR>
    <TD class="evenrow">Key Alias</TD>
    <TD class="evenrow-l">
        %ifvar ../../action equals('view')%
			%value keyAlias encode(html)%
        %else%
            <select name="messagePrivateKeyAlias" style="width:40%" class="listbox"></select>
        %endif%
    </TD>
</TR>
</tbody>
<tbody id="truststoreMsgDiv">
<TR>
    <TD class="oddrow">Truststore Alias</TD>
    <TD class="oddrow-l">
        %ifvar ../../action equals('view')%
			%value trustStoreAlias encode(html)%
        %else%
            %ifvar ../../action equals('edit')%
                <select name="messageTrustStoreAlias" class="listbox" style="width:40%">
                %invoke wm.server.security.keystore:listTrustStores%
                    <option name="" value=""></option>
                    %loop trustStores%
						<option name="%value keyStoreName encode(htmlattr)%" value="%value keyStoreName encode(htmlattr)%" %ifvar ../trustStoreAlias vequals(keyStoreName)%selected%endif%>%value keyStoreName encode(html)%</option>
                    %endloop%
                %endinvoke%
                </select>
            %else%
                <select name="messageTrustStoreAlias" class="listbox" style="width:40%">
                %invoke wm.server.security.keystore:listTrustStores%
                    <option name="" value=""></option>
                    %loop trustStores%
                        %ifvar isLoaded equals('true')%
							<option name="%value keyStoreName encode(htmlattr)%" value="%value keyStoreName encode(htmlattr)%" %ifvar ../msgTruststore vequals(keyStoreName)%selected%endif%>%value keyStoreName encode(html)%</option>
                        %endif%
                    %endloop%
                %endinvoke%
                </select>
            %endif%
        %endif%
    </TD>
</TR>
</tbody>
<tbody id="timestampMsgDiv">
<TR>
    <TD class="evenrow">Timestamp Precision</TD>
    <TD class="evenrow-l">
        %ifvar ../../action equals('view')%
          %ifvar timestampPrecisionInMillis%
            %ifvar timestampPrecisionInMillis equals('true')%milliseconds%else%seconds%endif%
      %endif%
        %else%
            <select name="messageTimestampPrecisionInMillis" class="listbox" style="width:40%">
                <option name="default" value="" %ifvar timestampPrecisionInMillis%%else%selected%endif%></option>
                <option name="milliseconds" value="true" %ifvar timestampPrecisionInMillis equals('true')%selected%endif%>milliseconds</option>
                <option name="seconds" value="false" %ifvar timestampPrecisionInMillis equals('false')%selected%endif%>seconds</option>
            </select>
        %endif% 
    </TD>
</TR>

<TR>
    <TD class="oddrow">Timestamp Time to Live (seconds)</TD>
    <TD class="oddrow-l">
        %ifvar ../../action equals('view')%
			%value timestampTimeToLive encode(html)%
        %else%
			<INPUT NAME="messageTimestampTimeToLive" VALUE="%value timestampTimeToLive encode(htmlattr)%" style="width:40%">
        %endif% 
    </TD>
</TR>

<TR>
    <TD class="evenrow">Timestamp Maximum Skew (seconds)</TD>
    <TD class="evenrow-l">
        %ifvar ../../action equals('view')%
			%value timestampMaximumSkew encode(html)%
        %else%
			<INPUT NAME="messageTimestampMaximumSkew" VALUE="%value timestampMaximumSkew encode(htmlattr)%" style="width:40%">
        %endif% 
    </TD>
</TR>
</tbody>

<!-- Message Kerberos Properties-->

<tbody id="kerberosPropsDiv">
<TR>
    <TD colspan="2" class="heading">Kerberos Properties (Optional)</TD>
</TR>
<TR>
    <TD class="evenrow">JAAS Context</TD>
    <TD class="evenrow-l">
        %ifvar ../../action equals('view')%
			%value kerberosSettings/jaasContext encode(html)%
        %else%
			<input type="text" name="krbJaasContext" id="krbJaasContext" value="%value kerberosSettings/jaasContext encode(htmlattr)%" style="width:40%">
        %endif% 
    </TD>
</TR>
<TR>
    <TD class="oddrow">Principal</TD>
    <TD class="oddrow-l">
        %ifvar ../../action equals('view')%
			%value kerberosSettings/clientPrincipal encode(html)%
        %else%
			<input type="text" name="krbClientPrincipal" VALUE="%value kerberosSettings/clientPrincipal encode(htmlattr)%" style="width:40%">
        %endif% 
    </TD>
</TR>
%ifvar action ../../action equals('view')%
%else%
    <TR id="clntPwdRow">
        <TD class="evenrow">Principal Password</TD>
        <TD class="evenrowdata-l">
			<input type="password" name="krbClientPassword" id="krbClientPassword" value="%value kerberosSettings/clientPassword encode(htmlattr)%" autocomplete="off" style="width:40%">
        </TD>
    </TR>
    <TR id="clntPwdReRow">
        <TD class="oddrow">Retype Principal Password</TD>
        <TD class="oddrowdata-l">
			<input type="password" name="retype_krbClientPassword" id="retype_krbClientPassword" value="%value kerberosSettings/clientPassword encode(htmlattr)%" autocomplete="off" style="width:40%">
        </TD>
    </TR>
%endif%
<TR>
    <TD class="evenrow">Service Principal Name Format</TD>
    <TD class="evenrow-l">
        %ifvar ../../action equals('view')%
            %ifvar kerberosSettings/servicePrincipalForm equals('username')% username %else% host-based %endif%
        %else%
            <label>
                <input type="radio" name="krbServicePrincipalForm" value="hostbased" 
                    %ifvar kerberosSettings/servicePrincipalForm equals('username')%
                    %else%checked%endif% />
                host-based
            </label>
            <label>
                <input type="radio" name="krbServicePrincipalForm" value="username" 
                    %ifvar kerberosSettings/servicePrincipalForm equals('username')%checked%endif% />
                username
            </label>
        %endif%
    </TD>
</TR>
<TR>
    <TD class="oddrow">Service Principal Name</TD>
    <TD class="oddrow-l">
        %ifvar ../../action equals('view')%
			%value kerberosSettings/servicePrincipal encode(html)%
        %else%
			<input type="text" name="krbServicePrincipal" id="krbServicePrincipal" value="%value kerberosSettings/servicePrincipal encode(htmlattr)%" style="width:40%">
        %endif% 
    </TD>
</TR>
</tbody>
