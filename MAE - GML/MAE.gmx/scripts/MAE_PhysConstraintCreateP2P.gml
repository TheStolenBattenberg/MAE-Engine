///MAE_PhysConstraintCreateP2P(bodyA, point_A, world_space_A, bodyB, point_B, world_space_B)
/*
Creates a constraint between 2 points.
Second point is optional.
*/

var vecA = argument[1];
if(argument_count == 3) return external_call(global.MAB_ConstraintCreateP2P, argument[0], vecA[0], vecA[1], vecA[2], argument[2], -1, 0, 0, 0, 0);
var vecB = argument[4];
return external_call(global.MAB_ConstraintCreateP2P, argument[0], vecA[0], vecA[1], vecA[2], argument[2], argument[3], vecB[0], vecB[1], vecB[2], argument[5]);
