<?php 
session_start();
 
require_once 'actions/dbconnect.php';

//select logged-in users detail
 $res=mysqli_query($conn, "SELECT * FROM users WHERE userid=".$_SESSION['user']);

 $userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

 ?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- custom css -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- custom google font -->
    <link href="https://fonts.googleapis.com/css?family=Berkshire+Swash|Noto+Sans" rel="stylesheet">
  </head>
    <title>Recipe 4 Me</title>
  </head>
  <body>
    
<!-- #####################    FIXED NAVBAR     ############################ -->
    <nav class="navbar navbar-custom navbar-expand-md fixed-top">
      <a class="navbar-brand" href="index.php" id="brand_text">Recipe 4 Me</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="home.php">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="filter.php">Search</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="recipe_create.php">New Recipe<span class="sr-only">(current)</span></a>
          </li>
        </ul>
        <ul class="navbar-nav navbar-right">
          <li class="nav-item"><span class="nav-link">Welcome - <?php echo $userRow['username']; ?></span></li>
          <li class="nav-item"><a class="nav-link" href="logout.php?logout">Sign Out</a></li>
        </ul>
      </div>
    </nav>

  
    


<main role="main" class="container">  <!-- MAIN CONTAINER  -->

  <!-- #####################    JUMBOTRON HEADER     ############################ -->
<div class='container-full-bg' style='background-image:url(img/header.jpg);'>
    <div class='container special'>
      <div class='jumbotron' id='jumbotron-bg-image'>
        <div class='container'>
          <div class='row'>
            <div class='col-s-12 col-md-12' id='bg_text'>
              <h1 class='display-3 text-center' id='brand_text'>Add Your Ingredients</h1>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div><hr class="style5 mt-4"></div>


<?php 

    // initialize errors variable
	$errors = "";

	// connect to database
	$db = mysqli_connect("localhost", "root", "", "recip_me");

	// insert a quote if submit button is clicked
	if (isset($_POST['submit'])) {
		if (empty($_POST['ingredient'])) {
			$errors = "You must fill in the ingredient";
		}else{
			

			$ingredient = $_POST['ingredient'];
			$amount = $_POST['amount'];
			$unit = $_POST['unit'];
			$sql = "INSERT INTO amount_ingredients(ingredient, amount, unit) VALUES ('$ingredient','$amount','$unit')";
			mysqli_query($db, $sql);

			header('Location: ' . $_SESSION['PHP_SELF']);;
		}
	}

	// delete task
if (isset($_GET['del_ingredient'])) {
	$id = $_GET['del_ingredient'];

	mysqli_query($db, "DELETE FROM amount_ingredients WHERE idAmount=".$id);
	header('location: recipe.php');
}



// $sql = "SELECT  amount_ingredients.amount, units.unit_EN, ingredient.ingredient FROM ingredient LEFT JOIN amount_ingredients ON amount_ingredients.fk_idIngredients = ingredient.idIngredient LEFT JOIN recipe ON amount_ingredients.fk_idRecipe = recipe.idRecipe LEFT JOIN units ON amount_ingredients.fk_idUnits = units.idUnits ";

?>

<div>
    <form method="post" action="recipe.php" class="input_form">
        <?php if (isset($errors)) { ?>
        <p>
            <?php echo $errors; ?>
        </p>
        <?php } ?>
        <input type="text" name="amount" class="ingredient_input" placeholder="amount">
        <input type="text" name="unit" class="unit_input" placeholder="units">
        <input type="text" name="ingredient" class="ingredient_input" placeholder="ingredients">
        <button type="submit" name="submit" id="add_btn" class="add_btn btn btn-success">Add ingredients</button>
    </form>
</div>
 
    <div class="container">
        <div class="row">
            <?php 
		// select all tasks if page is visited or refreshed
          $sql = "SELECT * FROM amount_ingredients";
		  $result = $conn->query($sql);
          while($row = $result->fetch_assoc()) {

      echo 
      "<div class='col-sm-3'>
        <table><th>".$row['amount']."</th><th> ".$row['unit']." </th>
          
            <th> ".$row['ingredient']."</th>
            <th><a href='recipe.php?del_ingredient=".$row['idAmount']."'>x</a></th>
        </div>
        ";




         } ?>
         </table>
    	</div>
	</div>

<!-- <?php
	if (isset($_POST['submit'])) {
		if (empty($_POST['instructions'])) {
			$errors = "You must fill in the instructions";
		}else{
			

			
			$instructions = $_POST['instructions'];
			$sql = "INSERT INTO recipe(instructions) VALUES ('$instructions')";
			mysqli_query($db, $sql);

			header('location: recipe.php');
		}
	}



?>
 -->

	<!-- <div class="container" id="instructions">


		 <form method="post" action="recipe.php" class="input_form" id="instructionform">
	        <?php if (isset($errors)) { ?>
	        <p>
	            <?php echo $errors; ?>
	        </p>
	        <?php } ?>
	        <input type="text" name="instructions" class="instruction_input" placeholder="Instructions">
	        
	        <button type="submit" name="instructions" id="add_btn" class="add_btn">Add Instructions</button>
	    </form>


	</div> -->
</body>

</html>

<?php ob_end_flush(); ?>