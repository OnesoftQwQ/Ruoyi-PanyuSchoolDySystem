package com.ruoyi.project.system.information.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.information.mapper.PyzxStudentInformationMapper;
import com.ruoyi.project.system.information.domain.PyzxStudentInformation;
import com.ruoyi.project.system.information.service.IPyzxStudentInformationService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 学生信息Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-09
 */
@Service
public class PyzxStudentInformationServiceImpl implements IPyzxStudentInformationService 
{
    @Autowired
    private PyzxStudentInformationMapper pyzxStudentInformationMapper;

    /**
     * 查询学生信息
     * 
     * @param id 学生信息主键
     * @return 学生信息
     */
    @Override
    public PyzxStudentInformation selectPyzxStudentInformationById(Long id)
    {
        return pyzxStudentInformationMapper.selectPyzxStudentInformationById(id);
    }

    /**
     * 查询学生信息列表
     * 
     * @param pyzxStudentInformation 学生信息
     * @return 学生信息
     */
    @Override
    public List<PyzxStudentInformation> selectPyzxStudentInformationList(PyzxStudentInformation pyzxStudentInformation)
    {
        return pyzxStudentInformationMapper.selectPyzxStudentInformationList(pyzxStudentInformation);
    }

    /**
     * 新增学生信息
     * 
     * @param pyzxStudentInformation 学生信息
     * @return 结果
     */
    @Override
    public int insertPyzxStudentInformation(PyzxStudentInformation pyzxStudentInformation)
    {
        return pyzxStudentInformationMapper.insertPyzxStudentInformation(pyzxStudentInformation);
    }

    /**
     * 修改学生信息
     * 
     * @param pyzxStudentInformation 学生信息
     * @return 结果
     */
    @Override
    public int updatePyzxStudentInformation(PyzxStudentInformation pyzxStudentInformation)
    {
        return pyzxStudentInformationMapper.updatePyzxStudentInformation(pyzxStudentInformation);
    }

    /**
     * 批量删除学生信息
     * 
     * @param ids 需要删除的学生信息主键
     * @return 结果
     */
    @Override
    public int deletePyzxStudentInformationByIds(String ids)
    {
        return pyzxStudentInformationMapper.deletePyzxStudentInformationByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除学生信息信息
     * 
     * @param id 学生信息主键
     * @return 结果
     */
    @Override
    public int deletePyzxStudentInformationById(Long id)
    {
        return pyzxStudentInformationMapper.deletePyzxStudentInformationById(id);
    }
}
