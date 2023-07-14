import React, { memo } from "react";
import { Checkbox } from "antd";
const CheckBoxInput = (props) => {
    return (
        <React.Fragment>
            <Checkbox name={props.name} onChange={props.handlecheckbox}>
                {props.placeholder}
            </Checkbox>
        </React.Fragment>
    );
};

export default memo(CheckBoxInput);
