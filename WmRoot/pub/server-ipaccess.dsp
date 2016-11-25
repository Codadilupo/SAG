<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt">
    </SCRIPT>
    <TITLE>Integration Server IP Access</TITLE>
    </HEAD>
  <BODY onLoad="setNavigation('security-ports.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_ChgGlobalIPAccessScrn');">
  <TABLE width="100%">
   <TR>
      <TD class="breadcrumb" colspan=2>
        Security &gt;
        Ports &gt;
        IP Access
        %ifvar listenerKey equals('global')%
          &gt; Global
        %else%
          %ifvar listenerKey%
             &gt %value listenerKey encode(html)%
          %endif%
        %endif%
      </TD>
    </TR>

    %ifvar action%
      %switch action%
        %case 'delete'%
         %invoke wm.server.net:ipRuleDelete%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan=2>%value message encode(html)%</TD></TR>
          %endinvoke%
        %case settype%
          %invoke wm.server.net:changeIPAccessType%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan=2>%value message encode(html)%</TD></TR>
          %endinvoke%
        %case 'add'%
          %invoke wm.server.net:ipRuleAdd%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan=2>%value message encode(html)%</TD></TR>
              <TR>
                <TD colspan="2">&nbsp;</TD>
              </TR>
          %endinvoke%
      %endswitch%
    %endif%

    %invoke wm.server.net:ipRuleList%

    <TR>
      <TD colspan="2">
        <ul class="listitems">
          <li><a href="security-ports.dsp">Return to Ports</a></li>
          %switch type%
            %case 'include'%
              <li><a href="server-ipaccess-add.dsp?listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%&type=%value type encode(url)%">Add Hosts to Deny List</a></LI>
              <LI><a onclick="return confirm('Warning: You will block access to this port from all IP Addresses until hosts are added to the Allow List.  Current Deny List will be cleared.  Are you sure?');"
                     href="server-ipaccess.dsp?action=settype&newtype=exclude&listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%">
                     Change IP Access Mode to Deny by Default</a></li>
              %ifvar listenerKey equals('global')%
              %else%
                <LI><a onclick="return confirm('Are you sure?  You will lose all settings defined for this Listener.');"
                       href="server-ipaccess.dsp?action=settype&newtype=global&listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%">
                       Reset IP Access to Global</a></li>
              %endif%
            %case 'exclude'%
              <li><a href="server-ipaccess-add.dsp?listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%&type=%value type encode(url)%">Add Hosts to Allow List</a></LI>
              <LI><a onclick="return confirm('Warning: You will allow access to this port from all IP Addresses until hosts are added to the Deny List.  Current Allow List will be cleared.  Are you sure? ');"
                     href="server-ipaccess.dsp?action=settype&newtype=include&listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%">
                     Change IP Access Mode to Allow by Default</a></li>
              %ifvar listenerKey equals('global')%
              %else%
                <LI><a onclick="return confirm('This will reset the IP Access Mode to use the Global settings.  Current Host List will be cleared.  Are you sure?');"
                       href="server-ipaccess.dsp?action=settype&newtype=global&listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%">
                       Reset IP Access Mode to Global settings</a></li>
              %endif%
            %case 'global'%
              <LI><a onclick="return confirm('Are you sure?  This will deny access to this listener untill you set an allow list.');"
                     href="server-ipaccess.dsp?action=settype&newtype=exclude&listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%">
                     Change IP Access Mode to Deny by Default</a></li>
              <LI><a onclick="return confirm('Are you sure?  This will make this listener available from all hosts.');"
                     href="server-ipaccess.dsp?action=settype&newtype=include&listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%">
                     Change IP Access Mode to Allow by Default</a></li>
            %endswitch%

              %ifvar listenerKey equals('global')%
              %else%
              <LI><a href="server-ipaccess.dsp?listenerKey=global">Edit Global IP Access Mode</a></li>
              %endif%

            </UL>
         </TD>
    </TR>
    <TR>
    <FORM NAME="settype" action="server-ipaccess.dsp" method="POST">
    <INPUT TYPE="HIDDEN" NAME=action VALUE="settype">
    <INPUT TYPE="hidden" NAME="listenerKey" value="%value listenerKey encode(htmlattr)%">
    <INPUT TYPE="hidden" NAME="pkg" value="%value pkg encode(htmlattr)%">

    <SCRIPT Language="JavaScript">
      function changeAccessType()
      {
        var form = document.settype;
        if(!confirm("Are you sure?  It is possible to deny access to the current port."))
        {
          for(var i=0;i<2;i++)
          {
            if(form.type.options[i].value=="%value type encode(javascript)%")
            {
              form.type.options[i].selected=true;
              return false;
            }
          }
          return false;
        }
        else
        {
          return form.submit();
        }
      }
    </SCRIPT>

      <TD>
        <TABLE class="tableView">
    <TR>
          <TD  class="heading" colspan=2>Port IP Access Settings</TD>
        </TR>
          <TR>
      <TD class="oddrow">Access Type</TD>
          <TD class="oddrowdata-l">
              %switch type%
                %case 'include'%
                  Allow by Default
                %case 'exclude'%
                  Deny by Default
                %case 'global'%
                  <a href="server-ipaccess.dsp?listenerKey=global">Global</a>
                    %scope param(listenerKey='global')%
                      %invoke wm.server.net:ipRuleList%
                        %switch type%
                          %case 'include'%
                            (Allow by Default*)
                          %case 'exclude'%
                            (Deny by Default*)
                        %endswitch%
                      %endinvoke%
                    %endscope%
              %endswitch%
          </TD>
      </tr>
      </FORM>
      </TABLE>

      <BR>

      <TABLE class="tableView">

      <TR>
      %switch type%
        %case 'include'%
          <TD class="heading" colspan="2">Deny List</TD>
        %case 'exclude'%
          <TD class="heading" colspan="2">Allow List</TD>
      %endif%
      </TR>



          <SCRIPT LANGUAGE="JavaScript">
            function confirmIt (verb, list, host)
            {
              var isAdd = (verb == "add");
              var isDeny = (list == "deny");
              var msg = "";

              // delete
              if (!isAdd && isDeny) {
                msg = "Are you sure you want to delete this\npattern from the list of denied hosts?";
              } else if(!isAdd && !isDeny) {
                  msg = "Are you sure you want to delete this\npattern from the list of allowed hosts?";
              }
              if(confirm(msg)){
                  if(!isAdd && isDeny){
                     var form = document.denyDel;
                     form.deny.value = host;
           form.listenerKey.value="%value listenerKey encode(javascript)%";
           form.pkg.value="%value pkg encode(javascript)%";
                     form.submit();
                  } else if(!isAdd && !isDeny){
                     var form = document.allowDel;
                     form.allow.value = host;
           form.listenerKey.value="%value listenerKey encode(javascript)%";
           form.pkg.value="%value pkg encode(javascript)%";
                     form.submit();
                  }
               }
               return false;


            }
          </SCRIPT>

        <script>resetRows();</script>
      %switch type%
      %case 'include'%
          <TR>
             <TD class="oddcol">Host</TD>
             <TD class="oddcol">Delete</TD>
          </TR>

      %loop deny%
          <TR>
            <script>writeTD('rowdata');</script>
            %value encode(html)%</TD>
            <script>writeTD('rowdata');swapRows();</script>
            <A class="imagelink" HREF="server-ipaccess.dsp?action=delete&deny=%value encode(url)%" ONCLICK="return confirmIt('delete', 'deny', '%value encode(javascript)%');"><IMG SRC="icons/delete.png" alt="Delete this host" border="0"></A></TD>
          </TR>
          %endloop%
      %case 'exclude'%
          <TR>
             <TD class="oddcol">Host</TD>
             <TD class="oddcol">Delete</TD>
          </TR>

          %loop allow%
          <TR>
            <script>writeTD('rowdata');</script>
            %value encode(html)%</TD>
            <script>writeTD('rowdata');swapRows();</script>
            <A class="imagelink" HREF="server-ipaccess.dsp" ONCLICK="return confirmIt('delete', 'allow', '%value encode(javascript)%');"><IMG SRC="icons/delete.png" alt="Delete this host" border="0"></A></TD>
          </TR>
          %endloop%
      %endswitch%
      </TD>
      </TABLE>
      </TD>
    </TR>

%endinvoke%

</TABLE>

<FORM NAME="allowDel" ACTION="server-ipaccess.dsp" METHOD="POST">
<INPUT TYPE="hidden" NAME="allow">
<INPUT TYPE="hidden" NAME="listenerKey">
<INPUT TYPE="hidden" NAME="pkg">
<INPUT TYPE="hidden" NAME="action" VALUE="delete">
</FORM>

<FORM NAME="denyDel" ACTION="server-ipaccess.dsp" METHOD="POST">
<INPUT TYPE="hidden" NAME="deny">
<INPUT TYPE="hidden" NAME="listenerKey">
<INPUT TYPE="hidden" NAME="pkg">
<INPUT TYPE="hidden" NAME="action" VALUE="delete">
</FORM>



</BODY>





</HTML>

