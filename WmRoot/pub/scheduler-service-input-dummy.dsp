<HTML>
    <HEAD language="JavaScript">
        <title>Assign Input Values</title>
    </HEAD>
   <BODY>
   <form name="dummyform" method="post" action="scheduler-service-input.dsp">
    <input type="hidden" name="service" id="service" />
    <input type="hidden" name="scheduleDataStr" id="scheduleDataStr" />
    %ifvar csrfTokenNm%
		<input type="hidden" name="%value csrfTokenNm encode(htmlattr)%" id="%value csrfTokenNm encode(htmlattr)%" value="%value csrfTokenVal encode(htmlattr)%" />
    %endif% 
   </form>
   <script>
    var data = window.parent.getInputString();
    var input = document.getElementById("scheduleDataStr");
    input.value = data;
    var svcName = window.parent.getServiceName();
    var svcNameInput = document.getElementById("service");
    svcNameInput.value = svcName;
    document.dummyform.submit();
   </script>
   </BODY>
</HTML>
