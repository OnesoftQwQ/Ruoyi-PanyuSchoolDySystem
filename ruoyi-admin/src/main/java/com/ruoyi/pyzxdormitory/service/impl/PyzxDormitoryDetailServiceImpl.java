package com.ruoyi.pyzxdormitory.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.pyzxdormitory.mapper.PyzxDormitoryDetailMapper;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryDetail;
import com.ruoyi.pyzxdormitory.service.IPyzxDormitoryDetailService;
import com.ruoyi.common.core.text.Convert;

/**
 * 宿舍检查明细Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-08
 */
@Service
public class PyzxDormitoryDetailServiceImpl implements IPyzxDormitoryDetailService 
{
    @Autowired
    private PyzxDormitoryDetailMapper pyzxDormitoryDetailMapper;

    /**
     * 查询宿舍检查明细
     * 
     * @param id 宿舍检查明细主键
     * @return 宿舍检查明细
     */
    @Override
    public PyzxDormitoryDetail selectPyzxDormitoryDetailById(Long id)
    {
        return pyzxDormitoryDetailMapper.selectPyzxDormitoryDetailById(id);
    }

    /**
     * 查询宿舍检查明细列表
     * 
     * @param pyzxDormitoryDetail 宿舍检查明细
     * @return 宿舍检查明细
     */
    @Override
    public List<PyzxDormitoryDetail> selectPyzxDormitoryDetailList(PyzxDormitoryDetail pyzxDormitoryDetail)
    {
        return pyzxDormitoryDetailMapper.selectPyzxDormitoryDetailList(pyzxDormitoryDetail);
    }

    /**
     * 新增宿舍检查明细
     * 
     * @param pyzxDormitoryDetail 宿舍检查明细
     * @return 结果
     */
    @Override
    public int insertPyzxDormitoryDetail(PyzxDormitoryDetail pyzxDormitoryDetail)
    {
        pyzxDormitoryDetail.setCreateTime(DateUtils.getNowDate());
        return pyzxDormitoryDetailMapper.insertPyzxDormitoryDetail(pyzxDormitoryDetail);
    }

    /**
     * 修改宿舍检查明细
     * 
     * @param pyzxDormitoryDetail 宿舍检查明细
     * @return 结果
     */
    @Override
    public int updatePyzxDormitoryDetail(PyzxDormitoryDetail pyzxDormitoryDetail)
    {
        pyzxDormitoryDetail.setUpdateTime(DateUtils.getNowDate());
        return pyzxDormitoryDetailMapper.updatePyzxDormitoryDetail(pyzxDormitoryDetail);
    }

    /**
     * 批量删除宿舍检查明细
     * 
     * @param ids 需要删除的宿舍检查明细主键
     * @return 结果
     */
    @Override
    public int deletePyzxDormitoryDetailByIds(String ids)
    {
        return pyzxDormitoryDetailMapper.deletePyzxDormitoryDetailByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除宿舍检查明细信息
     * 
     * @param id 宿舍检查明细主键
     * @return 结果
     */
    @Override
    public int deletePyzxDormitoryDetailById(Long id)
    {
        return pyzxDormitoryDetailMapper.deletePyzxDormitoryDetailById(id);
    }
}
