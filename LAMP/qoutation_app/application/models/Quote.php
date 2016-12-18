<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Quote extends CI_model {

	public function get_all($id){
		$query = "SELECT *
		FROM users 
		JOIN quotes ON quotes.user_id = users.id 
		WHERE NOT EXISTS 
		(SELECT * FROM favorites where favorites.quote_id = quotes.id && 
		favorites.user_id = ?)";
		return $this->db->query($query, $id)->result_array();
	}
	public function add_quotes($data){
		$this->db->insert('quotes', $data);
	}

	public function show_item($id){
		$query = "SELECT 
		users.name name, 
		quotes.message, 
		quotes.quoted_by quoted_by, 
		quotes.message message 
		FROM users LEFT JOIN quotes
		ON users.id = quotes.user_id
		WHERE users.id = ?";
		return $this->db->query($query, $id)->result_array();
	}
	public function add_to_list($data){
		$this->db->insert('favorites', $data);
	}
	public function get_favorites($id){
		$query = "SELECT * FROM users
		JOIN quotes ON users.id = quotes.user_id
		JOIN favorites on quotes.id = favorites.quote_id
		WHERE favorites.user_id = ?";
		return $this->db->query($query, $id)->result_array();
	}
	public function remove_from_fave_list($data){
		// $query = "DELETE FROM quotation_app.favorites 
		// WHERE quote_id =  && user_id = 3;
		$this->db->delete('quotation_app.favorites', $data);
	}
}