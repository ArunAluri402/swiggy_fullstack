import { Grid, Paper, Typography, useTheme } from "@mui/material";
import React, { Fragment } from "react";
import SwiggyLogo from "../../assets/images/swiggy.svg";

function HeaderComponent() {
  const schemeColor = "#FC8019";
  const classes = useTheme((theme) => ({
    // Your styles go here
    paper: {},
  }));
  return (
    <Fragment>
      <Grid container>
        <Grid item xs={12}>
          <Grid item className={classes.paper}>
            <Grid item xs={5}>
              <img style={{ width: "70px" }} src={SwiggyLogo} />
              <Typography variant="h4" color={schemeColor} fontWeight={700}>
                SWIGGY
              </Typography>
            </Grid>
            <Grid item xs={6}></Grid>
          </Grid>
        </Grid>
      </Grid>
    </Fragment>
  );
}

export default HeaderComponent;
