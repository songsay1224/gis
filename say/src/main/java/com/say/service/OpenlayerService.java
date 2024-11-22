package com.say.service;

import java.util.List;
import java.util.Map;
import com.say.model.OpenlayerVO;

public interface OpenlayerService {
    void open(OpenlayerVO openlayer);
    
    /**
     * 검색어를 기반으로 GIS 데이터를 조회합니다.
     * @param query 검색어
     * @return 검색 결과 리스트 (좌표 데이터 포함)
     */
    List<Map<String, Object>> getZone(String query);
}
