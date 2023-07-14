import React, { memo } from "react";

const FlatButton = (props) => {
  const { title, className, onClick } = props;
  return (
    <button
      className={`btn-theme ${className == undefined ? "" : className}`}
      onClick={onClick}
    >
      {title}
    </button>
  );
};

export default memo(FlatButton);
