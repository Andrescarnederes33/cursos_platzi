import React, { Fragment } from "react";

import StateFull from "./components/StateFull";
import StateLess from "./components/StateLess";
import Presentational from "./components/Presentational";

function App() {
  return (
    <Fragment>
      <StateFull />
      <StateLess />
      <Presentational />
    </Fragment>
  );
}

export default App;
