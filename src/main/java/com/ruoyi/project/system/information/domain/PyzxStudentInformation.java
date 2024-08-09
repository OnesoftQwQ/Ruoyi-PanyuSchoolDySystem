package com.ruoyi.project.system.information.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 学生信息对象 pyzx_student_information
 * 
 * @author 落叶
 * @date 2024-08-09
 */
public class PyzxStudentInformation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String Name;

    /** 年级 */
    @Excel(name = "年级")
    private String Grade;

    /** 班级 */
    @Excel(name = "班级")
    private String Classes;

    /** 班主任 */
    @Excel(name = "班主任")
    private String Manage;

    /** 学号 */
    @Excel(name = "学号")
    private String studentNumber;

    /** 生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date Birthday;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setName(String Name) 
    {
        this.Name = Name;
    }

    public String getName() 
    {
        return Name;
    }

    public void setGrade(String Grade) 
    {
        this.Grade = Grade;
    }

    public String getGrade() 
    {
        return Grade;
    }

    public void setClasses(String Classes) 
    {
        this.Classes = Classes;
    }

    public String getClasses() 
    {
        return Classes;
    }

    public void setManage(String Manage) 
    {
        this.Manage = Manage;
    }

    public String getManage() 
    {
        return Manage;
    }

    public void setStudentNumber(String studentNumber) 
    {
        this.studentNumber = studentNumber;
    }

    public String getStudentNumber() 
    {
        return studentNumber;
    }

    public void setBirthday(Date Birthday) 
    {
        this.Birthday = Birthday;
    }

    public Date getBirthday() 
    {
        return Birthday;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("Name", getName())
            .append("Grade", getGrade())
            .append("Classes", getClasses())
            .append("Manage", getManage())
            .append("studentNumber", getStudentNumber())
            .append("Birthday", getBirthday())
            .toString();
    }
}
