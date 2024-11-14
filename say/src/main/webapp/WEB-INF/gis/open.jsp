<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
    <!-- openlayers -->
    <link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
    <script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>
 
    <style>
        .map {
            width: 500px;
            height:800px;
        }
    </style>
 
    <script>
    
        // dom ready
        $(document).ready(function() {
            init();
        });
    
        function init() {
        
            // map 생성
            var map = new ol.Map({
                layers: [
                    new ol.layer.Tile({
                        source: new ol.source.OSM()     // OpenStreetMap 레이어
                    })
                ],
                target: 'map',                          // Map 생성할 div id
                view: new ol.View({
                    center: ol.proj.fromLonLat([127.9780, 35.9665]), // 서울 중심 좌표 (경도, 위도 순서)
                    zoom: 7.5 // 줌 레벨 설정
                })
            });
        
 
        }
    
    </script>
 
</head>
<body>
    <div id="map" class="map">
    
   
    </div>
    
     <h1><a href="HelpdeskListView.do">헬프데스크</a></h1>
</body>
</html>