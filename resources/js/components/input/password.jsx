import React, { memo } from "react";
import { Form, Input } from "antd";
const PasswordField = (props) => {
    return (
        <React.Fragment>
            <Form.Item name={props.name} rules={props.rules}>
                <Input.Password
                    prefix={props.icon}
                    size="large"
                    placeholder={props.placeholder}
                    className={props.className}
                />
            </Form.Item>
        </React.Fragment>
    );
};

export default memo(PasswordField);
