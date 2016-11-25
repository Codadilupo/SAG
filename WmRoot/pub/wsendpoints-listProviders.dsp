%invoke wm.server.ws:listProviderEndpoints%

    <TR manualhide="true" id="Provider%value transportType encode(htmlattr)%ToggleRow" onClick="toggle(this, 'Provider%value transportType encode(javascript)%Row', 'Provider%value transportType encode(javascript)%Img');">
        <TD class="subHeading" style="cursor: pointer" colspan=10><img id="Provider%value transportType encode(htmlattr)%Img" src="images/collapsed_blue.gif" border="0"> <a name="anchorProvider%value transportType encode(htmlattr)%">%value transportType encode(html)%</a></TD>
    </TR>
    
    <script>
        resetRows();
    </script>
    %loop endpoints%
		<TR name="Provider%value ../transportType encode(htmlattr)%Row" style="display:none;">
        <script>writeTD("rowdata-l");</script>
            <a
			href="settings-wsendpoints-addedit.dsp?action=view&alias=%value alias encode(url)%&type=provider&transportType=%value transportInfo/transportType encode(url)%"
		>%value alias encode(html)%</a>
        </TD>
		    <script>writeTD("row-l");</script>%value description encode(html)%</TD>
            <script>writeTD("rowdata");</script>
                  <a class="imagelink" href="" onClick="return confirmDelete('%value alias encode(javascript)%','provider', '%value transportInfo/transportType encode(javascript)%');">
                      <img src="icons/delete.png" alt="Delete alias : %value alias encode(htmlattr)%" border="none"></a>
            </TD>

        </TR>

        <script>
        swapRows();</script>
    %endloop%
%endinvoke%
<script>checkPrevState("Provider%value transportType encode(javascript)%ToggleRow", "Provider%value transportType encode(javascript)%Row", "Provider%value transportType encode(javascript)%Img");</script>