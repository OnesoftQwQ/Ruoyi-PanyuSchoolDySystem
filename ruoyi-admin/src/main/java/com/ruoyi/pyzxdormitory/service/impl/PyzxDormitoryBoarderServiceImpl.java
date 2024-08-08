package com.ruoyi.pyzxdormitory.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.pyzxdormitory.mapper.PyzxDormitoryBoarderMapper;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryBoarder;
import com.ruoyi.pyzxdormitory.service.IPyzxDormitoryBoarderService;
import com.ruoyi.common.core.text.Convert;

/**
 * 住宿生信息Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-08
 */
@Service
public class PyzxDormitoryBoarderServiceImpl implements IPyzxDormitoryBoarderService 
{
    @Autowired
    private PyzxDormitoryBoarderMapper pyzxDormitoryBoarderMapper;

    /**
     * 查询住宿生信息
     * 
     * @param sid 住宿生信息主键
     * @return 住宿生信息
     */
    @Override
    public PyzxDormitoryBoarder selectPyzxDormitoryBoarderBySid(Long sid)
    {
        return pyzxDormitoryBoarderMapper.selectPyzxDormitoryBoarderBySid(sid);
    }

    /**
     * 查询住宿生信息列表
     * 
     * @param pyzxDormitoryBoarder 住宿生信息
     * @return 住宿生信息
     */
    @Override
    public List<PyzxDormitoryBoarder> selectPyzxDormitoryBoarderList(PyzxDormitoryBoarder pyzxDormitoryBoarder)
    {
        return pyzxDormitoryBoarderMapper.selectPyzxDormitoryBoarderList(pyzxDormitoryBoarder);
    }

    /**
     * 新增住宿生信息
     * 
     * @param pyzxDormitoryBoarder 住宿生信息
     * @return 结果
     */
    @Override
    public int insertPyzxDormitoryBoarder(PyzxDormitoryBoarder pyzxDormitoryBoarder)
    {
        pyzxDormitoryBoarder.setCreateTime(DateUtils.getNowDate());
        return pyzxDormitoryBoarderMapper.insertPyzxDormitoryBoarder(pyzxDormitoryBoarder);
    }

    /**
     * 修改住宿生信息
     * 
     * @param pyzxDormitoryBoarder 住宿生信息
     * @return 结果
     */
    @Override
    public int updatePyzxDormitoryBoarder(PyzxDormitoryBoarder pyzxDormitoryBoarder)
    {
        pyzxDormitoryBoarder.setUpdateTime(DateUtils.getNowDate());
        return pyzxDormitoryBoarderMapper.updatePyzxDormitoryBoarder(pyzxDormitoryBoarder);
    }

    /**
     * 批量删除住宿生信息
     * 
     * @param sids 需要删除的住宿生信息主键
     * @return 结果
     */
    @Override
    public int deletePyzxDormitoryBoarderBySids(String sids)
    {
        return pyzxDormitoryBoarderMapper.deletePyzxDormitoryBoarderBySids(Convert.toStrArray(sids));
    }

    /**
     * 删除住宿生信息信息
     * 
     * @param sid 住宿生信息主键
     * @return 结果
     */
    @Override
    public int deletePyzxDormitoryBoarderBySid(Long sid)
    {
        return pyzxDormitoryBoarderMapper.deletePyzxDormitoryBoarderBySid(sid);
    }
}
