--an example of SQL-based first run. We do not use this.

INSERT INTO APP_SETTINGS(SETUP_DATE) VALUES(CURRENT TIMESTAMP);

--Users and Roles
--default users: admin/admin and user/user
INSERT INTO APP_ROLE(ROLE_NAME, DESCRIPTION) VALUES('Admin', 'Webapp administrator');
INSERT INTO APP_ROLE(ROLE_NAME, DESCRIPTION) VALUES('Standard', 'Standard user');

--INSERT INTO APP_USER(USERNAME, EMAIL, ACTIVE, PASSWD, NAME, SURNAME) VALUES('admin', 'admin@example.com', 1, 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Admin', '.');
--INSERT INTO APP_USER(USERNAME, EMAIL, ACTIVE, PASSWD, NAME, SURNAME) VALUES('user', 'user@example.com', 1, '12dea96fec20593566ab75692c9949596833adc9', 'User', '.');
INSERT INTO APP_USER(USERNAME, EMAIL, ACTIVE, PASSWD, NAME, SURNAME) VALUES('admin', 'admin@example.com', 1, '$31$16$xJXF6nlLm-nXHjAqaTDPn4GAbPZZnSjIjX-DkgYCjIo', 'Admin', '.');
INSERT INTO APP_USER(USERNAME, EMAIL, ACTIVE, PASSWD, NAME, SURNAME) VALUES('user', 'user@example.com', 1, '$31$16$OFChSfoVCK-W7vjiLCjrk1uhROzUY02ZsQcLMxOpZkc', 'User', '.');
INSERT INTO APP_USER_ROLES(USER_ID, ROLE_ID) SELECT U.ID, R.ID FROM APP_USER U, APP_ROLE R WHERE U.USERNAME='admin' AND R.ROLE_NAME='admin';
INSERT INTO APP_USER_ROLES(USER_ID, ROLE_ID) SELECT U.ID, R.ID FROM APP_USER U, APP_ROLE R WHERE U.USERNAME='user' AND R.ROLE_NAME='standard';

--Menus, Pages, Authorizations
INSERT INTO APP_MENU(DESCRIPTION, ORDERING) VALUES('menu.section_general', 10);
INSERT INTO APP_MENU(DESCRIPTION, ORDERING) VALUES('menu.section_liveon', 20);

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.home', 'home', 10, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_general';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.dashboard', 'index.jsp', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.dashboard2', 'index2.jsp', 20);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.dashboard3', 'index3.jsp', 30);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION='menu.home' AND P.DESCRIPTION LIKE 'page.dashboard%';

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.admin', 'table', 15, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_general';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.crud_users', 'crud.jsp?entity=User', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.crud_roles', 'crud.jsp?entity=Role', 20);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.crud_pages', 'crud.jsp?entity=Page', 30);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.crud_menus', 'crud.jsp?entity=Menu', 40);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION='menu.admin' AND P.DESCRIPTION LIKE 'page.crud%';
INSERT INTO APP_PAGE_ROLES(PAGE_ID, ROLE_ID) SELECT P.ID, R.ID FROM APP_PAGE P, APP_ROLE R WHERE P.DESCRIPTION LIKE 'page.crud%' AND R.DESCRIPTION='Admin';

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.tables', 'table', 20, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_general';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.tables', 'tables.jsp', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.tables_dynamic', 'tables_dynamic.jsp', 20);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION='menu.tables' AND P.DESCRIPTION LIKE 'page.table%';

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.forms', 'edit', 30, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_general';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.form', 'form.jsp', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.form_advanced', 'form_advanced.jsp', 20);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.form_validation', 'form_validation.jsp', 30);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.form_wizards', 'form_wizards.jsp', 40);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.form_upload', 'form_upload.jsp', 50);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.form_buttons', 'form_buttons.jsp', 60);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION='menu.forms' AND P.DESCRIPTION LIKE 'page.form%';

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.ui_elements', 'desktop', 40, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_general';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_general_elements', 'general_elements.jsp', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_media_gallery', 'media_gallery.jsp', 20);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_typography', 'typography.jsp', 30);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_icons', 'icons.jsp', 40);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_glyphicons', 'glyphicons.jsp', 50);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_widgets', 'widgets.jsp', 60);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_invoice', 'invoice.jsp', 70);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_inbox', 'inbox.jsp', 80);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.ui_calendar', 'calendar.jsp', 90);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION='menu.ui_elements' AND P.DESCRIPTION LIKE 'page.ui%';

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.data_presentation', 'bar-chart-o', 50, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_general';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.chartjs', 'chartjs.jsp', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.chartjs2', 'chartjs2.jsp', 20);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.morisjs', 'morisjs.jsp', 30);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.echarts', 'echarts.jsp', 40);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.charts_other', 'other_charts.jsp', 50);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION='menu.data_presentation' AND (P.DESCRIPTION LIKE 'page%chart%' OR P.DESCRIPTION = 'page.morisjs');

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.layouts', 'clone', 60, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_general';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.layout_fixed_sidebar', 'fixed_sidebar.jsp', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.layout_fixed_footer', 'fixed_footer.jsp', 20);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION='menu.layouts' AND P.DESCRIPTION LIKE 'page.layout%';


INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.more', 'bug', 10, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_liveon';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.e_commerce', 'e_commerce.jsp', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.project', 'projects.jsp', 20);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.project_detail', 'project_detail.jsp', 30);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.contacts', 'contacts.jsp', 40);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.profile', 'profile.jsp', 50);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.more' AND P.DESCRIPTION = 'page.e_commerce';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.more' AND P.DESCRIPTION = 'page.projects';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.more' AND P.DESCRIPTION = 'page.project_detail';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.more' AND P.DESCRIPTION = 'page.contacts';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.more' AND P.DESCRIPTION = 'page.profile';

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.multilevel', 'sitemap', 20, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_liveon';
INSERT INTO APP_MENU(DESCRIPTION, ORDERING, PARENT_MENU_ID) SELECT 'menu.level_one_a', 10, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.multilevel';
INSERT INTO APP_MENU(DESCRIPTION, ORDERING, PARENT_MENU_ID) SELECT 'menu.level_one_b', 20, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.multilevel';
INSERT INTO APP_MENU(DESCRIPTION, ORDERING, PARENT_MENU_ID) SELECT 'menu.level_one_c', 30, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.multilevel';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.level_two', 'level2.jsp', 10);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION LIKE 'menu.level_one%' AND P.DESCRIPTION = 'page.level_two';

INSERT INTO APP_MENU(DESCRIPTION, ICON, ORDERING, PARENT_MENU_ID) SELECT 'menu.extras', 'bug', 30, M.ID FROM APP_MENU M WHERE DESCRIPTION='menu.section_liveon';
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.error403', 'page_403.jps', 10);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.error404', 'page_404.jsp', 20);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.error500', 'page_500.jsp', 30);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.plain', 'plain_page.jsp', 40);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.login', 'login.jsp', 50);
INSERT INTO APP_PAGE(DESCRIPTION, URL, ORDERING) VALUES('page.pricing_tables', 'pricing_tables.jsp', 60);
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.extras' AND P.DESCRIPTION = 'page.error403';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.extras' AND P.DESCRIPTION = 'page.error404';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.extras' AND P.DESCRIPTION = 'page.error500';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.extras' AND P.DESCRIPTION = 'page.plain';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.extras' AND P.DESCRIPTION = 'page.login';
INSERT INTO APP_MENU_PAGES(MENU_ID, PAGE_ID) SELECT M.ID, P.ID FROM APP_MENU M, APP_PAGE P WHERE M.DESCRIPTION = 'menu.extras' AND P.DESCRIPTION = 'page.pricing_tables';

--Grids
INSERT INTO APP_GRID(ENTITY, DESCRIPTION) VALUES ('Role', 'grid.role.default')
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'id', 'grid.role.id', 10, 1 FROM APP_GRID G WHERE G.DESCRIPTION='grid.role.default';
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'description', 'grid.role.description', 20, 0 FROM APP_GRID G WHERE G.DESCRIPTION='grid.role.default';

INSERT INTO APP_GRID(ENTITY, DESCRIPTION) VALUES ('User', 'grid.user.default')
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'id', 'grid.user.id', 10, 1 FROM APP_GRID G WHERE G.DESCRIPTION='grid.user.default';
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'name', 'grid.user.username', 20, 0 FROM APP_GRID G WHERE G.DESCRIPTION='grid.user.default';
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'personName', 'grid.user.name', 30, 0 FROM APP_GRID G WHERE G.DESCRIPTION='grid.user.default';
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'personSurname', 'grid.user.surname', 40, 0 FROM APP_GRID G WHERE G.DESCRIPTION='grid.user.default';

INSERT INTO APP_GRID(ENTITY, DESCRIPTION) VALUES ('Page', 'grid.page.default')
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'id', 'grid.page.id', 10, 1 FROM APP_GRID G WHERE G.DESCRIPTION='grid.page.default';
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'description', 'grid.page.description', 20, 0 FROM APP_GRID G WHERE G.DESCRIPTION='grid.page.default';

INSERT INTO APP_GRID(ENTITY, DESCRIPTION) VALUES ('Menu', 'grid.menu.default')
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'id', 'grid.menu.id', 10, 1 FROM APP_GRID G WHERE G.DESCRIPTION='grid.menu.default';
INSERT INTO APP_GRID_COLUMN(GRID_ID, COL_DEF, DESCRIPTION, ORDERING, READ_ONLY) SELECT G.ID, 'description', 'grid.menu.description', 20, 0 FROM APP_GRID G WHERE G.DESCRIPTION='grid.menu.default';
