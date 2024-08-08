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
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryDetail;
import com.ruoyi.pyzxdormitory.service.IPyzxDormitoryDetailService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 宿舍检查明细Controller
 * 
 * @author 落叶
 * @date 2024-08-08
 */
@Controller
@RequestMapping("/pyzxdormitory/dormitory")
public class PyzxDormitoryDetailController extends BaseController
{
    private String prefix = "pyzxdormitory/dormitory";

    @Autowired
    private IPyzxDormitoryDetailService pyzxDormitoryDetailService;

    @RequiresPermissions("pyzxdormitory:dormitory:view")
    @GetMapping()
    public String dormitory()
    {
        return prefix + "/dormitory";
    }

    /**
     * 查询宿舍检查明细列表
     */
    @RequiresPermissions("pyzxdormitory:dormitory:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PyzxDormitoryDetail pyzxDormitoryDetail)
    {
        startPage();
        List<PyzxDormitoryDetail> list = pyzxDormitoryDetailService.selectPyzxDormitoryDetailList(pyzxDormitoryDetail);
        return getDataTable(list);
    }

    /**
     * 导出宿舍检查明细列表
     */
    @RequiresPermissions("pyzxdormitory:dormitory:export")
    @Log(title = "宿舍检查明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PyzxDormitoryDetail pyzxDormitoryDetail)
    {
        List<PyzxDormitoryDetail> list = pyzxDormitoryDetailService.selectPyzxDormitoryDetailList(pyzxDormitoryDetail);
        ExcelUtil<PyzxDormitoryDetail> util = new ExcelUtil<PyzxDormitoryDetail>(PyzxDormitoryDetail.class);
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
    @RequiresPermissions("pyzxdormitory:dormitory:add")
    @Log(title = "宿舍检查明细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PyzxDormitoryDetail pyzxDormitoryDetail)
    {
        return toAjax(pyzxDormitoryDetailService.insertPyzxDormitoryDetail(pyzxDormitoryDetail));
    }

    /**
     * 修改宿舍检查明细
     */
    @RequiresPermissions("pyzxdormitory:dormitory:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        PyzxDormitoryDetail pyzxDormitoryDetail = pyzxDormitoryDetailService.selectPyzxDormitoryDetailById(id);
        mmap.put("pyzxDormitoryDetail", pyzxDormitoryDetail);
        return prefix + "/edit";
    }

    /**
     * 修改保存宿舍检查明细
     */
    @RequiresPermissions("pyzxdormitory:dormitory:edit")
    @Log(title = "宿舍检查明细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PyzxDormitoryDetail pyzxDormitoryDetail)
    {
        return toAjax(pyzxDormitoryDetailService.updatePyzxDormitoryDetail(pyzxDormitoryDetail));
    }

    /**
     * 删除宿舍检查明细
     */
    @RequiresPermissions("pyzxdormitory:dormitory:remove")
    @Log(title = "宿舍检查明细", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(pyzxDormitoryDetailService.deletePyzxDormitoryDetailByIds(ids));
    }
}
