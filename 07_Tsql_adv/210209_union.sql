select clubName, buildingNum from clubtbl
union 
select stdName, region from stdtbl;

-- union all
select stdName, region from stdtbl
union 
select stdName, region from stdtbl;

