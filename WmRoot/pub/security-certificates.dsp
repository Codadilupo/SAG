<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <title>Security Certificates</title>
    <link rel="stylesheet" type="text/css" href="webMethods.css">
    <script src="webMethods.js.txt"></script>
    <script language="javascript">
      
      var aliasArray = new Array();
      var keyStoreArray = new Array();
      
      function loadKeyStoresOptions()
      {
            %invoke wm.server.security.keystore:listKeyStoresAndConfiguredKeyAliases%
                   var idx = 0;
                   keyStoreArray[idx] = "";
                   aliasArray[idx++] = new Array(0);
                   %loop keyStoresAndConfiguredKeyAliases%
				       	keyStoreArray[idx] = "%value keyStoreName encode(javascript)%";
                        var aliases = new Array();
                        %loop keyAliases%
		       				aliases[%value $index%] = "%value encode(javascript)%";
                        %endloop%
                        aliasArray[idx] = aliases;
                        idx++;
                   %endloop%
            %endinvoke%
            setupKeystoreData();
      }
      
      function updateSelected(ks, val)
      {
        for (var i = 0; i < ks.length; i++)
        {
            if ( ks.options[i].value == val)
            {   
                ks.options[i].selected = true;
            }
        }
      }
      
      function setupKeystoreData()
      { 
            var sslKeyStoreObj = document.getElementById("sslKeyStore");
            sslKeyStoreObj.length = keyStoreArray.length;
            
            var signKeyStoreObj = document.getElementById("signKeyStore");
            signKeyStoreObj.length = keyStoreArray.length;
            
            var decryptKeyStoreObj = document.getElementById("decryptKeyStore");
            decryptKeyStoreObj.length = keyStoreArray.length;
                        
            for (var i = 0; i < keyStoreArray.length; i++)
            {
                sslKeyStoreObj.options[i] = new Option(keyStoreArray[i],keyStoreArray[i]);
                signKeyStoreObj.options[i] = new Option(keyStoreArray[i],keyStoreArray[i]);
                decryptKeyStoreObj.options[i] = new Option(keyStoreArray[i],keyStoreArray[i]);              
            }
            
            var x = document.getElementsByName("watt.security.ssl.keyStoreAlias");
            updateSelected(sslKeyStoreObj, x[0].value);
    
            x = document.getElementsByName("watt.security.sign.keyStoreAlias");
            updateSelected(signKeyStoreObj, x[0].value);

            x = document.getElementsByName("watt.security.decrypt.keyStoreAlias");          
            updateSelected(decryptKeyStoreObj, x[0].value);
            
            var sslAliasObj = document.getElementById("sslAlias");
            var signAliasObj = document.getElementById("signAlias");
            var decryptAliasObj = document.getElementById("decryptAlias");
            
            changeval(sslKeyStoreObj , sslAliasObj);
            changeval(signKeyStoreObj , signAliasObj);
            changeval(decryptKeyStoreObj , decryptAliasObj);

            x = document.getElementsByName("watt.security.ssl.keyAlias");           
            updateSelected(sslAliasObj, x[0].value);

            x = document.getElementsByName("watt.security.sign.keyAlias");          
            updateSelected(signAliasObj, x[0].value);
            
            x = document.getElementsByName("watt.security.decrypt.keyAlias");           
            updateSelected(decryptAliasObj, x[0].value);
            
            return true;
       }
       
       function changeval(ks, alias) {
       
            var ksOpts = ks;
            var selectedKS = ks.value;
            for(var i=0; i<ksOpts.length; i++) {
                if(selectedKS == ksOpts.options[i].value) {
                    var aliases = aliasArray[i];
                    alias.length = aliases.length;
                    for(var j=0;j<aliases.length;j++) {
                        alias.options[j] = new Option(aliases[j],aliases[j]);
                    }
                }
            }
        }
        
        function saveChanges(thisForm)
        {
            if ( (thisForm.sslAlias.value == "" && thisForm.sslKeyStore.value != "" )|| 
                 (thisForm.signAlias.value == "" && thisForm.signKeyStore.value != "") ||
                 (thisForm.decryptAlias.value == "" && thisForm.decryptKeyStore.value != "")
                )
            {
                alert("Please select Key Alias");
                return false;
            }
            var x = document.getElementsByName("watt.security.ssl.keyStoreAlias");
            x[0].value = thisForm.sslKeyStore.value
            
            x = document.getElementsByName("watt.security.ssl.keyAlias");
            x[0].value = thisForm.sslAlias.value
            
            x = document.getElementsByName("watt.security.sign.keyStoreAlias");
            x[0].value = thisForm.signKeyStore.value
            
            x = document.getElementsByName("watt.security.sign.keyAlias");
            x[0].value = thisForm.signAlias.value
            
            x = document.getElementsByName("watt.security.decrypt.keyStoreAlias");
            x[0].value = thisForm.decryptKeyStore.value
            
            x = document.getElementsByName("watt.security.decrypt.keyAlias");               
            x[0].value = thisForm.decryptAlias.value
            
            x = document.getElementsByName("watt.security.trustStoreAlias");    
            x[0].value = thisForm.trustStore.value
            
            return true;
        }
        
    </SCRIPT>
    <base target="_self">
    <style>
      .listbox  { width: 100%; }
    </style>
  </HEAD>

  %ifvar doc equals('edit')%
  <BODY onLoad="loadKeyStoresOptions(); setNavigation('security-certificates.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_EditCertificateSettingsScrn');">
  %else%
  <BODY onLoad="setNavigation('security-certificates.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_SecurityCertificatesScrn');">
  %endif%

    <TABLE width="100%">
      <TR>
        %ifvar doc equals('edit')%
        <TD colspan=2 class="breadcrumb">
          Security &gt;
          Certificates &gt;
          Edit </TD>
        %else%
        <TD colspan=2 class="breadcrumb">
              Security &gt;
          Certificates </TD>
        %endif%
        
      </TR>
      
      %ifvar action equals('change')%
          %invoke wm.server.admin:setSettings%
              %ifvar message%
                <tr><td colspan="2">&nbsp;</td></tr>
                <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
              %endif%
          %endinvoke%
      %else%
            %ifvar action equals('clearSSLCache')%
                %invoke wm.server.admin:clearSSLCache%
                  %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
	                <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                  %endif%
                %endinvoke%
            %endif%
      %endif%

      <TR>
        <TD colspan=2>
          <ul class="listitems">
            %ifvar doc equals('edit')%
            <LI class="listitem"><A HREF="security-certificates.dsp">Return to Certificates</a></li>
            %else%
            <LI class="listitem"><A HREF="security-certs.dsp">Configure Client Certificates</a></li>
            <LI class="listitem"><A HREF="security-certificates.dsp?doc=edit">Edit Certificates Settings</a></li>
            <LI class="listitem"><A HREF="security-certificates.dsp?action=clearSSLCache">Clear SSL Cache</a></li>
            %endif%
          </UL>
        </TD>
      </TR>

      <TR>
        <TD>
        %invoke wm.server.query:getSettings%
    
          <TABLE class="%ifvar ../doc equals('edit')%tableView%else%tableView%endif%" width="30%">
            <FORM NAME="security" id="security" METHOD="POST" ACTION="security-certificates.dsp">
            %ifvar ../doc equals('edit')%
                <INPUT TYPE="hidden" NAME="action" id="action" VALUE="change">
		        <INPUT TYPE="hidden" NAME="watt.security.ssl.keyStoreAlias" id="watt.security.ssl.keyStoreAlias" VALUE="%value watt.security.ssl.keyStoreAlias encode(htmlattr)%">
	    	    <INPUT TYPE="hidden" NAME="watt.security.ssl.keyAlias" id="watt.security.ssl.keyAlias" VALUE="%value watt.security.ssl.keyAlias encode(htmlattr)%">
	        	<INPUT TYPE="hidden" NAME="watt.security.sign.keyStoreAlias" id="watt.security.sign.keyStoreAlias" VALUE="%value watt.security.sign.keyStoreAlias encode(htmlattr)%">
	           	<INPUT TYPE="hidden" NAME="watt.security.sign.keyAlias" id="watt.security.sign.keyAlias" VALUE="%value watt.security.sign.keyAlias encode(htmlattr)%">
	           	<INPUT TYPE="hidden" NAME="watt.security.decrypt.keyStoreAlias" id="watt.security.decrypt.keyStoreAlias" VALUE="%value watt.security.decrypt.keyStoreAlias encode(htmlattr)%">
	           	<INPUT TYPE="hidden" NAME="watt.security.decrypt.keyAlias" id="watt.security.decrypt.keyAlias" VALUE="%value watt.security.decrypt.keyAlias encode(htmlattr)%">
	           	<INPUT TYPE="hidden" NAME="watt.security.trustStoreAlias" id="watt.security.trustStoreAlias" VALUE="%value watt.security.trustStoreAlias encode(htmlattr)%">
           %endif%
           
              <!-- SSL section -->
              <TR>
                <td class="heading" colspan=2>SSL Key</TD>
              </TR>
              <TR>
                    <TD class="evenrow">Keystore Alias</TD>
                    <TD class="evenrowdata-l">
                    %ifvar ../doc equals('edit')%
                        <SELECT class="listbox" name="sslKeyStore" id="sslKeyStore" onchange="changeval(this, this.form.sslAlias)"></SELECT>
                    %else%
                        %ifvar watt.security.ssl.keyStoreAlias equals('')% 
                            unspecified 
                        %else% 
                            %value watt.security.ssl.keyStoreAlias encode(html)% 
                        %endif%
                    %endif%
                    </TD>
              </TR>
              <TR>
                    <TD class="oddrow">Key Alias</TD>
                    <TD class="oddrowdata-l">
                      %ifvar ../doc equals('edit')%
                          <select class="listbox" name="sslAlias" id="sslAlias" ></select>          
                      %else%
                            %ifvar watt.security.ssl.keyAlias equals('')% 
                                unspecified 
                            %else% 
                            	%value watt.security.ssl.keyAlias encode(html)% 
                            %endif%
                      %endif%
                    </TD>
              </TR>
              
              <TR>
                <td class="heading" colspan=2>Signing Key</TD>
              </TR>
              <TR>
                    <TD class="evenrow">Keystore Alias</TD>
                    <TD class="evenrowdata-l">
                    %ifvar ../doc equals('edit')%
                        <SELECT NAME="signKeyStore" id="signKeyStore" class="listbox"  onchange="changeval(this, this.form.signAlias)"></SELECT>
                    %else%
                        %ifvar watt.security.sign.keyStoreAlias equals('')% 
                            unspecified 
                        %else% 
                            %value watt.security.sign.keyStoreAlias encode(html)% 
                        %endif%
                    %endif%
                    </TD>
              </TR>
              <TR>
                    <TD class="oddrow">Key Alias</TD>
                    <TD class="oddrowdata-l">
                      %ifvar ../doc equals('edit')%
                          <select name="signAlias" id="signAlias" class="listbox"></select>         
                      %else%
                        %ifvar watt.security.sign.keyAlias equals('')% 
                            unspecified 
                        %else% 
                            %value watt.security.sign.keyAlias encode(html)% 
                        %endif%
                      %endif%
                    </TD>
              </TR>
              
              <TR>
                <td class="heading" colspan=2>Decryption Key</TD>
              </TR>
              <TR>
                    <TD class="evenrow">Keystore Alias</TD>
                    <TD class="evenrowdata-l">
                    %ifvar ../doc equals('edit')%
                        <SELECT NAME="decryptKeyStore" id="decryptKeyStore" class="listbox" onchange="changeval(this, this.form.decryptAlias)"></SELECT>
                    %else%
                        %ifvar watt.security.decrypt.keyStoreAlias equals('')% 
                            unspecified 
                        %else% 
                            %value watt.security.decrypt.keyStoreAlias encode(html)% 
                        %endif%
                    %endif%
                    </TD>
              </TR>
              <TR>
                    <TD class="oddrow">Key Alias</TD>
                    <TD class="oddrowdata-l">
                      %ifvar ../doc equals('edit')%
                          <select name="decryptAlias" id="decryptAlias" class="listbox"></select>       
                      %else%
                        %ifvar watt.security.decrypt.keyAlias equals('')% 
                            unspecified 
                        %else% 
                            %value watt.security.decrypt.keyAlias encode(html)% 
                        %endif%
                      %endif%
                    </TD>
              </TR>
              
              <!-- TrustStore section -->
              <TR>
                <td class="heading" colspan=2>Truststore</TD>
              </TR>
              <TR>
                    <TD class="evenrow">Truststore Alias</TD>
                    <TD class="evenrowdata-l">
                        %ifvar ../doc equals('edit')%
                            <select name="trustStore" id="trustStore">
                            %invoke wm.server.security.keystore:listTrustStores%
                                    <option name="" value=""></option>
                                %loop trustStores%
                                    %ifvar isLoaded equals('true')%
										<option name="%value keyStoreName encode(htmlattr)%" value="%value keyStoreName encode(htmlattr)%" %ifvar ../watt.security.trustStoreAlias vequals(keyStoreName)%selected%endif%>%value keyStoreName encode(html)%</option>
                                    %endif%
                               %endloop%
                            %endinvoke%
                            </select>
                        %else%
                            %ifvar watt.security.trustStoreAlias equals('')% 
                                unspecified 
                            %else% 
	                            %value watt.security.trustStoreAlias encode(html)% 
                            %endif%
                        %endif%
                    </TD>
              </TR>
               
             
              %ifvar ../doc equals('edit')%
              <TR>
                <TD colspan=2  class="action">
                    <input type="submit" name="submit" value="Save Changes" onclick="return saveChanges(this.form);">
                </TD>
              </TR>
              %endif%
              
              </FORM>
            </TABLE>
            %endinvoke%
          </TD>

        </TR>
      </TABLE>
      
    </BODY>
  </HTML>
