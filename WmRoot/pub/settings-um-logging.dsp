<HTML>
  <HEAD>

    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">

    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>

    <SCRIPT LANGUAGE="JavaScript">
    var agent = navigator.userAgent.toLowerCase();   
    var ie = (agent.indexOf("msie") != -1);

    var margin = 2;
      
    function writeLogLevelOptions (select)
    {
    	if (! isValidLevel(select)){
    		 select = "Error";
    	}
    	
	    for (i = 7; i > -1; i--) {
 			   if (i != 6 || select == getLogLevelDisplayName(6) ){
		 			   w("<option ");
		 			   
		 			   if (select == getLogLevelDisplayName(i)){
		 			  		w("selected ");
		 			   }
		 			   
		 			   w("value=\"");
		 			   w(getLogLevelDisplayName(i));
		 			   w("\">");
		 			   w(getLogLevelDisplayName(i));
		 			   w("</option>");
 			   }
      }
    }
    
    function isValidLevel(select){
    	
    	for (i=0; i<8 ; i++){
    		if (getLogLevelDisplayName(i) == select) {
    			return true;
    		}
    	}    	
    	return false;
    }
    
    function getLogLevelDisplayName(level){
    	switch (level) {
		    case 0:
		        return "Trace";
		    case 1:
		        return "Debug";
		    case 2:
		        return "Info";
		    case 3:
		        return "Warn";
		    case 4:
		        return "Error";
		    case 5:
		        return "Fatal";
		    case 6:
		        return "All";
		    case 7:
		        return "Off";
			} 
    }
        
    function onEdit ()
    {
      var loc = "settings-um-logging.dsp?doc=edit";
      if(is_csrf_guard_enabled && needToInsertToken) {
        document.location.replace(loc+"&"+_csrfTokenNm_+"="+_csrfTokenVal_);
      } else {
        document.location.replace(loc);
      }
    }


    
    function doSubmit()
    {
 
    }
    

    </SCRIPT>
  </HEAD>

  %ifvar doc equals('edit')%
  <BODY onLoad="setNavigation('settings-um-logging.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_EditUMClientLoggerScrn');">
  %else%
  <BODY onLoad="setNavigation('settings-um-logging.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_UMClientLoggerScrn');">
  %endif%
    <TABLE width="100%">
        <TR>
           <TD class="breadcrumb" colspan=2>
                Settings &gt;
                Logging

                %ifvar doc equals('edit')%
                    &gt; Edit UM Client Logger Details
                %else%
                    &gt; View UM Client Logger Details
                %endif%
           </TD>
        </TR>
 %ifvar action equals('change')%
    %invoke wm.server.admin:setSettings%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
            <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html)%</TD></TR>
        %endif%
    %endinvoke%
%endif%

     %invoke wm.server.query:getSettings%
          
                   <TR>
                    <TD colspan=2>
                      <ul class="listitems">
                        <li class="listitem"><a href="settings-auditing.dsp">Return to Logger List</a></li>
        %ifvar ../doc equals('edit')%
                        <LI><a href="settings-um-logging.dsp">Return to View UM Client Logger Details</a></li>
        %else%
								        <LI><a href="javascript:onEdit();" >Edit UM Client Logger</a></li>
        %endif%
                      </UL>
                    </TD>
                   </TR>
        <TR>
        <TD>

          <TABLE class="tableView">
            <FORM name="logform" action="settings-um-logging.dsp" method="POST">

<TR>
 <TD colspan="3" style="border-collapse: collapse; padding: 0; margin: 0; border: none">
  <TABLE id="Default" style="border-collapse: collapse; padding: 0; margin: 0; border: none">  
            <TR>
               <TD CLASS="heading" colspan="2" width="360">UM Client Logger Configuration<SPAN  style='font-family:monospace;font-size:14;font-style:italic'>&nbsp;</SPAN></TD>

            <script>resetRows();</script>

 <TR> <TD>Log Level</TD><TD>
 	%ifvar ../doc equals('edit')%
 
  	<select name="watt.um.clientLog.level">
	 		<script>writeLogLevelOptions("%value watt.um.clientLog.level encode(html)%");</script>
	 	</select>

  %else%
	 	<script>w("%value watt.um.clientLog.level encode(html)%");</script>
 	%endif%
 	
 	</TD>
</TR>
 <TR> <TD>Log Size</TD><TD>
 	%ifvar ../doc equals('edit')%
 
 		<script>writeEdit("%value ../doc  encode(javascript)%", "watt.um.clientLog.size", %value watt.um.clientLog.size encode(html_javascript)%); </script> MB

  %else%
	 	<script>w(%value watt.um.clientLog.size encode(html)%);</script> MB
 	%endif%
 	</TD> 
 	</TR>
 <TR> <TD>Log Depth</TD><TD>
 	%ifvar ../doc equals('edit')%
 
 		<script>writeEdit("%value ../doc  encode(javascript)%", "watt.um.clientLog.fileDepth", "%value watt.um.clientLog.fileDepth encode(html_javascript)%"); </script>

  %else%
	 	%value watt.um.clientLog.fileDepth encode(html)%
 	%endif%
 	
 	</TD> 
 	</TR>
  </TABLE>
  </TD>
 </TR>

        %ifvar ../doc equals('edit')%
          <TR>
              <TD colspan=3 class="action">
              		<INPUT type="hidden" name="action" value="change">
                  <INPUT onclick="doSubmit()" type="submit" value="Save Changes" name="submit">
              </TD>
          </TR>
         %endif%


 %endinvoke%
          </TABLE> </TD>
      </TR>
    </TABLE>
  </DIV>
</HTML>
