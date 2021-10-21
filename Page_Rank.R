require(sqldf)
edg<-read.table('veriseti.txt',header=TRUE)
b<-sqldf('select distinct managerid from edg union select distinct employeeid from edg')
nodeNum<-nrow(b)
say<-data.frame()
for(i in 1:nrow(b)){say<-rbind(say,nodeNum)}
   pr<-1/say
   pr<-data.frame(b,pr)
   pr<-data.frame(pr,say)
colnames(pr)<-c("managerid","pr","nodeNum")
weight<-sqldf('select edg.managerid,1.00/count(employeeid) as wei from edg group by edg.employeeid')
edgWithOuterDegree<-sqldf('select edg.managerid,edg.employeeid,weight.wei from edg join weight on edg.managerid=weight.managerid')
repeat
{
     pagerank1<-sqldf('select edgWithOuterDegree.employeeid as src,sum(pr.pr*edgWithOuterDegree.wei*0.85) as pr
     from pr left join edgWithOuterDegree on pr.managerid=edgWithOuterDegree.managerid
     group by edgWithOuterDegree.employeeid')
     currentpagerank<-sqldf('select pr.managerid,0.15/nodeNum+coalesce(pagerank1.pr,0) as pr from pr left join pagerank1 on pr.managerid=pagerank1.src')
     delta<-sum((pr$pr-currentpagerank$pr)^2)
     if(delta<0.01){
         break;
     }
 }
 
 currentpagerank
 

require(igraph)
edg<-read.table('veriseti.txt',header=TRUE)
manageremployeeid<-edg[,2:3]
g<-graph.data.frame(manageremployeeid,directed=TRUE)
page.rank (g, algo = c("power"),directed = TRUE, damping = 0.85,personalized = NULL, weights = NULL, options = NULL) 

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

 
