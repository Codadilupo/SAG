<HTML>
<HEAD>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <META HTTP-EQUIV="Expires" CONTENT="-1">

  <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">                                                                                                       
  <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
  
  %invoke wm.server.messaging:getConnectionAliasReport%
    
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
    
          setNavigation('settings-wm-des-edit.dsp',  '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_Messaging_webMMsgingSettings_ConnectionAlias_EditUMScrn');
        
          %switch certfileType%

<!-- Trax 1-1RI0MD - 'JKS' is not supported for Keystore type  -->  
<!--    %case 'JKS'% -->
<!--      document.editform.certfileType.selectedIndex=1; -->
        %case 'PKCS12'%
          document.editform.certfileType.selectedIndex=1;
        %end%

        %switch truststoreType%
          %case 'JKS'%
          document.editform.truststoreType.selectedIndex=1;
        %end%
        //isSSLAltered();
      }
    
    /**
     *
     */
    function valueAltered() {
          document.editform.isChanged.value = "true";
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
    function confirmEdit() {
    
        if (isblank(document.editform.description.value)) {
              alert ("Description is required.");
              return false;
      }else if ( isblank(document.editform.CLIENTPREFIX.value) ) {
            alert("Client Prefix is required.");
            return false;      
            }else if ( isblank(document.editform.um_rname.value) ) {
              alert ("Realm URL is required.");
          return false;
        }else if ( !isInt(document.editform.um_tryAgainMaxAttempts.value) ) {
            alert ("Maximum Reconnection Attempts must be a positive integer or 0.");
            return false;   
      }else if ( !isInt(document.editform.um_publishWaitTime.value) ) {
            alert("Publish Wait must be a positive integer or 0.");
            return false;
        }else if ( !isIllegalName(document.editform.CLIENTPREFIX.value)) {
         alert("Invalid Client Prefix value.");
            return false;
        }else   if (document.editform.csqSize.value != "" && document.editform.csqSize.value != "-1" && !isInt(document.editform.csqSize.value)) {
        alert("Maximum CSQ Size must be a positive integer, 0, or -1. A value of -1 indicates that the CSQ Size is unlimited.");
        return false;
      }

        var clientAuthType = document.editform.clientAuthType.value;
		var realmUrl = document.editform.um_rname.value;
		if (clientAuthType != "ssl" && (realmUrl.indexOf("nsps") != -1 || realmUrl.indexOf("nhps") != -1)) {
			alert("Client Authentication must be set to SSL if Realm URL specifies includes nsps or nhps.");
                return false;
		}
        if ( clientAuthType == "basic") {
          if (document.editform.umUser.value.trim() == "" || document.editform.umPassword.value.trim() == "") {
              alert("Username and password are required for basic client authentication through Universal Messaging");
                return false;
            }
        }else if ( clientAuthType == "ssl") {
          if (document.editform.keyStoreAlias.value.trim() == "" && document.editform.trustStoreAlias.value.trim() == "") {
              alert("When Client Authentication is set to SSL, depending on whether authentication is one-way or two-way, Truststore Alias and/or Keystore Alias must be provided.");
                return false;
            }
        }
            //must be a positive integer, 0, or -1. A value of -1 indicates that the CSQ Size is unlimited.

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
			    var ks = document.editform.keyStoreAlias.options
				var ts = document.editform.trustStoreAlias.options
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
				
			    var keyOpts = document.editform.keyStoreAlias.options;
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
				
				var aliasOpts = document.editform.keyAlias.options;
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
				
				var trustOpts = document.editform.trustStoreAlias.options;
    			var trustKey = "%value encode(javascript) trustStoreAlias%";
				if ( trustKey != "") 
				{
	       			for(var i=0; i<trustOpts.length; i++) 
	       			{
				    	if(trustKey == trustOpts[i].value) {
				    		trustOpts[i].selected = true;
		    			}
			      	}
				}
	      }
	      
	      function changeval() {
       		var ks = document.editform.keyStoreAlias.options;
       		var selectedKS = document.editform.keyStoreAlias.value;
       		for(var i=0; i<ks.length; i++) {
       			if(selectedKS == ks[i].value) {
		       		var aliases = hiddenOptions[i];
       				document.editform.keyAlias.options.length = aliases.length;
       				for(var j=0;j<aliases.length;j++) {
       					var opt = aliases[j];
       					document.editform.keyAlias.options[j] = new Option(opt.text, opt.value);
     				}
       			}
       		}
		}	
  </SCRIPT>
</HEAD>

<body onLoad="loadDocument();loadKeyStoresOptions();">

  <TABLE width="100%">
    <TR>
      <TD class="breadcrumb" colspan="2">Settings &gt; Messaging &gt; webMethods Messaging Settings &gt; Digital Event Services Connection Alias &gt; Edit</TD>
    </TR>
    <TR>
      <TD colspan="2">
        <ul class="listitems">
          <li class="listitem"><a href="settings-wm-des-detail.dsp?aliasName=%value aliasName encode(url)%">Return to Digital Event Services Connection Alias</a></li>
        </UL>
      </TD>
    </TR>
    <TR>
      <TD>
        <FORM name="editform" action="settings-wm-des-detail.dsp" METHOD="POST">
        
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
            <TD class="oddrowdata-l"><INPUT NAME="aliasName" size="50" value="%value aliasName encode(htmlattr)%" DISABLED></TD>
          </TR>

          <!-- Description -->
          <TR>
            <TD class="evenrow-l">Description</TD>
            <TD class="evenrowdata-l"><INPUT NAME="description" size="50" value="%value description encode(htmlattr)%"></TD>
          </TR>
          
          <!-- Client Prefix -->
          <TR>
            <TD class="oddrow-l">Client Prefix</TD>
            <TD class="oddrowdata-l"><INPUT NAME="CLIENTPREFIX" size="50" value="%value CLIENTPREFIX encode(htmlattr)%"></TD>
          </TR>
          
          <!-- Share Client Prefix -->
          <TR>
            <TD class="evenrow-l">Share Client Prefix (prevents removal of shared messaging provider objects)</TD>
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
          
         </table>
         
         <TABLE class="tableView" width="85%">
               <TR>
               <TD class="action" class="row" width="40%">
                 <INPUT TYPE="hidden" NAME="action" VALUE="edit">
        	     <INPUT TYPE="hidden" NAME="aliasName" VALUE="%value aliasName encode(htmlattr)%">
                 <INPUT TYPE="hidden" NAME="type" VALUE="DES">
                 <INPUT type="submit" value="Save Changes" onClick="javascript:return confirmEdit()">
               </TD>
             </TR>
         </table>
         
        %endinvoke%
        <SCRIPT>
					toggleRows();
                    if(document.editform.clientAuthType.value == "none") {
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