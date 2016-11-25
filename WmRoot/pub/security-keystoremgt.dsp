<HTML>
  <HEAD>

       <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>

    <TITLE>Integration Server -- Keystore Management</TITLE>
    <SCRIPT LANGUAGE="JavaScript">
        //scrpt to delete the key store with the given name
        function deleteKeyStore (keyStoreName, typeVal) {
            
            var msg = "";
            if (typeVal == "key")
                msg = "OK to delete keystore alias '"+keyStoreName+"'?";
            else
                msg = "OK to delete truststore alias '"+keyStoreName+"'?";
            if (confirm (msg)) {
                    document.deleteform.keyStoreName.value = keyStoreName;
                     document.deleteform.type.value = typeVal;
                    document.deleteform.submit();
                      return false;
            } else return false;
          }
      
        function viewKeyStore (errorMessage, keyStoreName,keyStoreType,keyStoreLocation,keyStoreProvider,typeVal) {         
                  document.viewform.keyStoreName.value = keyStoreName;
                  document.viewform.keyStoreType.value = keyStoreType;
                  document.viewform.keyStoreLocation.value = keyStoreLocation;
                  document.viewform.keyStoreProvider.value = keyStoreProvider;
                  document.viewform.type.value = typeVal;
                  document.viewform.errorMessage.value = errorMessage;                  
                  document.viewform.submit();
                  return true;          
          }
          
          function confirmReload(name, type)
          {
                var msg = "";
            if (type == "key")
                msg = "OK to reload keystore alias '"+name+"'?";
            else
                msg = "OK to reload truststore alias '"+name+"'?";
                
              if (confirm(msg))
            {
                document.reloadform.keyStoreName.value = name;
                document.reloadform.type.value = type;
                document.reloadform.submit();
                return false;
            }
            else
             return false;                      
          }
    </SCRIPT>

  </HEAD>

  <BODY onLoad="setNavigation('security-keystoremgt.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_KeystoreScrn');">
    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan="2"> Security &gt; Keystore </TD>
      </TR>
      
      %ifvar mode%
          %switch mode%
          %case 'add'%
                %invoke wm.server.security.keystore:createStore%
                      %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
	      	          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                      %endif%
                %onerror%
                        <tr><td colspan="2">&nbsp;</td></tr>
	      	          <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                %endinvoke%
            
          %case 'edit'%
                                  
                %invoke wm.server.security.keystore:createStore%
                      %ifvar message%
                        <tr><td colspan="2">&nbsp;</td></tr>
	      	          	<TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                      %endif%
                %onerror%
                        <tr><td colspan="2">&nbsp;</td></tr>
	      	          <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                %endinvoke%
       %case 'edit_add'%
                                  
                %invoke wm.server.security.keystore:createStore%
                      %ifvar message%
                        <tr><td colspan="2">&nbsp;</td></tr>
	      	          	<TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                      %endif%
                %onerror%
                        <tr><td colspan="2">&nbsp;</td></tr>
	      	          <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                %endinvoke%
         %case 'edit_edit'%
                                  
                %invoke wm.server.security.keystore:createStore%
                      %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
	      	          	<TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                      %endif%
                %onerror%
                        <tr><td colspan="2">&nbsp;</td></tr>
	      	          <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                %endinvoke%
         
         %case 'reload'%
             %invoke wm.server.security.keystore:refreshStore%
                     %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
	      	          	<TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                      %endif%
             %onerror%
                             <tr><td colspan="2">&nbsp;</td></tr>
	      	          		<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
               %endinvoke% 

        %case 'delete'%
             %invoke wm.server.security.keystore:deleteStore%
                      %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
	      	          	<TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                      %endif%
               %endinvoke% 
         %endswitch%
     %endif%

      <TR>
        <TD colspan="2">
          <ul class="listitems">
            <LI class="listitem"><A HREF="security-keystoremgt-keystore.dsp?type=key&mode=add">Create Keystore Alias</a></li>
            <LI class="listitem"><A HREF="security-keystoremgt-keystore.dsp?type=trust&mode=add">Create Truststore Alias</a></li>
            <LI class="listitem"><A HREF="add-javasecurity-provider.dsp?">Add Security Provider</a></li>            
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
                  <TD class="heading" colspan="8">Keystore List</TD>
                </TR>

                <TR class="subheading2">
                  <TD>Alias</TD>
                  <TD>Type</TD>
                  <TD>Provider</TD>
                  <TD>Location</TD>                  
                  <!-- <TD>Execute ACL</TD> -->
                  <TD>Loaded</TD>                                    
                  <TD>Reload</TD>                                                      
                  <TD>Delete</TD>
                </TR>
                
                %invoke wm.server.security.keystore:listKeyStores%
                %loop keyStores%
                    <TR>

                      <script>writeTD("rowdata-l");</script>               
					  <A HREF="javascript:viewKeyStore('%value errorMessage encode(javascript)%','%value keyStoreName encode(javascript)%', '%value keyStoreType encode(javascript)%', '%value keyStoreLocation encode(javascript)%','%value keyStoreProvider encode(javascript)%','key');">
					    %value keyStoreName encode(html)%
                      </A>                
                      </TD>
				      <script>writeTD("rowdata");</script>%value keyStoreType encode(html)%</TD>
				      <script>writeTD("rowdata");</script>%value keyStoreProvider encode(html)%</TD>
				      <script>writeTD("rowdata");</script>%value keyStoreLocation encode(html)% </TD>				                    
   				      <!-- <script>writeTD("rowdata");</script>%value acl encode(html)%</TD> -->
                         <script>writeTD("rowdata");</script>%ifvar isLoaded equals('true')%<IMG SRC="images/green_check.png">Yes%else%No%endif%</TD>                                                                
   				      <script>writeTD("rowdata");</script><A class="imagelink" HREF=""  ONCLICK="return confirmReload('%value keyStoreName encode(javascript)%', 'key');">
                      <IMG SRC="icons/icon_reload.png" border="0"
                      alt="Reload Keystore"></A></TD>                                                                                         
                      <script>writeTD("rowdata");</script>               
                          <a class="imagelink"  href="security-keystoremgt.dsp" onClick="return deleteKeyStore('%value keyStoreName encode(javascript)%','key');">
                          <img src="icons/delete.png" alt="Delete Keystore : %value keyStoreName encode(htmlattr)%" border="none"></a>
                      </TD>

                    </TR>
                    <script>swapRows();</script>
                %endloop%
                %endinvoke%
                
                <TR><TD colspan="11"><IMG SRC="images/blank.gif" height="10" width="10"></TD></TR>
                <TR><TD class="heading" colspan="11">Truststore List</TD></TR>                
                <TR class="subheading2">
                        <TD>Alias</TD>
                        <TD>Type</TD>
                        <TD>Provider</TD>
                        <TD>Location</TD>                        
                      <!-- <TD>Execute ACL</TD> -->
                      <TD>Loaded</TD>                                    
                      <TD>Reload</TD>                                                      
                        <TD>Delete</TD>
                   </TR>
                %invoke wm.server.security.keystore:listTrustStores%
                    
                      %loop trustStores%
                          <TR>
                            <script>writeTD("row-l");</script>               
      					  <A HREF="javascript:viewKeyStore('%value errorMessage encode(javascript)%','%value keyStoreName encode(javascript)%', '%value keyStoreType encode(javascript)%', '%value keyStoreLocation encode(javascript)%','%value keyStoreProvider encode(javascript)%','trust');">
      					    %value keyStoreName encode(html)%
                            </A>                
                            </TD>
      				      <script>writeTD("rowdata");</script>%value keyStoreType encode(html)%</TD>
      				      <script>writeTD("rowdata");</script>%value keyStoreProvider encode(html)%</TD>
      				      <script>writeTD("rowdata");</script>%value keyStoreLocation encode(html)% </TD>
      				      <!-- <script>writeTD("rowdata");</script>%value acl encode(html)%</TD> -->
                             <script>writeTD("rowdata");</script>%ifvar isLoaded equals('true')%<IMG SRC="images/green_check.png">Yes%else%No%endif%</TD>                                                                
	   				      <script>writeTD("rowdata");</script><A class="imagelink" HREF=""  ONCLICK="return confirmReload('%value keyStoreName encode(javascript)%', 'trust');">
                          <IMG SRC="icons/icon_reload.png" border="0"
                          alt="Reload Truststore"></A></TD>                                                                                         
                                                                      
                            <script>writeTD("rowdata");</script>               
                                <a class="imagelink" href="security-keystoremgt.dsp" onClick="return deleteKeyStore('%value keyStoreName encode(javascript)%','trust');">
                                <img src="icons/delete.png" alt="Delete Truststore : %value keyStoreName encode(htmlattr)%" border="none"></a>
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

    <form name="viewform" action="security-keystoremgt-keystore.dsp" method="POST">
        <input type="hidden" name="keyStoreName">
        <input type="hidden" name="errorMessage">        
        <input type="hidden" name="keyStoreType">
        <input type="hidden" name="keyStoreLocation">
        <input type="hidden" name="keyStoreProvider">
        <input type="hidden" name="mode" value="view">
        <input type="hidden" name="type">
     </form>

    <form name="reloadform" action="security-keystoremgt.dsp" method="POST">
        <input type="hidden" name="keyStoreName">
        <input type="hidden" name="mode" value="reload">
        <input type="hidden" name="type">
    </form>

    <form name="deleteform" action="security-keystoremgt.dsp" method="POST">
        <input type="hidden" name="keyStoreName">
        <input type="hidden" name="mode" value="delete">
        <input type="hidden" name="type">
    </form>

  </BODY>
</HTML>

