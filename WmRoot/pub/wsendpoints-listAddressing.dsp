%invoke wm.server.ws:listMessageAddressingEndpoints%

   <TR manualhide="true" id="Addressing%value transportType encode(htmlattr)%ToggleRow" onClick="toggle(this, 'Addressing%value transportType encode(javascript)%Row', 'Addressing%value transportType encode(javascript)%Img');">
        <TD class="subHeading" style="cursor: pointer;" colspan=10><img id='Addressing%value transportType encode(htmlattr)%Img' src="images/collapsed_blue.gif" border="0"> <a name="anchorAddressing%value transportType encode(htmlattr)%">%value transportType encode(html)%</a></TD>
    </TR>
  <script>
    resetRows();
  </script>
%loop endpoints%
<TR name="Addressing%value ../transportType encode(htmlattr)%Row" style="display: none;">
    <script>writeTD("rowdata-l");</script>
        <a
	   href="settings-wsendpoints-addedit.dsp?action=view&alias=%value alias encode(url)%&type=addressing&transportType=%value transportInfo/transportType encode(url)%"
        >%value alias encode(html)%</a>
    </TD>

    <!-- <script>writeTD("row-l");</script>%value transportInfo/transportType encode(html)%</TD> -->
    <script>writeTD("row-l");</script>%value description encode(html)%</TD>
    <script>writeTD("rowdata");</script>
     <a class="imagelink" href="" onClick="return confirmDelete('%value alias%','addressing', '%value transportInfo/transportType encode(javascript)%');">
     <a class="imagelink" href="" onClick="return confirmDelete('%value alias encode(javascript)%','addressing', '%value transportInfo/transportType%');">
     <img src="icons/delete.png" alt="Delete alias : %value alias encode(htmlattr)%" border="none"></a>
    </TD>

</TR>

    <script>swapRows();</script>
%endloop%
%endinvoke%
<script>checkPrevState("Addressing%value transportType encode(javascript)%ToggleRow", "Addressing%value transportType encode(javascript)%Row", "Addressing%value transportType encode(javascript)%Img");</script>
