import{r as n,u as o,R as e,F as i,B as a,L as u,a as d,A as g}from"./app-b326aaf3.js";const p=()=>{let s=o();const l=()=>s("/user/home"),r=t=>{console.log(`checked = ${t.target.checked}`)},c=t=>{console.log("Success:",t)},m=t=>{console.log("Failed:",t)};return e.createElement(e.Fragment,null,e.createElement(i,{name:"login",initialValues:{remember:!0},onFinish:c,onFinishFailed:m,autoComplete:"off"},e.createElement(a,{icon:e.createElement("img",{src:"/images/auth/email.png"}),placeholder:"Email Address",className:"base-input",name:"email",rules:[]}),e.createElement(a,{icon:e.createElement("img",{src:"/images/auth/password.png"}),placeholder:"Password",className:"base-input",name:"password",rules:[],type:"password"}),e.createElement("div",{className:"d-flex align-items-center justify-content-between mt-2"},e.createElement(a,{type:"checkbox",placeholder:"Remember Me",handlecheckbox:r}),e.createElement(u,{to:"/user/forgot-password",className:"text-brown"},"Forgot Password?")),e.createElement(d,{title:"Sign In",className:"mt-4 mx-auto",onClick:l}),e.createElement("p",{className:"text-center mt-5"},"Or use your account"),e.createElement("div",{className:"social-icon text-center mt-3"},e.createElement("img",{src:"/images/auth/social-icon.png",className:"img-fluid",style:{width:"100px",objectFit:"contain"}}))))},E=n.memo(p),h=()=>e.createElement(e.Fragment,null,e.createElement("div",{className:"container-fluid p-0"},e.createElement("div",{className:"row g-0 theme-gradient align-items-center"},e.createElement("div",{className:"col-md-6 bg-white"},e.createElement("div",{className:"register-form d-flex justify-content-center min-vh-100 flex-column p-70"},e.createElement("h2",{className:"font-30 text-center mb-4"},"Great to see you again!"),e.createElement(E,null))),e.createElement(g,{title:"Hello, Friend!",content:e.createElement("p",{className:"font-18 font-medium text-white my-4"},"Enter your personal details and start ",e.createElement("br",null)," ","journey with us"),url:"/user/signup",btnText:"Sign Up"})))),x=n.memo(h);export{x as default};