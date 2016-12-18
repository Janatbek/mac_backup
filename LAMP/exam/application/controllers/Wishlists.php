<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Wishlists extends CI_Controller {
	public function  __construct(){
		parent::__construct();
		if ($this->session->userdata('loggedin')!=true){
			session_destroy();
			redirect('/');
		}
	}
	public function index(){
		$this->load->model('user');
		
		$data['name'] = $this->session->userdata('name');
		$data['id'] = $this->session->userdata('id');
		$data['wishlists'] = $this->user->get_wishlist($data['id']);

		$this->load->view('dashboard', $data);
	}
	public function add()
	{
		// var_dump($this->session->userdata());
		$this->load->view('new_wishlist');
	}
	// public function create(){
	// 	$this->load->model('wishlist');
	// 	$post = $this->input->post();
	// 	$this->wishlist->add_wishlist(array('item' => $post['item'],'adder_id' => ,'price' => $post['price']));
	// 	redirect('/');
	// }
}

// defined('BASEPATH') OR exit('No direct script access allowed');
// class Products extends CI_Controller {
// 	public function __construct()
// 	{
// 		parent::__construct();
// 		$this->load->model('product');
// 	}
// 	public function index()
// 	{
// 		$dbResult=$this->product->get_all();
// 		$this->load->view('index', $product_list = array('store_items' => $dbResult));

// 	}
// 	public function add()
// 	{
// 		$this->load->view('new_product');
// 	}
// 	public function create(){
// 		$post = $this->input->post();
// 		$this->product->add_product(array('name' => $post['name'],'description' => $post['description'],'price' => $post['price']));
// 		redirect('/');
// 		}
// 	public function show($id)
// 	{
// 		$item_to_show = $this->product->show_item($id);
// 		$this->load->view('show', $show = array('itemsList' => $item_to_show));	}
// 	public function edit($id)
// 	{
// 		$item_to_edit = $this->product->edit_item($id);
// 		$this->load->view('edit', $item_to_edit = array('itemsList' => $item_to_edit));
// 	}
// 	public function update($id)
// 	{
// 		$post = $this->input->post();
// 		$this->product->update_item(array('id' => $id, 'name' => $post['name'],'description' => $post['description'],'price' => $post['price']));
// 		//var_dump($me); die("in update page");
// 	}
// 	public function destroy($id)
// 	{
// 		$this->product->remove_item($id);
// 		redirect('/');
// 	}