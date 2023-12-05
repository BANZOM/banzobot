<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<title>Signup | Banzo Bot</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<style>
    /* Style for the select input */
    select {
            width: 100%;
		    display: block;
		    border: none;
		    border-bottom: 1px solid #999;
		    padding: 6px 30px;
		    font-family: Poppins;
		    box-sizing: border-box;
		    color: #999;
		    background-color: white;
    }
	/* when any option is selected then keep the text of same color in input tag */
	select option:checked {
		color: black;
	}
    
</style>
	
</head>
<body>

	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username" placeholder="Your Username" required/>
							</div>
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" required/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" required/>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="pass" placeholder="Password" required/>
							</div>
									<!-- 		<div class="form-group">
												<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
												<input type="password" name="re_pass" id="re_pass"
													placeholder="Repeat your password" />
											</div> -->
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="number" name="contact" id="contact"
									placeholder="Contact no" required/>
							</div>
							<!-- Roles -->
							<div class="form-group">
						        <label for="role"><i class="zmdi zmdi-accounts-list"></i></label>
						        <select name="role" id="role" required>
						            <option value="" disabled selected>Select your category</option>
						            <option value="student">Student</option>
						            <option value="teacher">Teacher</option>
						            <option value="professional">Professional</option>
						            <!-- Add more options as needed -->
						        </select>
    						</div>	
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

    <script type="text/javascript">
        var status = document.getElementById("status").value;
        var message = '';
        
        switch (status) {
            case 'success':
                message = "Congratulations! Account created successfully. You can login now.";
                swal("Success", message, "success");
                break;
            case 'emptyFields':
                message = "Please fill all the fields.";
                swal("Oops!", message, "error");
                break;
            case 'invalidEmail':
                message = "Please enter a valid email.";
                swal("Oops!", message, "error");
                break;
            case 'invalidPhone':
                message = "Please enter a valid phone number.";
                swal("Oops!", message, "error");
                break;
            case 'invalidPassword':
                message = "Password should contain at least 8 characters, 1 uppercase, 1 lowercase, 1 number, and 1 special character.";
                swal("Oops!", message, "error");
                break;
            case 'exception':
                message = "Use a different username.";
                swal("Oops!", message, "warning");
                break;
            case 'error':
                message = "Something went wrong.";
                swal("Oops!", message, "error");
                break;
            default:
                break;
        }
    </script>


	<script>
		// if selected role is not "" then keep the text of color black
		document.getElementById("role").addEventListener("change", function() {
			if (document.getElementById("role").value !== "") {
				document.getElementById("role").style.color = "black";
			}
		})
	</script>

</body>

</html>