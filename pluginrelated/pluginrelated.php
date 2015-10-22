<?php
/*
* Plugin Name: Legaturi Tabele Si Entitati
* Plugin URI: https://github.com/spyre/emiral
* Description: Connecting to DB
* Author: Emiral
* Author URI: https://github.com/spyre/emiral
* License: GPL2
*/



function getMediciByTratament($idtratament){

	$dbname = 'wpdemo1_medici';

	$conn = new wpdb('root','', $dbname, 'localhost');

	$query = "select medici.nume_medic, tratamente.nume_tratament from medici inner join medici_tratamente on medici.id = medici_tratamente.id_medic inner join tratamente on tratamente.id = medici_tratamente.id_tratament where tratamente.id = ".$idtratament;

	$results = $conn->get_results($query, ARRAY_A);
	return $results;

}

function getMediciAsJSON($idtratament){

	$results = getMediciByTratament($idtratament);
	$medici = array();
	foreach($results as $medic_si_tratament){
		$medici[] = $medic_si_tratament['nume_medic'];
	}
	return json_encode($medici);

}

?>