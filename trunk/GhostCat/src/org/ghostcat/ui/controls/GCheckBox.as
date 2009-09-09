package org.ghostcat.ui.controls
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	import org.ghostcat.util.ClassFactory;
	
	/**
	 * 多选框
	 * 
	 * @author flashyiyi
	 * 
	 */
	public class GCheckBox extends GButton
	{
		[Embed(skinClass="org.ghostcat.skin.CheckBoxIconSkin")]
		private static const CursorGroupClass:Class;//这里不直接导入CursorGroup而用Embed中转只是为了正常生成ASDoc
		public static var defaultSkin:ClassFactory = new ClassFactory(CursorGroupClass);
		
		/**
		 * 值
		 */
		public var value:*;
		
		public function GCheckBox(skin:MovieClip=null, replace:Boolean=true, textPos:Point=null)
		{
			if (!skin)
				skin = defaultSkin.newInstance();
				
			if (!textPos)
				this.textPos = new Point(15,0);
			
			this.toggle = true;
			
			super(skin, replace);
		}
	}
}