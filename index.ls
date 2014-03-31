require! <[dom dimensions css-emitter]>
{find} = require \prelude-ls

const min-opacity = 0.0001
const max-opacity = 1

wait = (ms, fn) --> set-timeout fn, ms
wait-ten = wait 10
px = -> "#{it}px"

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
      wrapper.add-class 'transition'
        .css 'height', px content-height
        .css 'opacity', max-opacity
  else
    wait-ten ->
      wrapper.css 'height', px wrapper-height .css 'opacity', max-opacity
      wait-ten ->
        wrapper.add-class 'transition'
          .css 'height', px 0
          .css 'opacity', min-opacity

  css-emitter wrapper.0 .once ->
    wrapper.remove-class 'transition'
      .css 'height', if open then 'auto' else px 0
      .css 'opacity', if open then max-opacity else min-opacity

    callback? open
