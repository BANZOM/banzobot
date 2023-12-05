<%
	if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp"); 
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Welcome to Banzo Bot</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">BANZO BOT</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<!-- <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Portfolio</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li> -->
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="#">
						Welcome <%= session.getAttribute("username") %> (<%= session.getAttribute("role") %>)
						</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/img/banzo-removebg-preview.png"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome To Banzo Bot</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">
				Text Summary - Coding - Assistance</p>
		</div>
	</header>
	<!-- Portfolio Section-->
	
	
	<!-- Chat Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">LET'S CHAT</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<form id="contactForm">
						<!-- Textarea for user input-->
    					<div class="form-floating mb-3">
							<textarea class="form-control" id="userInput" placeholder="Enter your Query..." style="height: auto;" required></textarea>
        					<label for="userInput">Enter Your Query</label>
    					</div>
						<!-- Submit Button-->
						<button class="btn btn-primary btn-xl" type="submit" onclick="submitForm()">Send</button>
					</form>
					<br>
					<!-- Display area for processed text -->
					<div id="processedText" class="form-floating mb-3"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About Banzo Bot</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="row">
				<div class="col-lg-4 ms-auto">
					<p class="lead">Banzo Bot is intelligent virtual assistant designed to simulate human conversation 
						through text interactions. This AI-powered entities leverage natural language processing and machine learning 
						algorithms to understand user queries, interpret context, and provide relevant responses.</p>
				</div>
				<div class="col-lg-4 me-auto">
					<p class="lead">Chatbots like this have revolutionized the way individuals and businesses engage and operate 
						in the digital realm. Their adaptability across platforms, including websites, messaging apps, 
						and voice interfaces, empowers users with quick access to information and services!</p>
				</div>
			</div>
			
		</div>
	</section>
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Aditya Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="https://www.facebook.com/profile.php?id=100009645782825"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="https://twitter.com/adityapanwarr"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="https://www.linkedin.com/in/adityapanwars/"><i
						class="fab fa-fw fa-linkedin-in"></i></a> 
						<a
						class="btn btn-outline-light btn-social mx-1" href="https://www.instagram.com/adityapanwarrr/"><i
						class="fab fa-fw fa-instagram"></i></a>
						<a
						class="btn btn-outline-light btn-social mx-1" href="https://github.com/BANZOM/"><i
						class="fab fa-fw fa-github"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Banzo Bot 2023</small>
		</div>
	</div>
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script>
		function submitForm() {
			event.preventDefault();
			var userInput = document.getElementById('userInput').value;
			if (userInput.trim() === '') {
            	alert('Please enter a message.');
           		return;
    	    }

			var xhr = new XMLHttpRequest();
			xhr.open('POST', 'http://localhost:5001/process_input', true);

			xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			
			xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    var processedDiv = document.getElementById('processedText');
                    processedDiv.innerHTML = response.processed_text;
                } else {
                    console.error('Error:', xhr.status);
                }
            }
        };
        xhr.send('userInput=' + encodeURIComponent(userInput));

		
    	}
	</script>
</body>
</html>
