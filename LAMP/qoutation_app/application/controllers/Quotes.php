<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Quotes extends CI_Controller {

	public function  __construct(){
		parent::__construct();
		$this->output->enable_profiler();
		$this->load->model('user');
		$this->load->model('quote');
		$this->viewdata = array();
		$this->viewdata['name'] = $this->session->userdata('name');
		$this->viewdata['id'] = $this->session->userdata('id');
		if ($this->session->userdata('loggedin')!=true){
			session_destroy();
			redirect('/');
		}
	}
	public function index(){
		$data = $this->viewdata;
		$data['all_quotes'] = $this->quote->get_all($this->session->userdata('id')); 
		$data['favorite_quotes'] = $this->quote->get_favorites($this->session->userdata('id'));
		$this->load->view('quotes_view', $data);
	}
	public function show($id){
		$data = $this->viewdata;
		$data['quotes_to_show'] = $this->quote->show_item($id);
		$data['count'] = count($data['quotes_to_show']);
		$this->load->view('show_users_quotes', $data);
	}
	public function add_quotes(){
		$post = $this->input->post();
		$this->quote->add_quotes(array('quoted_by' => $post['quoted_by'],'message' => $post['message'],'user_id' => $post['user_id']));
		redirect('quotes');
	}
	public function add_to_list($id){
	 	$this->quote->add_to_list(array('quote_id' => $id, 'user_id' => $this->session->userdata('id')));

	 	redirect('/quotes/index');
	 }
	 public function remove_from_quotes($id){
	 	$this->quote->remove_from_main_list(array('quotes.id' => $id));
	 }

	 public function remove_from_fave_list($id){
	 	$this->quote->remove_from_fave_list(array('quote_id' => $id, 'user_id' => $this->session->userdata('id')));
	 	redirect('/quotes/index');
	 }
	 
}
