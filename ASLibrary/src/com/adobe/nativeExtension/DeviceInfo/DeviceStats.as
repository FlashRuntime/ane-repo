package com.adobe.nativeExtension.DeviceInfo
{
	public class DeviceStats
		
	{
		private var _name:String = "";
		private var _uniqueId:String = "";
		private var _systemName:String = "";
		private var _systemVersion:String = "";
		private var _manufacturer:String = "";
		private var _model:String = "";
		
		
		public function DeviceStats(name:String,uId:String,sysName:String,sysVer:String,manfactr:String,modl:String)
		{
			_name=name;
			_uniqueId=uId;
			_systemName=sysName;
			_systemVersion=sysVer;
			_manufacturer=manfactr;
			_model=modl;
			
		}
		public function get name():String
		{
			return(_name);
		}
		
		public function get uniqueId():String
		{
			return(_uniqueId);
		}
		public function get systemName():String
		{
			return (_systemName);
		}
		public function get systemVersion():String
		{
			return (_systemVersion);
		}
		public function get manufacturer():String
		{
			return (_manufacturer);
		}
		public function get model():String
		{
			return (_model);
		}
	}
}