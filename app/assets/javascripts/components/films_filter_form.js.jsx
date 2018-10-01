var FilmsFilterForm = createReactClass({
  getInitialState: function() {
    return {
      genres: this.props.genres,
      pickedGenre: '',
    }
  },

  renderOption: function(opt) {
    return(<option value={opt} key={opt}>{opt}</option>);
  },

  handleGenre: function(event) {
    console.log(event.targer.value);
    this.setState({
      pickedGenre: event.target.value
    })
  },

  render: function() {
    return (
      <div>
        <h2>Filter results</h2>
        <form>
          <label>
            Genre:
            <select value={this.state.pickedGenre}>
              {this.state.genres.map(this.renderOption)}
            </select>
          </label>
        </form>
      </div>
    );
  }
});
