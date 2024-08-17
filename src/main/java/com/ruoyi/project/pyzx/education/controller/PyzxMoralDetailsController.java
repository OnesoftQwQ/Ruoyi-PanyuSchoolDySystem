package com.ruoyi.project.pyzx.education.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.pyzx.education.domain.PyzxMoralDetails;
import com.ruoyi.project.pyzx.education.service.IPyzxMoralDetailsService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 日常德育记录Controller
 * 
 * @author 落叶
 * @date 2024-08-18
 */
@Controller
@RequestMapping("/pyzxeducation/education")
public class PyzxMoralDetailsController extends BaseController
{
    private String prefix = "pyzxeducation/education";

    @Autowired
    private IPyzxMoralDetailsService pyzxMoralDetailsService;

    @RequiresPermissions("pyzxeducation:education:view")
    @GetMapping()
    public String education()
    {
        return prefix + "/education";
    }

    /**
     * 查询日常德育记录列表
     */
    @RequiresPermissions("pyzxeducation:education:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxMoralDetails pyzxMoralDetails)
    {
        startPage();
        List<PyzxMoralDetails> list = pyzxMoralDetailsService.selectPyzxMoralDetailsList(pyzxMoralDetails);
        return getDataTable(list);
    }

    /**
     * 导出日常德育记录列表
     */
    @RequiresPermissions("pyzxeducation:education:export")
    @Log(title = "日常德育记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxMoralDetails pyzxMoralDetails)
    {
        List<PyzxMoralDetails> list = pyzxMoralDetailsService.selectPyzxMoralDetailsList(pyzxMoralDetails);
        ExcelUtil<PyzxMoralDetails> util = new ExcelUtil<PyzxMoralDetails>(PyzxMoralDetails.class);
        return util.exportExcel(list, "日常德育记录数据");
    }

    /**
     * 新增日常德育记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存日常德育记录
     */
    @RequiresPermissions("pyzxeducation:education:add")
    @Log(title = "日常德育记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxMoralDetails pyzxMoralDetails)
    {
        return toAjax(pyzxMoralDetailsService.insertPyzxMoralDetails(pyzxMoralDetails));
    }

    /**
     * 修改日常德育记录
     */
    @RequiresPermissions("pyzxeducation:education:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PyzxMoralDetails pyzxMoralDetails = pyzxMoralDetailsService.selectPyzxMoralDetailsById(id);
        mmap.put("pyzxMoralDetails", pyzxMoralDetails);
        return prefix + "/edit";
    }

    /**
     * 修改保存日常德育记录
     */
    @RequiresPermissions("pyzxeducation:education:edit")
    @Log(title = "日常德育记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxMoralDetails pyzxMoralDetails)
    {
        return toAjax(pyzxMoralDetailsService.updatePyzxMoralDetails(pyzxMoralDetails));
    }

    /**
     * 删除日常德育记录
     */
    @RequiresPermissions("pyzxeducation:education:remove")
    @Log(title = "日常德育记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxMoralDetailsService.deletePyzxMoralDetailsByIds(ids));
    }
}
