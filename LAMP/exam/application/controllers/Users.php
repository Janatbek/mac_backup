<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends CI_Controller {

	public function index(){
		$this->load->view('loginAndReg');
	}
	public function register(){
		$this->load->model('user');
		$this->load->library('form_validation');

		$this->form_validation->set_rules('name', 'Name', 'required|trim');
		$this->form_validation->set_rules('username', 'Username', 'required|trim');
		$this->form_validation->set_rules('password', 'Password', 'required|trim|min_length[8]');
		$this->form_validation->set_rules('confirm_password', 'Password Confirmation', 'required|trim|matches[password]');
		$this->form_validation->set_rules('doh', 'Date hired','required|trim');

		if ($this->form_validation->run() == FALSE){
			$this->load->view('loginAndReg');
		}else{
			$id = $this->user->register(array(
				'username' => $this->input->post('username'),
				'name' => $this->input->post('name'),
				'password' => $this->input->post('password'),
				'doh' => $this->input->post('doh'),
				));

			$this->session->set_userdata('id', $id);
			$this->session->set_userdata('loggedin', true);
			$this->session->set_userdata('name', $this->input->post('name'));
			redirect('/wishlists');
		}

	}
	public function login(){
		$this->load->model('user');
		$userData = $this->user->login($this->input->post());
		if (empty($userData)) {
			redirect('/');
			die('login');
		}
		$this->session->set_userdata($userdata);
		$this->session->set_userdata('loggedin', true);
	}
	
	public function logout(){
		$this->session->sess_destroy();
		redirect('/');
	}

}
