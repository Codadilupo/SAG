<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <title>Server &gt; Statistics</title>
    <link rel="stylesheet" type="text/css" href="webMethods.css">
    <script src="webMethods.js.txt"></script>
  </head>

  <body onLoad="setNavigation('stats-general.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Server_SrvrStatsScrn');">
    <table width="100%">
      <tr>
        <td class="breadcrumb" colspan="3">Server &gt; Statistics</td>
      </tr>

      %invoke wm.server.query:getReadOnlyConfigFiles%
      %ifvar noOfFiles equals('0')%
      %else%
        <tr><td colspan="3">&nbsp;</td></tr>
        <tr>
          <td class="message" colspan="3">
          The following configuration files are read-only. You may not be able
          to save configuration changes until you make them writable.
          %loop configFiles%
            <br>%value name% 
          %endloop%
          </td>
        </tr>
      %endif%
      %endinvoke%

      %invoke wm.server.query:getClusterError%
      %ifvar error equals('true')%
      <tr><td colspan="3">&nbsp;</td></tr>
      <tr>
        <td class="message" colspan="3">
          Unable to create or join the cluster. Check the clustering configuration and error logs for more information.
        </td>
      </tr>
      %endif%
      %endinvoke%

      %invoke wm.server.query:getStats%
      %invoke wm.server.query:getThreadList%
      <tr>
        <td width="10">
          <img border="0" src="images/blank.gif" width="10" height="10">
        </td>
        <td width="10">
          <img border="0" src="images/blank.gif" width="10" height="10">
        </td>
        <td width="10">
          <img border="0" src="images/blank.gif" width="10" height="10">
        </td>
      </tr>

      <tr>
        <td valign="top">
          <table class="tableView" width="100%">
            <tr>
              <td width="100%" colspan="4" class="heading">Usage</td>
            </tr>
            <tr class="subheading2">
              <td nowrap class="oddrow">&nbsp;</td>
              <td nowrap class="oddcol">Current</td>
              <td nowrap class="oddcol">Peak</td>
              <td nowrap class="oddcol">Limit</td>
            </tr>
            <tr>
              <td nowrap class="evenrow">Total Sessions</td>
              <td nowrap class="evenrowdata"><A HREF="server-cluster.dsp">%value conn%</A></td>
              <td nowrap class="evenrowdata">%value connMax%</td>
              <td nowrap class="evenrowdata">-</td>
            </tr>
            <tr>
              <td nowrap class="oddrow">Licensed Sessions</td>
              <td nowrap class="oddrowdata">%value ssnUsed%</td>
              <td nowrap class="oddrowdata">%value ssnPeak%</td>
              <td nowrap class="oddrowdata">%value ssnMax%</td>
            </tr>
            <tr>
              <td nowrap class="evenrow">Stateful Sessions</td>
              <td nowrap class="evenrowdata">%value connStatefulSessionsCurrent%</td>
              <td nowrap class="evenrowdata">%value connStatefulSessionsPeak%</td>
              <td nowrap class="evenrowdata">%value connStatefulSessionsLimit%</td>
            </tr>
            <tr>
              <td nowrap class="oddrow">Service Instances</td>
              <td nowrap class="oddrowdata">%value svrT%</td>
              <td nowrap class="oddrowdata">%value svrTMax%</td>
              <td nowrap class="oddrowdata">-</td>
            </tr>
            
            <tr>
              <td nowrap class="evenrow">Service Threads</td>
              <td nowrap class="evenrowdata">%value srvThreadCount%</td>
              <td nowrap class="evenrowdata">%value srvThreadCountPeak%</td>
              <td nowrap class="evenrowdata">-</td>
            </tr>
                  
            <tr>
              <td nowrap class="oddrow">System Threads</td>
                
              %ifvar threadkillsupported equals('true')%
                <td nowrap class="oddrowdata"><a href="server-threads-new.dsp">%value sysT%</a></td>
              %else%
                <td nowrap class="oddrowdata"><a href="server-threads.dsp">%value sysT%</a></td>
              %endif%

              <td nowrap class="oddrowdata">%value sysTMax%</td>
              <td nowrap class="oddrowdata">-</td>
            </tr>
            <tr>
              <td nowrap class="evenrow">Uptime</td>
              <td nowrap class="evenrowdata" colspan=3>%value uptime%</td>
            </tr>
          </table>
        </td>
        <td width="10"><IMG border="0" src="images/blank.gif" width="10" height="10"></td>
        <td valign="top">
          <table class="tableView" width="100%">
            <tr>
              <td width="100%" colspan="3" class="heading">Requests</td>
            </tr>
            <tr class="subheading2">
              <td >&nbsp;</td>
              <td >Current</td>
              <td >Lifetime</td>
            </tr>
            <tr>
              <td nowrap class="evenrow">Completed Req's</td>
              <td nowrap class="evenrowdata">%value reqTotal%</td>
              <td nowrap class="evenrowdata">%value reqLifetime%</td>
            </tr>
            <tr>
              <td nowrap class="oddrow">Average Time</td>
              <td nowrap class="oddrowdata">%value reqAvg% ms</td>
              <td nowrap class="oddrowdata">%value reqTotAvg% ms</td>
            </tr>
            <tr>
              <td class="evenrow">Service Errors</td>
              <td class="evenrowdata"><a href="log-error-recent.dsp?returnto=stats-general">%value errSvc%</a></td>
              <td class="evenrowdata">-</td>
            </tr>
            <tr class="subheading2">
              <td>&nbsp;</td>
              <td>Started</td>
              <td>Ended</td>
            </tr>
            <tr>
              <td nowrap class="evenrow">Req's per minute</td>
              <td nowrap class="evenrowdata">%value newReqPM%/min</td>
              <td nowrap class="evenrowdata">%value endReqPM%/min</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="10"><IMG border="0" src="images/blank.gif" width="10" height="10"></td>
        <td width="10"><IMG border="0" src="images/blank.gif" width="10" height="10"></td>
        <td width="10"><IMG border="0" src="images/blank.gif" width="10" height="10"></td>
      </tr>
      <tr>
        <td valign="top" colspan=3>
          <table class="tableView" width="100%">
            <tr>
              <td class="heading" colspan="4">Memory</td>
            </tr>
            <tr>
              <td nowrap class="evenrow">Maximum</td>
              <td nowrap class="evenrowdata-r">%value maxMem% KB</td>
              <td nowrap class="evenrowdata-r">&nbsp;</td>
              <td nowrap class="evenrowdata-l" width="100%">&nbsp;</td>
            </tr>

            <tr>
              <td nowrap class="oddrow">Committed</td>
              <td nowrap class="oddrow-r">%value totalMem% KB</td>
              <td nowrap class="oddrow-r">&nbsp;</td>
              <td nowrap class="oddrow-l" width="100%">&nbsp;</td>
            </tr>

            <tr>
              <td nowrap class="evenrow">Used</td>
              <td nowrap class="evenrowdata-r">%value usedMem% KB</td>
              <td nowrap class="evenrowdata-r">%value usedMemPer%% (memory)</td>
              <td width="100%">
                <table id="usedMemoryBar" width="%value usedMemPer%%">
                  <tr>
                    <td><img border="0" src="images/pixel.gif" width="1" height="6" /></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td nowrap class="oddrow">Free</td>
              <td nowrap class="oddrow-r">%value freeMem% KB</td>
              <td nowrap class="oddrow-r">%value freeMemPer%%</td>
              <td nowrap class="oddrow-l" width="100%">
                <table id="freeMemoryBar" width="%value freeMemPer%%" >
                  <tr>
                    <td><img border="0" src="images/pixel.gif" height="6" width="1" ></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td colspan=4 width=100% >
                <table class="memoryGraph" width=100% cellpadding=0 cellspacing=2 align="center">
                  <tr>
                    <td width="25%">
                      <table class="memoryTable">
                        <tr>
                          <td nowrap class="evenrowdata"><img src="images/blank.gif" height=10 width=10></td>
                          <td nowrap class="evenrowdata" colspan=24>Memory Usage (average per hour)</td>
                          <td style="font-weight: normal;" class="evenrowdata-l">%value memArrayMax% KB</td>
                        </tr>
                        <tr>
                          <td nowrap class="evenrowdata"></td>
                          %loop -struct memArray%
                            <td class="memgraph">
                              <img src="images/pixel.gif"
                                   width="14"
                                   height="%value percent%"
                                   alt="%ifvar $key equals('1')%%value $key% hour ago: %value actual% KB (%value percent%%) used
                                         %else%%value $key% hours ago: %value actual% KB (%value percent%%) used
                                         %endif%"/>
                            </td>
                          %endloop%
                          <td nowrap class="evenrowdata-l">
                            <img border="0" width="14" height="100" src="images/memory_gauge.gif">
                          </td>
                        </tr>
                        <tr>
                          %loop -struct memArray%
                            %switch $key%
                              %case '1'%
                              %case '2'%
                                <td nowrap class="evenrowdata" colspan=2>&nbsp;-1h</td>
                              %case '11'%
                              %case '12'%
                                <td nowrap class="evenrowdata" colspan=3>&nbsp;-12h</td>
                              %case '13'%
                              %case '23'%
                              %case '24'%
                                <td nowrap class="evenrowdata" colspan=3>&nbsp;-24h</td>
                              %case%
                                <td nowrap class="evenrowdata">&nbsp;</td>
                            %endswitch%
                          %endloop%
                          <td nowrap style="font-weight: normal;" class="evenrowdata-l">0 KB</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>
