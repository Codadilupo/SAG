
<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Integration Server Settings</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
  </HEAD>
  %ifvar doc equals('edit')%
  <BODY onLoad="setNavigation('settings-repository.dsp',  '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_EditRepositoryScrn');">
  %else%
  <BODY onLoad="setNavigation('settings-repository.dsp',  '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_RepositoryScrn');">
  %endif%

    %ifvar doc equals('edit')%
      <FORM NAME="repository" METHOD="POST" ACTION="settings-repository.dsp">
      <INPUT TYPE="hidden" NAME="action" VALUE="change">
      %ifvar mode%
        <input type="hidden" name="mode" value="%value mode encode(htmlattr)%">
      %else%
        <input type="hidden" name="mode" value="standalone">
      %endif%
      %ifvar fsdata.blockDevice%
        <input type="hidden" name="fsdata.blockDevice" value="%value fsdata.blockDevice encode(htmlattr)%">
      %else%
        <input type="hidden" name="fsdata.blockDevice" value="RAF">
      %endif%
    %endif%

    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan=2>
          Settings &gt;
          Repository
          %ifvar doc equals('edit')% &gt; Edit %endif%
      </TR>

      %ifvar action equals('change')%
        %invoke wm.server.admin:setRepoSettings%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html) empty='Settings Saved'%</TD></TR>
        %endinvoke%
          %ifvar message2%
             <TR><TD class="message" colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message2 encode(html)%</TD></TR>
          %endif%
      %endif%

    %invoke wm.server.query:getRepoSettings%
      <TR>
        <TD colspan=2>
          <ul class="listitems">
%ifvar doc equals('edit')%
            <li class="listitem"><a href="settings-repository.dsp">Return to Repository Settings</a></li>
            %ifvar mode equals('standalone')%
               <li class="listitem"><a href="settings-repository.dsp?doc=edit&mode=shareoutproc&fsdata.blockDevice=%ifvar fsdata.blockDevice -isnull%RAF%else%%value fsdata.blockDevice encode(url)%%endif%&action=update">Change to Remote Repository Server</a></li>
            %ifvar fsdata.blockDevice equals('RAF')%
               <li class="listitem"><a href="settings-repository.dsp?doc=edit&mode=standalone&fsdata.blockDevice=JDBC&action=update">Change Persistent Store to Database</a></li>
            %else%
               <li class="listitem"><a href="settings-repository.dsp?doc=edit&mode=standalone&fsdata.blockDevice=RAF&action=update">Change Persisent Store to Filesystem</a></li>
            %endif%
            %else%
               <li class="listitem"><a href="settings-repository.dsp?doc=edit&mode=standalone&fsdata.blockDevice=%ifvar fsdata.blockDevice -isnull%RAF%else%%value fsdata.blockDevice encode(url)%%endif%&action=update">Change to Local Repository</a></li>
            %endif%
%else%
            <li class="listitem"><a href="settings-repository.dsp?doc=edit">Edit Repository Settings</a></li>
