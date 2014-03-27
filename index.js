dom = require('dom');
dimensions = require('dimensions');
css = require('css-emitter');

module.exports = function(/*selector, open, callback*/) {
  args = [].slice.call(arguments);
  callback = args.pop();
  content = dom(args[0]);

  var wrapper = content.parent();
  var contentHeight = dimensions(content[0]).outerHeight(true);
  var wrapperHeight = dimensions(wrapper[0]).height();

  open = !!(args.length == 2 ? args[1] : !wrapper.hasClass('open'));
  wrapper.toggleClass('open', open);
  if (wrapper.hasClass('open')) {
    setTimeout(function() {
      wrapper.addClass('transition').css('height', contentHeight);
    }, 10);
  }
  else {
    setTimeout(function() {
      wrapper.css('height', wrapperHeight);
      setTimeout(function() {
        wrapper.addClass('transition').css('height', '0px');
      }, 10);
    }, 10);
  }

  css(wrapper[0]).once(function() {
    if(wrapper.hasClass('open')) {
      wrapper.removeClass('transition').css('height', 'auto');
    }
    typeof callback === 'function' && callback(open);
  });
};
