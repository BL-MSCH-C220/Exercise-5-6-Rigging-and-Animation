# Exercise 5.6—Rigging and Animation

Exercise for MSCH-C220

---

Fork this repository. When that process has completed, make sure that the top of the repository reads [your username]/Exercise-5-6-Rigging-and-Animation. Edit the LICENSE and replace BL-MSCH-C220 with your full name. Commit your changes.

Clone the repository to a Local Path on your computer.

In the Blender folder, you will see Rain.blend. We will use it to practice adding an armature to a model.

---

Open Blender/Rain.blend in Blender. Under Edit->Preferences, Add-ons, make sure Rigging: Rigify is selected.

Press shift-A to add a element. Select Armature->Human (Meta-rig).

In the Transform Pivot Point menu (in the middle of the tool bar), select 3D Cursor.

Select the Armature. Go into Edit mode (by pressing Tab) and press S to scale. Match the eyes of the armature to the model.

In the Options menu (right side of the toolbar), check X-Axis Mirror.

Carefully, and methodically, line up the armature inside the model. The hands and fingers will require the most effort. Wireframe mode will probably help.

When you are done, go to Object mode. In the Scene panel, select the GEO_ model pieces (holding shift or Command), until they are all selected. Finally, select metarig. Then press ctrl-P. Select Armature Deform->With Automatic Weights.

You can check that the bones are connected to the model by entering Pose Mode and grabbing (G) the bones. The model should deform accordingly.

Export the model as a .glTF 2.0 file: /Assets/Rain.glb

Open Godot. Import the project.godot file and open the "Animation" project.

Right-click on the Game node and Instance Child Scene. Select Assets/Rain.glb. Translate the new Rain node to (-8,0,0) and scale to (2.5,2.5,2.5)

---

Now, we will work on the animation of the Player node. Open the Player scene.

In the AnimationPlayer node, make sure the Idle and Walk animations are both set to AnimationLooping.

Right-click on the Player node and Add Child Node. Select AnimationTree. Select the AnimationTree node; in the Inspector->Tree Root, select New AnimationNodeBlendTree. Under Anim Player, select the AnimationPlayer. *Set Active to On.*

You will see a new AnimationTree panel appear at the bottom of the window. Drag the Output node to the right side of the workspace.

Add Node, and select Animation. Create a second Animation Node, and a Blend2 Node. Connect the Out ports from the two Animation nodes to the in and blend ports on the Blend2 node. Connect the out port from the Blend2 node to the Output node.

Rename the Blend2 node Idle_Walk.

In the first Animation node, call the animation Idle, and select Idle from the film canister menu.

In the first Animation node, call the animation Walk, and select Walk from the film canister menu.

As you adjust the slider, you should see the Walk animation become more or less dramatic.

Finally, select the characterMedium. In the Inspector, select Material->0, and select New Spatial Material. Edit that material. Under Albedo, Texture, add the res://Assets/alienB.png texture.

Save the Player scene.

In the Player.gd script, on line 32, add the following:

```
	$AnimationTree.set("parameters/Idle_Walk/blend_amount", current_speed/SPEED) 
```

Test the program to make sure the player can now animate while walking.

---

Quit Godot. In GitHub desktop, add a summary message, commit your changes and push them back to GitHub. If you return to and refresh your GitHub repository page, you should now see your updated files with the time when they were changed.

Now edit the README.md file. When you have finished editing, commit your changes, and then turn in the URL of the main repository page (https://github.com/[username]/Exercise-5-6-Rigging-and-Animation) on Canvas.

The final state of the file should be as follows (replacing the "Created by" information with your name):
```
# Exercise 5.6—Rigging and Animation

Exercise for MSCH-C220

An opportunity to play with animating 3D humanoid characters

## Implementation

Built using Blender 3.6, Godot 4.1.1

## References
 - [Kenney.nl Animation Characters](https://kenney.nl/assets/animated-characters-2)
 - [Rain v2.0 Blender model](https://cloud.blender.org/p/characters/5f04a68bb5f1a2612f7b29da)
 - [Godot ThirdPerson Player Animation](https://youtu.be/msZw59Iln74)

## Future Development

None

## Extra Credit

None

## Created by 

Jason Francis
```
