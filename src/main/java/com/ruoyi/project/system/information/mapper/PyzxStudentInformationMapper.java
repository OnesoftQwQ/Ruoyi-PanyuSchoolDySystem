package com.ruoyi.project.system.information.mapper;

import java.util.List;
import com.ruoyi.project.system.information.domain.PyzxStudentInformation;

/**
 * 学生信息Mapper接口
 * 
 * @author 落叶
 * @date 2024-08-09
 */
public interface PyzxStudentInformationMapper 
{
    /**
     * 查询学生信息
     * 
     * @param id 学生信息主键
     * @return 学生信息
     */
    public PyzxStudentInformation selectPyzxStudentInformationById(Long id);

    /**
     * 查询学生信息列表
     * 
     * @param pyzxStudentInformation 学生信息
     * @return 学生信息集合
     */
    public List<PyzxStudentInformation> selectPyzxStudentInformationList(PyzxStudentInformation pyzxStudentInformation);

    /**
     * 新增学生信息
     * 
     * @param pyzxStudentInformation 学生信息
     * @return 结果
     */
    public int insertPyzxStudentInformation(PyzxStudentInformation pyzxStudentInformation);

    /**
     * 修改学生信息
     * 
     * @param pyzxStudentInformation 学生信息
     * @return 结果
     */
    public int updatePyzxStudentInformation(PyzxStudentInformation pyzxStudentInformation);

    /**
     * 删除学生信息
     * 
     * @param id 学生信息主键
     * @return 结果
     */
    public int deletePyzxStudentInformationById(Long id);

    /**
     * 批量删除学生信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePyzxStudentInformationByIds(String[] ids);
}
