import React, { Component, Fragment } from "react";

class Statefull extends Component {
	constructor(props) {
		super(props);

		this.state = {
			loading: true,
			data: "Statefull",
			error: null,
		};
	}

	componentDidMount() {
		console.log("Adentro");
	}

	render() {
		let { data } = this.state;

		return(
			<Fragment>
				<h1>{data}</h1>
				<p>Ciclos de vida y estados (Avanzado)</p>
			</Fragment>
		);
	}
}

export default Statefull;
