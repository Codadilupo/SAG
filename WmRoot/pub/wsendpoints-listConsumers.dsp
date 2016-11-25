%invoke wm.server.ws:listConsumerEndpoints%

    <TR manualhide="true" id="Consumer%value transportType encode(htmlattr)%ToggleRow" onClick="toggle(this, 'Consumer%value transportType encode(javascript)%Row', 'Consumer%value transportType encode(javascript)%Img');">
        <TD class="subHeading" style="cursor: pointer;" colspan=10><img id="Consumer%value transportType encode(htmlattr)%Img" src="images/collapsed_blue.gif" border="0"> <a name="anchorConsumer%value transportType% encode(htmlattr)">%value transportType encode(html)%</a></TD>
    </TR>
    <script>
        resetRows();
    </script>
%loop endpoints%
<TR name="Consumer%value ../transportType encode(htmlattr)%Row" style="display: none;">
    <script>writeTD("rowdata-l");</script>
        <a
	   href="settings-wsendpoints-addedit.dsp?action=view&alias=%value alias encode(url)%&type=consumer&transportType=%value transportInfo/transportType encode(url)%"
        >%value alias encode(html)%</a>
    </TD>

    <!-- <script>writeTD("row-l");</script>%value transportInfo/transportType encode(html)%</TD> -->
    <script>writeTD("row-l");</script>%value description encode(html)%</TD>
    <script>writeTD("rowdata");</script>
     <a class="imagelink" href="" onClick="return confirmDelete('%value alias%','consumer', '%value transportInfo/transportType encode(javascript)%');">
     <a class="imagelink" href="" onClick="return confirmDelete('%value alias encode(javascript)%','consumer', '%value transportInfo/transportType%');">
     <img src="icons/delete.png" alt="Delete alias : %value alias encode(htmlattr)%" border="none"></a>
    </TD>

</TR>

    <script>swapRows();</script>
%endloop%
%endinvoke%
<script>checkPrevState("Consumer%value transportType encode(javascript)%ToggleRow", "Consumer%value transportType encode(javascript)%Row", "Consumer%value transportType encode(javascript)%Img");</script>
