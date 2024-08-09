package com.ruoyi.project.system.information.controller;

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
import com.ruoyi.project.system.information.domain.PyzxStudentInformation;
import com.ruoyi.project.system.information.service.IPyzxStudentInformationService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 学生信息Controller
 * 
 * @author 落叶
 * @date 2024-08-09
 */
@Controller
@RequestMapping("/system/information")
public class PyzxStudentInformationController extends BaseController
{
    private String prefix = "system/information";

    @Autowired
    private IPyzxStudentInformationService pyzxStudentInformationService;

    @RequiresPermissions("system:information:view")
    @GetMapping()
    public String information()
    {
        return prefix + "/information";
    }

    /**
     * 查询学生信息列表
     */
    @RequiresPermissions("system:information:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxStudentInformation pyzxStudentInformation)
    {
        startPage();
        List<PyzxStudentInformation> list = pyzxStudentInformationService.selectPyzxStudentInformationList(pyzxStudentInformation);
        return getDataTable(list);
    }

    /**
     * 导出学生信息列表
     */
    @RequiresPermissions("system:information:export")
    @Log(title = "学生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxStudentInformation pyzxStudentInformation)
    {
        List<PyzxStudentInformation> list = pyzxStudentInformationService.selectPyzxStudentInformationList(pyzxStudentInformation);
        ExcelUtil<PyzxStudentInformation> util = new ExcelUtil<PyzxStudentInformation>(PyzxStudentInformation.class);
        return util.exportExcel(list, "学生信息数据");
    }

    /**
     * 新增学生信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存学生信息
     */
    @RequiresPermissions("system:information:add")
    @Log(title = "学生信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxStudentInformation pyzxStudentInformation)
    {
        return toAjax(pyzxStudentInformationService.insertPyzxStudentInformation(pyzxStudentInformation));
    }

    /**
     * 修改学生信息
     */
    @RequiresPermissions("system:information:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PyzxStudentInformation pyzxStudentInformation = pyzxStudentInformationService.selectPyzxStudentInformationById(id);
        mmap.put("pyzxStudentInformation", pyzxStudentInformation);
        return prefix + "/edit";
    }

    /**
     * 修改保存学生信息
     */
    @RequiresPermissions("system:information:edit")
    @Log(title = "学生信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxStudentInformation pyzxStudentInformation)
    {
        return toAjax(pyzxStudentInformationService.updatePyzxStudentInformation(pyzxStudentInformation));
    }

    /**
     * 删除学生信息
     */
    @RequiresPermissions("system:information:remove")
    @Log(title = "学生信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxStudentInformationService.deletePyzxStudentInformationByIds(ids));
    }
}
