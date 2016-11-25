<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Package Exchange</TITLE>
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
  </HEAD>

  <BODY onLoad="setNavigation('package-subscribing.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_FtpPullScrn');">
    <TABLE width=100%>
      <TR>
        <TD class="breadcrumb" colspan=2>
            Packages &gt;
            Subscribing &gt;
            FTP Pull
        </TD>
      </TR>
      <TR>
        <TD>
          &nbsp;
        </TD>
      </TR>
      <TR>
        <TD>
          <TABLE class="tableView">
            <FORM NAME="ftpform" action="package-subscribing.dsp" method="POST">
            <INPUT type="hidden" name="action" value="ftpPull">
            <INPUT type="hidden" name="pkgname" value="%value package encode(htmlattr)%">
            <INPUT type="hidden" name="publisher" value="%value alias encode(htmlattr)%">

            <TR>
              <TD class="heading" colspan=2>FTP Pull Information</TD>
            </TR>
            <TR>
              <TD class="oddrow">Release Name</TD>
              <TD class="oddrow-l"><b>%value package encode(html)%</b></TD>
            </TR>

            <TR>
              <TD class="evenrow">Remote Server Alias</TD>
              <TD class="evenrow-l"><b>%value alias encode(html)%</b></TD>
            </TR>

            <TR>
              <TD class="oddrow">Remote Server FTP Port</TD>
              <TD class="oddrow-l">
                <INPUT NAME="port"></INPUT>
              </TD>
            </TR>

            <TR>
              <TD class="evenrow">Remote User Name</TD>
              <TD class="evenrow-l">
                <INPUT NAME="user"></INPUT>
              </TD>
            </TR>

            <TR>
              <TD class="oddrow">Remote Password</TD>
              <TD class="oddrow-l">
                <INPUT NAME="pass" TYPE="password" autocomplete="off"></INPUT>
              </TD>
            </TR>
            <TR>
              <TD class="action" colspan=2>
                <INPUT type="submit" value="FTP Retrieve">
              </TD>
            </TR>
            </FORM>
          </TABLE>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
