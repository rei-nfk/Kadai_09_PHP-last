<?php
//INI
mb_language("Japanese");
mb_internal_encoding("UTF-8");
mb_http_output("UTF-8");

/**
 * Ajaxによるリクエストかどうか
 * @return boolean True or False
 */
function isAjax(){
    if(isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'){
        return true;
    }
    return false;
}
//Ajaxアクセス以外は処理しない。
if( isAjax()==false ){
    exit;
}

//0.準備
$pref = $_POST["pref"];

//1.  DB接続
try {
  $pdo = new PDO('mysql:dbname=Taxi_fee_search;charset=utf8;host=localhost','root','');
} catch (PDOException $e) {
  exit('データベースに接続できませんでした。'.$e->getMessage());
}

//２．データ登録SQL作成
$stmt = $pdo->prepare("SELECT * FROM feeTable WHERE pref=:pref");
$stmt->bindValue(':pref', $pref);
$status = $stmt->execute();

//３．データ表示
$view="";
if($status==false){
  //execute（SQL実行時にエラーがある場合）
  $error = $stmt->errorInfo();
  exit("ErrorQuery:".$error[2]);
}else{
  //対象行のみ取得
  $row = $stmt->fetch(); //$row["name"]
}

$distance = $_POST["distance"];

$distance_hatsu = $row["distance_hatsu"];
$fee_hatsunori = $row["fee_hatsunori"];
$fee_rate_dist = $row["fee_rate_dist"];
$fee_rate_fee = $row["fee_rate_fee"];

$distance_nokori = $distance - $distance_hatsu;

if ($distance_nokori < 0) {
    $distance_nokori = 0;
}
//初乗り以外の距離で何回料金が上がるかを計算

if (ceil($distance_nokori / $fee_rate_dist) > 0) {
    $fee_up_number = ceil($distance_nokori / $fee_rate_dist);
} else {
    $fee_up_number = 0;
}
$total_fee = ($fee_hatsunori + $fee_up_number * $fee_rate_fee);

$data[]=array(
'total_fee' => $total_fee,
);
$data = json_encode($data);
echo $data;

?>

