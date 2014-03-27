
# slide

  Slide up and down with CSS transitions

  Inspired by [this post](http://paintincode.blogspot.co.uk/2012/04/css3-transition-slideup-box-take-2.html)

## Example usage:
  (see index.html)

  ``` javascript
  var slide = require('slide');
  var dom = require('dom');
  // var open = false;
  dom('article').on('click', function() {
    slide('.content'/*, open ^= true*/, function(open) {
      dom('.done span').text(open);
    });
  });
  ```
## Installation

  Install with [component(1)](http://component.io):

    $ component install redbadger/slide
## API
  ```slide(selector, [open], callback);```

  where:
  -  *selector* is a css selector - first matching will be used
  - *open* is optional (true to open, false to close)
  - *callback* is called when transition is complete

## License

  MIT
