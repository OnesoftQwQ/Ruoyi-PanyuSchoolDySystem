package com.ruoyi.project.pyzx.sub.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.pyzx.sub.mapper.PyzxSusheSubMapper;
import com.ruoyi.project.pyzx.sub.domain.PyzxSusheSub;
import com.ruoyi.project.pyzx.sub.service.IPyzxSusheSubService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 宿舍检查明细Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-18
 */
@Service
public class PyzxSusheSubServiceImpl implements IPyzxSusheSubService 
{
    @Autowired
    private PyzxSusheSubMapper pyzxSusheSubMapper;

    /**
     * 查询宿舍检查明细
     * 
     * @param id 宿舍检查明细主键
     * @return 宿舍检查明细
     */
    @Override
    public PyzxSusheSub selectPyzxSusheSubById(Long id)
    {
        return pyzxSusheSubMapper.selectPyzxSusheSubById(id);
    }

    /**
     * 查询宿舍检查明细列表
     * 
     * @param pyzxSusheSub 宿舍检查明细
     * @return 宿舍检查明细
     */
    @Override
    public List<PyzxSusheSub> selectPyzxSusheSubList(PyzxSusheSub pyzxSusheSub)
    {
        return pyzxSusheSubMapper.selectPyzxSusheSubList(pyzxSusheSub);
    }

    /**
     * 新增宿舍检查明细
     * 
     * @param pyzxSusheSub 宿舍检查明细
     * @return 结果
     */
    @Override
    public int insertPyzxSusheSub(PyzxSusheSub pyzxSusheSub)
    {
        return pyzxSusheSubMapper.insertPyzxSusheSub(pyzxSusheSub);
    }

    /**
     * 修改宿舍检查明细
     * 
     * @param pyzxSusheSub 宿舍检查明细
     * @return 结果
     */
    @Override
    public int updatePyzxSusheSub(PyzxSusheSub pyzxSusheSub)
    {
        return pyzxSusheSubMapper.updatePyzxSusheSub(pyzxSusheSub);
    }

    /**
     * 批量删除宿舍检查明细
     * 
     * @param ids 需要删除的宿舍检查明细主键
     * @return 结果
     */
    @Override
    public int deletePyzxSusheSubByIds(String ids)
    {
        return pyzxSusheSubMapper.deletePyzxSusheSubByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除宿舍检查明细信息
     * 
     * @param id 宿舍检查明细主键
     * @return 结果
     */
    @Override
    public int deletePyzxSusheSubById(Long id)
    {
        return pyzxSusheSubMapper.deletePyzxSusheSubById(id);
    }
}
