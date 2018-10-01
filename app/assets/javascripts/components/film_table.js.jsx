var FilmTable = createReactClass({

  renderFilmRows: function() {
    return(
      this.props.films.map(function(film) {
        return(
          <div className='row film-row' key={film.id}>
            <h3><strong>{film.title}</strong></h3>
            <div className='additional-info'>
              <div className='row'>
                <div className='col-md-6'>
                  <span>Genre:</span>
                  <ul>
                    <li>{film.genres}</li>
                  </ul>
                </div>
                <div className='col-md-6'>
                  <span>Production:</span>
                  <ul>
                    <li>{film.production}</li>
                  </ul>
                </div>
              </div>
              <div className='row'>
                <div className='col-md-6'>
                  <span>Director:</span>
                  
                </div>
              </div>
            </div>
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
