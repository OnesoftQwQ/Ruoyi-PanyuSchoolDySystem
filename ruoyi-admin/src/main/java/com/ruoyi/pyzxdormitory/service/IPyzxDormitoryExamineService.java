package com.ruoyi.pyzxdormitory.service;

import java.util.List;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryExamine;

/**
 * 宿舍检查Service接口
 * 
 * @author 落叶
 * @date 2024-08-08
 */
public interface IPyzxDormitoryExamineService 
{
    /**
     * 查询宿舍检查
     * 
     * @param id 宿舍检查主键
     * @return 宿舍检查
     */
    public PyzxDormitoryExamine selectPyzxDormitoryExamineById(Long id);

    /**
     * 查询宿舍检查列表
     * 
     * @param pyzxDormitoryExamine 宿舍检查
     * @return 宿舍检查集合
     */
    public List<PyzxDormitoryExamine> selectPyzxDormitoryExamineList(PyzxDormitoryExamine pyzxDormitoryExamine);

    /**
     * 新增宿舍检查
     * 
     * @param pyzxDormitoryExamine 宿舍检查
     * @return 结果
     */
    public int insertPyzxDormitoryExamine(PyzxDormitoryExamine pyzxDormitoryExamine);

    /**
     * 修改宿舍检查
     * 
     * @param pyzxDormitoryExamine 宿舍检查
     * @return 结果
     */
    public int updatePyzxDormitoryExamine(PyzxDormitoryExamine pyzxDormitoryExamine);

    /**
     * 批量删除宿舍检查
     * 
     * @param ids 需要删除的宿舍检查主键集合
     * @return 结果
     */
    public int deletePyzxDormitoryExamineByIds(String ids);

    /**
     * 删除宿舍检查信息
     * 
     * @param id 宿舍检查主键
     * @return 结果
     */
    public int deletePyzxDormitoryExamineById(Long id);
}
