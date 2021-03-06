SideTable.Models.Shelf = Backbone.Model.extend({
  urlRoot: SideTable.baseUrl+"/api/shelves",

  initialize: function(options) {
    this.collection = options.collection;
  },

  games: function() {
    if (!this._games){
      this._games = new SideTable.Collections.Games([], { shelf: this });
    }
    return this._games;
  },

  parse: function(response) {
    if (response.games) {
      this.games().set(response.games);
      delete response.games;
    }
    return response;
  },

});
