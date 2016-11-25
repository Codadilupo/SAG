
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
  <BODY onLoad="setNavigation('settings-alias.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_URL_Alias_Edit');">
  %else%
  <BODY onLoad="setNavigation('settings-alias.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_URL_Alias_Create');">
  %endif%
    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan="2">
            Settings &gt;
            URL Aliases &gt;
            %ifvar action equals('edit')%
                %value alias encode(html)% &gt; Edit
            %else%
                Create Alias
            %endif%
        </TD>
      </TR>
      <TR>
        <TD colspan="2">
          <ul class="listitems">
            <li class="listitem"><a href="settings-alias.dsp">Return to URL Aliases</a></li>
          </UL>
        </TD>
      </TR>
      <TR>
        <TD>
      <TABLE class="tableView">
        <TR>
            <TD colspan="3" class="heading">URL Alias Properties</TD>
        </TR>
          <FORM id="addform" NAME="addform" ACTION="settings-alias.dsp" METHOD="POST">
          <SCRIPT LANGUAGE="JavaScript">
          
          var originalAliasName = "%value alias%";
      
          function confirmEdit ()
          {
            if (!confirmRequiredFields())
            {
              return false;
            }
                
                    if (!document.addform.isDefaultPath.checked && !checkLegalName(document.addform.alias.value, "Alias"))
                            return false;
                    if (!checkLegalName(document.addform.urlPath.value, "URL Path"))
                            return false;

                        if (!checkDuplicate("edit"))
                            return false;

             document.addform.submit();
             return true;
           }
          
          function confirmAdd ()
          {             
            if (!confirmRequiredFields())
            {
              return false;
            }
            
            if (!document.addform.isDefaultPath.checked && !checkLegalName (document.addform.alias.value, "Alias"))
              return false;
              
            if (!checkLegalName (document.addform.urlPath.value, "URL Path"))
              return false;
              
            if (!checkDuplicate("add"))
              return false;

            document.addform.submit();
            return true;
          }
          

        function confirmRequiredFields(){
                var portTable = document.getElementById("portMaps");
            var rowCount = 0; 
            
            if (portTable != null){
                rowCount = portTable.rows.length;
              } 
            
                if ((document.addform.alias.value == "" && !document.addform.isDefaultPath.checked) ||
                (document.addform.urlPath.value == "" && rowCount <5 )  )
            {
              alert ("You must specify the arguments (Alias, URL Path) for the URL Alias.");
              return false;
            }
            return true;
        }
        
        function checkDuplicate(updateMode)
        {
          var aliasesArray;
          newAlias = document.addform.alias.value;
          
          if (updateMode == "edit" && originalAliasName == newAlias){
            return true;
          }
         
          if (updateMode == "edit" && originalAliasName == "&lt;EMPTY&gt;" 
                                   && newAlias == "<EMPTY>"){
            return true;
          }
          
          if (! document.addform.aliases)
          {
            aliasesArray = new Array(0);
          }
          else if (! document.addform.aliases.length)
          {
            aliasesArray = new Array(1);
            aliasesArray[0] = document.addform.aliases.value;
          }
          else
          {
            var aliasesLen = document.addform.aliases.length;
            aliasesArray = new Array(aliasesLen);
            for (i = 0; i < aliasesLen; i++)
            {
              aliasesArray[i] = document.addform.aliases[i].value;
            }
          }            
          for (ind = 0; ind < aliasesArray.length; ind++)
          {
            if (aliasesArray[ind] == newAlias)
            {
              var confirmation = confirm("Do you want to overwrite existing alias " + newAlias + "?");
              if (confirmation == false)
              {
                return false;
              }
                }
            }
            return true;
          }

            function checkLegalName(name, fieldName)
          {
            var illegalChars = " #?%'\"<\\";
            
            for (var i=0; i<illegalChars.length; i++)
            {
              if (name.indexOf(illegalChars.charAt(i)) >= 0)
              {
                alert (fieldName + " contains illegal character: '" + illegalChars.charAt(i) + "'");
                return false;
              }
            }
            if (name.indexOf("/") == 0)
            {
              alert (fieldName + " contains illegal leading character: '/'");
              return false;
            }
            if (name.toLowerCase().indexOf("http://") == 0)
            {
              alert (fieldName + " must not start with: 'http://'");
              return false;
            }
            if (name.toLowerCase().indexOf("https://") == 0)
            {
              alert (fieldName + " must not start with: 'https://'");
              return false;
            }
            
            return true;
            }
          
            function enableDisableAlias(){
            if (document.addform.isDefaultPath.checked){
                document.addform.alias.disabled=true;
                document.addform.alias.value="<EMPTY>";
              }
              else{
                document.addform.alias.disabled=false;
                document.addform.alias.value="";
              }
                
            }
          
          function deletePortMapping(id){
            
            var portTable = document.getElementById("portMaps");
            var rowCount = portTable.rows.length;
            for(var i=0; i<rowCount; i++) {
                            var tempRow =   portTable.rows[i];
                
                            if (id == tempRow.id){
                                
                                var hiddenInput = document.getElementById(id+"Hidden");
                hiddenInput.value = "";

                                portTable.deleteRow(i);
                                return false;
                          }
            }
            
            return false;
          }
          
          function addPortMapping(){
                        
                        var portTable = document.getElementById("portMaps");
            var rowCount = portTable.rows.length;           
            var sourceRow = portTable.rows.namedItem("newMapData");
            var newPort = sourceRow.cells[0].firstElementChild.value;
            var newPath = sourceRow.cells[1].firstElementChild.value;
            
            if (newPort == ""){
                            return false;
            }           
            
            if (!checkLegalName(newPath, "URL Path")){
                            return false;
                        }
            
            var insertIndex =-1;
            
            if (rowCount == 4){                 
                insertIndex = 1;
            } else {                            
                for(var i=1; i<rowCount-3; i++) {                               
                                var currentRow =    portTable.rows[i];
                                var portCell = currentRow.cells[0];
                    var currentPort = portCell.firstChild.data;
                    
                    if (currentPort == newPort){                        
                      if (confirm("Port Map for port " + newPort + " already exists. Overwrite URL Path?")){
                            currentRow.cells[1].firstChild.data = newPath;
                            var hiddeninput =currentRow.cells[2].children[1];                           
                            hiddeninput.value=newPort+"#"+newPath;
                            resetPortMappingTable();
                            return false;
                      } else {
                        return false;
                      }
                    }
                    
                    if (currentPort > newPort){
                        insertIndex = i;
                        break;
                    }
                }
                if (insertIndex == -1){
                    insertIndex = rowCount-3;
                }                   
              }
            
            var newTR = portTable.insertRow(insertIndex);           
                    newTR.setAttribute('id',newPort);
            
            var portCell = newTR.insertCell(0);
            var pathCell = newTR.insertCell(1);
            var deleteCell = newTR.insertCell(2);
            
            var t = document.createTextNode(newPort);
            portCell.appendChild(t);
            portCell.setAttribute('class', "evenrowdata-l");

            t = document.createTextNode(newPath);
            pathCell.appendChild(t);
            pathCell.setAttribute('class', "evenrowdata-l");
            pathCell.setAttribute('colspan', "2");
            
            var a = document.createElement("a");
            var img = document.createElement("img");
                        var input = document.createElement("input");
            a.appendChild(img);
            deleteCell.appendChild(a);
            deleteCell.appendChild(input);
            deleteCell.setAttribute('class', "evenrowdata");
            a.setAttribute('href', "#");
            a.setAttribute('onClick', "return deletePortMapping("+ newPort +");");
            img.setAttribute('src', "icons/IS_Delete.png");
            img.setAttribute('border', "none");
            input.setAttribute('id',newPort+"Hidden");
            input.setAttribute("type", "hidden");
            input.name="portMapString";
            input.value=newPort+"#"+newPath;
            var addForm = document.getElementById("addform");
            addForm.appendChild(input);
            
            resetPortMappingTable();
                    
            return false;
          }
          
          function resetPortMappingTable(){
            
            var portTable = document.getElementById("portMaps");
            var sourceRow = portTable.rows.namedItem("newMapData");
            sourceRow.cells[0].firstElementChild.selectedIndex = 0;
            sourceRow.cells[1].firstElementChild.value ="";
            return true;
            
          }
          
          </SCRIPT>
          <TR>
            <TD class="oddrow">Alias</TD>
            <TD class="oddrow-l">
                %ifvar alias equals('<EMPTY>')%
                    <INPUT NAME="alias" size=100 VALUE="&lt;EMPTY&gt;" disabled=true> </TD>
                    <TD class="oddrow-l">
                        <INPUT TYPE="checkbox" checked name=isDefaultPath value=true onclick="enableDisableAlias();">
                %else%
                <INPUT NAME="alias" size=100 VALUE="%value alias encode(htmlattr)%"> </TD>
                %ifvar isDev equals('false')%
                <TD class="oddrow-l">
                %else%
                <TD class="oddrow-l" disabled=true>
                %endif%
                            <INPUT TYPE="checkbox" name=isDefaultPath value=true onclick="enableDisableAlias();">
                        
              %endif%
             Use as empty path alias</TD>
          </TR>
