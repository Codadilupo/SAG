<html>
    <script Language="JavaScript">
    </script>

    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <title>Integration Server Settings</title>
        <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
        <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    </head>

   <BODY onLoad="setNavigation('xamanualrecovery.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_XAManualRecoveryScrn');">
        <table width="100%">
        
            <!-- ------------------------- -->
            <!-- delete xid                -->
            <!-- ------------------------- -->
            %ifvar deleteXid equals('true')%
                %invoke wm.server.xarecovery:eraseTransaction% <!-- xid was passed in from details page -->
                %onerror%
                    <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
                %endinvoke%
            %endif%
            <!-- ------------------------- -->
            <!-- set the value of writeRecoveryRecord field if it is passed in-->
            <!-- ------------------------- -->
            %ifvar writeRecoveryRecord%
                %invoke wm.server.xarecovery:setWriteRecoveryRecord% <!-- value was passed in from this page itself -->
                %endinvoke%
            %endif%

            <tr>
                <td class="breadcrumb" colspan=2>
                    Settings &gt; Resources &gt; XA Manual Recovery
                </td>
            </tr>
            <tr>
                <td colspan=2>
                    <ul>
                        <li class="listitem"><a href="settings-resources.dsp">Return to Resource Settings</a></li>
                        %invoke wm.server.xarecovery:getWriteRecoveryRecord%
                          %ifvar writeRecoveryRecord equals('false')%
                            <li class="listitem"><a href="xamanualrecovery.dsp?writeRecoveryRecord=true">Enable XA Transaction Recovery</a> </li>
                          %else%                
                            <li class="listitem"><a href="xamanualrecovery.dsp?writeRecoveryRecord=false">Disable XA Transaction Recovery</a> </li>
                          %endif%
                    </ul>
                </td>
            </tr>

            <!-- ------------------------- -->
            <!-- invoke lookup service     -->
            <!-- ------------------------- -->
            %invoke wm.server.xarecovery:getUnresolvedTXs%

            <tr>
                <td><IMG SRC="images/blank.gif" height=10 width=10>&nbsp;</td>
                <td width="100%">
                    <table class="tableView">
                    
                        <!-- ---------------- -->
                        <!-- write header     -->
                        <!-- ---------------- -->
                        
                        <tr>
                            <td class="heading" colspan=5>Unresolved XA Transactions</td>
                        </tr>
                        <tr>
                            <td class="oddcol-l">XID</td>
                            <td class="oddcol-l">Global&nbsp;2PC&nbsp;State</td>
                            <td class="oddcol-l">Error&nbsp;Message</td>
                            <td class="oddcol-l">Recovery&nbsp;Action Attempted</td>
                        </tr>
                            
                        <!-- ---------------------- -->
                        <!-- write line-item detail -->
                        <!-- ---------------------- -->
                            
                        %loop unresolvedTXs%
                            
                        <tr>
                            <script>writeTD("rowdata-l");</script><a href="xamanualrecovery-details.dsp?xid=%value xid encode(url)%&globalState=%value 2PCState encode(url)%">%value xid encode(html)%</a></td>
                            <script>writeTD("rowdata-l");</script>%value 2PCState encode(html)%</td>
                            <script>writeTD("rowdata-l");</script>%value error encode(html)%</td>
                            <script>writeTD("rowdata-l");</script>%value recoveryActionAttempted encode(html)%</td>
                          <!--  <td class="evenrowdata-l"><a href="javascript:document.listeners.submit();" onClick="return eraseTransaction(document.listeners, '%value -code xid encode(javascript)%' );"><img src="icons/delete.png" border="no"></A></td> -->
                        </tr>
                        
                        <script>swapRows();</script>       
                            
                        %endloop%
                            
                    </table>
                </td>
            </tr>
            %onerror%
                <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
            %endinvoke%
            %endif%
        %endinvoke%
        </table>
    </body>
</html>
