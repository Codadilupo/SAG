<HTML>
    <HEAD>
      <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
      <META HTTP-EQUIV="Expires" CONTENT="-1">
      <TITLE>Package Exchange</TITLE>
      <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
      <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    </HEAD>

    <BODY onLoad="setNavigation('package-exchange.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_EditSubsScrn');">

    <SCRIPT LANGUAGE="JavaScript">

      function onSave()
      {
      var host = document.subedit.host.value;
      var port = document.subedit.port.value;
      var username = document.subedit.remoteuser.value;
      var password = document.subedit.remotepass.value;

      if ( host == null || host == "" ) {
        alert("Host Name is required.");
        return false;
      } else if( port == null || port == "" ) {
        alert("Host Port is required.");
        return false;
      } else if( username == null || username == "" ) {
        alert("Remote User Name is required.");
        return false;
      } else if( password == null || password == "" ) {
        alert("Remote Password is required.");
        return false;
      } else {
        return true;
      }

      }
    </SCRIPT>

    %invoke wm.server.replicator:getSubscriberValues%

    <TABLE width=100%>
        <TR>
            <TD class="breadcrumb" colspan="3">
                Packages &gt;
                Publishing &gt;
                Edit Subscriber
            </TD>
        </TR>
        <TR>
          <TD colspan=2>
            <UL class="listitems">
              <li><a href="package-exchange.dsp">Return to Publishing</a></li>
            </UL>
          </TD>
        </TR>
        <TR>
            <TD valign=top>
                <TABLE class="tableView">
                <TR>
                    <TD class="heading" colspan="2">Edit Subscriber</TD>
                </TR>
      <FORM NAME="subedit" ACTION="package-exchange.dsp" METHOD="POST">
      <INPUT TYPE="hidden" NAME="action" VALUE="edit">
      <INPUT TYPE="hidden" NAME="oldname", VALUE="%value pkgname encode(htmlattr)%">
      <INPUT TYPE="hidden" NAME="oldhost", VALUE="%value host encode(htmlattr)%">
      <INPUT TYPE="hidden" NAME="oldport", VALUE="%value port encode(htmlattr)%">
                <TR>
                  <TD class="evenrow">Packages</TD>
                  <TD class="evenrow-l">
                    <SELECT name="package">
          %invoke wm.server.packages:packageList%
                    %loop packages%
                    	<option value="%value name encode(htmlattr)%" %ifvar name vequals(../package)% selected %endif% >%value name encode(html)%</option>
                    %endloop%
                    </SELECT>
                  </TD>
                </TR>
                <TR>
                  <TD class="oddrow">Host Name</TD>
                  <TD class="oddrow-l"><INPUT NAME="host" VALUE="%value host encode(htmlattr)%"></INPUT></td>
                </TR>
                <TR>
                  <TD class="evenrow" class="evenrow">Host Port</TD>
                  <TD class="evenrow-l"><INPUT NAME="port" VALUE="%value port encode(htmlattr)%"></INPUT></TD>
                </TR>
                <TR>
                  <TD class="oddrow">Transport</TD>
                  <TD class="oddrow-l">
                    <SELECT NAME="ssl">
                    <OPTION  value="HTTP" %ifvar ssl equals('no')% selected %endif% >HTTP</OPTION>
                    <OPTION  value="HTTPS"%ifvar ssl equals('yes')% selected %endif%>HTTPS</OPTION>
                    </SELECT>
                  </TD>
                </TR>
                <TR>
                  <TD class="evenrow">Remote User Name</TD>
                  <TD class="evenrow-l"><INPUT NAME="remoteuser" VALUE="%value repuser encode(htmlattr)%"></INPUT></td>
                </TR>
                <TR>
                  <TD class="oddrow">Remote Password</TD>
                  <TD class="oddrow-l"><INPUT TYPE="password" NAME="remotepass" autocomplete="off" VALUE="%value reppass encode(htmlattr)%"></INPUT></td>
                </TR>
                <TR>
                  <TD class="evenrow">Notification Email</TD>
                  <TD class="evenrow-l">
                    <INPUT NAME="email" VALUE="%value email encode(htmlattr)%"></INPUT>
                  </TD>
                </TR>
                <TR>
                  <TD colspan=2 class="action">
                    <INPUT type="submit" name="submit" onclick="return onSave(); return false;" value="Submit Changes">
                  </TD>
                </TR>
                </TABLE>
             </TD>
         </TR>
    </TABLE>

    %endinvoke%

    </BODY>
</HTML>
