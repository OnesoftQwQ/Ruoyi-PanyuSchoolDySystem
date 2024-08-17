package com.ruoyi.project.pyzx.sub.mapper;

import java.util.List;
import com.ruoyi.project.pyzx.sub.domain.PyzxSusheSub;

/**
 * 宿舍检查明细Mapper接口
 * 
 * @author 落叶
 * @date 2024-08-18
 */
public interface PyzxSusheSubMapper 
{
    /**
     * 查询宿舍检查明细
     * 
     * @param id 宿舍检查明细主键
     * @return 宿舍检查明细
     */
    public PyzxSusheSub selectPyzxSusheSubById(Long id);

    /**
     * 查询宿舍检查明细列表
     * 
     * @param pyzxSusheSub 宿舍检查明细
     * @return 宿舍检查明细集合
     */
    public List<PyzxSusheSub> selectPyzxSusheSubList(PyzxSusheSub pyzxSusheSub);

    /**
     * 新增宿舍检查明细
     * 
     * @param pyzxSusheSub 宿舍检查明细
     * @return 结果
     */
    public int insertPyzxSusheSub(PyzxSusheSub pyzxSusheSub);

    /**
     * 修改宿舍检查明细
     * 
     * @param pyzxSusheSub 宿舍检查明细
     * @return 结果
     */
    public int updatePyzxSusheSub(PyzxSusheSub pyzxSusheSub);

    /**
     * 删除宿舍检查明细
     * 
     * @param id 宿舍检查明细主键
     * @return 结果
     */
    public int deletePyzxSusheSubById(Long id);

    /**
     * 批量删除宿舍检查明细
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyzxSusheSubByIds(String[] ids);
}
