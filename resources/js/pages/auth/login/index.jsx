import React, { memo } from "react";

import AuthSidebar from "../../../components/auth/sidebar";
import LoginForm from "./form";

const Login = () => {
    return (
        <React.Fragment>
            <div className="container-fluid p-0">
                <div className="row g-0 theme-gradient align-items-center">
                    <div className="col-md-6 bg-white">
                        <div className="register-form d-flex justify-content-center min-vh-100 flex-column p-70">
                            <h2 className="font-30 text-center mb-4">
                                Great to see you again!
                            </h2>
                            <LoginForm />
                        </div>
                    </div>
                    <AuthSidebar
                        title="Hello, Friend!"
                        content={
                            <p className="font-18 font-medium text-white my-4">
                                Enter your personal details and start <br />{" "}
                                journey with us
                            </p>
                        }
                        url="/user/signup"
                        btnText="Sign Up"
                    />
                </div>
            </div>
        </React.Fragment>
    );
};

export default memo(Login);
