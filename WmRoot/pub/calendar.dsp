%invoke wm.server.query:getCalendar%   

<html>

    <head>
        <title>Set %value /which%</title>
        <link rel="stylesheet" type="text/css" href="webMethods.css">
        <script src="csrf-guard.js.txt"></script>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <style>
            .scrollbutton { 
                font-size: 70%; 
                letter-spacing: 2px; 
                font-weight: bold; 
                background-color: #006f97;
                color: #ffffff;
                width: 30%; 
            }

            td .yearmonth {
                color: #006f97;
                background-color: #ffffff;
                font-weight: bold;
                padding: 5px;
            }

            td .dayname {
                text-align: center;
                padding: 5px;
                border-bottom: #ccc 1px solid;
            }

            td .day {
                text-align: center;
                padding: 5px;
                width: 14%;
            }

            td.day a {
                color: #007aa3;
                text-decoration: none;
            }

            td.day a:hover {
                text-decoration: underline;
            }
        </style>
        <script language="JavaScript1.2">

            var today = (new Date()).getDate();

            function setDate( date )
            {
                var m = new Number("%value month encode(javascript)%") + 1;
                if( m < 10 ) {
                    m = "0" + m;
                }
                if( date < 10 ) {
                    date = "0" + date;
                }
                document.calForm.dateSelected.value = "%value year encode(javascript)%-" + m + "-"+date+" 00:00:00";
            }

            function submitCal( whichEnd )
            {
                var theField = null;
                if( whichEnd == "From Creation Date" ) {
                    theField = opener.document.logform.qfromdate;
                } else {
                    theField = opener.document.logform.qtodate;
                }
                theField.value = trimDate( document.calForm.dateSelected.value );
                window.close();
            }

            function trimDate( date )
            {
                if( date.lastIndexOf(":") > 0 )
                {
                    date = date.substring( 0, (date.lastIndexOf(":")+3) );
                }
                if( date.indexOf(" " ) != 0 )
                {
                    return date;
                } else {
                    while( date.indexOf(" ") == 0 ) {
                        date = date.substring( 1, date.lastIndexOf(":")+3 );
                    }
                    return date;
                }    
            }

            function monthBack() 
            {
                var pMonth = new Number("%value month encode(javascript)%") - 1;
                var pYear = new Number("%value year encode(javascript)%");
                if( pMonth == -1 ) {
                    pMonth = 11; 
                    pYear = pYear - 1;
                }
                //alert( "roll back to month = " + pMonth );
                 if(is_csrf_guard_enabled && needToInsertToken) {
                    document.location.replace( "calendar.dsp?year="+pYear+"&month="+pMonth+"&which=%value which encode(url)%&"+_csrfTokenNm_+"="+_csrfTokenVal_ );
                 } else {
                    document.location.replace( "calendar.dsp?year="+pYear+"&month="+pMonth+"&which=%value which encode(url)%" );
                 }
            }

            function monthForward() 
            {
                var nMonth = new Number("%value month encode(javascript)%") + 1;
                var nYear = new Number("%value year encode(javascript)%");
                if( nMonth == 12 ) {
                    nMonth = 0;  
                    nYear = nYear + 1;
                }
                //alert( "roll forward to next month = " + nMonth + " and year = " + nYear );
                if(is_csrf_guard_enabled && needToInsertToken) {
                    document.location.replace( "calendar.dsp?year="+nYear+"&month="+nMonth+"&which=%value which encode(url)%&"+_csrfTokenNm_+"="+_csrfTokenVal_ );
                } else {
                    document.location.replace( "calendar.dsp?year="+nYear+"&month="+nMonth+"&which=%value which encode(url)%" );
                }
            }
            function yearBack() 
            {
                var pYear = new Number("%value year encode(javascript)%") - 1;
                if(is_csrf_guard_enabled && needToInsertToken) {
                    document.location.replace( "calendar.dsp?year=" + pYear + "&month=%value month encode(url)%&which=%value which encode(url)%&"+_csrfTokenNm_+"="+_csrfTokenVal_ );
                } else {
                    document.location.replace( "calendar.dsp?year=" + pYear + "&month=%value month encode(url)%&which=%value which encode(url)%" );
                }
            }

            function yearForward() 
            {
                var nYear = new Number("%value year encode(javascript)%") + 1;
                if(is_csrf_guard_enabled && needToInsertToken) {
                    document.location.replace( "calendar.dsp?year=" + nYear + "&month=%value month encode(url)%&which=%value which encode(url)%&"+_csrfTokenNm_+"="+_csrfTokenVal_ );
                } else {
                    document.location.replace( "calendar.dsp?year=" + nYear + "&month=%value month encode(url)%&which=%value which encode(url)%" );
                }
            }

            function readDate( whichEnd )
            {
                var d = null;
                if( whichEnd == "From Date" ) {
                    d = opener.document.logform.qfromdate.value;
                } else {
                    d = opener.document.logform.qtodate.value;
                }
                //alert( "opener date is " + d );
                document.calForm.dateSelected.value = d;
            }
        </script> 
    </head>
    
    %invoke wm.server.query:getCalendar%
    
    <body onload="javascript:readDate('%value /which encode(javascript)%');">
        <table width="100%">
            <tr>
                <td width="100%">
                    <form name="scrollForm" method="post">
                    <table width="100%">
                        <tr>
                            <td colspan="7" width="100%">
                                <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
                                    <tr>
                                        <td align="center" style="width: 20%">
                                            <input type="button" name="prevYear" value="<<" class="scrollbutton" onClick="yearBack();">
                                        </td>
                                        <td align="center" style="width: 20%">
                                            <input class="scrollbutton" type="button" name="prevMonth" value="<" onClick="monthBack();">
                                        </td>
                                        <td align="center" style="width: 20%" class="yearmonth">
                                            %value monthName encode(html)% %value year encode(html)%
                                        </td>
                                        <td align="center" style="width: 20%">
                                            <input class="scrollbutton" type="button" name="nextMonth" value=">" onClick="monthForward();">
                                        </td>
                                        <td align="center" style="width: 20%">
                                            <input type="button" name="nextYear" value=">>" class="scrollbutton" onClick="yearForward();">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </form>
                    <form name="calForm" action="svc_queryframe.dsp" method="post">
                        <tr>
                            %scope calendarRec%
                            %loop weekdays%
                            <td class="dayname">
                                %value weekdays encode(html)%
                            </td>
                            %endloop weekdays%
                        </tr>
                        %loop weeks%
                        <tr>
                            %loop dates%
                            <td class="day">
                                <a href="javascript:setDate('%value dates encode(url_javascript)%');">%value dates encode(html)%</a>
                            </td>
                            %endloop dates%
                        </tr>
                        %endloop weeks%

                        <tr>
                            <td colspan="7" class="day" style="border-top: 1px #ccc solid;">
                                &nbsp;
                            </td>
                        </tr>

                        <tr>
                            <td colspan="7" style="text-align: right">
                                &nbsp;&nbsp;%value /which encode(html)%
                                <input type="text" name="dateSelected" size="19">
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="button" name="set" value="Set" onClick="submitCal('%value /which encode(javascript)%');">
                            </td>
                        </tr>
                    </table>
                    </form>
                </td>
            </tr>
        </table>
   
    </body>
    %endinvoke%
</html>
