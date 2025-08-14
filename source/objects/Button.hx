package objects;

import data.Paths;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import states.PlayState;

class Button extends FlxSprite
{
	var pressedonce:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		var imagePath = Paths.image("placeholder/button");
		var xmlPath = Paths.spritesheetXML("placeholder/button");
		frames = FlxAtlasFrames.fromSparrow(imagePath, xmlPath);
		animation.addByPrefix("idle", "idle", 0, false);
		animation.addByPrefix("pushed", "pressed", 0, false);
		animation.play("idle");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(this))
		{
			if (FlxG.mouse.pressed && pressedonce == false)
			{
				animation.play('pushed');

				PlayState.instance.countnumber += 1;
				pressedonce = true;
			}
			if (FlxG.mouse.justReleased)
			{
				pressedonce = false;
				if (animation.name != 'idle')
				{
					animation.play("idle");
				}
			}
		}
	}
}
