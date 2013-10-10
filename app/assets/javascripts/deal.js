$(document).ready{
  $('#day_time_form_submit').click(update_day_time_form_action())
  function prep_day_time_form(){
    var time = 
    if($('day_selector.').value === && time === )
      var new_url = '/';
    else
      var new_url = 'deals_at_time/' + $('#day_selector').value + '/' + time;

    $('#day_time_form').attr('action', )
  }
  function time_str_to_i(time_string){
    time_string, period = time_string.split(' ');
    time_array = time_string.split(':');
    time_array[0] = '0' if time_array[0] === '12';
    time = (+time_array[0] * 60) + +time_array[1];
    if(period === "PM")
      time += 720;
    if(period === "AM" && time_string === "12:00")
    time = 1440;
    return(time)
  }
}