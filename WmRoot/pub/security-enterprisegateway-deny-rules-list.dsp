 <table width="100%" class="tableView">
               <tr>
                      <td colspan="7" class="heading">
                           Denial Rules
                      </td>
               </tr>
               <tr>
                     <td class="oddcol-l" width="12%">
                         Rule Name
                     </td>
                     <td class="oddcol" width="20%">
                         Filters
                     </td>
                     <td class="oddcol" width="12%">
                         Enabled
                     </td>
                               <td class="oddcol" width="12%">
                         Alert Options
                     </td>
                     <td class="oddcol" width="12%">
                         Copy
                     </td>
                     <td class="oddcol" width="12%">
                         Delete
                     </td>
                     <td class="oddcol" width="14%">
                         Priority
                     </td>
               </tr>
               %ifvar -notempty denyRuleList%
                %loop denyRuleList%
                          <tr>
                                <script>writeTD("rowdata-l");</script>
                                <a href="security-enterprisegateway-create-rule.dsp?operation=editRule&ruleType=DENY&rule=%value ruleName encode(url)%&index=%value $index encode(url)%">
                                  %value ruleName encode(html)%
                                </a>
                                </td>
                                <script>writeTD("rowdata");</script>
                                <script>
                                 var sep="";
                                 var filterStr = "";
                                 %loop Filters%
                                    %ifvar filterName equals('DoSFilter')%  
                                       %ifvar isDOSEnabled equals('true')%    
                                          filterStr = filterStr+sep+"Denial of Service Protection";
                                          sep=", ";
                                        %endif%
                                    %endif%
                                    %ifvar filterName equals('OAuthFilter')%
                                      %ifvar isOAuthEnabled equals('true')%
                                          filterStr = filterStr+sep+"OAuth Credentials";
                                          sep=", ";
                                      %endif%
                                    %endif%
                                    %ifvar filterName equals('MsgSizeLimitFilter')%      
                                      %ifvar isMessageSizeEnabled equals('true')%
                                          filterStr = filterStr+sep+"Message Size Limit";
                                          sep=", ";   
                                      %endif%  
                                    %endif%   
                                    %ifvar filterName equals('mobileAppProtectionFilter')%      
                                      %ifvar isMobileAppProtectionEnabled equals('true')%
                                          filterStr = filterStr+sep+"Mobile Application Protection";
                                          sep=", ";   
                                      %endif%  
                                    %endif%
                                    %ifvar filterName equals('sqlInjectionFilter')%      
                                      %ifvar isSQLInjectionFilterEnabled equals('true')%
                                          filterStr = filterStr+sep+"SQL Injection Protection";
                                          sep=", ";   
                                      %endif%  
                                    %endif% 
                                    %ifvar filterName equals('antiVirusFilter')%      
                                      %ifvar isAntiVirusScanEnabled equals('true')%
                                          filterStr = filterStr+sep+"Antivirus Scan";
                                          sep=", ";   
                                      %endif%  
                                    %endif%     
                                    %ifvar filterName equals('customFilter')%      
                                      %ifvar isCustomFilterEnabled equals('true')%
                                          filterStr = filterStr+sep+"Custom";
                                          sep=", ";   
                                      %endif%  
                                    %endif%                                             
                                  %endloop%
                                  if("" == filterStr ){
                                    filterStr="None";
                                  }
                                  document.write(filterStr);
                                 </script>
                                </td>
                                <script>writeTD("rowdata");</script>
                                  %ifvar isRuleEnabled equals('true')%
                                         <img src="images/green_check.png" border="no">
                                         <a href="security-enterprisegateway-rules.dsp?action=enableDisable&index=%value $index encode(url)%&ruleType=DENY&rule=%value ruleName encode(url)%" onclick="return confirmEnableDisable('%value ruleName encode(javascript)%','disable')">Yes<a>
                                  %else%
                                         <a href="security-enterprisegateway-rules.dsp?action=enableDisable&index=%value $index encode(url)%&ruleType=DENY&rule=%value ruleName encode(url)%" onclick="return confirmEnableDisable('%value ruleName encode(javascript)%','enable')">No<a>
                                  %endif%
                               </td>
                               <script>writeTD("rowdata");</script>
                                    %ifvar alertOption%
									   <a href="security-enterprisegateway-alert-options.dsp?ruleType=DENY&rule=%value ruleName encode(url)%&global=false&alertSettings=false">
                                        Custom
                                       </a>
                                    %else%
										<a href="security-enterprisegateway-alert-options.dsp?ruleType=DENY&rule=%value ruleName encode(url)%&global=false&alertSettings=true">
                                         Default
                                       </a>
                                    %endif%
                                 </td>
                               <script>writeTD("rowdata");</script><a href="security-enterprisegateway-create-rule.dsp?operation=copyRule&ruleType=DENY&rule=%value ruleName encode(url)%&index=%value $index encode(url)%">
                                    <img src="icons/copy.gif" border="no">
                               </a></td>
                               <script>writeTD("rowdata");</script>
                                  <a class="imagelink" href="security-enterprisegateway-rules.dsp?action=delete&index=%value $index encode(url)%&ruleType=DENY&rule=%value ruleName encode(url)%" onclick="return confirmDelete('%value ruleName encode(javascript)%')">
                                    <img src="icons/delete.png" border="none">
                                  </a>
                               </td>
                               <script>writeTD("rowdata");</script>
                                   <a href="security-enterprisegateway-rules.dsp?action=moveUp&index=%value $index encode(url)%&ruleType=DENY&rule=%value ruleName encode(url)%"><img id = "link_up_deny_%value $index encode(htmlattr)%" src="icons/moveup_enabled.png" border="none"></a> 
                                    
                                   <a href="security-enterprisegateway-rules.dsp?action=moveDown&index=%value $index encode(url)%&ruleType=DENY&rule=%value ruleName encode(url)%"><img id = "link_down_deny_%value $index encode(htmlattr)%" src="icons/movedown_enabled.png" border="none"></a> 
                               </td>
                          </tr>
                          <script>swapRows();</script>
                          %ifvar $index equals('0')%
                                <script>
                                          var firstUp =   document.getElementById("link_up_deny_%value $index encode(javascript)%");
                                          var lastDown;
                                </script>
                          %endif%
                          <script>
                                   lastDown =  document.getElementById("link_down_deny_%value $index encode(javascript)%");
                          </script>                         
                      %endloop%
                   %else%
                  <tr>
                    <td colspan="7" class="evencol-l">
                         No rules are currently configured.
                    </td>
                  </tr>                                                                              
               %endif%                                                                          
              </table>
              <script>
              if(typeof lastDown != 'undefined'){
                    disableDirectionImage(lastDown,'DOWN');
              }
              
              if(typeof firstUp != 'undefined'){
                    disableDirectionImage(firstUp,'UP');
              }
              </script>