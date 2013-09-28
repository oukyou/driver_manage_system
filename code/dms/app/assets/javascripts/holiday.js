/*jslint sloppy: true , browser: true */
/*global, jQuery, $ */
/**
 * @fileOverview Car
 */
$(function () {
  $(".alert-warning").hide();

  function toDate(str) {
    var sd=str.split("-");
    return new Date(sd[0],sd[1],sd[2]);
  }

  var dateInHoliday = function(date) {
    var result = false,
        newDate = toDate($.fullCalendar.formatDate(date, "yyyy-MM-dd"));
    $(calendar.fullCalendar('clientEvents')).each(function(key, value) {
      var oldStart = toDate($.fullCalendar.formatDate(value.start, "yyyy-MM-dd"));
      var oldEnd = oldStart;
      if (value.end) {
        oldEnd = toDate($.fullCalendar.formatDate(value.end, "yyyy-MM-dd"));
      }
      if (newDate >= oldStart && newDate <= oldEnd ) {
        result = true;
        return false;
      }
    });
    return result;
  }

  var holidayInDate = function (start, end) {
    var result = false,
        newStart = toDate($.fullCalendar.formatDate(start, "yyyy-MM-dd")),
        newEnd = toDate($.fullCalendar.formatDate(end, "yyyy-MM-dd"));
    $(calendar.fullCalendar('clientEvents')).each(function(key, value) {
      var oldStart = toDate($.fullCalendar.formatDate(value.start, "yyyy-MM-dd"));
      var oldEnd = oldStart;
      if (value.end) {
        oldEnd = toDate($.fullCalendar.formatDate(value.end, "yyyy-MM-dd"));
      }
      if (newStart < oldStart && newEnd > oldEnd ) {
        result = true;
        return false;
      }
    });
    return result;
  }

  var calendar = $('#x_04 #calendar').fullCalendar({
    header: {
      left: '',
      center: 'title',
      right: 'prev,next today'
    },
    firstDay:1,
    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
    dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
    today: ["今天"],
    buttonText: {
      today: '今天'
    },
    titleFormat:"yyyy年M月",
    aspectRatio: 1.85,
    selectable: true,
    selectHelper: true,
    editable: false,
    events: '/dms/holidays.json',
    select: function(start, end, allDay) {
      var title = prompt('请输入节假日名称:');
      if (title) {
        if (dateInHoliday(start) || dateInHoliday(end) || holidayInDate(start, end)) {
          alert("该日期已经设置过节假日，请重新选择日期!");
        }
        else {
          $.ajax({
            url: "/dms/holidays",
            data:{"title": title, "start": start, "end": end},
            cache: false,
            method: "post",
            dataType: 'json',
            error: function(XMLHttpRequest, textStatus, errorThrown) {$(".alert-warning").show();},
            success: function (ajaxRes) {
              calendar.fullCalendar('renderEvent',{
                id: ajaxRes.id,
                title: ajaxRes.title,
                start: ajaxRes.start,
                end:ajaxRes.end
              }, false);
            }
          });
        }
      }
      calendar.fullCalendar('unselect');
    },
    eventClick: function(calEvent, jsEvent, view) {
      if (confirm("确定要删除该节假日信息吗？")) {
        $.ajax({
          url: "/dms/holidays/" + calEvent.id,
          cache: false,
          method: "delete",
          dataType: 'json',
          error: function(XMLHttpRequest, textStatus, errorThrown) {$(".alert-warning").show();},
          success: function (ajaxRes) {
            calendar.fullCalendar('removeEvents', calEvent.id);
          }
        });
      }
    }
  });
});