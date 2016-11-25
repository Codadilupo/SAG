<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <title>Package Exchange</title>
    <script src="webMethods.js.txt"></script>
    <link rel="stylesheet" type="text/css" href="webMethods.css">
  </head>

  <body onLoad="setNavigation('package-exchange.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_PublishingPkgsScrn');">
    <table width=100%>
      <tr>
        <td class="breadcrumb" colspan="2"> 
           Packages &gt; Publishing
        </td>
      </tr>

%ifvar action%
%switch action%

%case 'release'%
  %invoke wm.server.replicator:packageRelease%
    %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
      <tr><td class="message" colspan=2>%value message encode(html)%</td></tr>
    %endif%
  %onerror%
    %ifvar errorMessage%
      <tr><td colspan="2">&nbsp;</td></tr>
      <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
    %endif%
  %endinvoke%

%case 'sendrelease'%
  %invoke wm.server.replicator.adminui:packageSendZip%
    %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
      <tr><td class="message" colspan=2>%value message encode(html)%</td></tr>
    %endif%
  %onerror%
    %ifvar errorMessage%
      <tr><td colspan="2">&nbsp;</td></tr>
            <TR><TD class="message" colspan=2>%value errorMessage encode(html)%</TD></TR>
    %endif%
  %endinvoke%

%case 'add'%
  %invoke wm.server.replicator.adminui:subscriberAdd%
    %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
            <TR><TD class="message" colspan=2>%value message encode(html)%</TD></TR>
    %endif%
  %onerror%
    %ifvar errorMessage%
      <tr><td colspan="2">&nbsp;</td></tr>
            <TR><TD class="message" colspan=2>%value errorMessage encode(html)%</TD></TR>
    %endif%
  %endinvoke%

%case 'updateall'%
  %invoke wm.server.replicator:getRefreshedSubscriptions%
  %endinvoke%

%case 'edit'%
  %invoke wm.server.replicator.adminui:subscriberEdit%
    %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
            <TR><TD class="message" colspan=2>%value message encode(html)%</TD></TR>
    %endif%
  %onerror%
    %ifvar errorMessage%
      <tr><td colspan="2">&nbsp;</td></tr>
            <TR><TD class="message" colspan=2>%value errorMessage encode(html)%</TD></TR>
    %endif%
  %endinvoke%

%case%
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td class="message" colspan=2>%value action encode(html)%</td></tr>
%endswitch%

%endif%

    <tr>
      <td colspan=2>
        <ul class="listitems">
          <li class="listitem"><a href="package-release-selection.dsp">Create and Delete Releases</a></li>
          <li class="listitem"><a href="package-add-subscriber.dsp">Add Subscribers</a></li>
          <li class="listitem"><a href="package-remove-subscriber.dsp">Update and Remove Subscribers</a></li>
        </ul>
      </td>
    </tr>

%invoke wm.server.packages:packageList%
    <tr>
      <td valign=top>
        <table class="tableView" width=100%>
          <tr>
            <td class="heading" colspan=2>Available Releases</td>
          </tr>

          <script>swapRows();</script>
          %invoke wm.server.replicator:getDetailedReleasedList%
          <script>
          var Releases = 0;
          </script>

    %ifvar packages%
      %loop packages%
        %ifvar released%
          <script>writeTDrowspan("rowdata-l",2);</script>%value name encode(html)%</TD>
          <td class="oddrow-l" style="padding: 0px;">

          %ifvar subscribers%
            <table class="tableInline" cellspacing=1 >
              <tr>
                <td class="oddrow">Subscribers:</td>
                <td>
                  <table class="tableInline" cellspacing=1 >
                    %loop subscribers%

                      <tr><td class="oddrow-l">
                  %value encode(html)%
                      </td></tr>
                    %endloop%

                    </tr>
                  </table>
                </td>
              </tr>
            </table>

          %else%
            Subscribers: none
          %endif%
          </td>

        </tr>

        <tr>
          <td style="padding: 0px;">
            <table class="tableInline" width=100% cellspacing=1>

              <tr>
                <script>writeTD("col-l");</script><nobr>Release Name</nobr></TD>
                <script>writeTD("col");</script>Version</TD>
                <script>writeTD("col");</script>Build</TD>
                <script>writeTD("col");</script>Created on</TD>
                <script>writeTD("col");</script><nobr>&nbsp;</nobr></TD>
              </tr>
              <script>swapRows();</script>

            %loop released%
              <tr>
                <script>writeTDrowspan("rowdata-l",2);</script>
                        %value name encode(html)%</td>
                <script>writeTD("rowdata");</script>
                        %value version encode(html)%</TD>
                <script>writeTD("rowdata");</script>
                        %value build encode(html)%</TD>
                <script>writeTD("rowdata");</script>
          %value time encode(html)%
                </td>

                <script>writeTDrowspan("rowdata-r",2);</script>
                %ifvar ../subscribers%
                  <a href="package-send-release-select-subscribers.dsp?release=%value name encode(url)%&package=%value ../name encode(url)%"><nobr>Send Release</nobr></a>
                %else%
                  <nobr>No subscribers</nobr>
                %endif%
                </td>

                </tr>
                <tr>
                    <script>writeTDspan("rowdata-l",3);</script>
                        %ifvar description equals('')%
                          -
                        %else%
                          <span style="font-weight: normal;">%value description encode(html)%</span>
                        %endif%
                    </td>
                </tr>

            %endloop%
            </table></td></tr>
            <script>swapRows();</script>
            <script>Releases++;</script>
            %endif%
        %endloop%
%endif%

<script>
if (Releases == 0) {
  document.write("<TR><TD class='oddrow-l' colspan=2>No Releases</TD></TR>");
}
</script>

            %endinvoke%
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>
