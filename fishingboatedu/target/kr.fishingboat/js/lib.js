var steps=1;
var seid="";
var apiurl="";
var HashMap = function(){   
    this.map = new Array(); 
};   
HashMap.prototype = {   
    put : function(key, value){   
        this.map[key] = value; 
    },   
    get : function(key){   
        return this.map[key]; 
    },   
    getAll : function(){   
        return this.map; 
    },   
    clear : function(){   
        this.map = new Array(); 
    },   
    isEmpty : function(){     
         return (this.map.size() == 0); 
    }, 
    remove : function(key){     
         delete this.map[key]; 
    }, 
    toString : function(){ 
        var temp = ''; 
        for(i in this.map){   
            temp = temp + ',' + i + ':' +  this.map[i]; 
        } 
        temp = temp.replace(',',''); 
          return temp; 
    }, 
    keySet : function(){   
        var keys = new Array();   
        for(i in this.map){   
            keys.push(i); 
        }   
        return keys; 
    } 
}; 
function setLog(s){

	try
	{
		console.log(s);
	}
	catch (e)
	{
	}
}

function randomString() {
	var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
	//var chars = "ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
	var string_length = 14;
	var randomstring = '';
	for (var i=0; i<string_length; i++) {
		var rnum = Math.floor(Math.random() * chars.length);
		randomstring += chars.substring(rnum,rnum+1);
	}
	//document.randform.randomfield.value = randomstring;
	return randomstring;
}
function dailyMissionTimer(duration) {
    var timer = duration * 3600;
    var hours, minutes, seconds;
    var interval = setInterval(function(){
        hours	= parseInt(timer / 3600, 10);
        minutes = parseInt(timer / 60 % 60, 10);
        seconds = parseInt(timer % 60, 10);
		
        hours 	= hours < 10 ? "0" + hours : hours;
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
		
        $('#time-hour').text(hours);
        $('#time-min').text(minutes);
        $('#time-sec').text(seconds);

        if (--timer < 0) {
            timer = 0;
            clearInterval(interval);
        }
    }, 1000);
}
function authlastactive(params,name,birthDay,phoenNo,setid){
	//alert(name);
	//alert(birthDay);
	//alert(phoenNo);
	//alert(setid);
	seid=setid;
	
	//20170306_test
	/*$("input[name=STEP1_1]").val(name).prop("readonly", true);
	$("input[name=STEP1_2]").val(birthDay).prop("readonly", true);
	$("input[name=STEP1_73]").val(phoenNo).prop("readonly", true);
	$("input[name=STEP1_72]").val(setid).prop("readonly", true);
	$("input[name=usr_id]").val(setid);*/
	$("input[name=STEP1_1]").val(name);
	$("input[name=STEP1_2]").val(birthDay);
	$("input[name=STEP1_73]").val(phoenNo);
	$("input[name=STEP1_72]").val(setid);
	$("input[name=usr_id]").val(setid);
	
	
	try
	{
		$.ajax({
			method: "POST",
			url: "http://fishboat2.kgis.kr:8080/rest/process/cud",
			data: params,
			success:function(data){   
				setLog( data );  
				alert("실명인증에 성공하였습니다.\n약관동의후 이용바랍니다.\n감사합니다.");
				$("#myModalAgreeBtn").show();
				$("#myModalAuthBtn").hide();
				$("#regboard_lists").show();
			},   
			beforeSend:function(b){   
				//alert($("input[name=STEP1_1]").val());
				//alert($("input[name=STEP1_2]").val()); 
				//alert($("input[name=STEP1_72]").val()); 
				//alert($("input[name=STEP1_73]").val());
			},  
			error:function(e){  
				setLog( e );
				alert("실명인증에 실패하였습니다.\n실명인증부터 다시 이용바랍니다.\n감사합니다.");
				location.href="http://fishboat6.kgis.kr:8080/#section-1";
			}  
		}).done(function() {
			$("#myModalAuth").modal('hide');
		});
	}
	catch (e)
	{
		alert(e);
		$("#myModalAuth").modal('hide');
	}
	//app.init(setid);
	/*$.ajax({
			method: "POST",
			url: apiurl+"/rest/process/cud",
			data: params,
			success:function(data){   
				setLog( data );  
				alert("성공");
			},   
			beforeSend:function(b){   
				alert($("input[name=STEP1_1]").val());     
			},  
			error:function(e){  
				setLog( e );
				alert("실패");
			}  
		}).done(function( msg ) {
			setLog( "Data Saved: " + msg );
		});
	*/
	//$("input[name=e1]").prop("readonly", true).val( $("input[name=STEP1_1]").val() );//성명
	//$("input[name=e2]").prop("readonly", true).val( $("input[name=STEP1_3]").val() );//사업장명칭
	//$("input[name=e3]").prop("readonly", true).val( $("input[name=STEP1_7]").val() );//교육과정
	//$("input[name=e4]").prop("readonly", true).val( $("input[name=STEP1_5]").val() );//전화번호
}
function agreebtnactive(dom,type,modaldom,clickBtndom,msg){
	var form=$(dom);
	if(type==0){
		form.find("input, select, button, textarea").prop("disabled", false);
		try
		{
			$(clickBtndom).prop("disabled", true);
			$(clickBtndom).text(msg);
			$(clickBtndom).removeClass("btn-danger");
			$(clickBtndom).addClass("btn-info");
			
			//20170306_test
			$("#regboard_lists").show();
		}
		catch (e)
		{
		}
		
	}else{
		form.find("input, select, button, textarea").prop("disabled", true);
	}
	try
	{
		$(modaldom).modal('hide');	
	}
	catch (e)
	{
	}
	
}
function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
var app = {
	init:function(){
		apiurl="http://fishboat3.kgis.kr:8080";
		seid=randomString();	
		var req={ id: 'smjs_common_reg2', method: "read_List" ,usr_id:seid,setp:'STEP1'};
		app.list(app.reglayout,'reglayout',req);
		$("#myModalPrint1Btn").hide();
		$("#myModalPrint2Btn").hide();
		//var req={ id: 'smjs_common_reg2', method: "read_List" ,usr_id:seid,setp:'STEP2'};
		//app.list(app.testlayout,'testlayout',req);

		//var req={ id: 'smjs_common_reg2', method: "read_List" ,usr_id:seid,setp:'STEP3'};
		//app.list(app.reglayout,'resultprintlayout',req);

		//var req={ id: 'smjs_common_reg2', method: "read_List" ,usr_id:seid,setp:'STEP4'};
		//app.list(app.testlayout,'oklayout',req);

		//app.list('smjs_common',app.testlayout,'testlayout');
		var req={ id: 'smjs_common_list', method: "read_List"};
		app.list(app.listlayoutmodal,'listlayout',req);
		gototab();
		//app.rslt('K1qTqEZe');
		//app.list(app.testlayout,'testlayout',{ id: 'smjs_common_reg3', method: "read_List" ,usr_id:seid,setp:'STEP2'});
	},
	alert:function(msg){
		alert(msg);
	},
    pagelog: function() {
        var params={"seqid":"insert_pagestats",
		  		"usr_ip":"<%= request.getRemoteAddr()%>",
		  		"page":"${name}",
		  		"usr_id":seid
			};
		setLog(params);
		$.ajax({
			method: "POST",
			url: apiurl+"/rest/process/pagelog",
			data: params,
			success:function(data){   
				setLog( data );  
			},   
			beforeSend:function(b){   
				setLog( b );     
			},  
			error:function(e){  
				setLog( e );  
			}  
		}).done(function( msg ) {
			setLog( "Data Saved: " + msg );
		});
    },
	print1:function(){
		$('#myModalPrint1').modal('hide');	
		$('#resultprintlayout > div.alert.alert-danger').hide();
		$('#exCollapsingNavbar2 > ul > li:nth-child(7) > a').trigger('click');
		
		
	},
	print2:function(){
		$('#myModalPrint2').modal('hide');
		$('#listlayout .alert').hide();
		$('#exCollapsingNavbar2 > ul > li:nth-child(9) > a').trigger('click');
		
	},
    list: function(func,tg,param) {
        $.ajax({
			method: "GET",
			url: apiurl+"/rest/datatable",
			data: param,
			cache: false,
			success:function(data){   
				setLog( "2##########################1" ); 
				setLog( data );
				setLog( "2##########################2" ); 
				func(data,tg,param);
				//app.reglayout(data,'smjs');
			},   
			beforeSend:function(b){   
				setLog( b );     
			},  
			error:function(e){  
				setLog( e );
				setLog( "3##########################3" ); 
			}  
		}).done(function( msg ) {
			setLog( "Data Saved: " + msg );
		});
	},
	list1: function(func,tg,param,arr) {
		$.ajax({
			method: "GET",
			url: apiurl+"/rest/datatable",
			data: param,
			success:function(data){   
				setLog("1#######################################5");
				setLog( data );  
				setLog("1#######################################5");
				func(data,tg,arr);
				//app.reglayout(data,'smjs');
			},   
			beforeSend:function(b){   
				setLog( b );     
			},  
			error:function(e){  
				setLog( e );  
			}  
		}).done(function( msg ) {
			setLog( "Data Saved: " + msg );
		});
    },
    list2: function(id,func,tg,seid) {
        $.ajax({
			method: "GET",
			url: apiurl+"/rest/datatable",
			data: { id: id, method: "read_List" ,temp_id:seid},
			success:function(data){   
				setLog( data );  
				func(data,tg);
				//app.reglayout(data,'smjs');
			},   
			beforeSend:function(b){   
				setLog( b );     
			},  
			error:function(e){  
				setLog( e );  
			}  
		}).done(function( msg ) {
			setLog( "Data Saved: " + msg );
		});
	},
	listlayout:function(rs1,defaultsid){
		var ly=$('#listlayout');
		var ul=$("<ul/>",{class:'list-group'}).appendTo(ly);
		var vHtml;
		var li;
		var i=0;
		var j=0;
		var first=0;
		var secound=0;
		var rs2 = eval("("+rs1+")");
		rs=rs2.data;
		setLog(rs);
		$.each(rs,function(idx,r){
			vHtml ='<li>[' + r.ETC3 + '] <a href="#" onclick="app.rslt(\''+r.USR_ID+'\')">'+r.ETC2+' ('+r.ETC1+') 신청</a> <span class="pull-right">'+r.REG_DATE+'</span></li>';
			$("<li/>",{class:'list-group-item',html:vHtml}).appendTo(ul);
		});
	},
	listlayoutmodal:function(rs1,defaultsid){
		$('#listlayout').html('');
		var ly=$('#listlayout');
		var ul=$("<ul/>",{class:'list-group'}).appendTo(ly);
		var vHtml;
		var li;
		var i=0;
		var j=0;
		var first=0;
		var secound=0;
		var rs2 = eval("("+rs1+")");
		rs=rs2.data;
		setLog(rs);
		$.each(rs,function(idx,r){
			//20170313_test
			console.log("* REG_DATE : [" + r.REG_DATE + "] " + " : [" + r.REG_DATE.substring(0, 4) + "]");
			if(r.REG_DATE.substring(0, 4) != "2017"){
				vHtml ='<li>[' + r.ETC3 + '] <a href="#" onclick="app.rsltmodal(\''+r.USR_ID+'\')">'+r.ETC2+' ('+r.ETC1+') 신청</a> <span class="pull-right">'+r.REG_DATE+'</span></li>';
				$("<li/>",{class:'list-group-item',html:vHtml}).appendTo(ul);
			}
		});
	},
	listlayout1:function(rs1,tg,arr){
		setLog(arr);
		var ly=$('#modal-req');
		ly.html('');
		var ul=$("<ul/>",{class:'list-group',style:"margin-bottom:20px;"}).appendTo(ly);
		var vHtml;
		var li;
		var i=0;
		var j=0;
		var first=0;
		var secound=0;
		var rs2 = eval("("+rs1+")");
		rs=rs2.data;
		setLog(rs);
		$.each(rs,function(idx,r){
			vHtml ='<li>[' + r.ETC3 + '] '+r.ETC2+' ('+r.ETC1+') 시험결과 100점중  ('+arr.ETC3+') 점 <div  class="btn btn-info hide">'+arr.ETC4+'</div></li>';
			$("<li/>",{style:"font-size:20px;;",class:'list-group-item',html:vHtml}).appendTo(ul);
		});
	},
	listlayout2:function(rs1,defaultsid){//교육참가자 리스트
		var ly=$('#listlayout');
		var ul=$("<ul/>",{class:'list-group'}).appendTo(ly);
		var vHtml;
		var li;
		var i=0;
		var j=0;
		var first=0;
		var secound=0;
		var rs2 = eval("("+rs1+")");
		rs=rs2.data;
		$.each(rs,function(idx,r){
			i++;
			j++;
			secound=first;
			first=r.SEQ;
			
			if(first!=secound){
				j=0;
				vHtml = "";
				vHtml+=r.ITEM_CODE;
			}else{
				vHtml+=","+r.ITEM_CODE;
				if(j==11){
					var data = vHtml.split(",");
				/*	0:"윤덕진"
					1:"1971-08-16"
					2:"새솔소프트"
					3:"16998"
					4:"경기 용인시 기흥구 동백8로 9 (동백동"
					5:" 호수마을 자연앤 데시앙)"
					6:"1234" -- 상세주소
					7:"1234" -- 전화번호 
					8:"dokjin@gmail.com"
					9:"신규어선중개업" - 교육구분
					10:"2016-10-10"
					11:"A1Dyt91q"
					12:"1234"
				*/
					var newVhtml='['+data[9] +'] <a href="#">'+data[2] +'</a><div>'+data[10]+'</div>';
					$("<li/>",{class:'list-group-item',html:r.SEQ+". "+newVhtml}).appendTo(ul);
				}
			}
			if(rs.length==i){
				
			}
		});
	},
	rslt:function(usr){//교육평가 결과
		app.list2('smjs_common_rslt',app.rsltlayout,'rsltlayout',usr);
	},
	rsltmodal:function(usr){//교육평가 모달 결과
		app.list2('smjs_common_rslt',app.rsltlayoutmodal,'rsltlayout',usr);
	},
	rsltlayout:function(rs1,defaultsid){//교육평가 결과 표
		var ly=$('#Result-bodys');
		ly.html('');
		var ul=$("<ul/>",{class:'list-group',style:''}).appendTo(ly);
		var vHtml;
		var li;
		var i=0;
		var j=0;
		var first=0;
		var secound=0;
		var rs2 = eval("("+rs1+")");
		var sum=0;
		var cnt=0;
		var rslticon="";
		rs=rs2.data;
		setLog(rs);
		var i=0;
		$.each(rs,function(idx,r){
			sum=sum+parseInt(r.RSLT);
			i++;
			if(r.RSLT==0){
				rslticon='<i class="fa fa-times" aria-hidden="true"></i>';
			}else{
				rslticon='<i class="fa fa-circle-o" aria-hidden="true"></i>';
				cnt++;
			}
			vHtml =rslticon+'  ' + r.CONTS + ' <br /><div >'+r.SUB_SELECTED+' 선택(<span style="color:red;">'+r.RSLT+' 점</span>)</div>';
			$("<li/>",{class:'list-group-item',html:vHtml}).appendTo(ul);
			if(rs.length==i){
				//$('.bd-example-modal-lg').modal('show');
				if(sum>=60){
					$('#gridResultLabel').html('[합격] 어선중개인시험 총 25문제중 '+cnt+' 정답  <span class="pull-right">총점수 '+sum+'점</span>');
				}else{
					$('#gridResultLabel').html('[불합격] 어선중개인시험 총 25문제중 '+cnt+' 정답  <span class="pull-right">총점수 '+sum+'점</span>');
				}
				
				var req={ id: 'smjs_common_list', method: "read_List" ,temp_id:r.USR_ID};
				app.list1(app.listlayout1,'Result-req',req,r);
				
			}
			setLog(i);
		});
	},
	rsltlayoutmodal:function(rs1,defaultsid){//myModalReult
		var ly=$('#modal-bodys');
		ly.html('');
		var ul=$("<ul/>",{class:'list-group',style:''}).appendTo(ly);
		var vHtml;
		var li;
		var i=0;
		var j=0;
		var first=0;
		var secound=0;
		var rs2 = eval("("+rs1+")");
		var sum=0;
		var cnt=0;
		var rslticon="";
		rs=rs2.data;
		setLog(rs);
		var i=0;
		$.each(rs,function(idx,r){
			sum=sum+parseInt(r.RSLT);
			i++;
			if(r.RSLT==0){
				rslticon='<i class="fa fa-times" aria-hidden="true"></i>';
			}else{
				rslticon='<i class="fa fa-circle-o" aria-hidden="true"></i>';
				cnt++;
			}
			vHtml =rslticon+'  ' + r.CONTS + ' <br /><div">'+r.SUB_SELECTED+' 선택(<span style="color:red;">'+r.RSLT+' 점</span>)</div>';
			$("<li/>",{class:'list-group-item',html:vHtml}).appendTo(ul);
			if(rs.length==i){
				//$('.bd-example-modal-lg').modal('show');
				if(sum>=60){
					$('#gridModalLabel').html('[합격] 어선중개인시험 총 25문제중 '+cnt+' 정답  <span class="pull-right">총점수 '+sum+'점</span>');
				}else{
					$('#gridModalLabel').html('[불합격] 어선중개인시험 총 25문제중 '+cnt+' 정답  <span class="pull-right">총점수 '+sum+'점</span>');
				}
				
				var req={ id: 'smjs_common_list', method: "read_List" ,temp_id:r.USR_ID};
				app.list1(app.listlayout1,'modal-req',req,r);
				$('#myModalReult').modal('show');	
			}
			setLog(i);
		});
	},
	testlayout:function(rs1,defaultsid,param){//교육평가 입력폼
		var rs2 = eval("("+rs1+")");
		rs=rs2.data;
		var _tardiv = $("#" + defaultsid);
		var form = $("<form/>",{id:defaultsid + "_frm_write",name:defaultsid + "frm_write",action:"http://fishboat3.kgis.kr:8080/rest/process/pinfo",method:"POST"}).appendTo(_tardiv);
		var chasu = $("<input/>",{type:'hidden',name:'chasu',value:rs[0].CHASU}).appendTo(form);
		var step = $("<input/>",{type:'hidden',name:'step',value:'STEP2'}).appendTo(form);
		var year = $("<input/>",{type:'hidden',name:'year',value:rs[0].YEAR}).appendTo(form);
		
		var usr_id = $("<input/>",{type:'hidden',name:'usr_id',value:seid}).appendTo(form);
		$("<input/>",{type:'hidden',name:'etc1'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'etc2'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'etc3'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'etc4'}).appendTo(form);

		var count  = 0;
		var cseq = '';
		var vHtml="<ul class='list-group'>";
		var i=0;
		var j=0;
		var z=0;
		var first=0;
		var secound=0;
		var etc2_1="";
		var etc2_2="";
		var formhtml='';
		$.each(rs,function(idx,r){
			
			i++;
			j++;
			secound=first;
			first=r.UP_SEQ;

			etc2_2=etc2_1;
			etc2_1=r.ETC2;
			setLog(i+' etc2_1 '+etc2_1+' etc2_2 '+etc2_2 + r.ETC2);
			if(r.TYPE=='text'){
				//formhtml="<input type='text' />";
			}
			if(etc2_1!=etc2_2){
				
				vHtml+="<div class='clear:bodh;'></div><br /><br /><h3>"+r.ETC2 +'.'+ r.CLASS_NM+"</h3><div class='clear:bodh;'></div>";
			}
			var setdata="data-type='text' data-url='http://fishboat3.kgis.kr:8080/rest/process/smjsInsert' data-pk='"+r.SEQ+"'  data-title='"+r.SUB_CONTS+"'";
			var setcdata="data-sseq='"+r.SEQ+"' data-mseq='"+r.UP_SEQ+"' data-cseq='"+r.C_SEQ+"'";
			var corrdata="";
			var corrdatacss="style='font-size:20px;'";
			if(r.CORR=="Y"){
				corrdata="V ";
				corrdatacss="style='color:red;font-size:20px;'"
			}
			
			if(first!=secound){
				j=0;
				z++;
				var setdata_01="data-pk='"+r.UP_SEQ+"' data-type='text' data-url='http://fishboat3.kgis.kr:8080/rest/process/smjsInsert' data-title='"+r.CONTS+"'";
				vHtml+=""+
					"</ul><ul style='margin-top:10px;' class='list-group'><li class='list-group-item  active'>"+
					"<a class='editors1' style='color:#ffffff' "+setdata_01+">"+z+'.'+r.CONTS+"</a> <span id='corrend_"+r.UP_SEQ+"' class='corrstart pull-right'></span>"+
					"<li>";

				vHtml+="<li  class='list-group-item'>"+
					"<a for='radio_"+r.SEQ+"' class='editors' "+setdata+">"+r.SUB_CONTS+"</a>"+
					"<span class='pull-right corrItem '   "+setcdata+">"+corrdata+" <input id='radio_"+r.SEQ+"' data-pk='"+r.UP_SEQ+"' class='corrchk' type='radio' name='"+r.ETC1+'_'+r.UP_SEQ+"' value='"+r.SEQ+"'></span></li>";
				
			}else{	

				vHtml+="<li  class='list-group-item'>"+
					"<a for='radio_"+r.SEQ+"' class='editors' "+setdata+">"+r.SUB_CONTS+"</a>"+
					"<span class='pull-right corrItem  '  "+setcdata+">"+corrdata+" <input id='radio_"+r.SEQ+"' data-pk='"+r.UP_SEQ+"' class='corrchk' type='radio' name='"+r.ETC1+'_'+r.UP_SEQ+"' value='"+r.SEQ+"'></span></li>";

				if(j==4){
					//setLog(j);
					//vHtml+="</ul></li>";
				}
			}

			if(rs.length==i){
				//$('#testlayout').append(vHtml+"</ul>");
				$("<div/>",{html:vHtml+"</ul>"}).appendTo(form);
				//$('.editors').editable();
				
				/*$('.editors').editable({
					params: function(params) {
						// add additional params from data-attributes of trigger element
						params.tables = $(this).editable().data('tables');
						params.pknm = $(this).editable().data('pknm');
						params.id = 'update_smjs_inline02';
						return params;
					}
				});
				$('.editors1').editable({
					params: function(params) {
						
						//params.tables = $(this).editable().data('tables');
						//params.pknm = $(this).editable().data('pknm');
						params.id = 'update_smjs_inline01';
						return params;
					}
				});*/
				
			}
		});

		$("<div/>",{class:'pdt-20'}).appendTo(form);
		$("<input/>",{id:'testRegBtn',class:'btn btn-info',type:'button',value:'교육평가등록',style:'width:100%;'}).appendTo(form).bind("click",function(){
			//alert('등록을 처리 한다.');
			if($("#testlayout_frm_write .corrstart").length==0||$(".corrstart").length==undefined){
				app.submit_test("testlayout_frm_write");
			}else{
				$('.fixed').html('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">닫기</span></button><h6>알림!!</h6><br />아직 '+$(".corrstart").length+' 문제를 풀지 않으셨습니다\n파란색으로 표시된 문제를 확인해주세요');
				$('.fixed').show().fadeOut(20000);
				location.hash = '#testlayout_frm_write #'+$( ".corrstart:first" ).attr('id');	
				try
				{
					var forusmove=$('#testlayout_frm_write #'+$( ".corrstart:first" ).attr('id'));
					forusmove.focus();
					location.hash = '#testlayout_frm_write #'+$( ".corrstart:first" ).attr('id');	
				}
				catch (e)
				{
				}

			}
			return false;
		});
	},
	testlayout2:function(rs1,defaultsid,param){//만족도조사 입력폼
		var rs2 = eval("("+rs1+")");
		rs=rs2.data;
		var _tardiv = $("#" + defaultsid);
		var form = $("<form/>",{id:defaultsid + "_frm_write",name:defaultsid + "_frm_write",action:"http://fishboat3.kgis.kr:8080/rest/process/pinfo",method:"POST"}).appendTo(_tardiv);
		var chasu = $("<input/>",{type:'hidden',name:'chasu',value:rs[0].CHASU}).appendTo(form);
		var step = $("<input/>",{type:'hidden',name:'step',value:'STEP4'}).appendTo(form);
		var year = $("<input/>",{type:'hidden',name:'year',value:rs[0].YEAR}).appendTo(form);
		
		var usr_id = $("<input/>",{type:'hidden',name:'usr_id',value:seid}).appendTo(form);
		$("<input/>",{type:'hidden',name:'etc1'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'etc2'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'etc3'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'etc4'}).appendTo(form);

		var count  = 0;
		var cseq = '';
		var vHtml="<ul class='list-group'>";
		var i=0;
		var j=0;
		var first=0;
		var secound=0;
		var formhtml='';
		$.each(rs,function(idx,r){
			
			i++;
			j++;
			secound=first;
			first=r.UP_SEQ;
			var setdata="data-type='text' data-url='http://fishboat3.kgis.kr:8080/rest/process/smjsInsert' data-pk='"+r.SEQ+"'  data-title='"+r.SUB_CONTS+"'";
			var setcdata="data-sseq='"+r.SEQ+"' data-mseq='"+r.UP_SEQ+"' data-cseq='"+r.C_SEQ+"'";
			var corrdata="";
			var corrdatacss="style='font-size:20px;'";
			if(r.CORR=="Y"){
				corrdata="V ";
				corrdatacss="style='color:red;font-size:20px;'"
			}
			if(first!=secound){
				j=0;
				var setdata_01="data-pk='"+r.UP_SEQ+"' data-type='text' data-url='http://fishboat3.kgis.kr:8080/rest/process/smjsInsert' data-title='"+r.CONTS+"'";
				vHtml+=""+
					"</ul><ul style='margin-top:10px;' class='list-group'><li class='list-group-item  active'>"+
					"<a class='editors1' style='color:#ffffff' "+setdata_01+">"+r.CONTS+"</a> <span id='corrend_"+r.UP_SEQ+"' class='corrstart pull-right'></span>"+
					"<li>";

				vHtml+="<li  class='list-group-item'>"+
					"<a for='radio_"+r.SEQ+"' class='editors' "+setdata+">"+r.SUB_CONTS+"</a>"+
					"<span class='pull-right corrItem '   "+setcdata+">"+corrdata+" <input id='radio_"+r.SEQ+"' data-pk='"+r.UP_SEQ+"' class='corrchk' type='radio' name='"+r.ETC1+'_'+r.UP_SEQ+"' value='"+r.SEQ+"'></span></li>";
			}else{	

				vHtml+="<li  class='list-group-item'>"+
					"<a for='radio_"+r.SEQ+"' class='editors' "+setdata+">"+r.SUB_CONTS+"</a>"+
					"<span class='pull-right corrItem  '  "+setcdata+">"+corrdata+" <input id='radio_"+r.SEQ+"' data-pk='"+r.UP_SEQ+"' class='corrchk' type='radio' name='"+r.ETC1+'_'+r.UP_SEQ+"' value='"+r.SEQ+"'></span></li>";
			}

			if(rs.length==i){
				$("<div/>",{html:vHtml+"</ul>"}).appendTo(form);
			}
		});

		$("<div/>",{class:'pdt-20'}).appendTo(form);
		$("<input/>",{id:'test2RegBtn',class:'btn btn-info',type:'button',value:'만족도조사',style:'width:100%;'}).appendTo(form).bind("click",function(){
			if($("#oklayout_frm_write .corrstart").length==0||$("#oklayout_frm_write .corrstart").length==undefined){
				app.submit_test2("oklayout_frm_write");
			}else{
				$('.fixed').html('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">닫기</span></button><h6>알림!!</h6><br />아직 '+$(".corrstart").length+' 문제를 풀지 않으셨습니다\n파란색으로 표시된 문제를 확인해주세요');
				$('.fixed').show().fadeOut(20000);
				location.hash = '#oklayout_frm_write #'+$( ".corrstart:first" ).attr('id');	
				try
				{
					var forusmove=$('#oklayout_frm_write  #'+$( ".corrstart:first" ).attr('id'));
					forusmove.focus();
					location.hash = '#oklayout_frm_write #'+$( ".corrstart:first" ).attr('id');	
				}
				catch (e)
				{
				}

			}
			return false;
		});
	},
	reglayout: function(rs1,defaultsid,param){//교육신청 입력폼
		setLog("1#######################################");
		setLog(rs1);
		setLog(param);
		setLog("#######################################2");
		var rs2 = eval("("+rs1+")");
		rs=rs2.data;
		var _tardiv = $("#" + defaultsid);
		var boardlist = $("<div/>",{"id":"regboard_lists","class":"board_list","style":"display:none"}).appendTo(_tardiv);
		var form = $("<form/>",{id:defaultsid + "_frm_write",name:defaultsid + "frm_write",action:"http://fishboat3.kgis.kr:8080/rest/process/pinfo",method:"POST"}).appendTo(boardlist);
		var chasu = $("<input/>",{type:'hidden',name:'chasu',value:rs[0].CHASU}).appendTo(form);
		var step = $("<input/>",{type:'hidden',name:'step',value:param.setp}).appendTo(form);
		var year = $("<input/>",{type:'hidden',name:'year',value:rs[0].YEAR}).appendTo(form);
		var usr_id = $("<input/>",{type:'hidden',name:'usr_id',value:seid}).appendTo(form);
		$("<input/>",{type:'hidden',name:'e1'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'e2'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'e3'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'e4'}).appendTo(form);
		
		var tb = $("<div/>",{id:defaultsid + "_boardlist",class:""}).appendTo(form);
		
		var tbbody = $("<ul/>",{style:"padding:0px;"}).appendTo(tb);
		var count  = 0;
		$.each(rs,function(idx,r){
			var checked='';
			if(r.CHECKED){
				checked='required'
			}
			if(idx==0){
				count++;
				var tbbodytr = $("<li/>",{'data-seq':count,style:"margin-top:7px;"}).appendTo(tbbody);
				$("<label/>",{html:r.CONTS,style:"font-weight:bold;"}).appendTo(tbbodytr);
				var td = $("<div/>",{}).appendTo(tbbodytr);
				
				app.formlayout(td,r);

			}else{
				if(rs[idx-1].UP_SEQ == r.UP_SEQ){
					var up_seq = count-1;
					
					app.formlayout(td,r);
					
				}else{
					count++;
					var tbbodytr = $("<li/>",{'data-seq':count,style:"margin-top:7px;"}).appendTo(tbbody);
					$("<label/>",{html:r.CONTS,style:"font-weight:bold;"}).appendTo(tbbodytr);
					var td = $("<div/>",{}).appendTo(tbbodytr);
					app.formlayout(td,r,checked);
				}
			}
			
		});
		$("<input/>",{class:"btn btn-info",type:'button',value:'교육신청등록',id:'regsubmitbtn'}).appendTo(form).bind("click",function(){
			app.submit(defaultsid + "_frm_write");
		});
		//$("<input/>",{style:'margin-left:10px;',id:'copytempidbtn',class:"btn btn-default",type:'button',value:'임시아이디 비빌번호 복사'}).appendTo(form).bind("click",function(){
		//	alert('복사되었습니다.');
		//});
		$("input[name=STEP1_72]").val(seid);
		form.find("input, select, button, textarea").prop("disabled", true);
		
	},
	reglayout2: function(rs1,defaultsid,param){//어선중개업신청 폼
		setLog("#######################################");
		setLog(param);
		var rs2 = eval("("+rs1+")");
		rs=rs2.data;
		var _tardiv = $("#" + defaultsid);
		var boardlist = $("<div/>",{"class":"board_list"}).appendTo(_tardiv);
		var form = $("<form/>",{id:defaultsid + "_frm_write",name:defaultsid + "frm_write",action:"http://fishboat3.kgis.kr:8080/rest/process/pinfo",method:"POST"}).appendTo(boardlist);
		var chasu = $("<input/>",{type:'hidden',name:'chasu',value:rs[0].CHASU}).appendTo(form);
		var step = $("<input/>",{type:'hidden',name:'step',value:'STEP3'}).appendTo(form);
		var year = $("<input/>",{type:'hidden',name:'year',value:rs[0].YEAR}).appendTo(form);
		var usr_id = $("<input/>",{type:'hidden',name:'usr_id',value:seid}).appendTo(form);
		$("<input/>",{type:'hidden',name:'e1'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'e2'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'e3'}).appendTo(form);
		$("<input/>",{type:'hidden',name:'e4'}).appendTo(form);
		
		var tb = $("<div/>",{id:defaultsid + "_boardlist","class":""}).appendTo(form);
		
		var tbbody = $("<ul/>",{style:"padding:0px;"}).appendTo(tb);
		var count  = 0;
		$.each(rs,function(idx,r){
			var checked='';
			if(r.CHECKED){
				checked='required'
			}
			if(idx==0){
				count++;
				var tbbodytr = $("<li/>",{'data-seq':count,style:"margin-top:7px;"}).appendTo(tbbody);
				$("<label/>",{html:r.CONTS,style:"font-weight:bold;"}).appendTo(tbbodytr);
				var td = $("<div/>",{}).appendTo(tbbodytr);
				
				app.formlayout(td,r);

			}else{
				if(rs[idx-1].UP_SEQ == r.UP_SEQ){
					var up_seq = count-1;
					
					app.formlayout(td,r);
					
				}else{
					count++;
					var tbbodytr = $("<li/>",{'data-seq':count,style:"margin-top:7px;"}).appendTo(tbbody);
					$("<label/>",{html:r.CONTS,style:"font-weight:bold;"}).appendTo(tbbodytr);
					var td = $("<div/>",{}).appendTo(tbbodytr);
					app.formlayout(td,r,checked);
				}
			}
			
		});
		$("<input/>",{class:"btn btn-info",type:'button',value:'어선중개업신청',id:'lastsubmitbtn'}).appendTo(form).bind("click",function(){
			app.submit2(defaultsid + "_frm_write");
		});
		//form.find("input, select, button, textarea").prop("disabled", true);
		
	},
	formlayout: function(td,r,checked){//form type
				if(r.TYPE=='text'||r.TYPE=='email'){
					$("<input/>",{class:checked+' form-control',type:r.TYPE,name:r.ETC1+'_'+r.UP_SEQ}).appendTo(td);
				}else if(r.TYPE=='doc'){
					//$(r.SUB_CONTS).appendTo(td);
					$("<p/>",{html:r.SUB_CONTS}).appendTo(td);
				}else if(r.TYPE=='postnum'){
					$("<input/>",{style:"width:100px;margin-right:10px;",class:'form-control pull-left',id:'sample6_postcode',type:'text',name:r.ETC1+'_'+r.UP_SEQ}).prop('readonly', true).appendTo(td);
					$("<input/>",{class:'btn btn-default  ',id:'sample6_postcode',type:'button',value:'우편번호 찾기'}).appendTo(td).bind("click",function(){
						sample6_execDaumPostcode();
					});
				}else if(r.TYPE=='addres'){
					$("<input/>",{class:checked+' form-control',id:'sample6_address',type:'text',name:r.ETC1+'_'+r.UP_SEQ}).prop('readonly', true).appendTo(td);
				}else if(r.TYPE=='addres2'){
					$("<input/>",{class:checked+' form-control',id:'sample6_address2',type:'text',name:r.ETC1+'_'+r.UP_SEQ}).appendTo(td);
				}else if(r.TYPE=='readonly'){
					// 20170306_test
					/*$("<input/>",{class:checked+' form-control',type:'text',name:r.ETC1+'_'+r.UP_SEQ}).prop('readonly', true).appendTo(td);*/
					$("<input/>",{class:checked+' form-control',type:'text',name:r.ETC1+'_'+r.UP_SEQ}).appendTo(td);
				}else if(r.TYPE=='readonly'){
					// 20170306_test
					/*$("<input/>",{class:checked+' form-control',type:'hidden',name:r.ETC1+'_'+r.UP_SEQ}).prop('readonly', true).appendTo(td);*/
					$("<input/>",{class:checked+' form-control',type:'hidden',name:r.ETC1+'_'+r.UP_SEQ}).appendTo(td);
				}else{
					$("<input/>",{class:checked+' form-control',type:r.TYPE,name:r.ETC1+'_'+r.UP_SEQ}).appendTo(td);
				}
	},
	submit2: function(formName, callbackfunc) {//어선중개업등록증 등록
		$.post("http://fishboat3.kgis.kr:8080/rest/process/pinfo", $( "#" + formName ).serialize(), function(result) {
			
			var obj = jQuery.parseJSON( result );
			if (obj.status == "success"){
				alert("어선중개업 신청되었습니다\n승인후 중개업 신청서 출력이 가능합니다.");
				//현재는 전체 추후 현재 세션의 결과
				//var req={ id: 'smjs_common_list', method: "read_List" ,usr_id:seid};
				//app.list(app.listlayout,'listlayout',req);
				var req={ id: 'smjs_common_list', method: "read_List" ,usr_id:seid};
				app.list(app.listlayoutmodal,'listlayout',req);
				
				
				$("#myModalPrint2Btn").show();
				//$('#exCollapsingNavbar2 > ul > li:nth-child(8) > a').trigger('click');
				$('#print2 .alert').hide();
				$("#lastsubmitbtn").hide();
			}else{
				alert("어선중개업 신청에 실패 하였습니다.\n다시신청 바랍니다.");
			}
		});
	},
	submit: function(formName, callbackfunc) {//교육신청등록
		
		setLog($( "#" + formName ).serialize());
		var i=0;
		var msg='<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">닫기</span></button><h6>알림!!</h6><br /> 모든 입력란은 필수 입니다 입력값을 확인해주세요';
		$("#" + formName + ' .required').each(function(index) {
			
			if ($(this).val()=='')
			{
				$(this).focus();
				$('.fixed').html(msg);
				$('.fixed').show().fadeOut(20000);;
				return false;
			}
				
			i++;
			if($("#" + formName + ' .required').length==i){
				$("input[name=e1]").val( $("input[name=STEP1_1]").val() );//성명
				$("input[name=e2]").val( $("input[name=STEP1_3]").val() );//사업장명칭
				$("input[name=e3]").val( $("input[name=STEP1_7]").val() );//교육과정
				$("input[name=e4]").val( $("input[name=STEP1_5]").val() );//전화번호
				$.post("http://fishboat3.kgis.kr:8080/rest/process/pinfo", $( "#" + formName ).serialize(), function(result) {

					if (callbackfunc != undefined){
						callbackfunc(result);
					}else {
						
						// 20170306_test
						/*if (result.status == "success"){*/
							steps=2;

							// 평가레이아웃
							$('#regsubmitbtn').remove();
							$('#copytempidbtn').remove();
							$( "#" + formName ).find("input[name*='STEP1_72']").remove();
							$( "#" + formName ).find("input[name*='STEP1_73']").remove();
							var $inputs = $( "#" + formName ).find("input, select, button, textarea").prop("disabled", true);
							app.list(app.testlayout,'testlayout',{ id: 'smjs_common_reg3', method: "read_List" ,usr_id:seid,setp:'STEP2'});
							
							//$('#testlayout .alert .msg').text('교육평가 준비가 완료 되었습니다.');
							$('#testlayout .alert .msg').hide();
							$('#exCollapsingNavbar2 > ul > li:nth-child(3) > a').trigger('click');
							dailyMissionTimer(1);	
						// 20170306_test
						/*}else {
							steps=1;
							alert(result.status + "\n" + result.message);
						}*/
					}
				},"json");
				return;
			}

		});
		return;
	},
	submit_test: function(formName, callbackfunc) {//교육평가등록
		$.post("http://fishboat3.kgis.kr:8080/rest/process/pinfo", $( "#" + formName ).serialize(), function(result) {
			if (callbackfunc != undefined){
				callbackfunc(result);
			}else {
				var obj = jQuery.parseJSON( result );
				if (obj.status == "success"){
					
					var sumtotal=0;
					var usr;
					var seq;
					$.ajax({
						type        : "POST",
						data        : {id:"smjs_common_rsltchk", method: "read_List" ,temp_id:seid},
						url         : 'http://fishboat3.kgis.kr:8080/rest/datatable',
						cache		: false,
						dataType	: 'json',
						contentType : "application/x-www-form-urlencoded; charset=utf-8", 
						success : function(data) {
							setLog(data);
							setLog(data.data[0]);
							sumtotal=data.data[0].RSLT;
							usr=data.data[0].USR;
							seq=data.data[0].SEQ;
						},
						error : function(data) { //실패
							setLog(data);
							return false;
						}
					}).done(function(){
						//20170306_test
						//if(sumtotal>=60){
							alert(sumtotal+"점입니다 축하합니다.\n합격 하셨습니다.");
							
							$.ajax({
								type:"POST",
								data:{sql_id:"update_smjs_rslt",id:"update_smjs_rslt",method:"update",sumtotal:sumtotal,usr:usr,seq:seq,rslt:"합격"},
								url:"http://fishboat3.kgis.kr:8080/rest/process/cud",
								success : function(data) {
								},
								error : function(data) { //실패
									setLog(data);
									return false;
								}
							}).done(function(){
								app.rslt(seid);
								var req={ id: 'smjs_common_reg2', method: "read_List" ,usr_id:seid,setp:'STEP4'};
								app.list(app.testlayout2,'oklayout',req);
								$("#testRegBtn").remove();
								$('#oklayout .alert .msg').text("만족도 조사 완료 후 이수증 발급이 가능 합니다.");
								$('#exCollapsingNavbar2 > ul > li:nth-child(4) > a').trigger('click');
							});
						//20170306_test
						/*}else{
							alert(sumtotal+"점입니다 안타깝네요.\n교육신청 부터 다시 진행해 주시기 바랍니다.");
							$.ajax({
								type:"POST",
								data:{sql_id:"update_smjs_rslt",id:"update_smjs_rslt",method:"update",sumtotal:sumtotal,usr:usr,seq:seq,rslt:"불합격"},
								url:"http://fishboat3.kgis.kr:8080/rest/process/cud",
								success : function(data) {
									setLog(data);
									//setLog(data.data[0]);
									//sumtotal=data.data[0].RSLT;
								},
								error : function(data) { //실패
									setLog(data);
									return false;
								}
							}).done(function(){
								location.reload();
								//app.rslt(seid);
								//var req={ id: 'smjs_common_reg2', method: "read_List" ,usr_id:seid,setp:'STEP4'};
								//app.list(app.testlayout2,'oklayout',req);
								//$("#testRegBtn").remove();
								//$('#oklayout .alert .msg').hide();
								//$('#exCollapsingNavbar2 > ul > li:nth-child(4) > a').trigger('click');
							});
							
						}*/
					});	
				}else {
					alert(obj.status + "\n" + obj.message);
				}
			}
				
		});
	
	},
	submit_test2:function(formName, callbackfunc) {//만족도조사등록
		$.post("http://fishboat3.kgis.kr:8080/rest/process/pinfo", $( "#" + formName ).serialize(), function(result) {
			if (callbackfunc != undefined){
				callbackfunc(result);
			}else {
				var obj = jQuery.parseJSON( result );
				if (obj.status == "success"){
					
					//어선신청
					var req={ id: 'smjs_common_reg2', method: "read_List" ,usr_id:seid,setp:'STEP3'};
					app.list(app.reglayout2,'resultprintlayout',req);
					
					//현재는 전체 추후 현재 세션의 결과 - > 교육신청 완료 후 로 
					//var req={ id: 'smjs_common_list', method: "read_List" ,usr_id:seid};
					//app.list(app.listlayout,'listlayout',req);
					$('#print1 .alert').hide();
					$("#myModalPrint1Btn").show();//이수증 발급버튼 활성화
					$('#test2RegBtn').hide();
					$('#exCollapsingNavbar2 > ul > li:nth-child(6) > a').trigger('click');
				}else{
					alert(obj.status + "\n" + obj.message);

				}
			}
		});
	}
}
$(document).ready(function () {
	
	app.init();
});
$(document).on("click",".corrchk",function() {
	var dom=$("#corrend_"+$(this).attr('data-pk'));
	dom.removeClass('corrstart');
	dom.addClass('corrend');
	dom.text('');
	dom.parent().css("background-color","red");
});
$(document).on("click",".navopen",function() {
	var chk=$(".pos-f-t").is(":visible");
	if (chk==true)
	{
		$(".pos-f-t").hide();
	}else{
		$(".pos-f-t").show();
	}
	
});
//이수증 발급 버튼
//id : myModalPrint1Btn

