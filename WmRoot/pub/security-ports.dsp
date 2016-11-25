<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>

    <TITLE>Integration Server -- Port Access Management</TITLE>
    <SCRIPT SRC="ports.js.txt"></SCRIPT>
    
%invoke wm.server.net.listeners:ListenerAdmin%
<!-- This is a Flow Service -->
  %ifvar configURL%
    <script>
        if(is_csrf_guard_enabled && needToInsertToken) {
			document.location.replace("%value configURL%?listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%&ssl=%value ssl encode(url)%%ifvar listenerType%&listenerType=%value listenerType encode(url)%%endif%%ifvar mode%&mode=%value mode encode(url)%%endif%%ifvar listening%&listening=%value listening encode(url)%%endif%%ifvar portName%&portName=%value portName encode(url)%%endif%&"+_csrfTokenNm_+"="+_csrfTokenVal_);
        } else {
			document.location.replace("%value configURL%?listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%&ssl=%value ssl encode(url)%%ifvar listenerType%&listenerType=%value listenerType encode(url)%%endif%%ifvar mode%&mode=%value mode encode(url)%%endif%%ifvar listening%&listening=%value listening encode(url)%%endif%%ifvar portName%&portName=%value portName encode(url)%%endif%");
        }
    </script>
  %endif%

  %ifvar message%
    <script>
        if(is_csrf_guard_enabled && needToInsertToken) {
			document.location.replace("security-ports.dsp?message2=%value message encode(url)%&"+_csrfTokenNm_+"="+_csrfTokenVal_);
        } else {
			document.location.replace("security-ports.dsp?message2=%value message encode(url)%");
        }
    </script>
  %endif%

