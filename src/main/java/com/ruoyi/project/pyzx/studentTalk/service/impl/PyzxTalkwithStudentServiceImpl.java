package com.ruoyi.project.pyzx.studentTalk.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.pyzx.studentTalk.mapper.PyzxTalkwithStudentMapper;
import com.ruoyi.project.pyzx.studentTalk.domain.PyzxTalkwithStudent;
import com.ruoyi.project.pyzx.studentTalk.service.IPyzxTalkwithStudentService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 谈心谈话记录Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-09
 */
@Service
public class PyzxTalkwithStudentServiceImpl implements IPyzxTalkwithStudentService 
{
    @Autowired
    private PyzxTalkwithStudentMapper pyzxTalkwithStudentMapper;

    /**
     * 查询谈心谈话记录
     * 
     * @param itemId 谈心谈话记录主键
     * @return 谈心谈话记录
     */
    @Override
    public PyzxTalkwithStudent selectPyzxTalkwithStudentByItemId(Long itemId)
    {
        return pyzxTalkwithStudentMapper.selectPyzxTalkwithStudentByItemId(itemId);
    }

    /**
     * 查询谈心谈话记录列表
     * 
     * @param pyzxTalkwithStudent 谈心谈话记录
     * @return 谈心谈话记录
     */
    @Override
    public List<PyzxTalkwithStudent> selectPyzxTalkwithStudentList(PyzxTalkwithStudent pyzxTalkwithStudent)
    {
        return pyzxTalkwithStudentMapper.selectPyzxTalkwithStudentList(pyzxTalkwithStudent);
    }

    /**
     * 新增谈心谈话记录
     * 
     * @param pyzxTalkwithStudent 谈心谈话记录
     * @return 结果
     */
    @Override
    public int insertPyzxTalkwithStudent(PyzxTalkwithStudent pyzxTalkwithStudent)
    {
        pyzxTalkwithStudent.setCreateTime(DateUtils.getNowDate());
        return pyzxTalkwithStudentMapper.insertPyzxTalkwithStudent(pyzxTalkwithStudent);
    }

    /**
     * 修改谈心谈话记录
     * 
     * @param pyzxTalkwithStudent 谈心谈话记录
     * @return 结果
     */
    @Override
    public int updatePyzxTalkwithStudent(PyzxTalkwithStudent pyzxTalkwithStudent)
    {
        pyzxTalkwithStudent.setUpdateTime(DateUtils.getNowDate());
        return pyzxTalkwithStudentMapper.updatePyzxTalkwithStudent(pyzxTalkwithStudent);
    }

    /**
     * 批量删除谈心谈话记录
     * 
     * @param itemIds 需要删除的谈心谈话记录主键
     * @return 结果
     */
    @Override
    public int deletePyzxTalkwithStudentByItemIds(String itemIds)
    {
        return pyzxTalkwithStudentMapper.deletePyzxTalkwithStudentByItemIds(Convert.toStrArray(itemIds));
    }

    /**
     * 删除谈心谈话记录信息
     * 
     * @param itemId 谈心谈话记录主键
     * @return 结果
     */
    @Override
    public int deletePyzxTalkwithStudentByItemId(Long itemId)
    {
        return pyzxTalkwithStudentMapper.deletePyzxTalkwithStudentByItemId(itemId);
    }
}
