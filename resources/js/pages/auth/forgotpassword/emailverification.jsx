import React, { memo } from "react";
import { Form } from "antd";
import { useNavigate } from "react-router-dom";

import AuthSidebar from "../../../components/auth/sidebar";
import BaseInput from "../../../components/input";
import { FlatButton } from "../../../components/index";
const EmailVerification = () => {
    let navigate = useNavigate();
    const handleSubmit = () => {
        return navigate("/user/login");
    };

    const onFinish = (values) => {
        console.log("Success:", values);
    };
    const onFinishFailed = (errorInfo) => {
        console.log("Failed:", errorInfo);
    };
    return (
        <React.Fragment>
            <div className="container-fluid p-0">
                <div className="row g-0 theme-gradient align-items-center">
                    <div className="col-md-6 bg-white">
                        <div className="register-form d-flex justify-content-center min-vh-100 flex-column p-70">
                            <h2 className="font-30 text-center mb-4">
                                Verification
                            </h2>
                            <Form
                                name="forgotpassword"
                                initialValues={{
                                    remember: true,
                                }}
                                onFinish={onFinish}
                                onFinishFailed={onFinishFailed}
                                autoComplete="off"
                            >
                                <BaseInput
                                    icon={<img src="/images/auth/email.png" />}
                                    placeholder="Email Address"
                                    className="base-input"
                                    name="email"
                                    rules={[]}
                                />
                                <p className="text-center">03:25</p>
                                <FlatButton
                                    title="Submit"
                                    className="mt-5 mx-auto"
                                    onClick={handleSubmit}
                                />
                            </Form>
                        </div>
                    </div>
                    <AuthSidebar
                        title="Verify your Email"
                        content={
                            <p className="font-18 font-medium text-white my-4">
                                Code will be sent to <br />{" "}
                                charlesgriffin35@email.com
                            </p>
                        }
                    />
                </div>
            </div>
        </React.Fragment>
    );
};

export default memo(EmailVerification);
