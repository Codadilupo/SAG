<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <title>Integration Server -- Manage Packages</TITLE>
    <link rel="stylesheet" type="text/css" href="webMethods.css">
    <script src="webMethods.js.txt"></script>
  </head>

  <body onLoad="setNavigation('package-list.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_ActivatePkgsScrn');">
    <table width=100%>
      <tr>
        <td class="breadcrumb" colspan=2>
          Packages &gt;
          Management &gt;
          Activate Package
        </td>
      </tr>

      %ifvar action%
        %switch action%
          %case 'activate'%
            %invoke wm.server.packages.adminui:packageActivate%
              %ifvar message%
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
              %endif%
            %endinvoke%
        %endswitch%
      %endif%
  
      <tr>
        <td colspan=2>
          <ul class="listitems">
            <li><a href="package-list.dsp">Return to Package Management</a></li>
          </ul>
        </td>
      </tr>

      %scope param(additional='all')%
      %invoke wm.server.packages:packageList%
        <tr>
            <td>
              <table class="tableView">
                <form name="activate" action="package-manage.dsp" method="POST">

                  <input type="hidden" name="action" value="activate">
                  <tr>
                    <td class="heading" colspan=3>Inactive Packages</td>
                  </tr>
                  %ifvar inactive%
                    <tr>
                      <td class="oddrow">Package name</td>
                      <td class="oddrow-l">
                        <select name="package" width=150> %loop inactive%
                          <option value="%value encode(htmlsttr)%">%value encode(html)%</option> %endloop%
                        </select>
                        <br/>
                      </td>
                    </tr>
                    <tr>
                      <td class="action" colspan=2>
                        <input type="submit" value="Activate Package">
                      </td>
                    </tr>
                  %else%
                    <tr>
                      <td class="oddrow" colspan=3>
                        No inactive packages
                      </td>
                    </tr>
                  %endif%
              </form>
              %endinvoke%
             %endscope%
           </table>
         </td>
       </tr>
    </table>
  </body>
</html>
