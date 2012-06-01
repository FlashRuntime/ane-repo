package
{
	
	import com.adobe.nativeExtension.DeviceInfo.DeviceStats;
	import com.adobe.nativeExtension.DeviceInfo.Deviceinfo;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.geom.Rectangle;
	public class devinfo extends Sprite
	{
		private var info:TextField;
		
		public function devinfo()
		{
			super();
			
			
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//			
			trace ("Before calling Device.deviceinfo.deviceInformation()");
			var df:DeviceStats = Deviceinfo.deviceinfo.deviceInformation();
			
			trace("Name:" +df.name);
			trace("Manufacture:" + df.manufacturer + "\n" )
			trace("Model:" + df.model + "\n");
			trace("SystemName:" + df.systemName + "\n");
			trace ("SystemVersion:" + df.systemVersion + "\n");
			
			info = makeTextField(50, 230);
			addChild(info);
			
			info.appendText("Name:" +df.name);
			info.appendText("Manufacture:" + df.manufacturer + "\n");
			info.appendText("Model:" + df.model + "\n");
			info.appendText("SystemName:" + df.systemName + "\n");
			info.appendText("SystemVersion:" + df.systemVersion + "\n");
			info.appendText("UID:" +df.uniqueId);
			
		}
	
		
		private function makeTextField(x:Number, y:Number):TextField
		{
			var tf:TextField = new TextField();
			tf.x = x;
			tf.y = y;
			tf.autoSize="left";
			return tf;
		}
		
	}
}