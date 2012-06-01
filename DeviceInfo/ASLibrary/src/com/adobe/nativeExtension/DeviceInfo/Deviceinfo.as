package com.adobe.nativeExtension.DeviceInfo
{
	
	import flash.external.ExtensionContext;
	import mx.core.mx_internal;
	
	public class Deviceinfo
	{  
		
		private var extContext:ExtensionContext = null;
		private static var _instance:Deviceinfo = null;
		private static var _flag:Boolean = false;
		
		
		public function Deviceinfo()
		{
		  if (_flag)
		  {
			  extContext = ExtensionContext.createExtensionContext("com.adobe.Deviceinfo",null);
		  }
		  else
		  {
			  throw new Error("Error! Class can't be instantiated");
		  }
		}
		
		public static function get deviceinfo():Deviceinfo
		{ if(_instance == null)
			{
			_flag = true;
			_instance = new Deviceinfo();
			_flag = false;
			}
			return _instance;
		}
		
		public function deviceInformation ():DeviceStats
		{
			var dstat:DeviceStats = extContext.call("getDeviceStats") as DeviceStats ;
		
			return dstat;
		}
	}
}