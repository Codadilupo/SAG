<SCRIPT>
    var agent = navigator.userAgent.toLowerCase();  
    var ie = (agent.indexOf("msie") != -1);
	
    function toggleSSL(isSSL,fm) 
    {
    	if (isSSL == true){
			/* Protocol is HTTPS */
            toggleJSSEoption('revinvoke',true);
            showKeyStoreSection("externalPort_keyStoreSection");
			   
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
                        
                        opt = document.createElement("option");
                        opt.value = "request";
                        opt.text= "Request Client Certificates";
                        obj.options.add(opt,2);
                    
                        opt = document.createElement("option");
                        opt.value = "require";
                        opt.text= "Require Client Certificates";
                        obj.options.add(opt,3);
                    }
                 }
            }catch(e) {}
        } else {
            toggleJSSEoption('revinvoke',false);
            //toggleIdentityProvider('revinvoke',false);
            hideKeyStoreSection("externalPort_keyStoreSection");   
            
            try {
                 var obj=fm.clientAuth;
                  if(obj != undefined && obj != null) {
                  for (var i=0; i < obj.options.length; i++){
                        if (obj.options[i].value == 'request' || obj.options[i].value == 'require' || obj.options[i].value == 'idProvider') {
                            obj.remove(i);
                            i=i-1;
                        }
                    }
                 }
            }catch(e) {}
        }
    }
  
    function setThreadpool(checkId, bool) 
    {
        if (bool==true){
            document.getElementById(checkId).value="true";  
        }else{
            document.getElementById(checkId).value="false";     
        }
            
    }
    
    function toggleThreadpool(checkId, spanId) 
    {
        if (document.getElementById(checkId).value=="true"){
            elem = document.getElementById(spanId);
            rows = elem.rows;
            for(i = 0; i < rows.length; i++){
               if (ie) {
                 rows[i].style.display="block";
               }else{
                 rows[i].style.display="block";
                 rows[i].style.display="table-row";
               }
            }
            document.getElementById(spanId+"enable").style.display="none";
        } else {    
            elem = document.getElementById(spanId);
            rows = elem.rows;
            //length = rows.length;
            for(i = 0; i < rows.length; i++){
               rows[i].style.display="none";
            }   
                if (ie) {
                    document.getElementById(spanId+"enable").style.display="block";
                }else{
                    document.getElementById(spanId+"enable").style.display="block";
                    document.getElementById(spanId+"enable").style.display="table-row";
                }
        }
    }


</SCRIPT>

<tr>
    <td class="heading" colspan="2">Enterprise Gateway External Port</td>
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
    <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
    %ifvar ../mode equals('view')%
        %ifvar ssl equals('true')%HTTPS%else%HTTP%endif%            
    %else%
        <INPUT TYPE="radio" NAME="ssl" VALUE="false" %ifvar ssl equals('true')%%else%CHECKED%endif% onclick="toggleSSL(false, document.properties1);">HTTP
        <INPUT TYPE="radio" NAME="ssl" id="sslRIGon" VALUE="true"   %ifvar ssl equals('true')%CHECKED%endif%  onclick="toggleSSL(true, document.properties1);">HTTPS
    %endif%
    </td>
</tr>

%include configHTTP-common.dsp%

<tr>
     <td class="oddrow">Keep Alive Timeout</td>
     <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
        %ifvar ../mode equals('view')%
		  	%value keepAliveTimeout encode(html)%
        %else%
          %ifvar keepAliveTimeout%
		    <input type="text" name="keepAliveTimeout" value="%value keepAliveTimeout encode(htmlattr)%">
          %else%
            <input type="text" name="keepAliveTimeout" value="20000">
          %endif%
        %endif%
     </td>
</tr>

<tr id="tpRIGenable">
%ifvar ../mode equals('view')%
%else%
     <td class="evenrow">Threadpool</td>
     <td class="evenrow-l">
         <a name="anchor_a" href="#anchor_b" onclick="setThreadpool('tpRIGon',true);toggleThreadpool('tpRIGon', 'tpRIG');"><u>Enable</u></a>
     </td>
%endif%
</tr>

<tbody id="tpRIG">
    <tr>
        <td class="heading" colspan="2">Private Threadpool Configuration</td>
		<input type="hidden" name="threadPool" id="tpRIGon"   value="%value threadPool encode(htmlattr)%">		
    </tr>
    
    %ifvar ../mode equals('view')%
    %else%
    <tr>
        <td class="evenrow">Threadpool</td>
        <td class="evenrow-l">
            <a name="anchor_b" href="#anchor_a" onclick="setThreadpool('tpRIGon',false);toggleThreadpool('tpRIGon', 'tpRIG');"><u>Disable</u></a>
        </td>
    </tr>
    %endif%
    %include configHTTP-threadpool.dsp%
</tbody>

<tbody id="sslRIGAuth">
    %include config-common-sec-properties.dsp% 
</tbody>

<SCRIPT>toggleThreadpool('tpRIGon', 'tpRIG');</SCRIPT>


<!-- Include Common KeyStore section -->
<tbody id="externalPort_keyStoreSection">
	%include config-keystore-common.dsp%
</tbody>

%ifvar ssl -notempty%
	%ifvar ssl equals('true')%
		<SCRIPT>toggleSSL(true, document.properties1);</SCRIPT>
	%else%
		<SCRIPT>toggleSSL(false, document.properties1);</SCRIPT>
	%endif%
%else%
	<SCRIPT>toggleSSL(false, document.properties1);</SCRIPT>
%endif%
