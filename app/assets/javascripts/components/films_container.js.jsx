var FilmsContainer = createReactClass({
  getInitialState: function() {
    return {
      films: this.props.films,
    }
  },

  render: function() {
    return (
      <div>
        <h1>Films</h1>
        <FilmTable films={this.state.films} />
      </div>
    );
  }
});
