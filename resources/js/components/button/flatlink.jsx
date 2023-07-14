import React, { memo } from "react";
import { Link } from "react-router-dom";

const FlatLink = (props) => {
    const { title, className, url } = props;
    return (
        <div className="d-inline-block">
            <Link
                to={url}
                className={`btn-theme ${
                    className == undefined ? "" : className
                }`}
            >
                {title}
            </Link>
        </div>
    );
};

export default memo(FlatLink);
