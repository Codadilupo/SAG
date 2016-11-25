    %scope param(limitBy='IP')%
        %invoke wm.server.enterprisegateway:getDOS%
            <table width="100%" class="tableView">
                   <tr>
                          <td colspan="2" class="heading">
                               Denial of Service by IP Address
                          </td>
                   </tr>
                   
                  
                   <tr>
                        <td class="oddrow" width="30%">
                            Enabled
                        </td>
                        <td class="oddrowdata-l">
                            %ifvar isDOSEnabled equals('true')%
                                Yes
                            %else%
                                No
                            %endif%
                                                            
                        </td>
                    </tr>

                    %ifvar isDOSEnabled equals('true')%
                        <tr>
                          <td  class="evenrow">
                               Maximum Requests
                          </td>
                           <td class="evenrowdata-l">
                           
                            %ifvar maximumRequests%
									%value maximumRequests encode(html)% in %value requestsPerSeconds encode(html)% seconds
                            %else%
                                    none
                            %endif%
                            
                        </td>
                       </tr>
                        <tr>
                            <td  class="oddrow">
                                Maximum Requests in Progress
                            </td>
                            <td class="oddrowdata-l">
                                %ifvar inProgressRequests%
									%value inProgressRequests encode(html)%
                                %else%
                                    none
                                %endif%
                            </td>
                       </tr>
                       <tr>
                            <td  class="evenrow">
                                When Limit Exceeds
                            </td>
                            <td class="evenrowdata-l">
                                %ifvar whenLimitExceeds%
                                    %ifvar whenLimitExceeds equals('Block')%
                                        Block
                                    %else%
                                        %ifvar whenLimitExceeds equals('Add to Deny List')%
                                            Add to Deny List
                                        %else%
                                            none
                                        %endif%
                                    %endif%
                                %else%
                                    none
                                %endif%
                            </td>
                       </tr>
                        %ifvar whenLimitExceeds equals('Block')% 
                        <tr >
                            <td class="oddrow" >Block Interval</td>
							<td class="oddrowdata-l">%value blockInterval encode(html)% minutes</td>
                        </tr>
                        %endif%
                        <tr>
                            <td class="evenrow">
                                Error Message
                            </td>
                            <td class="evenrowdata-l">
                                %ifvar customErrorMessage%
									%value customErrorMessage encode(html)%
                                %else%
                                    none
                                %endif%
                            </td>
                       </tr>
                       <tr>
                            <td class="evenrow">
                                Trusted IP Address Range
                            </td>
                            <td class="evenrowdata-l">
                                %ifvar -notempty trustedIPRange%
									%value trustedIPRange encode(html)%
                                %else%
                                    None
                                %endif%
                            </td>
                       </tr>
                    %endif%
                 </table>
       %endinvoke% 
%endscope%