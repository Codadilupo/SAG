<script type="text/javascript">

  function textChangeListener(txt, id) {
    var val = txt.value;
    if(val != null && val.length > 0) {
      document.getElementById(id).disabled = false;
    } else {
      document.getElementById(id).disabled = true;
    }
  }
  function checkboxChangeListener(txt, id) {
    var val = txt.checked;
    if(val) {
      document.getElementById(id).value = 'true';
    } else {
      document.getElementById(id).value = 'false';
    }
  }
  
  function triggerChanged(currentVal)
  {
    %ifvar ../../action equals('edit')%
			var old = "%value jmsTriggerName encode(javascript)%";
      if (old.match("wm.namespace.ws:wseTrigger_") != null && currentVal != "ws endpoint trigger")
      {
        alert("The WS Endpoint Trigger will be deleted on Save Changes");
      }
    %endif%
  }

</script>
<TR>
  <TD colspan="2" class="heading">JMS Transport Properties</TD>
</TR>

<tbody id="providerJMSDiv">
  <!-- Provider JMS - start -->
    %ifvar ../../action equals('view')%
      <TR>
        <TD class="oddrow">JMS Trigger Name</TD>
        %ifvar jmsTriggerName matches('wm.namespace.ws:wseTrigger_*')%
			    <TD class="oddrow-l"><A HREF="endpoint-trigger-details.dsp?triggerName=wm.namespace.ws:wseTrigger_%value ../../alias encode(url)%">WS Endpoint Trigger: %value ../../alias encode(html)%</A></TD>
        %else%
			    <TD class="oddrow-l">%value jmsTriggerName encode(html)%</TD>
        %endif%
      </TR>
    %else%
      %invoke wm.server.jms:getTriggerReport%
      <TR>
        <TD class="oddrow">JMS Trigger Name</TD>
        <TD class="oddrow-l">
          <SELECT NAME="jmsTriggerName" onChange="triggerChanged(this.value)" style="width:40%">
             %loop triggerDataList%
                %ifvar trigger/jmsTriggerType equals('1')%
                   %ifvar trigger/wseAlias -NOTEMPTY%
                   %else%
							       <OPTION value="%value node_nsName encode(htmlattr)%" %ifvar ../jmsTriggerName vequals(node_nsName)%selected%endif%>%value node_nsName encode(html)%</OPTION>
                   %endif%
                %endif%
              %endloop%
              <OPTION value="ws endpoint trigger" %ifvar jmsTriggerName matches('wm.namespace.ws:wseTrigger_*')% selected %endif%>WS Endpoint Trigger</OPTION>
           </SELECT>
        </TD>
      </TR>
      %onerror%
      <tr>
			    <td class="message" colspan=2>%value errorService encode(html)%<br>%value error encode(html)%<br>%value errorMessage encode(html)%<br></td>
      </tr>
      %endinvoke%
    %endif% 
  <TR>
    <TD class="evenrow">Delivery Mode</TD>
    <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value deliveryMode encode(html)%
    %else%
      <SELECT NAME="deliveryMode" style="width:40%">
        <OPTION value="" %ifvar deliveryMode equals('')%selected%endif%></OPTION>
        <OPTION value="PERSISTENT" %ifvar deliveryMode equals('PERSISTENT')%selected%endif%>PERSISTENT</OPTION>
        <OPTION value="NON_PERSISTENT" %ifvar deliveryMode equals('NON_PERSISTENT')%selected%endif%>NON_PERSISTENT</OPTION>
      </SELECT>
    %endif% 
    </TD>
  </TR>
  <TR>
    <TD class="oddrow">Time to Live</TD>
    <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value timeToLive encode(html)%
    %else%
			<INPUT NAME="timeToLive" VALUE="%value timeToLive encode(htmlattr)%" style="width:40%">
    %endif% 
    </TD>
  </TR>
  <TR>
    <TD class="evenrow">Priority</TD>
    <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value priority encode(html)%
    %else%
      <SELECT NAME="priority" style="width:40%">
        <OPTION value="" %ifvar priority equals('')%selected%endif%></OPTION>
        <OPTION value="0" %ifvar priority equals('0')%selected%endif%>0</OPTION>
        <OPTION value="1" %ifvar priority equals('1')%selected%endif%>1</OPTION>
        <OPTION value="2" %ifvar priority equals('2')%selected%endif%>2</OPTION>
        <OPTION value="3" %ifvar priority equals('3')%selected%endif%>3</OPTION>
        <OPTION value="4" %ifvar priority equals('4')%selected%endif%>4</OPTION>
        <OPTION value="5" %ifvar priority equals('5')%selected%endif%>5</OPTION>
        <OPTION value="6" %ifvar priority equals('6')%selected%endif%>6</OPTION>
        <OPTION value="7" %ifvar priority equals('7')%selected%endif%>7</OPTION>
        <OPTION value="8" %ifvar priority equals('8')%selected%endif%>8</OPTION>
        <OPTION value="9" %ifvar priority equals('9')%selected%endif%>9</OPTION>
      </SELECT>
    %endif% 
    </TD>
  </TR>
  <TR>
    <TD class="oddrow">Reply To Name</TD>
    <TD class="oddrow-l">
      %ifvar ../../action equals('view')%
        %value replyToDestName encode(html)%
      %else%
        <INPUT NAME="replyToDestName" id="replyToDestName" style="width:40%" VALUE="%value replyToDestName encode(htmlattr)%" onchange="textChangeListener(this, 'replyToDestType');" />
      %endif% 
    </TD>
  </TR>
  <TR>
    <TD class="evenrow">Reply To Type</TD>
    <TD class="evenrow-l">
      %ifvar ../../action equals('view')%
        %value replyToDestType encode(html)%
      %else%
        <SELECT ID="replyToDestType" style="width:40%" NAME="replyToDestType" %ifvar replyToDestName -notempty%%else%disabled%endif%>
          <OPTION value="" %ifvar replyToDestType equals('')%selected%endif%></OPTION>
          <OPTION value="Queue" %ifvar replyToDestType equals('Queue')%selected%endif%>Queue</OPTION>
          <OPTION value="Topic" %ifvar replyToDestType equals('Topic')%selected%endif%>Topic</OPTION>
        </SELECT>
      %endif% 
    </TD>
  </TR>
  <tr><td colspan=2><IMG SRC="images/blank.gif" height="10" width="10"></td></tr>
  <TR>
    <TD colspan="2" class="heading">JMS WSDL Options</TD>
  </TR>
 <!-- <TR>
    <TD colspan="2" class="subheading">Include in WSDL:</TD>
  </TR>
  -->
  <TR>
    <TD class="oddrow">Include Connection<br> Factory Name</TD>
    <TD class="oddrow-l">
      %ifvar ../../action equals('view')%
			  %value includeConnFactoryName encode(html)%
      %else%
        <INPUT type="hidden" id="includeConnFactoryName" name="includeConnFactoryName" value="%ifvar includeConnFactoryName equals('false')%false%else%true%endif%"/>
        <INPUT TYPE="checkbox" onchange="checkboxChangeListener(this, 'includeConnFactoryName');" %ifvar includeConnFactoryName equals('false')%%else%checked%endif% />
      %endif% 
    </TD>
  </TR>
  <TR>
    <TD class="evenrow">Include JNDI Parameters</TD>
    <TD class="evenrow-l">
      %ifvar ../../action equals('view')%
			  %value includeJNDIParams encode(html)%
      %else%
        <INPUT type="hidden" id="includeJNDIParams" name="includeJNDIParams" value="%ifvar includeJNDIParams equals('true')%true%else%false%endif%"/>
        <INPUT TYPE="checkbox" onchange="checkboxChangeListener(this, 'includeJNDIParams');" %ifvar includeJNDIParams equals('true')%checked%endif% />
      %endif% 
    </TD>
  </TR>
