<HTML>
   <HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


      <TITLE>Integration Server Thread
      </TITLE>
      <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
      <SCRIPT src="webMethods.js.txt"></SCRIPT>
   </HEAD>
   <BODY onLoad="setNavigation('stats-general.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Server_SingleThreadDumpScrn');">
      <DIV class="position">
         <TABLE width="100%">
            <TR>
               <TD class="breadcrumb">Server &gt; Statistics &gt; System Threads &gt; Single Thread Dump</TD>
            </TR>
            <TR>
              <TD>
                <ul class="listitems">
                  <li><a href="server-threads-new.dsp">Return to System Threads</a></li>
                </UL>
              </TD>
            </TR>
         <TABLE class="tableView" width="100%">
         %invoke wm.server.query:getThreadDumpForThread%
          <TR>
            <TD class="heading">Single Thread Dump</TD>
          </TR>

          <TR>
            <TD class="oddcol-l">
              <TABLE width="100%">
                <TR class="rowdata">
                  <TD><PRE class="fixedwidth">%value threadDump encode(html)%</PRE>
                  </TD>
                </TR>
                </TABLE>
                </TR>
              </TABLE>
         </TABLE>
      </DIV>
   </BODY>
</HTML>