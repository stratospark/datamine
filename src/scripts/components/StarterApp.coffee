`/** @jsx React.DOM */`

Masthead = require("./Masthead.coffee")

ReactTransitionGroup = React.addons.TransitionGroup
imageURL = "/images/BladeRunner.gif"

Button = ReactBootstrap.Button

StarterApp = React.createClass

  getInitialState: () ->
    # Initial data fetch
    socket = io.connect('http://localhost:8000')

    socket.emit 'todos::find', {}, (error, todos) =>
      console.log 'Server todos', todos
      @setState todos: todos

    socket.on 'todos created', (todo) =>
      @state.todos.push(todo)
      @setState todos: @state.todos

    # return placeholder data
    todo1 = {
      description: "Eat sandwich"
      id: 1
    }
    todo2 = {
      description: "Drink juice"
      id: 2
    }

    return {
      todos: [todo1, todo2]
    }

  render: () ->
    todos = []
    for todo in @state.todos
      todos.push(React.DOM.li {}, todo.description)
    `(
      <div className='main'>
        <Button bsStyle='primary' className='center-block'>click me</Button>
        <Masthead title="Datamine">
          This template brings together all the pieces you need to start building your first React app.
          Gulp is used for orchastrating the build process, and Webpack is used to combine the Javascripts together.
        </Masthead>
        <h2>Blocks</h2>
        <ul>
          {todos}
        </ul>
        <ReactTransitionGroup transitionName="fade">
          <div className="container">
            <img className="center-block" src={imageURL} />
          </div>
        </ReactTransitionGroup>
      </div>
    )`

module.exports = StarterApp
