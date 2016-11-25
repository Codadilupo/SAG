<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <title>Integration Server -- Manage Packages</title>
    <link rel="stylesheet" type="text/css" href="webMethods.css">
    <script src="webMethods.js.txt"></script>
  </head>

  <body onLoad="setNavigation('package-list.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_InboundRelScrn');">
    <table width=100%>
      <tr>
        <td class="breadcrumb" colspan=2>
          Packages &gt;
          Management &gt;
          Install Inbound Releases
        </td>
      </tr>

      %ifvar action%
        %switch action%
          %case 'install'%
            %invoke wm.server.packages:packageInstall%
              %ifvar message%
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html)%</td></tr>
              %endif%
            %endinvoke%
        %endswitch%
      %endif%

      %scope param(additional='all')%
      %invoke wm.server.packages:packageList%
      <tr>
        <td colspan="2">
        <UL class="listitems"><li><a href="package-list.dsp">Return to Package Management</a></li></UL>
        </td>
      </tr>
      <tr>
        <td>
          <table class="tableView">
            <form name="inbound" action="package-inbound.dsp" method="POST">
            <tr>
            <input type="hidden" name="action" value="install">
              <td class="heading" colspan=2>Inbound Releases</td>
            </tr>
            %ifvar inbound%
              <tr>
                <td class="oddrow">Release file name</td>
                <td class="oddrow-l">
                  <select name="file" width=150> %loop inbound%
                    <option value="%value encode(htmlattr)%">%value encode(html)%</option> %endloop%
                  </select>
                </td>
              </tr>
              <tr>
                <td class="evenrow">Option</td>
                <td class="evenrow-l">
                  <input type="checkbox" name="activateOnInstall" checked>Activate upon installation</input><br/>
                  <input type="checkbox" name="archiveOnInstall" checked>Archive upon installation</input>
                </td>
              </tr>
              <tr>
                <td class="action" colspan=2>
                  <input type="submit" value="Install Release">
                </td>
              </tr>
            %else%
              <tr>
                <td class="oddcol" colspan=2>No inbound releases</td>
              </tr>
            %endif%
            </form>
       </table>
     </td>
   </tr>
   %endinvoke%
   %endscope%
 </table>
</body>
</html>
