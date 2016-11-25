<HTML>
<HEAD>
    <META http-equiv="Pragma" content="no-cache">
    <META http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">

    <TITLE>Integration Server Settings</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css">
    <LINK REL="stylesheet" TYPE="text/css" HREF="metadata.css">
    <SCRIPT SRC="/WmRoot/webMethods.js.txt"></SCRIPT>
    <SCRIPT SRC="jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT SRC="metadata.js"></SCRIPT>
</HEAD>

<BODY onLoad="setNavigation('integration-live-metadata-docker-services.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_webMethodsCloud_DefineApplicationScrn');">

<FORM id ="applicationForm" NAME="applicationForm" action="integration-live-metadata-docker-services.dsp" method="POST">
     %ifvar operation -notempty%
        %invoke wm.client.integrationlive.metadatashare:saveDockerServices%
            %ifvar message%
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td class="message" colspan="2">%value message%</td></tr>
            %endif%
            %onerror%
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td class="message" colspan=2>%value errorMessage%</td></tr>
            %endinvoke%
     %endif%
  <TABLE WIDTH="100%">
            <TR>
             <TD width="70%">
                <TABLE WIDTH="100%" class="tableView">
                    <TR>
                        <TD class="heading" colspan="2">webMethods Cloud Docker Services</TD>
                    </TR>
                    <TR>
                        <TD class="oddrow" nowrap>Selected Docker Services</TD>
                        <TD class="oddrow-l" nowrap>
                        %invoke wm.client.integrationlive.metadatashare:getDockerServicePackages%
                        %endinvoke%
                           <TABLE width="100%">
                               <TR class="subheading2">
                                    <TD width="55%"><b>Package</b></TD>
                                    <TD width="25%" nowrap align="left"><b>Docker Services</b></TD>
                               </TR>
                               %loop packages%
                                 <TR>
                                     <TD>%value packageName%
                                     <input type="hidden" name="packageName" id="packageName" value="%value packageName%"/>
                                     </TD>
                                     <TD>
                                        <textarea name="dockerServices" id="dockerServices" rows="5" cols="40" >%value dockerServices%</textarea>
                                     </TD>
                                 </TR>
                               %endloop%
                        </TABLE>    
                         </TD>
                       </TR>
                </TABLE>
             </TD>
             <TD width="28%">
              &nbsp;
             </TD>
             </FORM>
            </TR>
            <TR>
                <TD  class="action" >
                    <input type="hidden" name="operation" value="save"/>
                    <input type="hidden" name="packageName"/>
                    <input type="hidden" name="dockerServices"/>
                    <input type="submit" name="submit" value="Save Changes" onclick="submitForm();"/>
                </TD>
                 <TD width="28%">
                  &nbsp;
                </TD>
            </TR>
    </TABLE>
</BODY>

</HTML>
