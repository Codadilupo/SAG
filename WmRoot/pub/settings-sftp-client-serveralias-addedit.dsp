<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  <script language="JavaScript">

    function validate( oper)
    {
        if(oper == 'edit')
        {
        var host = trimStr(document.htmlform_saConfig.hostName.value);
            document.htmlform_saConfig.hostName.value = host;
            var port = trimStr(document.htmlform_saConfig.port.value);
            document.htmlform_saConfig.port.value = port;
            if(0 == host.length)
            {
                alert("You must specify a valid value for the field : 'hostName'")
                document.htmlform_saConfig.hostName.focus();
                return false;
            } 
            if(validatePort(port))
            {
                alert("You must specify a valid value for the field : 'port'")
                document.htmlform_saConfig.port.focus();
                return false;
            }
						
			var sep = "";
			var newOrderText = "";
			var prefExAlgo = document.htmlform_saConfig.preferredKeyExchangeAlgorithmSel;
			for (var i = 0; i <= prefExAlgo.options.length-1; i++) {   
				newOrderText += "" + sep + prefExAlgo.options[i].value;
				sep = ",";
			}
			document.htmlform_saConfig.preferredKeyExchangeAlgorithm.value = newOrderText;
			
            document.htmlform_saConfig.operation.value= 'edit';
        }
        else
        {
            var svrAlias = trimStr(document.htmlform_saConfig.alias.value);
            document.htmlform_saConfig.alias.value = svrAlias;
            var host = trimStr(document.htmlform_saConfig.hostName.value);
            document.htmlform_saConfig.hostName.value = host;
            var port = trimStr(document.htmlform_saConfig.port.value);
            document.htmlform_saConfig.port.value = port;
            var hostkeyloc = trimStr(document.htmlform_saConfig.hostKeyLocation.value);
            document.htmlform_saConfig.hostKeyLocation.value = hostkeyloc;
            if(0 == svrAlias.length)
            {
                alert("You must specify a valid value for the field : 'alias'")
                document.htmlform_saConfig.alias.focus();
                return false;
            } 
            if(0 == host.length)
            {
                alert("You must specify a valid value for the field : 'hostName'")
                document.htmlform_saConfig.hostName.focus();
                return false;
            } 
            if(validatePort(port))
            {
                alert("You must specify a valid value for the field : 'port'")
                document.htmlform_saConfig.port.focus();
                return false;
            } 
            if(0 == hostkeyloc.length)
            {
                alert("You must specify a valid value for the field : 'hostKeyLocation'")
                document.htmlform_saConfig.hostKeyLocation.focus();
                return false;
            } 

			var sep = "";
			var newOrderText = "";
			var prefExAlgo = document.htmlform_saConfig.preferredKeyExchangeAlgorithmSel;
			for (var i = 0; i <= prefExAlgo.options.length-1; i++) {   
				newOrderText += "" + sep + prefExAlgo.options[i].value;
				sep = ",";
			}
			document.htmlform_saConfig.preferredKeyExchangeAlgorithm.value = newOrderText;

            document.htmlform_saConfig.operation.value= 'add';
        }
        return true;
    }
    
    function validatePort(port){
        if((0 == port.length) || (isNaN(port)) || (0> port) || (65535 > port))
            return false;
        return true;
    }
    function trimStr(str) {
      return str.replace(/^\s+|\s+$/g, '');
    }
    
	function move(formO,selectO,to) {
		var index = selectO.selectedIndex;
		var selectLength  = selectO.length - 1;
		if (index == -1) return false;
		if(to == +1 && index == selectLength) {
		   return false;
		} else if(to == -1 && index == 0) {
		   return false;
		}
		swap(index,index+to,formO,selectO);
		return true;
    }
    
    function swap(fIndex,sIndex,formO,selectO) {
        fText  = selectO.options[fIndex].text;
        fValue = selectO.options[fIndex].value;
        selectO.options[fIndex].text  = selectO.options[sIndex].text;
        selectO.options[fIndex].value = selectO.options[sIndex].value;  
        selectO.options[sIndex].text = fText;
        selectO.options[sIndex].value = fValue;
        selectO.options[sIndex].selected = true;    
    }
    function populateForm(destForm , srcForm, oper)
    {
        destForm.operation.value = oper;
        destForm.user_action.value = 'gethostkey';
        destForm.alias.value = srcForm.alias.value;
        destForm.hostName.value = srcForm.hostName.value;
        destForm.port.value = srcForm.port.value;
		
		var sep = "";
		var newOrderText = "";
		var prefExAlgo = srcForm.preferredKeyExchangeAlgorithmSel;
		for (i = 0; i <= prefExAlgo.options.length-1; i++) {   
			newOrderText += "" + sep + prefExAlgo.options[i].value;
			sep = ",";
		}
		destForm.preferredKeyExchangeAlgorithm.value = newOrderText;
		
		destForm.proxyAlias.value = srcForm.proxyAlias.options[srcForm.proxyAlias.selectedIndex].value;
        destForm.hostKeyLocation.value = srcForm.hostKeyLocation.value;
        if('edit' == oper){
            destForm.fingerprint.value = srcForm.fingerprint.value;
        }
        destForm.submit();
    }
	
	function populateOptions(options1) {
        var selectO = document.htmlform_saConfig.preferredKeyExchangeAlgorithmSel;
        var optionsArray = options1.split(',');
        var elOptNew = null;
        for(var i = 0; i < optionsArray.length; i++) {
          elOptNew = new Option(optionsArray[i], optionsArray[i]);
          try {
            selectO.options[i] = elOptNew; // standards compliant; doesn't work in IE
          } catch(ex) {
            selectO.options.add(elOptNew, i); // IE only
          }
        }
    }
	
	function setSelection(selectID , value) {
        var selectO = document.getElementById(selectID);
        for (var i = 0; i < selectO.options.length; i++) {   
           if(value == selectO.options[i].value) {
             selectO.options[i].selected = true;    
           }
        }
    }
  </script>
 </head>
  %ifvar operation equals('edit')%
    <body onLoad="setNavigation('settings-sftp-client-server-addedit.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_SFTP_ServerAliasSettings_Edit');">
  %else%
    <body onLoad="setNavigation('settings-sftp-client-server-addedit.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_SFTP_ServerAliasSettings_Create');">
  %endif%
    <table width="100%">
        <tr>
            <td class="breadcrumb" colspan="2"> 
				Settings &gt; SFTP &gt; %ifvar operation equals('edit')%%value alias encode(html)%&nbsp;&gt;&nbsp;Edit%else%Create Server Alias%endif%
            </td>
        </tr>
        %ifvar user_action equals('gethostkey')%
            %invoke wm.server.sftpclient:getServerHostKey%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
        %else%
            %ifvar operation equals('edit')%
                %invoke wm.server.sftpclient:getServerAliasInfo%
                    %ifvar message%
                        <tr><td colspan="2">&nbsp;</td></tr>
						<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                    %endif%
                    %onerror%
                        <tr><td colspan="2">&nbsp;</td></tr>
						<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
            %endif% 
        %endif%
        <tr>
            <td colspan="2">
                <ul class="listitems">
                    <li class="listitem"><a href="settings-sftp-client.dsp">Return to SFTP</a></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
            <form name="htmlform_saConfig" action="settings-sftp-client.dsp" method="POST">
			<input type="hidden" name="operation" value="%value operation encode(htmlattr)%">
			<input type="hidden" name="user_action" value="%value user_action encode(htmlattr)%">
            <table width="40%">
                <tr>
                    <td>    
                        <table class="tableView" width="100%">
                            <tr>
                                <td class="heading" colspan="2">SFTP Server Alias Properties</td>
                            </tr>
                            <tr>
                                <td class="oddrow">Alias</td>   
                                <td class="oddrow-l">
                                    %ifvar operation equals('add')%
										<input type="text" size="50" name="alias" id="alias" %ifvar user_action equals('gethostkey')% value="%value alias encode(htmlattr)%" %endif%>
                                    %endif% 
                                    %ifvar operation equals('edit')%
										<input type="text" size="50" name="alias" id="alias" value="%value alias encode(htmlattr)%" readonly="true" style="color:#808080;">
                                    %endif%
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="evenrow" >Host Name or IP Address</td>
                                <td class="evenrow-l" >
                                    %ifvar operation equals('add')%
										<input type="text" size="50" name="hostName" id="hostName" %ifvar user_action equals('gethostkey')% value="%value hostName encode(htmlattr)%" %endif%>
                                    %endif% 
                                    %ifvar operation equals('edit')%
										<input type="text" size="50" name="hostName" id="hostName" value="%value hostName encode(htmlattr)%">
                                    %endif%
                                </td>
                            </tr>
                            <tr>
                                <td class="oddrow">Port Number</td> 
                                <td class="oddrow-l">
                                    %ifvar operation equals('add')%
										<input type="text" size="5" maxlength="5" name="port" id="port" %ifvar user_action equals('gethostkey')% value="%value port encode(htmlattr)%" %endif%>
                                    %endif% 
                                    %ifvar operation equals('edit')%
										<input type="text" size="5" maxlength="5" name="port" id="port" value="%value port encode(htmlattr)%" >	
                                    %endif%
                                </td>
                            </tr>
							<tr>
								<td class="oddrow" width="30%">Preferred Key Exchange Algorithms</td>
								<td class="oddrow-l" width="70%">
								<input type="hidden" name="preferredKeyExchangeAlgorithm" id="preferredKeyExchangeAlgorithm">
									<table class="tableView" width="100%">
										<tr>
											<td>
												%ifvar operation equals('add')%
													%ifvar user_action equals('gethostkey')%
														<select name="preferredKeyExchangeAlgorithmSel" id="preferredKeyExchangeAlgorithmSel" size="7">
																<option value=""></option>                                                            
														</select>
														<script>populateOptions('%value preferredKeyExchangeAlgorithm%');</script>
													%else%
														<select name="preferredKeyExchangeAlgorithmSel" id="preferredKeyExchangeAlgorithmSel" size="7">
															%invoke wm.server.sftpclient:listKeyExchangeAlgorithms%
																%loop keyExchangeAlgorithms%
																	<option value="%value%">%value%</option>
																%endloop%    
															%endinvoke%    
														</select>
													%endif%
												%endif%    
												%ifvar operation equals('edit')%
													<select name="preferredKeyExchangeAlgorithmSel" id="preferredKeyExchangeAlgorithmSel" size="7">
															<option value=""></option>                                                            
													</select>
													<script>populateOptions('%value preferredKeyExchangeAlgorithm%');</script>
												%endif%
											</td>
											<td align="left">
												<input type="button" style="width: 50px" value="Up" onClick="move(this.form,this.form.preferredKeyExchangeAlgorithmSel,-1)"><br>
												<input type="button" style="width: 50px" value="Down" onClick="move(this.form,this.form.preferredKeyExchangeAlgorithmSel,+1)">
											</td>        
										<tr>
									</table>    
								</td>
							</tr>
							<tr>
								<td class="oddrow" width="30%">Proxy Alias</td>
								<td class="oddrow-l" width="70%">
									%ifvar operation equals('add')%
										<select name="proxyAlias" id="proxyAlias" >
											<option value="" ></option>
											%invoke wm.server.proxy:listProxyAliasNames%
												%loop proxyAliases%
													<option value="%value%">%value%</option>
												%endloop%    
											%endinvoke%    
										</select>
										%ifvar user_action equals('gethostkey')%
											<script>setSelection('proxyAlias','%value proxyAlias%');</script>
										%endif%
									%endif%    
									%ifvar operation equals('edit')%
										<select name="proxyAlias" id="proxyAlias" >
											<option value=""></option>
											%invoke wm.server.proxy:listProxyAliasNames%
												%loop proxyAliases%
													<option value="%value%">%value%</option>
												%endloop%    
											%endinvoke%    
											
										</select>
										<script>setSelection('proxyAlias','%value proxyAlias%');</script>
									%endif%
									
								</td>
							</tr>
                            <tr>
                                <td class="evenrow" >%ifvar operation equals('add')% Host Key Location %endif% %ifvar operation equals('edit')% Host Key Fingerprint %endif%    </td>
                                <td class="evenrow-l" >
                                    
                                    %ifvar operation equals('add')%
										<input type="text" size="50" name="hostKeyLocation" id="hostKeyLocation" %ifvar user_action equals('gethostkey')% value="%value hostKeyLocation encode(htmlattr)%" %endif%>
										<input type="button" name="getHostKeyLocation" id="getHostKeyLocation" value="Get Host Key" onclick="populateForm(document.htmlform_gethostkey, document.htmlform_saConfig, '%value operation encode(javascript)%')">
                                    %endif% 
                                    %ifvar operation equals('edit')%
										<input type="text" size="50" name="fingerprint" id="fingerprint" value="%value fingerprint encode(htmlattr)%" disabled>
                                    %endif%
                                </td>
                            </tr>
                            %ifvar operation equals('edit')%
                            <tr>
                                <td class="oddrow" >Host Key Location</td>
                                <td class="oddrow-l" >
										<input type="text" size="50" name="hostKeyLocation" id="hostKeyLocation" value="%value hostKeyLocation encode(htmlattr)%">
										<input type="button" name="getHostKeyLocation" id="getHostKeyLocation" value="Get Host Key" onclick="populateForm(document.htmlform_gethostkey, document.htmlform_saConfig, '%value operation encode(javascript)%');">
                                </td>
                            </tr>
                            %endif%
                            <tr>
                                <td class="action" colspan=4>
                                    <input type="submit" name="submit" value="Save Changes" onclick="return validate('%value operation encode(javascript)%');">&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                
                </tr>
            </form>
            <form name="htmlform_gethostkey" action="settings-sftp-client-serveralias-addedit.dsp" method="POST">
                <input type="hidden" name="operation">
                <input type="hidden" name="user_action">
                <input type="hidden" name="alias">
                <input type="hidden" name="hostName">
                <input type="hidden" name="port">
				<input type="hidden" name="preferredKeyExchangeAlgorithm">
				<input type="hidden" name="proxyAlias">
                <input type="hidden" name="fingerprint">
                <input type="hidden" name="hostKeyLocation">
            </form>
            </table>
            </td>
        </tr>
        
    </table>
    
  </body>   
</html>
