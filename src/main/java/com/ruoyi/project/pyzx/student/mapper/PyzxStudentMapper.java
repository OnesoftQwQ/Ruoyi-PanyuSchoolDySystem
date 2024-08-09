package com.ruoyi.project.pyzx.student.mapper;

import java.util.List;
import com.ruoyi.project.pyzx.student.domain.PyzxStudent;

/**
 * 学生信息Mapper接口
 * 
 * @author 落叶
 * @date 2024-08-09
 */
public interface PyzxStudentMapper 
{
    /**
     * 查询学生信息
     * 
     * @param studentId 学生信息主键
     * @return 学生信息
     */
    public PyzxStudent selectPyzxStudentByStudentId(Long studentId);

    /**
     * 查询学生信息列表
     * 
     * @param pyzxStudent 学生信息
     * @return 学生信息集合
     */
    public List<PyzxStudent> selectPyzxStudentList(PyzxStudent pyzxStudent);

    /**
     * 新增学生信息
     * 
     * @param pyzxStudent 学生信息
     * @return 结果
     */
    public int insertPyzxStudent(PyzxStudent pyzxStudent);

    /**
     * 修改学生信息
     * 
     * @param pyzxStudent 学生信息
     * @return 结果
     */
    public int updatePyzxStudent(PyzxStudent pyzxStudent);

    /**
     * 删除学生信息
     * 
     * @param studentId 学生信息主键
     * @return 结果
     */
    public int deletePyzxStudentByStudentId(Long studentId);

    /**
     * 批量删除学生信息
     * 
     * @param studentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyzxStudentByStudentIds(String[] studentIds);
}