<!-- Provider JMS - end -->

</tbody>
<tbody id="consumerJMSDiv">
<!-- Consumer JMS - start -->
<TR>
<TD class="oddrow">Connect Using</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value jmsAliasType encode(html)%
    %else%
      <INPUT TYPE="radio" NAME="jmsAliasType" VALUE="JNDI" %ifvar jmsAliasType equals('JMS')%%else%checked%endif% onclick="toggleJMSorJNDI()">JNDI Properties</INPUT>
      <INPUT TYPE="radio" NAME="jmsAliasType" VALUE="JMS" %ifvar jmsAliasType equals('JMS')%checked%endif% onclick="toggleJMSorJNDI()">JMS Connection Alias</INPUT>
    %endif% 
  </TD>
</TR>
</tbody>
<tbody id="consumerJMSDivJNDI">
<!-- Consumer JMS - JNDI only - start -->
%ifvar ../../action equals('view')%
  <TR>
    <TD class="evenrow">JNDI Provider Alias</TD>
		<TD class="evenrow-l">%value jndiProvAlias encode(html)%</TD>
  </TR>
%else%
  %invoke wm.server.jndi:getJNDIAliasData%
  <TR>
    <TD class="evenrow">JNDI Provider Alias</TD>
    <TD class="evenrow-l">
      <SELECT NAME="jndiProvAlias" style="width:40%">
        %loop aliasDataAry%
					<OPTION value="%value aliasName encode(htmlattr)%" %ifvar ../../jndiProvAlias vequals(aliasName)%selected%endif%>%value aliasName encode(html)%</OPTION>
        %endloop%
      </SELECT>
    </TD>
  </TR>
  %onerror%
      <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
  %endinvoke%
%endif%
<TR>
  <TD class="oddrow">Connection Factory Name</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value connFactoryName encode(html)%
    %else%
			<INPUT NAME="connFactoryName" VALUE="%value connFactoryName encode(htmlattr)%" style="width:40%"/>
    %endif% 
  </TD>
</TR>

<!--
<TR>
  <TD class="evenrow">Destination Lookup</TD>
  <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value destinationName encode(html)%
    %else%
			<INPUT NAME="destinationNameJNDI" VALUE="%value destinationName encode(htmlattr)%" onchange="textChangeListener(this, 'destinationTypeJNDI');"/>
    %endif% 
  </TD>
