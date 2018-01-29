package com.sinosoft.test.task;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sinosoft.app.common.service.AppCommonService;

/**
 * 测试定时任务
 * 
 * <br>
 * @author cmh
 * @version 2014-10-28 上午11:31:11
 */
@SuppressWarnings("all")
@Component
public class TeCommonTask {
	protected final Logger log = Logger.getLogger(getClass());// 日志
	
	@Autowired
	private AppCommonService appCommonService;// 服务
	
	/**
	 * 心跳
	 * 
	 * <pre><pre>
	 * @author cmh
	 * @since 2016年10月19日 下午6:40:37
	 * @version 1.0
	 */
//	@Scheduled(cron="5,15,25,35,45 * * * * ?") 
    public void sayHello(){
    	log.info("sayHello:ok");
    	
//    	Map<String, String> map = System.getenv();
//    	for(Iterator<String> itr = map.keySet().iterator();itr.hasNext();){
//    		String key = itr.next();
//    		System.out.println(key + "=" + map.get(key)+"<br>");
//    	}

    	
//		List dList = appCommonService.find("from TSDemo ");
//		System.out.println("hibernate获取："+dList.size());
//		
//		int count = appCommonService.getJdbcTemplate().queryForInt("select count(*) from t_s_demo ");
//		System.out.println("Spring Jdbc获取："+count);
    }
	
}
