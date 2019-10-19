/**
 * Project CH4
 * COMMOMS JAVASCRIPT
 */
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false
//datebox 날짜형식 YYYY-MM-DD로 설정
$.fn.datebox.defaults.formatter = function(date){
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
    return y+'-'+(m<10 ? "0"+m:m)+'-'+(d<10 ? "0"+d:d);
}  
//datebox parser설정
$.fn.datebox.defaults.parser = function(s){
    var t = Date.parse(s);
    if (!isNaN(t)){
    	return new Date(t);
    } else {
    	return new Date();
    }
}
//datebox 한글화
$.fn.datebox.defaults.currentText = '오늘'
$.fn.datebox.defaults.closeText = '닫기'
$.fn.calendar.defaults.weeks = ['일','월','화','수','목','금','토']
$.fn.calendar.defaults.months = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']

//부트스트랩 테이블 default 세팅
$.fn.bootstrapTable.defaults.locales = ["ko-KR"]
$.fn.bootstrapTable.defaults.singleSelect = true
$.fn.bootstrapTable.defaults.pagination = true
$.fn.bootstrapTable.defaults.pageList = [10,20,30,50]
$.fn.bootstrapTable.columnDefaults.halign = 'center'
$.fn.bootstrapTable.columnDefaults.valign = 'middle'
$.fn.bootstrapTable.columnDefaults.align = 'center'