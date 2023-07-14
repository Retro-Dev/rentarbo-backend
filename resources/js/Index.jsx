import React from "react";
import ReactDOM from "react-dom/client";
import Routes from "./routes";
import "bootstrap/dist/css/bootstrap.min.css";
import "./scss/app.scss";
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
    <React.StrictMode>
        <Routes />
    </React.StrictMode>
);
