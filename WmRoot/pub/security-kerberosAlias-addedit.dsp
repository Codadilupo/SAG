
<HTML>
  <HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js.txt">
    </SCRIPT>
    <base target="_self">
	<style>
	  .listbox  { width: 100%; }
	</style>
  </HEAD>
  %ifvar action equals('edit')%
  <BODY setNavigation('security-kerberos.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_EditKerberosAlias');">
  %else%
  <BODY setNavigation('security-kerberos.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_AddKerberosAliasScrn');">
  %endif%
    <TABLE width="100%">
      <TR>
        <TD class="menusection-Security" colspan="2">
            Security &gt;
            Kerberos &gt;
            %ifvar action equals('edit')%
                %value KrbAliasName% &gt; Edit
            %else%
                Add Kerberos Alias
            %endif%
        </TD>
      </TR>
      <TR>
        <TD colspan="2">
          <UL>
            <LI><A HREF="security-kerberos.dsp">Return to Kerberos Settings</A></LI>
          </UL>
        </TD>
      </TR>
      <TR>
        <TD><IMG SRC="images/blank.gif" height="10" width="10"></TD>
        <TD>
      <TABLE class="tableForm">
        <TR>
            <TD colspan="2" class="heading">Kerberos Alias Details</TD>
        </TR>
          <FORM NAME="addform" ACTION="security-kerberos.dsp" METHOD="POST">
          <SCRIPT LANGUAGE="JavaScript">
		
          function confirmEdit ()
          {
            if ((document.addform.KrbAliasName.value == "") ||
                (document.addform.JaasContext.value == "")  ||
                (document.addform.PrincipalName.value == "") )
            {
              alert ("You must specify the arguments (Kerberos Alias Name, Jaas Context, Principal Name) for the Alias.");
			  return false;
            }
			
			if(!checkName())
				return false;
				
			if(!checkDuplicate())
				return false;
				
            document.addform.submit();
			return true;
          }

        function checkDuplicate()
        {
          var aliasArray;
          if (! document.addform.aliases)
          {
            aliasArray = new Array(0);
          }
          else if (! document.addform.aliases.length)
          {
            aliasArray = new Array(1);
            aliasArray[0] = document.addform.aliases.value;
          }
          else
          {
            var aliasesLen = document.addform.aliases.length;
            aliasArray = new Array(aliasesLen);
            for (i = 0; i < aliasesLen; i++)
            {
              aliasArray[i] = document.addform.aliases[i].value;
            }
          }            
          for (ind = 0; ind < aliasArray.length; ind++)
          {
            if (aliasArray[ind] == document.addform.KrbAliasName.value)
            {
              var confirmation = confirm("Do you want to overwrite existing Kerberos Alias " + document.addform.KrbAliasName.value + "?");
              if (confirmation == false)
              {
                return false;
              }
	        }
	      }
          return true;
         }          
		 
          function confirmAdd ()
          {
            if ((document.addform.KrbAliasName.value == "") ||
                (document.addform.JaasContext.value == "")  ||
                (document.addform.PrincipalName.value == "") )
            {
              alert ("You must specify the arguments (Kerberos Alias Name, Jaas Context, Principal Name) for the Alias.");
			  return false;
            }		  
			
			if(!checkName())
				return false;
				
			if(!checkDuplicate())
				return false;
				
			document.addform.submit();
			return true;
		  }
		  
			function checkName()
			{
				var name = document.addform.KrbAliasName.value;
				if (name.charAt(0) == " ")
				{
					alert ("Kerberos alias name begins with illegal character: ' '");
					return false;
				}
				return true;
			}
         
          </SCRIPT>
          <TR>
            <TD class="oddrow">Alias Name</TD>
            <TD class="oddrow-l">
              <INPUT NAME="KrbAliasName" VALUE="%value KrbAliasName%"> </TD>
          </TR>
          <TR>
            <TD class="evenrow">JAAS Context</TD>
            <TD class="oddrow-l">
              <INPUT NAME="JaasContext" VALUE="%value JaasContext%"> </TD>
          </TR>		
          <TR>
            <TD class="oddrow">Principal Name</TD>
            <TD class="oddrow-l">
              <INPUT NAME="PrincipalName" VALUE="%value PrincipalName%"> </TD>
          </TR>	
          <TR>
            <TD class="evenrow">Principal Password</TD>
            <TD class="oddrow-l">
              <INPUT type="password" NAME="PrincipalPassword" VALUE="%value PrincipalPassword%" autocomplete="off"> </TD>
          </TR>	
          <TR>
            <TD class="evenrow">Retype Principal Password</TD>
            <TD class="oddrow-l">
              <INPUT type="password" NAME="retype_krbClientPassword" VALUE="%value PrincipalPassword%" autocomplete="off"> </TD>
          </TR>			  
          <TR>
            <TD class="oddrow">Service Principal Name</TD>
            <TD class="oddrow-l">
              <INPUT NAME="ServicePrincipalName" VALUE="%value ServicePrincipalName%"> </TD>
          </TR>	
		  <TR>
			<TD class="evenrow">Service Principal Name Format</TD>
			<TD class="evenrow-l">
			<label>
				<input type="radio" name="ServicePrincipalNameFormat" value="hostbased" 
					%ifvar ServicePrincipalNameFormat equals('username')%
					%else%checked%endif% />
				host-based
			</label>
			<label>
				<input type="radio" name="ServicePrincipalNameFormat" value="username" 
					%ifvar ServicePrincipalNameFormat equals('username')%checked%endif% />
				username
			</label>
			</TD>
		  </TR>

          %invoke wm.server.kerberosAlias:listKerberosAliases%

          <TR>
          %loop -struct krbAliases%
            %scope #$key%
            <TD>
              <INPUT TYPE="hidden" NAME="aliases" VALUE="%value KrbAliasName%" />
            </TD>
            %endscope%
          %endloop%
          </TR>

          <TR>
            <TD colspan=2 class="action">
              <INPUT TYPE="hidden" NAME="args" VALUE="xxx">
            %ifvar action equals('edit')%
              <INPUT TYPE="hidden" NAME="action2" VALUE="edit">
              <INPUT TYPE="hidden" NAME="oldAliasName" VALUE="%value KrbAliasName%">
              <INPUT type="button" value="Save Changes" onclick="return confirmEdit();">
            %else%
              <INPUT TYPE="hidden" NAME="action2" VALUE="add">
              <INPUT type="button" value="Save Changes" onclick="return confirmAdd();">
            %endif%
            </TD>
          </TR>
          
          

          
        </FORM>
      </TABLE>
    </TD>
  </TR>
</TABLE>

    </BODY>
  </HTML>
