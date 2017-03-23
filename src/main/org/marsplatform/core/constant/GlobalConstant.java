package org.marsplatform.core.constant;

/**
 * 常量
 * 
 */
public class GlobalConstant {

	/**
     * 定时任务状态
     * 
     */
    public enum ScheduleStatus {
        /**
         * 正常
         */
    	NORMAL(0),
        /**
         * 暂停
         */
    	PAUSE(1);

        private int value;

        private ScheduleStatus(int value) {
            this.value = value;
        }
        
        public int getValue() {
            return value;
        }
    }
}
