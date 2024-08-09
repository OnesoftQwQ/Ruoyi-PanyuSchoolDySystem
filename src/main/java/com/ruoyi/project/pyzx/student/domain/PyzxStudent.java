package com.ruoyi.project.pyzx.student.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 学生信息对象 pyzx_student
 * 
 * @author 落叶
 * @date 2024-08-09
 */
public class PyzxStudent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long studentId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String studentName;

    /** 学号 */
    @Excel(name = "学号")
    private String studentNumber;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long studentAge;

    /** 班级 */
    @Excel(name = "班级")
    private String studentClasses;

    /** 班主任 */
    @Excel(name = "班主任")
    private String studentTeacher;

    /** 性别（0男 1女 2未知） */
    @Excel(name = "性别", readConverterExp = "0=男,1=女,2=未知")
    private String studentSex;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String studentStatus;

    /** 生日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "生日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date studentBirthday;

    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }

    public void setStudentName(String studentName) 
    {
        this.studentName = studentName;
    }

    public String getStudentName() 
    {
        return studentName;
    }

    public void setStudentNumber(String studentNumber) 
    {
        this.studentNumber = studentNumber;
    }

    public String getStudentNumber() 
    {
        return studentNumber;
    }

    public void setStudentAge(Long studentAge) 
    {
        this.studentAge = studentAge;
    }

    public Long getStudentAge() 
    {
        return studentAge;
    }

    public void setStudentClasses(String studentClasses) 
    {
        this.studentClasses = studentClasses;
    }

    public String getStudentClasses() 
    {
        return studentClasses;
    }

    public void setStudentTeacher(String studentTeacher) 
    {
        this.studentTeacher = studentTeacher;
    }

    public String getStudentTeacher() 
    {
        return studentTeacher;
    }

    public void setStudentSex(String studentSex) 
    {
        this.studentSex = studentSex;
    }

    public String getStudentSex() 
    {
        return studentSex;
    }

    public void setStudentStatus(String studentStatus) 
    {
        this.studentStatus = studentStatus;
    }

    public String getStudentStatus() 
    {
        return studentStatus;
    }

    public void setStudentBirthday(Date studentBirthday) 
    {
        this.studentBirthday = studentBirthday;
    }

    public Date getStudentBirthday() 
    {
        return studentBirthday;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("studentId", getStudentId())
            .append("studentName", getStudentName())
            .append("studentNumber", getStudentNumber())
            .append("studentAge", getStudentAge())
            .append("studentClasses", getStudentClasses())
            .append("studentTeacher", getStudentTeacher())
            .append("studentSex", getStudentSex())
            .append("studentStatus", getStudentStatus())
            .append("studentBirthday", getStudentBirthday())
            .toString();
    }
}
