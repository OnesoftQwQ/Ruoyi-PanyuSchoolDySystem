package com.ruoyi.pyzxdormitory.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryDetail;
import com.ruoyi.pyzxdormitory.mapper.PyzxDormitoryExamineMapper;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryExamine;
import com.ruoyi.pyzxdormitory.service.IPyzxDormitoryExamineService;
import com.ruoyi.common.core.text.Convert;

/**
 * 宿舍检查Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-08
 */
@Service
public class PyzxDormitoryExamineServiceImpl implements IPyzxDormitoryExamineService 
{
    @Autowired
    private PyzxDormitoryExamineMapper pyzxDormitoryExamineMapper;

    /**
     * 查询宿舍检查
     * 
     * @param id 宿舍检查主键
     * @return 宿舍检查
     */
    @Override
    public PyzxDormitoryExamine selectPyzxDormitoryExamineById(Long id)
    {
        return pyzxDormitoryExamineMapper.selectPyzxDormitoryExamineById(id);
    }

    /**
     * 查询宿舍检查列表
     * 
     * @param pyzxDormitoryExamine 宿舍检查
     * @return 宿舍检查
     */
    @Override
    public List<PyzxDormitoryExamine> selectPyzxDormitoryExamineList(PyzxDormitoryExamine pyzxDormitoryExamine)
    {
        return pyzxDormitoryExamineMapper.selectPyzxDormitoryExamineList(pyzxDormitoryExamine);
    }

    /**
     * 新增宿舍检查
     * 
     * @param pyzxDormitoryExamine 宿舍检查
     * @return 结果
     */
    @Transactional
    @Override
    public int insertPyzxDormitoryExamine(PyzxDormitoryExamine pyzxDormitoryExamine)
    {
        pyzxDormitoryExamine.setCreateTime(DateUtils.getNowDate());
        int rows = pyzxDormitoryExamineMapper.insertPyzxDormitoryExamine(pyzxDormitoryExamine);
        insertPyzxDormitoryDetail(pyzxDormitoryExamine);
        return rows;
    }

    /**
     * 修改宿舍检查
     * 
     * @param pyzxDormitoryExamine 宿舍检查
     * @return 结果
     */
    @Transactional
    @Override
    public int updatePyzxDormitoryExamine(PyzxDormitoryExamine pyzxDormitoryExamine)
    {
        pyzxDormitoryExamine.setUpdateTime(DateUtils.getNowDate());
        pyzxDormitoryExamineMapper.deletePyzxDormitoryDetailByPid(pyzxDormitoryExamine.getId());
        insertPyzxDormitoryDetail(pyzxDormitoryExamine);
        return pyzxDormitoryExamineMapper.updatePyzxDormitoryExamine(pyzxDormitoryExamine);
    }

    /**
     * 批量删除宿舍检查
     * 
     * @param ids 需要删除的宿舍检查主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deletePyzxDormitoryExamineByIds(String ids)
    {
        pyzxDormitoryExamineMapper.deletePyzxDormitoryDetailByPids(Convert.toStrArray(ids));
        return pyzxDormitoryExamineMapper.deletePyzxDormitoryExamineByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除宿舍检查信息
     * 
     * @param id 宿舍检查主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deletePyzxDormitoryExamineById(Long id)
    {
        pyzxDormitoryExamineMapper.deletePyzxDormitoryDetailByPid(id);
        return pyzxDormitoryExamineMapper.deletePyzxDormitoryExamineById(id);
    }

    /**
     * 新增宿舍检查明细信息
     * 
     * @param pyzxDormitoryExamine 宿舍检查对象
     */
    public void insertPyzxDormitoryDetail(PyzxDormitoryExamine pyzxDormitoryExamine)
    {
        List<PyzxDormitoryDetail> pyzxDormitoryDetailList = pyzxDormitoryExamine.getPyzxDormitoryDetailList();
        Long id = pyzxDormitoryExamine.getId();
        if (StringUtils.isNotNull(pyzxDormitoryDetailList))
        {
            List<PyzxDormitoryDetail> list = new ArrayList<PyzxDormitoryDetail>();
            for (PyzxDormitoryDetail pyzxDormitoryDetail : pyzxDormitoryDetailList)
            {
                pyzxDormitoryDetail.setPid(id);
                list.add(pyzxDormitoryDetail);
            }
            if (list.size() > 0)
            {
                pyzxDormitoryExamineMapper.batchPyzxDormitoryDetail(list);
            }
        }
    }
}
