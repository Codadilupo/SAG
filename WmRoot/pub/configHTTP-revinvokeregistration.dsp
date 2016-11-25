<SCRIPT>
    var agent = navigator.userAgent.toLowerCase();   
    var ie = (agent.indexOf("msie") != -1);
    
    function toggleSSL2(isSSL, fm) {
    	if (isSSL ==true){
            toggleJSSEoption('revinvokeinternal', true);
            showKeyStoreSection("registrationPort_keyStoreSection");
              
            try {
                  var obj=fm.clientAuth;
                  if(obj != undefined && obj != null) {
                    var alreadyAdded = false;
                    for (var i=0; i < obj.options.length; i++){
                    if (obj.options[i].value == 'request' || obj.options[i].value == 'require') {
                        alreadyAdded = true;
                        break;
                        //selectobject.remove(i);
                        }
                    }
                    if(!alreadyAdded) {
                  
                        var opt = document.createElement("option");
                                  
                        opt.value = "request";
                        opt.text= "Request Client Certificates";
                        obj.options.add(opt);
                    
                        opt = document.createElement("option");
                        opt.value = "require";
                        opt.text= "Require Client Certificates";
                        obj.options.add(opt);
                 
                    }
                 }
            }catch(e) {}
        } else {    
            toggleJSSEoption('revinvokeinternal', false);
            hideKeyStoreSection("registrationPort_keyStoreSection");   
            
            try {
                 var obj=fm.clientAuth;
                  if(obj != undefined && obj != null) {
                    
                    for (var i=0; i < obj.options.length; i++){
                        if (obj.options[i].value == 'request' || obj.options[i].value == 'require') {
                            obj.remove(i);
                            i=i-1;
                        }
                    }
                    
                 }
            }catch(e) {}
        }
   }

</SCRIPT>

<input type="hidden" name="proxyPort" value="%value proxyPort encode(htmlattr)%">
<tr>
    <td class="heading" colspan="2">Enterprise Gateway Registration Port</td>
</tr>
%ifvar ../mode equals('edit')%
    <tr>
        <td class="oddrow">Enable</td>
        <td class="oddrow-l">
          <input type="radio" name="enable" value="yes" >Yes</input>
          <input type="radio" name="enable" value="no" checked>No</input>
        </td>
    </tr>
%endif%
<tr>
    <td class="evenrow">Protocol</td>
    <td class="%ifvar mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
	%ifvar mode equals('view')%
	    %ifvar ssl equals('true')%HTTPS%else%HTTP%endif%
	   <INPUT TYPE="radio" NAME="ssl" id="sslIRTon"  VALUE="true" style="visibility: hidden;"  %ifvar ssl equals('true')%CHECKED%endif%>
	%else%
	    <INPUT TYPE="radio" NAME="ssl" VALUE="false" %ifvar ssl equals('true')%%else%CHECKED%endif% onclick="toggleSSL2(false, document.properties2);">HTTP
	    <INPUT TYPE="radio"  NAME="ssl" id="sslIRTon" VALUE="true" %ifvar ssl equals('true')%CHECKED%endif%  onclick="toggleSSL2(true, document.properties2);">HTTPS
	%endif%
    </td>
</tr>

%include configHTTP-common.dsp%
%ifvar keepAliveTimeout%
    <input type="hidden" name="keepAliveTimeout" value="%value keepAliveTimeout encode(htmlattr)%">
%else%
    <input type="hidden" name="keepAliveTimeout" value="20000">
%endif%

%include config-common-sec-properties.dsp% 

<tbody id="registrationPort_keyStoreSection">
	%include config-keystore-common.dsp%
</tbody>
	
%ifvar ssl -notempty%
	%ifvar ssl equals('true')%
		<SCRIPT>toggleSSL2(true, document.properties2);</SCRIPT>
	%else%
		<SCRIPT>toggleSSL2(false, document.properties2);</SCRIPT>
	%endif%
%else%
	<SCRIPT>toggleSSL2(false, document.properties2);</SCRIPT>
%endif%