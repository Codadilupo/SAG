<table class="tableView" width="100%">
<tbody id="eprAddressDiv">
<tr>
  <td class="oddrow" width="25%">Address</td>
  <td class="oddrow-l" width="75%">
  %ifvar ../../../action equals('view')%
    %ifvar eprType equals('to')%
			%value to/address/value encode(html)%
    %endif%
    %ifvar eprType equals('from')%
			%value from/address/value encode(html)%
    %endif%
    %ifvar eprType equals('replyTo')%
			%value replyTo/address/value encode(html)%
    %endif%
    %ifvar eprType equals('faultTo')%
			%value faultTo/address/value encode(html)%
    %endif%
  %else%
		<INPUT name="%value eprType encode(htmlattr)%AddressURL" 
      %ifvar eprType equals('to')%
				VALUE="%value to/address/value encode(htmlattr)%"
      %endif%
      %ifvar eprType equals('from')%
				VALUE="%value from/address/value encode(htmlattr)%"
      %endif%
      %ifvar eprType equals('replyTo')%
				VALUE="%value replyTo/address/value encode(htmlattr)%"
      %endif%
      %ifvar eprType equals('faultTo')%
				VALUE="%value faultTo/address/value encode(htmlattr)%"
      %endif%
      style="width:100%">
  %endif%
  </td>
</tbody>

<TR>
  <TD class="oddrow">Reference Parameters</TD>
  <TD class="evenrow-l">
		<table id="%value eprType encode(htmlattr)%ReferenceParamsTable" name="%value eprType encode(htmlattr)%ReferenceParamsTable" class="tableView" width="100%">
      %ifvar action equals('create')%
				<script>addParamRow("%value eprType encode(javascript)%",'ReferenceParams');disableFirstRowDeleteButton("%value eprType encode(javascript)%",'ReferenceParams');
        </script>
      %else%
        %ifvar eprType equals('to')%
          %ifvar to/referenceParameters%
            %scope param(thisKey='to_referenceParameters')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../to/referenceParameters%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'ReferenceParams',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%  
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'ReferenceParams','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('from')%
          %ifvar from/referenceParameters%
            %scope param(thisKey='from_referenceParameters')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../from/referenceParameters%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'ReferenceParams',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%    
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'ReferenceParams','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('replyTo')%
          %ifvar replyTo/referenceParameters%
            %scope param(thisKey='replyTo_referenceParameters')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../replyTo/referenceParameters%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'ReferenceParams',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%      
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'ReferenceParams','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('faultTo')%
          %ifvar faultTo/referenceParameters%
            %scope param(thisKey='faultTo_referenceParameters')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../faultTo/referenceParameters%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'ReferenceParams',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%    
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'ReferenceParams','');</script>
          %endif%
        %endif%
				<script>disableFirstRowDeleteButton("%value eprType encode(javascript)%",'ReferenceParams');</script>
      %endif%  
    </table>
  </td>
</tr>

<tbody id="eprMetadataDiv">
<TR>
  <TD class="oddrow">Metadata Elements</TD>
  <TD class="evenrow-l">
		<table id="%value eprType encode(htmlattr)%MetadataElementsTable" name="%value eprType encode(htmlattr)%MetadataElementsTable" class="tableView" width="100%">
      %ifvar action equals('create')%
				<script>addParamRow("%value eprType encode(javascript)%",'MetadataElements');disableFirstRowDeleteButton("%value eprType encode(javascript)%",'MetadataElements');</script>
      %else%
        %ifvar eprType equals('to')%
          %ifvar to/metadata/elements%
            %scope param(thisKey='to_metadata_elements')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../to/metadata/elements%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'MetadataElements',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%  
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'MetadataElements','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('from')%
          %ifvar from/metadata/elements%
            %scope param(thisKey='from_metadata_elements')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../from/metadata/elements%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'MetadataElements',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%    
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'MetadataElements','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('replyTo')%
          %ifvar replyTo/metadata/elements%
            %scope param(thisKey='replyTo_metadata_elements')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../replyTo/metadata/elements%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'MetadataElements',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%      
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'MetadataElements','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('faultTo')%
          %ifvar faultTo/metadata/elements%
            %scope param(thisKey='faultTo_metadata_elements')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../faultTo/metadata/elements%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'MetadataElements',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%      
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'MetadataElements','');</script>
          %endif%
        %endif%

        %ifvar ../../../action equals('edit')%
					<script>disableFirstRowDeleteButton("%value eprType encode(javascript)%",'MetadataElements');</script>
        %endif%
      %endif%  
    </table>
  </td>
</tr>
</tbody>
<tbody id="eprExtensibleDiv">
<TR>
  <TD class="oddrow">Extensible Elements</TD>
  <TD class="evenrow-l">
		<table id="%value eprType encode(htmlattr)%ExtensibleTable" name="%value eprType encode(htmlattr)%ExtensibleTable" class="tableView" width="100%">
      %ifvar action equals('create')%
				<script>addParamRow("%value eprType encode(javascript)%",'Extensible');disableFirstRowDeleteButton("%value eprType encode(javascript)%",'Extensible');
        </script>
      %else%
        %ifvar eprType equals('to')%
          %ifvar to/extensibleElements%
            %scope param(thisKey='to_extensibleElements')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../to/extensibleElements%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'Extensible',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%        
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'Extensible','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('from')%
          %ifvar from/extensibleElements%
            %scope param(thisKey='from_extensibleElements')%
              %invoke wm.server.ws:filterNewLineChar%
                %loop ../from/extensibleElements%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'Extensible',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%                  
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'Extensible','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('replyTo')%
          %ifvar replyTo/extensibleElements%
            %scope param(thisKey='replyTo_extensibleElements')%
              %invoke wm.server.ws:filterNewLineChar%          
                %loop ../replyTo/extensibleElements%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'Extensible',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%                  
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'Extensible','');</script>
          %endif%
        %endif%
        %ifvar eprType equals('faultTo')%
          %ifvar faultTo/extensibleElements%
            %scope param(thisKey='faultTo_extensibleElements')%
              %invoke wm.server.ws:filterNewLineChar%            
                %loop ../faultTo/extensibleElements%
									<script>editParamRow("%value ../../../../../action encode(javascript)%","%value eprType encode(javascript)%",'Extensible',"%value encode(javascript)%");</script>
                %endloop%
              %endinvoke%  
            %endscope%                  
          %else%
						<script>editParamRow("%value ../../../action encode(javascript)%","%value eprType encode(javascript)%",'Extensible','');</script>
          %endif%
        %endif%
				<script>disableFirstRowDeleteButton("%value eprType encode(javascript)%",'Extensible');</script>
      %endif%  
    </table>
  </td>
</tr>
</tbody>
</table>
