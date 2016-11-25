<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Service List</TITLE>

    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    <SCRIPT LANGUAGE="JavaScript">
    var currentInterface = "";
    function confirmDelete (svc)
    {
      var msg = "OK to delete '"+svc+"' service?";
      return confirm (msg);
    }
    function aclAssign ()
    {
    }
  var effectiveACL = 0;
  var effectiveACLBrowse = 0;
  var effectiveACLRead = 0;
  var effectiveACLWrite = 0;

    </SCRIPT>

  </HEAD>

  <BODY onLoad="setNavigation('package-list.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_BrowseFldrScrn');">
    <TABLE WIDTH=100%>
      <TR>
        <TD class="breadcrumb" colspan=2>
          Packages &gt;
          Management &gt;
          Folders &gt;
          %ifvar interface% <script>currentInterface="%value interface encode(html_javascript)%";document.write(currentInterface.replace(/\./g, " &gt; "  ));</script> %else% Top Level%endif%
        </TD>
      </TR>
        %ifvar action%
          %switch action%
            %case 'aclassign'%
              %invoke wm.server.access:aclAssign%
                %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
                  <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
                %endif%
              %endinvoke%
            %endswitch%
          %endif%

          %invoke wm.server.access.adminui:aclList%
          %invoke wm.server.xidl.adminui:getInterfacesPlus%

          %ifvar parent%
            <TR>
              <TD colspan=2>
                <ul class="listitems">
                  <li><a href="package-list.dsp">Return to Package Management</a></li>
                  <li><a href="service-list.dsp?interface=%value /parent encode(url)%">Up one level</A> (<script>document.write("%value /parent encode(html_javascript)%".replace(/.*\./g, ""  ));</script>)</LI>
                </UL>
              </TD>
            </TR>
          %else%
            %ifvar interface%
            <TR>
              <TD colspan=2>
                <ul class="listitems">
                  <li><a href="package-list.dsp">Return to Package Management</a></li>
                  <li><a href="service-list.dsp">Up one level</A> Top Level</LI>
                </UL>
              </TD>
            </TR>
            %else%
            <TR>
              <TD colspan=2>
                <ul class="listitems">
                  <li><a href="package-list.dsp">Return to Package Management</a></li>
                </UL>
              </TD>
            </TR>
            %endif%
          %endif%
      <TR>
        <TD>
          <TABLE class="tableView">
          <TR>
            <TD class="heading" colspan=7>Folder List</TD>
          </TR>
            <TR>
              <TD class="oddcol-l">Folders</TD>
              <TD class="oddcol-l">List ACL</TD>
              <TD class="oddcol-l">Read ACL</TD>
              <TD class="oddcol-l">Write ACL</TD>
              <TD class="oddcol-l">Execute ACL</TD>
              <TD class="oddcol">Folders</TD>
              <TD class="oddcol">Services</TD>
            </TR>

          %ifvar interfaces%
            <script>resetRows();</script>
            %loop interfaces%
            <TR>
              <script>writeTD("rowdata-l");</script><nobr>&nbsp;&nbsp;<A HREF="service-list.dsp?interface=%value fullname%"><IMG src="icons/dir.png" border=0></A>&nbsp;
                <A HREF="service-list.dsp?interface=%value fullname encode(url)%"><script>document.write(" %value fullname encode(html_javascript)%".replace(currentInterface + ".", ""  ));</script></A></nobr></TD>

              <script>writeTD("rowdata-l");</script>

                %ifvar browseaclgroup -notempty%
                    <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">%value browseaclgroup encode(html)%</A>
                %else%
                   %ifvar effectiveAclBrowse -notempty%
                      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value effectiveAclBrowse encode(html)%&gt;</A>
                   %else%
                      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value /parentbrowseaclgroup encode(html)%&gt;</A>
                   %endif%
                   <script>
                  effectiveACLBrowse++;
               </script>
                %endif%
              </TD>

              <script>writeTD("rowdata-l");</script>
                %ifvar readaclgroup -notempty%
                    <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">%value readaclgroup encode(html)%</A>
                %else%
                   %ifvar effectiveAclRead -notempty%
                      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value effectiveAclRead encode(html)%&gt;</A>
                   %else%
                      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value /parentreadaclgroup encode(html)%&gt;</A>
                   %endif%
                   <script>
                  effectiveACLRead++;
               </script>
                %endif%
              </TD>

              <script>writeTD("rowdata-l");</script>
                %ifvar writeaclgroup -notempty%
                    <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%">%value writeaclgroup encode(html)%</A>
                %else%
                   %ifvar effectiveAclWrite -notempty%
                      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%">&lt;%value effectiveAclWrite encode(html)%&gt;</A>
                   %else%
                      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%">&lt;%value /parentwriteaclgroup encode(html)%&gt;</A>
                   %endif%
                   <script>
                  effectiveACLWrite++;
               </script>
                %endif%
              </TD>

              <script>writeTD("rowdata-l");</script>
                %ifvar acl -notempty%
                    <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">%value acl encode(html)%</A>
                %else%
                   %ifvar effectiveAcl -notempty%
                      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value effectiveAcl encode(html)%&gt;</A>
                   %else%
                      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value fullname encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value /parentexecuteaclgroup encode(html)%&gt;</A>
                   %endif%
                   <script>
                  effectiveACL++;
               </script>
                %endif%
              </TD>

              <script>writeTD("rowdata");</script>%value numIfc encode(html)%</TD>
              <script>writeTD("rowdata");</script>%value numSvc encode(html)%</TD>
            </TR>
              <script>swapRows();</script>
            %endloop%
         %else%
          <TR>
            <TD class="evenrow-l" colspan=7>No sub-folders</TD>
          </TR>
         %endif%
       </TABLE>
      <BR>
      <TABLE class="tableView">
      <TR>
        <TD class="heading" colspan=6>Service List</TD>
      </TR>
      <TR>
        <TD class="oddcol-l">Service Name</TD>
        <TD class="oddcol-l">List ACL</TD>
        <TD class="oddcol-l">Read ACL</TD>
        <TD class="oddcol-l">Write ACL</TD>
        <TD class="oddcol-l">Execute ACL</TD>
        <TD class="oddcol">Test</TD>
      </TR>

      %ifvar services%
      <script>resetRows();</script>
      %loop services%
      <TR>
        <script>writeTD("rowdata-l");</script>
         <nobr><A HREF="service-info.dsp?service=%value /interface encode(url)%:%value name encode(url)%&browsefolders=true"><IMG src="icons/file.png" border=0></A>&nbsp;<A valign="middle" HREF="service-info.dsp?service=%value /interface encode(url)%:%value name encode(url)%&browsefolders=true">%value name encode(html)%</A></nobr></TD>

        <script>writeTD("rowdata-l");</script>
        %ifvar browseaclgroup -notempty%
	   <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">%value browseaclgroup encode(html)%</A>
        %else%
           %ifvar effectiveAclBrowse -notempty%
              <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value effectiveAclBrowse encode(html)%&gt;</A>
           %else%
  	      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value /parentbrowseaclgroup encode(html)%&gt;</A>
           %endif%
           <script>
          effectiveACLBrowse++;
       </script>
        %endif%
        </TD>

        <script>writeTD("rowdata-l");</script>
        %ifvar readaclgroup -notempty%
	   <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">%value readaclgroup encode(html)%</A>
        %else%
           %ifvar effectiveAclRead -notempty%
              <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value effectiveAclRead encode(html)%&gt;</A>
           %else%
  	      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value /parentreadaclgroup encode(html)%&gt;</A>
           %endif%
           <script>
          effectiveACLRead++;
       </script>
        %endif%
        </TD>

        <script>writeTD("rowdata-l");</script>
        %ifvar writeaclgroup -notempty%
	   <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">%value writeaclgroup encode(html)%</A>
        %else%
           %ifvar effectiveAclWrite -notempty%
              <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value effectiveAclWrite encode(html)%&gt;</A>
           %else%
  	      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value /parentwriteaclgroup encode(html)%&gt;</A>
           %endif%
           <script>
          effectiveACLWrite++;
       </script>
        %endif%
        </TD>

        <script>writeTD("rowdata-l");</script>
        %ifvar acl -notempty%
	   <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">%value acl encode(html)%</A>
        %else%
           %ifvar effectiveAcl -notempty%
              <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value effectiveAcl encode(html)%&gt;</A>
           %else%
  	      <A href="acl-assign.dsp?parent=%value /interface encode(url)%&interface=%value /interface encode(url)%&service=%value name encode(url)%&acl=%value acl encode(url)%&browseaclgroup=%value browseaclgroup encode(url)%&readaclgroup=%value readaclgroup encode(url)%&writeaclgroup=%value writeaclgroup encode(url)%&effectiveAcl=%value effectiveAcl encode(url)%&effectiveAclBrowse=%value effectiveAclBrowse encode(url)%&effectiveAclRead=%value effectiveAclRead encode(url)%&effectiveAclWrite=%value effectiveAclWrite encode(url)%&parentexecuteaclgroup=%value /parentexecuteaclgroup encode(url)%&parentbrowseaclgroup=%value /parentbrowseaclgroup encode(url)%&parentreadaclgroup=%value /parentreadaclgroup encode(url)%&parentwriteaclgroup=%value /parentwriteaclgroup encode(url)%">&lt;%value /parentexecuteaclgroup encode(html)%&gt;</A>
           %endif%
           <script>
          effectiveACL++;
       </script>
        %endif%
        </TD>

        <script>writeTD("rowdata");</script>
          <A href="service-test.dsp?interface=%value /interface encode(url)%&service=%value name encode(url)%">
          <IMG src="icons/checkdot.png" border=0>
          </A>
        </TD>

      </TR>
        <script>swapRows();</script>
      %endloop%
         %else%
          <TR>
            <TD class="evenrow-l" colspan=6>No services in this folder</TD>
          </TR>

      %endif%
      </TABLE>
    <script>
    if ((effectiveACL > 0) || (effectiveACLBrowse > 0) || (effectiveACLRead > 0) || (effectiveACLWrite > 0))
    {
      document.write("<BR>");
        document.write("<> ACL setting inherited from parent.");
    }
    </script>
      </TD></TR>

    </TABLE> %endinvoke%  %endinvoke%
  </BODY>
</HTML>
