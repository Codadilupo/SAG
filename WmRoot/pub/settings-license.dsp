<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <title>Integration Server Settings</title>
    <link rel="stylesheet" type="text/css" href="webMethods.css">
    <script src="webMethods.js.txt"></script>
  </head>

  <body onLoad="setNavigation('settings-license.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_LicensingScrn');">
      <table width="100%">
        <tr>
          <td class="breadcrumb" colspan="2">Settings &gt; License</td>
        </tr>

        <tr>
          <td colspan="2">
            <ul class="listitems">
              <li class="listitem"><a href="settings-license-edit.dsp">Licensing Details</a></li>
            </ul>
          </td>
        </tr>
        <tr>

        <td>
        <table class="tableView" width="25%">
          <tr>
            <td class="heading" colspan="11">License Information</td>
          </tr>

            <tr>
               <td class="oddcol">Feature Name</td>
               <td class="oddcol">Enabled</td>
            </tr>

            %invoke wm.server.query:getLicenseInfo%
               %loop LicenseInfo%
                  %loop -struct%
                  <tr>
                   <td class="row">%value $key encode(html)%</td>
                 %ifvar #$key equals('true')%
                 <td class="rowdata"><img src="images/green_check.png" border="no">Yes</td>
                 %else%
                 <td class="rowdata"><img src="icons/delete.png" border="no">No</TD>
                 %endif%
                  </tr>
                  %endloop%
               %endloop%
            %endinvoke%
        </td>
        </tr>
        </table>
      </td></tr>
    </table>
  </body>
</html>
