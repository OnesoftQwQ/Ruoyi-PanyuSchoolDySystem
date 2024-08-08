-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查', '2020', '1', '/pyzxdormitory/dormitorysushe', 'C', '0', 'pyzxdormitory:dormitorysushe:view', '#', 'admin', sysdate(), '', null, '宿舍检查菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查查询', @parentId, '1',  '#',  'F', '0', 'pyzxdormitory:dormitorysushe:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查新增', @parentId, '2',  '#',  'F', '0', 'pyzxdormitory:dormitorysushe:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查修改', @parentId, '3',  '#',  'F', '0', 'pyzxdormitory:dormitorysushe:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查删除', @parentId, '4',  '#',  'F', '0', 'pyzxdormitory:dormitorysushe:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('宿舍检查导出', @parentId, '5',  '#',  'F', '0', 'pyzxdormitory:dormitorysushe:export',       '#', 'admin', sysdate(), '', null, '');