</TR>
<TR>
  <TD class="oddrow">Destination Type</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value destinationType encode(html)%
    %else%
      <SELECT ID="destinationTypeJNDI" NAME="destinationTypeJNDI" %ifvar destinationName -notempty%%else%disabled%endif%>
        <OPTION value="" %ifvar destinationType equals('')%selected%endif%></OPTION>
        <OPTION value="Queue" %ifvar destinationType equals('Queue')%selected%endif%>Queue</OPTION>
        <OPTION value="Topic" %ifvar destinationType equals('Topic')%selected%endif%>Topic</OPTION>
      </SELECT>
    %endif% 
  </TD>
</TR>
<TR>
  <TD class="evenrow">Reply To Lookup</TD>
  <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value replyToDestName encode(html)%
    %else%
			<INPUT NAME="replyToDestNameJNDI" VALUE="%value replyToDestName encode(htmlattr)%"  onchange="textChangeListener(this, 'replyToDestTypeJNDI');"/>
    %endif% 
  </TD>
</TR>
<TR>
  <TD class="oddrow">Reply To Destination Type</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value replyToDestType encode(html)%
    %else%
      <SELECT ID="replyToDestTypeJNDI" NAME="replyToDestTypeJNDI" %ifvar replyToDestName -notempty%%else%disabled%endif%>
        <OPTION value="" %ifvar replyToDestType equals('')%selected%endif%></OPTION>
        <OPTION value="Queue" %ifvar replyToDestType equals('Queue')%selected%endif%>Queue</OPTION>
        <OPTION value="Topic" %ifvar replyToDestType equals('Topic')%selected%endif%>Topic</OPTION>
      </SELECT>
    %endif% 
  </TD>
</TR>
-->

<!-- Consumer JMS - JNDI only - end -->
</tbody>
<tbody id="consumerJMSDivJMS">
<!-- Consumer JMS - JMS only - start -->
%ifvar ../../action equals('view')%
  <TR>
    <TD class="evenrow">JMS Connection Alias</TD>
		<TD class="evenrow-l">%value jmsConnAlias encode(html)%</TD>
  </TR>
%else%
  %invoke wm.server.jms:getConnectionAliasReport%
  <TR>
    <TD class="evenrow">JMS Connection Alias</TD>
    <TD class="evenrow-l">
      <SELECT NAME="jmsConnAlias" style="width:40%">
        %loop aliasDataList%
					<OPTION value="%value aliasName encode(htmlattr)%" %ifvar ../../jmsConnAlias vequals(aliasName)%selected%endif%>%value aliasName encode(html)%</OPTION>
        %endloop%
      </SELECT>
    </TD>
  </TR>
  %onerror%
      <tr><td class="message" colspan=2>%value errorMessage encode(html)%</td></tr>
  %endinvoke%
%endif%

<!--
<TR>
  <TD class="oddrow">Destination Name</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value destinationName encode(html)%
    %else%
			<INPUT NAME="destinationNameJMS" VALUE="%value destinationName encode(htmlattr)%" onchange="textChangeListener(this, 'destinationTypeJMS');"/>
    %endif% 
  </TD>
</TR>
<TR>
  <TD class="evenrow">Destination Type</TD>
  <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value destinationType encode(html)%
    %else%
      <SELECT ID="destinationTypeJMS" NAME="destinationTypeJMS" %ifvar destinationName -notempty%%else%disabled%endif%>
        <OPTION value="" %ifvar destinationType equals('')%selected%endif%></OPTION>
        <OPTION value="Queue" %ifvar destinationType equals('Queue')%selected%endif%>Queue</OPTION>
        <OPTION value="Topic" %ifvar destinationType equals('Topic')%selected%endif%>Topic</OPTION>
      </SELECT>
    %endif% 
  </TD>
</TR>
<TR>
  <TD class="oddrow">Reply To Name</TD>
  <TD class="oddrow-l">
    %ifvar ../../action equals('view')%
			%value replyToDestName encode(html)%
    %else%
			<INPUT NAME="replyToDestNameJMS" VALUE="%value replyToDestName encode(htmlattr)%" onchange="textChangeListener(this, 'replyToDestTypeJMS');"/>
    %endif% 
  </TD>
</TR>
<TR>
  <TD class="evenrow">Reply To Type</TD>
  <TD class="evenrow-l">
    %ifvar ../../action equals('view')%
			%value replyToDestType encode(html)%
    %else%
      <SELECT ID="replyToDestTypeJMS" NAME="replyToDestTypeJMS" %ifvar replyToDestName -notempty%%else%disabled%endif%>
        <OPTION value="" %ifvar replyToDestType equals('')%selected%endif%></OPTION>
        <OPTION value="Queue" %ifvar replyToDestType equals('Queue')%selected%endif%>Queue</OPTION>
        <OPTION value="Topic" %ifvar replyToDestType equals('Topic')%selected%endif%>Topic</OPTION>
      </SELECT>
    %endif% 
  </TD>
</TR>
-->

<!-- Consumer JMS - JMS only - end -->
<!-- Consumer JMS - end -->
</tbody>
