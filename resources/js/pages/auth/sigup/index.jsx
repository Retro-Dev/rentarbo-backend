import React, { memo } from "react";

import AuthSidebar from "../../../components/auth/sidebar";
import SignUpForm from "./form";

const Signup = () => {
    return (
        <React.Fragment>
            <div className="container-fluid p-0">
                <div className="row g-0 theme-gradient align-items-center">
                    <AuthSidebar
                        title="Welcome Back!"
                        content={
                            <p className="font-18 font-medium text-white my-4">
                                To keep connected with us please login <br />{" "}
                                with your personal info
                            </p>
                        }
                        url="/user/login"
                        btnText="Sign In"
                    />
                    <div className="col-md-6 bg-white">
                        <div className="register-form p-70">
                            <h2 className="font-30 text-center mb-4">
                                Create Account
                            </h2>
                            <SignUpForm />
                        </div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
};

export default memo(Signup);
