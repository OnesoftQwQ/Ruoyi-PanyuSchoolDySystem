package com.ruoyi.project.pyzx.student.controller;

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
import com.ruoyi.project.pyzx.student.domain.PyzxStudent;
import com.ruoyi.project.pyzx.student.service.IPyzxStudentService;
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
@RequestMapping("/pyzxInformation/student")
public class PyzxStudentController extends BaseController
{
    private String prefix = "pyzxInformation/student";

    @Autowired
    private IPyzxStudentService pyzxStudentService;

    @RequiresPermissions("pyzxInformation:student:view")
    @GetMapping()
    public String student()
    {
        return prefix + "/student";
    }

    /**
     * 查询学生信息列表
     */
    @RequiresPermissions("pyzxInformation:student:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxStudent pyzxStudent)
    {
        startPage();
        List<PyzxStudent> list = pyzxStudentService.selectPyzxStudentList(pyzxStudent);
        return getDataTable(list);
    }

    /**
     * 导出学生信息列表
     */
    @RequiresPermissions("pyzxInformation:student:export")
    @Log(title = "学生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxStudent pyzxStudent)
    {
        List<PyzxStudent> list = pyzxStudentService.selectPyzxStudentList(pyzxStudent);
        ExcelUtil<PyzxStudent> util = new ExcelUtil<PyzxStudent>(PyzxStudent.class);
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
    @RequiresPermissions("pyzxInformation:student:add")
    @Log(title = "学生信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxStudent pyzxStudent)
    {
        return toAjax(pyzxStudentService.insertPyzxStudent(pyzxStudent));
    }

    /**
     * 修改学生信息
     */
    @RequiresPermissions("pyzxInformation:student:edit")
    @GetMapping("/edit/{studentId}")
    public String edit(@PathVariable("studentId") Long studentId, ModelMap mmap)
    {
        PyzxStudent pyzxStudent = pyzxStudentService.selectPyzxStudentByStudentId(studentId);
        mmap.put("pyzxStudent", pyzxStudent);
        return prefix + "/edit";
    }

    /**
     * 修改保存学生信息
     */
    @RequiresPermissions("pyzxInformation:student:edit")
    @Log(title = "学生信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxStudent pyzxStudent)
    {
        return toAjax(pyzxStudentService.updatePyzxStudent(pyzxStudent));
    }

    /**
     * 删除学生信息
     */
    @RequiresPermissions("pyzxInformation:student:remove")
    @Log(title = "学生信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxStudentService.deletePyzxStudentByStudentIds(ids));
    }
}
