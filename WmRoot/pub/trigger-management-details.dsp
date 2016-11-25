<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="Expires" content="-1">
  <title>Integration Server Settings</title>
  <link rel="stylesheet" type="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  
  <script language="JavaScript">
    
    var writetoWindow;
    function showFilter(source) {
      source=document.getElementById(source).value;
      source=source.replace(/\+/g," ");
      source=decodeURI(source);
      if (writetoWindow) {
        if (!(writetoWindow.closed)) { writetoWindow.close(); }
      }
      
      var left = 10, top = 10;
      var width = 400, height = 300;
    
      if (document.all || document.layers) {
        w = screen.availWidth - width;
        h = screen.availHeight - height;
      
        if (w <= 0)
          w = 1;
      
        if (h <= 0)
          h = 1;
        
        left = w/2;
        top = h/2;
      }    
      writetoWindow = window.open("","writetoWindow","screenX="+left+",screenY="+top+",top="+top+",left="+left+",width="+width+",height="+height+",scrollbars,resizable");
      writetoWindow.document.write(source);
      writetoWindow.focus(); // bring to front
    
    }
    
    var messageFlag = false;
    
    function getMessageFlag() {
      return messageFlag;
    }
    
    function setMessageFlag(value) {
      messageFlag = value;
    }
    
    function this_writeMessage(value) {
      if (!messageFlag) // this will avoid more than one error message at a time.
        writeMessage(value);
    }
    
  </script>
