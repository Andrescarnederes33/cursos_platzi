import React, { Fragment } from "react";

const Jsx = () => {
	const jsx = "JSX";
	const isTrue = false;
	return (
		<Fragment>
			<h1 className="h1_body">{jsx}</h1>
			<p>React maneja una sintaxís parecida a HTML</p>
			<img src="https://cutt.ly/lfiTk1d" alt="Terminal" width="250px" />
			{isTrue ? "Es verdadero" : "Es falso"}
		</Fragment>
	);
};

export default Jsx;
