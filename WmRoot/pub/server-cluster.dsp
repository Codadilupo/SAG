%ifvar action equals('killAll')%  
	%invoke wm.server.admin:killAllExceptYourSession%
	%endinvoke%  
%endif%
<HTML>
  <HEAD>
    <META http-equiv="refresh" content="90">
    <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Settings Cluster</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT src="webMethods.js.txt"></SCRIPT>
    <SCRIPT LANGUAGE="JavaScript">
     function confirmDelete()
      {
       return confirm("All sessions except this session will be terminated. Do you want to continue?"); 
      }
      function confirmSession() 
      {
		%invoke wm.server.query:getCurrentSession%
		currentSession = "%value currentSessionID%";
		%endinvoke%
			
		return currentSession;
	  }
    </SCRIPT>
 </HEAD>
 <BODY onLoad="setNavigation('stats-general.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Server_TotalSessionsScrn');">
         <TABLE width=100%>
            <TR>
               <TD class="breadcrumb" colspan=2>
                Server &gt;
                Statistics &gt;
                Sessions</TD>
            </TR>
             <TR>
              <TD colspan=2>
                <ul class="listitems">
%ifvar equals('shutdown') returnto%
<li><a href="server-shutdown.dsp">Return to Shut Down and Restart</a></li>
%else%
                  <li><a href="stats-general.dsp">Return to Server Statistics</a></li>
                  <li><a href="server-cluster.dsp?action=killAll" onclick="return confirmDelete();">Kill All Except Your Session</a></li>
                  
%endif%
                </UL>
              </TD>
            </TR>

            <TR>
               <TD>
                  <TABLE class="tableView" width=100%>
                     %ifvar action equals('kill')%  %invoke wm.server.admin:killSession%
                        %ifvar message%
                            <script>
                                 if(is_csrf_guard_enabled && needToInsertToken) {
                                    parent.topmenu.location.replace("top.dsp?message=%value -urlencode message%&"+ _csrfTokenNm_ + "=" + _csrfTokenVal_);
                                 } else {
                                    message = "%value message%";
									message=message.replace("Deleted session ","").trim();
									confirmSession();
                                    parent.topmenu.location.replace("top.dsp?message=%value -urlencode message%");
                                 }
                            </script>    
                        %endif%
                     %endinvoke%  %endif%

                     %invoke wm.server.query:getSessionList%
                     <TR>
                        <TD class="heading" colspan=8>Current Sessions</TD>
                     <TR>
                        <TD class="oddcol-l">User</td>
                        <TD class="oddcol">From</td>
                        <TD class="oddcol">Stateful</td>
                        <TD class="oddcol">Requests</td>
                        <TD class="oddcol-r" nowrap>Connect Time</td>
                        <TD class="oddcol-r" nowrap>Last Request</td>
                        <TD class="oddcol-r" nowrap>Session Expires</td>
                        <TD class="oddcol">Kill</td>
                        <script>resetRows();</script>
                     </TR> %loop sessions%
                     <TR>
                        <script>writeTD('rowdata-l');</script>%value user%
                          %ifvar $index equals('0')%
                         <IMG src="icons/current_user.png" border=0>
						 %endif%</TD>
                        <script>writeTD('rowdata');</script>%value name%</TD>
                        <script>writeTD('rowdata');</script>%value stateful%</TD>
                        <script>writeTD('rowdata');</script>%value calls%</TD>
                        <script>writeTD('rowdata-r');</script>%value time% sec</TD>
                        <script>writeTD('rowdata-r');</script>%value last% sec</TD>
                        <script>writeTD('rowdata-r');</script><script>writeExpiredValue("%value expires%")</script></TD>
                        <script>writeTD('rowdata');</script>
                           %ifvar expires equals('never')%
                               <IMG src="icons/delete_disabled.png" border=0>
                           %else%
                               %ifvar expires equals('temporary')%
                                   <IMG src="icons/delete_disabled.png" border=0>
                               %else%
                                   <A class="imagelink" href="server-cluster.dsp?action=kill&sessionID=%value ssnid -urlencode%">
                                   <IMG src="icons/delete.png" border=0></A>
                               %endif%
                           %endif%
                        </TD>   
                     </TR> <script>swapRows();</script>%endloop%
                  </TABLE> %endinvoke%  </TD>
            </TR>
         </TABLE>
          <script>
		 if (currentSession != "" && currentSession == message) {
					parent.document.getElementById('body').contentWindow.location.reload(true);
					parent.document.getElementById('top').contentWindow.location.reload(true);
		 }
		 </script>
   </BODY>
</HTML>
