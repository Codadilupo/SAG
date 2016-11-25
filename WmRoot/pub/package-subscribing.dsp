<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Package Exchange</TITLE>
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
  </HEAD>

  <BODY onLoad="setNavigation('package-subscribing.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_SubscribingScrn');">
    <TABLE width=100%>
      <TR>
        <TD class="breadcrumb" colspan=2>
            Packages &gt; Subscribing
        </TD>
      </TR>

%ifvar action%
%switch action%

%case 'svcPull'%
      <tr><td colspan="2">&nbsp;</td></tr>
  %invoke wm.server.replicator:distributeViaSvcPull%
  <TR><td class="message" colspan=2>%value message encode(html)%</td></TR>
  %endinvoke%

%case 'ftpPull'%
      <tr><td colspan="2">&nbsp;</td></tr>
  %invoke wm.server.replicator:pullPackageViaFtp%
  <TR><td class="message" colspan=2>%value message encode(html)%</td></TR>
  %endinvoke%

%case 'updateall'%
  %invoke wm.server.replicator:getRefreshedSubscriptions%
  %endinvoke%

%case 'cancel'%
      <tr><td colspan="2">&nbsp;</td></tr>
  %invoke wm.server.replicator.adminui:subscriptionCancel%
  <TR><td class="message" colspan=2>%value message encode(html)%</td></TR>
  %onerror%
  <TR><td class="message" colspan=2>%value errorOutputs/message encode(html)%</td></TR>
  %endinvoke%

%case 'add'%
      <tr><td colspan="2">&nbsp;</td></tr>
  %invoke wm.server.replicator.adminui:subscriptionAdd%
  <TR><td class="message" colspan=2>%value message encode(html)%</td></TR>
  %onerror%
  <TR><td class="message" colspan=2>%value errorMessage encode(html)%</td></TR>
  %endinvoke%

%case 'edit'%
      <tr><td colspan="2">&nbsp;</td></tr>
  %invoke wm.server.replicator.adminui:subscriptionEdit%
  <TR><td class="message" colspan=2>%value message encode(html)%</td></TR>
  %onerror%
  <TR><td class="message" colspan=2>%value errorMessage encode(html)%</td></TR>
  %endinvoke%

%case 'pull'%
      <tr><td colspan="2">&nbsp;</td></tr>
  %invoke wm.server.replicator:distributeViaSvcPull%
  <TR><td class="message" colspan=2>%value message encode(html)%</td><TR>
  %onerror%
  <TR><td class="message" colspan=2>%value error encode(html)% &nbsp; %value errorMessage encode(html)%</td></TR>
  %endinvoke%

%case%
      <tr><td colspan="2">&nbsp;</td></tr>
    <TR><TD class="message" colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unknown action %value action encode(html)%</TD></TR>

