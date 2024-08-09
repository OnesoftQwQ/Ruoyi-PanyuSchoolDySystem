package com.ruoyi.project.system.student.controller;

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
import com.ruoyi.project.system.student.domain.PyzxTalkwithStudent;
import com.ruoyi.project.system.student.service.IPyzxTalkwithStudentService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 谈心谈话记录Controller
 * 
 * @author ruoyi
 * @date 2024-08-09
 */
@Controller
@RequestMapping("/system/student")
public class PyzxTalkwithStudentController extends BaseController
{
    private String prefix = "system/student";

    @Autowired
    private IPyzxTalkwithStudentService pyzxTalkwithStudentService;

    @RequiresPermissions("system:student:view")
    @GetMapping()
    public String student()
    {
        return prefix + "/student";
    }

    /**
     * 查询谈心谈话记录列表
     */
    @RequiresPermissions("system:student:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxTalkwithStudent pyzxTalkwithStudent)
    {
        startPage();
        List<PyzxTalkwithStudent> list = pyzxTalkwithStudentService.selectPyzxTalkwithStudentList(pyzxTalkwithStudent);
        return getDataTable(list);
    }

    /**
     * 导出谈心谈话记录列表
     */
    @RequiresPermissions("system:student:export")
    @Log(title = "谈心谈话记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxTalkwithStudent pyzxTalkwithStudent)
    {
        List<PyzxTalkwithStudent> list = pyzxTalkwithStudentService.selectPyzxTalkwithStudentList(pyzxTalkwithStudent);
        ExcelUtil<PyzxTalkwithStudent> util = new ExcelUtil<PyzxTalkwithStudent>(PyzxTalkwithStudent.class);
        return util.exportExcel(list, "谈心谈话记录数据");
    }

    /**
     * 新增谈心谈话记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存谈心谈话记录
     */
    @RequiresPermissions("system:student:add")
    @Log(title = "谈心谈话记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxTalkwithStudent pyzxTalkwithStudent)
    {
        return toAjax(pyzxTalkwithStudentService.insertPyzxTalkwithStudent(pyzxTalkwithStudent));
    }

    /**
     * 修改谈心谈话记录
     */
    @RequiresPermissions("system:student:edit")
    @GetMapping("/edit/{itemId}")
    public String edit(@PathVariable("itemId") Long itemId, ModelMap mmap)
    {
        PyzxTalkwithStudent pyzxTalkwithStudent = pyzxTalkwithStudentService.selectPyzxTalkwithStudentByItemId(itemId);
        mmap.put("pyzxTalkwithStudent", pyzxTalkwithStudent);
        return prefix + "/edit";
    }

    /**
     * 修改保存谈心谈话记录
     */
    @RequiresPermissions("system:student:edit")
    @Log(title = "谈心谈话记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxTalkwithStudent pyzxTalkwithStudent)
    {
        return toAjax(pyzxTalkwithStudentService.updatePyzxTalkwithStudent(pyzxTalkwithStudent));
    }

    /**
     * 删除谈心谈话记录
     */
    @RequiresPermissions("system:student:remove")
    @Log(title = "谈心谈话记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxTalkwithStudentService.deletePyzxTalkwithStudentByItemIds(ids));
    }
}
