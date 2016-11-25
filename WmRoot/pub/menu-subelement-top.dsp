<tr name="%value section%_subMenu" style="display: %value display%">
  <td id="i%value encode(htmlattr) url%"
    %ifvar url equals('nonedsp')%
      class="menuitem-unclickable"
    %else%
      class="menuitem"
      onmouseover="menuMouseOver(this, '%value encode(htmlattr) url%');"
      onmouseout="menuMouseOut(this, '%value encode(htmlattr) url%');"
      onclick="menuSelect(this, '%value encode(htmlattr) url%'); document.all['a%value encode(htmlattr) url%'].click();"
    %endif%>
    <span style="white-space: nowrap">
      %ifvar url equals('dummy-horizontal-linedsp')%
        <hr/>
      %else%
        %ifvar url equals('nonedsp')%
          %value none text%
        %else%
          <a id="a%value encode(htmlattr) url%" 
             target="%ifvar target%%value $host%%value target%%else%body%endif%" 
             href="%value encode(htmlattr) url%">
