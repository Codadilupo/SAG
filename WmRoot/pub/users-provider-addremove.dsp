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

            function checkProvider()
            {
                var userList   = document.form.users.value;
                 var starStart  = /^\*+/;

                if (userList == "") {
                    alert("No users were entered into the list");
                    return false;
                }

                var selectedProvider = trim(document.form.provider.value);
                if (selectedProvider == "") {
                    alert("A Provider must be selected");
                    return false;
                }

                var userNameList = userList.split("\n");
                for (var i = 0; i < userNameList.length; i++) {

                    var userName = trim(userNameList[i]);

                    var rc = checkLegalUserName(userName);

                    if (rc != "") {
                        alert("Username: " + userName + " contains illegal character \"" + rc + "\"");
                        return false;
                    }

                    if (containsNonAscii(userName)) {
                        alert("Username: " + userName + " contains non-ASCII character(s)");
                        return false;
                    }
                }

                return true;
            }
        </script>
    </head>

    <SCRIPT SRC="webMethods.js.txt"></SCRIPT>

    <BODY onLoad="setNavigation('users.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_AddRemoveUsersScrn');">
        <table width=100%>

            <tr>
                <td colspan=2 class="breadcrumb">
                    Security &gt;
                    User Management &gt;
                    Add and Remove OpenID Provider Users
                </td>
            </tr>

 %ifvar action equals('addproviderusers')%
  %invoke wm.server.access:addProviderUsers%
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

 %ifvar action equals('removeproviderusers')%
  %invoke wm.server.access:removeProviderUsers%
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
                <td colspan=2>
                    <ul class="listitems">
                        <li class="listitem"><a href="users.dsp">Return to User Management</a></li>
                    </ul>
                </td>
            </tr>

            <tr>
                <td>
                    <form id="form" name="form" method="POST" action="users-provider-addremove.dsp">
                        <input type="hidden" name="action" value="addproviderusers">
                        <table class="tableView" width="60%">
                            <tr>
                                <td class="heading" colspan=2>Create OpenID Provider Users</td>
                            </tr>
                            <tr>
                              <td nowrap valign="top" class="oddrow">OpenID Provider User Names</td>
                              <td class="oddrow-l">One per line<br>
                                <textarea style="width:100%;" wrap="off" rows="5" name="users" id="users" cols="20"></textarea></td>
                            </tr>
                             %invoke wm.server.access:providersList%
                            <tr>
                                <td class="evenrow" colspan=1>  </td>
                                <td class="evenrow-l" colspan=1>Select OpenID Provider (The selected OpenID Provider will be applied to all new OpenID Provider users specified above)
                                    <select class="listbox" onchange="changeScope(this.options[this.selectedIndex].value);" size="1" name="provider">
                                            %loop providers%
                                                       <option>%value name%</option>
                                            %endloop%
                                    </select>
                                </td>
                            </tr>
                                    %endinvoke%
                            <tr>
                                <td class="action" colspan=2>
                                    <input type="submit" value="Create OpenID Provider Users" name="submit" onClick="return checkProvider();" >
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
                </tr>
              <tr>
                  <td>
                    <form id="removeproviderusers" name="removeproviderusers" method="POST" action="users-provider-addremove.dsp">
                        <input type="hidden" name="action" value="removeproviderusers">

                        <table class="tableView" width="60%">
                            <tr>
                                <td class="heading" colspan=4>OpenID Provider Users</td>
                            </tr>

                            <tr>
                              <td class="oddcol">Name</td>
                              <td class="oddcol">OpenID Provider</td>
                              <td class="oddcol">Claims</td>
                              <td class="oddcol">Delete</td>
                            </tr>
                            %invoke wm.server.access:providerUserList%
                            %loop users%
                            <tr>
                              <script>writeTD("rowdata");</script>%value name%</td>
                              <script>writeTD("rowdata");</script>%value provider%</td>
                              <script>writeTD("rowdata");</script>
                                <a href="users-provider-addremove-claims.dsp?name=%value name%&provider=%value provider%">Edit</a></td>
                              <script>writeTD("rowdata");</script>
                                 <a href="users-provider-addremove.dsp?action=removeproviderusers&providername=%value name%" onclick="return confirm('Are you sure you want to remove OpenID Provider user?');"><img src="icons/delete.png" border="no"></a></td>
                            </tr>
                            <script>swapRows();</script>
                            %endloop%
                            %endinvoke%
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