</head>

 <body onLoad="setNavigation('trigger-management-details.dsp',  '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_TriggerDetailScrn');">

  <table width="100%"><tbody>
  
  <!-- --------------------------------- -->
  <!-- Header Msg. (Invoke updates here) -->
  <!-- --------------------------------- -->
  
  <!-- Update the Trigger Properties -->
  
  %ifvar editMode equals('changeProperties')%
  
    %invoke wm.server.triggers:setProperties%
      <script>writeMessage('Settings changed successfully');</script>
    %onerror%
      <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
    %endinvoke% 
  %endif%
  
    <!-- ---------- -->
    <!-- Start Page -->
    <!-- ---------- -->
  
    %invoke wm.server.triggers:getTriggerReport%
  
    <tr>
      <td class="breadcrumb" colspan="4">Settings &gt; Messaging &gt; webMethods Messaging Trigger Management &gt; %value triggerName encode(html)%<br>
      </td>
    </tr>
    <tr>
      <td colspan="2">
      <ul>
        <li class="listitem"><a href="trigger-management.dsp">Return to webMethods Messaging Trigger Management</a></li>
        <li class="listitem"><a href="trigger-management-edit-properties.dsp?triggerName=%value triggerName encode(url)%">Edit Properties</a></li>
        <li class="listitem"><a href="trigger-management-details.dsp?triggerName=%value triggerName encode(url)%">Refresh Page</a></li>
      </ul>
      </td>
    </tr>
    <tr>
      <td><img src="images/blank.gif" height="10" width="10" border="0"></td>
      <td>
      
      <!-- --------------------- -->
      <!-- Write Conditions Info -->
      <!-- --------------------- -->
      
      <table width="100%" class="tableView"><tbody>  
        <tr>
          <td class="heading" colspan="5">Conditions</td>
        </tr>
        <tr>
          <td class="oddcol-l">Name</td>
          <td class="oddcol-l">Service</td>
          <td class="oddcol-l">Join</td>
          <td class="oddcol-l">Document</td>
          <td class="oddcol-l">Filter</td>
        </tr>
          
        %loop triggers[0]/conditions%                  
          %loop documentTypeFilterPairs%
            <tr>
              %ifvar $index equals('0')%
                <script>writeTD("rowdata-l");</script>
                  %value ../name encode(html)%
                </td>
                <script>writeTD("rowdata-l");</script>
                  %value ../service encode(html)%
                </td>
                <script>writeTD("rowdata-l");</script>
                  %value ../joinType encode(html)%
                </td> 
              %else%
                <script>writeTD("rowdata");</script></td>
                <script>writeTD("rowdata");</script></td>
                <script>writeTD("rowdata");</script></td>
              %endif%            
            
              <script>writeTD("rowdata-l");</script>
                %value documentType encode(html)%
              </td>
              
              %ifvar filterSource -isnull%
                <script>writeTD("rowdata-l");</script>none</td> 
              %else%
                %ifvar filterSource equals('')%
                  <script>writeTD("rowdata-l");</script>none</td>
                %else%
                  <input type="hidden" id="filterSource%value $index encode(htmlattr)%" name="filterSource%value $index encode(htmlattr)%" value="%value filterSource encode(htmlattr)%"/>
                  <script>writeTD("rowdata-l");</script><a href="javascript:showFilter('filterSource%value $index encode(html_javascript)%');">view</a></td>
                %endif%
              %endif%
            </tr>
          %endloop%        
          <script>swapRows();</script>
        %endloop%
      </tbody></table>
      
      <!-- ----------------------- -->
      <!-- Write State Information -->
      <!-- ----------------------- -->
      
      <table width="100%"><tbody>
        <tr>
          <td class="heading" colspan="2">State</td>
        </tr>
        %ifvar triggers[0]/processingStatus/state -notempty%
          <tr>
            <td class="oddrow-l" width="50%">Retrieval State Active</td>
            
            %ifvar triggers[0]/retrievalStatus/state equals('active')%
              <td class="oddrowdata-l"><img style="width: 13px; height: 13px;" alt="" src="images/green_check.png">Yes</td>
              
            %else% %ifvar triggers[0]/retrievalStatus/state equals('active-temp')%  
              <td class="oddrowdata-l"><img style="width: 13px; height: 13px;" alt="" src="images/green_check.png">Yes*</td>
  
            %else% %ifvar triggers[0]/retrievalStatus/state equals('suspended')%  
              <td class="oddrowdata-l">No</td>
            
            %else% <!-- state = suspended-temp -->
              <td class="oddrowdata-l">No*</td>
            
            %endif%
            %endif%
            %endif%
            
          </tr>
          <tr>
            <td class="evenrow-l">Processing State Active</td>
              
            %ifvar triggers[0]/processingStatus/state equals('active')%
              <td class="evenrowdata-l"><img style="width: 13px; height: 13px;" alt="" src="images/green_check.png">Yes</td>
           
            %else% %ifvar triggers[0]/processingStatus/state equals('active-temp')%
              <td class="evenrowdata-l"><img style="width: 13px; height: 13px;" alt="" src="images/green_check.png">Yes*</td> 
            
            %else% %ifvar triggers[0]/processingStatus/state equals('suspended')%
              <td class="evenrowdata-l">No</td>
              
            %else% <!-- state = suspended-temp -->
              <td class="evenrowdata-l">No*</td>
              
            %endif%
            %endif%
            %endif%
  
          </tr>
          <tr>
            <td class="oddrow-l">Current Threads (Processing)</td>
            <td class="oddrowdata-l">%value triggers[0]/processingStatus/activeThreadCount encode(html)%</td>
          </tr>
          <tr>
            <td class="evenrow-l">Volatile Queue</td>
            <td class="evenrowdata-l">%value triggers[0]/processingStatus/volatileQueueCount encode(html)%</td>
          </tr>
 
          <tr>
            <td class="oddrow-l">Persisted Queue</td>
            %ifvar triggers[0]/properties/typeDisplayValue equals('UM')%
              <td class="oddrowdata-l">N/A</td>
            %else%
              <td class="oddrowdata-l">%value triggers[0]/processingStatus/persistedQueueCoun encode(html)%</td>
            %endif%
          </tr>
                
        %else%
          <tr>
            <td class="oddrow-l">Retrieval State</td>
            <td class="oddrowdata-l">N/A</td>
          </tr>
          <tr>
            <td class="evenrow-l">Processing State</td>
            <td class="evenrowdata-l">N/A</td>
          </tr>
          <tr>
            <td class="oddrow-l">Current Threads (Processing)</td>
            <td class="oddrowdata-l">N/A</td>
          </tr>
          <tr>
            <td class="evenrow-l">Volatile Queue</td>
            <td class="evenrowdata-l">N/A</td>
          </tr>
          <tr>
            <td class="oddrow-l">Persisted Queue</td>
            <td class="oddrowdata-l">N/A</td>
          </tr>
        %endif%
       
        <tr>
        </tr>
        
        <!-- -------------------------- -->
        <!-- Write Property Information -->
        <!-- -------------------------- -->
        
        <tr>
          <td class="heading" colspan="2">Properties</td>
        </tr>
        <tr>
          <td class="oddrow-l">Enabled</td>
          %ifvar triggers[0]/properties/executeEnabled equals('true')%
            <td class="oddrowdata-l">True<br>
          %else%
            <td class="oddrowdata-l">False<br>
          %endif%
          </td>
        </tr>

        <tr>
          <td class="evenrow-l">Join Expires After</td>
          <td class="evenrowdata-l">%value triggers[0]/properties/joinTimeOut encode(html)%</td>
        </tr>     
                   
        %ifvar triggers[0]/retrievalStatus/state equals('active')%
          %ifvar triggers[0]/properties/queueCapacity vequals(triggers[0]/properties/queueCapacityThrottle)%  
            <tr>
              <td class="oddrow-l">Trigger Queue Capacity</td>
              <td class="oddrowdata-l">%value triggers[0]/properties/queueCapacity encode(html)%</td>
            </tr>
            <tr>
              <td class="evenrow-l">Trigger Queue Refill Level<br>
              %ifvar triggers[0]/properties/typeDisplayValue equals('UM')%
                <td class="evenrowdata-l">N/A</td>
              %else%
                <td class="evenrowdata-l">%value triggers[0]/properties/queueRefillLevel encode(html)%</td>
              %endif%
            </tr>   
          %else%
            <tr>
              <td class="oddrow-l">Trigger Queue Capacity</td>
              <td class="oddrowdata-l">%value triggers[0]/properties/queueCapacityThrottle encode(html)%&nbsp;(%value triggers[0]/properties/queueCapacity encode(html)%)</td>
            </tr>
            <tr>
              <td class="evenrow-l">Trigger Queue Refill Level<br>
              %ifvar triggers[0]/properties/typeDisplayValue equals('UM')%
                <td class="evenrowdata-l">N/A</td>
              %else%
                <td class="evenrowdata-l">%value triggers[0]/properties/queueRefillLevelThrottle encode(html)%&nbsp;(%value triggers[0]/properties/queueRefillLevel encode(html)%)</td>
              %endif%
            </tr>      
          %endif%
        %else%
          <tr>
            <td class="oddrow-l">Trigger Queue Capacity</td>
            <td class="oddrowdata-l">0&nbsp;(%value triggers[0]/properties/queueCapacity encode(html)%)</td>
          </tr>
          <tr>
            <td class="evenrow-l">Trigger Queue Refill Level<br>
            <td class="evenrowdata-l">0&nbsp;(%value triggers[0]/properties/queueRefillLevel encode(html)%)</td>  
          </tr>
        %endif%
             
        <tr>
          <td class="oddrow-l">Acknowledgment Queue Size</td>
          <td class="oddrowdata-l">%value triggers[0]/properties/ackQueueSize encode(html)%</td>
        </tr>
        
        <tr>
          <td class="evenrow-l">Maximum Retry Attempts</td>
          <td class="evenrowdata-l">%value triggers[0]/properties/maxRetryAttempts encode(html)%</td>
        </tr>
        <tr>
          <td class="oddrow-l">Retry Interval</td>
          <td class="oddrowdata-l">%value triggers[0]/properties/retryInterval encode(html)%</td>
        </tr>
        <!-- Retry Failure Handling -->
        %ifvar triggers[0]/properties/redeliveryAction equals('0')%
          <tr>
            <td class="evenrow-l">Retry Failure Behavior</td>
            <td class="evenrowdata-l">Throw service exception</td>
          </tr> 
          <tr>
            <td class="oddrow-l">Resource Monitoring Service</td>
            <td class="oddrowdata-l">N/A</td>
          </tr>
        %else%
          <tr>
            <td class="evenrow-l">Retry Failure Behavior</td>
            <td class="evenrowdata-l">Suspend and retry later</td>
          </tr> 
          <tr>
            <td class="oddrow-l">Resource Monitoring Service</td>
            <td class="oddrowdata-l">%value triggers[0]/properties/monitorServiceName encode(html)%</td>
          </tr>
        %endif%
        <!-- Trigger Processing info -->
        %ifvar triggers[0]/properties/isConcurrent equals('true')%
          <tr>
            <td class="evenrow-l" nowrap>Processing Mode</td>
            <td class="evenrowdata-l">Concurrent</td>
          </tr>
          <tr>
            <td class="oddrow-l">Maximum Execution Threads</td>
            %ifvar triggers[0]/processingStatus/state matches('active*')%
              %ifvar triggers[0]/properties/maxExecutionThreads vequals(triggers[0]/properties/maxExecutionThreadsThrottle)%
                <td class="oddrowdata-l">%value triggers[0]/properties/maxExecutionThreads encode(html)%</td>
              %else%
                <td class="oddrowdata-l">%value triggers[0]/properties/maxExecutionThreadsThrottle encode(html)%&nbsp;(%value triggers[0]/properties/maxExecutionThreads encode(html)%)</td>
            %endif%
          %else%
            <td class="oddrowdata-l">0&nbsp;(%value triggers[0]/properties/maxExecutionThreads encode(html)%)</td> 
          %endif%
          </tr>
          <tr>
            <td class="evenrow-l">Suspend on Error</td>
            <td class="evenrowdata-l">N/A<br>
          </tr>
        %else%
          <tr>
            <td class="evenrow-l">Processing Mode</td>
            <td class="evenrowdata-l">Serial</td>
          </tr>
          <tr>
            <td class="oddrow-l">Max Execution Threads</td>
            %ifvar triggers[0]/processingStatus/state matches('active*')%
              <td class="oddrowdata-l">1</TD>
            %else%
              <td class="oddrowdata-l">0&nbsp;(1)</TD>
            %endif%
          </tr>
          <tr>
            <td class="evenrow-l">Suspend on Error</td>
        %ifvar triggers[0]/properties/serialSuspendOnError equals('true')%
              <td class="evenrowdata-l">True</td>
            %else%
              <td class="evenrowdata-l">False</td>
            %endif%
          </tr>
        %endif%

        <!-- Dup Detection -->
        %ifvar triggers[0]/properties/dupDetection equals('false')%
          <tr>
            <td class="oddrow-l">Exactly Once Detect Duplicates</td>
            <td class="oddrowdata-l">False</td>
          </tr>
          <tr>
            <td class="evenrow-l">Exactly Once Use History</td>
            <td class="evenrowdata-l">N/A</td>
          </tr>
          <tr>
            <td class="oddrow-l">Exactly Once History Time to Live</td>
            <td class="oddrowdata-l">N/A</td>
          </tr>
        %else%
          <tr>
            <td class="oddrow-l">Detect Duplicates</td>
            <td class="oddrowdata-l">True</td>
          </tr>
          %ifvar triggers[0]/properties/dupHistory equals('false')%
          <tr>
              <td class="evenrow-l">Use History</td>
              <td class="evenrowdata-l">False</td>
            </tr>
            <tr>
              <td class="oddrow-l">History Time to Live</td>
              <td class="oddrowdata-l">N/A</td>
            </tr>
          %else%
            <tr>
              <td class="evenrow-l">Use History</td>
              <td class="evenrowdata-l">True</td>
            </tr>
            <tr>
              <td class="oddrow-l">History Time to Live</td>
              <td class="oddrowdata-l">%value triggers[0]/properties/dupHistoryTTL encode(html)%</td>
            </tr>
          %endif%
        %endif%
        
        <tr>
          <td class="evenrow-l">Priority Enabled</td>
          %ifvar triggers[0]/properties/typeDisplayValue equals('UM')%
            <td class="evenrowdata-l">N/A</td>
          %else%
            %ifvar triggers[0]/properties/priorityEnabled equals('true')%
              <td class="evenrowdata-l">True</td>
            %else%
                <td class="evenrowdata-l">False</td>
              %endif%
          %endif%
        </tr>
        
        %ifvar triggers[0]/properties/principals -notempty%
        
        <tr>
          <td class="heading" colspan="2">Destination ID for Deliver</td>
        </tr>
        
        <tr>
          <td class="oddrow-l">Trigger Client ID</td>
          <td class="oddrowdata-l">%value triggers[0]/properties/principals[1] encode(html)%</td>
        </tr>
        
        <tr>
          <td class="evenrow-l">Default Client ID</td>
          <td class="evenrowdata-l">%value triggers[0]/properties/principals[3] encode(html)%</td>
        </tr>
       
        %endif%
        
    </tbody></table>
    </td>
    </tr>
  
  %onerror%
    <script>writeMessage("Error: %value errorMessage encode(html_javascript)%");</script>
  %endinvoke%
  </tbody></table>

</body></html>