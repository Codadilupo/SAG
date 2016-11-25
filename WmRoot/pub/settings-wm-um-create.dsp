                                                                                                                <HTML>
<HEAD>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <META HTTP-EQUIV="Expires" CONTENT="-1">

  <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">                                                                                                       
  <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
  
  <SCRIPT LANGUAGE="JavaScript">
  
    /**
     *
     */  
    function displaySettings(object) {
		toggleSSL(object.options[object.selectedIndex].value);
    }
    
	function toggleRows() {
		authSetting = document.all.clientAuthType.value;
		switch (authSetting) {
			case 'basic':
				document.all.basicRow.style.display = '';
				document.all.sslRow.style.display = 'none';
				break;
			case 'ssl':
				document.all.basicRow.style.display = 'none';
				document.all.sslRow.style.display = '';
				break;
			case 'none':
				document.all.basicRow.style.display = 'none';
				document.all.sslRow.style.display = 'none';
				break;	
		}	
	}
	
	function toggleSSL(authSetting) {
		toggleRows();
		switch (authSetting) {
			case 'basic':
				document.getElementById('umUser').disabled = false;
				document.getElementById('umPassword').disabled = false;
				document.getElementById('keyStoreAlias').disabled = true;
				document.getElementById('keyAlias').disabled = true;
				document.getElementById('trustStoreAlias').disabled = true;
			break;
			case 'ssl':
				document.getElementById('umUser').disabled = true;
				document.getElementById('umPassword').disabled = true;
				document.getElementById('keyStoreAlias').disabled = false;
				document.getElementById('keyAlias').disabled = false;
				document.getElementById('trustStoreAlias').disabled = false;
			break;
			case 'none':
				document.getElementById('umUser').disabled = true;
				document.getElementById('umPassword').disabled = true;
				document.getElementById('keyStoreAlias').disabled = true;
				document.getElementById('keyAlias').disabled = true;
				document.getElementById('trustStoreAlias').disabled = true;
			break;
		}
	}
    
    /**
     *
     */         
    function loadDocument() {
	    //alert("%value certfileType encode(javascript)%");
    
          setNavigation('settings-broker-edit.dsp',  '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_Messaging_webMMsgingSettings_ConnectionAlias_CreateUMScrn');
        
          %switch certfileType%

<!-- Trax 1-1RI0MD - 'JKS' is not supported for Keystore type  -->  
<!--    %case 'JKS'% -->
<!--      document.createform.certfileType.selectedIndex=1; -->
        %case 'PKCS12'%
          document.createform.certfileType.selectedIndex=1;
        %end%

        %switch truststoreType%
          %case 'JKS'%
          document.createform.truststoreType.selectedIndex=1;
        %end%
        //isSSLAltered();
      }
    
    /**
     *
     */
    function valueAltered() {
          document.createform.isChanged.value = "true";
      }
    
    /**
     *
       */       
    function isIllegalName(name) {
        // according to Enterprise Server Java Client API Reference Guide
        // '@', '\', '/' are restricted characters
      var illegalChars = "@/\\";

      for (var i=0; i<illegalChars.length; i++) {
        if (name.indexOf(illegalChars.charAt(i)) >= 0)
            return false;
        }
        return true;
    }
    
      /**
       *
       */              
    function confirmCreate() {
    
      if (isblank(document.createform.aliasName.value)) {
              alert ("Connection Alias Name is required.");
              return false;
        }else if (isblank(document.createform.description.value)) {
              alert ("Description is required.");
              return false; 
            }else if ( isblank(document.createform.CLIENTPREFIX.value) ) {
            alert("Client Prefix is required.");
            return false;  
            }else if ( isblank(document.createform.um_rname.value) ) {
              alert ("Realm URL is required.");
          return false;
        }else if ( !isInt(document.createform.um_tryAgainMaxAttempts.value) ) {
            alert ("Maximum Reconnection Attempts must be a positive integer or 0.");
            return false;   
      }else if ( !isInt(document.createform.um_publishWaitTime.value) ) {
            alert("Publish Wait must be a positive integer or 0.");
            return false;
        }else if ( !isIllegalName(document.createform.CLIENTPREFIX.value)) {
         alert("Invalid Client Prefix value.");
            return false;
        }else   if (document.createform.csqSize.value != "" && document.createform.csqSize.value != "-1" && !isInt(document.createform.csqSize.value)) {
        alert("Maximum CSQ Size must be a positive integer, 0, or -1. A value of -1 indicates that the CSQ Size is unlimited.");
        return false;
      }
	  
	  var clientAuthType = document.createform.clientAuthType.value;
		var realmUrl = document.createform.um_rname.value;
		//if (clientAuthType != "ssl" && (realmUrl.indexOf("nsps") != -1 || realmUrl.indexOf("nhps") != -1)) {
			//alert("Client Authentication must be set to SSL if Realm URL specifies includes nsps or nhps.");
                //return false;
		//}
        if ( clientAuthType == "basic") {
          if (document.createform.umUser.value.trim() == "" || document.createform.umPassword.value.trim() == "") {
              alert("Username and password are required for basic client authentication through Universal Messaging");
                return false;
            }
        }else if ( clientAuthType == "ssl") {
          if (document.createform.keyStoreAlias.value.trim() == "" && document.createform.trustStoreAlias.value.trim() == "") {
              alert("When Client Authentication is set to SSL, depending on whether authentication is one-way or two-way, Truststore Alias and/or Keystore Alias must be provided.");
                return false;
            }
        }
        return true;
      }
      
      /**
     * isInt
     */ 
    function isInt(value) {
      var strValidChars = "0123456789";
      var strChar;
      var blnResult = true;
      for (i = 0; i < value.length && blnResult == true; i++) {
        strChar = value.charAt(i);
        if (strValidChars.indexOf(strChar) == -1) {
          blnResult = false;
        }
      }
      return blnResult;
    }
	
	//SSL	
	var hiddenOptions = new Array();
	var hiddenOptionsTs = new Array();
      
	      function loadKeyStoresOptions()
	      {
			    var ks = document.createform.keyStoreAlias.options
				var ts = document.createform.trustStoreAlias.options
	      		%invoke wm.server.security.keystore:listKeyStoresAndConfiguredKeyAliases%
	      			   ks[ks.length] = new Option("","");
				       hiddenOptions[ks.length-1] = new Array();
				       
			       	   %loop keyStoresAndConfiguredKeyAliases%
			       			ks.length=ks.length+1;
				       		ks[ks.length-1] = new Option("%value encode(javascript) keyStoreName%","%value encode(javascript) keyStoreName%");
			           		var aliases = new Array();
			    	   		%loop keyAliases%
			       				aliases[%value $index%] = new Option("%value%","%value%");		
			       			%endloop%
			       			if (aliases.length == 0)
			       			{
								aliases[0] = new Option("","");		
							}
				       		hiddenOptions[ks.length-1] = aliases;
		       	   %endloop%
			    %endinvoke%
			    
				//list trust store aliases
				%invoke wm.server.security.keystore:listTrustStores%
	      			   ts[ts.length] = new Option("","");
				       hiddenOptionsTs[ts.length-1] = new Array();
			       	   %loop trustStores%
			       			ts.length=ts.length+1;
				       		ts[ts.length-1] = new Option("%value encode(javascript) keyStoreName%","%value encode(javascript) keyStoreName%");
			           		var aliases = new Array();
				       		hiddenOptionsTs[ts.length-1] = aliases;
		       	   %endloop%
			    %endinvoke%
				
			    var keyOpts = document.createform.keyStoreAlias.options;
    			var key = "%value encode(javascript) keyStoreAlias%";
				if ( key != "") 
				{
	       			for(var i=0; i<keyOpts.length; i++) 
	       			{
				    	if(key == keyOpts[i].value) {
				    		keyOpts[i].selected = true;
		    			}
			      	}
				}
				
				changeval();
				
				var aliasOpts = document.createform.keyAlias.options;
    			var alias = '%value encode(javascript) keyAlias%';
				if ( alias != "") 
				{
	       			for(var i=0; i<aliasOpts.length; i++) 
	       			{
				    	if(alias == aliasOpts[i].value) {
				    		aliasOpts[i].selected = true;
		    			}
			      	}
				}
	      }
	      
	      function changeval() {
       		var ks = document.createform.keyStoreAlias.options;
       		var selectedKS = document.createform.keyStoreAlias.value;
       		for(var i=0; i<ks.length; i++) {
       			if(selectedKS == ks[i].value) {
		       		var aliases = hiddenOptions[i];
       				document.createform.keyAlias.options.length = aliases.length;
       				for(var j=0;j<aliases.length;j++) {
       					var opt = aliases[j];
       					document.createform.keyAlias.options[j] = new Option(opt.text, opt.value);
     				}
       			}
       		}
		}
  
  </SCRIPT>
