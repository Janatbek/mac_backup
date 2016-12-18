
<header>
<h1>welcome <?= $name ?></h1>
	<h4>Posts by <?= $quotes_to_show[0]['name'] ?></h4>
	<h4>Posts by <?= $count ?></h4>

	<a href="/quotes">Dashboard</a>	
	<a href="/users/logout">Logout</a>	
</header>
<main>
	<?php 
	foreach ($quotes_to_show as $quote) {

		?>
		
		<div>
			<p><?= $quote['quoted_by']  ?></p>
			<p> <?= $quote['message']  ?></p>
		</div>
		<?php
	} 
	?>
	
</main>
