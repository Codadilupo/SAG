       <tr>
       <td class="oddrow">Threadpool Min</td>
       <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
                  %ifvar ../mode equals('view')%
	    %value minThread encode(html)%
      %else%
        %ifvar minThread%
	      <input name="minThread" value="%value minThread encode(htmlattr)%">
        %else%
          <input name="minThread" value="1">
        %endif%
      %endif%
       </td>
      </tr>
      <tr>
       <td class="evenrow">Threadpool Max</td>
       <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
                  %ifvar ../mode equals('view')%
	    %value maxThread encode(html)%
      %else%
        %ifvar maxThread%
	      <input name="maxThread" value="%value maxThread encode(htmlattr)%">
        %else%
          <input name="maxThread" value="5">
        %endif%
      %endif%
       </td>
       </tr>
       <tr>
       <td class="oddrow">Thread Priority</td>
       <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
                  %ifvar ../mode equals('view')%
	    %value threadPriority encode(html)%
      %else%
        %ifvar threadPriority%
	      <input name="threadPriority" value="%value threadPriority encode(htmlattr)%">
        %else%
          <input name="threadPriority" value="5">
        %endif%
      %endif%
       </td>
       </tr>
        %ifvar ../mode equals('view')%
              <tr>
              
              <td class="evenrow">Current Threads</td>
              <td class="evenrowdata-l">
                     
       	     %value usedThreadCount encode(html)%
             </td>
             </tr>
       %endif%
