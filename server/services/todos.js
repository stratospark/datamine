var todoService = {
    todos: [],

    // Return all todos from this service
    find: function(params, callback) {
        callback(null, this.todos);
    },

    // Create a new Todo with the given data
    create: function(data, params, callback) {
        data.id = this.todos.length;
        this.todos.push(data);

        callback(null, data);
    }
};

module.exports = todoService