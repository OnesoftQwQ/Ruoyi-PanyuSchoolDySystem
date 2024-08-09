package com.ruoyi.project.system.student.service;

import java.util.List;
import com.ruoyi.project.system.student.domain.PyzxTalkwithStudent;

/**
 * 谈心谈话记录Service接口
 * 
 * @author ruoyi
 * @date 2024-08-09
 */
public interface IPyzxTalkwithStudentService 
{
    /**
     * 查询谈心谈话记录
     * 
     * @param itemId 谈心谈话记录主键
     * @return 谈心谈话记录
     */
    public PyzxTalkwithStudent selectPyzxTalkwithStudentByItemId(Long itemId);

    /**
     * 查询谈心谈话记录列表
     * 
     * @param pyzxTalkwithStudent 谈心谈话记录
     * @return 谈心谈话记录集合
     */
    public List<PyzxTalkwithStudent> selectPyzxTalkwithStudentList(PyzxTalkwithStudent pyzxTalkwithStudent);

    /**
     * 新增谈心谈话记录
     * 
     * @param pyzxTalkwithStudent 谈心谈话记录
     * @return 结果
     */
    public int insertPyzxTalkwithStudent(PyzxTalkwithStudent pyzxTalkwithStudent);

    /**
     * 修改谈心谈话记录
     * 
     * @param pyzxTalkwithStudent 谈心谈话记录
     * @return 结果
     */
    public int updatePyzxTalkwithStudent(PyzxTalkwithStudent pyzxTalkwithStudent);

    /**
     * 批量删除谈心谈话记录
     * 
     * @param itemIds 需要删除的谈心谈话记录主键集合
     * @return 结果
     */
    public int deletePyzxTalkwithStudentByItemIds(String itemIds);

    /**
     * 删除谈心谈话记录信息
     * 
     * @param itemId 谈心谈话记录主键
     * @return 结果
     */
    public int deletePyzxTalkwithStudentByItemId(Long itemId);
}
