<HTML>
<HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


<TITLE>Integration Server -- Subscriber Packages</TITLE>
%include webMethods.css%
</HEAD>
<BODY>


<DIV class="position">
<TABLE WIDTH="100%">

  <TR><td class="title" colspan=5>Available Packages for Publisher '%value publisher encode(html)%'</td></TR>

%ifvar action%
%switch action%
%case 'svcPull'%
  %invoke wm.server.replicator:distributeViaSvcPull%
  <TR><td id="message" colspan=5>%value message encode(html)%</td></TR>
  %endinvoke%
%case 'ftpPull'%
  %invoke wm.server.replicator:pullPackageViaFtp%
  <TR><td id="message" colspan=5>%value message encode(html)%</td></TR>
  %endinvoke%
%endswitch%
%endif%

%invoke wm.server.replicator.adminui:queryPublisherForPackages%

  <TR class="heading">
    <td width=35%>Name</td>
    <td width=15%>Version</td>
    <td width=35%>Created on</td>
    <td width=15%>Info</td>
  </TR>

  %loop entries%
  <TR>
    <TD class="coldata">%value name encode(html)%</TD>
    <TD class="coldata">%value version encode(html)%</TD>
    <TD class="coltext">%value time encode(html)%</TD>
    <TD class="coldata">
      <A HREF="releasedpkg-info.dsp?pkgname=%value name encode(url)%&publisher=%value /publisher encode(url)%">

      <IMG class="alone" SRC="icons/ifcdot.gif" border="no" alt="Info">
      </A>
    </TD>
  </TR>
  %endloop%

%endinvoke%

</TABLE>
</DIV>

</BODY>
</HTML>
