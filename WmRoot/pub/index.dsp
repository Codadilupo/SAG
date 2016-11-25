%invoke wm.server.ui:mainMenu%

<html>
<head>
  <title>%value $host encode(html)% - webMethods Integration Server</title>
  <link rel="stylesheet" type="text/css" href="layout.css">
  <link rel="icon" HREF="/WmRoot/favicon.ico" />
</head>
<body>
  <div><iframe class="top" src="top.dsp" id="top"></iframe></div>
  <div class="bottom">
    <iframe class="menuframe" name="menu" src="menu.dsp" scrolling="yes" seamless="seamless"></iframe>
    <iframe class="contentframe" name="body" id="body" src="stats-general.dsp"></iframe>
  </div>
</body>
</html>

%onerror%

<html>
  <head>
    <title>Access Denied</title>
  </head>
  <body>
    Access Denied.
    <br>
    <br>
    Services necessary to show the Integration Server Administrator are currently unavailable on this 
    port.  This is most likely due to port security restrictions.
    <br>
    <br>
    If this is the only port available to access the Integration Server, contact webMethods Support.
  </body>
</html>

%endinvoke%
