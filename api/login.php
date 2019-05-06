<?php
//
// Serveur web service RESTful
//
// Authentifie un client Android et renvoie une réponse JSON
// Exemple : http://http://localhost/BTS/PPE-G2/api/login.php?user=vinz@email.com&password=vinzvinz
include "../config/init.php";


$adherentDAO = new AdherentDAO();
$notefraisDAO = new NoteFraisDAO();
$lignefraisDAO = new LignefraisDAO();
$indemniteDAO = new IndemniteDAO();
$motifDAO = new MotifDAO();
$clubDAO = new ClubDAO();

$authentifie = false;

// Récupère les paramètres dans l'URL
$user = isset($_GET["user"]) ? $_GET["user"] : "";
$password = isset($_GET["password"]) ? $_GET["password"] : "";

//On vérifie que le mail et mdp soient correct et on stocke les infos de l'adh majeur dans la variable $UserConnected
	if ($adherentDAO->est_inscrit($user, $password)){
            $UserConnected = $adherentDAO->findByMail($user);
            $_SESSION['licence_adh'] = $UserConnected->getLicence_adh();
            $licence_adh = $_SESSION['licence_adh'];
            $authentifie = true; 
    }else{
        $authentifie = false;
    }

// Si authentifié, fournit le bordereau de l'année en cours
if ($authentifie) {
    
    $notes = $notefraisDAO->findbylicenceActual($licence_adh);

    foreach($notes as $UneNote) {
        $id_note_frais = $UneNote->getid_note_frais();

    // Remise a 0 du tableau
    $tableau_lignes = array();

    // Recupere les lignes de frais du bordereau
    $lignes = $lignefraisDAO->find($id_note_frais);

    foreach($lignes as $ligne){
    
        $tableau_lignes[] = array( 
        //"Id borderau"=>$bordereauencour->get_ID_bordereau(),
        "DateFrais "=>$ligne->getdate_frais(),
        "Trajet"=>$ligne->gettrajet_frais(), 
        "KM"=>$ligne->getkm_parcourus(), 
        "Peages"=>$ligne->getCout_peage(), 
        "CoutRepas"=>$ligne->getCout_repas(), 
        "coutHebergement "=>$ligne->getCout_hebergement()
        //"Motif"=>$motifDAO->findMotifByIdMotif($ligne->get_IdMotif())->get_Libelle(),      
        //"nom Club"=>$clubDAO->find($ligne->get_ID_club())->get_Nom_club()  
    ); 

    }
}
    
    //var_dump($tableau_lignes);
    //$tableau_lignes[] = (object) $ligne;
   
  // $tableau_bordereauencours[] = (object) $bordereauencour;
  } else {
    $tableau_lignes = NULL;
  }
  
// Construit le format JSON
$json = json_encode($tableau_lignes);
//echo $json;
//$json2 = json_decode($json);
//var_dump($json);

// Envoie la réponse 
send_json($json);