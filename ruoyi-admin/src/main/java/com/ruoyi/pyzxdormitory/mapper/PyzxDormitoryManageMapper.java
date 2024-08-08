package com.ruoyi.pyzxdormitory.mapper;

import java.util.List;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryManage;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryBoarder;

/**
 * 宿舍Mapper接口
 * 
 * @author 落叶
 * @date 2024-08-08
 */
public interface PyzxDormitoryManageMapper 
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
     * 删除宿舍
     * 
     * @param id 宿舍主键
     * @return 结果
     */
    public int deletePyzxDormitoryManageById(Long id);

    /**
     * 批量删除宿舍
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyzxDormitoryManageByIds(String[] ids);

    /**
     * 批量删除住宿生信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyzxDormitoryBoarderBySids(String[] ids);
    
    /**
     * 批量新增住宿生信息
     * 
     * @param pyzxDormitoryBoarderList 住宿生信息列表
     * @return 结果
     */
    public int batchPyzxDormitoryBoarder(List<PyzxDormitoryBoarder> pyzxDormitoryBoarderList);
    

    /**
     * 通过宿舍主键删除住宿生信息信息
     * 
     * @param id 宿舍ID
     * @return 结果
     */
    public int deletePyzxDormitoryBoarderBySid(Long id);
}
