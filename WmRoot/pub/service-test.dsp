<HTML>
   <HEAD>
   <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
   <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
   <script>
   function setTestWithArgs(args)
   {
   		document.getElementById("withargs").value = args;
   		document.testform.submit();
   }
   </script>
   </HEAD>
    <BODY onLoad="setNavigation('package-list.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_TestSvcsScrn');">
      <TABLE width="100%">
         <TR>
            <TD class="breadcrumb" colspan="2">
                Packages &gt;
                Management &gt;
                Services &gt;
                %value service encode(html)% &gt;
                Test
            </TD>
         </TR>
         <TR>
          <TD colspan=2>
            <UL class="listitems">
              <li><a href="service-info.dsp?interface=%value interface encode(url)%&service=%value service encode(url)%">Return to %value service%</a></li>
            </UL>
          </TD>
        </TR>

         <TR>
            <TD>
               <TABLE class="tableView" CELLPADDING=2> %ifvar interface%
                %invoke wm.server.xidl.adminui:testService%
                  <FORM name="testform" method="post" action="/invoke/wm.server.xidl:testServiceWrapper">
                     <TR>
                        <TD class="heading" colspan=2>Assign Input Values</TD>
		               <INPUT name="interface" type="HIDDEN"  value="%value interface encode(htmlattr)%"/>
		               <INPUT name="service" type="HIDDEN"  value="%value service encode(htmlattr)%"/>
			            <INPUT name="withargs" id="withargs" type="HIDDEN"  value="%value withargs encode(htmlattr)%"/>
                     </TR>
                     <!-- - - - Inputs Section - - - -->
                     %ifvar input% %loop input/rec_fields%
                     <TR>
                        <script>writeTD("row");</script>
                        %ifvar field_opt equals('true')%<i>%endif%
                        %value field_name encode(html)% &nbsp;&nbsp;%ifvar field_opt equals('true')%</i>%endif%


                        %switch field_type%
                            %case 'string'%
                            <script>writeTD("row-l");</script>
                            <INPUT name="%value field_name encode(htmlattr)%" value="" %ifvar node_hints/field_password equals('true')%type="PASSWORD" autocomplete="off"%endif%></TD>

                            %case 'record'%
                            <script>writeTD("row-l");swapRows();</script>
                                <TABLE CELLPADDING=2> %loop rec_fields%
                                <TR>
                                <script>writeTD("row");</script>
                                %value field_name encode(html)% &nbsp;&nbsp;</TD>
                                <script>writeTD("row-l");</script>
                                <INPUT name="%value field_name encode(htmlattr)%" value="" %ifvar node_hints/field_password equals('true')%type="PASSWORD" autocomplete="off"%endif%>
                                </TD>
                                </TR>
                                %endloop%
                                </TABLE>
                            <script>swapRows();</script>
                            </TD>

                            %case 'object'%
                            <script>writeTD("row-l");</script>
                            (Can't input objects)</TD>
                        %endswitch%
                        </TR>
                        <script>swapRows();</script>
                        %endloop%  %else%
                     <TR>
                        <TD class="oddrow-l" colspan=2> No inputs to assign.  If
                           inputs are required, make sure this  service has a
                           registered signature.  Otherwise, click "Test"  to
                           test this service with no inputs.  </TD>
                     </TR> %endif%
                     <TR>
                        <TD class="action" colspan=2>%ifvar input%<INPUT class="button2" type="button" value="Test (with inputs)"
                           onclick="javascript:setTestWithArgs('true');"></input>
                           %endif%

                           <INPUT class="button2" type="button" value="Test (without inputs)"
                           onclick="javascript:setTestWithArgs('false');"></input></TD>
                     </TR>

                  </FORM> %endinvoke%  %else%
                  <FORM name="testform" method="post"
                     action="service-test.dsp">
                     <TR class="breadcrumb">
                        <TD colspan="2">Test a Service</TD>
                     </TR>
                     <TR>
                        <TD class="action" colspan=2>
                           <INPUT type="button" value="Test"
                           onclick="document.testform.submit();"> </TD>
                     </TR>
                     <TR class="heading">
                        <TD colspan=2>Specify Service to Test</TD>
                     </TR>
                     <TR>
                        <TD class="oddrow">Interface</TD>
                        <TD class="oddrowdata">
                           <INPUT name="interface">
                           </INPUT></TD>
                     </TR>
                     <TR>
                        <TD class="oddrow">Service</TD>
                        <TD class="oddrowdata">
                           <INPUT name="service">
                           </INPUT></TD>
                     </TR>

                  </FORM> %endif%
               </TABLE> </TD>
         </TR>
      </TABLE>
   </BODY>
</HTML>
