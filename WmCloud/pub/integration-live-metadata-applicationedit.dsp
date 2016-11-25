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

<BODY onLoad="setNavigation('integration-live-metadata-applicationedit.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_webMethodsCloud_EditApplicationScrn');">

<FORM id ="applicationForm" NAME="applicationForm" action="integration-live-metadata-share.dsp" method="POST">
  <TABLE WIDTH="100%">
            <TR>
                <TD class="breadcrumb" colspan="3">
                   webMethods Cloud &gt; Applications &gt; Edit Application
                </TD>
            </TR>

            <TR>
                <TD colspan="3">
                    <UL class="listitems">
                        <LI><a href="integration-live-metadata-share.dsp">Return to webMethods Cloud Applications</a></LI>
                    </UL>
                </TD>
            </TR>
            <TR>
            <TD width="70%">
                              
              <TABLE WIDTH="100%" class="tableView">
                <TR>
                  <TD class="heading" colspan="2">webMethods Cloud Application</TD>
                </TR>
                %invoke wm.client.integrationlive.metadatashare:getApplicationForDisplay%
                %endinvoke%
                <input type="hidden" name="restrictedChars" id="restrictedChars" value="%value encode(htmlattr) restrictedChars%"/>
                <TR>
                  <TD class="oddrow" nowrap>Name</TD>
                  <TD class="oddrow-l">
                       <INPUT NAME="applicationName" id="applicationName" TYPE="TEXT" VALUE="%value encode(htmlattr) applicationName%" SIZE="50" readonly="true" style="color:#808080;"/>
                   </TD>
                </TR>
                <TR>
                  <TD class="evenrow" nowrap>Description</TD>
                  <TD class="evenrow-l">
                       <INPUT NAME="description" id="description" TYPE="TEXT" VALUE="%value encode(htmlattr) description%" SIZE="85" />
                   </TD>
                </TR>
                <TR>
                  <TD class="oddrow" nowrap>Assign Services to Application</TD>
                  <TD class="oddrow-l" nowrap>
                  
                   <TABLE width="100%">
                     <TR>
                        <TD width="55%"><b>Package/Services</b></TD>
                        <TD width="25%"><b>Batch Data</b></TD>
                        <TD width="20%"><b>Display Name</b></TD>
                      </TR>
                      <TR>
                        <TD width="55%">&nbsp;</TD>
                        <TD width="25%">&nbsp;</TD>
                        <TD width="20%">&nbsp;</TD>
                      </TR>
                   %loop packages%
                        <TBODY width="100%">
                          <TR title="%value name%">
                            <TD colspan="2">
                              <a onclick="toggle(this,'%value encode(javascript) name%');">
                                <img id="img%value name%" class="imgStyle" src="images/plus.gif"/><label class=".label"> &nbsp;%value encode(htmlall) name% </label>
                                %ifvar isShared equals('true')%
                                <img src="images/green_check.gif"/>
                                %endif%
                              </a>
                            </TD>
                          </TR>
                        </TBODY>
                        <TBODY id="%value encode(htmlall) name%">
                        </TBODY>                
            %endloop%
              <TR>
                        <TD width="55%">&nbsp;</TD>
                        <TD width="25%">&nbsp;</TD>
                        <TD width="20%">&nbsp;</TD>
                      </TR>
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
            <FORM name="appSubmitForm" id="appSubmitForm"  action="integration-live-metadata-share.dsp" method="POST" onsubmit="return validateData();">
              <input type="hidden" name="operation" value="save"/>
              <input type="hidden" name="applicationName" id="submitAppName"/>
              <input type="hidden" name="description" id="submitDesc" />
        <TD class="action" >
          <input type="submit" name="submit" value="Save Changes" onclick="submitForm()"/>
        </TD>
         <TD width="28%">
          &nbsp;
        </TD>
        </FORM>
      </TR>
    </TABLE>
</BODY>
</HTML>
