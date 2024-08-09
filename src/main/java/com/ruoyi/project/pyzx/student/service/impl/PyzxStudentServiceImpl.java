package com.ruoyi.project.pyzx.student.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.pyzx.student.mapper.PyzxStudentMapper;
import com.ruoyi.project.pyzx.student.domain.PyzxStudent;
import com.ruoyi.project.pyzx.student.service.IPyzxStudentService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 学生信息Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-09
 */
@Service
public class PyzxStudentServiceImpl implements IPyzxStudentService 
{
    @Autowired
    private PyzxStudentMapper pyzxStudentMapper;

    /**
     * 查询学生信息
     * 
     * @param studentId 学生信息主键
     * @return 学生信息
     */
    @Override
    public PyzxStudent selectPyzxStudentByStudentId(Long studentId)
    {
        return pyzxStudentMapper.selectPyzxStudentByStudentId(studentId);
    }

    /**
     * 查询学生信息列表
     * 
     * @param pyzxStudent 学生信息
     * @return 学生信息
     */
    @Override
    public List<PyzxStudent> selectPyzxStudentList(PyzxStudent pyzxStudent)
    {
        return pyzxStudentMapper.selectPyzxStudentList(pyzxStudent);
    }

    /**
     * 新增学生信息
     * 
     * @param pyzxStudent 学生信息
     * @return 结果
     */
    @Override
    public int insertPyzxStudent(PyzxStudent pyzxStudent)
    {
        return pyzxStudentMapper.insertPyzxStudent(pyzxStudent);
    }

    /**
     * 修改学生信息
     * 
     * @param pyzxStudent 学生信息
     * @return 结果
     */
    @Override
    public int updatePyzxStudent(PyzxStudent pyzxStudent)
    {
        return pyzxStudentMapper.updatePyzxStudent(pyzxStudent);
    }

    /**
     * 批量删除学生信息
     * 
     * @param studentIds 需要删除的学生信息主键
     * @return 结果
     */
    @Override
    public int deletePyzxStudentByStudentIds(String studentIds)
    {
        return pyzxStudentMapper.deletePyzxStudentByStudentIds(Convert.toStrArray(studentIds));
    }

    /**
     * 删除学生信息信息
     * 
     * @param studentId 学生信息主键
     * @return 结果
     */
    @Override
    public int deletePyzxStudentByStudentId(Long studentId)
    {
        return pyzxStudentMapper.deletePyzxStudentByStudentId(studentId);
    }
}
