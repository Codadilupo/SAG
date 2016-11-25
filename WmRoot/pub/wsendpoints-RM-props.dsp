<tbody id="WSRMPropDiv">
<TR>
  <TD colspan="2" class="heading">Reliable Messaging Properties (Optional)</TD>
</TR>
<TR>
  <td class="oddrow">Enable</td>
  <td class="oddrow-l">
  %ifvar ../../action equals('view')%
		%value enable encode(html)%
  %else%
		<input name="enable" value="%value enable encode(htmlattr)%" id="enable" type="checkbox" 
    %ifvar enable equals('true')% checked %endif% onclick="toggleRMProperties();">
  %endif%
  </td>
</TR>
<TR>
  <TD class="evenrow">Retransmission Interval</TD>
  <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value retransmissionInterval encode(html)%
    %else%
      %ifvar action equals('create')%
        <INPUT NAME="retransmissionInterval" ID="retransmissionInterval" VALUE="6000" style="width:50%;">
      %else%
				<INPUT NAME="retransmissionInterval" ID="retransmissionInterval" VALUE="%value retransmissionInterval encode(htmlattr)%" style="width:50%;">
      %endif%
    %endif%
     &nbsp; milliseconds
  </TD>
</TR>

<TR>
  <TD class="oddrow">Acknowledgement Interval</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value acknowledgementInterval encode(html)%
    %else%
      %ifvar action equals('create')%
        <INPUT NAME="acknowledgementInterval" ID="acknowledgementInterval" VALUE="3000" style="width:50%;">
      %else%
				<INPUT NAME="acknowledgementInterval" ID="acknowledgementInterval" VALUE="%value acknowledgementInterval encode(htmlattr)%" style="width:50%;">
      %endif%
    %endif%
     &nbsp; milliseconds
  </TD>
</TR>
<TR>
  <TD class="evenrow">Exponential Backoff</TD>
  <TD class="evenrow-l">
      %ifvar ../../action equals('view')%
			%value exponentialBackoff encode(html)%
    %else%
      <select name="exponentialBackoff" id="exponentialBackoff" style="width:50%;">
        <option value="true" %ifvar exponentialBackoff equals('true')% selected %endif% >true</option>
        <option value="false" %ifvar exponentialBackoff equals('false')% selected %endif% >false</option>
      </select>
    %endif%
  </TD>
</TR>
<TR>
  <TD class="oddrow">Maximum Retransmission Count</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value maximumRetransmissionCount encode(html)%
    %else%
      %ifvar action equals('create')%
        <input type="text" name="maximumRetransmissionCount" id="maximumRetransmissionCount" value="10" style="width:50%;">
      %else%
				<input type="text" name="maximumRetransmissionCount" id="maximumRetransmissionCount" value="%value maximumRetransmissionCount encode(htmlattr)%" style="width:50%;">
    %endif%
  </TD>
</TR>
</tbody>