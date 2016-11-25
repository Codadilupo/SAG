<html>
    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <title>ServerUI</title>
        <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
        <base target="_self">
        <style>
            .listbox { width: 100%; }
        </style>

        <script>
            function trim(str)
            {
                var retval = "";
                var start = str.length;
                var end = 0;
                for (i = 0; i < str.length; i++) {
                    if (start > i) {
                        if (! /\s/.test(str.charAt(i))) {
                            start = i;
                        }
                    }

                    if (! /\s/.test(str.charAt(i))) {
                        end = i;
                    }
                }

                if (start <= end) {
                    retval = str.substr(start, (end - start + 1));
                }

                return retval;
            }

            function checkLegalUserName(username)
            {
                var illegalChars = "\"\\\<&;";

                for (var i = 0; i < illegalChars.length; i++) {
                    if (username.indexOf(illegalChars.charAt(i)) >= 0) {
                        return illegalChars.charAt(i);
                    }
                }
                return "";
            }

            function containsNonAscii(username)
            {
                // Test for printable ascii characters only and return the opposite.
                var illegalRE = /^[\040-\177]*$/
                return ! illegalRE.test(username);
            }

            function checkClaims(form, name, values)
            {
               var claimname = document.getElementById(name).value;
               var claimvalues = document.getElementById(values).value;
               var username = document.getElementById("name").value;

               if (claimname == "") {
                alert("A Claim name must be specified.");
                return false;
              }
              if (claimvalues == "") {
                alert("One or more claim values must be specified.");
                return false;
              }

             form.action.value = "addidtokenclaim";
             form.tokenclaimname.value = claimname;
             form.tokenclaimvalues.value = claimvalues;

              form.submit();
              return true;
            }

         </script>
    </head>

    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>

    <BODY onLoad="setNavigation('users.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_AddRemoveUsersScrn');">
        <table width=100% colspan=4>

            <tr>
                <td colspan=2 class="breadcrumb">
                    Security &gt;
                    User Management &gt;
                    Add and Remove OpenID Provider Users &gt;
                    Add and Remove OpenID Provider User Claims &gt;
                   %ifvar action equals('editidtokenclaim')%
                    Edit OpenID Provider User ID Token Claims
                   %else%
                    Add OpenID Provider User ID Token Claims
                   %endif%
                </td>
            </tr>

 %ifvar action equals('addidtokenclaim')%
  %invoke wm.server.access:addIdTokenClaim%
    %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
      <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value -htmlall message%</TD></TR>
    %endif%
    %ifvar warning%
      <tr><td colspan="2">&nbsp;</td></tr>
      <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value encode(htmlall) warning%</TD></TR>
    %endif%
  %endinvoke%
%endif%

            <form id="revert" name="revert" method="POST" action="users.dsp">
            </form>

            <tr>
                <td colspan=4>
                    <ul class="listitems">
                        <li class="listitem"><a href="users-provider-addremove-claims.dsp?name=%value name%&provider=%value provider%">Return to Add and Remove OpenID Provider Users Claims</a></li>
                    </ul>
                </td>
            </tr>
            <tr>
              <td><img src="images/blank.gif" height=10 width=10></td>
              <td>
            <table class="tableView">
                <tr>
                    <td class="heading" colspan=2>OpenID Provider User Claims</td>
                </tr>
                <tr>
                  <td nowrap valign="top" class="oddrow">OpenID Provider User Name</td>
                  <td class="oddrow-1" >%value name%</td>
                </tr>
                <tr>
                  <td class="evenrow">OpenID Provider</td>
                  <td class="evenrow-1" >%value provider%</td>
                </tr>
            </table>
            </td>
            </tr>
            <tr>
                    <td><img src="images/blank.gif" height=10 width=10></td>
                    <td>
                    <form id="addidtokenclaim" name="addidtokenclaim" method="POST" action="users-provider-addtoken-claims.dsp">

                        <table class="tableView" width="75%">

                            <tr>
                                <td class="heading" colspan=2>ID Token Claims</td>
                            </tr>
                            <tr>
                              <td nowrap valign="top" class="oddrow" width="25%">Claim Name</td>
                              %ifvar action equals('editidtokenclaim')%
                              <td class="oddrow-1">%value tokenclaimname%
                              %else%
                              <td class="oddrow-1">
                                <INPUT NAME="tokenclaimname" id="tokenclaimname" TYPE="TEXT" SIZE="60">
                              %endif%
                              </td>
                              </tr>
                              <tr>
                              <td class="oddrow">Enter Claim values separated by commas</td>
                                %ifvar action equals('editidtokenclaim')%
                                  <td class="oddrow-1"><textarea style="width:100%;" wrap="off" rows="5" name="tokenclaimvalues" id="tokenclaimvalues" cols="20">%value tokenclaimvalues%</textarea></td>
                                %else%
                                  <td class="oddrow-1"><textarea style="width:100%;" wrap="off" rows="5" name="tokenclaimvalues" id="tokenclaimvalues" cols="20"></textarea></td>
                                %endif%
                            </tr>
                             <tr>
                                   %ifvar action equals('editidtokenclaim')%
                                    <td class="action" colspan=2>
                                        <INPUT type="button" value="Update" onClick="checkClaims(document.editclaims, 'tokenclaimname', 'tokenclaimvalues');">
                                     </td>
                                   %else%
                                    <td class="action" colspan=2>
                                        <INPUT type="button" value="Save" onClick="checkClaims(document.claims, 'tokenclaimname', 'tokenclaimvalues');">
                                    </td>
                                   %endif%
                            </tr>
                        </table>
                    </form>
                    </td>

                    <tr>
                      <td><img src="images/blank.gif" height=10 width=10></td>
                    </tr>
        </table>

    <form name="claims" action="users-provider-addtoken-claims.dsp" method="POST">
            <input type="hidden" name="provider" id="provider" value="%value provider%">
            <input type="hidden" name="name" id="name" value="%value name%">
            <input type="hidden" name="action" id="action" value="%value action%">
            <input type="hidden" name="tokenclaimname" id="tokenclaimname" value="%value tokenclaimname%">
            <input type="hidden" name="tokenclaimvalues" id="tokenclaimvalues" value="%value tokenclaimvalues%">
            <input type="hidden" name="tokenname" id="tokenname" value="%value tokenname%">
            <input type="hidden" name="tokenvalues" id="tokenvalues" value="%value tokenvalues%">
    </form>

    <form name="editclaims" action="users-provider-addremove-claims.dsp" method="POST">
            <input type="hidden" name="provider" id="provider" value="%value provider%">
            <input type="hidden" name="name" id="name" value="%value name%">
            <input type="hidden" name="action" id="action" value="%value action%">
            <input type="hidden" name="tokenclaimname" id="tokenclaimname" value="%value tokenclaimname%">
            <input type="hidden" name="tokenclaimvalues" id="tokenclaimvalues" value="%value tokenclaimvalues%">
            <input type="hidden" name="tokenname" id="tokenname" value="%value tokenname%">
            <input type="hidden" name="tokenvalues" id="tokenvalues" value="%value tokenvalues%">
    </form>

    </body>
</html>


