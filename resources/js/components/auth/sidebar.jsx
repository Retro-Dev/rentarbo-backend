import React, { memo } from "react";
import FlatLink from "../button/flatlink";
const Index = (props) => {
    let { title, content, url, btnText } = props;
    return (
        <React.Fragment>
            <div className="col-md-6 d-none d-md-block  text-center">
                <div className="overlay">
                    <h2 className="font-40 text-white">{title}</h2>
                    {content}
                    {btnText == undefined ? (
                        ""
                    ) : (
                        <FlatLink
                            url={url}
                            title={btnText}
                            className="btn-transparent"
                        />
                    )}
                </div>
            </div>
        </React.Fragment>
    );
};

export default memo(Index);
