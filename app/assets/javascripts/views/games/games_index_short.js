SideTable.Views.GamesIndexShort = SideTable.Views.GameSearchView.extend({

  template: JST['games/index_short'],

  initialize: function(options) {
    this.itemView = SideTable.Views.GameItemShort;
    this.selector = ".game-index-short";
    
    SideTable.Views.GameSearchView.prototype.initialize.apply(this,arguments);
  },
});
