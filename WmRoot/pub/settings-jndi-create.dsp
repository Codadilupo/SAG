<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" CONTENT="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  
  %invoke wm.server.jndi:getJNDIAliasTemplates%
  
  <script language ="javascript">
    
    function setJNDIFields(selected) {
    
      %ifvar templates%
        %loop templates%
          if (selected.value == "%value name encode(javascript)%") {
            document.jndiForm.initialContextFactory.value = "%value context encode(javascript)%";
            document.jndiForm.providerURL.value = "%value url encode(javascript)%";
            document.jndiForm.securityPrincipal.value = '';
            document.jndiForm.securityCredentials.value = '';
            document.jndiForm.otherProps.value = "%value otherProps encode(javascript)%";
          }
        %endloop%
      %endif%
      
    }
    
    
    
    function validateForm(obj) {

      if (obj.jndiAliasName.value == "") {
        alert("JNDI Alias Name must be specified");
        return false;
      }
      
      if (obj.description.value == "") {
        alert("Description must be specified");
        return false;
      }
      
      if (obj.initialContextFactory.value == "") {
        alert("Initial Context Factory must be specified");
        return false;
      }
      
      if (obj.providerURL.value == "") {
        alert("Provider URL must be specified");
        return false;
      }

      return true;
    }
        
  </script>
  
  
</head>

<body onLoad="setNavigation('settings-broker.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_Msging_CreateJNDIaliasScrn');">

  <table width="100%">
    <tr>
      <td class="breadcrumb" colspan="2">Settings &gt; Messaging &gt; JNDI Settings &gt; JNDI Provider Alias &gt; Create</td>
    </tr>

    <tr>
      <td colspan="2">
        <ul class="listitems">
          <li class="listitem"><a href="settings-jndi.dsp">Return to JNDI Settings</a></li>
        </ul>
      </td>
    </tr>
    
    <form name="jndiForm" action="settings-jndi.dsp" METHOD="POST">

    <tr>
      <td>
        <table class="tableView" width="100%"> 
          <tr>
            <td class="heading" colspan=2>JNDI Provider Alias</td>
          </tr>
 
          <tr>
            <td class="oddrow-l">JNDI Alias Name</td>
            <td class="oddrowdata-l"><INPUT NAME="jndiAliasName" size="70"></td>
          </tr>
          <tr>
            <td class="evenrow-l">Description</td>
            <td class="evenrowdata-l"><INPUT NAME="description" size="70"></td>
          </tr>
          <tr>
            <td class="oddrow-l" nowrap>Predefined JNDI Templates</td>
            <td class="oddrowdata-l">
          <select name="useTemplate" onChange="setJNDIFields(this.form.useTemplate);">
            <option value="blank"></option>
            %ifvar templates%
              %loop templates%
	            <option value="%value name encode(htmlattr)%">%value name encode(html)%</option>
              %endloop%
            %endif%
          </select>
            </td>
          </tr>
          
          <tr>
            <td class="evenrow-l">Initial Context Factory</td>
            <td class="evenrowdata-l"><INPUT NAME="initialContextFactory" size="70"></td>
          </tr> 
          
          <tr>
            <td class="oddrow-l">Provider URL</td>
            <td class="oddrowdata-l"><INPUT NAME="providerURL" size="70"></td>
          </tr>
          
          <tr>
            <td class="evenrow-l">Provider URL Failover List</td>
            <td class="evenrowdata-l"><textarea name="providerURLFailoverList" rows="3" cols="70"></textarea></td>
          </tr> 
          
          <tr>
            <td class="oddrow-l">Security Principal</td>
            <td class="oddrowdata-l"><INPUT NAME="securityPrincipal" size="70"></td>
          </tr> 
          
          <tr>
            <td class="evenrow-l">Security Credentials</td>
            <td class="evenrowdata-l"><INPUT NAME="securityCredentials" size="70" type="password" autocomplete="off"/></td>
          </tr> 
          
          <tr>
            <td class="oddrow-l">Other Properties</td>
            <td class="oddrowdata-l"><textarea name="otherProps" rows="3" cols="70"></textarea></td>
          </tr> 
            
          %onerror%
            <tr>
              <td class="message" colspan=2>%value errorMessage encode(html)%<br>%value error encode(html)% at %value errorService encode(html)%<br></td>
            </tr>
          %endinvoke%
          
        </table>   
        
        <!-- Submit Button -->
        
        <TABLE class="tableView" width="100%">
          <tr>
              <td class="action" colspan=2>
                
                <input name="action" type="hidden" value="create">
                <input name="isNew" type="hidden" value="true">
                <input type="submit" value="Save Changes" onClick="javascript:return validateForm(this.form)">
                
                <!-- <A HREF="settings-jms-detail.dsp?aliasName=%value aliasName encode(url)%"> -->
                
              </td>
            </tr>
        
        </table>
      </td>
    </tr>
    
    </form>
    
  </table>
</body>
</html>
