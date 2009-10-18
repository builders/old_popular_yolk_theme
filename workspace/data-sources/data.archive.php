<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcearchive extends Datasource{
		
		public $dsParamROOTELEMENT = 'archive';
		public $dsParamORDER = 'desc';
		public $dsParamGROUP = '3';
		public $dsParamLIMIT = '100';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'3' => '{$year}',
				'5' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'date'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Archive',
					 'author' => array(
							'name' => 'Rainer Borene',
							'website' => 'http://localhost/symphony',
							'email' => 'rainerborene@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2009-10-18T17:22:13+00:00');	
		}
		
		public function getSource(){
			return '1';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