</HEAD>

<body onLoad="loadDocument();loadKeyStoresOptions();">

  <TABLE width="100%">
    <TR>
      <TD class="breadcrumb" colspan="2">Settings &gt; Messaging &gt; webMethods Messaging Settings &gt; Universal Messaging Connection Alias &gt; Create</TD>
    </TR>
    <TR>
      <TD colspan="2">
        <ul class="listitems">
          <li class="listitem"><a href="settings-wm-messaging.dsp?aliasName=%value aliasName encode(url)%">Return to webMethods Messaging Settings</a></li>
        </UL>
      </TD>
    </TR>
    <TR>
      <TD>
        <FORM name="createform" action="settings-wm-um-detail.dsp" METHOD="POST">
        
         <!--                  -->
         <!-- General Settings -->
         <!--                  -->
         
         <TABLE class="tableView" width="85%">      
          <TR>
            <TD class="heading" colspan=2>General Settings</TD>
          </TR>

          <!-- Connection Alias Name -->
          <TR>
            <TD width="40%" class="oddrow-l" nowrap="true">Connection Alias Name</TD>
            <TD class="oddrowdata-l"><INPUT NAME="aliasName" size="50"></TD>
          </TR>

          <!-- Description -->
          <TR>
            <TD class="evenrow-l">Description</TD>
            <TD class="evenrowdata-l"><INPUT NAME="description" size="50"></TD>
          </TR>
          
          <!-- Client Prefix -->
          <TR>
            <TD class="oddrow-l">Client Prefix</TD>
            <TD class="oddrowdata-l"><INPUT NAME="CLIENTPREFIX" size="50" value="%value CLIENTPREFIX encode(htmlattr)%"></TD>
          </TR>
          
          <!-- Share Client Prefix -->
          <TR>
            <TD class="evenrow-l">Share Client Prefix</TD>
            <TD class="evenrowdata-l">
              %ifvar isISClustered equals(true)%
                %ifvar isClientPrefixShared equals(true)%
                              <INPUT TYPE="checkbox" disabled="true" NAME="isClientPrefixShared" checked="true">
                            %else%
                              <INPUT TYPE="checkbox" disabled="true" NAME="isClientPrefixShared">
                          %endif%
                        %else%
                            %ifvar isClientPrefixShared equals(true)%
                              <INPUT TYPE="checkbox" NAME="isClientPrefixShared" checked="true">
                            %else%
                              <INPUT TYPE="checkbox" NAME="isClientPrefixShared">
                          %endif%
                        %endif%
                      </TD>
          </TR>
          
          <!--                     -->
          <!-- Connection Settings -->
          <!--                     -->
         
          <TR>
            <TD class="heading" colspan=2>Connection Settings</TD>
          </TR>
          
          <!-- Realm URL -->
          <TR>
            <TD class="oddrow-l">Realm URL</TD>
            <TD class="oddrowdata-l"><INPUT NAME="um_rname" size="50" value="%value nullString null=nsp://localhost:9000 encode(htmlattr)%"></TD>
          </TR>

          <TR>
            <TD class="evenrow-l">Maximum Reconnection Attempts</TD>
            <TD class="evenrowdata-l"><INPUT NAME="um_tryAgainMaxAttempts" size="50" value="5"></TD>
          </TR>
          
          <!--                     -->
          <!-- Producer Settings   -->
          <!--                     -->
          
          <tr>
            <td class="heading" colspan=2>Producer Settings</td>
          </tr>
    
          <!-- Enable CSQ -->
          <TR>
            <TD class="oddrow-l">Enable CSQ</TD>
            <TD class="evenrowdata-l"><INPUT TYPE="checkbox" NAME="useCSQ" checked="false"></TD>
                    </TR>
          
          <!-- Maximum CSQ Size -->
          <TR>
            <TD class="evenrow-l">Maximum CSQ Size (messages)</TD>
            <TD class="evenrowdata-l"><INPUT NAME="csqSize" size="50" value="-1"></TD>
          </TR>

          <!-- Drain CSQ in Order --> 
          <TR>
            <TD class="oddrow-l">Drain CSQ in Order</TD>
            <TD class="oddrowdata-l"><INPUT TYPE="checkbox" NAME="csqDrainInOrder" checked="true"></TD>
                    </TR>     

          <!-- Publish Wait Time (while reconnection) -->
          <TR>
            <TD class="evenrow-l">Publish Wait Time while Reconnecting (milliseconds)</TD>
            <TD class="evenrowdata-l"><INPUT NAME="um_publishWaitTime" size="50" value="0"></TD>
          </TR>
          
          <!-- Include All Envelope Data 
          <TR>
            <TD class="oddrow-l">Include All Envelope Fields</TD>
            <TD class="oddrowdata-l"><INPUT TYPE="checkbox" NAME="includeFullEnvelope" checked="true"></TD>
          </TR>   -->

