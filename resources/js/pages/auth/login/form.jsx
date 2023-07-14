import React, { memo } from "react";
import { Form } from "antd";
import { Link, useNavigate } from "react-router-dom";

import BaseInput from "../../../components/input";
import { FlatButton } from "../../../components/index";
const LoginForm = () => {
    let navigate = useNavigate();
    const handleSubmit = () => {
        return navigate("/user/home");
    };
    const handlecheckbox = (e) => {
        console.log(`checked = ${e.target.checked}`);
    };
    const onFinish = (values) => {
        console.log("Success:", values);
    };
    const onFinishFailed = (errorInfo) => {
        console.log("Failed:", errorInfo);
    };
    return (
        <React.Fragment>
            <Form
                name="login"
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

                <BaseInput
                    icon={<img src="/images/auth/password.png" />}
                    placeholder="Password"
                    className="base-input"
                    name="password"
                    rules={[]}
                    type="password"
                />
                <div className="d-flex align-items-center justify-content-between mt-2">
                    <BaseInput
                        type="checkbox"
                        placeholder="Remember Me"
                        handlecheckbox={handlecheckbox}
                    />
                    <Link to="/user/forgot-password" className="text-brown">
                        Forgot Password?
                    </Link>
                </div>
                <FlatButton
                    title="Sign In"
                    className="mt-4 mx-auto"
                    onClick={handleSubmit}
                />
                <p className="text-center mt-5">Or use your account</p>
                <div className="social-icon text-center mt-3">
                    <img
                        src="/images/auth/social-icon.png"
                        className="img-fluid"
                        style={{ width: "100px", objectFit: "contain" }}
                    />
                </div>
            </Form>
        </React.Fragment>
    );
};

export default memo(LoginForm);
