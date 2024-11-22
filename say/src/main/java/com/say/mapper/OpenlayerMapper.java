package com.say.mapper;

import java.util.List;
import java.util.Map;

import com.say.model.OpenlayerVO;

public interface OpenlayerMapper {
    void open(OpenlayerVO openlayer);
    
    List<Map<String, Object>> getZone(String query); // camelCase로 수정
}
