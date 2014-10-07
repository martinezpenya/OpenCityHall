(function() {
  'use strict';
  var initSelect2;

  initSelect2 = function(inputs, extra) {
    if (extra == null) {
      extra = {};
    }
    return inputs.each(function() {
      var item, options;
      item = $(this);
      options = $.extend({
        allowClear: true
      }, extra, item.data('select2'));
      item.data('select2', null);
      return item.select2(options);
    });
  };

  $(document).on('has_many_add:after', '.has_many_container', function(e, fieldset) {
    return initSelect2(fieldset.find('.select2-input'));
  });

  $(document).ready(function() {
    initSelect2($(".select2-input"), {
      placeholder: ""
    });
  });

}).call(this);
