import React, { memo } from "react";
import { Form, Input } from "antd";
const InputField = (props) => {
    return (
        <React.Fragment>
            <Form.Item name={props.name} rules={props.rules}>
                <Input
                    prefix={props.icon}
                    size="large"
                    placeholder={props.placeholder}
                    className={props.className}
                />
            </Form.Item>
        </React.Fragment>
    );
};

export default memo(InputField);
