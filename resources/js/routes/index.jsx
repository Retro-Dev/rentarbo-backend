import React, { memo, Suspense, lazy } from "react";
import { Routes, Route, BrowserRouter } from "react-router-dom";

import { Spinner } from "../components";
import Forgotpassword from "../pages/auth/forgotpassword";
import Emailverification from "../pages/auth/forgotpassword/emailverification";
const Home = lazy(() => import("../pages/common/home"));
const Signup = lazy(() => import("../pages/auth/sigup"));
const Login = lazy(() => import("../pages/auth/login"));

function Index() {
    const loading = (
        <div className="min-vw-100 min-vh-100 d-flex align-items-center justify-content-center">
            <Spinner size="large" />
        </div>
    );
    return (
        <React.Fragment>
            <BrowserRouter>
                <Suspense fallback={loading}>
                    <Routes>
                        <Route exact path="/" name="home" element={<Home />} />
                        <Route
                            exact
                            path="/user/signup"
                            name="signup"
                            element={<Signup />}
                        />
                        <Route
                            exact
                            path="/user/login"
                            name="login"
                            element={<Login />}
                        />
                        <Route
                            exact
                            path="/user/forgot-password"
                            name="forgotpassword"
                            element={<Forgotpassword />}
                        />
                        <Route
                            exact
                            path="/user/email-verification"
                            name="emailverification"
                            element={<Emailverification />}
                        />
                    </Routes>
                </Suspense>
            </BrowserRouter>
        </React.Fragment>
    );
}

export default memo(Index);
