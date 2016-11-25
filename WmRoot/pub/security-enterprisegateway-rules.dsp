<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  <script>
    function confirmDelete(ruleName) {
         return confirm("Are you sure you want to delete the rule " + ruleName + " ?");
    }
    function confirmEnableDisable(ruleName,operation)
    {
        return confirm("Are you sure you want to " + operation + " the rule " + ruleName + " ?");
    }
      function disableLink(link)
      {
         link.disabled=true;
         link.style.color='gray';
         link.style.cursor='default';
         link.onclick=function (){return false;}
    }
    function disableAllLinks()
    {
        var links=document.getElementsByTagName("a");
        for(i=0;i<links.length;i++)
        {
            disableLink(links[i]);
        }
    }
  function disableDirectionImage(link,direction){
         disableLink(link)
         if('UP' == direction){
            link.src='icons/moveup_disabled.png';
         }
         else{
            link.src='icons/movedown_disabled.png';
         }
  }
 </script>  
 </head>

<body onLoad="setNavigation('security-enterprisegateway-rules.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_EnterpriseGatewayRulesScrn');">
    <table width="100%">
        <tr>
            <td class="breadcrumb" colspan="2">Security&nbsp;&gt;&nbsp;Enterprise&nbsp;Gateway&nbsp;Rules</td>
        </tr>
    
    %invoke wm.server.apigateway:isAPIGatewayLicensed%
        %ifvar isAPIGatewayLicensed equals('true') %
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr><td class="keymessage" colspan="2">Use API Gateway Portal for configuration.</td></tr>
        %else%
            %ifvar isEnterpriseGatewayLicensed equals('false')%
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr><td class="keymessage" colspan="2">Enterprise Gateway License is required for configuration.</td></tr>
            %else%
                %ifvar operation equals('editAlertOptions')%

                    %invoke wm.server.enterprisegateway:saveAlertOptions%
                        %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                        %endif%
                        %onerror%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%

                %ifvar action equals('enableDisable')%
                  %invoke wm.server.enterprisegateway:enableDisableRule%
                      %ifvar message%
                      <tr><td colspan="2">&nbsp;</td></tr>
                        <TR><TD class="message" colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html)%</TD></TR>
                      %endif%
                      %onerror%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%

                %ifvar action equals('delete')%
                    %invoke wm.server.enterprisegateway:deleteRule%
                      %ifvar message%
                      <tr><td colspan="2">&nbsp;</td></tr>
                      <TR><TD class="message" colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html)%</TD></TR>
                      %endif%
                    %onerror%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%

                %ifvar action equals('moveUp')%
                    %invoke wm.server.enterprisegateway:moveUp%
                      %ifvar message%
                      <tr><td colspan="2">&nbsp;</td></tr>
                      <TR><TD class="message" colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html)%</TD></TR>
                      %endif%
                        %onerror%
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%

                %ifvar action equals('moveDown')%
                      %invoke wm.server.enterprisegateway:moveDown%
                          %ifvar message%
                          <tr><td colspan="2">&nbsp;</td></tr>
                      <TR><TD class="message" colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html)%</TD></TR>
                          %endif%
                            %onerror%
                                    <tr><td colspan="2">&nbsp;</td></tr>
                                    <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%

                %ifvar operation equals('createRule')%
                    %invoke wm.server.enterprisegateway:addRule%
                        %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                        %endif%
                        %onerror%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%

                %ifvar operation equals('editRule')%

                    %invoke wm.server.enterprisegateway:updateRule%
                        %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                        %endif%
                        %onerror%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%

                %ifvar operation equals('copyRule')%
                    %invoke wm.server.enterprisegateway:addRule%
                        %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                        %endif%
                        %onerror%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%

                %ifvar limitBy%
                    %invoke wm.server.enterprisegateway:saveDOS%
                        %ifvar message%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                        %endif%
                        %onerror%
                            <tr><td colspan="2">&nbsp;</td></tr>
                            <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
                    %endinvoke%
                %endif%


                <tr>
                        <td colspan="2">
                            <ul class="listitems">
                                <li class="listitem"><a href="security-enterprisegateway-alert-list.dsp">Default&nbsp;Alert&nbsp;Options</a></li>
                                <li class="listitem"><a href="enterprisegateway-dos-options.dsp">Denial&nbsp;of&nbsp;Service&nbsp;Options</a></li>
                                <li class="listitem"><a href="enterprisegateway-mobile-app-protection.dsp">Mobile&nbsp;Application&nbsp;Protection&nbsp;Options</a></li>
                                <li class="listitem"><a href="security-enterprisegateway-create-rule.dsp?operation=createRule">Create&nbsp;Rule</a></li>
                            </ul>
                        </td>
                </tr>

        </table>
            %invoke wm.server.enterprisegateway:getRulesList%
            %include security-enterprisegateway-deny-rules-list.dsp%
            %include security-enterprisegateway-alert-rules-list.dsp%
            %endinvoke%
            %endif% <!-- isEnterpriseGatewayLicensed -->
        %endif% <!-- isAPIGatewayLicensed -->
    </table> 
    %endinvoke%
  </body>   
</html>
