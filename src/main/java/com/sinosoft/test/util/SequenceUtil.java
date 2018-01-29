package com.sinosoft.test.util;

import com.sinosoft.modules.sys.core.sequence.Sequence;

/**
 * 序列号生成工具类
 * 
 * @author cmh
 * @since 2017年11月22日 下午3:58:27
 * @version 1.0
 */
public class SequenceUtil {

	private static Sequence sequence = new Sequence(0L, 0L);
	
	/**
	 * 获取下一个ID
	 * 
	 * @author cmh
	 * @since 2017年11月22日 下午3:58:51
	 * @version 1.0
	 * @return
	 */
	public static long nextId() {
		return sequence.nextId();
	}
	
}