%endif%
          </UL>
        </TD>
      </TR>

      <TR>
        <TD><IMG SRC="images/blank.gif" height=10 width=10></TD>
        <TD>
          <TABLE class="%ifvar doc equals('edit')%tableView%else%tableView%endif%">
            <TR>
            %ifvar mode equals('standalone')%
              <TD colspan=2 class="heading">Local Repository Configuration</TD>
              </TR>
        <tr><td class="space" colspan="3">&nbsp;</td></tr>
              <TR>
                  %ifvar fsdata.blockDevice equals('RAF')%
                     <TD colspan=2 class="heading">Filesystem physical store</TD>
                  %else%
                     <TD colspan=2 class="heading">Database physical store</TD>
                  %endif%
                </TD>
              </TR>
              %ifvar fsdata.blockDevice equals('RAF')%
              <TR>
                <TD class="oddrow">Local Data Directory Name</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.dbGroup", "%value fsdata.dbGroup encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Local Log Directory Name</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.logGroup", "%value fsdata.logGroup encode(html_javascript)%");</script>
                </TD>
              </TR>
              %endif%
              <TR>
                <TD class="oddrow">Local Data Filename Prefix</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.dbName", "%value fsdata.dbName encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Repository Error Log Filename</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "logfile", "%value logfile encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Max Data Extents</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.dataMaxExtents", "%value  fsdata.dataMaxExtents encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Data Threshold</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.dataThreshold", "%value  fsdata.dataThreshold encode(html_javascript)%");</script>%
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Max Index Extents</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.indexMaxExtents", "%value  fsdata.indexMaxExtents encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Index Threshold</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.indexThreshold", "%value  fsdata.indexThreshold encode(html_javascript)%");</script>%
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Data File Size</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.dbSize", "%value  fsdata.dbSize encode(html_javascript)%");</script>MB
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Log File Size</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.logSize", "%value  fsdata.logSize encode(html_javascript)%");</script>MB
                </TD>
              </TR>
              %ifvar fsdata.blockDevice equals('JDBC')%
        <tr><td class="space" colspan="3">&nbsp;</td></tr>
              <TR>
                <TD colspan=2 class="heading">Database Settings</TD>
              </TR>
              <TR>
                <TD class="oddrow">JDBC Driver</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.jdbcdriver", "%value  fsdata.jdbc.jdbcdriver encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">JDBC Database URL</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.dburl", "%value  fsdata.jdbc.dburl encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Database Userid</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.user", "%value  fsdata.jdbc.user encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Database Password</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEditPass("%value ../doc encode(javascript)%", "fsdata.jdbc.password", "%value  fsdata.jdbc.password encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Sweeper Interval</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.sweeperInterval", "%value  fsdata.jdbc.sweeperInterval encode(html_javascript)%");</script> milliseconds
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Sweeper Age</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.sweeperAge", "%value  fsdata.jdbc.sweeperAge encode(html_javascript)%");</script> milliseconds
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Segment Size</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.segmentSize", "%value  fsdata.jdbc.segmentSize encode(html_javascript)%");</script> bytes
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Segment Cache</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.maxCache", "%value  fsdata.jdbc.maxCache encode(html_javascript)%");</script> segments
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Database Connection Retry</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.maxConnRetry", "%value  fsdata.jdbc.maxConnRetry encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Database Connection Retry Delay</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.connRetryInterval", "%value  fsdata.jdbc.connRetryInterval encode(html_javascript)%");</script> milliseconds
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Database Error Log Filename</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "fsdata.jdbc.errorLog", "%value  fsdata.jdbc.errorLog encode(html_javascript)%");</script>
                </TD>
              </TR>
              %endif%
        <tr><td class="space" colspan="3">&nbsp;</td></tr>
              <TR>
                 <TD colspan=2 class="heading">Repository recovery</TD>
              </TR>
              <TR>
                <TD class="oddrow">Full Consistency Check</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  %ifvar doc equals('edit')%
                  <input type="radio" name="fsdata.fullConsistencyCheck" value="never" %ifvar fsdata.fullConsistencyCheck equals('never')%checked%endif%>Never</input>
                  <input type="radio" name="fsdata.fullConsistencyCheck" value="conditional" %ifvar fsdata.fullConsistencyCheck equals('conditional')%checked%endif%>Conditional</input>
                  <input type="radio" name="fsdata.fullConsistencyCheck" value="always" %ifvar fsdata.fullConsistencyCheck equals('always')%checked%endif%>Always</input>
                  %else%
                  %value fsdata.fullConsistencyCheck encode(html)%
                  %endif%
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Attempt Repair</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  %ifvar doc equals('edit')%
                  <input type="radio" name="fsdata.attemptRepair" value="true" %ifvar fsdata.attemptRepair equals('true')%checked%endif%>Yes</input>
                  <input type="radio" name="fsdata.attemptRepair" value="false" %ifvar fsdata.attemptRepair equals('false')%checked%endif%>No</input>
                  %else%
                    %ifvar fsdata.attemptRepair equals('true')%
                      Yes
                    %else%
                      No
                    %endif%
                  %endif%
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Repository Session Timeout</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "sessiontimeout", "%value  sessiontimeout encode(html_javascript)%");</script> milliseconds
                </TD>
              </TR>
              
            %else%
            <TR>
              <TD colspan=2 class="heading">Remote Repository Server Configuration</TD>
            </TR>
              <TR>
                <TD class="oddrow">Hostname</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "hostname", "%value  hostname encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Port</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "port", "%value  port encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Minimum connection threads</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "connthreadmin", "%value  connthreadmin encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Maximum connection threads</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "connthreadmax", "%value  connthreadmax encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Connection retry count</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "retrycount", "%value  retrycount encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Connection retry delay</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "retrydelay", "%value  retrydelay encode(html_javascript)%");</script>
                </TD>
              </TR>
            %ifvar clusterservers%
            <TR>
              <TD colspan=2 class="heading">Remote Repository Cluster Servers</TD>
            </TR>
            %loop clusterservers%
              <TR>
                <TD class="oddrow">Hostname</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "clusterhostname", "%value  clusterhostname encode(html_javascript)%");</script>
                </TD>
              </TR>
              <TR>
                <TD class="oddrow">Port</TD>
                <TD class="%ifvar doc equals('edit')%oddrow-l%else%oddrowdata-l%endif%">
                  <script>writeEdit("%value ../doc encode(javascript)%", "clusterport", "%value  clusterport encode(html_javascript)%");</script>
                </TD>
              </TR>
            %endloop%
            %endif%
            %endif%

          %ifvar ../doc equals('edit')%
            <TR>
              <TD class="action" colspan="3">
                <INPUT type="submit" name="submit" value="Save Settings"></INPUT>
              </TD>
            </TR>
            </FORM>
          %endif%
        </TD>
      </TABLE>
      </TR>
    </TABLE>
    %endinvoke%

  </BODY>
</HTML>
