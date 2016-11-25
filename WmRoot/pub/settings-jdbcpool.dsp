<HTML>
<HEAD>
<META http-equiv="Pragma" content="no-cache">
<META http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">

<TITLE>Integration Server Settings</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
<SCRIPT SRC="webMethods.js.txt"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
  function confirmDeletePool (alias) {
    var msg = "OK to delete Pool Alias '"+alias+"' ?";
    if (confirm (msg)) {
      return true;
    } else return false;
  }
  function confirmDeleteDriver (alias) {
    var msg = "OK to delete Driver Alias '"+alias+"' ?";
    if (confirm (msg)) {
      return true;
    } else return false;
  }
  function confirmReload (alias) {
    var msg = "OK to restart Functional Alias '"+alias+"' ?";
    if (confirm (msg)) {
      return true;
    } else return false;
  }
</SCRIPT>
</HEAD>
<BODY onLoad="setNavigation('settings-jdcbpool.dsp','/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_JDBC_PoolsScrn');">
<FORM NAME="form1">
  <INPUT NAME="internal" TYPE="hidden" VALUE="%value encode(htmlattr) internal%">
  <INPUT NAME="isolationlevel" TYPE="hidden" VALUE="%value encode(htmlattr) function.isolationlevel%">
  <INPUT NAME="function.cache" TYPE="hidden" VALUE="%value encode(htmlattr) function.cache%">
  <INPUT NAME="function.autocommit" TYPE="hidden" VALUE="%value encode(htmlattr) function.autocommit%">
  <INPUT NAME="function.pool" TYPE="hidden" VALUE="%value encode(htmlattr) function.pool%">
  <INPUT NAME="function.description" TYPE="hidden" VALUE="%value encode(htmlattr) function.description%">
  <TABLE width="100%">
    <TR>
      <TD class="breadcrumb" colspan="7">
          Settings &gt;
          JDBC Pools
      </TD>
    </TR>
    %switch funct%
      %case 'DeleteDriver'%
        %invoke wm.server.jdbcpool:deleteDriverAlias%
          %ifvar message%
            <TR><TD colspan="7">&nbsp;</TD></TR>
            <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
            <TR><TD colspan="7">&nbsp;</TD></TR>
          %endif%
        %onerror%
          <TR><TD colspan="7">&nbsp;</TD></TR>
          <TR><TD class="message" colspan=7>%value errorMessage encode(html)%</TD></TR>
          <TR><TD colspan="7">&nbsp;</TD></TR>
        %endinvoke%
      %case 'DeletePool'%
        %invoke wm.server.jdbcpool:deletePoolAlias%
          %ifvar message%
            <TR><TD colspan="7">&nbsp;</TD></TR>
            <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
            <TR><TD colspan="7">&nbsp;</TD></TR>
          %endif%
        %onerror%
          <TR><TD colspan="7">&nbsp;</TD></TR>
          <TR><TD class="message" colspan=7>%value errorMessage encode(html)%</TD></TR>
          <TR><TD colspan="7">&nbsp;</TD></TR>
        %endinvoke%
      %case 'Test'%
        %invoke wm.server.jdbcpool:testPool%
          %ifvar message%
            <TR><TD colspan="7">&nbsp;</TD></TR>
            <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
            <TR><TD colspan="7">&nbsp;</TD></TR>
          %endif%
        %onerror%
          <TR><TD colspan="7">&nbsp;</TD></TR>
          <TR><TD class="message" colspan=7>%value errorMessage encode(html)%</TD></TR>
          <TR><TD colspan="7">&nbsp;</TD></TR>
        %endinvoke%
      %case 'PoolTest'%
        %invoke wm.server.jdbcpool:testPoolAlias%
          %ifvar message%
            <TR><TD colspan="7">&nbsp;</TD></TR>
            <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
            <TR><TD colspan="7">&nbsp;</TD></TR>
          %endif%
        %onerror%
          <TR><TD colspan="7">&nbsp;</TD></TR>
          <TR><TD class="message" colspan=7>%value errorMessage encode(html)%</TD></TR>
          <TR><TD colspan="7">&nbsp;</TD></TR>
        %endinvoke%
      %case 'Apply'%
        %invoke wm.server.jdbcpool:restart%
          %ifvar message%
            <TR><TD colspan="7">&nbsp;</TD></TR>
            <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
            <TR><TD colspan="7">&nbsp;</TD></TR>
          %endif%
        %onerror%
          <TR><TD colspan="7">&nbsp;</TD></TR>
          <TR><TD class="message" colspan=7>%value errorMessage encode(html)%</TD></TR>
          <TR><TD colspan="7">&nbsp;</TD></TR>
        %endinvoke%
      %case%
        %ifvar message%
          %ifvar addEditACT%
            %ifvar addEditACT equals('addPool')%
                <TR><TD colspan="7">&nbsp;</TD></TR>
				<TR><TD class="message" colspan=7>Pool Alias %value message encode(html)% added.</TD></TR>
                <TR><TD colspan="7">&nbsp;</TD></TR>
            %endif%
            %ifvar addEditACT equals('clonePool')%
                <TR><TD colspan="7">&nbsp;</TD></TR>
				<TR><TD class="message" colspan=7>Pool Alias %value message encode(html)% copied.</TD></TR>
                <TR><TD colspan="7">&nbsp;</TD></TR>
            %endif%
            %ifvar addEditACT equals('updatePool')%
                <TR><TD colspan="7">&nbsp;</TD></TR>
				<TR><TD class="message" colspan=7>Pool Alias %value message encode(html)% updated. You must restart the Server before the updated settings take effect.</TD></TR>
                <TR><TD colspan="7">&nbsp;</TD></TR>
            %endif%
            %ifvar addEditACT equals('addDriver')%
                <TR><TD colspan="7">&nbsp;</TD></TR>
				<TR><TD class="message" colspan=7>Driver Alias %value message encode(html)% added.</TD></TR>
                <TR><TD colspan="7">&nbsp;</TD></TR>
            %endif%
            %ifvar addEditACT equals('updateDriver')%
                <TR><TD colspan="7">&nbsp;</TD></TR>
				<TR><TD class="message" colspan=7>Driver Alias %value message encode(html)% updated. You must restart all affected functions before updated settings will take effect.</TD></TR>
                <TR><TD colspan="7">&nbsp;</TD></TR>
            %endif%
            %rename addEditACT oldAddEditACT%
          %else%
             <TR><TD colspan="7">&nbsp;</TD></TR>
			 <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
             <TR><TD colspan="7">&nbsp;</TD></TR>
          %endif%

        %endif%
      %endswitch%

    %invoke wm.server.jdbcpool:getFunctionalDefinitions%
      %ifvar message%
        <TR><TD colspan="7">&nbsp;</TD></TR>
        <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
        <TR><TD colspan="7">&nbsp;</TD></TR>
      %endif%

    <TR>
      <TD colspan="7">
        <ul class="listitems">
          <li class="listitem"><a href="settings-editjdbcpool.dsp?funct=Add">Create a Pool Alias Definition</a></li>
          <li class="listitem"><a href="settings-clonejdbcpool.dsp?funct=Clone">Copy a Pool Alias Definition</a></li>
          <li class="listitem"><a href="settings-editjdbcdriver.dsp?funct=Add">Create a Driver Alias Definition</a></li>
          %ifvar internal equals(true)%
          <li class="listitem"><a href="settings-editjdbcfunction.dsp?funct=Add&=%value internal encode(url)%">Create a new Funtional Alias (webMethods internal use only)</a></li>
          %endif%
        </ul>
      </td>
    </tr>
    <tr>
    <TD colspan="7">
       <TABLE width="100%" class="tableView">
       <TR>
      <TD class="heading" colspan="10">Functional Alias Definitions</TD>
    </TR>
    <TR>
      <TD class="oddcol-l" nowrap>Function Name</TD>
      <TD class="oddcol-l" nowrap>Associated Pool Alias</TD>
      %ifvar internal equals(true)%
        <TD class="oddcol" nowrap>Edit Functional Definition</TD>
      %else%
        <TD class="oddcol" nowrap>Edit Function</TD>
      %endif%
      <TD class="oddcol" nowrap>Test</TD>
      <TD class="oddcol" nowrap>Restart Function</TD>
      <TD class="oddcol-l" nowrap>Function Description</TD>
      <TD class="oddcol" nowrap>Min Connections</TD>
      <TD class="oddcol" nowrap>Max Connections</TD>
      <TD class="oddcol" nowrap>Total Connections</TD>
      <TD class="oddcol" nowrap>Available Connections</TD>
    </TR>

    %loop functions%
    <TR>
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value function.name encode(html)%</TD>
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%ifvar function.pool%
         <A href="settings-editjdbcpool.dsp?funct=Display&pool=%value function.pool encode(url)%">
           %value function.pool encode(html)%
         </A>%else%&nbsp;%endif%
      </TD>
      <SCRIPT>writeTDnowrap("rowdata");</SCRIPT>
        <A href="settings-editjdbcfunction.dsp?funct=Edit&function=%value function.name encode(url)%&internal=%value ../internal encode(url)% ">
          Edit
        </A>
      </TD>
      <SCRIPT>writeTD("rowdata");</SCRIPT>
        <A href="settings-jdbcpool.dsp?funct=Test&function=%value function.name encode(url)%">
          <IMG src="icons/checkdot.png" border="none">
        </A>
      </TD>
      <SCRIPT>writeTDnowrap("rowdata");</SCRIPT>
        <A href="settings-jdbcpool.dsp?funct=Apply&function=%value function.name encode(url)%" onClick="return confirmReload('%value function.name encode(javascript)%');">
          Restart
        </A>
      </TD>
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value function.description encode(html)%</TD>      
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value function.min encode(html)%</TD>
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value function.max encode(html)%</TD>      
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value function.curr encode(html)%</TD>
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value function.avail encode(html)%</TD>
      <SCRIPT>swapRows();</SCRIPT>
    </TR>
    %endloop%

    %onerror%
    <TR>
      <TD class="message" colspan="7">%value errorMessage encode(html)%</TD>
    </TR>
    %endinvoke%
     </TD>
     </TR>
    </TABLE>

    <TABLE width="100%" class="tableView">
    <TR><TD colspan="7">&nbsp;</TD></TR>
    <TR>
       <TD class="heading" colspan="6">Pool Alias Definitions</TD>
    </TR>
    <TR>
       <TD class="oddcol-l" nowrap>Pool Alias</TD>
       <TD class="oddcol-l" nowrap>Associated Driver Alias</TD>
       <TD class="oddcol" nowrap>Edit Pool Alias</TD>
       <TD class="oddcol" nowrap>Test</TD>
       <TD colspan="1" class="oddcol" nowrap>Delete Pool Alias</TD>
       <TD class="oddcol-l" nowrap>Pool Alias Description</TD>
    </TR>
    <SCRIPT>resetRows();</SCRIPT>

    %invoke wm.server.jdbcpool:getPoolDefinitions%
    %ifvar message%
    <TR><TD colspan="7">&nbsp;</TD></TR>
    <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
    <TR><TD colspan="7">&nbsp;</TD></TR>
    %endif%

    %loop pools%
    <TR>
       <SCRIPT>writeTDnowrap("rowdata-l");</SCRIPT>
         <A href="settings-editjdbcpool.dsp?funct=Display&pool=%value pool.name encode(url)%">
           %value pool.name encode(html)%
         </A>
       </TD>
       <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value pool.driver encode(html)%</TD>     
       <SCRIPT>writeTDnowrap("rowdata");</SCRIPT>
         <A href="settings-editjdbcpool.dsp?funct=Edit&pool=%value pool.name encode(url)%">
           Edit
         </A>
       </TD>
      <SCRIPT>writeTD("rowdata");</SCRIPT>
        <A href="settings-jdbcpool.dsp?funct=PoolTest&pool=%value pool.name encode(url)%">
          <IMG src="icons/checkdot.png" border="none">
        </A>
      </TD>
       <SCRIPT>writeTDspan("rowdata","1");</SCRIPT>
         <A href="settings-jdbcpool.dsp?funct=DeletePool&pool=%value pool.name encode(url)%" onClick="return confirmDeletePool('%value pool.name encode(javascript)%');">
           <IMG src="icons/delete.png" border="none">
         </A>
       </TD>
       <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value pool.description encode(html)%</TD>
    </TR>
    <SCRIPT>swapRows();</SCRIPT>
    %endloop%

    %onerror%
    <TR>
      <TD class="message" colspan="7">%value errorMessage encode(html)%</TD>
    </TR>
    %endinvoke%

    <TR><TD colspan="7">&nbsp;</TD></TR>
    <TR>
      <TD class="heading" colspan="6">Driver Alias Definitions</TD>
    </TR>
    <TR>
      <TD class="oddcol-l" nowrap>Driver Alias</TD>
      <TD class="oddcol-l" nowrap>Class Name</TD>
      <TD class="oddcol" nowrap>Edit Driver Alias</TD>
      <TD colspan="1" class="oddcol" nowrap>Delete Driver Alias</TD>
      <TD colspan="2" class="oddcol-l" nowrap>Description</TD>
    </TR>
    <SCRIPT>resetRows();</SCRIPT>

    %invoke wm.server.jdbcpool:getDriverDefinitions%
    %ifvar message%
    <TR><TD colspan="7">&nbsp;</TD></TR>
    <TR><TD class="message" colspan=7>%value message encode(html)%</TD></TR>
    <TR><TD colspan="7">&nbsp;</TD></TR>
    %endif%

    %loop drivers%
    <TR>
      
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value driver.name encode(html)%</TD>
      <SCRIPT>writeTDnowrap("row-l");</SCRIPT>%value driver.class encode(html)%</TD>
      <SCRIPT>writeTDnowrap("rowdata");</SCRIPT>
        <A href="settings-editjdbcdriver.dsp?funct=Edit&driver=%value driver.name encode(url)%">
          Edit
        </A>
      </TD>
      <SCRIPT>writeTDspan("rowdata","1");</SCRIPT>
        <A href="settings-jdbcpool.dsp?funct=DeleteDriver&driver=%value driver.name encode(url)%" onClick="return confirmDeleteDriver('%value driver.name encode(javascript)%');">
          <IMG src="icons/delete.png" border="none">
        </A>
      </TD>
      <SCRIPT>writeTDspan("row-l", "2");</SCRIPT>%value driver.description encode(html)%</TD>
     </TR>
     <SCRIPT>swapRows();</SCRIPT>
    %endloop%

    %onerror%
    <TR>
      <TD class="message" colspan="7">%value errorMessage encode(html)%</TD>
    </TR>
    %endinvoke%
     <SCRIPT>resetRows();</SCRIPT>
    </TR>
    </TABLE>
  </TABLE>
</FORM>
</BODY>
</HTML>