%endswitch%
%endif%

    %invoke wm.server.replicator:getSubscriptions%

        <TR>
            <TD colspan=2>
                <UL class="listitems">
                    %invoke wm.server.query:isRemoteInvokeLicensed%
                %ifvar isLicensed equals('true')%
                   <LI class="listitem"><A HREF="settings-remote.dsp">Remote Server Settings</a></li>
                %endif%
                %endinvoke%
                    
                    <LI class="listitem"><A HREF="package-subscribe.dsp">Subscribe to Remote Package</a></li>
                    <LI class="listitem"><A HREF="package-unsubscribe.dsp">Update and Unsubscribe from Remote Package</a></li>
                    <LI class="listitem"><A HREF="package-subscribing.dsp?action=updateall">Update All Subscription Details</A>
                </UL>
            </TD>
        </TR>

        <TR>
            <TD colspan=2>
               <div class="info">Last updated: %ifvar updateTime%%value updateTime%%else%Unknown%endif%</div>
            </TD>
        </TR>

        <TR>
            <TD valign=top>
                <TABLE class="tableView" width=100%>
                  <TR>
                    <TD class="heading" colspan=6>Subscriptions Initiated Locally</TD>
                  </TR>
                 <TR>
                    <TD class="subheading" colspan=6>These packages can be retrieved locally or delivered by the publisher.</TD>
                </TR>
                  <TR>
                      <TD class="oddcol">Publisher</TD>
                      <TD class="oddcol" nowrap>Package<BR>(Release Name)<BR></TD>
                      <TD class="oddcol">Version</TD>
                      <TD class="oddcol">Build</TD>
                      <TD class="oddcol">Created on</TD>
                      <TD class="oddcol">Retrieve</TD>
                  </TR>
                  <script>resetRows();</script>

            %ifvar publishers%
            %loop publishers%

            <script>
            var publisher_name = "%value name encode(html_javascript)%";
            </script>
                %ifvar subscriptions%
                %loop subscriptions%
                    <TR>
                        <script>writeTDrowspan("rowdata-l",2);</script>
                        <script>document.write(publisher_name)</script></TD>
                        <script>writeTDrowspan("rowdata-l",2);</script>
                            %value source_pkg_name encode(html)%<BR><img src="images/blank.gif" height=3 width=3><BR><span style="font-weight: normal;">%ifvar name%(%value name encode(html)%)%else%(No Releases)%endif%</span></TD>
                        <script>writeTD("rowdata");</script>
                            %ifvar version%%value version encode(html)%%else%-%endif%</TD>
                        <script>writeTD("rowdata");</script>
                            %ifvar build%%value build encode(html)%%else%-%endif%</TD>
                        <script>writeTD("rowdata");</script>
                            %ifvar time%%value time encode(html)%%else%-%endif%</TD>
                        <script>writeTDrowspan("rowdata",2);</script>
                            %ifvar norelease%
                            -
                            %else%
                            <a href="package-subscribing.dsp?action=svcPull&package=%value name encode(url)%&alias=%value ../name encode(url)%">Via Service Invocation</A><BR><img src="images/blank.gif" height=5 width=5><BR>
                            <a href="package-pull-ftp.dsp?package=%value name encode(url)%&alias=%value ../name encode(url)%">Via FTP Download</A>
                            %endif%
                        </TD>
                    </TR>
                    <TR>
                        <script>writeTDspan("rowdata-l",3);</script><span style="font-weight: normal;">
                            %ifvar description equals('')%
                              -
                            %else%
                              %ifvar description%%value description encode(html)%%else%-%endif%
                            %endif%
                        </span></TD>
                    </TR>
                    <script>swapRows();</script>
                %endloop%
                %else%
                    <TR>
                        <script>writeTDrowspan("rowdata-l",2);</script>
                        <script>document.write(publisher_name)</script></TD>
                        <script>writeTDrowspan("rowdata-l",2);</script>
                            No Releases</TD>
                        <script>writeTD("rowdata");</script>
                            -</TD>
                        <script>writeTD("rowdata");</script>
                            -</TD>
                        <script>writeTD("rowdata");</script>
                            -</TD>
                        <script>writeTDrowspan("rowdata",2);</script>
                            -
                        </TD>
                    </TR>
                    <TR>
                        <script>writeTDspan("rowdata-l",3);</script>
                              <span style="font-weight: normal;">-</span>
                        </TD>
                    </TR>
                    <script>swapRows();</script>

                %endif%

                %endloop%
                %else%
                <TR>
                    <td class="evenrowdata-l" colspan="6">
                    No locally initiated subscriptions</td>
                </TR>
                %end if%
            %endinvoke%

                </TABLE>
            </TD>
        </TR>

        <TR>
            <TD valign=top>
                <TABLE  class="tableView" width=100%>
                  <TR>
                    <TD class="heading" colspan=2>Subscriptions Initiated by Remote Publisher</TD>
                  </TR>

                  <TR>
                    <TD class="subheading" colspan=2>These packages can only be delivered by the publisher.</TD>
                  </TR>

            %invoke wm.server.replicator:remoteSubscribedList%
                    <TR>
                        <TD class="oddcol-l">Publisher</TD>
                        <TD class="oddcol-l">Package Name</TD>
                    </TR>
                    <script>resetRows();</script>

            %ifvar subscribed%
            %loop subscribed%

                %ifvar packageList%
                %loop packageList%
                    <TR>
                        <script>writeTD("rowdata-l");</script>
						%value publisher encode(html)%</td>
                        <script>writeTD("rowdata-l");</script>
                        %value encode(html)%</td>
                    </tr>
                    <script>swapRows();</script>
                %endloop%
                %else%
                <tr>
                    <script>writeTD("rowdata-l");</script>
					%value publisher encode(html)%</td>
                    <script>writeTD("rowdata-l");</script><span style="font-weight: normal;">
                        No packages</span></td>
                </tr>
                <script>swapRows();</script>

                %endif%

            %endloop%
            %else%
                    <script>resetRows();</script>
                <TR>
                    <td class="evenrowdata-l" colspan="2">
                    No remotely published subscriptions</td>
                </TR>
            %endif%
            %endinvoke%
                  </TR>
                </TABLE>
            </TD>
        </TR>
    </TABLE>
    </BODY>
</HTML>
