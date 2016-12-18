<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>My Wish List</title>
	<style type="text/css">
	h1{width:700px; display: inline-block;}
	.right{float: right;}
	a{text-decoration: none; margin-top: 20px;}
	table {
		width: 800px;
		margin: 20px 50px 0 50px;
    	border-collapse: collapse;
    	border:1px solid black;
	}
	table, th, td {
    	border-right: 1px solid black;
    	height: 30px;
    	padding-left: 5px;
    	margin-bottom: 20px;
	}
	th {background: #CCC}
	tr:nth-child(even) {background: #EAEAEA}
	tr:nth-child(odd) {background: #FFF}
	</style>
</head>
<body>
	<header>
		<h1>Hello <?= $name?>!</h1>
		 <a class="right" href="/users/logout">Logout</a>
	</header>
	<main>
		<h4>Your Wish List:</h4>
		<table>
				<tr>
					<th>Item</th>
					<th>Added by</th>
					<th>Date added</th>
					<th>Action</th>
				</tr>
				<?php
				foreach ($wishlists as $wish) {
				?>
				<tr class="for_border">
					<td><a href="/wishlists/show"><?=$wish['item'] ?></a></td>
					<td><?=$wish['adder'] ?></td>
					<td><?=$wish['date_added'] ?></td>
					<td><a href='#'>Remove from wishlist</a> </td>
				</tr>
				<?php
				}
				?>
			</table>
			<hr>
		<h4>Other users wish list:</h4>
		<table>
				<tr>
					<th>Item</th>
					<th>Added by</th>
					<th>Date added</th>
					<th>Action</th>

				</tr>
				<tr class="for_border">
					<td>Marat</td>
					<td>Turkey</td>
					<td>May 26 2016</td>
					
					<td><a href="">Join</a></td>
				</tr>
				<tr class="for_border">
					<td>Erik</td>
					<td>Moscow</td>
					<td>April 23 2016</td>
					
					<td><a href="">Join</a></td>
				</tr>
		</table>
	</main>
	<footer>
		<a href="/wishlists/add" class="right">Add Item</a>
	</footer>
	 	

</body>
</html>

