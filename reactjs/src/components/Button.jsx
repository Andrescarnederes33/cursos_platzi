import React, { Component, Fragment } from "react";

class Button extends Component {
	state = {
		count: 0,
	};

	handleClick = () => {
		this.setState({
			count: this.state.count + 1,
		})
	};

	render() {

		const { count } = this.state;

		return (
			<Fragment>
				{count}
				<button onClick={this.handleClick}>Click</button>
			</Fragment>
		);
	}
}

export default Button;
