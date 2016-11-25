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


            function deletetokenclaims(form, name)
            {
                if (confirm("Are you sure you want to remove ID Token Claim "+name+"?"))
                {
                    form.action.value = "removeidtokenclaim";
                    form.tokenclaimname.value = name;
                    return true;
                }
                return false;
            }

            function edittokenclaim(form, name, values)
            {
                form.action.value = "editidtokenclaim";
                form.tokenclaimname.value = name;
                form.tokenclaimvalues.value = values;
                return true;
            }

            function deleteinfoclaims(form, name)
            {

                if (confirm("Are you sure you want to remove UserInfo Claim "+name+"?"))
                {
                    form.action.value = "removeuserinfoclaim";
                    form.infoclaimname.value = name;
                    return true;
                }
                return false;
            }

            function editinfoclaim(form, name, values)
            {
                form.action.value = "edituserinfoclaim";
                form.infoclaimname.value = name;
                form.infoclaimvalues.value = values;
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
                    Add and Remove OpenID Provider User Claims
                </td>
            </tr>

 %ifvar action equals('adduserinfoclaim')%
  %invoke wm.server.access:addUserInfoClaim%
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

 %ifvar action equals('removeidtokenclaim')%
  %invoke wm.server.access:removeIdTokenClaim%
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

 %ifvar action equals('removeuserinfoclaim')%
  %invoke wm.server.access:removeUserInfoClaim%
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

            <tr>
                <td colspan=4>
                    <ul class="listitems">
                        <li class="listitem"><a href="users-provider-addremove.dsp">Return to Add and Remove OpenID Provider Users</a></li>
                        <li class="listitem"><a href="users-provider-addtoken-claims.dsp?name=%value name%&provider=%value provider%">Add ID Token Claim</a></li>
                        <li class="listitem"><a href="users-provider-addinfo-claims.dsp?name=%value name%&provider=%value provider%">Add UserInfo Claim</a></li>
                    </ul>
                </td>
            </tr>
            <tr>
               <td><img src="images/blank.gif" height=10 width=10></td>
                <td>
                    <table class="tableView">
                        <tr>
                            <td class="heading" colspan=2>OpenID Provider User</td>
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
                    <form id="removeidtokenclaims" name="removeidtokenclaims" method="POST" action="users-provider-addremove-claims.dsp">

                        <table class="tableView">
                            <tr>
                                <td class="heading" colspan=4>ID Tokens</td>
                            </tr>

                            <tr>
                              <td class="oddcol" width="100">Name</td>
                              <td class="oddcol" width="375">Claims</td>
                              <td class="oddcol" width="50">Edit</td>
                              <td class="oddcol" width="50">Delete</td>
                            </tr>
                            %invoke wm.server.access:getProviderUserIdTokenClaims%
                            %loop idtokenclaims%
                            <tr>
                              <script>writeTD("rowdata");</script>%value tokenname%</td>
                              <script>writeTD("rowdata");</script>%value tokenvalues%</td>
                              <script>writeTD("rowdata");</script>
                                <a href="javascript:document.edittokenclaims.submit()" onClick="edittokenclaim(document.edittokenclaims, '%value tokenname%','%value tokenvalues%');">Edit</a></td>
                              <script>writeTD("rowdata");</script>
                                 <a href="javascript:document.claims.submit()" onClick="deletetokenclaims(document.claims, '%value tokenname%');" ><img src="icons/delete.png" border="no"></a></td>
                            </tr>
                            <script>swapRows();</script>
                            %endloop%
                            %endinvoke%
                        </table>
                    </form>
                    </td>
                    </tr>
                    <tr>
                      <td><img src="images/blank.gif" height=10 width=10></td>
                      <td>
                    <form id="removeuserinfoclaims" name="removeuserinfoclaims" method="POST" action="users-provider-addremove-claims.dsp">

                        <table class="tableView">

                            <tr>
                                <td class="heading" colspan=4>UserInfo Tokens</td>
                            </tr>

                            <tr>
                              <td class="oddcol" width="100">Name</td>
                              <td class="oddcol" width="375">Claims</td>
                              <td class="oddcol" width="50">Edit</td>
                              <td class="oddcol" width="50">Delete</td>
                            </tr>
                            %invoke wm.server.access:getProviderUserInfoClaims%
                            %loop userinfoclaims%
                            <tr>
                              <script>writeTD("rowdata");</script>%value infoname%</td>
                              <script>writeTD("rowdata");</script>%value infovalues%</td>
                              <script>writeTD("rowdata");</script>
                                <a href="javascript:document.editinfoclaims.submit()" onClick="editinfoclaim(document.editinfoclaims, '%value infoname%', '%value infovalues%');">Edit</a></td>
                              <script>writeTD("rowdata");</script>
                                 <a href="javascript:document.claims.submit()" onClick="deleteinfoclaims(document.claims, '%value infoname%');" ><img src="icons/delete.png" border="no"></a></td>
                            </tr>
                            <script>swapRows();</script>
                            %endloop%
                            %endinvoke%
                        </table>
                    </form>
                    </td>
                    </tr>
                    <tr>
                      <td><img src="images/blank.gif" height=10 width=10></td>
                    </tr>
        </table>

    <form name="claims" action="users-provider-addremove-claims.dsp" method="POST">
            <input type="hidden" name="provider" id="provider" value="%value provider%">
            <input type="hidden" name="name" id="name" value="%value name%">
            <input type="hidden" name="action" id="action" value="%value action%">
            <input type="hidden" name="tokenclaimname" id="tokenclaimname" value="%value tokenclaimname%">
            <input type="hidden" name="tokenclaimvalues" id="tokenclaimvalues" value="%value tokenclaimvalues%">
            <input type="hidden" name="tokenname" id="tokenname" value="%value tokenname%">
            <input type="hidden" name="tokenvalues" id="tokenvalues" value="%value tokenvalues%">
            <input type="hidden" name="infoclaimname" id="infoclaimname" value="%value infoclaimname%">
            <input type="hidden" name="infoclaimvalues" id="infoclaimvalues" value="%value infoclaimvalues%">
            <input type="hidden" name="infoname" id="infoname" value="%value infoname%">
            <input type="hidden" name="infovalues" id="infovalues" value="%value infovalues%">
    </form>

    <form name="edittokenclaims" action="users-provider-addtoken-claims.dsp" method="POST">
            <input type="hidden" name="provider" id="provider" value="%value provider%">
            <input type="hidden" name="name" id="name" value="%value name%">
            <input type="hidden" name="action" id="action" value="%value action%">
            <input type="hidden" name="tokenclaimname" id="tokenclaimname" value="%value tokenclaimname%">
            <input type="hidden" name="tokenclaimvalues" id="tokenclaimvalues" value="%value tokenclaimvalues%">
            <input type="hidden" name="tokenname" id="tokenname" value="%value tokenname%">
            <input type="hidden" name="tokenvalues" id="tokenvalues" value="%value tokenvalues%">
    </form>

    <form name="editinfoclaims" action="users-provider-addinfo-claims.dsp" method="POST">
            <input type="hidden" name="provider" id="provider" value="%value provider%">
            <input type="hidden" name="name" id="name" value="%value name%">
            <input type="hidden" name="action" id="action" value="%value action%">
            <input type="hidden" name="infoclaimname" id="infoclaimname" value="%value infoclaimname%">
            <input type="hidden" name="infoclaimvalues" id="infoclaimvalues" value="%value infoclaimvalues%">
            <input type="hidden" name="infoname" id="infoname" value="%value infoname%">
            <input type="hidden" name="infovalues" id="infovalues" value="%value infovalues%">
    </form>

    </body>
</html>


