<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php foreach ($itemsList as $editing) { 
		?>
		<title>Create Item</title>
		<?php
	}
	?>
</head>
<body>
	<div>
		<h1>Create a new wish list item</h1>
		<a href="index">Home</a>
		<a href="/users/logout">Logout</a>
	</div>
	<?php foreach ($wishlists as $wishlist) { 
		?>
		<form action="/wishlists/create" method="post">

			<input type="hidden" name="added_at"/>
			<input type="hidden" >
			<?php echo form_hidden('adder_id', $id); ?>

			<label>Items/Product <input type="number" name="item">
			</label>

			<input type="submit" value="Add" >
		</form>

	</body>
	</html>
