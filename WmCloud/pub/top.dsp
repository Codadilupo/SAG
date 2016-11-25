<HTML>

<HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


<LINK REL="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css">

</HEAD>


<script>
function launchHelp() {
            var url="";
            if (parent.menu != null){
			    var helpURLFromPage = parent.menu.document.forms["urlsaver"].helpURL.value;
				var helptopic = helpURLFromPage.lastIndexOf("=");				
				var topic = helpURLFromPage.substring(helptopic+1);
				
				%invoke wm.server.admin:getHelpTopicUrlMappings%			
					%ifvar result%
					%loop result%
						var id = "%value id%";
							if(id==topic)
							{
								url="%value url%";
							}
					%endloop%		
					%endif%
				%endinvoke%
				window.open(url, 'help', "directories=no,location=yes,menubar=yes,scrollbars=yes,status=yes,toolbar=yes,resizable=yes", true);
            }
}



function loadPage(url)
{
	window.location.replace(url);
}


%ifvar message%
  %ifvar norefresh%%else%
    setTimeout("loadPage('top.dsp')", 30000);
        %endif%
%endif%



</script>

   <BODY  class="topbar" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">


<table border=0 cellspacing=0 cellpadding=0 height=47 width=100%>
<tr>
<td>

      <TABLE height=14 width=100% CELLSPACING=0 BORDER=0>

         <TR>

            <TD nowrap class="toptitle" width="100%">

              %value $host%
              ::
              Integration Server
              ::
              webMethods Cloud
            </TD>


         </TR>

      </TABLE>


</td>
</tr>
<tr height=100%>
<td>

<TABLE width=100% height=33 CELLSPACING=0 BORDER=0>

         <TR>
         	 <TD nowrap width=100% class="topmenu"></TD>

                 <TD nowrap valign="bottom" class="topmenu">
                 
	         <A  href='javascript:window.parent.close();'>Close Window</A>
          	 | <A href="#" onclick="launchHelp();return false;" target="_blank">Help</A>
                
            </TD>

         </TR>
         <TR>

         </TR>
      </TABLE>

</td>
</tr>
</table></BODY>
</HTML>


