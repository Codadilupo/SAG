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
    </head>
    <body onLoad="setNavigation('package-list.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_LockDetailsScrn');">
        <table width="100%">
            <tr>
                <td class="breadcrumb" colspan=2>
                    Packages
                    &gt; Management
                    &gt; Locked Elements
                    &gt; Lock Details</td>
            </tr>

            %ifvar action equals('unlock')%
                %invoke wm.server.ns.adminui:unLockNode%
                        <tr>
                            <td class="message" colspan=2>
                                    %switch LOCK_STATUS%
										%case '2'% %value node_nsName encode(html)% has been unlocked
										%case '3'% %value node_nsName encode(html)% is still locked by %value LOCK_INFO/OWNER encode(html)%
										%case '4'% %value node_nsName encode(html)% is still locked by %value LOCK_INFO/OWNER encode(html)%
                                        %case '5'% Locked by system
                                    %endswitch%
                            </td>
                        </tr>
                %endif%
            %endif%

            %invoke wm.server.ns.adminui:getNodeLockStatus%
            <tr>
                <td colspan=2>
                    <ul class="listitems">
							<li><a href="%value returnURL encode(url)%">Return to %value returnName encode(html)%</a></li>
<!--
                            %switch LOCK_STATUS%
                                %case '2'%
                                %case '3'%
									<li><a href="package-locks-details.dsp?action=unlock&node_nsName=%value node_nsName encode(url)%&returnURL=%value returnURL encode(url)%&returnName=%value returnName encode(url)%">Unlock %value node_nsName encode(html)%</a></li>
                                %case '4'%
									<li><a href="package-locks-details.dsp?action=unlock&node_nsName=%value node_nsName encode(url)%&returnURL=%value returnURL encode(url)%&returnName=%value returnName encode(url)%">Unlock %value node_nsName encode(html)%</a></li>
                                %case '5'%
                            %endswitch%
-->
                    </ul>
                </td>
            </tr>
            <tr>
                <td width=100%>
                        <table class="tableView">
                            <tr>
                                <td class="heading" colspan=2>Lock Info</td>
                            </tr>
                            <tr>
                                <td class="oddrow">Name</td>
								<td class="oddrowdata-l">%value node_nsName encode(html)%</td>
                            </tr>
                            <tr>
                                <td class="evenrow">Lock Status</td>
                                <td class="evenrowdata-l">
                                    %switch LOCK_STATUS%
                                        %case '2'% Unlocked
										%case '3'% Locked by %value LOCK_INFO/OWNER encode(html)%
										%case '4'% Locked by %value LOCK_INFO/OWNER encode(html)%
                                        %case '5'% Locked by system
                                    %endswitch%
                                </td>
                            </tr>
                            %ifvar LOCK_STATUS equals('2')%
                            %else%
                            <tr>
                                <td class="oddrow">Host</td>
								<td class="oddrowdata-l">%value LOCK_INFO/HOST encode(html)%</td>
                            </tr>
                            <tr>
                                <td class="evenrow">Lock Time</td>
                                <td class="evenrowdata-l">%value -localize LOCK_INFO/LOCK_TIME%</td>
                            </tr>
                            <tr>
                                <td class="oddrow">Related Locks</td>
                                <td class="oddrowdata-l">
                                    <script>var rowcount = 0;</script>
									%loop DEPENDENT_LOCKS%%value encode(html)%%loopsep '<br>'%<script>rowcount++;</script>%endloop%
                                    <script>if(rowcount == 0) document.write("No services share this lock");</script>
                                </td>
                            </tr>
                            %endif%
                        </table>

                    %endinvoke%
                </td>
            </tr>
        </table>
    </body>
</html>
