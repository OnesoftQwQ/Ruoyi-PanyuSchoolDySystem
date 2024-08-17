package com.ruoyi.project.pyzx.education.service;

import java.util.List;
import com.ruoyi.project.pyzx.education.domain.PyzxMoralDetails;

/**
 * 日常德育记录Service接口
 * 
 * @author 落叶
 * @date 2024-08-18
 */
public interface IPyzxMoralDetailsService 
{
    /**
     * 查询日常德育记录
     * 
     * @param id 日常德育记录主键
     * @return 日常德育记录
     */
    public PyzxMoralDetails selectPyzxMoralDetailsById(Long id);

    /**
     * 查询日常德育记录列表
     * 
     * @param pyzxMoralDetails 日常德育记录
     * @return 日常德育记录集合
     */
    public List<PyzxMoralDetails> selectPyzxMoralDetailsList(PyzxMoralDetails pyzxMoralDetails);

    /**
     * 新增日常德育记录
     * 
     * @param pyzxMoralDetails 日常德育记录
     * @return 结果
     */
    public int insertPyzxMoralDetails(PyzxMoralDetails pyzxMoralDetails);

    /**
     * 修改日常德育记录
     * 
     * @param pyzxMoralDetails 日常德育记录
     * @return 结果
     */
    public int updatePyzxMoralDetails(PyzxMoralDetails pyzxMoralDetails);

    /**
     * 批量删除日常德育记录
     * 
     * @param ids 需要删除的日常德育记录主键集合
     * @return 结果
     */
    public int deletePyzxMoralDetailsByIds(String ids);

    /**
     * 删除日常德育记录信息
     * 
     * @param id 日常德育记录主键
     * @return 结果
     */
    public int deletePyzxMoralDetailsById(Long id);
}
