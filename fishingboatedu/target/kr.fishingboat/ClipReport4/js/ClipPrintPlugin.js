function pdfPrintPlugIn(){this.status=0;this.url=null;this.param=null;this.targetDiv=document.getElementById("mRe_pdfPrint_div");if(null!=this.targetDiv){document.body.removeChild(this.targetDiv);}this.targetDiv=document.createElement("div");this.targetDiv.id="mRe_pdfPrint_div";this.targetDiv.style.cssText="position:absolute !important;width:1px !important;height:1px !important;left:0px !important;top:0px !important;overflow:hidden !important;";document.body.appendChild(this.targetDiv);}pdfPrintPlugIn.prototype.connection=function(a,b){this.status=0;this.url=a;this.param=b;if(is_firefox){this.status=1;}else{if(m_report_printOption.acrobat){if(is_chrome||is_opera){if(!("Chrome PDF Viewer"==m_report_printOption.acrobatVersion||"Chromium PDF Viewer"==m_report_printOption.acrobatVersion)){this.status=1;}}else{if(is_ie||is_ie11){if(m_report_printOption.acrobatVersion<10){this.status=2;}}}if(is_safari){this.status=1;}}else{if(is_edge){this.status=4;}else{this.status=3;}}}return this.status;};pdfPrintPlugIn.prototype.print=function(){if(this.url==null){return;}if(this.status==0){var a=new Date().getTime();var e=this.url+"?s_time="+a+"&"+this.param;var f=this.targetDiv.lastChild;if(null!=f){if("IFRAME"==f.tagName){this.targetDiv.removeChild(f);}}var d=document.createElement("iframe");this.targetDiv.appendChild(d);d.src=e;}else{if(this.status==1||this.status==2){window.open("","report_SubWindow","height=600,width=750");var c=this.create_print_form();this.targetDiv.appendChild(c);c.target="report_SubWindow";c.submit();}else{var b=document.createElement("iframe");b.name="report_SubFrame";this.targetDiv.appendChild(b);var c=this.create_print_form();this.targetDiv.appendChild(c);c.target="report_SubFrame";c.submit();}}};pdfPrintPlugIn.prototype.create_print_form=function(){var c=document.createElement("form");c.action=this.url;c.encoding="application/x-www-form-urlencoded";c.method="post";var a=this.param.split("&");for(var b=0;b<a.length;b++){var e=a[b].split("=");if(e.length>1){var d=document.createElement("input");d.type="hidden";d.name=e[0];d.value=e[1];c.appendChild(d);}}return c;};function CReportPrintPDFcheck(a){if(typeof a.print==="undefined"){setTimeout(function(){CReportPrintPDFcheck(a);},1000);}else{a.printWithDialog();}}function mRe_getPDFPrintFrame(a){var b=new Array();b.push('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">');b.push("<html>");b.push("<head>");b.push('<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">');b.push("<title>print</title>");b.push("</head>");b.push("<body>");b.push('	<iframe id="target1" name="re_target_print"></iframe>');b.push('<script type="text/javascript">');b.push("function printCall(){");b.push('	var iframe = document.getElementById("target1");');b.push('	iframe.src = "'+a+'";');b.push("}");b.push("printCall();");b.push("<\/script>");b.push("</body>");b.push("</html>");return b.join("");}