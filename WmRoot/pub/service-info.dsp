<html>
    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta http-equiv="Expires" content="-1">
        <link rel="stylesheet" type="text/css" href="webMethods.css">
        <script src="webMethods.js.txt"></script>
    </head>
    <body onLoad="setNavigation('package-list.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_SvcDetailsScrn');">
    %invoke wm.server.services.adminui:serviceInfo%
   <table width="100%">
        <tr>
          <td class="breadcrumb" colspan=2>
            Packages &gt;
            Management &gt;
            %value package encode(html)% &gt;
            Services &gt; %value service encode(html)%
          </td>
        </tr>
       %ifvar message%
          <tr>
            <td class="message" colspan=2>%value message encode(html)%</td>
          </tr>
       %else%

      %ifvar action equals('set')%
         %invoke wm.server.services.adminui:serviceInfoSet%
            %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
            %endif%
         %endinvoke%
      %endif%
      %ifvar resetcache%
        %invoke wm.server.cache.adminui:resetCache%
      <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
        %endinvoke%
      %endif%

         <tr>
          <td colspan=2>
            <ul class="listitems">
                            %ifvar browsefolders%
              <li><A href="service-list.dsp?interface=%value interface encode(url)%">Return to browsing folder %value interface encode(html)%</a></li>
                            %else%
              <li><A href="package-info.dsp?package=%value package encode(url)%&showServices=">Return to list of services in package %value package encode(html)%</a></li>
                            %endif%

              <li><A href="service-test.dsp?service=%value service encode(url)%&interface=%value interface encode(url)%&doc=edit">Test %value service encode(html)%</a></li>
              <li><a href="service-info.dsp?service=%value interface encode(url)%:%value service encode(url)%&resetcache=true&serviceName=%value interface encode(url)%:%value service encode(url)%">Reset Service Cache</A>
              <li><A href="/invoke/pub.cache.serviceResults/listServiceCache?serviceName=%value interface encode(url)%:%value service encode(url)%">List Service Cache</a></li>			  
			  </td>
               </tr>
            </ul>
          </td>
        </tr>
      <tr>
         <td>
         <table WIDTH="100%">
     <tr>
         <!-- LEFT table -->
         <td width="50%" valign=top>
            <table class="tableView" width="100%">
               <tr>
                  <td class="heading" colspan=2>General Information</td>
               </tr>
               <tr>
                  <td width="33%" class="oddrow">Service</td>
                  <td class="oddrowdata-l">%value interface encode(html)%:%value service encode(html)%</td>
               </tr>
               <tr>
                  <td nowrap class="evenrow">Package</td>
                  <td class="evenrowdata-l">
                     <A href="package-info.dsp?package=%value package encode(url)%">
                     %value package encode(html)%
                     </A></td>
               </tr>
               <tr>
                  <td nowrap class="oddrow">Type</td>
                  <td class="oddrowdata-l">%value type/svc_type encode(html)%</td>
               </tr>
               <tr>
                  <td nowrap class="evenrow">Stateless</td>
                  <td class="evenrowdata-l"> %ifvar stateless equals('true')% Yes
                     %else% No %endif%  </td>
               </tr>
               <tr><td class="space" colspan="2">&nbsp;</td></tr>
               <tr>
                    <td class="heading" colspan=2>Universal Name</td>
               </tr>
               <tr>
                    <td nowrap class="oddrow">Namespace Name</td>
                    <td class="oddrowdata-l">
                                        %ifvar universalNamespace%
											%value universalNamespace encode(html)%
                                        %else%
                            &lt;Default&gt;
                        %endif%
                      </td>
                  </tr>
                  <tr>
                                <td nowrap class="evenrow">Local Name</td>
                                <td class="evenrowdata-l">
                                    %ifvar universalNCName%
										%value universalNCName encode(html)%
                                    %else%
                        &lt;Default&gt;
                      %endif%
                    </tr>
               <tr><td class="space" colspan="2">&nbsp;</td></tr>
               <!-- Runtime Information --> %ifvar class%
               <tr>
                  <td class="heading" colspan=2>Java-Specific Parameters</td>

               </tr>
               <tr>
                  <td width="33%" class="oddrow">Class</td>
                  <td class="oddrowdata-l">%value class encode(html)%</td>
               </tr>
               <tr>
                  <td nowrap class="evenrow">Method</td>
                  <td class="evenrowdata-l">%value method encode(html)%</td>
               </tr> %endif%
               <tr><td class="space" colspan="2">&nbsp;</td></tr>
               <!-- Access Control -->
               <tr>
                  <td class="heading" colspan=2>Access Control</td>
               </tr>
               <tr>
                  <td width="33%" class="oddrow">List ACL</td>
                  <td class="oddrowdata-l">%ifvar inhbrowseAcl equals('true')%&lt;%endif%%ifvar browseaclgroup%%value browseaclgroup encode(html) empty='&lt;Default&gt; (inherited)'%%else%Default%endif%%ifvar inhbrowseAcl equals('true')%&gt; (inherited)%endif%</td>
               </tr>
               <tr>
                  <td width="33%" class="evenrow">Read ACL</td>
                  <td class="evenrowdata-l">%ifvar inhreadAcl equals('true')%&lt;%endif%%ifvar readaclgroup%%value readaclgroup encode(html) empty='&lt;Default&gt; (inherited)'%%else%Default%endif%%ifvar inhreadAcl equals('true')%&gt; (inherited)%endif%</td>
               </tr>
               <tr>
                  <td width="33%" class="oddrow">Write ACL</td>
                  <td class="oddrowdata-l">%ifvar inhwriteAcl equals('true')%&lt;%endif%%ifvar writeaclgroup%%value writeaclgroup encode(html) empty='&lt;Default&gt; (inherited)'%%else%Default%endif%%ifvar inhwriteAcl equals('true')%&gt; (inherited)%endif%</td>
               </tr>
               <tr>
                  <td width="33%" class="evenrow">Execute ACL</td>
                  <td class="evenrowdata-l">%ifvar inhAcl equals('true')%&lt;%endif%%ifvar aclgroup%%value aclgroup encode(html) empty='&lt;Default&gt; (inherited)'%%else%Default%endif%%ifvar inhAcl equals('true')%&gt; (inherited)%endif%</td>
               </tr>
               <tr>
                  <td class="oddrow">Enforce ACL on Internal Invokes</td>
                  <td class="oddrowdata-l"> %ifvar check_internal_acls equals('true')% On %else% Off %endif%  </td>
               </tr>
            </table></td>
         <!-- RIGHT table -->
         <td width="50%" valign=top>
            <table class="tableView" width="100%">
               <!-- Cache Control -->
               <tr>
                  <td CLASS="heading" colspan=2>Cache Control</td>
               </tr>
               <tr>
                  <td width="33%" class="oddrow">Caching</td>
                  <td class="oddrowdata-l"> %ifvar cacheOn equals('true')% On %else% Off %endif%  </td>
               </tr>
               <tr>
                  <td nowrap class="evenrow">Cache Expiration</td>
                  <td class="evenrowdata-l">%value cacheExpire encode(html)% (min)</td>
               </tr>
               <tr>
                  <td nowrap class="oddrow">Prefetch</td>
                  <td class="oddrowdata-l"> %ifvar prefetchOn equals('true')% On %else% Off %endif%  </td>
               </tr>
               <tr>
                  <td nowrap class="evenrow">Prefetch Activate</td>
                  <td class="evenrowdata-l">%value prefetchLevel encode(html)% (hits)</td>
               </tr>
            </td>
         </tr>
         <tr><td class="space" colspan="2">&nbsp;</td></tr>
         <!--  Data Formatting  -->
         <tr>
            <td CLASS="heading" colspan=2>Data Formatting</td>
         </tr>
         <tr>
            <td width="33%" class="oddrow">Binding Name</td>
            <td class="oddrowdata-l">%value binding encode(html) empty=&lt;None&gt;%</td>
         </tr>
         <tr>
            <td nowrap class="evenrow">Output Template</td>
            <td class="evenrowdata-l">%value template encode(html) empty=&lt;None&gt;%</td>
         </tr>
         <tr>
            <td nowrap class="oddrow">Template Type</td>
            <td class="oddrowdata-l"> %value templateType encode(html)%
            </table></td>
         <!-- Warning Message -->
         %ifvar available equals('true')%
         %else%
          <tr>
            <td class="message" colspan=2>This service is not available</td>
         </tr>
          <tr>
            <td colspan=2>&nbsp;</td>
         </tr>
         <tr>
           <td colspan="2">
             <table class="tableView">
               <tr>
                 <td CLASS="heading" colspan=2>Warning Message</td>
               </tr>
               <tr>
                 <td nowrap class="oddrow">Status</td>
                 <td class="oddrowdata-l">Not Loaded</td>
               </tr>
               %ifvar comment%
               <tr>
                  <td nowrap class="oddrow">Comment</td>
                  <td class="oddrowdata-l">%value comment encode(html)%</td>
               </tr>
               %endif%
             </table>
           </td>
         </tr>
         %endif%
      </table> %endif%%endinvoke%
      </table>
   </body>
</html>
