var datetimeRange = function(option){
    var _default = {
        startInput: '#start_time',
        endInput:'#end_time',
        startTime:'',
        endTime:''
    };
    var opt = option||{};
    for(var i in _default){
        opt[i] = opt[i] || _default[i];
    }
    var end_t_opt = {hour:23, minute:59, second:59}
    var $start = $(opt.startInput), $end = $(opt.endInput);
    $start.datetimepicker();
    $end.datetimepicker(end_t_opt);
    $('#start_time').datetimepicker('setDate', (new Date(opt.startTime)) );
    $('#end_time').datetimepicker('setDate', (new Date(opt.endTime)) );
    $start.on('change', function() {
        var _day = this.value,
            _time = new Date(_day).getTime();
        $(this).parent().find('input[type="hidden"]').val(_time);
        var limit = ( _time - new Date().getTime() )/(24*60*60*1000);
        limit = parseInt(limit);
        limit = limit>0?limit+1:limit;
        $("#end_time").datetimepicker('option','minDate',limit);
    });
    $end.on('change', function (ev) {
        var _day = this.value,
            _time = _day==''?'':new Date(_day).getTime();
        $(this).parent().find('input[type="hidden"]').val(_time);
        if(_time!=''){
            if(_time<$('#startTime').val()){
                $.gritter.add({
                    text: '结束时间必须晚于开始时间',
                    class_name: 'gritter-error gritter-center gritter-light',
                    time: '1000'
                });
                $end.val('')
            }
        }
    });
}