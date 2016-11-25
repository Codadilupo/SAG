<HTML>
  <HEAD>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Integration Server</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
  </HEAD>
  <BODY onLoad="setNavigation('package-exchange.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_CreateDelRelsScrn');">
    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan=2>
          Packages &gt;
          Publishing &gt;
          Create and Delete Releases
        </TD>
      </TR>

      %ifvar action equals('unrelease')%
          %invoke wm.server.replicator:packageUnRelease%
      <tr><td colspan="2">&nbsp;</td></tr>
                  <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Release %value releasedPackages encode(html)% Deleted</TD></TR>
          %onerror%
              %ifvar errorMessage%
      <tr><td colspan="2">&nbsp;</td></tr>
                  <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error: %value errorMessage encode(html)%</TD></TR>
              %endif%
          %endinvoke%
      %endif%

      <TR>
        <TD colspan=2>
          <UL class="listitems">
            <li><a href="package-exchange.dsp">Return to Publishing</a></li>
          </UL>
        </TD>
      </TR>
      <TR>
        <TD>
          <TABLE class="tableView" width=100%>
            %invoke wm.server.replicator:getDetailedReleasedList%

<tr>
  <TD class="heading" colspan=2>Packages and Releases</td>
</tr>

<tr>
  <TD class="oddcol-l">Package</td>
  <TD class="oddcol-l">Releases</td>
</tr>

<script>swapRows();</script>
            %loop packages%

                    <TR>
<script>writeTDrowspan("rowdata-l",2);</script>
%value name encode(html)%</TD>
<script>writeTD("rowdata-l");</script>
%ifvar name equals('WmRoot')%
Not Available
%else%
<A HREF="package-archive.dsp?package=%value name encode(url)%&release=true">Create Release</A>
%endif%
</td><tr>


<td style="padding: 0px;"><table class="tableInline" width=100% cellspacing=1>
%ifvar name equals('WmRoot')%
<tr><td>&nbsp;</td></tr>
%else%
%ifvar released%
<script>swapRows();</script>
                    <TR>
                        <script>writeTD("col-l");</script>Release Name</TD>
                        <script>writeTD("col");</script>Version</TD>
                        <script>writeTD("col");</script>Build</TD>
                        <script>writeTD("col-l");</script>Created on</TD>
                        <script>writeTD("col");</script>Delete</TD>
                    </TR>
<script>swapRows();</script>
                %loop released%

                    <TR>
                        <script>writeTDrowspan("rowdata-l",2);</script>
                            %value name encode(html)%</TD>
                        <script>writeTD("rowdata");</script>
                            %value version encode(html)%</TD>
                        <script>writeTD("rowdata");</script>
                            %value build encode(html)%</TD>
                        <script>
                          writeTD("rowdata-l");
                          </script>
                          %value time encode(html)%
                        </TD>
                        <script>writeTDrowspan("rowdata",2);</script>
                            <A class ="imagelink" href="package-release-selection.dsp?action=unrelease&releasedPackages=%value name encode(url)%"><IMG
                                SRC="icons/delete.png" border=0
                                alt="Delete %value name encode(htmlattr)%"></A></TD>
                    </TR>
                    <TR>
                        <script>writeTDspan("rowdata-l",3);</script>
                            %ifvar description equals('')%
                              &nbsp;
                            %else%
                              %value description encode(html)%
                            %endif%
                        </TD>
                    </TR>
%endloop%
                %else%
                                <tr><script>writeTD("row-l");</script>No Releases</TD></tr>
%endif%
%endif%
</table></td>
</tr>

<script>swapRows();</script>
            %endloop%
            %endinvoke%
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>
