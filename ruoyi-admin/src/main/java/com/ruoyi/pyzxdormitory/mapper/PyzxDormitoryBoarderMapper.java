package com.ruoyi.pyzxdormitory.mapper;

import java.util.List;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryBoarder;

/**
 * 住宿生信息Mapper接口
 * 
 * @author 落叶
 * @date 2024-08-08
 */
public interface PyzxDormitoryBoarderMapper 
{
    /**
     * 查询住宿生信息
     * 
     * @param sid 住宿生信息主键
     * @return 住宿生信息
     */
    public PyzxDormitoryBoarder selectPyzxDormitoryBoarderBySid(Long sid);

    /**
     * 查询住宿生信息列表
     * 
     * @param pyzxDormitoryBoarder 住宿生信息
     * @return 住宿生信息集合
     */
    public List<PyzxDormitoryBoarder> selectPyzxDormitoryBoarderList(PyzxDormitoryBoarder pyzxDormitoryBoarder);

    /**
     * 新增住宿生信息
     * 
     * @param pyzxDormitoryBoarder 住宿生信息
     * @return 结果
     */
    public int insertPyzxDormitoryBoarder(PyzxDormitoryBoarder pyzxDormitoryBoarder);

    /**
     * 修改住宿生信息
     * 
     * @param pyzxDormitoryBoarder 住宿生信息
     * @return 结果
     */
    public int updatePyzxDormitoryBoarder(PyzxDormitoryBoarder pyzxDormitoryBoarder);

    /**
     * 删除住宿生信息
     * 
     * @param sid 住宿生信息主键
     * @return 结果
     */
    public int deletePyzxDormitoryBoarderBySid(Long sid);

    /**
     * 批量删除住宿生信息
     * 
     * @param sids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyzxDormitoryBoarderBySids(String[] sids);
}
