var FilmTable = createReactClass({

  renderFilmRows: function() {
    return(
      this.props.films.map(function(film) {
        return(
          <div className='row film-row' key={film.id}>
            <div className='col-sm-3'>{film.title}</div>
            <div className='col-sm-3'>{film.short_description}</div>
          </div>
        )
      })
    );
  },

  render: function() {
    return (
      <div>
        {this.renderFilmRows()}
      </div>
    );
  }
});
