<?php
include '../config/config.php';

$query = "SELECT tb_barang.id_merek, tb_merek.nama_merek 
          FROM tb_barang 
          JOIN tb_merek ON tb_barang.id_merek = tb_merek.id_merek
          JOIN tb_kategori ON tb_barang.id_kategori = tb_kategori.id_kategori
          WHERE LOWER(tb_kategori.nama_kategori) = 'refill'
          GROUP BY tb_barang.id_merek";

$result = mysqli_query($con, $query);

$items = array();
while ($row = mysqli_fetch_assoc($result)) {
    $items[] = $row;
}

echo json_encode($items);
?>