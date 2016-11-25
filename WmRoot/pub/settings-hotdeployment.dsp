<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Hot Deployment Settings</TITLE>
    <style> 
        .noshow {display: none;}
    </style>
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    <SCRIPT LANGUAGE="JavaScript">
    </SCRIPT>

  </HEAD>

   %ifvar doc equals('edit')%
      <BODY onLoad="setNavigation('settings-hotdeployment.dsp','/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_HotDeployment_Edit');">
   %else%
     <BODY onLoad="setNavigation('settings-hotdeployment.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_HotDeployment');">
   %endif%

    <TABLE width=100%>
      <TR>
        <TD class="breadcrumb" colspan="2">
          Settings &gt; Hot Deployment
          %ifvar doc equals('edit')%
            &gt; Edit Hot Deployment Settings
          %endif%
        </TD>
      </TR>
    
    
     %ifvar action equals('edit')%
        %invoke wm.server.hotdeployment:editHotDeploymentSettings%
          <TR><TD colspan="2">&nbsp;</TD></TR>
		  <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %onerror%
          <tr><td colspan="2">&nbsp;</td></tr>
		  <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
        %endinvoke%     
     %endif%

     %invoke wm.server.hotdeployment:getHotDeploymentSettings%
     %endinvoke%
         
    <TR>
        <TD colspan=2>
          <ul class="listitems">
            %ifvar doc equals('edit')%
                <LI class="listitem"><A HREF="settings-hotdeployment.dsp">Return to Hot Deployment Settings</a></li>
            %else%
                <LI class="listitem"><A HREF="settings-hotdeployment.dsp?doc=edit">Edit Hot Deployment Settings</a></li>
            %endif%
          </UL>
        </TD>
     </TR>
                  
        <TR>
            <TD valign=top>
                <TABLE class=%ifvar doc equals('edit')%"tableView" %else%"tableView"%endif%>
                <FORM NAME="editHotDeployment" ACTION="settings-hotdeployment.dsp" METHOD="POST">

                <TR>
                    <TD class="heading" colspan="2">Hot Deployment Settings</TD>
                </TR>
               
                <TR>
                  <TD class="oddrow">Enable</TD>
                  %ifvar doc equals('edit')%
                    <TD class="oddrow-l">
                      <input type="radio" name="Enable"  
                      %ifvar Enable equals('Yes')%
                        checked
                      %endif%  
                      value="Yes">Yes</input>
                     <input type="radio" name="Enable"  
                     %ifvar Enable equals('No')%
                       checked
                     %endif% 
                     value="No">No</input>
                  </TD>
                  %else%
                      <TD class="oddrowdata-l">
                          %ifvar Enable equals('Yes')%
                              Yes
                                %else%
                          No                      
                          %endif%
                      </TD>
                  %endif%
                </TR>
                
                <TR>
                  <TD class="evenrow">Timeout</TD>
                  %ifvar doc equals('edit')%
                  <TD class="evenrow-l">
                    <input type="text" name="Timeout" value="%value Timeout encode(htmlattr)%" maxlength=10> seconds
                  </TD>
                  %else%
                  <TD class="evenrowdata-l">
                    <script>writeEditNullable("%value doc encode(html_javascript)%", "Timeout", "%value Timeout encode(html_javascript)%");</script> seconds
                  </TD>
                  %endif%
                </TR>
                
                <TR>
                  <TD class="oddrow">Auto Recover</TD>
                  %ifvar doc equals('edit')%
                    <TD class="oddrow-l">
                      <input type="radio" name="AutoRecover"  
                      %ifvar AutoRecover equals('Yes')%
                      checked
                      %endif%  
                      value="Yes">Yes</input>
                      <input type="radio" name="AutoRecover"  
                      %ifvar AutoRecover equals('No')%
                      checked
                      %endif% 
                      value="No">No</input>
                    </TD>
                  %else%
                    <TD class="oddrowdata-l">
                  %ifvar AutoRecover equals('Yes')%
                          Yes
                            %else%
                       No                     
                      %endif%
                  </TD>
            %endif%
                </TR>
                
                %ifvar doc equals('edit')%
                <TR>
                  <TD colspan=2 class="action">
                    <INPUT TYPE="hidden" NAME="action" VALUE="edit">
                    <INPUT type="submit" value="Save Changes">
                  </TD>
                </TR>
                %endif%
              </TABLE>
            </TD>
        </TR>
       </FORM>
  </TABLE>
</BODY>
</HTML>
