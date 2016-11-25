<html>
    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta http-equiv="Expires" content="-1">
        <link rel="stylesheet" type="text/css" href="webMethods.css">
        <script src="webMethods.js.txt"></script>
    </head>
    
    <body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" onLoad="setNavigation('quiesce-report.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Server_EnterExitQuiesceModeScrn');">
        %ifvar isQuiesceMode equals('true')%
            %invoke wm.server.quiesce:setQuiesceMode%
            %endinvoke%
        %else%
            %invoke wm.server.quiesce:setActiveMode%
            %endinvoke%
        %endif%
        <table width="100%">
            <tr>
                <td class="breadcrumb" colspan="2"> Server &gt; Quiesce</td>
            </tr>
            %ifvar message%
                %ifvar message equals('INVALID')%
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr><td class="message" colspan="2">Unable to quiesce Integration Server. All of the following conditions must be satisfied to switch Integration Server in quiesce mode
                        <ul>
                            <li>Quiesce port should be set.</li> 
                            <li>Quiesce port should be enabled.</li>
                            <li>Quiesce port should not be suspended.</li> 
                            <li>Quiesce port should have allow access mode.</li>
                        </ul>
                     </td></tr>
                %else%
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
            %endif%
            <tr>
                <td>
                    <table class="tableView" width="75%">
                        <tr>
                            <td class="heading" colspan="11">Quiesce Report</td>
                        </tr>

                        <tr>
                          <td class="oddcol-l">Type</td>
                          <td class="oddcol-l">Status</td>
                          <td class="oddcol-l">Message</td>
                        </TR>
                        %loop report%
                        <tr>
                            <script>writeTD("rowdata");</script><p align="left">%value type encode(html)% </p> </td>
                            <script>writeTD("rowdata");</script><p align="left">%value status encode(html)% </p></td>
                            <script>writeTD("rowdata");</script><p align="left">%value message encode(html)%</p></td>            
                        </tr>
                        %endloop%
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
