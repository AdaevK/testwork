$(function(){

  function format(item) { return item }

  $('#skills').select2({
    tags: true,
    tokenSeparators: [","],
    minimumInputLength: 1,
    initSelection: function(element, callback){
      var data = [];
      $(element.val().split(', ')).each(function(index, el){
        data.push({
          id: el,
          text: el
        });
      });
      callback(data);
    },
    createSearchChoice: function(term, data) {
      if ($(data).filter(function() {
        return this.text.localeCompare(term) === 0;
      }).length === 0) {
        return {
          id: term,
          text: term
        };
      }
    },
    ajax: {
      url: '/skills/list.json',
      dataType: 'JSON',
      data: function(term, page){
        return { q: term }
      },
      results: function( data, page ){
        return { results: data }
      }
    }
  });

  $('.datepicker').datepicker({
    format: 'dd.mm.yyyy',
    weekStart: 1,
    autoclose: true,
    language: 'ru',
    todayHighlight: true
  });
});
/*

    multiple: true,
    formatSelection: format,
    formatResult: format,
    createSearchChoice: function(term, data) {
      if ($(data).filter(function() {
        return this.name.localeCompare(term) === 0;
      }).length === 0) {
        return {
          id: term,
          text: term
        };
      }
    },
    ajax: {
      url: '/skills/list.json',
      dataType: 'JSON',
      data: function(term, page){
        return { q: term }
      },
      results: function( data, page ){
        return { results: data }
      }
    }
*/
