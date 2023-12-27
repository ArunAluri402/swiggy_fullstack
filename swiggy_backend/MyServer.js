const express = require("express");
const app = express();
const port = 4194;
const mysql = require("mysql2");
app.use(express.json()); // Enable JSON body parsing

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

// You can use 'db' to perform database operations

app.post("/api/v1/registration", (req, res) => {
  const { userId, phoneNo, type, email } = req.body;

  console.log("req", req.body);

  const currentDate = new Date().toISOString().slice(0, 19).replace("T", " ");

  const query =
    "INSERT INTO swiggy_fullstack.user (user_id, phone_no, type, email, last_login) VALUES (?, ?, ?, ?, ?)";
  const values = [userId, phoneNo, type, email, currentDate];

  db.query(query, values, (err, results) => {
    if (err) {
      console.error("Error inserting user into the database:", err);
      res.status(500).json({ success: false, error: "Internal Server Error" });
    } else {
      console.log("User inserted into the database");
      res.status(200).json({
        success: true,
        message: "User successfully registered",
      });
    }
  });
});