<!--                                -->
          <!-- Client Authentication Settings -->
          <!--                                -->
            
           <TR>
                    <TD class="heading" colspan=2>Client Authentication Settings</TD>
                </TR> 

          <!-- Client Authentication -->
          <TR>
            <TD class="oddrow-l">Client Authentication</TD>
            <TD class="oddrowdata-l">
              <select name="clientAuthType" ID="clientAuthType" onchange="displaySettings(this.form.clientAuthType);valueAltered()">
                        %ifvar clientAuthType equals('none')%
                            <option value="none" selected>None</option>
                        %else%
                            <option value="none">None</option>
                        %endif%
                        %ifvar clientAuthType equals('basic')%
                            <option value="basic" selected>Username/Password</option>
                        %else%
                            <option value="basic">Username/Password</option>
                        %endif%
                        %ifvar clientAuthType equals('ssl')%
                            <option value="ssl" selected>SSL</option>
                        %else%
                            <option value="ssl">SSL</option>
                        %endif%
                      </select>
            </TD>
          </TR>
        
        <TR ID="basicRow">
        <TD colspan=2 style="margin: 0px; padding: 0px; border-spacing: 0px;">
                <TABLE width="100%">
                  <TR>
                        <TD width="40%" class="evenrow-l">Username</TD>
					    <TD class="evenrowdata-l"><INPUT NAME="umUser" id="umUser" size=50 VALUE="%value umUser encode(htmlattr)%" onChange="valueAltered()"></TD>
                    </TR>
                    <TR>
                        <TD class="oddrow-l">Password</TD>
					   <TD class="oddrowdata-l"><INPUT NAME="umPassword" id="umPassword" size=50 TYPE="password" autocomplete="off" VALUE="%value umPassword encode(htmlattr)%" onChange="valueAltered()"/></TD>
                    </TR>
                  </TABLE>
        </TD>
        </TR>          
		
		<TR ID="sslRow">
		<TD colspan=2 style="margin: 0px; padding: 0px; border-spacing: 0px;">
			    <TABLE width="100%">
				<TR>
				<TD class="evenrow-l">Truststore Alias</TD>
				<TD class="evenrowdata-l">
					<SELECT class="listbox" name="trustStoreAlias" id="trustStoreAlias" style="width: 270px;"></SELECT>
		        </TD>
			  </TR>
				<TR>
				<TD width="40%" class="evenrow-l">Keystore Alias</TD>
				<TD class="evenrowdata-l">
					<SELECT class="listbox" name="keyStoreAlias" id="keyStoreAlias" onchange="changeval()" style="width: 270px;"></SELECT>
		        </TD>
			  </TR>
			  <TR>
			   	<TD class="oddrow-l">Key Alias</TD>
			    <TD class="oddrowdata-l">
		        	<select class="listbox" name="keyAlias" id="keyAlias" style="width: 270px;" ></select>  		
		        </TD>
			   </TR>			   
				  </TABLE>
		</TD>
		</TR>
          <!--                     -->
          <!-- Consumer Settings   -->
          <!--                     -->
          
          <tr>
            <td class="heading" colspan=2>Consumer Settings</td>
          </tr>    

          <!-- Request-Reply -->  
          <TR>
            <TD class="oddrow-l">Enable Request-Reply Channel and Listener</TD>
            <TD class="oddrowdata-l"><INPUT TYPE="checkbox" NAME="enableRequestReply" checked="true"></TD>
          </TR>  
          
         </table>
         
         <TABLE class="tableView" width="85%">
               <TR>
               <TD class="action" class="row" width="40%">
                 <INPUT TYPE="hidden" NAME="action" VALUE="create">
                 <INPUT TYPE="hidden" NAME="type" VALUE="UM">
                 <INPUT type="submit" value="Save Changes" onClick="javascript:return confirmCreate()">
               </TD>
             </TR>
         </table>
         
         <SCRIPT>
					toggleRows();
                    if(document.createform.clientAuthType.value == "none") {
                    document.getElementById('umUser').disabled = true;
                    document.getElementById('umPassword').disabled = true;
        }
        </SCRIPT>
        </FORM>
      </TD>
    </TR>
  </TABLE>
</BODY>
</HTML>