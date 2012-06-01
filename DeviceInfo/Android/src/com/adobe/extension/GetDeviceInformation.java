package com.adobe.extension;

import android.app.Activity;

import android.bluetooth.BluetoothAdapter;

import android.os.Build;
import android.provider.Settings.Secure;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class GetDeviceInformation implements FREFunction {

	@Override
	public FREObject call(FREContext arg0, FREObject[] arg1) {
		
		FREObject returnDeviceStats = null;
		DeviceInfoExtensionContext divExtContext = (DeviceInfoExtensionContext) arg0;

		Activity a = divExtContext.getActivity();
		
		
	   final String android_id = Secure.getString( a.getContentResolver(), Secure.ANDROID_ID);
	   
	 
		Log.e("AIR_DeviceInfoNE", "GetDeviceInformationFunction called");
		try
		{
			
		FREObject DeviceName = FREObject.newObject(BluetoothAdapter.getDefaultAdapter().getName());
		//FREObject DeviceName = FREObject.newObject("BluetoothAdapter.getDefaultAdapter().getName()");
		FREObject SystemName = FREObject.newObject("Android OS");
		FREObject UID = FREObject.newObject(android_id);
		FREObject DeviceManufacture = FREObject.newObject(Build.MANUFACTURER);
		FREObject DeviceModel = FREObject.newObject(Build.MODEL);
		FREObject OsVersion = FREObject.newObject(Build.VERSION.RELEASE);
		
		FREObject[] deviceStatsArray = { DeviceName,UID,SystemName,OsVersion,DeviceManufacture,DeviceModel };
		
		returnDeviceStats = FREObject.newObject("com.adobe.nativeExtension.DeviceInfo.DeviceStats",deviceStatsArray );
		
		}
		catch (Exception e) {
			Log.e("AIR_VibratorNE",e.getMessage());
			returnDeviceStats = null;
		}
		
		return returnDeviceStats;
	}

	

}
