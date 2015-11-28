# @cjsx React.DOM

@Message = React.createClass
  displayName: 'Message'
  render: ->
    # let's use this add-on to set the main div's class names
    cx = React.addons.classSet

    # here we use the calculated classes
    <div className="message">
      {@props.data.id}: {@props.data.message?.text}
    </div>
