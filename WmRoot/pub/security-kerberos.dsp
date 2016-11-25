<HTML>
<HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


  <TITLE>Integration Server Kerberos Settings</TITLE>
  <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
  <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
  <script>
  function setValueOfUseSubjectCred(){
          if(document.getElementById('useSubjectCreds').checked){
              document.getElementById('useSubjectCreds').value= 'true';
          }else{
              document.getElementById('useSubjectCreds').value= 'false';
          }
  }
  function validateKRBSettings(){
    if(!validateField("Realm", document.getElementById("kerberosRealm").value)){
        return false;
    }
    if(!validateField("Key Distribution Center Host", document.getElementById("kerberosKDC").value)){
        return false;
    }
    if(!validateField("Kerberos Configuration File", document.getElementById("kerberosConfig").value)){
        return false;
    }
    if(isEmpty(document.getElementById("kerberosRealm").value)!= isEmpty(document.getElementById("kerberosKDC").value)){
        alert("Specify both Realm and Key Distribution Center Host or specify neither.");
        return false;
    }
    return true;
  }
  function validateField(field,valueToValidate){
    if(valueToValidate != trim(valueToValidate)){
        alert(""+field+" cannot have leading or trailing whitespaces.");
        return false;
    }
    if(valueToValidate.length>255){
        alert(""+field+" cannot exceed 255 characters.")
        return false;
    }
    return true;
  }
  
  </script>
</HEAD>

%ifvar mode equals('edit')%
<BODY onLoad="setNavigation('security-kerberos.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_KerberosSettingsScrn_Edit', 'foo');">
%else%
<BODY onLoad="setNavigation('security-kerberos.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_KerberosSettingsScrn', 'foo');">
%endif%

  <TABLE WIDTH="100%">
    <TR>
    %ifvar mode equals('edit')%
      <TD class="breadcrumb" colspan="4">
        Security &gt; 
        Kerberos &gt;
        Edit </TD>
    %else%
      <TD class="breadcrumb" colspan="4">
        Security &gt; 
        Kerberos </TD>
    %endif%
    </TR>
    <TR>

    %ifvar action equals('change')%
      %invoke wm.server.kerberossettings:writeKerberosSettings%
        %ifvar message%
          <TR><TD colspan="4">&nbsp;</TD></TR>
		  <TR><TD class="message" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message encode(html)%</TD></TR>
        %endif%
      %endinvoke%
    %endif%
        <TR>
          <TD colspan=2>
            <ul class="listitems">
              %ifvar mode equals('edit')%
              <LI class="listitem"><A HREF="security-kerberos.dsp">Return to Kerberos Settings</a></li>
              %else% 
              <LI class="listitem"><A HREF="security-kerberos.dsp?mode=edit">Edit Kerberos Settings</a></li>
              %endif%
            </UL>
        </TR>
        <FORM action="security-kerberos.dsp" method="POST">
        <input type="hidden" name="action" value="change"/>
            %invoke wm.server.kerberossettings:readKerberosSettings%
             <TR>
                <td>
                    <table width="100%">
                        <tr>
                            <td>
                                <TABLE class="tableView">
                    <TR>
                        <TD class="heading" colspan="2">Kerberos Settings</TD>
                    </TR>
                    <TR>
                        <TD class="oddrow" width="50%">Realm</TD>
                        <TD class="oddrowdata-l" width="50%">
                            %ifvar mode equals('edit')%
                                <input type="text" id="kerberosRealm" NAME="kerberosRealm" VALUE="%value encode(html) kerberosRealm%" length="256"/>
                            %else%
                                %value encode(html) kerberosRealm%
                            %endif%    
                        </TD>
                    </TR>
                    <TR>            
                        <TD class="evenrow" width="50%">Key Distribution Center Host</TD>
                        <TD class="evenrowdata-l" width="50%">
                            %ifvar mode equals('edit')%
                                <input type="text" id="kerberosKDC" NAME="kerberosKDC" VALUE="%value encode(html) kerberosKDC%" length="256"/>
                            %else%
                                %value encode(html) kerberosKDC%
                            %endif%
                        </TD>
                    </TR>
                    <TR>
                        <TD class="oddrow" width="50%">Kerberos Configuration File</TD>
                        <TD class="oddrowdata-l" width="50%">
                            %ifvar mode equals('edit')%
                                <input type="text" id="kerberosConfig" NAME="kerberosConfig" VALUE="%value encode(html) kerberosConfig%" length="256"/>
                            %else%
                                %value encode(html) kerberosConfig%
                            %endif%
                        </TD>
                    </TR>
                    <TR>
                        <TD class="evenrow" width="50%">Use Subject Credentials Only</TD>
                        <TD class="evenrowdata-l" width="50%">
                            %ifvar mode equals('edit')%
                                <input type="checkbox" id="useSubjectCreds" NAME="useSubjectCreds" value=%value useSubjectCreds encode(html)% %ifvar useSubjectCreds equals('true')%checked%endif%  onclick="setValueOfUseSubjectCred();"/>
                                %else%
									%value useSubjectCreds encode(html)%
                            %endif%
                        </TD>
                    </TR>
                %ifvar mode equals('edit')%
            <TR>
                <TD class="action" colspan=3>
                    <input type="submit" onclick="return validateKRBSettings();" value="Save Changes"/>
                </TD>
            </TR>
            %else%
            %endif%                    
                     </TABLE>
                            </td>
                        </tr>
                    </table>
                </td>
            <tr>
        </td>
        %endinvoke%
        </form>
    </tr>
  </table>
</body>
