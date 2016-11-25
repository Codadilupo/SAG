<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" TYPE="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
 
  <body onLoad="setNavigation('settings-cache.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_CachingScrn');">
    <table width="100%">
        <tr>
            <td class="breadcrumb" colspan="2"> Settings &gt; Caching </td>
        </tr>
         %ifvar operation equals('cache_manager_add')%
            %invoke wm.server.ehcache.admin:addCacheManager%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
        %endif%   
        %ifvar operation equals('cache_manager_edit')%
            %invoke wm.server.ehcache.admin:updateCacheManager%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
        %endif% 
        %ifvar operation equals('cache_manager_delete')%
            %invoke wm.server.ehcache.admin:deleteCacheManager%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
         %endif%
        %ifvar operation equals('cache_manager_reload')%
            %invoke wm.server.ehcache.admin:reloadCacheManager%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
         %endif% 
         %ifvar operation equals('cache_manager_shutdown')%
            %invoke wm.server.ehcache.admin:shutdownCacheManager%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
         %endif% 
          %ifvar operation equals('cache_manager_start')%
            %invoke wm.server.ehcache.admin:startCacheManager%
                %ifvar message%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan="2">%value message encode(html)%</td></tr>
                %endif%
                %onerror%
                    <tr><td colspan="2">&nbsp;</td></tr>
					<tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
            %endinvoke%
         %endif% 

        %invoke wm.server.query:getClusterError%
            %ifvar error equals('true')%
                <tr><td colspan="3">&nbsp;</td></tr>
                <TR>
                    <TD class="message" colspan="3">
                    Unable to create or join the cluster. Check the clustering configuration and Error Logs for more information.
                    </TD>
                </TR>
                <tr><td colspan="3">&nbsp;</td></tr>    
            %endif%
        %endinvoke%
         
        <tr>
            <td colspan="2">
                <ul class="listitems">                
                    <li class="listitem"><a href="settings-cache-manager-addedit.dsp?operation=add">Add Cache Manager</a></li>
                </ul>
                %include settings-cache-managers.dsp%
            </td>
        </tr>
    </table>
    </body>     
</head>
