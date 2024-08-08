-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查明细', '2020', '1', '/pyzxdormitory/dormitory', 'C', '0', 'pyzxdormitory:dormitory:view', '#', 'admin', sysdate(), '', null, '宿舍检查明细菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查明细查询', @parentId, '1',  '#',  'F', '0', 'pyzxdormitory:dormitory:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查明细新增', @parentId, '2',  '#',  'F', '0', 'pyzxdormitory:dormitory:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查明细修改', @parentId, '3',  '#',  'F', '0', 'pyzxdormitory:dormitory:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查明细删除', @parentId, '4',  '#',  'F', '0', 'pyzxdormitory:dormitory:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查明细导出', @parentId, '5',  '#',  'F', '0', 'pyzxdormitory:dormitory:export',       '#', 'admin', sysdate(), '', null, '');
