
<HTML>
   <HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


      <TITLE>Integration Server Threads
      </TITLE>
      <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
      <META http-equiv="refresh" content="90">
      <SCRIPT src="webMethods.js.txt"></SCRIPT>
   </HEAD>
   <BODY onLoad="setNavigation('stats-general.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Server_SysThreadsScrn');">
      <DIV class="position">
         <TABLE width="100%">
            <TR>
               <TD class="breadcrumb" colspan=5>Server &gt; Statistics &gt; System Threads</TD>
            </TR>
            <TR>
              <TD colspan=2>
                <ul class="listitems">
                  <li><a href="stats-general.dsp">Return to Server Statistics</a></li>
                  <li><a href="server-thread-dump.dsp">Generate JVM Thread Dump</a></li>
                </UL>
              </TD>
            </TR>
           %invoke wm.server.query:getThreadList%
            <TR>
               <TD>
                  <!-- Thread table -->
                  <TABLE class="tableView" CELLPADDING=2>
                     <TR>
                        <TD class="heading" colspan=5>System Threads</TD>
                     <TR>
                        <TD class="oddcol">Priority</TD>
                        <TD class="oddcol-l">Name</TD>
                        <TD class="oddcol">Alive</TD>
                        <TD class="oddcol">Daemon</TD>
                        <TD class="oddcol">Interrupted</TD>
                        <script>resetRows();</script>
                     </TR> %loop threads%
                     <TR>
                        <script>writeTD('rowdata');</script>%value priority encode(html)%</TD>
                        <script>writeTD('rowdata-l');</script>%value name encode(html)%</TD>
                        <script>writeTD('rowdata');</script>
                            %ifvar alive equals('true')%<IMG SRC="images/green_check.png" height=13 width=13>%else%-%endif%</TD>
                        <script>writeTD('rowdata');</script>
                            %ifvar daemon equals('true')%<IMG SRC="images/green_check.png" height=13 width=13>%else%-%endif%</TD>
                        <script>writeTD('rowdata');</script>
                            %ifvar interrupted equals('true')%<IMG SRC="images/green_check.png" height=13 width=13>%else%-%endif%</TD>
                        <script>swapRows();</script>
                     </TR> %endloop%
                  </TABLE>
                  <!-- Threads table --> %endinvoke%  </TD>
            </TR>
         </TABLE>
      </DIV>
   </BODY>
</HTML>
