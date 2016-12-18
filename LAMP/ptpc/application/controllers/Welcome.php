<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
		$this->load->view('index-medical');
	}
	public function service()
	{
		$this->load->view('services');
	}
	public function about_us()
	{
		$this->load->view('about_us');
	}
	public function insurance()
	{
		$this->load->view('insurance');
	}
	public function team()
	{
		$this->load->view('page-team');
	}
	public function choose()
	{
		$this->load->view('page-about-me');
	}
	public function faq()
	{
		$this->load->view('faq');
	}
	public function appointment()
	{
		$this->load->view('page-contact-2');
	}


}
