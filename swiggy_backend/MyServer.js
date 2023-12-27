const express = require("express");
const app = express();
const port = 4194;
const mysql = require("mysql2");
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(port, () => {
  console.log(`Server is listening at http://localhost:${port}`);
});

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "1576",
  database: "swiggy_fullstack",
  port: 3306,
});

db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL:", err);
  } else {
    console.log("Connected to MySQL database");
  }
});

app.post("/api/v1/registration", (req, res) => {
  const { userId, phoneNo, type, email } = req.body;

  console.log("req", req.body);

  const currentDate = new Date().toISOString().slice(0, 19).replace("T", " ");

  const queryCheckDuplicates =
    "SELECT COUNT(*) as count FROM swiggy_fullstack.user WHERE phone_no = ? OR email = ?";
  const valuesCheckDuplicates = [phoneNo, email];

  db.query(
    queryCheckDuplicates,
    valuesCheckDuplicates,
    (err, duplicateResults) => {
      if (err) {
        console.error("Error checking for duplicates in the database:", err);
        res
          .status(500)
          .json({ success: false, error: "Internal Server Error" });
      } else {
        const duplicateCount = duplicateResults[0].count;

        if (duplicateCount > 0) {
          res.status(409).json({
            success: false,
            error: "User with the same phone number or email already exists",
          });
        } else {
          const query =
            "INSERT INTO swiggy_fullstack.user (user_id, phone_no, type, email, last_login) VALUES (?, ?, ?, ?, ?)";
          const values = [userId, phoneNo, type, email, currentDate];

          db.query(query, values, (err, results) => {
            if (err) {
              console.error("Error inserting user into the database:", err);
              res
                .status(500)
                .json({ success: false, error: "Internal Server Error" });
            } else {
              console.log("User inserted into the database");
              res.status(200).json({
                success: true,
                message: "User successfully registered",
              });
            }
          });
        }
      }
    }
  );
});

app.post("/api/v1/valLogin", (req, res) => {
  const { phoneNo, email } = req.body;

  const query =
    "SELECT * FROM swiggy_fullstack.user WHERE phone_no = ? and email=?";
  const values = [phoneNo, email];

  db.query(query, values, (err, results) => {
    if (err) {
      console.error("Error querying the database:", err);
      res.status(500).json({ success: false, error: "Internal Server Error" });
    } else {
      if (results.length > 0) {
        res.status(200).json({
          success: true,
          response_code: 200,
          response_message: "user exists in the database",
          response_dtls: results[0],
        });
      } else {
        res.status(404).json({
          success: false,
          response_code: 404,
          response_message: "user not found in the database",
        });
      }
    }
  });
});
