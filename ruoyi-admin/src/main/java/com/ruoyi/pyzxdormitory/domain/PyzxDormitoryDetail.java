package com.ruoyi.pyzxdormitory.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 宿舍检查明细对象 pyzx_dormitory_detail
 * 
 * @author 落叶
 * @date 2024-08-08
 */
public class PyzxDormitoryDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 父id */
    private Long pid;

    /** 年级 */
    @Excel(name = "年级")
    private String grade;

    /** 班级 */
    @Excel(name = "班级")
    private String stuclass;

    /** 宿舍号 */
    @Excel(name = "宿舍号")
    private Long room;

    /** 床号 */
    @Excel(name = "床号")
    private Long bad;

    /** 性别 */
    @Excel(name = "性别")
    private Long sex;

    /** 扣分标准 */
    @Excel(name = "扣分标准")
    private BigDecimal standard;

    /** 扣分原因 */
    @Excel(name = "扣分原因")
    private String standardreason;

    /** 检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkdate;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setPid(Long pid) 
    {
        this.pid = pid;
    }

    public Long getPid() 
    {
        return pid;
    }

    public void setGrade(String grade) 
    {
        this.grade = grade;
    }

    public String getGrade() 
    {
        return grade;
    }

    public void setStuclass(String stuclass) 
    {
        this.stuclass = stuclass;
    }

    public String getStuclass() 
    {
        return stuclass;
    }

    public void setRoom(Long room) 
    {
        this.room = room;
    }

    public Long getRoom() 
    {
        return room;
    }

    public void setBad(Long bad) 
    {
        this.bad = bad;
    }

    public Long getBad() 
    {
        return bad;
    }

    public void setSex(Long sex) 
    {
        this.sex = sex;
    }

    public Long getSex() 
    {
        return sex;
    }

    public void setStandard(BigDecimal standard) 
    {
        this.standard = standard;
    }

    public BigDecimal getStandard() 
    {
        return standard;
    }

    public void setStandardreason(String standardreason) 
    {
        this.standardreason = standardreason;
    }

    public String getStandardreason() 
    {
        return standardreason;
    }

    public void setCheckdate(Date checkdate) 
    {
        this.checkdate = checkdate;
    }

    public Date getCheckdate() 
    {
        return checkdate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("pid", getPid())
            .append("grade", getGrade())
            .append("stuclass", getStuclass())
            .append("room", getRoom())
            .append("bad", getBad())
            .append("sex", getSex())
            .append("standard", getStandard())
            .append("standardreason", getStandardreason())
            .append("checkdate", getCheckdate())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .toString();
    }
}
