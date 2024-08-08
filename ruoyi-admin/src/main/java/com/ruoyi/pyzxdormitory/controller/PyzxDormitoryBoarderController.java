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
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryBoarder;
import com.ruoyi.pyzxdormitory.service.IPyzxDormitoryBoarderService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 住宿生信息Controller
 * 
 * @author 落叶
 * @date 2024-08-08
 */
@Controller
@RequestMapping("/pyzxdormitory/dormitory")
public class PyzxDormitoryBoarderController extends BaseController
{
    private String prefix = "pyzxdormitory/dormitory";

    @Autowired
    private IPyzxDormitoryBoarderService pyzxDormitoryBoarderService;

    @RequiresPermissions("pyzxdormitory:dormitory:view")
    @GetMapping()
    public String dormitory()
    {
        return prefix + "/dormitory";
    }

    /**
     * 查询住宿生信息列表
     */
    @RequiresPermissions("pyzxdormitory:dormitory:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxDormitoryBoarder pyzxDormitoryBoarder)
    {
        startPage();
        List<PyzxDormitoryBoarder> list = pyzxDormitoryBoarderService.selectPyzxDormitoryBoarderList(pyzxDormitoryBoarder);
        return getDataTable(list);
    }

    /**
     * 导出住宿生信息列表
     */
    @RequiresPermissions("pyzxdormitory:dormitory:export")
    @Log(title = "住宿生信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxDormitoryBoarder pyzxDormitoryBoarder)
    {
        List<PyzxDormitoryBoarder> list = pyzxDormitoryBoarderService.selectPyzxDormitoryBoarderList(pyzxDormitoryBoarder);
        ExcelUtil<PyzxDormitoryBoarder> util = new ExcelUtil<PyzxDormitoryBoarder>(PyzxDormitoryBoarder.class);
        return util.exportExcel(list, "住宿生信息数据");
    }

    /**
     * 新增住宿生信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存住宿生信息
     */
    @RequiresPermissions("pyzxdormitory:dormitory:add")
    @Log(title = "住宿生信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxDormitoryBoarder pyzxDormitoryBoarder)
    {
        return toAjax(pyzxDormitoryBoarderService.insertPyzxDormitoryBoarder(pyzxDormitoryBoarder));
    }

    /**
     * 修改住宿生信息
     */
    @RequiresPermissions("pyzxdormitory:dormitory:edit")
    @GetMapping("/edit/{sid}")
    public String edit(@PathVariable("sid") Long sid, ModelMap mmap)
    {
        PyzxDormitoryBoarder pyzxDormitoryBoarder = pyzxDormitoryBoarderService.selectPyzxDormitoryBoarderBySid(sid);
        mmap.put("pyzxDormitoryBoarder", pyzxDormitoryBoarder);
        return prefix + "/edit";
    }

    /**
     * 修改保存住宿生信息
     */
    @RequiresPermissions("pyzxdormitory:dormitory:edit")
    @Log(title = "住宿生信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxDormitoryBoarder pyzxDormitoryBoarder)
    {
        return toAjax(pyzxDormitoryBoarderService.updatePyzxDormitoryBoarder(pyzxDormitoryBoarder));
    }

    /**
     * 删除住宿生信息
     */
    @RequiresPermissions("pyzxdormitory:dormitory:remove")
    @Log(title = "住宿生信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxDormitoryBoarderService.deletePyzxDormitoryBoarderBySids(ids));
    }
}
