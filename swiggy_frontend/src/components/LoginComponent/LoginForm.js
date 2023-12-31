import React, { useState } from "react";
import ClearIcon from "@mui/icons-material/Clear";
import {
  Button,
  Divider,
  FormControl,
  Grid,
  IconButton,
  TextField,
  Typography,
} from "@mui/material";
import { Link } from "react-router-dom";
import Swiggy_Login_Icon from "../../assets/images/loginPage_img.avif";

function LoginForm({
  placeHolder,
  isClearIconVisible,
  handleCloseIconClick,
  handleSubmitLoginForm,
}) {
  const schemeColor = "#FC8019";
  const [phnNumber, setPhnNumber] = useState("");
  const handleChangeInputField = (e) => {
    setPhnNumber(e.target.value);
  };
  return (
    <div style={{ padding: "25px", width: "450px" }}>
      {isClearIconVisible && (
        <IconButton onClick={handleCloseIconClick} aria-placeholder="close">
          <ClearIcon />
        </IconButton>
      )}
      <Grid item xs={12} display={"flex"} justifyContent={"space-between"}>
        <Grid item xs={6}>
          <Typography variant="h4" fontWeight={500} textAlign={"left"}>
            Login
          </Typography>
          <Typography>
            or{" "}
            <span>
              <Link style={{ textDecoration: "none", color: schemeColor }}>
                create an account
              </Link>
            </span>
          </Typography>
        </Grid>
        <Grid item xs={6}>
          <img style={{ width: "100px" }} src={Swiggy_Login_Icon} />
        </Grid>
      </Grid>

      <div
        style={{
          backgroundColor: "#000",
          height: "3px",
          width: " 30px ",
        }}
      ></div>
      <FormControl fullWidth sx={{ marginTop: 6 }}>
        <TextField
          value={phnNumber}
          fullWidth
          type="number"
          sx={{ borderRadius: 0 }}
          onChange={handleChangeInputField}
          inputProps={{
            style: {
              padding: "25px 8px",
              borderRadius: 0,
              WebkitAppearance: "none",
              MozAppearance: "textfield",
            },
          }}
          placeholder={placeHolder}
        />
        <Button
          onClick={handleSubmitLoginForm}
          fullWidth
          variant="contained"
          sx={{
            marginTop: 3,
            borderRadius: 0,
            padding: "12px 0",
            backgroundColor: schemeColor,
          }}
        >
          Login
        </Button>
        <Typography
          textTransform={"capitalize"}
          color={"#999"}
          variant="caption"
          marginTop={1}
        >
          By clicking on Login, I accept the{" "}
          <Link style={{ textDecoration: "none", color: "#000" }}>
            Terms & Conditions & Privacy Policy
          </Link>
        </Typography>
      </FormControl>
    </div>
  );
}

export default LoginForm;
