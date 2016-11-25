<html>
    <script Language="JavaScript">
        
        var submitCount=0;
        
        function clickOneTime() {  
           if (submitCount++ > 0) {
               return false;
           }
               
           return true;
           
        }
        
        function deleteTransaction(isUnresolved) {
        
            if (isUnresolved) {
                if (!window.confirm("Warning, this transaction may still be associated with one or more XA Resources.  It is recommended that you resolve this transaction before deleting.  Press OK to continue with the delete.  Press Cancel to cancel the delete."))
                    return false;
            
            }else {
                if (!window.confirm("Are you sure you want to delete this transaction?  Press OK to continue with the delete.  Press Cancel to cancel the delete."))
                    return false;     
            }
                
            return true;
        }
     
    </script>

    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <title>Integration Server Settings</title>
        <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
        <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    </head>

   <BODY onLoad="setNavigation('xamanualrecovery.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_DetailsForXIDScrn');">
        <table width="100%">
        
            <!-- ------------------------- -->
            <!-- perform possible actions  -->
            <!-- ------------------------- -->
            %ifvar performingAction equals('true')%
                %invoke wm.server.xarecovery:performActionsOnXAResources%
                %onerror%
                    <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
                %endinvoke%
            %endif%

            <tr>
                <td class="breadcrumb" colspan="2">
                    Settings &gt; Resources &gt; XA Manual Recovery &gt; Details for XID:&nbsp;%value xid encode(html)%
                </td>
            </tr>
            
            <!-- ------------------------- -->
            <!-- invoke get detail service -->
            <!-- ------------------------- -->
            %invoke wm.server.xarecovery:getXAResourceInfoForXid%
            
            <tr>
                <td valign="top" colspan="2">
                    <ul>
                        <li class="listitem"><a href="xamanualrecovery.dsp">Return to XA Manual Recovery</a></li>
                        <li class="listitem"><a href="xamanualrecovery.dsp?deleteXid=true&xid=%value xid encode(url)%" onclick="return deleteTransaction(%value XAResourceInfo/isUnresolved encode(javascript)%)">Delete Transaction</a></li>
                    </ul>
                </td>
            </tr>

            <tr>
                <td><img src="images/blank.gif" height=10 width=10 border=0></td>
                <td width="100%">
                    <table class="tableView" >
                    
                        <form name="performAction" action="xamanualrecovery-details.dsp" METHOD="POST">
                            
                            <!-- ---------------- -->
                            <!-- write header     -->
                            <!-- ---------------- -->
                            
                            <tr>
                                <td class="heading" colspan=5>Global 2PC State: %value globalState encode(html)%</td>
                            </tr>
                            <tr>
                                <td class="oddcol-l">XA&nbsp;Resource</td>
                                <td class="oddcol-l">XID Exists?</td>
                                <td class="oddcol-l">State</td>
                                <td class="oddcol-l">Inferred&nbsp;Status</td>
                                <td class="oddcol-l">Desired&nbsp;Action</td>
                            </tr>

                            <!-- ---------------------- -->
                            <!-- write line-item detail -->
                            <!-- ---------------------- -->
                            
                            %loop XAResourceInfo/XAResourceData%                      
                            
                            <input name="XAResourceName" type="hidden" value="%value XAResourceName encode(htmlattr)%"/>
                            
                            <tr>
                                <script>writeTD("rowdata-l");</script>%value XAResourceName encode(html)%</td>
                            
                                 %ifvar XIDExists equals('true')%
                                     <script>writeTD("rowdata-l");</script><img style="width: 13px; height: 13px;" alt="" src="images/green_check.png">Yes</td>
                                    
                                     <!-- <script>writeTD("rowdata-l");</script>Prepared or heuristically committed/rolled back</td> -->
                                     <script>writeTD("rowdata-l");</script>%value XAResourceStatusDisplayValue encode(html)%</td>
                                     <script>writeTD("rowdata-l");</script>%value XAResourceInferredStatus encode(html)%</td>
                           
                                     %ifvar XAResourceRecommendedAction equals('forget')%
                                         <script>writeTD("rowdata-l");</script>
                                             <select name=resourceAction size=1">
                                                <option value="nothing">Do Nothing </option>
                                                <option value="commit">Commit </option>
                                                <option value="rollback">Rollback </option>
                                                <option value="forget" selected="selected" >Forget </option>
                                             </select>
                                         </td>
                                     %else%
                                         <script>writeTD("rowdata-l");</script>
                                             <select name=resourceAction size=1">
                                                 <option value="nothing">Do Nothing </option>
                                                 <option value="commit">Commit </option>
                                                 <option value="rollback" selected="selected">Rollback </option>
                                                 <option value="forget">Forget </option>
                                             </select>
                                         </td>
                                     %endif%
                                     
                                %else%
                                    %ifvar ErrorMessage -notempty%
                                        <script>writeTD("rowdata-l");</script>Unknown</td> <!-- <img style="width: 13px; height: 13px;" alt="" src="icons/redxdot.gif">Unverified</td> -->
                                        <script>writeTD("rowdata-l");</script>%value ErrorMessage encode(html)%</td> 
                                        <script>writeTD("rowdata-l");</script>%value XAResourceInferredStatus encode(html)%</td>
                                    %else%
                                        <script>writeTD("rowdata-l");</script>No</td>
                                        <script>writeTD("rowdata-l");</script>%value XAResourceStatusDisplayValue encode(html)%</td>
                                        <script>writeTD("rowdata-l");</script>%value XAResourceInferredStatus encode(html)%</td>
                                    %endif%
                                    
                                    <input name="resourceAction" type="hidden" value="nothing"/>
                                    <script>writeTD("rowdata-l");</script>
                                        <select name=resourceAction-disabled size=1 disabled=true>
                                            <option>Do Nothing</option>
                                        </select>
                                    </td>
                                %endif%
                             
                            </tr>
                            <script>swapRows();</script>       
                                  
                            %endloop%
                       
                            <tr>
                                <td class="space" colspan=4>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="5" class="action">
                                    <input name="performingAction" type="hidden" value="true"/>
                                    <input name="xid" type="hidden" value="%value xid encode(htmlattr)%"/>
                                    <input type="submit" name="submit" value="Perform Action(s)" onclick="return clickOneTime();" />
                                </td>
                            </tr>       
                        </form>            
                    </table>
                </td>
            </tr>
             %onerror%
                <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
            %endinvoke%
        </table>
    </body>
</html>
