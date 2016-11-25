<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Integration Server Packages</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <script src="webMethods.js.txt"></script>
    <script src="packagefilter.js.txt"></script>

    <SCRIPT LANGUAGE="JavaScript">
      function confirmDelete(pkg, safe)
      {
        if(pkg == "WmRoot")
        {
            alert("'WmRoot' cannot be deleted");
            return false;
        }
        var s1 = "OK to Delete the '"+pkg+"' package?\n\n";
        var s2 = "Package will be sent to the salvage directory\n";

        if(safe == "true")
        {
          return confirm(s1+s2);
        }
        else
        {
          return confirm(s1);
        }
      }

      function confirmReload(pkg,pkgType)
      {
         if (pkg == "WmRoot")
         {
            alert("'WmRoot' cannot be reloaded");
            return false;
         }
         var s1 = "OK to reload the `"+pkg+"' package?\n\n";
         var s2 = "Reloading a package may cause sessions currently using\n";

         var s3 = "services in that package to fail.\n";
         var doReload;
         doReload = confirm (s1+s2+s3);
         if(doReload)
         {
            var sNativeWarning = "Warning: This package contains native code\n";
            var sNativeWarning2 = "libraries.  You must restart the server\n";

            var sNativeWarning3 = "to reload Java services.\n";
            if(pkgType == "2")
            alert(sNativeWarning+sNativeWarning2+sNativeWarning3);
         }
         return doReload;
      }

      function confirmDisable (pkg)
      {
         if(pkg == "WmRoot")
         {
            alert("'WmRoot' cannot be disabled");
            return false;
         }
         var s1 = "OK to disable the `"+pkg+"' package?\n\n";
         var s2 = "Disabling a package causes all its services to be \n";
         var s3 = "unloaded and marked unavailable for use.\n";
         return confirm (s1+s2+s3);
      }

      function confirmEnable (pkg)
      {
         var s1 = "OK to enable the `"+pkg+"' package?\n\n";
         var s2 = "Enabling a package causes all its services to be \n";
         var s3 = "loaded and marked available for use.\n";
         return confirm (s1+s2+s3);
      }

      function loadDocument()
      {
         setNavigation('package-list.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_MngmtScrn');
         if(window.history.replaceState && window.location.search.indexOf('action') != -1) {
            window.history.replaceState({},'Integration Server Packages',window.location.origin + window.location.pathname);
         }
      }
    </script>
  </head>

   <body onLoad="loadDocument();">
      <div class="position">
         <table width="100%">
            <tr>
               <td class="breadcrumb" colspan=2>Packages &gt; Management</TD>
            </TR>
    %ifvar action%
      %switch action%
        %case 'archive'%
          %invoke wm.server.replicator:packageRelease%
              %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
                  <TR><TD class="message" colspan=2>%value  message encode(html)%</TD></TR>
              %endif%
          %onerror%
              %ifvar errorMessage%
      <tr><td colspan="2">&nbsp;</td></tr>
                  <TR><TD class="message" colspan=2>%value  errorMessage encode(html)%</TD></TR>
              %endif%
          %endinvoke%
        %case 'enable'%
          %invoke wm.server.packages:packageEnable%
            %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
              <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
            %endif%
          %endinvoke%
        %case 'disable'%
          %invoke wm.server.packages:packageDisable%
            %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
              <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
            %endif%
          %endinvoke%
        %case 'reload'%
          %invoke wm.server.packages.adminui:packageReload%
            %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
              <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
            %endif%
          %endinvoke%
        %case 'delete'%
          %invoke wm.server.packages.adminui:packageDelete%
            %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
              <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
            %endif%
          %endinvoke%
        %case 'backup'%
          %invoke wm.server.packages:backup%
            %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
              <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
            %endif%
          %endinvoke%
      %endswitch%
    %endif action%

     %invoke wm.server.packages:packageList%
            <tr>
                <td colspan="2">
                    <ul class="listitems">
                        <li><a href="package-inbound.dsp?mode=inbound">Install Inbound Releases</a>
                        <li><A HREF="package-manage.dsp?mode=inactive">Activate Inactive Packages</a></li>
                        <li><a href="package-recover.dsp">Recover Packages</a></li>
                        <li><a href="service-list.dsp">Browse Folders</a></LI>
                        <li><a href="package-locks.dsp">View Locked Elements</a></li>
                        <li id="showfew" name="showfew"><a href="javascript:showFilterPanel(true)">Filter Packages</a></li>
                        <li style="display:none" id="showall" name="showall"><a href="package-list.dsp">Show All Packages</a></li>
                        <div id="filterContainer" name="filterContainer" style="display:none;padding-top=2mm;">
                        <br>
                <table>
                <tr valign="top">
                <td>
                     <span>Filter criteria</span><br>
                     <input type="text" id="pfilter" name="pfilter" onKeyPress="filterPackages(event)"/>
                </td>

                <td>

                  <table><tr><td>
                    <input type="radio" id="enablep" name="enablep" onclick="setFlag('enabled')"/>
                    <span id="enabletitle" name="enabletitle">Include Enabled Packages</span>

                </td></tr><tr><td>
                    <input type="radio" id="enablep" name="enablep" onclick="setFlag('disabled')"/>
                    <span id="disabletitle" name="disabletitle">Include Disabled Packages</span>

                </td></tr><tr><td>
                    <input type="radio" id="enablep" name="enablep" checked onclick="setFlag('both')"/>
                    <span id="enabletitle" name="enabletitle">Include Both</span>

                  </td></tr></table>

                </td> <td>
                  <input type="checkbox" id="nested" name="nested" />
                              <span id="nesttitle" name="nesttitle">Filter on result</span>
                </td> <td>
                  <input type="checkbox" id="exclude" name="exclude" />
                              <span id="excludetitle" name="excludetitle">Exclude from result</span>
                </td> <td>
                              <input type="Button" id="submit" name="submit" value="Submit" onclick="filterPackagesInternal()"/>
                        </td> </tr></table>
                        </DIV>
                    </UL>
                </TD>
            </TR>
            <TR>
          <TD id="result" colspan="2" align="right"></TD>
        </TR>
        <TR>
        <td>
        <table class="tableView" width="100%" id="head" name="head">
          <tr>
            <td class="heading" colspan="8">Package List</td>
          </tr>
          <TR class="subheading2">
            <TD>Package Name</TD>
            <TD>Home</TD>
            <TD>Reload</TD>
            <TD>Enabled</TD>
            <TD>Loaded</TD>
            <TD>Archive</TD>
            <TD>Safe Delete</TD>
            <TD>Delete</TD>
          </TR>
            <script>resetRows();</script>
            %loop packages%
            <TR >
               <td class="field">
               			<A HREF="package-info.dsp?package=%value name encode(url)%">%value name encode(html)%</A>
               </TD>
               <script>writeTD('rowdata');</script>
                       %ifvar enabled equals('true')%
										<A class="imagelink" HREF="/%value name encode(htmlattr)%/" TARGET="newwindow">
                                        <IMG SRC="icons/icon_home.png" border="0"
                                        alt="Home Page for Package"></A>
                                    %else%
										<A class="imagelink" HREF="/%value name encode(htmlattr)%/" onclick="alert('Home Page is unavailable when package is disabled.'); return false;">
                                        <IMG SRC="icons/icon_home.png" border="0"
                                        alt="Home Page for Package"></A>
                                    %endif%
                             </TD>
               <script>writeTD('rowdata');</script>
                  <A class="imagelink" HREF="package-list.dsp?action=reload&package=%value name encode(url)%"  ONCLICK="return confirmReload('%value name encode(javascript)%','%value pkgType encode(javascript)%');">
                  <IMG SRC="icons/icon_reload.png" border="0"
                  alt="Reload Package"></A></TD>
               <script>writeTD('rowdata');</script>
                  %ifvar enabled equals('true')%
                  <A class="imagelink" HREF="package-list.dsp?action=disable&package=%value name encode(url)%"
                  ONCLICK="return confirmDisable('%value name encode(javascript)%');"><IMG SRC="images/green_check.png" border="0"
                  height=13 width=13>Yes</A>
                  %else%
                  <A class="imagelink" HREF="package-list.dsp?action=enable&package=%value name encode(url)%"
                  ONCLICK="return confirmEnable('%value name encode(javascript)%');"><IMG border="0" SRC="images/blank.gif" height=13 width=13>No</A>
                  %endif%</TD>
               <script>writeTD('rowdata');</script>
                  %ifvar loaderr equals('0')%
                    %ifvar enabled equals('false')%
                      <IMG SRC="images/blank.gif" height=13 width=13
                      alt="Disabled"> No
                    %else%
                        %ifvar loadwarning equals('0')%
                              <IMG SRC="images/green_check.png" height=13 width=13 alt="Loaded"> Yes
                          %else%
                              <IMG SRC="images/yellow_check.png" height=13 width=13 alt="Warnings during load."> <font color="red"> Warnings </font>
                          %endif%
                    %endif%
                  %else%
                    %ifvar loadok equals('0')%
                      <IMG SRC="images/blank.gif" height=13 width=13
                      alt="Load Errors"> No
                    %else%
                      <IMG SRC="images/yellow_check.png" height=13 width=13 alt="Error during load."> <font color="red">Partial</font>
                    %endif%
                  %endif%
               </TD>
         <script>writeTD('rowdata');</script>
                  <A class="imagelink"  HREF="package-archive.dsp?package=%value name encode(url)%&archive=true">
                     <IMG src="images/archive_package.png" border=0 width=43 height=16></A></TD>
         </td>
               <script>writeTD('rowdata');</script>
                  <A class="imagelink"  HREF="package-list.dsp?action=delete&package=%value name encode(url)%&safeDelete=checked"
                     onclick="return confirmDelete('%value name encode(javascript)%', 'true');"><IMG src="images/safe_delete.png" border=0 width=43 height=16></A></TD>
               <script>writeTD('rowdata');swapRows();</script>
                  <A class="imagelink" HREF="package-list.dsp?action=delete&package=%value name encode(url)%"
                     onclick="return confirmDelete('%value name encode(javascript)%', 'false');"><IMG SRC="icons/delete.png" alt="Delete this Package" border="0"></A></TD>
            </TR> %endloop%
            </TABLE></TD></TR>
         </TABLE> %endinvoke%
         
         %ifvar pfilter -notempty%
         <script>
             showFilterPanel();

             var pfilter = document.getElementById("pfilter");
         	pfilter.value="%value pfilter encode(javascript)%"

             %ifvar regex -notempty%
             var regex = document.getElementById("regex");
             pfilter.checked=true;
             %endif%

             %ifvar exclude -notempty%
        var excludeFromResult = document.getElementById("exclude");
        excludeFromResult.checked=true;
             %endif%

        filterPackagesInternal();

         </script>
          %endif%

      </div>
   </body>
</html>
