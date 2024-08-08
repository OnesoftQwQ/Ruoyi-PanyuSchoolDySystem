package com.ruoyi.pyzxdormitory.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 宿舍检查对象 pyzx_dormitory_examine
 * 
 * @author 落叶
 * @date 2024-08-08
 */
public class PyzxDormitoryExamine extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 周名称 */
    @Excel(name = "周名称")
    private String weekname;

    /** 周数 */
    @Excel(name = "周数")
    private String weeknum;

    /** 检查人 */
    @Excel(name = "检查人")
    private String checkedBy;

    /** 宿舍检查明细信息 */
    private List<PyzxDormitoryDetail> pyzxDormitoryDetailList;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setWeekname(String weekname) 
    {
        this.weekname = weekname;
    }

    public String getWeekname() 
    {
        return weekname;
    }

    public void setWeeknum(String weeknum) 
    {
        this.weeknum = weeknum;
    }

    public String getWeeknum() 
    {
        return weeknum;
    }

    public void setCheckedBy(String checkedBy) 
    {
        this.checkedBy = checkedBy;
    }

    public String getCheckedBy() 
    {
        return checkedBy;
    }

    public List<PyzxDormitoryDetail> getPyzxDormitoryDetailList()
    {
        return pyzxDormitoryDetailList;
    }

    public void setPyzxDormitoryDetailList(List<PyzxDormitoryDetail> pyzxDormitoryDetailList)
    {
        this.pyzxDormitoryDetailList = pyzxDormitoryDetailList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("weekname", getWeekname())
            .append("weeknum", getWeeknum())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("checkedBy", getCheckedBy())
            .append("pyzxDormitoryDetailList", getPyzxDormitoryDetailList())
            .toString();
    }
}
