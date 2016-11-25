<HTML>
<HEAD>
<TITLE>VSS Configuration</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css">
<SCRIPT SRC="/WmRoot/webMethods.js.txt"></SCRIPT>
<SCRIPT>
   	
   	    function check()
   	    {
   	          
   	    if(document.configForm.vssAllowMultipleCheckouts.checked){
   	       	document.configForm.vssAllowMultipleCheckouts.value="true";
   	    	}
   	    
   	    if(!document.configForm.vssAllowMultipleCheckouts.checked){;
   	       	document.configForm.vssAllowMultipleCheckouts.value="";
   	  	}    	
   	    
   	    if (!verifyRequiredField("configForm","timeout"))
   	            { 
   	       		document.configForm.timeout.value=60000;
   	            }
   	      
   	    if(document.configForm.timeout.value==-1)     
   	      {
   	      	 	document.configForm.timeout.value=-1;
   	      }
   	      
   	    if (!isNum(document.configForm.timeout.value) && (document.configForm.timeout.value!=-1))
   	                  {
   	                            alert("Command Timeout must be a positive number");
   	                            document.configForm.timeout.value="";
   	                            document.configForm.timeout.focus();
   	                           return false;
   	                  }
   		
   	    if(!verifyRequiredNonNegNumber("configForm", "timeout") && (document.configForm.timeout.value!=-1))
   	            		{
   	            		alert("Command Timeout must be a positive number");
   	      			document.configForm.timeout.value="";
   	      	                document.configForm.timeout.focus();
   	      	                return false;
   	            		}
   	            		
   	    if (!verifyRequiredField("configForm","vssWorkingFolder"))
   	            {
   	               alert("No Working Folder was entered");
   	               document.configForm.vssWorkingFolder.focus();
   	               return false;
   	      } 
   	    if (!verifyRequiredField("configForm","vssProjectName"))
   	            {
   	               alert("No Project Name was entered");
   	               document.configForm.vssProjectName.focus();
   	               return false;
   	      } 
   	      
   	     return true;
   	    
   	     }
	 </SCRIPT>   

 
</HEAD>
 
<BODY onLoad="setNavigation('/WmVCS/solutions-vcs-manageVCSSettings-configureVSS.dsp', '/WmRoot/doc/OnlineHelp/wwhelp/wwhimpl/js/html/wwhelp.htm#context=is_help&topic=IS_Solutions_VCS_VSSConfigScrn');">
       <DIV class="position">
          <TABLE WIDTH="100%">
             <TR>
                <TD class="menusection-Solutions" colspan=2>VCS &gt; Configuration &gt; Edit VCS Configuration &gt; VSS Configuration</TD>
             </TR>
             
             %ifvar actionPerformed equals('change')%
              %invoke wm.server.vcsservices:vssConfiguration%
	         <tr><td colspan="2">&nbsp;</td></tr>
	        <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Settings changed successfully</TD></TR>
	      %onerror%
	         <tr><td colspan="2">&nbsp;</td></tr>
	        <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error in loading Settings</TD></TR>
       	      %endinvoke%
	      %endif%
  		<TR>
 		<TD colspan="2">
 		  <UL>
 		    <LI>
 		   <A HREF="solutions-vcs-manageVCSSettings.dsp">Return to Edit VCS Configuration</A>
 		    </LI>
 		  </UL>
 		</TD>
	      </TR>
	       <TR>
	      	<TD></TD>
	      	<TD>
	      	  <TABLE class="tableForm" cellpadding=5>
	      	    <FORM NAME="configForm" ACTION="solutions-vcs-manageVCSSettings-configureVSS.dsp" METHOD="POST">
	      		
	      		%invoke wm.server.vcsservices:readVCS%
	      		<TR>
	      			 <TD class="heading" colspan=2>VSS Configuration</TD>
	      		</TR>
	      		<tr>
	      		 	 <TD class="oddrow-l">
	      		 	 	<p align=right>Command Timeout (msec)</p>
	      		 	</TD>
	      		  	<TD class="oddrow-l"><INPUT NAME="timeout" VALUE="%value timeout%"></INPUT></td>
	      		</tr>
	      		
	      		<tr>
	      			<TD class="evenrow-l">
					<p align=right>Working Folder
					
					</p>
				</TD>
	      		    	<TD class="evenrow-l"><INPUT NAME="vssWorkingFolder" size=70 VALUE="%value vssWorkingFolder%"></INPUT></td>  
	      		  	</td>
	      		</tr>
	      		<tr>
	      			<TD class="oddrow-l">
					<p align=right>VSS Project Name
					
					</p>
				</TD>
	      		    	<TD class="oddrow-l"><INPUT NAME="vssProjectName" size=70 VALUE="%value vssProjectName%"></INPUT></td>  
	      		  	</td>
	      		</tr>
	      		 <TR>
	      			<TD class="evenrow-l">
					<p align=right>Allow Multiple Checkouts
					</p>
			 
			      <TD class="evenrow-l" colspan=2>
			      	<INPUT TYPE="checkbox" NAME="vssAllowMultipleCheckouts" %ifvar vssCheckoutMode equals('true')% CHECKED %endif%></INPUT></TD>
			      
                        </TR>
	      		<tr>
	      			<TD class="action" colspan=2>
	      				<INPUT TYPE="hidden" NAME="actionPerformed" VALUE="change"></INPUT>
	      				<INPUT TYPE="submit" VALUE="Save Changes" ONCLICK="return check();"></INPUT>
	      			</td>
	      		
	      		</tr>
	      		 %onerror%
					   <tr><td colspan="2">&nbsp;</td></tr>
				           <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Error in loading settings</TD></TR>
	      		%endinvoke%
	      	    </FORM>
	      	  </table>
	      	</TD>
            </TR>
          </TABLE>
        </DIV>
        
        
   </BODY>
  
</HTML>
