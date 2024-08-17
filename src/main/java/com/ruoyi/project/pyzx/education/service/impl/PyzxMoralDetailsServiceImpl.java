package com.ruoyi.project.pyzx.education.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.pyzx.education.mapper.PyzxMoralDetailsMapper;
import com.ruoyi.project.pyzx.education.domain.PyzxMoralDetails;
import com.ruoyi.project.pyzx.education.service.IPyzxMoralDetailsService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 日常德育记录Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-18
 */
@Service
public class PyzxMoralDetailsServiceImpl implements IPyzxMoralDetailsService 
{
    @Autowired
    private PyzxMoralDetailsMapper pyzxMoralDetailsMapper;

    /**
     * 查询日常德育记录
     * 
     * @param id 日常德育记录主键
     * @return 日常德育记录
     */
    @Override
    public PyzxMoralDetails selectPyzxMoralDetailsById(Long id)
    {
        return pyzxMoralDetailsMapper.selectPyzxMoralDetailsById(id);
    }

    /**
     * 查询日常德育记录列表
     * 
     * @param pyzxMoralDetails 日常德育记录
     * @return 日常德育记录
     */
    @Override
    public List<PyzxMoralDetails> selectPyzxMoralDetailsList(PyzxMoralDetails pyzxMoralDetails)
    {
        return pyzxMoralDetailsMapper.selectPyzxMoralDetailsList(pyzxMoralDetails);
    }

    /**
     * 新增日常德育记录
     * 
     * @param pyzxMoralDetails 日常德育记录
     * @return 结果
     */
    @Override
    public int insertPyzxMoralDetails(PyzxMoralDetails pyzxMoralDetails)
    {
        return pyzxMoralDetailsMapper.insertPyzxMoralDetails(pyzxMoralDetails);
    }

    /**
     * 修改日常德育记录
     * 
     * @param pyzxMoralDetails 日常德育记录
     * @return 结果
     */
    @Override
    public int updatePyzxMoralDetails(PyzxMoralDetails pyzxMoralDetails)
    {
        return pyzxMoralDetailsMapper.updatePyzxMoralDetails(pyzxMoralDetails);
    }

    /**
     * 批量删除日常德育记录
     * 
     * @param ids 需要删除的日常德育记录主键
     * @return 结果
     */
    @Override
    public int deletePyzxMoralDetailsByIds(String ids)
    {
        return pyzxMoralDetailsMapper.deletePyzxMoralDetailsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除日常德育记录信息
     * 
     * @param id 日常德育记录主键
     * @return 结果
     */
    @Override
    public int deletePyzxMoralDetailsById(Long id)
    {
        return pyzxMoralDetailsMapper.deletePyzxMoralDetailsById(id);
    }
}
