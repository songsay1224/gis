<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도 표현 테스트</title>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- openlayers -->
<link rel="stylesheet" href="/resources/js/ol/ol.css" type="text/css">
<script src="/resources/js/ol/ol.js"></script>

<style>

body {
    margin: 0;
    display: flex; /* 부모 요소에 flexbox 설정 */
    height: 100vh; /* 화면 전체 높이 사용 */
    flex-direction: row-reverse;r
}

#map {
    flex: 1; /* 지도 영역이 남은 공간을 모두 차지하도록 설정 */
    height: 100vh; /* 지도 영역이 화면 전체 높이를 차지하도록 설정 */
}

ul, ol {
    list-style: none; /* 기본 불릿 모양 제거 */
    margin: 0; /* 기본 여백 제거 */
    padding: 0; /* 기본 패딩 제거 */
}

li {
    margin: 10px 0; /* 항목 간의 여백 추가 */
}

.sidebar {
    width: 400px; /* 사이드바 고정 너비 */
    padding: 30px;
    border-left: 1px solid #ddd; /* 오른쪽에 테두리 추가 */
    height: 100vh;
    box-sizing: border-box;
    overflow-y: auto; /* 긴 내용이 있을 경우 스크롤 가능하도록 설정 */
    background-color: #f4f4f4;
}

.project-list {
    padding: 0;
    width: 400px;
}

input {
    width: 200px; /* 입력 필드가 너비를 꽉 차게 설정 */
    padding: 10px; /* 내부 여백 추가 */
    font-size: 16px; /* 글자 크기 */
    border: 2px solid #4CAF50; /* 연한 초록색 테두리 */
    border-radius: 5px; /* 모서리를 둥글게 설정 */
    background-color : #f4f4f4;
    
   
   
}



button {
    padding: 10px 20px;
    font-size: 16px;
    border: 2px solid #4CAF50;
    background-color: #4CAF50;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}

</style>


  <script>
        // dom ready
        $(document).ready(function() {
            init();
        });

        var map; // 전역 변수로 map 객체 선언

        function init() {
            // map 생성
            map = new ol.Map({
                layers: [new ol.layer.Tile({
                    source: new ol.source.OSM() // OpenStreetMap 레이어
                })],
                target: 'map', // Map 생성할 div id
                view: new ol.View({
                    center: [54262071.542715915, 4309280.941817325], // 초기 지도 위치 좌표
                    zoom: 8,
                    maxZoom: 19,
                    minZoom: 8
                })
            });

            // 지도 클릭 이벤트 처리
            map.on('click', function(e) {
                var coordinate = e.coordinate; // 클릭한 좌표
                console.log('클릭한 좌표:', coordinate);
                
                
            });

            // WMS 레이어 추가
            var wms = new ol.layer.Tile({
                source: new ol.source.TileWMS({
                    url: 'http://192.168.0.13:8091/geoserver/jigu/wms?service=WMS',
                    params: {
                        'VERSION': '1.1.0',
                        'LAYERS': 'jigu:usePlan',
                        'BBOX': [13883798.7529242, 3928159.2045817, 14419360.6277587, 4633298.04118048],
                        'SRS': 'EPSG:3900913',
                        'FORMAT': 'image/png'
                    },
                    serverType: 'geoserver',
                })
            });

            map.addLayer(wms); // 맵 객체에 레이어를 추가
        }

        // 지도 이동 함수
        function move(x, y) {
            if (map) { // map 객체가 초기화되었는지 확인
                // 좌표 변환 (Web Mercator 좌표계를 사용)
                /* var transformedCoord = ol.proj.fromLonLat([x, y]); */
                map.getView().setCenter([x,y]); // 클릭한 좌표로 이동
                map.getView().setZoom(10); // 줌 레벨을 설정 (필요에 따라 변경)
            }
        }

    </script>

</head>
<body>
    <div id="map" ></div> <!-- 지도 영역 -->
    <div class="sidebar">
        <div>
            <h2>좌표 검색</h2>
            <form id="searchForm2" method="get">
                <input type="text" name="query" id="query" placeholder="좌표검색">
                <button type="submit">검색</button>
            </form>
        </div>

        <div class="testt">
            <ul class="zonename-list" id="searchResults">
                <c:forEach items="${list}" var="item">
                    <!-- 'list'로 변경 -->
                    <li class="project-item">
                        <h3>
                            <button onclick="move('${item.X}', '${item.Y}')">
                                좌표: X(${item.X}), Y(${item.Y})
                            </button>
                        </h3>
                    </li>
                    
                   
                </c:forEach> 
            </ul>
        </div>
    </div>

    <script>
        $('#searchForm2').on('submit', function(e) {
            e.preventDefault(); // 기본 폼 제출 동작을 막음

            var query = $('#query').val(); // 검색어 가져오기
            console.log('검색어:', query); // 검색어가 제대로 들어갔는지 확인

            $.ajax({
                url: 'search2.do', // 서버의 검색 처리 URL
                type: 'GET',
                data: {
                    query: query
                }, // 검색어를 데이터로 전송
                success: function(response) {
                    console.log('서버 응답:', response); // 서버에서 받은 응답을 출력
                    var newResults = $(response).find('#searchResults').html(); // 검색 결과만 추출
                    $('#searchResults').html(newResults); // 기존 검색 결과를 새로 갱신
                },
                error: function(xhr, status, error) {
                    console.error("사이드바 로드 오류:", status, error); // 에러가 있을 경우 콘솔에 출력
                }
            });
        });
    </script>

</body>
</html>