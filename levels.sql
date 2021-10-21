#1 level
select name,employeeid,managerid,level,SYS_CONNECT_BY_PATH(name, '/') "Path",CONNECT_BY_ISCYCLE "Cycle",weight,imei,lokasyon
from employee
CONNECT BY NOCYCLE PRIOR employeeid=managerid and level<=1;

#2 level
select name,employeeid,managerid,level,SYS_CONNECT_BY_PATH(name, '/') "Path",CONNECT_BY_ISCYCLE "Cycle",weight,imei,lokasyon
from employee
CONNECT BY NOCYCLE PRIOR employeeid=managerid and level<=2;

#3 level
select name,employeeid,managerid,level,SYS_CONNECT_BY_PATH(name, '/') "Path",CONNECT_BY_ISCYCLE "Cycle",weight,imei,lokasyon
from employee
CONNECT BY NOCYCLE PRIOR employeeid=managerid and level<=3;
