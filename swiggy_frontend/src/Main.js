import React, { Fragment } from "react";
import { Route, Routes } from "react-router-dom";
import LandingPage from "./pages/LandingPage/LandingPage";

function Main() {
  return (
    <Fragment>
      <Routes>
        <Route path="/" element={<LandingPage />} />
      </Routes>
    </Fragment>
  );
}

export default Main;
