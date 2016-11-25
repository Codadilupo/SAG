<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  
    <SCRIPT LANGUAGE="JavaScript">

      function confirmState(form, statemsg, action, logger, loggerDisplay)
      {
         var s1 = "OK to " + statemsg + " the logger: '" + loggerDisplay + "' ?\n\n";
         if ( confirm (s1) ) {
            form.loggerName.value = logger;
            form.action.value = action;
        return true;         
         }
         else {
            return false;
         }
      }
      
      function confirmEnable (logger)
      {
         var s1 = "OK to enable the logger: '" + logger + "' ?\n\n";
         return confirm (s1);
      }

    function updateState(logger, state)
    {
        var newURL = encodeURI("settings-auditing.dsp?message=" + logger + " " + state + ".");
        if(is_csrf_guard_enabled && needToInsertToken) {
            newURL = encodeURI("settings-auditing.dsp?message=" + logger + " " + state + "."+"&"+ _csrfTokenNm_ + "=" + _csrfTokenVal_);
        }
        location.href=newURL;
    }

      </SCRIPT>
      
</head>

<body onLoad="setNavigation('settings-auditing.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_LoggingScrn');">

  <table width="100%">
    <tr><td class="breadcrumb" colspan="2">Settings &gt; Logging</td></tr>

    %ifvar action%
        %switch action%

        %case 'enable'%
              %invoke wm.server.auditing:enableLogger%
                %ifvar message%
                  <!--<SCRIPT>updatefailed();</SCRIPT>-->
                  <tr><td colspan="2">&nbsp;</td></tr>
			      <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %else%
			      <SCRIPT>updateState("%value loggerName encode(javascript)%", "enabled");</SCRIPT>
                %endif%
                %onerror%
                <!--<SCRIPT>updatefailed();</SCRIPT>-->
                <TR><TD colspan="2">&nbsp;</TD></TR>
				<TR><TD class="message" colspan="2">%value errorMessage encode(html)%</TD></TR>
                <TR><TD colspan="2">&nbsp;</TD></TR>                
                %endinvoke%
        %case 'disable'%
              %invoke wm.server.auditing:disableLogger%
                %ifvar message%
                  <!--<SCRIPT>updatefailed();</SCRIPT>-->
                  <tr><td colspan="2">&nbsp;</td></tr>
			      <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %else%
			      <SCRIPT>updateState("%value loggerName encode(javascript)%", "disabled");</SCRIPT>
                %onerror%
                <!--<SCRIPT>updatefailed();</SCRIPT>-->
                <TR><TD colspan="2">&nbsp;</TD></TR>
				<TR><TD class="message" colspan="2">%value errorMessage encode(html)%</TD></TR>
                <TR><TD colspan="2">&nbsp;</TD></TR>                
                %endif%
              %endinvoke%
        %endswitch%    
    %endif action%

    %ifvar message%
      <TR><TD colspan="7">&nbsp;</TD></TR>
	  <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
      <TR><TD colspan="7">&nbsp;</TD></TR>
    %endif%  

    %invoke wm.server.auditing:getAuditLoggers%
    
    %onerror%
      <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
    %endinvoke%

    <tr><td><img src="images/blank.gif" height=20 width=10></td></tr>
    
    <tr>
      <td>
        <table class="tableView" width="100%">

          <tr>
            <td class="heading" colspan=5>Logger List</td>
          </tr>
 
          <!-- Row Heading -->
 
          <tr>
            <td class="oddcol-l">Logger Name</td>
            <td class="oddcol">Enabled</td>
            <td class="oddcol">Mode</td>
            <td class="oddcol">Guaranteed</td>
            <td class="oddcol">Destination</td>
          </tr> 
          
          %loop loggers%
   
          <tr>
          
            <!-- Logger Name -->
            
            <script>writeTD("row-l");</script>

        %switch loggerName% 
        	%case 'Server Logger'%
            	<a href="settings-logging.dsp">%value loggerNameDisplay encode(html)%</a></td>                        	
          %case 'UM Client Logger'%
            	<a href="settings-um-logging.dsp">%value loggerNameDisplay encode(html)%</a></td>
          %case%            
              %ifvar isLicensed equals('true')%
            	<a href="settings-auditing-detail.dsp?loggerNameDisplay=%value loggerNameDisplay encode(url)%&loggerName=%value loggerName encode(url)%">%value loggerNameDisplay encode(html)%</a></td>
              %else%
			    %value loggerNameDisplay encode(html)%
              %endif%
            %endif%
            
            <!-- Enabled -->
            
            <script>writeTD('rowdata');</script>

            %ifvar isLicensed equals('false')%
                <IMG border="0" SRC="images/blank.gif" height=13 width=13>No
            %else%
                %ifvar canDisable equals('true')%

                    %ifvar isEnabled equals('true')%
                        <A class="imagelink" HREF="javascript:document.loggerstate.submit();"
                            ONCLICK="return confirmState(document.loggerstate, 'disable', 'disable', '%value loggerName encode(javascript)%', '%value loggerNameDisplay encode(javascript)%');"><IMG SRC="images/green_check.png" border="0"
                                height=13 width=13>Yes</A>
                    %else%
                        <A class="imagelink" HREF="javascript:document.loggerstate.submit();"
							ONCLICK="return confirmState(document.loggerstate, 'enable', 'enable', '%value loggerName encode(javascript)%', '%value loggerNameDisplay encode(javascript)%');"><IMG border="0" SRC="images/blank.gif" height=13 width=13>No</A> 
                    %endif%</TD>
                %else%

                    %ifvar isEnabled equals('true')%
                        <IMG SRC="images/green_check.png" border="0"
                                height=13 width=13>Yes
                    %else%  
                        <A class="imagelink" HREF="javascript:document.loggerstate.submit();"
                            ONCLICK="return confirmState(document.loggerstate, 'enable', 'enable', '%value loggerName%', '%value loggerNameDisplay%');"><IMG border="0" SRC="images/blank.gif" height=13 width=13>No</A> 
                    %endif%</TD>

                %endif%</TD>

            %endif%
            
            
            <!-- Mode -->
            
            <script>writeTD("rowdata");</script>
                %ifvar isAsynchronous equals('true')%
            Asynchronous
        %else%
            Synchronous
        %endif% 
            </td>

            
            <!-- Guaranteed -->
            
            <script>writeTD("rowdata");</script>
                %ifvar isGuaranteed equals('true')%
            Yes
        %else%
            No
        %endif% 
            </td>
            
            
            <!-- Destination -->
            
            <script>writeTD("rowdata");</script>
                %ifvar isDatabase equals('true')%
            Database
        %else%
            File
        %endif% 
            </td>
            
          </tr>
          

          <script>swapRows();</script>
          %endloop%
          
          %ifvar message%
          <tr><td class="subheading" colspan=5>* %value  message encode(html)%</td></tr>
          %endif%
                  %ifvar isRestartRequired equals('true')%
                <tr>
                  <td class="subheading" colspan=5> 
                    * Settings have been modified. Server restart is required.
                  </td>
                </tr>
              %endif%       

        </table>   
      </td>
    </tr>
    
  </table>
  
  
    <form name="loggerstate" action="settings-auditing.dsp" method="POST">
        <input type="hidden" name="loggerName">
        <input type="hidden" name="action">
    </form>

</body>
</html>