$(document).on("click","#myModalPrint1Btn",function() {
	alert(seid);
	var usr_id=	seid;//아이디
	var v1=	$("input[name=STEP1_1]").val();//성명
	var v2=	$("input[name=STEP1_2]").val();//생년월일
	var v3=	$("input[name=STEP1_3]").val();//사업장명칭
	var v4=	$("input[name=STEP1_7]").val();//교육과정
	var v5=	$("input[name=STEP1_5]").val();//전화번호
	var v6=	"";
	var v7=	1;//전화번호
	$.ajax({
		type:"POST",
		data:{sql_id:"insert_smjs_print1",id:"insert_smjs_print1",method:"create",temp_id:usr_id,v1:v1,v2:v2,v3:v3,v4:v4,v5:v5,v6:v6,v7:v7},
		url:"http://fishboat3.kgis.kr:8080/rest/process/cud",
		success : function(data) {
			setLog(data);
		},
		error : function(data) { //실패
			setLog(data);
			return false;
		}
	});
});
$(document).on("click","#myModalPrint2Btn",function() {
	alert(seid);
	var usr_id=	seid;//아이디
	var v1=	$("input[name=STEP1_1]").val();//성명
	var v2=	$("input[name=STEP1_2]").val();//생년월일
	var v3=	$("input[name=STEP1_3]").val();//사업장명칭
	var v4=	$("input[name=STEP1_7]").val();//교육과정
	var v5=	$("input[name=STEP1_5]").val();//전화번호
	var v6=	"";
	var v7=	2;//전화번호
	$.ajax({
		type:"POST",
		data:{sql_id:"insert_smjs_print1",id:"insert_smjs_print1",method:"create",temp_id:usr_id,v1:v1,v2:v2,v3:v3,v4:v4,v5:v5,v6:v6,v7:v7},
		url:"http://fishboat3.kgis.kr:8080/rest/process/cud",
		success : function(data) {
			setLog(data);
		},
		error : function(data) { //실패
			setLog(data);
			return false;
		}
	});
});
$(document).on("click",".nav-link",function() {
	var ww=$( window ).width();
	if (ww<768)
	  {
			$(".pos-f-t").hide();
	  }else{
			$(".pos-f-t").show();	
	  }
	$('.loddingicon').show();
	$('.contentbody').hide();
	setTimeout(function(){ 
		$('.contentbody').fadeIn(1500);;
		$('.loddingicon').hide();
	
	}, 500);
});
$( window ).resize(function() {
  var ww=$( window ).width();
  if (ww<768)
  {
		$(".pos-f-t").hide();
  }else{
		$(".pos-f-t").show();	
  }
});
/*
select * from TB_SMJS_MASTER;

select item_code from tb_smjs_detail a LEFT OUTER JOIN tb_smjs_dep01 b
   ON a.q_code = b.seq
where a.parent_seq=1 and a.step='STEP1'
order by to_number(b.ord)
;


select 
substr(xmlagg(xmlelement(a,',' || item_code) order by item_code).extract('//text()'), 2) item_code
from TB_SMJS_DETAIL 
where parent_seq=1 and step='STEP1';
group by STEP; 

select  gbn,
          substr(xmlagg(xmlelement(a,',' || val) order by val).extract('//text()'), 2) val
  from test
group by gbn  

9uhVxH4fihcexQ
select 
a.seq,a.usr_id,c.conts as item_name,b.item_code,b.CHASU,a.REG_DATE
from TB_SMJS_MASTER a 
LEFT OUTER JOIN TB_SMJS_DETAIL b ON a.seq = b.parent_seq 
LEFT OUTER JOIN TB_SMJS_DEP01 c ON c.seq = b.q_code 
where a.step='STEP1'  and  b.step='STEP1' order by a.usr_id ,c.ord ;


select 
		a.seq,a.usr_id,c.conts as item_name,b.item_code,b.CHASU,c.ord,c.seq as q_code,a.REG_DATE
		from TB_SMJS_MASTER a 
		LEFT OUTER JOIN TB_SMJS_DETAIL b ON a.seq = b.parent_seq 
		LEFT OUTER JOIN TB_SMJS_DEP01 c ON c.seq = b.q_code 
		where a.step='STEP1'  and  b.step='STEP1' 
		order by a.seq,a.usr_id ,to_number(c.ord) 


-- 상세보기
select 
d.year,d.chasu,d.etc1,d.etc2,d.etc3,c.type,a.SEQ,a.usr_id,a.reg_date,c.up_seq,b.item_code,c.sub_conts,d.ord as dept01ord,c.ord as dept02ord
from TB_SMJS_MASTER a 
LEFT OUTER JOIN TB_SMJS_DETAIL b
ON a.seq = b.parent_seq
LEFT OUTER JOIN  TB_SMJS_DEP02 c
   ON b.q_code = c.up_seq
LEFT OUTER JOIN  TB_SMJS_DEP01 d
   ON c.up_seq = d.seq   
where a.step='STEP1'   
order by TO_NUMBER(c.ord, '9G999D99')
   ;
   
SELECT a.seq ,
    a.usr_id ,
    d.conts,
    e.sub_conts,
    b.item_code ,
    f.sub_conts,
    c.s_seq ,
    CASE
      WHEN b.item_code=c.s_seq
      THEN 2
      ELSE 0
    END AS rslt ,
    a.REG_DATE
  FROM TB_SMJS_MASTER a
  LEFT OUTER JOIN TB_SMJS_DETAIL b ON a.seq = b.parent_seq
  LEFT OUTER JOIN TB_SMJS_CORR c ON b.q_code = c.m_seq
  LEFT OUTER JOIN TB_SMJS_DEP01 d ON d.seq    = b.q_code
  LEFT OUTER JOIN TB_SMJS_DEP02 e ON e.seq    = b.item_code
  LEFT OUTER JOIN TB_SMJS_DEP02 f ON f.seq    = c.s_seq
  WHERE a.step='STEP2'  and a.usr_id ='aomNqTln'
  order by to_number(d.ord)


SELECT a.seq ,
    a.usr_id ,
    d.conts,
    e.sub_conts,
    b.item_code ,
    f.sub_selected,
    c.s_seq ,
    CASE
      WHEN b.item_code=c.s_seq
      THEN 2
      ELSE 0
    END AS rslt ,
    a.REG_DATE
  FROM TB_SMJS_MASTER a
  LEFT OUTER JOIN TB_SMJS_DETAIL b ON a.seq = b.parent_seq
  LEFT OUTER JOIN TB_SMJS_CORR c ON b.q_code = c.m_seq
  LEFT OUTER JOIN TB_SMJS_DEP01 d ON d.seq    = b.q_code
  LEFT OUTER JOIN TB_SMJS_DEP02 e ON e.seq    = b.item_code
  LEFT OUTER JOIN TB_SMJS_DEP02 f ON f.seq    = c.s_seq
  WHERE a.step='STEP2'

SELECT a.seq ,
    a.usr_id ,
    d.conts,
    e.sub_conts,
    b.item_code ,
    f.sub_selected,
    c.s_seq ,
    CASE
      WHEN b.item_code=c.s_seq
      THEN 2
      ELSE 0
    END AS rslt ,
    a.REG_DATE
  FROM TB_SMJS_MASTER a
  LEFT OUTER JOIN TB_SMJS_DETAIL b ON a.seq = b.parent_seq
  LEFT OUTER JOIN TB_SMJS_CORR c ON b.q_code = c.m_seq
  LEFT OUTER JOIN TB_SMJS_DEP01 d ON d.seq    = b.q_code
  LEFT OUTER JOIN TB_SMJS_DEP02 e ON e.seq    = b.item_code
  LEFT OUTER JOIN TB_SMJS_DEP02 f ON f.seq    = c.s_seq
  WHERE a.step='STEP2'  and a.usr_id ='aomNqTln'
  order by to_number(d.ord);
  
SELECT 
		       A.YEAR
		      ,A.CHASU
		      ,A.CONTS
		      ,A.ETC1
		      ,B.SEQ
		      ,B.UP_SEQ
		      ,B.SUB_CONTS
		      ,B.TYPE,B.ETC1 as CHECKED
		 FROM TB_SMJS_DEP01 A
		     ,TB_SMJS_DEP02 B
		 WHERE A.SEQ = B.UP_SEQ
		 AND A.USE_YN = 'Y'
		 AND B.USE_YN = 'Y'
		 AND A.ETC1='STEP3'
		ORDER BY to_number(A.ORD) ,to_number(B.ORD);

SELECT SUM(rslt) as rslt ,seq,usr_id as usr from
  (SELECT a.seq ,
    a.usr_id ,
    b.item_code ,
    c.s_seq ,
    CASE
      WHEN b.item_code=c.s_seq
      THEN 2
      ELSE 0
    END AS rslt ,
    a.REG_DATE
  FROM TB_SMJS_MASTER a
  LEFT OUTER JOIN TB_SMJS_DETAIL b ON a.seq = b.parent_seq
  LEFT OUTER JOIN TB_SMJS_CORR c ON b.q_code = c.m_seq
  LEFT OUTER JOIN TB_SMJS_DEP01 d ON d.seq    = b.q_code
  LEFT OUTER JOIN TB_SMJS_DEP02 e ON e.up_seq    = d.seq
  
  WHERE a.step='STEP2'  and a.usr_id ='aomNqTln'
 
  ORDER BY a.usr_id,
    to_number(d.ord)
  ) e  group by  seq,usr_id;
  
  
  */