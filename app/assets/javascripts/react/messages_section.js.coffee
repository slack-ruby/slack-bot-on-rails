# @cjsx React.DOM

@MessagesSection = React.createClass
  # Display name used for debugging
  displayName: 'MessagesSection'

  # Invoked before the component is mounted and provides the initial
  # state for the render method.
  getInitialState: ->
    # We'll change it to true once we fetch data
    didFetchData: false
    # The messages JSON array used to display the messages in the view
    messages: []

  # Invoked right after the component renders
  componentDidMount: ->
    # Lets fetch all the messages...
    @_fetchMessages()
    setInterval(@_fetchMessages, 1000);

  # AJAX call to our MessagesController
  _fetchMessages: ()->
    $.ajax
      url: Routes.messages_path()
    .done @_fetchDataDone
    .fail @_fetchDataFail

  # If the AJAX call is successful...
  _fetchDataDone: (data, textStatus, jqXHR) ->
    # We change the state of the component. This will cause the component and
    # it's children to render again
    @setState
      didFetchData: true
      messages: data

  # If errors in AJAX call...
  _fetchDataFail: (xhr, status, err) =>
    console.error @props.url, status, err.toString()

  # How the component is going to be rendered to the user depending on it's
  # props and state...
  render: ->
    # The collection of Message components we are going to display
    # using the messages stored in the component's state
    messagesNode = @state.messages.map (message) ->
      # Message component with a data property containing all the JSON
      # attributes we are going to use to display it to the user
      <Message key={message.id} data={message}/>

    # HTML displayed if no messages found in it's state
    noDataNode =
      <div className="warning">
        <h4>No messages found...</h4>
      </div>

    # Here starts the render result
    <div>
      <div className="messages-wrapper">
        {
          # If there are messages render the messages...
          if @state.messages.length > 0
            messagesNode
          # If has fetched data and no messages found, render the
          # warning message instead
          else if @state.didFetchData
            noDataNode
        }
      </div>
    </div>
