/**
 * 
 */

function bid_list(){
	var pno = $("#pno").text();
	$.ajax({
		"type" : "post",
		"url" : "/kmk/auction/bidList/" + pno,
		"success" : function(rData) {
			$("#bid_tr").html("");
			if (rData != null) {
				$.each(rData, function(index) {
					var tr = $("table.bidding-table tr:eq(0)").clone(); 
					tr.addClass("cl_tr");
					var th = tr.find("th");
					var len = this.m_id.length;
					
					var m_id = this.m_id.substring(0, len-2) + "**";
					
					th.eq(0).text(m_id).contents().unwrap().wrap('<td></td>');
					th.eq(1).text(this.b_price).contents().unwrap().wrap('<td></td>');
					th.eq(2).text(this.b_date).contents().unwrap().wrap('<td></td>');
// 						th.eq(4).text(this.b_note).wrap('<td></td>');  
					console.log("cl_tr");
					$("#bid_tr").append(tr);
				}); 
			}
		},
		"error" : function(request,status,error) {
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }  
	});
}