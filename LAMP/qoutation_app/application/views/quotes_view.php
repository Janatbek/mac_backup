
<style>
	#all_quotes, #favorite_quotes{
		display: inline-block; width: 400px; vertical-align: top; border: 1px solid black; overflow-y: hidden;
		padding: 10px;
	}
	.inner_div{
		border: 1px solid black;padding: 15px;
	}
</style>
<header>
	<h1>Welcome, <?php echo $name ?>!</h1>
	<a href="/users/logout">Logout</a>
</header>
<main>
	<div id="all_quotes">
	<h2>Quotable Quotes</h2>
	<?php foreach ($all_quotes as $quotes) {
			
			?>		
			<div class="inner_div">
				<p><?=$quotes['quoted_by']?>: <?=$quotes['message']?> </p>
				<em>Posted by:<a href="/users/<?= $quotes['user_id']?>"><?=$quotes['name']?><a href="/quotes/add_to_list/<?=$quotes['id']?>"><button>Add to My List</button></a>
			</div>
			<?php
		} 
		?>

	</div>

	<div id="favorite_quotes">
	<h2>My Favorite Quotes</h2>
		<?php foreach ($favorite_quotes as $quotes) {
			
			?>		
			<div class="inner_div">
				<p><?=$quotes['quoted_by']?>: <?=$quotes['message']?> </p>
				<em>Posted by:<a href="/users/<?= $quotes['user_id'] ?>"><?=$quotes['name']?>
				<a href="/quotes/remove_from_fave_list/<?=$quotes['id']?>"> <button>Remove from My List</button></a>
			</div>
			<?php
		} 
		?>
		<form action="/quotes/add_quotes" method="POST">
			<h5>Contribute a Quote</h5>
			<p>
				<label for="quoted_by">Quoted By:</label>
				<input type="text" name="quoted_by" id="name">
			</p>
			<p>
				<label for="alias">Message:</label>
				<textarea name="message" cols="30" rows="10"></textarea>
			</p>
			<button type="submit" name="user_id" value="<?php echo $id ?>">Submit</button>
			
		</form>
	</div>
</main>