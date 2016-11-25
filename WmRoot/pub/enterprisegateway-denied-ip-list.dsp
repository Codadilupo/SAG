<script>
 function confirmDelete(ip) {
         return confirm("Are you sure you want to delete " + ip + " ?");
    }
</script>
    <table width="100%" class="tableView">
        <tr>
            <td colspan="2" class="heading">
               Denied IP Address List
            </td>
        </tr>
        <tr>
            <td class="oddcol-l" width="80%">
                IP Address
            </td>
            <td class="oddcol" >
                Delete
            </td>
        </tr>
        %invoke wm.server.enterprisegateway:getDeniedIPList%
            %loop deniedIPList%
                <tr>
                    <td class="evencol-l" width="80%">
					  %value encode(html)%
                    </td>
                    <td class="evencol" >
					  <a class="imagelink" href="enterprisegateway-dos-options.dsp?action=delete&IP=%value encode(url)%" onclick="return confirmDelete('%value encode(javascript)%')">
                                   <img src="icons/delete.png" border="none">
                      </a>
                    </td>
                </tr>
            %end%
        %endinvoke%
            </table>