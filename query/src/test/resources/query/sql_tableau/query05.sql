SELECT SUM("TableauSQL"."GMV") AS "sum_GMV_ok", 
 SUM("TableauSQL"."TRANS_CNT") AS "sum_TRANS_CNT_ok" 
 FROM ( 
 SELECT 
 test_cal_dt.week_beg_dt 
 ,test_category_groupings.meta_categ_name 
 ,test_category_groupings.categ_lvl2_name 
 ,test_category_groupings.categ_lvl3_name 
 ,sum(test_kylin_fact.price) as GMV 
 , count(*) as TRANS_CNT 
 FROM test_kylin_fact 
 inner JOIN test_cal_dt 
 ON test_kylin_fact.cal_dt = test_cal_dt.cal_dt 
 inner JOIN test_category_groupings 
 ON test_kylin_fact.leaf_categ_id = test_category_groupings.leaf_categ_id 
 AND test_kylin_fact.lstg_site_id = test_category_groupings.site_id 
 group by test_cal_dt.week_beg_dt 
 ,test_category_groupings.meta_categ_name 
 ,test_category_groupings.categ_lvl2_name 
 ,test_category_groupings.categ_lvl3_name 
 ) "TableauSQL" 
 HAVING (COUNT(1) > 0) 
