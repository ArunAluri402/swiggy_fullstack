import React from "react";
import HeaderComponent from "../../components/HeaderComponent/HeaderComponent";
import LoginForm from "../../components/LoginComponent/LoginForm";

function LandingPage() {
  const handleCloseIconClick = () => {};
  const handleSubmitLoginForm = () => {};
  return (
    <div>
      <LoginForm
        placeHolder={"Phone Number"}
        isClearIconVisible={true}
        handleCloseIconClick={handleCloseIconClick}
        handleSubmitLoginForm={handleSubmitLoginForm}
      />
    </div>
  );
}

export default LandingPage;