<!-- endinvoke for wm.server.net.listeners:ListenerAdmin -->
%endinvoke%

  </HEAD>

  <BODY onLoad="setNavigation('security-ports.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_PortsScrn');">
    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan="2"> Security &gt; Ports  </TD>
      </TR>
        %ifvar message2%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message2 encode(html)%</TD></TR>
        %endif%

      <TR>
        <TD colspan="2">
          <ul class="listitems">
            <li class="listitem"><a href="security-ports-add.dsp">Add Port</a></li>
            <li class="listitem"><a href="security-ports-primary.dsp">Change Primary Port</a></li>
            <li class="listitem"><a href="server-ipaccess.dsp?listenerKey=global">Change Global IP Access Restrictions</a></li>
          </UL>
        </TD>
      </TR>
      <TR>
        <TD>
          <TABLE class="tableView" width="100%">
            %invoke wm.server.ports:listListeners%
            <TR>
              <TD class="heading" colspan="11">Port List</TD>
            </TR>

            <TR>
              <TD class="oddcol">Port</TD>
              <TD class="oddcol">Alias</TD>
              <TD class="oddcol">Protocol</TD>
              <TD class="oddcol">Type</TD>
              <TD class="oddcol">Package</TD>
              <TD class="oddcol">Enabled</TD>
              <TD class="oddcol">Access Mode</TD>
              <TD class="oddcol">IP Access</TD>
              <TD class="oddcol">Advanced</TD>
              <TD class="oddcol">Delete</TD>
              <TD class="oddcol">Description</TD>
            </TR>

            %loop listeners%
            %invoke wm.server.quiesce:isDisableQuiescePort%
            <TR>
              <!-- PORT -->
              <script>writeTD("rowdata");</script>
                %ifvar protocol equals('Email')%
                  <A HREF="javascript:editListener(document.listeners, '%value key encode(javascript)%', '%value user encode(javascript)%@%value host encode(javascript)%' , '%value pkg encode(javascript)%', '%value factoryKey encode(javascript)%', %ifvar primary equals('javascript')%'primary'%else%'%value listening encode(javascript)%'%endif%);">
                    %value encode(html) user%@%value host encode(html)%
                  </A>
                %else%
                  %ifvar listenerType equals('regularinternal')%
                    <A HREF="javascript:editListener(document.listeners, '%value key encode(javascript)%', '%value proxyHost encode(javascript)%:%value port encode(javascript)%', '%value pkg encode(javascript)%', '%value factoryKey encode(javascript)%', %ifvar primary equals('true')%'primary'%else%'%value listening encode(javascript)%'%endif%);">
				    %value proxyHost encode(html)%:%value port encode(html)%
                    </A>
                  %else%
					<A HREF="javascript:editListener(document.listeners, '%value key encode(javascript)%', '%value port encode(javascript)%', '%value pkg encode(javascript)%', '%value factoryKey encode(javascript)%', %ifvar primary equals('true')%'primary'%else% %ifvar isDisableQuiescePort equals('true')%'quiesce'%else%'%value listening encode(javascript)%'%endif%%endif%);">
             %value port encode(html)%
                    </A>
                  %endif%
                %endif%
              </TD>

              <!-- ALIAS -->
              <script>writeTD("rowdata");</script>%value portAlias encode(html)%</TD>

              <!-- PROTOCOL -->
              <script>writeTD("rowdata");</script>
                    		%value protocol encode(html)% </TD>

              <!-- TYPE -->
              <script>writeTD("rowdata");</script>
                          %ifvar listenerType%
                            %switch listenerType%
                              %case 'revinvokeinternal'%
                                Enterprise Gateway Registration
                              %case 'regularinternal'%
                                Registration Internal
                              %case 'revinvoke'%
                               Enterprise Gateway External
                              %case 'Regular'%
                                %ifvar primary equals('true')%
                                  <IMG SRC="images/green_check.png"> Primary
                                %else%
                                  Regular
                                %endif%
                              %case 'Diagnostic'%
                                Diagnostic
                              %case%
                                %value listenerType encode(html)%
                              %endswitch%
                          %else%
                            Regular
                          %endif%</TD>

              <!-- PACKAGE -->
              <script>writeTD("rowdata");</script>%value pkg encode(html)%</TD>

              <!-- ENABLED -->
              <script>writeTD("rowdata");</script>

                %ifvar primary equals('true')%
                  %ifvar listening equals('true')%
                    <img src="images/green_check.png" border="no">Yes
                  %else%
                    &nbsp;&nbsp;&nbsp;No
                  %endif%
                %else%
                  %ifvar listening equals('true')%
                    <a class="imagelink" href="javascript:document.listeners.submit();" onClick="return enableListener(document.listeners, 'disable', '%value key encode(javascript)%', '%value pkg encode(javascript)%', '%ifvar protocol equals('Email')%%value user encode(javascript)%@%value host encode(javascript)%%else%%value key encode(javascript)%%endif%');"><img src="images/green_check.png" border="no">Yes</a>
                  %else%
                    &nbsp;&nbsp;&nbsp;<a href="javascript:document.listeners.submit();" onClick="return enableListener(document.listeners, 'enable', '%value key encode(javascript)%', '%value pkg encode(javascript)%', '%ifvar protocol equals('Email')%%value user encode(javascript)%@%value host encode(javascript)%%else%%value key encode(javascript)%%endif%');">No</a>
                  %endif%
                %endif%
              </TD>

              <!-- ACCESS MODE -->
              <script>writeTD("rowdata");</script>
                %ifvar protocol equals('Email')%
                  <A href="security-ports-editaccess.dsp?port=%value key encode(url)%%ifvar listenerType%&listenerType=%value listenerType encode(url)%%endif%">
                    <!-- Edit -->
                    %ifvar accessMode equals('Allow')%
                        Allow
                    %else%
                        Deny
                    %endif%
                    %ifvar hasAccessList equals('true')% +%endif% 
                  </A>
                %else%
                    %ifvar provider equals('JBoss')%
                      Not Applicable
                    %else%
                      %ifvar provider equals('JBossMQ')%
                        Not Applicable
                      %else%
                        %switch listenerType%
                        %case 'revinvokeinternal'%
                            Not Applicable
                        %case 'revinvoke'%
                            Not Applicable
                        %case%
                          <A href="security-ports-editaccess.dsp?port=%value key encode(url)%%ifvar listenerType%&listenerType=%value listenerType encode(url)%%endif%">
                          <!-- Edit  --> 
                          %ifvar accessMode equals('Allow')%
                            Allow
                          %else%
                            Deny
                          %endif%
                          %ifvar hasAccessList equals('true')% +%endif% 
                        </A>
                        %endswitch%
                      %endif%
                    %endif%
                %endif%
              </TD>           

              <!-- IP ACCESS MODE -->
              <script>writeTD("rowdata");</script>
                    %ifvar provider equals('JBoss')%
                      Not Applicable
                    %else%
                      %ifvar provider equals('JBossMQ')%
                        Not Applicable
                      %else%
                      %ifvar listenerType equals('regularinternal')%
                        Not Applicable
                      %else%
                    %ifvar protocol equals('Email')%
	                  <a href="server-ipaccess.dsp?listenerKey=%value key encode(url)%&pkg=%value pkg encode(url)%">
                       %ifvar ipAccessMode equals('Allow')%
                         Allow
                       %else%
                         Deny
                       %endif%
                        %ifvar hasIPAccessList equals('true')% +%endif% 
                      </a>
                    %else%
	                  <a href="server-ipaccess.dsp?listenerKey=%value key encode(url)%&pkg=%value pkg encode(url)%">
                        %ifvar ipAccessMode equals('Allow')%
                          Allow
                        %else%
                          Deny
                        %endif%
                        %ifvar hasIPAccessList equals('true')% +%endif% 
                      </a>
                    %endif%
                      %endif%
                    %endif%
              </TD>
              
              <!-- ADVANCED -->
              <script>writeTD("rowdata");</script>
                %ifvar primary equals('true')%
                  &nbsp;
                %else%
                  %ifvar isDisableQuiescePort equals('true')%
                     &nbsp;
                  %else%    
                     %switch protocol%
                     %case 'HTTP'%
							<a href="http-advanced.dsp?listenerKey=%value key encode(url)%&pkg=%value pkg encode(url)%&listening=%ifvar listening%%value listening encode(url)%%else%false%endif%">Edit</a>
                     %case 'HTTPS'%
							<a href="http-advanced.dsp?listenerKey=%value key encode(url)%&pkg=%value pkg encode(url)%&listening=%value listening encode(url)%">Edit</a>
                     %case%
                         Not Applicable
                     %endswitch%
                   %endif%
                %endif%
              </TD>

              <!-- DELETE -->
              <script>writeTD("rowdata");</script>
                <a href="javascript:document.listeners.submit();" onClick="return removeListener(document.listeners, '%value key encode(javascript)%', '%value pkg encode(javascript)%', '%ifvar protocol equals('Email')%%value user encode(javascript)%@%value host encode(javascript)%%else%%value key encode(javascript)%%endif%' );"><img src="icons/delete.png" border="no"></A>
              </TD>
              
       <!-- DESCRIPTION -->
              <script>writeTD("rowdata");</script>
                    		%value portDescription encode(html)% </TD>

            </TR>
            <script>swapRows();</script>
            %endinvoke%
            %endloop%

            %endinvoke%
          </TABLE>
        </TD>
      </TR>
    </TABLE>

    <form name="listeners" action="security-ports.dsp" method="POST">
    <input type="hidden" name="listenerKey">
    <input type="hidden" name="portName">
    <input type="hidden" name="factoryKey">
    <input type="hidden" name="operation">
    <input type="hidden" name="mode">
    <input type="hidden" name="listening">
    <input type="hidden" name="pkg">
    </form>

    <form name="addListener" action="security-ports.dsp" method="POST">
    <input type="hidden" name="operation" value="create">
    <input type="hidden" name="action" value="edit">
    </form>

  </BODY>
</HTML>

