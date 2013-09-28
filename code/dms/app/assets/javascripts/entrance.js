/*jslint sloppy: true , browser: true */
/*global, jQuery, $ */
/**
 * @fileOverview Car
 */
$(function () {
  var calendar = $('#m_01 #calendar').fullCalendar({
    header: {
      left: '',
      center: 'title',
      right: 'prev,next today'
    },
    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
        dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
    dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
    today: ["今天"],
    buttonText: {
      today: '今天'
    },
    firstDay:1,
    titleFormat:"yyyy年M月",
    aspectRatio: 1.85,
    dayClick: function(date, allDay, jsEvent, view) {
          // window.location.href="Y-02.html";
          alert("编码中.....");
      },
    events: '/dms/holidays.json'
  });
});