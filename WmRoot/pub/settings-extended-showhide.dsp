<HTML>
<HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


  <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
  <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
  <TITLE>Integration Server Extended Settings</TITLE>

</HEAD>
<BODY onLoad="setNavigation('settings-extended.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_ShowHideKeysScrn');">
 <TABLE width="100%">
    <TR>
      <TD colspan=2 class="breadcrumb">
        Settings &gt;
        Extended &gt;
        Show and Hide Keys </TD>
    </TR>


  <FORM NAME="visible" ACTION="settings-extended.dsp" METHOD="POST">
  <input type="hidden" name="action" value="showhide">
    <TR>
      <TD colspan="2">
        <ul class="listitems">
          <li><a href="settings-extended.dsp">Return to Extended Settings</a></li>
        </UL>
      </TD>
    </TR>
    <TR>
      <TD colspan="2">&nbsp;</TD>
    </TR>
    <TR>
        <TD>
          <TABLE class="tableView">
            <TR>
              <TD class="heading" colspan="2">Key Visibility</TD>
            </TR>

            <TR>
              <TD class="oddcol">Visible</TD>
              <TD class="oddcol-l">Key</TD>
            </TR>

        %invoke wm.server.query:getExtendedSettingsVisible%
        %ifvar settings%
            %loop settings%
            <TR>
              <script>writeTD("row");</script><input type="checkbox" name="%value name encode(htmlattr)%" value="on" %ifvar visible equals('true')%checked%endif%></TD>

              <script>writeTD("row-l");</script>%value name encode(html)%</TD>
              <script>swapRows();</script>
            </TR>
            %endloop%
            <TR><TD class="action" colspan="2">
              <input type="submit" value="Save Changes">
              </TD></TR>
        %endif%
          </TABLE>
          </FORM>
        </TD>
      </TR>
    </TABLE>
%endinvoke%
</BODY>
</HTML>
