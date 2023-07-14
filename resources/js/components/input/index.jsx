import React, { memo } from "react";
import InputField from "./input";
import PasswordField from "./password";
import CheckBoxInput from "./checkbox";

const BaseInput = (props) => {
    let {
        type,
        name,
        placeholder,
        options,
        icon,
        handlechange,
        handlecheckbox,
        style,
        className,
        defaultValue,
        rules,
    } = props;

    if (type == "select") return <p>Select</p>;
    else if (type == "password")
        return (
            <PasswordField
                {...{ name, placeholder, defaultValue, icon, className, rules }}
            />
        );
    else if (type == "checkbox")
        return (
            <CheckBoxInput
                name={name}
                placeholder={placeholder}
                handlecheckbox={handlecheckbox}
            />
        );
    else
        return (
            <InputField
                {...{ name, placeholder, defaultValue, icon, className, rules }}
            />
        );
};

export default memo(BaseInput);
