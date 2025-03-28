<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <style>
        /* Reset and global styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        /* Center the login container */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to right, #6a11cb, #2575fc);
        }

        .login-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .input-group label {
            font-weight: bold;
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .input-group input:focus {
            border-color: #2575fc;
            outline: none;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            background: #2575fc;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            background: #1b5fc9;
        }

        .forgot-password {
            margin-top: 10px;
            font-size: 14px;
        }

        .forgot-password a {
            color: #2575fc;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        /* Responsive design */
        @media (max-width: 400px) {
            .login-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Student Login</h2>
        <form action="finalstudentlogin.jsp" method="POST">
            
            <div class="input-group">
                <label for="studid">Student ID:</label>
                <input type="text" id="studid" name="studid" placeholder="Enter your Student ID" required>
            </div>

            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your Password" required>
            </div>

            <button type="submit" class="login-btn">LOGIN</button>

            <div class="forgot-password">
                <a href="#">Forgot Password?</a>
            </div>

        </form>
    </div>

</body>
</html>
