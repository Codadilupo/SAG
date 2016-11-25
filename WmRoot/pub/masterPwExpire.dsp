<HTML>
  <HEAD>
    <TITLE>Integration Server -- Outbound Password Management</TITLE>

    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV='Content-Type' CONTENT='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css"></LINK>
    <SCRIPT type="text/javascript" SRC="/WmRoot/webMethods.js.txt"></SCRIPT>

    <SCRIPT type="text/javascript">
      function changeProps()
      {
        var newInt = document.propsForm.newInterval.value;
        document.propsForm.action.value = "updateInterval";
        document.propsForm.expireInterval.value = newInt;
        document.propsForm.submit();
        return true;
      }
    </SCRIPT>

  </HEAD>

  <BODY onLoad="setNavigation('masterPwExpire.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_UpdateExpirationScrn');">

    <FORM method="post" name="propsForm" action="security-outboundpw.dsp">

      <TABLE width="100%">

        <INPUT type="hidden" name="action" value="%value action encode(htmlattr)%"/>
        <INPUT type="hidden" name="expireInterval" value="%value expireInterval encode(htmlattr)%"/>
        <INPUT type="hidden" name="interval" value=""/>

        <TR>
          <TD class="breadcrumb" colspan="2"> Security &gt; Outbound Passwords &gt; Update Expiration Interval</TD>
        </TR>

        %invoke wm.server.internalOutboundPasswords:getMasterPasswordProperties%
          %rename expireInterval interval -copy%
          %onerror%
            %ifvar errorMessage%
              <TR><TD colspan="2">&nbsp;</TD></TR>
              <TR><TD class="message" colspan=2>%value errorMessage encode(html)%</TD></TR>
            %endif%
        %endinvoke%

        %invoke wm.server.internalOutboundPasswords:getMasterExpireMessage%
          %ifvar expireMessage%
            <TR><TD colspan="2">&nbsp;</TD></TR>
            <TR><TD class="message" colspan="2">%value expireMessage encode(html)%</TD></TR>
          %endif%
        %endinvoke%

        %ifvar message%
          <TR><TD colspan="2">&nbsp;</TD></TR>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%

        <TR>
          <TD colspan="2">
            <UL class="listitems">
              <li><a href="security-outboundpw.dsp">Return to Outbound Passwords</a></li>
            </UL>
          </TD
        </TR>

        <TR>
          <TD>
            <TABLE class="tableView" width="60%">
              <TR>
                <TD class="heading" colspan=2>Master Password Expiration Interval</TD>
              </TR>
              <script>resetRows();</script>
              <TR>
                <TD class="evenrow">Expiration Interval (in days)</TD>
                <TD class="evenrow-l">
                  <INPUT type="text" name="newInterval" SIZE="4"
                         value="%value interval encode(htmlattr)%"/></TD>
              </TR>
              <TR>
                <TD class="action" colspan=2>
                  <INPUT class="data" type="submit" value="Save Changes"
                         name="ok" onClick="return changeProps();"/>
                </TD>
              </TR>
            </TABLE>
          </TD>
        </TR>

      </TABLE>
    </FORM>

  </BODY>

</HTML>

