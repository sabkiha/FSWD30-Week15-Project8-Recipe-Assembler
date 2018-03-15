<?php 
session_start();

require_once '../dbconnect.php';


if($_POST) {
    $recipeName = $_POST['rName'];
    $recipeMethod = $_POST['cMethod'];
    $cookingInstructions = $_POST['cInstructions'];
    $recipeOrigin = $_POST['rOrigin'];
    $recipeImage = $_POST['rImage'];


    $sql = "INSERT INTO recipe (name, cookingMethod, instructions, origin) VALUES ('$recipeName', '$recipeMethod', '$cookingInstructions', '$recipeOrigin')";
    if($conn->query($sql) === TRUE) {
        echo "<p>New Recipe Successfully Created</p>";
        echo "<a href='#'><button type='button' class='btn btn-info'>Add Ingredients List</button></a>";
        echo "<a href='#'><button type='button' class='btn btn-secondary'>Home</button></a>";
    } else {
        echo "Error " . $sql . ' ' . $conn->connect_error;
    }

    $conn->close();
}
?>
</body>
</html>