%invoke wm.server.httpUrlAlias:getAlias%
          <TR>
            <TD class="evenrow">Default URL Path</TD>
            %ifvar isDev equals('true')%
              <TD class="evenrowdata-l" colspan="2">%value urlPath encode(html)%</TD>
              <INPUT TYPE="hidden" NAME="urlPath" VALUE="%value urlPath encode(htmlattr)%">
            %else%
            <TD class="evenrow-l" colspan="2">
              <INPUT NAME="urlPath" size=100 VALUE="%value urlPath encode(htmlattr)%"> </TD>
            %endif%
          </TR>
          <TR>
            <TD class="oddrow">Package</TD>
            <TD class="%ifvar isDev equals('true')%oddrowdata-l%else%oddrow-l%endif%" colspan="2">
              %ifvar isDev equals('false')%
                %invoke wm.server.packages:packageList%
                <select name="package">
                %loop packages%
                  %ifvar enabled equals('true')%
                    %ifvar ../package -notempty%
                      <option %ifvar ../package vequals(name)%selected %endif%value="%value name encode(htmlattr)%">%value name encode(html)%</option>
                    %else%
                      <option %ifvar name equals('WmRoot')%selected %endif%value="%value name encode(htmlattr)%">%value name encode(html)%</option>
                    %endif%
                  %endif%
                %endloop%
                </select>
                %endinvoke%
              %else%
                %value package encode(html)%
              %endif%
            </TD>
          </TR>
          <TR>
            <TD class="evenrow">Association</TD>
            <TD class="evenrowdata-l" colspan="2">
            %switch association%
              %case '0'%
                Package
              %case '1'%
                Package
              %case%
                %value association encode(html)%
              %endif%
            </TD>
          </TR>
 %ifvar isDev equals('false')% 
          
          <TR>
                    <TD class="heading" colspan="3">Port Mappings</TD>
                  </TR>          
          <TR>
            <TD class="oddrow-l" colspan="3"><TABLE id=portMaps width="100%">
                <TR>
                   <TD class="oddcol-l">Port Number</TD>
                   <TD class="oddcol-l" colspan="2">URL Path</TD>
                   <TD class="oddcol">Delete Mapping</TD>
                </TR>
                %ifvar portMap%
                %loop portMap%
                <TR id="%value port encode(url)%">
                   <TD class='evenrowdata-l'>%value port encode(html)%</TD>
                   <TD class='evenrowdata-l' colspan="2">%value urlPath encode(html)%</TD>
                   <TD class='evenrowdata'>
                                   <a href="#"  onClick="return deletePortMapping('%value port%');">
                                        <IMG src="icons/IS_Delete.png" border="none">
                                   </a>
                                   <INPUT id="%value port%Hidden" TYPE="hidden" NAME="portMapString" VALUE="%value port encode(htmlattr)%#%value urlPath encode(htmlattr)%" />
                               </TD>
                </TR>
                %endloop%
                %endif%

            <TR id="newMapHeading">
                <TD class="heading" colspan="4">Add Port Mapping</TD>
            </TR>
            <TR id="newMapColHeading">
                   <TD class='oddcol-l'>Port Number</TD>
                   <TD class='oddcol-l' colspan="2">URL Path</TD>
                   <TD class='oddcol'>Add Mapping</TD>
            </TR>
            <TR id="newMapData">
                <TD class='evenrow-l'>
                <select name="port">
                    <option value=""></option>
                                %invoke wm.server.ports:listListeners%
                                %loop listeners%                            
                            %switch protocol%
                                %case 'HTTP'%
                                    <option value="%value port encode(htmlattr)%">%value port encode(html)%</option>
                                %case 'HTTPS'%
                                    <option value="%value por encode(htmlattr)t%">%value port encode(html)%</option>
                            %endswitch%
                                %endloop%
                                %endinvoke%
                                </select> </TD>
                <TD class='evenrowdata-l' colspan="2">
                  <INPUT NAME="newPATH" size=100 VALUE=""> </TD>
              <TD class='evenrowdata'>
                <a href="#"  onClick="return addPortMapping();"> 
                                <IMG src="icons/IS_Add.png" border="none">
                              </a>
                </TD>
            </TR>
            </TABLE></TD>
          </TR>
%endif%
                    <TR>
            <TD>
              <INPUT TYPE="hidden" NAME="association" VALUE="%value association encode(htmlattr)%" />
            </TD>
          </TR>
          %invoke wm.server.httpUrlAlias:listAlias%
          <TR>
            <TD>
                  %loop aliasList%
              <INPUT TYPE="hidden" NAME="aliases" VALUE="%value alias encode(htmlattr)%" />
                  %endloop%
            </TD>
          </TR>
          <TR>
            <TD colspan=3 class="action">
            %ifvar action equals('edit')%
              <INPUT TYPE="hidden" NAME="action" VALUE="edit">
              <INPUT TYPE="hidden" NAME="oldAlias" VALUE="%value alias encode(htmlattr)%">
              <INPUT TYPE="hidden" NAME="oldTargetPath" VALUE="%value urlPath encode(htmlattr)%">
              <INPUT type="button" value="Save Changes" onclick="return confirmEdit();">
            %else%
              <INPUT TYPE="hidden" NAME="action" VALUE="add">
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
