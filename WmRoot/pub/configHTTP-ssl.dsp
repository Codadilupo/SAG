 <tr style="display: none;">
  <td  class="heading" colspan="2">Security Configuration</td>
  </tr>
  <tr style="display: none;">
      <td class="evenrow">Client Authentication</td>
      <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
    %ifvar mode equals('view')%
      %switch clientAuth%
        %case 'none'%Username/Password
        %case 'request'%Request Client Certificates
        %case 'require'%Require Client Certificates
        %case%Username/Password
      %endswitch%
    %lse%
      <select name="clientAuth">
      <option %ifvar clientAuth equals('none')%selected %endif%value="none">Username/Password</option>
      <option %ifvar clientAuth equals('request')%selected %endif%value="request">Request Client Certificates</option>
      <option %ifvar clientAuth equals('require')%selected %endif%value="require">Require Client Certificates</option>
      </select>
    %endif%
      </td>
  </tr>
  <tr style="display: none;">
      <td class="heading" colspan="2">Listener Specific Credentials (Optional)</td>
  </tr>
  <tr style="display: none;">
      <td class="oddrow">Server's Certificate</td>
      <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
	<script>writeEdit("%value mode encode(javascript)%", 'signedCert', "%value certChain[0] encode(html_javascript)%");</script>
      </td>
  </tr>
  <tr style="display: none;">
      <td class="evenrow">Authority's Certificate</td>
      <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
	<script>writeEdit("%value mode encode(javascript)%", 'caCert', "%value certChain[1] encode(html_javascript)%");</script>
      </td>
  </tr>
  <tr style="display: none;">
      <td class="oddrow">Private Key</td>
      <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
	<script>writeEdit("%value mode encode(javascript)%", 'privKey', "%value privKey encode(html_javascript)%");</script>
      </td>
  </tr>
  <td class="evenrow">Trusted Authority Directory</td>
      <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
	<script>writeEdit("%value mode encode(javascript)%", 'caDir', "%value caDir encode(html_javascript)%");</script>
      </td>
  </tr>
%comment% --- Trax 1-1-YN64D Add support for Keystores (HSM and file based) --- %endcomment%
           <tr>                                     
              <td class="heading" colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---&nbsp;Or&nbsp;---</td>
          </tr>
          <tr>
              <td class="evenrow">KeyStore Location</td>
              <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
                <script>writeEdit("%value mode encode(javascript)%", 'keyStoreLocation', "%value keyStoreLocation encode(html_javascript)%");</script>
              </td>
          </tr>
          %ifvar ../mode equals('edit')%
          <tr>
              <td class="evenrow">KeyStore Password</td>
              <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
                <script>writeEditPass("%value mode encode(javascript)%", 'password', "%value password encode(html_javascript)%");</script>
              </td>
          </tr>
          %endif%
      <tr>
              <td class="evenrow">KeyStore Type</td>
              <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
%comment%                <script>writeEdit("%value mode encode(javascript)%", 'keyStoreType', "%value keyStoreType encode(html_javascript)%");</script> %endcomment%
                %ifvar ../mode equals('view')%
                  %value keyStoreType encode(html)%%ifvar keyStoreProvider%(%value keyStoreProvider encode(html)%)%endif%
                %else%
                  %invoke wm.server.net.listeners:listKeyStoreTypes%
                  <select name="keyStoreType">
                  %loop keyStoreTypes%
                      <option %ifvar ../keyStoreType vequals(keyStoreType)% selected %endif% value="%value keyStoreType encode(htmlattr)%">%value keyStoreTypeName encode(html)%</option>
                  %endloop%
                  </select>
                  %endinvoke%
                %endif%
              </td>
          </tr>
          <tr>
              <td class="oddrow">HSM Based Keystore</td>
              <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
              %ifvar ../mode equals('view')%
                %value useHSM encode(html)%
              %else%
                  %ifvar useHSM equals('true')%
                        <INPUT TYPE="radio" NAME="useHSM" VALUE="true" checked>True</INPUT>
                        <INPUT TYPE="radio" NAME="useHSM" VALUE="false">False</INPUT>
                  %else%
                        <INPUT TYPE="radio" NAME="useHSM" VALUE="true" >True</INPUT>
                        <INPUT TYPE="radio" NAME="useHSM" VALUE="false" checked>False</INPUT>
                %endif%
              %endif%
              </td>
          </tr>
          <tr>
              <td class="oddrow">Alias</td>
              <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
                <script>writeEdit("%value mode encode(javascript)%", 'alias', "%value alias encode(html_javascript)%");</script>
              </td>
          </tr>
    %ifvar listenerKey equals('')%
              <tr>
                  <td class="evenrow">Trusted Authority Directory</td>
                  <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
	                <script>writeEdit("%value mode encode(javascript)%", 'keyStoreCADir', "%value keyStoreCADir encode(html_javascript)%");</script>
                  </td>
              </tr>
    %else%
              <tr>
                  <td class="evenrow">Trusted Authority Directory</td>
                  <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
	                <script>writeEdit("%value mode encode(javascript)%", 'keyStoreCADir', "%value keyStoreCADir encode(html_javascript)%");</script>
                  </td>
              </tr>
        %endif%
%comment% --- Trax 1-1-YN64D Add support for Keystores (HSM and file based) --- %endcomment%
