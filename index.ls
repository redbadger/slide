require! <[dom dimensions css-emitter]>
{find} = require \prelude-ls

wait = (ms, fn) --> set-timeout fn, ms
wait-ten = wait 10

module.exports = (selector, ...params) ->
  callback = params |> find (-> typeof! it is \Function)
  open = params |> find (-> typeof! it isnt \Function)

  content = dom selector
  wrapper = content.parent!
  content-height = dimensions content.0 .outer-height true
  wrapper-height = dimensions wrapper.0 .height!

  open = if open? then !!open else not wrapper.has-class 'open'

  wrapper.toggle-class 'open', open
  if open
    wait-ten ->
      wrapper.add-class 'transition' .css 'height', content-height
  else
    wait-ten ->
      wrapper.css 'height', wrapper-height
      wait-ten ->
        wrapper.add-class 'transition' .css 'height', '0px'

  css-emitter wrapper.0 .once ->
    if open
      wrapper.removeClass 'transition' .css 'height', 'auto'
    callback? open
