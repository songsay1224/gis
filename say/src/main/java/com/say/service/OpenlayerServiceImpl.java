package com.say.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.say.mapper.OpenlayerMapper;
import com.say.model.OpenlayerVO;

@Service
public class OpenlayerServiceImpl implements OpenlayerService {

    @Autowired
    private OpenlayerMapper mapper;

    @Override
    public void open(OpenlayerVO openlayer) {
        mapper.open(openlayer);
    }

    @Override
    public List<Map<String, Object>> getZone(String query) {
        return mapper.getZone(query);
    }
}
