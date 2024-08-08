package com.ruoyi.pyzxdormitory.service;

import java.util.List;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryDetail;

/**
 * 宿舍检查明细Service接口
 * 
 * @author 落叶
 * @date 2024-08-08
 */
public interface IPyzxDormitoryDetailService 
{
    /**
     * 查询宿舍检查明细
     * 
     * @param id 宿舍检查明细主键
     * @return 宿舍检查明细
     */
    public PyzxDormitoryDetail selectPyzxDormitoryDetailById(Long id);

    /**
     * 查询宿舍检查明细列表
     * 
     * @param pyzxDormitoryDetail 宿舍检查明细
     * @return 宿舍检查明细集合
     */
    public List<PyzxDormitoryDetail> selectPyzxDormitoryDetailList(PyzxDormitoryDetail pyzxDormitoryDetail);

    /**
     * 新增宿舍检查明细
     * 
     * @param pyzxDormitoryDetail 宿舍检查明细
     * @return 结果
     */
    public int insertPyzxDormitoryDetail(PyzxDormitoryDetail pyzxDormitoryDetail);

    /**
     * 修改宿舍检查明细
     * 
     * @param pyzxDormitoryDetail 宿舍检查明细
     * @return 结果
     */
    public int updatePyzxDormitoryDetail(PyzxDormitoryDetail pyzxDormitoryDetail);

    /**
     * 批量删除宿舍检查明细
     * 
     * @param ids 需要删除的宿舍检查明细主键集合
     * @return 结果
     */
    public int deletePyzxDormitoryDetailByIds(String ids);

    /**
     * 删除宿舍检查明细信息
     * 
     * @param id 宿舍检查明细主键
     * @return 结果
     */
    public int deletePyzxDormitoryDetailById(Long id);
}
