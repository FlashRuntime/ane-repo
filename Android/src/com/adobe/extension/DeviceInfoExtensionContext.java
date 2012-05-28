package com.adobe.extension;

import java.util.HashMap;
import java.util.Map;

import com.adobe.extension.GetDeviceInformation;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class DeviceInfoExtensionContext extends FREContext {

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		
		Log.e("AIR_DeviceInfoNE", "Map function called");
		
		Map<String, FREFunction> functionMap=new HashMap<String, FREFunction>();
		
		functionMap.put("getDeviceStats", new GetDeviceInformation());
		return functionMap;
	}

}
