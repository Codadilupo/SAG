<html>

<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" type="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  
  <script language ="javascript">
  
  function changeTriggerState() {
  
    return confirm("Would you like to make this change across the entire cluster?");  
  
  }

  function popUp(URL) {
      day = new Date();
      id = day.getTime();
      if(is_csrf_guard_enabled && needToInsertToken) {
          if(URL.indexOf("?") != -1) {
              URL = URL+"&"+ _csrfTokenNm_ + "=" + _csrfTokenVal_;
          }else {
              URL = URL+"?"+ _csrfTokenNm_ + "=" + _csrfTokenVal_;
          }
      } 
      eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=200,height=200,left = 540,top = 412');");
  }

  function switchToQuiesceMode(form , mode) {
  
    delayTime = prompt("OK to enter quiesce mode?\nSpecify the maximum number of minutes to wait before disabling packages:",0);
    if(delayTime == null) { 
      return false;
    else{
      return true;
    }
    }
  
  </script>
  
</head>

<body onLoad="setNavigation('settings-broker.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_Messaging_webMMsgingSettingsScrn');">
  <table width="100%">
  
    <tr>
      <td class="breadcrumb" colspan="2">Settings &gt; Messaging &gt; webMethods Messaging Settings</td>
    </tr>
    
    <!--                 -->
    <!-- Handle 'action' -->
    <!--                 -->
    
    %switch action%
    
    %case 'error-broker-exists'%
      <script>alert("Cannot create new Broker alias. Only one Broker alias can exist at a time.")</script>
    %case 'changeState'%
      %ifvar setEnabled equals('true')%
        %invoke wm.server.messaging:enableConnectionAlias%
        <TR>
          <TD colspan="2">&nbsp;</td>
          </TR>
        <TR>
          <TD class="message" colspan=2>%value message encode(html)%</TD>
        </TR>
        %endinvoke%
      %else%
        %invoke wm.server.messaging:disableConnectionAlias%
        <TR>
          <TD colspan="2">&nbsp;</td>
          </TR>
        <TR>
          <TD class="message" colspan=2>%value message encode(html)%</TD>
        </TR>
        %endinvoke%
      %endif%
      %rename aliasName editedAliasName%
    
    %case 'delete'%
      %invoke wm.server.messaging:deleteConnectionAlias%
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td class="message" colspan=2>%value message encode(html)%</td>
      </tr>
      %endinvoke%
      %rename aliasName editedAliasName%
    
    %case 'create'%
      %invoke wm.server.messaging:createConnectionAlias%
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td class="message" colspan=2>%value message encode(html)%</td>
      </tr>
      %endinvoke%  
      %rename aliasName editedAliasName%
    
    %case 'setSettings'%
      %invoke wm.server.messaging:setSettings%
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td class="message" colspan=2>%value message encode(html)%</td>
      </tr>
      %endinvoke%  
      %rename aliasName editedAliasName%
      
    %case 'changeDefaultConnectionAlias'%
      %invoke wm.server.messaging:changeDefaultConnectionAlias%
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td class="message" colspan=2>%value message encode(html)%</td>
      </tr>
      %endinvoke%  
      %rename aliasName editedAliasName%
      
    %end%
    
    <!--                                                  -->
    <!-- Get main connection alias report for all aliases -->
    <!--                                                  -->
    
    %invoke wm.server.messaging:getConnectionAliasReport%
    
    <!-- Navigation Menu -->
    
    <tr>
      <td colspan="2">
        <ul class="listitems">
          <li class="listitem"><a href="settings-messaging.dsp">Return to Messaging</a></li>
          %ifvar isBrokerConfigured equals('true')%
            <li class="listitem"><a href="settings-wm-messaging.dsp?action=error-broker-exists">Create Broker Connection Alias</a></li>
          %else%
            <li class="listitem"><a href="settings-wm-broker-create.dsp">Create Broker Connection Alias</a></li>
          %endif%
          <li class="listitem"><a href="settings-wm-um-create.dsp">Create Universal Messaging Connection Alias</a></li>
          <li class="listitem"><a href="settings-wm-messaging-default.dsp">Change Default Connection Alias</a></li>
          <li class="listitem"><a href="settings-wm-messaging.dsp">Refresh Page</a></li>
          
        </ul>
      </td>                                                                                                                       
    </tr>
    
    <tr>
      <td>
        <!-- Connection Alias -->

        <table class="tableView" width="100%">

          <!-- Headers -->

          <tr>
            <td class="heading" colspan=7>webMethods Messaging Connection Alias Definitions</td>
          </tr>

          <tr>
            <td class="oddcol">Default</td>
            <td class="oddcol-l">Type</td>
            <td class="oddcol-l" nowrap>Connection Alias Name</td>
            <td class="oddcol-l">Description</td>
            <td class="oddcol-l">CSQ Count</td>
            <td class="oddcol">Enabled</td>
            <td class="oddcol">Delete</td>
          </tr> 
          
          %loop aliasDataList%

            <tr>
              <!-- Default flag -->
              <script>writeTD("rowdata");</script>
                %ifvar defaultAlias equals('false')%
                  &nbsp;
                %else%
                  <img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/green_check.png"></a>              
                %endif%
              </td>
              
              <!-- Type -->            
              <script>writeTD("row-l");</script>
                %ifvar type equals('BROKER')%
                  Broker
                %else%
                  %ifvar type equals('UM')%
                    Universal Messaging
                  %else%                                                                                        
                    %ifvar type equals('DES')%
                      Digital Event Services
                    %else%
                      Local
                    %endif%      
                  %endif%
                %endif%
              </td>
              
              <!-- Alias Name -->                           
              %ifvar type equals('BROKER')%
                <script>writeTD("row-l");</script><a href="settings-wm-broker-detail.dsp?aliasName=%value aliasName encode(url)%">
              %else%
                %ifvar type equals('DES')%
                  <script>writeTD("row-l");</script><a href="settings-wm-des-detail.dsp?aliasName=%value aliasName encode(url)%">
                %else%
                  %ifvar type equals('UM')%
                    <script>writeTD("row-l");</script><a href="settings-wm-um-detail.dsp?aliasName=%value aliasName encode(url)%">
                  %else%
                    <script>writeTD("row-l");</script><a href="settings-wm-local-detail.dsp?aliasName=%value aliasName encode(url)%">
                  %endif%
                %endif%
              %endif%
                %value aliasName encode(html)%</a>
              </td>
                
              <!-- Description -->              
              <script>writeTD("row-l");</script>%value description encode(html)%</td>
              
              <!-- Transaction Mode - NOT SUPPORTED YET      
              <script>writeTD("row-l");</script>
                %switch transactionType%
                  %case '0'%NO TRANSACTION<br>
                  %case '1'%LOCAL TRANSACTION<br>
                  %case '2'%XA TRANSACTION<br>
                  %case%&nbsp;<br>
                %end%
              </td>
               -->   
                          
              <!-- CSQ Count -->
              <script>writeTD("row-l");</script>
                %ifvar type equals('DES')%
                  &nbsp;
                %else%
                  %value messageCount encode(html)%
                %endif%
              </td>

              <!-- Enabled -->
              <script>writeTD("rowdata");</script>
              
              %ifvar type equals('LOCAL')%
                      
              %else%
              
              %ifvar isUpdated equals('true')%
                
                <!-- Broker specific logic (when Broker settings were changed) -->
                %ifvar updatedEnabledFlag equals('false')%
                  <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=true">No</a>&nbsp;[Pending&nbsp;Restart]
                %else%
                  %ifvar updatedEnabledFlag equals('true')%
                    <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=false"><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/yellow_check.png">Yes</a>&nbsp;[Pending&nbsp;Restart]
                  
                  %else%
                  
                    %ifvar connected equals('false')%
                      %ifvar enabled equals('false')%
                        <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=true">No</a>&nbsp;[Pending&nbsp;Restart]
                      %else%
                        <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=false"><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/green_check.png">Yes</a>&nbsp;[Pending&nbsp;Restart]
                      %endif%
                    %else%
                      <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=false"><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/yellow_check.png">Yes</a>&nbsp;[Pending&nbsp;Restart]           
                    %endif%
                  
                  %endif%
                %endif%                     
                
              %else%
                
                %ifvar connected equals('false')%
                  %ifvar enabled equals('false')%
                    <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=true">No</a>
                  %else%
                    %ifvar state equals('STOPPED')%
                      <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=false"><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/yellow_check.gif">Yes</a>&nbsp;(Not&nbsp;Connected)
                    %else%
                      <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=false"><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/yellow_check.gif">Yes</a>&nbsp;(%value state%)                     
                    %endif%
                  %endif%
                %else%
                  <a href="settings-wm-messaging.dsp?action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=false"><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/green_check.png">Yes</a>              
                %endif%
              %endif%
              
              %endif%

              <!-- Delete --> 
              <script>writeTD("rowdata");</script>
              
              %ifvar type equals('LOCAL')%
                 <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete_disabled.png">
              %else%
              
               %ifvar type equals('DES')%
                 <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete_disabled.png">
               %else%
              
                %ifvar enabled equals('true')%
                  <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete_disabled.png">
                %else%
                  %ifvar defaultAlias equals('true')%
                    <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete_disabled.png">
                  %else%
                    %ifvar updatedEnabledFlag equals('true')%
                      <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete_disabled.png">
                    %else%
                      %ifvar hasTriggers equals('true')%
                        <a href="settings-wm-messaging.dsp?action=delete&aliasName=%value aliasName encode(url)%" onClick="javascript:return confirm('The connection alias %value aliasName encode(javascript)% is associated with one or more triggers. Are you sure you want to delete this connection alias?')">
                          <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete.png">
                        </a>
                      %else%
                        <a href="settings-wm-messaging.dsp?action=delete&aliasName=%value aliasName encode(url)%" onClick="javascript:return confirm('Are you sure you want to delete Connection Alias %value aliasName encode(javascript)%?')">
                          <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete.png">
                        </a>
                      %endif%
                    %endif%
                  %endif%
                %endif%
               %endif%
              %endif%
              
              <!-- Error Message --> 
              %ifvar lastError%
                <tr>
                  <!-- <td class="subheading" colspan=6> -->
                  <script>writeTDspan("row-l", 7);</script>
                    <font color="red">%value lastError encode(html)%</font>
                  </td>
                </tr>
              %endif%
              
              <script>swapRows();</script>
          
          %endloop%
          
          <!-- 
          <tr>
            <td class="subHeading" colspan=6>
              * Connection Aliases that are enabled or Connection Aliases that have one or more Triggers associated with them can not be deleted.
            </td>
          </tr>
          -->

        </table>
      </td>
    </tr>
                
   %onerror%
   
   <tr>
     <td class="message" colspan=2>G%value errorService encode(html)%<br>%value error encode(html)%<br>%value errorMessage encode(html)%<br></td>
   </tr>
                  
   %endinvoke%

  </table>
</body>
</html>