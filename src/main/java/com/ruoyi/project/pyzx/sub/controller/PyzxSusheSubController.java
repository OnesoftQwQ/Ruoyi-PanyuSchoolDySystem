package com.ruoyi.project.pyzx.sub.controller;

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
import com.ruoyi.project.pyzx.sub.domain.PyzxSusheSub;
import com.ruoyi.project.pyzx.sub.service.IPyzxSusheSubService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 宿舍检查明细Controller
 * 
 * @author 落叶
 * @date 2024-08-18
 */
@Controller
@RequestMapping("/pyzxsub/sub")
public class PyzxSusheSubController extends BaseController
{
    private String prefix = "pyzxsub/sub";

    @Autowired
    private IPyzxSusheSubService pyzxSusheSubService;

    @RequiresPermissions("pyzxsub:sub:view")
    @GetMapping()
    public String sub()
    {
        return prefix + "/sub";
    }

    /**
     * 查询宿舍检查明细列表
     */
    @RequiresPermissions("pyzxsub:sub:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxSusheSub pyzxSusheSub)
    {
        startPage();
        List<PyzxSusheSub> list = pyzxSusheSubService.selectPyzxSusheSubList(pyzxSusheSub);
        return getDataTable(list);
    }

    /**
     * 导出宿舍检查明细列表
     */
    @RequiresPermissions("pyzxsub:sub:export")
    @Log(title = "宿舍检查明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxSusheSub pyzxSusheSub)
    {
        List<PyzxSusheSub> list = pyzxSusheSubService.selectPyzxSusheSubList(pyzxSusheSub);
        ExcelUtil<PyzxSusheSub> util = new ExcelUtil<PyzxSusheSub>(PyzxSusheSub.class);
        return util.exportExcel(list, "宿舍检查明细数据");
    }

    /**
     * 新增宿舍检查明细
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存宿舍检查明细
     */
    @RequiresPermissions("pyzxsub:sub:add")
    @Log(title = "宿舍检查明细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxSusheSub pyzxSusheSub)
    {
        return toAjax(pyzxSusheSubService.insertPyzxSusheSub(pyzxSusheSub));
    }

    /**
     * 修改宿舍检查明细
     */
    @RequiresPermissions("pyzxsub:sub:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PyzxSusheSub pyzxSusheSub = pyzxSusheSubService.selectPyzxSusheSubById(id);
        mmap.put("pyzxSusheSub", pyzxSusheSub);
        return prefix + "/edit";
    }

    /**
     * 修改保存宿舍检查明细
     */
    @RequiresPermissions("pyzxsub:sub:edit")
    @Log(title = "宿舍检查明细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxSusheSub pyzxSusheSub)
    {
        return toAjax(pyzxSusheSubService.updatePyzxSusheSub(pyzxSusheSub));
    }

    /**
     * 删除宿舍检查明细
     */
    @RequiresPermissions("pyzxsub:sub:remove")
    @Log(title = "宿舍检查明细", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxSusheSubService.deletePyzxSusheSubByIds(ids));
    }
}
