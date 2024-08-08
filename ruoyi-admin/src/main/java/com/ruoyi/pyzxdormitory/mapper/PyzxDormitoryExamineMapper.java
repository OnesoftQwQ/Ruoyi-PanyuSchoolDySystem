package com.ruoyi.pyzxdormitory.mapper;

import java.util.List;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryExamine;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryDetail;

/**
 * 宿舍检查Mapper接口
 * 
 * @author 落叶
 * @date 2024-08-08
 */
public interface PyzxDormitoryExamineMapper 
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
     * 删除宿舍检查
     * 
     * @param id 宿舍检查主键
     * @return 结果
     */
    public int deletePyzxDormitoryExamineById(Long id);

    /**
     * 批量删除宿舍检查
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyzxDormitoryExamineByIds(String[] ids);

    /**
     * 批量删除宿舍检查明细
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyzxDormitoryDetailByPids(String[] ids);
    
    /**
     * 批量新增宿舍检查明细
     * 
     * @param pyzxDormitoryDetailList 宿舍检查明细列表
     * @return 结果
     */
    public int batchPyzxDormitoryDetail(List<PyzxDormitoryDetail> pyzxDormitoryDetailList);
    

    /**
     * 通过宿舍检查主键删除宿舍检查明细信息
     * 
     * @param id 宿舍检查ID
     * @return 结果
     */
    public int deletePyzxDormitoryDetailByPid(Long id);
}
