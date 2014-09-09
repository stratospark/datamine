var feathers = require('feathers'),
    bodyParser = require('body-parser');

var todoService = require('./server/services/todos');

feathers()
    .configure(feathers.rest())
    .configure(feathers.socketio())
    .use(bodyParser())
    .use('/todos', todoService)
    .listen(8000);