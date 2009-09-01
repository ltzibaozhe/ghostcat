package org.ghostcat.manager
{
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.ContextMenu;
	
	/**
	 * 舞台对象相关扩展。
	 * 
	 * 主要功能为获取flashVars，直接使用getValue方法即可。不同的是，你可以使用setValue来设置parameters的值，模拟flashVars存在时的效果，
	 * 这样就可以在非网页环境进行测试。而当真正的flashVars存在时，与之冲突的设置值都会被忽略。
	 * 这样调试和发布就可以统一处理。
	 * 
	 * @author flashyiyi
	 * 
	 */	
	public final class RootManager
	{
		private static var _root:Sprite;
		
		private static var _parameters:Object = new Object();
		
		public static const MODE_NORMAL:int = 0;
		public static const MODE_NOSCALE:int = 1;
		
		public static function get root():Sprite
		{
			if (!_root)
				throw new Error("请先使用RootManager.register()方法注册舞台");
			return _root;
		}
		
		public static function get stage():Stage
		{
			return root.stage;
		}
		
		public static function register(root:Sprite,mode:int = 0,menuMode:int = 0):void
		{
			_root = root;
			setMode(mode);
			setMenuMode(menuMode);
		}
		
		/**
		 * 设置缩放模式 
		 * @param mode
		 * 
		 */
		public static function setMode(mode:int):void
		{
			switch (mode)
			{
				case 0:
					stage.scaleMode = StageScaleMode.EXACT_FIT;
					stage.align = StageAlign.TOP;
					break;
				case 1:
					stage.scaleMode = StageScaleMode.NO_SCALE;
					stage.align = StageAlign.TOP_LEFT;
					break;
			}
		}
		
		/**
		 * 设置菜单模式
		 * @param mode
		 * 
		 */
		public static function setMenuMode(mode:int):void
		{
			var menu:ContextMenu = new ContextMenu();
			switch (mode)
			{
				case 0:
					break;
				case 1:
					menu.hideBuiltInItems();
					break;
			}
			root.contextMenu = menu;
		}
		
		       
		/**
		 * 读取FLASHVARS
		 * 
		 * @param key
		 * @return 
		 * 
		 */		
		public static function getValue(key:String):*
		{
			if (root.loaderInfo.hasOwnProperty(key)){
				return root.loaderInfo.parameters[key];
			}else{
				return _parameters[key];
			}
		}
		/**
		 * 设置测试用FLASHVARS
		 *  
		 * @param key	
		 * @param value
		 * 
		 */		
		public static function setValue(key:String,value:*):void
		{
			_parameters[key] = value;
		}
	}
}