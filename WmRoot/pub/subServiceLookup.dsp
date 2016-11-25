<html>
<head>
<title>Select Invoke Service</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
<SCRIPT SRC="webMethods.js.txt"></SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
          
          var hiddenOptions = new Array();
      
              function doClick(e,x) {
        e = e || window.event;
        x = x || this;
        select(decodeURIComponent(x.toString()).substring(20)); //1-1U7H0Q
        window.parent.document.createRule.customServiceName.value=x.document.serviceForm.svc.options[x.document.serviceForm.svc.selectedIndex].value
    }
    
    function select(user){window.parent.hideSub(user);}
    
    function closePopup(){window.parent.hideSub(false);}

          function loadPackageOptions()
          {
                var pkg = document.getElementById("pkg").options
                %invoke wm.server.packages:getISPkgAndServices%
                       pkg[pkg.length] = new Option("","");
                       hiddenOptions[pkg.length-1] = new Array();
                    %ifvar pkgAndServices%      
                       %loop pkgAndServices%
                            pkg.length=pkg.length+1;
                            pkg[pkg.length-1] = new Option("%value pkgName%","%value pkgName%");
                            var services = new Array();
                            %loop pkgServices%
                                services[%value $index%] = new Option("%value%","%value%");     
                            %endloop%
                            if (services.length == 0)
                            {                               
                                //services[0] = new Option("","");      
                            }
                            hiddenOptions[pkg.length-1] = services;
                        %endloop%
                    %else%
                    document.getElementById('lookUpTable').style.display="none";
                    document.getElementById('noPkg').style.display="block";
                    document.getElementById("noPkg").innerHTML = "None of the services adheres to the spec [pub.security.enterpriseGateway:<br>customFilterSpec]";
                    %endif%
                %endinvoke%
                                
                //changeval();              
          }
          
          function changeval() {
            var pkgs = document.getElementById("pkg").options;
            var selectedPkg = document.getElementById("pkg").value;
            for(var i=0; i<pkgs.length; i++) {
                if(selectedPkg == pkgs[i].value) {
                    var services = hiddenOptions[i];
                    document.getElementById("svc").options.length = services.length;
                    document.getElementById("svc").options[0] = new Option("", "");
                    for(var j=1;j<services.length+1;j++) {
                        var opt = services[j-1];
                        document.getElementById("svc").options[j] = new Option(opt.text, opt.value);
                    }
                }
            }

            if(services.length == 0) {
                document.getElementById("svc").style.display = "none";
                document.getElementById("svcDiv").style.display = "block";
                document.getElementById("svcDiv").innerHTML = "None of the services adheres to the spec [pub.security.enterpriseGateway:customFilterSpec]";
            } else {
                document.getElementById("svc").style.display = "block";
                document.getElementById("svcDiv").style.display = "none";
            }
        }
</SCRIPT>
          
</head>
<body style="border-spacing: 0; border-width:0" onLoad="loadPackageOptions();">
        <FORM NAME="serviceForm">
        <DIV ID="noPkg" class="message" style="display: none;"></DIV>
            <TABLE width="100%" id="lookUpTable" style="cell-spacing:0 border-spacing: 0; border-collapse:collapse; border-width:0; border-style:solid; border-color:gray">
        <TR>
                            <TD class="evenrow" style="width: 80px; white-space: nowrap;">
                            <i>Package Name</i>
                            </TD> <TD class="oddrow" style="text-align:left;" align="left">
                                <SELECT class="listbox" name="pkg" id="pkg" onchange="changeval()"></SELECT>
                                </TD>
                            </TR>
                            <TR>
                            <TD class="oddrow" style="width: 80px; white-space: nowrap;">
                            <i>Service Name</i> </TD>
                            <TD class="evenrow" style="text-align:left;" align="left">
                                <SELECT class="listbox" name="svc" id="svc" onChange="doClick();" ></SELECT>
                                <DIV ID="svcDiv" style="display:none;"></DIV>
                                </TD>
                            </TR>
          </TABLE>
          </FORM>
            
</body>
</html>

