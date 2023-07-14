import React, { memo } from "react";
import { Spin } from "antd";
const Spinner = ({ size }) => {
    return (
        <React.Fragment>
            <Spin size={size} />
        </React.Fragment>
    );
};

export default memo(Spinner);
