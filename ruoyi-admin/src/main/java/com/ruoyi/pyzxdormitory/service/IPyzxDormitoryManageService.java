package com.ruoyi.pyzxdormitory.service;

import java.util.List;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryManage;

/**
 * 宿舍Service接口
 * 
 * @author 落叶
 * @date 2024-08-08
 */
public interface IPyzxDormitoryManageService 
{
    /**
     * 查询宿舍
     * 
     * @param id 宿舍主键
     * @return 宿舍
     */
    public PyzxDormitoryManage selectPyzxDormitoryManageById(Long id);

    /**
     * 查询宿舍列表
     * 
     * @param pyzxDormitoryManage 宿舍
     * @return 宿舍集合
     */
    public List<PyzxDormitoryManage> selectPyzxDormitoryManageList(PyzxDormitoryManage pyzxDormitoryManage);

    /**
     * 新增宿舍
     * 
     * @param pyzxDormitoryManage 宿舍
     * @return 结果
     */
    public int insertPyzxDormitoryManage(PyzxDormitoryManage pyzxDormitoryManage);

    /**
     * 修改宿舍
     * 
     * @param pyzxDormitoryManage 宿舍
     * @return 结果
     */
    public int updatePyzxDormitoryManage(PyzxDormitoryManage pyzxDormitoryManage);

    /**
     * 批量删除宿舍
     * 
     * @param ids 需要删除的宿舍主键集合
     * @return 结果
     */
    public int deletePyzxDormitoryManageByIds(String ids);

    /**
     * 删除宿舍信息
     * 
     * @param id 宿舍主键
     * @return 结果
     */
    public int deletePyzxDormitoryManageById(Long id);
}
