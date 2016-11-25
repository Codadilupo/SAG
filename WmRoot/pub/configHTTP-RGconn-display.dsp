<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    <TITLE>Integration Server -- Port Management</TITLE>

  </HEAD>


    <base target="_self">
    <style>
      .listbox  { width: 100%; }
    </style>

  <body onload="setupKeystoreData(document.properties1);setupKeystoreData(document.properties2);setNavigation('security-ports.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_EnterpriseGatewayConnectionsScrn');">
    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan=3>
          Security &gt;
          Ports &gt;
          Enterprise Gateway Registration Port Connections
      </TR>


      <TR>
        <TD colspan="2">
          <UL>
            <li><a href="security-ports.dsp">Return to Ports</a></li>
          </UL>
        </TD>
      </TR>

      <TR>
        <TD>
            <TABLE border="0" cellpadding="0" cellspacing="0" width="50%">
            %invoke wm.server.ports:listRGConnections%
            <tr>
			    <td class="heading">Enterprise Gateway Registration Port Connections: %value internalPort encode(html)%</td>
                <td class="heading"></td>
                <td class="heading"></td>
            </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="50%">
            <tr>
              <TD width="50px" class="oddcol">Host</td>
              <TD width="20px" class="oddcol">Port</td>
              <TD width="20px" class="oddcol">Connected (%value connections encode(html)%)</td>
            </tr>
            %loop socketDetails%
                <tr>
              		<script>writeTD("rowdata");</script>%value DestinationAddress encode(html)%</td>
					<script>writeTD("rowdata");</script>%value DestinationPort encode(html)%</td>
					<script>writeTD("rowdata");</script>%value Connected encode(html)%</td>
                </tr>
                <script>swapRows();</script>
            %endloop%
            %endinvoke%
     </table>
     </TD>
     </TABLE>
  </body>
</html>
