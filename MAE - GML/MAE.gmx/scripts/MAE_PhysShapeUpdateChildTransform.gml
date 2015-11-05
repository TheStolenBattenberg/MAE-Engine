///MAE_PhysShapeUpdateChildTransform(parent_shape, index, position, rotation)
/*
Position can be a vector or 3 reals.
Rotation is a quaternion.
*/

var rot = argument[3];
if(argument_count == 4){
    var vec = argument[2];
    return external_call(global.MAB_ShapeUpdateChildTransform, argument[0], argument[1], vec[0], vec[1], vec[2], rot[0], rot[1], rot[2], rot[3]);
}
return external_call(global.MAB_ShapeUpdateChildTransform, argument[0], argument[1], argument[2], argument[3], argument[4], rot[0], rot[1], rot[2], rot[3]);

