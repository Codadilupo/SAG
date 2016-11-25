<html>
    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta http-equiv="Expires" content="-1">
        <title>
            Integration Server Packages
        </title>
        <link rel="stylesheet" type="text/css" href="webMethods.css">
        <script src="webMethods.js.txt"></script>
        <script Language="JavaScript">
        function writeTag(val)
        {
        var str="Locked Elements";
        var aStr="<a href=\"package-locks-details.dsp?node_nsName="+val+"&returnURL=package-locks.dsp&returnName=";
      w(aStr);
      w(encodeURI(str));
      w("\">");
    }
  </script>
    </head>

     %ifvar mode equals('edit')%
         <body onLoad="setNavigation('package-locks.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_UnlockElemensScrn');">
     %else%
         <body onLoad="setNavigation('package-locks.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_VwLockedScrn');">
     %endif%

        <table width="100%">
            <tr>
                <td class="breadcrumb" colspan=2>
                    Packages
                    &gt; Management &gt;
                    %ifvar mode equals('edit')%
                        Unlock Elements
                    %else%
                        Locked Elements
                    %endif%
                </td>
            </tr>
            %ifvar action equals('sync')%
                %invoke wm.server.ns.adminui:syncToNamespace%
                <tr><td colspan="2">&nbsp;</td></tr>
                  <TR><TD class="message" colspan=2>%value message encode(html)%</TD></TR>
                  %endinvoke%
            %endif%

            %ifvar action equals('unlock')%
                %invoke wm.server.ns.adminui:unLockMultipleNodes%
      <tr><td colspan="2">&nbsp;</td></tr>
                        <tr>
                            <td class="message" colspan=2>
								%value message encode(html)%
                            </td>
                        </tr>
                %endinvoke%
            %endif action%

            <tr>
                <td colspan=2>
                    <ul class="listitems">
                        %ifvar mode equals('edit')%
							<li><a href="package-locks.dsp%ifvar username%?username=%value username encode(url)%%endif%">Return to Locked Elements</a></li>
                        %else%
                            <li><a href="package-list.dsp">Return to Package Management</a></li>
							<li><a href="package-locks.dsp?mode=edit%ifvar username%&username=%value username encode(url)%%endif%">Unlock Elements</a></li>
                            <li><a href="package-locks.dsp?action=sync">Sync to Name Space</a></li>
                        %endif%
                    </ul>
                </td>
            </tr>
            <tr>
                <td width=100%>
                    %invoke wm.server.ns.adminui:getLockedNodesForUser%
                        <table class="tableView" width=100%>
                            <tr>
                                <td class="heading" colspan=3>Locked by System</td>
                            </tr>
                            <tr>
                                <td class="oddcol-l">Locked Element</td>
                                <td class="oddcol-l">Host</td>
                                <td class="oddcol-l">Date Locked</td>
                            </tr>
                            <script>resetRows(); var rowcount=0;</script>

                            %loop -struct SYSTEM_LOCKS%
                            <tr>
                                <script>writeTD("rowdata-l");</script>
                                    %ifvar ../mode equals('edit')%
										%value $key encode(html)%
                                    %else%
										<script>writeTag("%value $key encode(javascript)%");</script>%value $key encode(html)%</a>
                                    %endif%
                                </td>
                                <script>writeTD("rowdata-l");</script>
									<span style="font-weight: normal;">%value HOST encode(html)%</span>
                                </td>
                                <script>writeTD("rowdata-l");</script>
                                    <span style="font-weight: normal;">%value -localize LOCK_TIME%</span>
                                </td>

                            </tr>
                            <script>swapRows(); rowcount++; </script>
                            %endloop%

                            <script>
                                if(rowcount == 0)
                                {
                                    document.write("<tr><td class=evenrow-l colspan=3>No Elements locked by System</td></tr>");
                                }
                            </script>

                        </table>

                    %endinvoke%
                    <br>
                    %invoke wm.server.ns.adminui:getLockedNodesForUser%
                        <table class="tableView" width=100%>
                            <tr>
								<td class="heading" colspan="%ifvar ../mode equals('edit')%4%else%3%endif%">Locked by Current User (%value username encode(html)%)</td>
                            </tr>
                            <tr>
                                %ifvar ../mode equals('edit')%
                                    <td class="oddcol">Unlock</td>
                                %endif%
                                <td class="oddcol-l">Locked Element</td>
                                <td class="oddcol-l">Host</td>
                                <td class="oddcol-l">Date Locked</td>
                            </tr>
                            <script>resetRows(); var rowcount=0;</script>

                            %ifvar ../mode equals('edit')%
                                <form method="POST" name=unlockNodes action="package-locks.dsp">
                                <input type="hidden" name="action" value="unlock">
                            %endif%

                            %loop -struct USER_LOCKS%
                            <tr>
                                %ifvar ../mode equals('edit')%
                                    <script>writeTD("row");</script>
										<input type="checkbox" name="unlock" value="%value $key encode(htmlattr)%">
                                    </td>
                                %endif%
                                <script>writeTD("rowdata-l");</script>
                                    %ifvar ../mode equals('edit')%
										%value $key encode(html)%
                                    %else%
										<script>writeTag("%value $key encode(javascript)%");</script>%value $key encode(html)%</a>
                                    %endif%
                                </td>
                                <script>writeTD("rowdata-l");</script>
									%value HOST encode(html)%
                                </td>

                                <script>writeTD("rowdata-l");</script>
                                    %value -localize LOCK_TIME%
                                </td>
                            </tr>
                            <script>swapRows(); rowcount++; </script>
                            %endloop%

                            <script>
                                if(rowcount == 0)
									document.write("<tr><td class='evenrow-l' colspan='%ifvar ../mode equals('edit')%4%else%3%endif%'>No Elements locked by %value username encode(html_javascript)%</td></tr>");
                            </script>

                        </table>
                        <br>

                        <table class="tableView" width=100%>
                            <tr>
                                <td class="heading" colspan="%ifvar ../mode equals('edit')%5%else%4%endif%">Locked by Other Users</td>
                            </tr>
                            <tr>
                                %ifvar ../mode equals('edit')%
                                    <td class="oddcol">Unlock</td>
                                %endif%
                                <td class="oddcol-l">Locked Element</td>
                                <td class="oddcol">User</td>
                                <td class="oddcol-l">Host</td>
                                <td class="oddcol-l">Date Locked</td>
                            </tr>
                            <script>resetRows(); var rowcount=0;</script>

                            %ifvar ../mode equals('edit')%
                                <form method="POST" name=unlockNodes action="package-locks.dsp">
                                <input type="hidden" name="action" value="unlock">
                            %endif%

                            %loop -struct OTHER_LOCKS%
                            <tr>
                                %ifvar ../mode equals('edit')%
                                    <script>writeTD("row");</script>
										<input type="checkbox" name="unlock" value="%value $key encode(htmlattr)%">
                                    </td>
                                %endif%
                                <script>writeTD("rowdata-l");</script>
                                    %ifvar ../mode equals('edit')%
										%value $key encode(html)%
                                    %else%
										<script>writeTag("%value $key encode(javascript)%");</script>%value $key encode(html)%</a>
                                    %endif%
                                </td>
                                <script>writeTD("rowdata");</script>
									%value OWNER encode(html)%
									%loop DEPENDENT_LOCKS%%value encode(html)%%loopsep '<br>'%%endloop%


                                </td>
                                <script>writeTD("rowdata-l");</script>
									%value HOST encode(html)%
                                </td>
                                <script>writeTD("rowdata-l");</script>
                                    %value -localize LOCK_TIME%
                                </td>

                            </tr>
                            <script>swapRows(); rowcount++; </script>
                            %endloop%

                            <script>
                                if(rowcount == 0)
                                    document.write("<tr><td class='evenrow-l' colspan='%ifvar ../mode equals('edit')%5%else%4%endif%'>No Elements locked by other users</td></tr>");
                            </script>

                            %ifvar ../mode equals('edit')%
                                <tr>
                                    <td class=action colspan=5>
                                        <input class="button2" type=submit name=submit value="Unlock Selected Elements">
                                    </td>
                                </tr>
                                </form>
                            %endif%

                        </table>


                    %endinvoke%
                </td>
            </tr>
        </table>
    </body>
</html>
