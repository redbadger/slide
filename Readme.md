
# slide

  Slide up and down with CSS transitions

  Inspired by [this post](http://paintincode.blogspot.co.uk/2012/04/css3-transition-slideup-box-take-2.html)

## Features
- not dependent on jQuery
- simple to use (create a container element with an inner element to slide)
- you can specify whether you want to open or close the slide (or just let it toggle)
- if you modify content in an open slide and then open it again, it'll grow/shrink to the new size
- also fades opacity in and out

## Example usage:
  (for demo open index.html)

``` html
<article>
  <h2>Click me to expand/collapse</h2>
  <div class="wrapper">
    <div class="content">
      Lorem ipsum dolor sit amet...
    </div>
  </div>
</article>
```

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
  ```slide(selector, [open], [callback]);```

  where:
  -  *selector* is a css selector (for the content to slide, not the container)- first matching will be used
  - *open* is optional (true to open, false to close)
  - optional *callback* is called when transition is complete


## Contributing
- written in [LiveScript](http://livescript.net) (don't modify index.js directly)
- build component with ```make``` (also compiles index.ls to index.js)
- please raise issues or submit pull requests

## License

  MIT
