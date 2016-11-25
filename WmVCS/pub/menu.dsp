<html>
  <head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Expires" content="-1">
    <link rel="stylesheet" type="text/css" href="/WmRoot/webMethods.css">
    <style>
      body { border-top: 1px solid #97A6CB; }
    </style>
    <script src="/WmRoot/common-menu.js"></script>
    <script type="text/javascript">
var selected = null;
var menuInit = false;

function menuSelect(object, id) {
  selected = menuext.select(object, id, selected);
}

function menuMouseOver(object, id) {
  menuext.mouseOver(object, id, selected);
}

function menuMouseOut(object, id) {
  menuext.mouseOut(object, id, selected);
}

function initMenu(firstImage) {
    menuInit = true;
    return true;
}
</script>

  </head>

  <body class="menu" onload="initMenu('')">
    <form name="urlsaver">
      <input type="hidden" name="helpURL" value="doc/OnlineHelp/WmRoot.htm#CS_Server_Statistics.htm">
    </form>

    <table class="menuTable" width="100%" cellspacing="0" cellpadding="0" border="0">
      %scope param(expanded='true') param(text='VCS')%
        %include ../../WmRoot/pub/menu-section.dsp%
      %endscope%

      %scope param(section='VCS') param(text='Configuration') param(url='solutions-vcs.dsp')%
        %include ../../WmRoot/pub/menu-subelement.dsp%
      %endscope%

      %scope param(section='VCS') param(url='solutions-vcs-manageUserMapping.dsp')%
        %include ../../WmRoot/pub/menu-subelement-top.dsp%
        User Mapping
        %include ../../WmRoot/pub/menu-subelement-bottom.dsp%
      %endscope%
    </table>
  </body>
</html>
