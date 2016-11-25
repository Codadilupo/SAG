%comment%----- Displays adapter type deployment data -----%endcomment%

<HTML>
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" CONTENT="-1">
    <title>About</title>
    <link rel="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css"></link>
	<Link REL="stylesheet" TYPE="text/css" HREF="/WmART/webMethods.css"></LINK>
    <SCRIPT SRC="/WmRoot/webMethods.js.txt"></SCRIPT>
</head>


%invoke wm.art.admin:getAdapterTypeOnlineHelp%
%onerror%
%endinvoke%
<BODY onLoad="setNavigation('About.dsp', '%value encode(javascript) helpsys%', 'foo');">
    %invoke wm.art.admin:retrieveAdapterTypeData%
    <table width="100%">
    <tr>
       <td class="breadcrumb" colspan=5>Adapters &gt; %value displayName% &gt; About</td>
    </tr>
    <tr>
    <td colspan=2>
        <ul>
        <li><a href="ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&dspName=.LISTRESOURCES">Return to %value displayName% Connections
        </a></ul>
    </td>
    </tr>

        <tr>
            <td>
<table class="tableView">

    <tr>
        <td class="heading" colspan=5>About %value displayName%</td>
    </tr>

    <tr class="subheading3">
        <td colspan=5>Copyright</td>
    </tr>
    %ifvar THIRDPARTYCOPYRIGHTURL -isnull%
      %ifvar vendorName equals('Software AG')%
      <tr>
      <script>writeTDnowrap('row');</script>
      <img src="/WmRoot/images/SAG_emblem_79x31.gif" border=0></td>
      <script>writeTD('rowdata-l');swapRows();</script>
      <p>
		Copyright &copy; 1996 - 2016 Software AG, Darmstadt, Germany and/or Software AG USA Inc., 
		Reston, VA, USA, and/or its subsidiaries and/or its affiliates and/or their licensors.. </p>

		<p>The name Software AG and all Software AG product names are either trademarks or registered trademarks of Software AG and/or Software AG USA Inc. and/or its subsidiaries and/or its affiliates and/or their licensors. Other company and product names mentioned herein may be trademarks of their respective owners. 
		Detailed information on trademarks and patents owned by Software AG and/or its subsidiaries is located at http://softwareag.com/licenses.</p>

		<p>This software may include portions of third-party products. For third-party copyright notices, license terms, additional rights or restrictions, please refer to "License Texts, Copyright Notices and Disclaimers of Third Party Products". For certain specific third-party license restrictions, please refer to section E of the Legal Notices available under "License Terms and Conditions for Use of Software AG Products / Copyright and Trademark Notices of Software AG Products". These documents are part of the product documentation, located at http://softwareag.com/licenses and/or in the root installation directory of the licensed product(s). 
		Use, reproduction, transfer, publication or disclosure is prohibited except as specifically provided for in your License Agreement with Software AG.
		</p>
		</td>
      %else%
      <script>writeTDnowrap('row');</script>
      Copyright
      <script>writeTD('rowdata-l');swapRows();</script>
       %comment%
        The adapter is not a webMethods adapter and
        they didn't provide any copyright information.
       %end%
      </td>
      %endif%
    %else%
    <script>writeTDnowrap('row');</script>
    Copyright
    <script>writeTD('rowdata-l');swapRows();</script>
    %value THIRDPARTYCOPYRIGHTURL none%
    %endif%
    </td>
	</tr>
    <tr>
    <script>writeTDnowrap('row');</script>
    Description</td>
    <script>writeTD('rowdata-l');swapRows();</script>
    %value description%</td>
    </tr>
    <tr>
    <script>writeTDnowrap('row');</script>
    Adapter Version</td>
    <script>writeTD('rowdata-l');swapRows();</script>
    %value adapterVersion%
    &nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr>
    <script>writeTDnowrap('row');</script>Updates</td>
    <script>writeTD('rowdata-l');swapRows();</script>
    %ifvar installedUpdates%
       %loop installedUpdates%
          %value%<br>
       %endloop%
    %else%
       None
    %endif%
    </td>
    </tr>
    <tr>
    <script>writeTDnowrap('row');</script>
    Vendor Name</td>
    <script>writeTD('rowdata-l');swapRows();</script>
    %value vendorName%</td>
    </tr>
    %endinvoke%
   </table>
   </table>
</body>
</HTML>
