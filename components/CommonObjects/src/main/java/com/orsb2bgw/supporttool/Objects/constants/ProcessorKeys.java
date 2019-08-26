package com.orsb2bgw.supporttool.Objects.constants;

public enum ProcessorKeys {
	
	    WORKLIST_PROCESSOR("work_list"),
	    USERMANAGEMENT_PROCESSOR("user_Management"),
	    SESSIONMANAGEMENT_PROCESSOR("session_management"),
	    SUPPORTTOOLLIST("user-SupportToolList")
	    ;

	    private final String proKey;

	    /**
	     * @param text
	     */
	    private ProcessorKeys(final String proKey) {
	        this.proKey = proKey;
	    }

	    @Override
	    public String toString() {
	        return proKey;
	    }
	

}
