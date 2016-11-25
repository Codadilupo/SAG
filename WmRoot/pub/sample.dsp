
%value a encode(html)%
%value b encode(html)%


%invoke myDB:something%

  %value dbXXX encode(html)%
  %value dbYYY encode(html)%

  %value ../a encode(html)%
  %value /a encode(html)%

  <table>
  %loop table%
  <tr><td>%value day encode(html)%</td><td>%value week encode(html)%</td></tr>
  %endloop%
  </table>

  %scope myrecord%
  %endscope%

  <a href="sample.dsp?fred=%value fred encode(url)%&foo=xxx">blah</a>

%endinvoke%

