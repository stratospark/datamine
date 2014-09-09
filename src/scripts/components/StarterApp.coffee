`/** @jsx React.DOM */`

Masthead = require("./Masthead.coffee")
MyNavbar = require("./MyNavbar.coffee")

# ReactTransitionGroup = React.addons.TransitionGroup
# imageURL = "/images/BladeRunner.gif"

# Import only the components that we are using
{Button, Grid, Row, Col} = ReactBootstrap

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

  onClick: (event) ->
    console.log event
    @setState todos: []

  render: () ->
    todos = []
    for todo in @state.todos
      todos.push(React.DOM.li {}, todo.description)
    `(

      <div className='main'>
        <MyNavbar name="Datamine"/>
        <Masthead title="Datamine">
          This template brings together all the pieces you need to start building your first React app.
          Gulp is used for orchastrating the build process, and Webpack is used to combine the Javascripts together.
        </Masthead>
        <Button bsStyle='primary' className='center-block' onClick={this.onClick}>Clear</Button>

        <Grid>
          <Row className="show-grid">
            <Col xs={4} md={12}><p>&lt;{'Col xs={12} md={8}'} /&gt;</p></Col>
            <Col xs={4} md={12}><code>&lt;{'Col xs={6} md={4}'} /&gt;</code></Col>
            <Col xs={4} md={12}><code>&lt;{'Col xs={6} md={4}'} /&gt;</code></Col>
          </Row>
        </Grid>


        <h2>Blocks</h2>
        <ul>
          {todos}
        </ul>

      </div>
    )`

module.exports = StarterApp
