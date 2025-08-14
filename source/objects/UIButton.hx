package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import states.PlayState;

class UIButton extends FlxSprite
{
	public var label:FlxText;

	var pressedonce:Bool = false;

	public function new(x:Float = 0, y:Float = 0, text:String = "Increase Clickamount by 1", width:Int = 80, height:Int = 20)
	{
		super(x, y);

		makeGraphic(100, 30, 0xFFAB1B1B);
		label = new FlxText(x, y, width, text);
		label.setFormat(null, 16, 0xFFFFFFFF, "center");
		label.y = y + (height - label.height) / 2;
		label.x = x;
	}

	override public function draw():Void
	{
		super.draw();
		label.draw(); // the only way it gets drawn for somereason
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(this))
		{
			if (FlxG.mouse.pressed && pressedonce == false)
			{
				PlayState.instance.countmodifier += 1;
				pressedonce = true;
				trace(PlayState.instance.countmodifier);
			}
			if (FlxG.mouse.justReleased)
			{
				pressedonce = false;
			}
		}
	}
}
