<html>
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">

    <title>Integration Server - webMethods Cloud Settings</title>
    <link rel="stylesheet" type="text/css" href="/WmRoot/webMethods.css">
    <link rel="stylesheet" type="text/css" href="metadata.css">
    <script src="/WmRoot/webMethods.js.txt"></script>
    <script src="jquery-1.11.1.min.js"></script>
    <script src="metadata.js"></script>
    <script>
function submitForm(){
  if (!verifyRequiredField("applicationForm", "username")) {
    alert("User Name is required.");
    return false;
  }
  if (!(verifyRequiredField("applicationForm", "iliveURL"))) {
    alert("webMethods Cloud URL is required.");
    return false;
  }

  return true;
}
</script>
</head>

<body onLoad="setNavigation('integration-live-tenant-account.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_webMethodsCloud_SettingsScrn');">

<FORM id ="applicationForm" NAME="applicationForm" action="integration-live-tenant-account.dsp" method="POST">

  <TABLE WIDTH="100%">

    <tr>
      <td class="breadcrumb" colspan="3">
        webMethods Cloud &gt; Settings
      </td>
     </tr>
     %ifvar operation -notempty%
        %invoke wm.client.integrationlive.account:updateAccountInfo%
            %ifvar message%
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td class="message" colspan="2">%value message%</td></tr>
            %endif%
            %onerror%
                <tr><td colspan="2">&nbsp;</td></tr>
                <tr><td class="message" colspan=2>%value errorMessage%</td></tr>
            %endinvoke%
     %endif%

            <tr>
            <td width="70%">
                <table width="100%" class="tableView">
                    <tr>
                        <td class="heading" colspan="2">Settings</td>
                    </tr>
                    %invoke wm.client.integrationlive.account:getAccountInfo%
                    <tr>
                        <td class="oddrow" nowrap>User Name</td>
                        <td class="oddrow-l">
                            <input name="username" type="text" value="%value username%" size="50" >
                         </td>
                    </tr>
                    <tr>
                        <td class="evenrow" nowrap>Password</td>
                        <td class="evenrow-l">
                             <input name="password" type="password" value="%value password%" size="50" >
                         </td>
                    </tr>
                    <tr>
                        <td class="oddrow" nowrap>webMethods Cloud URL</td>
                        <td class="oddrow-l">
                             <input name="iliveURL" type="text" value="%value iliveURL%" size="50" >
                        </td>
                    </tr>
                    %endinvoke%
                </table>
             </td>

             <td width="28%">
              &nbsp;
            </td>
            </form>
            </tr>
            <tr>
                <input type="hidden" name="operation" value="save"/>
                <td class="action" >
                     <input type="submit" name="submit" value="Update Settings" onclick="return submitForm()"/>
                </td>
                <td width="28%">
                  &nbsp;
                </td>
            </tr>
        </table>
    </body>
</html>
