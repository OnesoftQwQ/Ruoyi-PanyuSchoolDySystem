package com.ruoyi.pyzxdormitory.controller;

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
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryExamine;
import com.ruoyi.pyzxdormitory.service.IPyzxDormitoryExamineService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 宿舍检查Controller
 * 
 * @author 落叶
 * @date 2024-08-08
 */
@Controller
@RequestMapping("/pyzxdormitory/dormitorysushe")
public class PyzxDormitoryExamineController extends BaseController
{
    private String prefix = "pyzxdormitory/dormitorysushe";

    @Autowired
    private IPyzxDormitoryExamineService pyzxDormitoryExamineService;

    @RequiresPermissions("pyzxdormitory:dormitorysushe:view")
    @GetMapping()
    public String dormitorysushe()
    {
        return prefix + "/dormitorysushe";
    }

    /**
     * 查询宿舍检查列表
     */
    @RequiresPermissions("pyzxdormitory:dormitorysushe:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxDormitoryExamine pyzxDormitoryExamine)
    {
        startPage();
        List<PyzxDormitoryExamine> list = pyzxDormitoryExamineService.selectPyzxDormitoryExamineList(pyzxDormitoryExamine);
        return getDataTable(list);
    }

    /**
     * 导出宿舍检查列表
     */
    @RequiresPermissions("pyzxdormitory:dormitorysushe:export")
    @Log(title = "宿舍检查", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxDormitoryExamine pyzxDormitoryExamine)
    {
        List<PyzxDormitoryExamine> list = pyzxDormitoryExamineService.selectPyzxDormitoryExamineList(pyzxDormitoryExamine);
        ExcelUtil<PyzxDormitoryExamine> util = new ExcelUtil<PyzxDormitoryExamine>(PyzxDormitoryExamine.class);
        return util.exportExcel(list, "宿舍检查数据");
    }

    /**
     * 新增宿舍检查
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存宿舍检查
     */
    @RequiresPermissions("pyzxdormitory:dormitorysushe:add")
    @Log(title = "宿舍检查", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxDormitoryExamine pyzxDormitoryExamine)
    {
        return toAjax(pyzxDormitoryExamineService.insertPyzxDormitoryExamine(pyzxDormitoryExamine));
    }

    /**
     * 修改宿舍检查
     */
    @RequiresPermissions("pyzxdormitory:dormitorysushe:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PyzxDormitoryExamine pyzxDormitoryExamine = pyzxDormitoryExamineService.selectPyzxDormitoryExamineById(id);
        mmap.put("pyzxDormitoryExamine", pyzxDormitoryExamine);
        return prefix + "/edit";
    }

    /**
     * 修改保存宿舍检查
     */
    @RequiresPermissions("pyzxdormitory:dormitorysushe:edit")
    @Log(title = "宿舍检查", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxDormitoryExamine pyzxDormitoryExamine)
    {
        return toAjax(pyzxDormitoryExamineService.updatePyzxDormitoryExamine(pyzxDormitoryExamine));
    }

    /**
     * 删除宿舍检查
     */
    @RequiresPermissions("pyzxdormitory:dormitorysushe:remove")
    @Log(title = "宿舍检查", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxDormitoryExamineService.deletePyzxDormitoryExamineByIds(ids));
    }
}
