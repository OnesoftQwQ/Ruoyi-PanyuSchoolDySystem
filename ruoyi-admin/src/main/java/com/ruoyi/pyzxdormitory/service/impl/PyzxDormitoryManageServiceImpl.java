package com.ruoyi.pyzxdormitory.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryBoarder;
import com.ruoyi.pyzxdormitory.mapper.PyzxDormitoryManageMapper;
import com.ruoyi.pyzxdormitory.domain.PyzxDormitoryManage;
import com.ruoyi.pyzxdormitory.service.IPyzxDormitoryManageService;
import com.ruoyi.common.core.text.Convert;

/**
 * 宿舍Service业务层处理
 * 
 * @author 落叶
 * @date 2024-08-08
 */
@Service
public class PyzxDormitoryManageServiceImpl implements IPyzxDormitoryManageService 
{
    @Autowired
    private PyzxDormitoryManageMapper pyzxDormitoryManageMapper;

    /**
     * 查询宿舍
     * 
     * @param id 宿舍主键
     * @return 宿舍
     */
    @Override
    public PyzxDormitoryManage selectPyzxDormitoryManageById(Long id)
    {
        return pyzxDormitoryManageMapper.selectPyzxDormitoryManageById(id);
    }

    /**
     * 查询宿舍列表
     * 
     * @param pyzxDormitoryManage 宿舍
     * @return 宿舍
     */
    @Override
    public List<PyzxDormitoryManage> selectPyzxDormitoryManageList(PyzxDormitoryManage pyzxDormitoryManage)
    {
        return pyzxDormitoryManageMapper.selectPyzxDormitoryManageList(pyzxDormitoryManage);
    }

    /**
     * 新增宿舍
     * 
     * @param pyzxDormitoryManage 宿舍
     * @return 结果
     */
    @Transactional
    @Override
    public int insertPyzxDormitoryManage(PyzxDormitoryManage pyzxDormitoryManage)
    {
        pyzxDormitoryManage.setCreateTime(DateUtils.getNowDate());
        int rows = pyzxDormitoryManageMapper.insertPyzxDormitoryManage(pyzxDormitoryManage);
        insertPyzxDormitoryBoarder(pyzxDormitoryManage);
        return rows;
    }

    /**
     * 修改宿舍
     * 
     * @param pyzxDormitoryManage 宿舍
     * @return 结果
     */
    @Transactional
    @Override
    public int updatePyzxDormitoryManage(PyzxDormitoryManage pyzxDormitoryManage)
    {
        pyzxDormitoryManage.setUpdateTime(DateUtils.getNowDate());
        pyzxDormitoryManageMapper.deletePyzxDormitoryBoarderBySid(pyzxDormitoryManage.getId());
        insertPyzxDormitoryBoarder(pyzxDormitoryManage);
        return pyzxDormitoryManageMapper.updatePyzxDormitoryManage(pyzxDormitoryManage);
    }

    /**
     * 批量删除宿舍
     * 
     * @param ids 需要删除的宿舍主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deletePyzxDormitoryManageByIds(String ids)
    {
        pyzxDormitoryManageMapper.deletePyzxDormitoryBoarderBySids(Convert.toStrArray(ids));
        return pyzxDormitoryManageMapper.deletePyzxDormitoryManageByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除宿舍信息
     * 
     * @param id 宿舍主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deletePyzxDormitoryManageById(Long id)
    {
        pyzxDormitoryManageMapper.deletePyzxDormitoryBoarderBySid(id);
        return pyzxDormitoryManageMapper.deletePyzxDormitoryManageById(id);
    }

    /**
     * 新增住宿生信息信息
     * 
     * @param pyzxDormitoryManage 宿舍对象
     */
    public void insertPyzxDormitoryBoarder(PyzxDormitoryManage pyzxDormitoryManage)
    {
        List<PyzxDormitoryBoarder> pyzxDormitoryBoarderList = pyzxDormitoryManage.getPyzxDormitoryBoarderList();
        Long id = pyzxDormitoryManage.getId();
        if (StringUtils.isNotNull(pyzxDormitoryBoarderList))
        {
            List<PyzxDormitoryBoarder> list = new ArrayList<PyzxDormitoryBoarder>();
            for (PyzxDormitoryBoarder pyzxDormitoryBoarder : pyzxDormitoryBoarderList)
            {
                pyzxDormitoryBoarder.setSid(id);
                list.add(pyzxDormitoryBoarder);
            }
            if (list.size() > 0)
            {
                pyzxDormitoryManageMapper.batchPyzxDormitoryBoarder(list);
            }
        }
    }
}
