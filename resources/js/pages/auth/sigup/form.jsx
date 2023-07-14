import React, { memo } from "react";
import { Form } from "antd";
import { useNavigate } from "react-router-dom";

import BaseInput from "../../../components/input";
import { FlatButton } from "../../../components/index";
const SignUpForm = () => {
    let navigate = useNavigate();
    const handleSubmit = () => {
        return navigate("/user/login");
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
                name="register"
                initialValues={{
                    remember: true,
                }}
                onFinish={onFinish}
                onFinishFailed={onFinishFailed}
                autoComplete="off"
            >
                <BaseInput
                    icon={<img src="/images/auth/name.png" />}
                    placeholder="First Name"
                    className="base-input"
                    name="firstname"
                    rules={[]}
                />
                <BaseInput
                    icon={<img src="/images/auth/name.png" />}
                    placeholder="Last Name"
                    className="base-input"
                    name="lastname"
                    rules={[]}
                />
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
                <BaseInput
                    icon={<img src="/images/auth/password.png" />}
                    placeholder="Confirm Password"
                    className="base-input"
                    name="confirmpassword"
                    rules={[]}
                    type="password"
                />
                <BaseInput
                    type="checkbox"
                    placeholder="I agree with Terms & Conditions"
                    handlecheckbox={handlecheckbox}
                />
                <FlatButton
                    title="Sign Up"
                    className="mt-4 mx-auto"
                    onClick={handleSubmit}
                />
                <p className="text-center mt-4">
                    Or use your email for registration
                </p>
                <div className="social-icon text-center mt-4">
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

export default memo(SignUpForm);
