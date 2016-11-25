<html>
<head>
  <title>%value text encode(html)% - %value $host encode(html)% - webMethods Integration Server</title>
  <link rel="stylesheet" type="text/css" href="layout.css">
  <link rel="icon" HREF="/WmRoot/favicon.ico" />
</head>
<body>
  <div><iframe class="top" src="top.dsp?adapter=%value adapter encode(url)%&text=%value text encode(url)%%ifvar help%&help=%value help encode(url)%%endif%"></iframe></div>
  <div class="bottom">
    <iframe class="menuframe" name="menu" src="adapter-menu.dsp?tabset=%value adapter encode(url)%" scrolling="yes" seamless="seamless"></iframe>
    %invoke wm.server.ui:isValidAdapterURL%
        %ifvar result equals('true')%
            <iframe class="contentframe" name="body" src="%value url encode(htmlattr)%"></iframe>
        %else%
            <iframe class="contentframe" name="body" src="error.dsp"></iframe>
        %endif%
    %endinvoke%
  </div>
</body>
</html>
