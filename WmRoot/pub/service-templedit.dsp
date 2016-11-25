<HTML>
   <HEAD>
   <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">
   <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
   </HEAD>
   <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
   <BODY>
      <FORM name="editform" action="service-templedit.dsp" method="POST">
         <INPUT type="hidden" name="action" value="save">
         <INPUT type="hidden" name="service" value="%value service encode(htmlattr)%">
         <TABLE WIDTH=100%>
            <TR>
                <TD class="breadcrumb" colspan=2>
                    Packages &gt;
                    Management &gt;
                    Services &gt;
                    %value service encode(html)% &gt;
                    Edit template</TD>
            </TR>
         <TR>
          <TD colspan=2>
            <ul class="listitems">
              <li><a href="service-info.dsp?service=%value service encode(url)%">Return to %value service encode(html)%</a></li>
            </UL>
          </TD>
        </TR>
            <TR>
               <TD>
                  <TABLE width="100%">
                     <TR>
                        <TD class="heading">%value service encode(html)%</TD>
                     </TR>
                     <INPUT type="hidden" name="package" value="%value package encode(htmlattr)%">
                     <INPUT type="hidden" name="template" value="%value template encode(htmlattr)%">
                      %ifvar action equals('save')%
                        %invoke  wm.server.services.adminui:saveTemplate%
                        %ifvar message%                     <TR>
                        <TD id="message">%value message encode(html)%</TD>
                     </TR>
                     <TR>
                        <TD class="heading">Template</TD>
                     </TR> %endif%  %onerror%
                     <TR>
                        <TD id="message">%value error encode(html)%: %value errorMessage encode(html)%
                        </TD>
                     </TR>
                     <TR>
                        <TD class="heading">Template (not saved)</TD>
                     </TR> %endinvoke%  %endif%
                     %invoke wm.server.services.adminui:loadTemplate%
                     <TR>
                        <TD class="rowdata">
                           <TEXTAREA wrap="off" name="src" cols=40 rows=15 style="width:100%">%ifvar ../src%%value ../src encode(html)%%else%%value src encode(html)%%endif%</TEXTAREA>
                        </TD>
                     </TR>
                     %endinvoke%

                     <TR>
                        <TD class="action">
                           <INPUT type="button"
                           onclick="document.editform.submit();"
                           value="Save Changes"></TD>
                     </TR>

                     </TABLE> </TD>
               </TR>
            </TABLE>
         </FORM>
      </BODY>
   </HTML>
