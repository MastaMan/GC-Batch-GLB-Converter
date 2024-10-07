import bpy

context = bpy.context

context.preferences.view.show_splash = False

for area in context.screen.areas:
    if area.type == 'VIEW_3D':
        override = context.copy()
        override['area'] = area
        
        for region in area.regions:
            if region.type == 'WINDOW':
                override['region'] = region
                bpy.ops.view3d.view_all(override, center=True)