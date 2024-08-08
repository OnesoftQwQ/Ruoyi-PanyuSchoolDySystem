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
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryManage;
import com.ruoyi.pyzxdormitory.service.IPyzxDormitoryManageService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 宿舍Controller
 * 
 * @author 落叶
 * @date 2024-08-08
 */
@Controller
@RequestMapping("/pyzxdormitory/dormitory")
public class PyzxDormitoryManageController extends BaseController
{
    private String prefix = "pyzxdormitory/dormitory";

    @Autowired
    private IPyzxDormitoryManageService pyzxDormitoryManageService;

    @RequiresPermissions("pyzxdormitory:dormitory:view")
    @GetMapping()
    public String dormitory()
    {
        return prefix + "/dormitory";
    }

    /**
     * 查询宿舍列表
     */
    @RequiresPermissions("pyzxdormitory:dormitory:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxDormitoryManage pyzxDormitoryManage)
    {
        startPage();
        List<PyzxDormitoryManage> list = pyzxDormitoryManageService.selectPyzxDormitoryManageList(pyzxDormitoryManage);
        return getDataTable(list);
    }

    /**
     * 导出宿舍列表
     */
    @RequiresPermissions("pyzxdormitory:dormitory:export")
    @Log(title = "宿舍", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxDormitoryManage pyzxDormitoryManage)
    {
        List<PyzxDormitoryManage> list = pyzxDormitoryManageService.selectPyzxDormitoryManageList(pyzxDormitoryManage);
        ExcelUtil<PyzxDormitoryManage> util = new ExcelUtil<PyzxDormitoryManage>(PyzxDormitoryManage.class);
        return util.exportExcel(list, "宿舍数据");
    }

    /**
     * 新增宿舍
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存宿舍
     */
    @RequiresPermissions("pyzxdormitory:dormitory:add")
    @Log(title = "宿舍", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxDormitoryManage pyzxDormitoryManage)
    {
        return toAjax(pyzxDormitoryManageService.insertPyzxDormitoryManage(pyzxDormitoryManage));
    }

    /**
     * 修改宿舍
     */
    @RequiresPermissions("pyzxdormitory:dormitory:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PyzxDormitoryManage pyzxDormitoryManage = pyzxDormitoryManageService.selectPyzxDormitoryManageById(id);
        mmap.put("pyzxDormitoryManage", pyzxDormitoryManage);
        return prefix + "/edit";
    }

    /**
     * 修改保存宿舍
     */
    @RequiresPermissions("pyzxdormitory:dormitory:edit")
    @Log(title = "宿舍", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxDormitoryManage pyzxDormitoryManage)
    {
        return toAjax(pyzxDormitoryManageService.updatePyzxDormitoryManage(pyzxDormitoryManage));
    }

    /**
     * 删除宿舍
     */
    @RequiresPermissions("pyzxdormitory:dormitory:remove")
    @Log(title = "宿舍", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxDormitoryManageService.deletePyzxDormitoryManageByIds(ids));
    }
}
