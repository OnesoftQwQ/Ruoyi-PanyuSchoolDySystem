package com.ruoyi.project.pyzx.education.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 日常德育记录对象 pyzx_moral_details
 * 
 * @author 落叶
 * @date 2024-08-18
 */
public class PyzxMoralDetails extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 周数 */
    @Excel(name = "周数")
    private String weeknum;

    /** 周名称 */
    @Excel(name = "周名称")
    private String weekname;

    /** 班级 */
    @Excel(name = "班级")
    private String stuclass;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 性别 */
    @Excel(name = "性别")
    private Long sex;

    /** 加分 */
    @Excel(name = "加分")
    private BigDecimal point;

    /** 加分原因 */
    @Excel(name = "加分原因")
    private String reason;

    /** 扣分 */
    @Excel(name = "扣分")
    private BigDecimal standard;

    /** 扣分原因 */
    @Excel(name = "扣分原因")
    private String standardreason;

    /** 检查日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "检查日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkdate;

    /** 核对人 */
    @Excel(name = "核对人")
    private String checkedBy;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setWeeknum(String weeknum) 
    {
        this.weeknum = weeknum;
    }

    public String getWeeknum() 
    {
        return weeknum;
    }

    public void setWeekname(String weekname) 
    {
        this.weekname = weekname;
    }

    public String getWeekname() 
    {
        return weekname;
    }

    public void setStuclass(String stuclass) 
    {
        this.stuclass = stuclass;
    }

    public String getStuclass() 
    {
        return stuclass;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setSex(Long sex) 
    {
        this.sex = sex;
    }

    public Long getSex() 
    {
        return sex;
    }

    public void setPoint(BigDecimal point) 
    {
        this.point = point;
    }

    public BigDecimal getPoint() 
    {
        return point;
    }

    public void setReason(String reason) 
    {
        this.reason = reason;
    }

    public String getReason() 
    {
        return reason;
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

    public void setCheckedBy(String checkedBy) 
    {
        this.checkedBy = checkedBy;
    }

    public String getCheckedBy() 
    {
        return checkedBy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("weeknum", getWeeknum())
            .append("weekname", getWeekname())
            .append("stuclass", getStuclass())
            .append("name", getName())
            .append("sex", getSex())
            .append("point", getPoint())
            .append("reason", getReason())
            .append("standard", getStandard())
            .append("standardreason", getStandardreason())
            .append("checkdate", getCheckdate())
            .append("createBy", getCreateBy())
            .append("checkedBy", getCheckedBy())
            .toString();
    }
}
