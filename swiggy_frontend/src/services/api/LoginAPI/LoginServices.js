import { default as axios } from "axios";

const baseUrl = process.env.REACT_APP_BASE_BACKEND_URL;

const axiosInstance = axios.create({
  headers: {
    "Content-Type": "application/json",
  },
});

