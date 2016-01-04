///MAE_Init([flags],[DLL])
var flags = INIT_ALL;

global.DLL_MAE = "MAE.dll";

if (argument_count > 0 && is_real(argument[0]) && argument[0] != 0)
    flags = argument[0];

if (argument_count > 1 && is_string(argument[1]))
    global.DLL_MAE = argument[1];
    
// Private
global.MADX9_Init = external_define(global.DLL_MAE, "MADX9_Init", dll_cdecl, ty_real, 1, ty_string);
global.MADX9_Free = external_define(global.DLL_MAE, "MADX9_Free", dll_cdecl, ty_real, 0);

external_call(global.MADX9_Init, window_device());

if (argument[0] & INIT_RENDER)
{
    //Shaders
    global.MADX9_ShaderCreateHLSL9      = external_define(global.DLL_MAE, "MADX9_ShaderCreateHLSL9", dll_cdecl, ty_real, 2, ty_string, ty_string);
    global.MADX9_ShaderCreateASM        = external_define(global.DLL_MAE, "MADX9_ShaderCreateASM", dll_cdecl, ty_real, 2, ty_string, ty_string);
    global.MADX9_ShaderSet              = external_define(global.DLL_MAE, "MADX9_ShaderSet", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_ShaderReset            = external_define(global.DLL_MAE, "MADX9_ShaderReset", dll_cdecl, ty_real, 0);
    global.MADX9_ShaderDestroy          = external_define(global.DLL_MAE, "MADX9_ShaderDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_ShaderFindConstant     = external_define(global.DLL_MAE, "MADX9_ShaderFindConstant", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_string);
    global.MADX9_ShaderGetSampler       = external_define(global.DLL_MAE, "MADX9_ShaderGetSampler", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_ShaderSetConstantFloat = external_define(global.DLL_MAE, "MADX9_ShaderSetConstantFloat", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_ShaderSetConstantVec2  = external_define(global.DLL_MAE, "MADX9_ShaderSetConstantVec2", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_ShaderSetConstantVec3  = external_define(global.DLL_MAE, "MADX9_ShaderSetConstantVec3", dll_cdecl, ty_real, 6, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_ShaderSetConstantVec4  = external_define(global.DLL_MAE, "MADX9_ShaderSetConstantVec4", dll_cdecl, ty_real, 7, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_ShaderSetConstantMat3  = external_define(global.DLL_MAE, "MADX9_ShaderSetConstantMat3", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_ShaderSetConstantMat4  = external_define(global.DLL_MAE, "MADX9_ShaderSetConstantMat4", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    
    //Materials
    global.MADX9_MaterialCreate           = external_define(global.DLL_MAE, "MADX9_MaterialCreate", dll_cdecl, ty_real, 0);
    global.MADX9_MaterialDestroy          = external_define(global.DLL_MAE, "MADX9_MaterialDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_MaterialSetDiffuse       = external_define(global.DLL_MAE, "MADX9_MaterialSetDiffuse", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_MaterialSetAmbient       = external_define(global.DLL_MAE, "MADX9_MaterialSetAmbient", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_MaterialSetSpecular      = external_define(global.DLL_MAE, "MADX9_MaterialSetSpecular", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_MaterialSetSpecularPower = external_define(global.DLL_MAE, "MADX9_MaterialSetSpecularPower", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_MaterialSetEmissive      = external_define(global.DLL_MAE, "MADX9_MaterialSetEmissive", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_MaterialSet              = external_define(global.DLL_MAE, "MADX9_MaterialSet", dll_cdecl, ty_real, 1, ty_real); 
    
    //Lights
    global.MADX9_LightCreate          = external_define(global.DLL_MAE, "MADX9_LightCreate", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_LightDestroy         = external_define(global.DLL_MAE, "MADX9_LightDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_LightSetDiffuse      = external_define(global.DLL_MAE, "MADX9_LightSetDiffuse", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_LightSetPosition     = external_define(global.DLL_MAE, "MADX9_LightSetPosition", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_LightSetRange        = external_define(global.DLL_MAE, "MADX9_LightSetRange", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_LightSetAttenuation0 = external_define(global.DLL_MAE, "MADX9_LightSetAttenuation0", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_LightSetAttenuation1 = external_define(global.DLL_MAE, "MADX9_LightSetAttenuation1", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_LightSetAttenuation2 = external_define(global.DLL_MAE, "MADX9_LightSetAttenuation2", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_LightEnable          = external_define(global.DLL_MAE, "MADX9_LightEnable", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_LightDisable         = external_define(global.DLL_MAE, "MADX9_LightDisable", dll_cdecl, ty_real, 1, ty_real);
    
    //MD2
    global.MADX9_MD2Load      = external_define(global.DLL_MAE, "MADX9_MD2Load", dll_cdecl, ty_real, 3, ty_string, ty_real, ty_real);
    global.MADX9_MD2Render    = external_define(global.DLL_MAE, "MADX9_MD2Render", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_MD2GetFrames = external_define(global.DLL_MAE, "MADX9_MD2GetFrames", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_MD2Destroy   = external_define(global.DLL_MAE, "MADX9_MD2Destroy", dll_cdecl, ty_real, 1, ty_real);
    
    //X
    global.MADX9_XLoad    = external_define(global.DLL_MAE, "MADX9_XLoad", dll_cdecl, ty_real, 2, ty_string, ty_string);
    global.MADX9_XRender  = external_define(global.DLL_MAE, "MADX9_XRender", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_XDestroy = external_define(global.DLL_MAE, "MADX9_XDestroy", dll_cdecl, ty_real, 1, ty_real);
    
    //MPM
    global._MAE_MPMLoad    = external_define(global.DLL_MAE, "MAE_MPMLoad", dll_cdecl, ty_real, 1, ty_string);
    global._MAE_MPMDestroy = external_define(global.DLL_MAE, "MAE_MPMDestroy", dll_cdecl, ty_real, 1, ty_real);
    global._MAE_MPMRender  = external_define(global.DLL_MAE, "MAE_MPMRender", dll_cdecl, ty_real, 1, ty_real);
    
    // Error
    global.MADX9_ErrorSetFlags = external_define(global.DLL_MAE, "MADX9_ErrorSetFlags", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_ErrorEmpty    = external_define(global.DLL_MAE, "MADX9_ErrorEmpty", dll_cdecl, ty_real, 0);
    global.MADX9_ErrorPop      = external_define(global.DLL_MAE, "MADX9_ErrorPop", dll_cdecl, ty_string, 0);
    
    // Textures
    global.MADX9_TextureCreateFromFile         = external_define(global.DLL_MAE, "MADX9_TextureCreateFromFile", dll_cdecl, ty_real, 2, ty_string, ty_real);
    global.MADX9_TextureCreateFromPointer      = external_define(global.DLL_MAE, "MADX9_TextureCreateFromPointer", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_TextureDestroy                = external_define(global.DLL_MAE, "MADX9_TextureDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_TextureSet                    = external_define(global.DLL_MAE, "MADX9_TextureSet", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_TextureCreateFromFileInMemory = external_define(global.DLL_MAE, "MADX9_TextureCreateFromFileInMemory", dll_cdecl, ty_real, 3, ty_string, ty_real, ty_real);
    global.MADX9_TextureCreate                 = external_define(global.DLL_MAE, "MADX9_TextureCreate", dll_cdecl, ty_real, 6, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_TextureGenerateMipMaps        = external_define(global.DLL_MAE, "MADX9_TextureGenerateMipMaps", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_TextureGetPointer             = external_define(global.DLL_MAE, "MADX9_TextureGetPointer", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_TextureGetSurfaceCount        = external_define(global.DLL_MAE, "MADX9_TextureGetSurfaceCount", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_TextureSetMipMapFilter        = external_define(global.DLL_MAE, "MADX9_TextureSetMipMapFilter", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_TextureUpdate                 = external_define(global.DLL_MAE, "MADX9_TextureUpdate", dll_cdecl, ty_real, 2, ty_real, ty_real);
    
    // Misc
    global.MADX9_SetSamplerState = external_define(global.DLL_MAE, "MADX9_SetSamplerState", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_SetRenderState  = external_define(global.DLL_MAE, "MADX9_SetRenderState", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_FreePointer     = external_define(global.DLL_MAE, "MADX9_FreePointer", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_Clear           = external_define(global.DLL_MAE, "MADX9_Clear", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_IsNullPointer   = external_define(global.DLL_MAE, "MADX9_IsNullPointer", dll_cdecl, ty_real, 1, ty_real);
    
    // Internal
    global.MADX9_MatStackFloat8 = external_define(global.DLL_MAE, "MADX9_MatStackFloat8", dll_cdecl, ty_real, 8, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_MatStackFloat9 = external_define(global.DLL_MAE, "MADX9_MatStackFloat9", dll_cdecl, ty_real, 9, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_MatStackClear  = external_define(global.DLL_MAE, "MADX9_MatStackClear", dll_cdecl, ty_real, 0);
    
    // Hook
    global.MADX9_HookEnable             = external_define(global.DLL_MAE, "MADX9_HookEnable", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_HookDisable            = external_define(global.DLL_MAE, "MADX9_HookDisable", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_HookStackPopPointer    = external_define(global.DLL_MAE, "MADX9_HookStackPopPointer", dll_cdecl, ty_real, 0);
    global.MADX9_HookStackClear         = external_define(global.DLL_MAE, "MADX9_HookStackClear", dll_cdecl, ty_real, 0);
    global.MADX9_HookStackEmpty         = external_define(global.DLL_MAE, "MADX9_HookStackEmpty", dll_cdecl, ty_real, 0);
    global.MADX9_HookSetPropertyNull    = external_define(global.DLL_MAE, "MADX9_HookSetPropertyNull", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_HookSetPropertyInt     = external_define(global.DLL_MAE, "MADX9_HookSetPropertyInt", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_HookSetPropertyPointer = external_define(global.DLL_MAE, "MADX9_HookSetPropertyPointer", dll_cdecl, ty_real, 2, ty_real, ty_real);
    
    // Surfaces
    global.MADX9_SurfaceCreateDepthStencil = external_define(global.DLL_MAE, "MADX9_SurfaceCreateDepthStencil", dll_cdecl, ty_real, 6, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_SurfaceCreateFromPointer  = external_define(global.DLL_MAE, "MADX9_SurfaceCreateFromPointer", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_SurfaceCreateFromTexture  = external_define(global.DLL_MAE, "MADX9_SurfaceCreateFromTexture", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_SurfaceCreateRenderTarget = external_define(global.DLL_MAE, "MADX9_SurfaceCreateRenderTarget", dll_cdecl, ty_real, 6, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_SurfaceDestroy            = external_define(global.DLL_MAE, "MADX9_SurfaceDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_SurfaceSetRenderTarget    = external_define(global.DLL_MAE, "MADX9_SurfaceSetRenderTarget", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_SurfaceResetRenderTarget  = external_define(global.DLL_MAE, "MADX9_SurfaceResetRenderTarget", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_SurfaceSetDepthBuffer     = external_define(global.DLL_MAE, "MADX9_SurfaceSetDepthBuffer", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_SurfaceResetDepthBuffer   = external_define(global.DLL_MAE, "MADX9_SurfaceResetDepthBuffer", dll_cdecl, ty_real, 0);
    global.MADX9_SurfaceUpdate             = external_define(global.DLL_MAE, "MADX9_SurfaceUpdate", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_SurfaceGetPointer         = external_define(global.DLL_MAE, "MADX9_SurfaceGetPointer", dll_cdecl, ty_real, 1, ty_real);

    // Particles
    global.MADX9_ParticleSystemCreate            = external_define(global.DLL_MAE, "MADX9_ParticleSystemCreate", dll_cdecl, ty_real, 0);
    global.MADX9_ParticleSystemDestroy           = external_define(global.DLL_MAE, "MADX9_ParticleSystemDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_ParticleSystemUpdate            = external_define(global.DLL_MAE, "MADX9_ParticleSystemUpdate", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_ParticleSystemRender            = external_define(global.DLL_MAE, "MADX9_ParticleSystemRender", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_ParticleSystemGetParticleCount  = external_define(global.DLL_MAE, "MADX9_ParticleSystemGetParticleCount", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_ParticleSystemSetParticleCount  = external_define(global.DLL_MAE, "MADX9_ParticleSystemSetParticleCount", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_ParticleSystemSetTexture        = external_define(global.DLL_MAE, "MADX9_ParticleSystemSetTexture", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_ParticleEmitterCreate           = external_define(global.DLL_MAE, "MADX9_ParticleEmitterCreate", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_ParticleEmitterSetParticleCol   = external_define(global.DLL_MAE, "MADX9_ParticleEmitterSetParticleCol", dll_cdecl, ty_real, 9, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_ParticleEmitterSetParticleCount = external_define(global.DLL_MAE, "MADX9_ParticleEmitterSetParticleCount", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_ParticleEmitterSetParticleLife  = external_define(global.DLL_MAE, "MADX9_ParticleEmitterSetParticleLife", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_ParticleEmitterSetParticleSize  = external_define(global.DLL_MAE, "MADX9_ParticleEmitterSetParticleSize", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_ParticleEmitterSetParticlePos   = external_define(global.DLL_MAE, "MADX9_ParticleEmitterSetParticlePos", dll_cdecl, ty_real, 7, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_ParticleEmitterSetParticleAcc   = external_define(global.DLL_MAE, "MADX9_ParticleEmitterSetParticleAcc", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_ParticleEmitterSetParticleVel   = external_define(global.DLL_MAE, "MADX9_ParticleEmitterSetParticleVel", dll_cdecl, ty_real, 7, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    
    // Math
    global.MADX9_MathCosineInterp                = external_define(global.DLL_MAE, "MADX9_MathCosineInterp", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_MathRandomRange                 = external_define(global.DLL_MAE, "MADX9_MathRandomRange", dll_cdecl, ty_real, 2, ty_real, ty_real);
    
    // Buffers
    global.MADX9_BufferCreate     = external_define(global.DLL_MAE, "MADX9_BufferCreate", dll_cdecl, ty_real, 0);
    global.MADX9_BufferDestroy    = external_define(global.DLL_MAE, "MADX9_BufferDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_BufferReserve    = external_define(global.DLL_MAE, "MADX9_BufferReserve", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_BufferRemove     = external_define(global.DLL_MAE, "MADX9_BufferRemove", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_BufferSeek       = external_define(global.DLL_MAE, "MADX9_BufferSeek", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_BufferTell       = external_define(global.DLL_MAE, "MADX9_BufferTell", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_BufferSize       = external_define(global.DLL_MAE, "MADX9_BufferSize", dll_cdecl, ty_real, 1, ty_real);
    global.MADX9_BufferWrite      = external_define(global.DLL_MAE, "MADX9_BufferWrite", dll_cdecl, ty_real, 4, ty_real, ty_string, ty_real, ty_real);
    global.MADX9_BufferWriteValue = external_define(global.DLL_MAE, "MADX9_BufferWriteValue", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_BufferRead       = external_define(global.DLL_MAE, "MADX9_BufferRead", dll_cdecl, ty_real, 4, ty_real, ty_string, ty_real, ty_real);
    global.MADX9_BufferReadValue  = external_define(global.DLL_MAE, "MADX9_BufferWriteValue", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MADX9_BufferPoke       = external_define(global.DLL_MAE, "MADX9_BufferPoke", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_BufferPokeValue  = external_define(global.DLL_MAE, "MADX9_BufferPokeValue", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_BufferPeek       = external_define(global.DLL_MAE, "MADX9_BufferPeek", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MADX9_BufferPeekValue  = external_define(global.DLL_MAE, "MADX9_BufferPeekValue", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MADX9_BufferSetPointer = external_define(global.DLL_MAE, "MADX9_BufferSetPointer", dll_cdecl, ty_real, 1, ty_string);
    
    enum ValueType
    {
        U8  = 0,
        U16 = 1,
        U32 = 2,
        S8  = 3,
        S16 = 4,
        S32 = 5,
        F32 = 6,
        F64 = 7
    };
}

if (argument[0] & INIT_FLUSH)
{
    MAE_HookEnable(HOOK_ACTIONFETCHVERTDECL);
    
    vertex_format_begin();
    vertex_format_add_colour();
    var f = vertex_format_end();
    
    MAE_HookDisable(HOOK_ACTIONFETCHVERTDECL);
    
    var p = MAE_HookStackPopPointer();
    
    MAE_HookSetPropertyPointer(HOOK_PROPERTYDISABLEVERTDECL, p);
    MAE_HookEnable(HOOK_ACTIONIGNOREVERTDECL);
    
    MAE_FreePointer(p);
    
    global.MAE_FlushBuffer = vertex_create_buffer_ext(4);
    vertex_begin(global.MAE_FlushBuffer, f);
    vertex_colour(global.MAE_FlushBuffer, 0, 0);
    vertex_end(global.MAE_FlushBuffer);
}

if (argument[0] & INIT_PHYSICS)
{    
    //World
    global.MAB_WorldCreate             = external_define(global.DLL_MAE, "MAB_WorldCreate", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_WorldDestroy            = external_define(global.DLL_MAE, "MAB_WorldDestroy", dll_cdecl, ty_real, 0);
    global.MAB_WorldStep               = external_define(global.DLL_MAE, "MAB_WorldStep", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_WorldSetGravity         = external_define(global.DLL_MAE, "MAB_WorldSetGravity", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_WorldGetGravity         = external_define(global.DLL_MAE, "MAB_WorldGetGravity", dll_cdecl, ty_real, 0);
    global.MAB_WorldGetBodyCount       = external_define(global.DLL_MAE, "MAB_WorldGetBodyCount", dll_cdecl, ty_real, 0);
    global.MAB_WorldGetConstraintCount = external_define(global.DLL_MAE, "MAB_WorldGetConstraintCount", dll_cdecl, ty_real, 0);
    global.MAB_WorldExists             = external_define(global.DLL_MAE, "MAB_WorldExists", dll_cdecl, ty_real, 0);
    global.MAB_WorldDebugDraw          = external_define(global.DLL_MAE, "MAB_WorldDebugDraw", dll_cdecl, ty_real, 0);
    global.MAB_WorldRaycast            = external_define(global.DLL_MAE, "MAB_WorldRaycast", dll_cdecl, ty_real, 8, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_WorldSweep              = external_define(global.DLL_MAE, "MAB_WorldSweep", dll_cdecl, ty_real, 9, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_WorldOverlap            = external_define(global.DLL_MAE, "MAB_WorldOverlap", dll_cdecl, ty_real, 10, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    
    //Misc
    global.MAB_Vec           = external_define(global.DLL_MAE, "MAB_Vec", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_Quat          = external_define(global.DLL_MAE, "MAB_Quat", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_HitResult     = external_define(global.DLL_MAE, "MAB_HitResult", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_OverlapResult = external_define(global.DLL_MAE, "MAB_OverlapResult", dll_cdecl, ty_real, 1, ty_real);
    
    //Shape
    global.MAB_ShapeCreateBox            = external_define(global.DLL_MAE, "MAB_ShapeCreateBox", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_ShapeCreateSphere         = external_define(global.DLL_MAE, "MAB_ShapeCreateSphere", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_ShapeCreateCapsule        = external_define(global.DLL_MAE, "MAB_ShapeCreateCapsule", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_ShapeCreateCylinder       = external_define(global.DLL_MAE, "MAB_ShapeCreateCylinder", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_ShapeCreateCone           = external_define(global.DLL_MAE, "MAB_ShapeCreateCone", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_ShapeCreatePlane          = external_define(global.DLL_MAE, "MAB_ShapeCreatePlane", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ShapeCreateCompound       = external_define(global.DLL_MAE, "MAB_ShapeCreateCompound", dll_cdecl, ty_real, 0);
    global.MAB_ShapeAddChild             = external_define(global.DLL_MAE, "MAB_ShapeAddChild", dll_cdecl, ty_real, 9, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ShapeRemoveChild          = external_define(global.DLL_MAE, "MAB_ShapeRemoveChild", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_ShapeUpdateChildTransform = external_define(global.DLL_MAE, "MAB_ShapeUpdateChildTransform", dll_cdecl, ty_real, 9, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ShapeCreateTriMesh        = external_define(global.DLL_MAE, "MAB_ShapeCreateTriMesh", dll_cdecl, ty_real, 4, ty_real, ty_string, ty_real, ty_real);
    global.MAB_ShapeCreateConvexHull     = external_define(global.DLL_MAE, "MAB_ShapeCreateConvexHull", dll_cdecl, ty_real, 2, ty_string, ty_real);
    global.MAB_ShapeDestroy              = external_define(global.DLL_MAE, "MAB_ShapeDestroy", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_ShapeDestroyAll           = external_define(global.DLL_MAE, "MAB_ShapeDestroyAll", dll_cdecl, ty_real, 0);
    global.MAB_ShapeSetMargin            = external_define(global.DLL_MAE, "MAB_ShapeSetMargin", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_ShapeSetScaling           = external_define(global.DLL_MAE, "MAB_ShapeSetScaling", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    
    //Body
    global.MAB_BodyCreate                 = external_define(global.DLL_MAE, "MAB_BodyCreate", dll_cdecl, ty_real, 8, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodyDestroy                = external_define(global.DLL_MAE, "MAB_BodyDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetPosition            = external_define(global.DLL_MAE, "MAB_BodyGetPosition", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetRotationQuat        = external_define(global.DLL_MAE, "MAB_BodyGetRotationQuat", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetRotationEuler       = external_define(global.DLL_MAE, "MAB_BodyGetRotationEuler", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetLinearVelocity      = external_define(global.DLL_MAE, "MAB_BodyGetLinearVelocity", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetAngularVelocity     = external_define(global.DLL_MAE, "MAB_BodyGetAngularVelocity", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetAnisotropicFriction = external_define(global.DLL_MAE, "MAB_BodyGetAngularVelocity", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetGravity             = external_define(global.DLL_MAE, "MAB_BodyGetGravity", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetAngularDamping      = external_define(global.DLL_MAE, "MAB_BodyGetAngularDamping", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetLinearDamping       = external_define(global.DLL_MAE, "MAB_BodyGetLinearDamping", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetFriction            = external_define(global.DLL_MAE, "MAB_BodyGetFriction", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetRestitution         = external_define(global.DLL_MAE, "MAB_BodyGetRestitution", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetRollingFriction     = external_define(global.DLL_MAE, "MAB_BodyGetRollingFriction", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetUserIndex           = external_define(global.DLL_MAE, "MAB_BodyGetUserIndex", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetDeactivationTime    = external_define(global.DLL_MAE, "MAB_BodyGetDeactivationTime", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetIgnore              = external_define(global.DLL_MAE, "MAB_BodyGetIgnore", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_BodyIsStatic               = external_define(global.DLL_MAE, "MAB_BodyIsStatic", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyIsKinematic            = external_define(global.DLL_MAE, "MAB_BodyIsKinematic", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetShape               = external_define(global.DLL_MAE, "MAB_BodyGetShape", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyIsActive               = external_define(global.DLL_MAE, "MAB_BodyIsActive", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetGroup               = external_define(global.DLL_MAE, "MAB_BodyGetGroup", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyGetMask                = external_define(global.DLL_MAE, "MAB_BodyGetMask", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodySetIgnore              = external_define(global.DLL_MAE, "MAB_BodySetIgnore", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_BodySetPosition            = external_define(global.DLL_MAE, "MAB_BodySetPosition", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetRotationQuat        = external_define(global.DLL_MAE, "MAB_BodySetRotationQuat", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetRotationEuler       = external_define(global.DLL_MAE, "MAB_BodySetRotationEuler", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetLinearVelocity      = external_define(global.DLL_MAE, "MAB_BodySetLinearVelocity", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetAngularVelocity     = external_define(global.DLL_MAE, "MAB_BodySetAngularVelocity", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetLinearFactor        = external_define(global.DLL_MAE, "MAB_BodySetLinearFactor", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetAngularFactor       = external_define(global.DLL_MAE, "MAB_BodySetAngularFactor", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetDamping             = external_define(global.DLL_MAE, "MAB_BodySetDamping", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_BodySetFriction            = external_define(global.DLL_MAE, "MAB_BodySetFriction", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_BodySetAnisotropicFriction = external_define(global.DLL_MAE, "MAB_BodySetAnisotropicFriction", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetRestitution         = external_define(global.DLL_MAE, "MAB_BodySetRestitution", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_BodySetRollingFriction     = external_define(global.DLL_MAE, "MAB_BodySetRollingFriction", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_BodySetUserIndex           = external_define(global.DLL_MAE, "MAB_BodySetUserIndex", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_BodySetGravity             = external_define(global.DLL_MAE, "MAB_BodySetGravity", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodySetDeactivationTime    = external_define(global.DLL_MAE, "MAB_BodySetDeactivationTime", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_BodyDisableDeactivation    = external_define(global.DLL_MAE, "MAB_BodyDisableDeactivation", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyActivate               = external_define(global.DLL_MAE, "MAB_BodyActivate", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodyDeactivate             = external_define(global.DLL_MAE, "MAB_BodyDeactivate", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_BodySetShape               = external_define(global.DLL_MAE, "MAB_BodySetShape", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_BodySetGroupMask           = external_define(global.DLL_MAE, "MAB_BodySetGroupMask", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_BodyApplyCentralImpulse    = external_define(global.DLL_MAE, "MAB_BodyApplyCentralImpulse", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodyApplyCentralForce      = external_define(global.DLL_MAE, "MAB_BodyApplyCentralForce", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodyApplyImpulse           = external_define(global.DLL_MAE, "MAB_BodyApplyImpulse", dll_cdecl, ty_real, 7, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodyApplyForce             = external_define(global.DLL_MAE, "MAB_BodyApplyForce", dll_cdecl, ty_real, 7, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodyApplyTorque            = external_define(global.DLL_MAE, "MAB_BodyApplyTorque", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_BodyApplyTorqueImpulse     = external_define(global.DLL_MAE, "MAB_BodyApplyTorqueImpulse", dll_cdecl, ty_real, 5, ty_real, ty_real, ty_real, ty_real, ty_real);
    
    //Constraints
    global.MAB_ConstraintCreateP2P         = external_define(global.DLL_MAE, "MAB_ConstraintCreateP2P", dll_cdecl, ty_real, 11, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ConstraintCreateFixed       = external_define(global.DLL_MAE, "MAB_ConstraintCreateFixed", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_ConstraintCreateSlider      = external_define(global.DLL_MAE, "MAB_ConstraintCreateSlider", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ConstraintCreateGear        = external_define(global.DLL_MAE, "MAB_ConstraintCreateGear", dll_cdecl, ty_real, 10, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ConstraintCreateHinge       = external_define(global.DLL_MAE, "MAB_ConstraintCreateHinge", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ConstraintCreate6DOF        = external_define(global.DLL_MAE, "MAB_ConstraintCreate6DOF", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ConstraintCreateSpring6DOF  = external_define(global.DLL_MAE, "MAB_ConstraintCreateSpring6DOF", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ConstraintCreateConeTwist   = external_define(global.DLL_MAE, "MAB_ConstraintCreateConeTwist", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.MAB_ConstraintParamTransform    = external_define(global.DLL_MAE, "MAB_ConstraintParamTransform", dll_cdecl, ty_real, 8, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MAB_ConstraintSetEnabled        = external_define(global.DLL_MAE, "MAB_ConstraintSetEnabled", dll_cdecl, ty_real, 2, ty_real, ty_real);
    global.MAB_ConstraintDestroy           = external_define(global.DLL_MAE, "MAB_ConstraintDestroy", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_ConstraintGetAppliedImpulse = external_define(global.DLL_MAE, "MAB_ConstraintGetAppliedImpulse", dll_cdecl, ty_real, 1, ty_real);
    global.MAB_ConstraintSetParam          = external_define(global.DLL_MAE, "MAB_ConstraintSetParam", dll_cdecl, ty_real, 8, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    
    //Constraint Params
    enum PARAM {
        BREAKING_IMPULSE_THRESHOLD,
        USE_FRAME_OFFSET,
        FRAMES,
        SOLVER_ITERATIONS,
        P2P_IMPULSE_CLAMP,
        P2P_DAMPING,
        P2P_TAU,
        P2P_PIVOTA,
        P2P_PIVOTB,
        SLIDER_DAMPING_DIR_ANG,
        SLIDER_DAMPING_DIR_LIN,
        SLIDER_DAMPING_LIM_ANG,
        SLIDER_DAMPING_LIM_LIN,
        SLIDER_DAMPING_ORTHO_ANG,
        SLIDER_DAMPING_ORTHO_LIN,
        SLIDER_LOWER_ANG_LIMIT,
        SLIDER_LOWER_LIN_LIMIT,
        SLIDER_MAX_ANG_MOTOR_FORCE,
        SLIDER_MAX_LIN_MOTOR_FORCE,
        SLIDER_POWERED_ANG_MOTOR,
        SLIDER_POWERED_LIN_MOTOR,
        SLIDER_RESTITUTION_DIR_ANG,
        SLIDER_RESTITUTION_DIR_LIN,
        SLIDER_RESTITUTION_LIM_ANG,
        SLIDER_RESTITUTION_LIM_LIN,
        SLIDER_RESTITUTION_ORTHO_ANG,
        SLIDER_RESTITUTION_ORTHO_LIN,
        SLIDER_SOFTNESS_DIR_ANG,
        SLIDER_SOFTNESS_DIR_LIN,
        SLIDER_SOFTNESS_LIM_ANG,
        SLIDER_SOFTNESS_LIM_LIN,
        SLIDER_SOFTNESS_ORTHO_ANG,
        SLIDER_SOFTNESS_ORTHO_LIN,
        SLIDER_TARGET_ANG_MOTOR_VELOCITY,
        SLIDER_TARGET_LIN_MOTOR_VELOCITY,
        SLIDER_UPPER_ANG_LIMIT,
        SLIDER_UPPER_LIN_LIMIT,
        GEAR_AXIS_A,
        GEAR_AXIS_B,
        GEAR_RATIO,
        HINGE_ANGULAR_ONLY,
        HINGE_AXIS,
        HINGE_LIMITS,
        HINGE_MAX_MOTOR_IMPULSE,
        HINGE_MOTOR_TARGET,
        HINGE_MOTOR_ENABLED,
        DOF_ANGULAR_LOWER_LIMIT,
        DOF_ANGULAR_UPPER_LIMIT,
        DOF_AXIS,
        DOF_LIMITS,
        DOF_LINEAR_LOWER_LIMIT,
        DOF_LINEAR_UPPER_LIMIT,
        DOF_SPRING_ENABLED,
        DOF_SPRING_DAMPING,
        DOF_SPRING_STIFFNESS,
        CONE_ANGULAR_ONLY,
        CONE_DAMPING,
        CONE_FIX_THRESH,
        CONE_LIMITS,
        CONE_MAX_MOTOR_IMPULSE,
        CONE_MAX_MOTOR_IMPULSE_NORMALIZED,
        CONE_MOTOR_TARGET,
        CONE_MOTOR_TARGET_CONSTRAINT_SPACE,
        CONE_MOTOR_ENABLED,
    };
}

if (argument[0] & INIT_NAVIGATION)
{   
    global.MA_NavMeshCreate         = external_define(global.DLL_MAE, "MA_NavMeshCreate", dll_cdecl, ty_real, 1, ty_string);
    global.MA_NavMeshDestroy        = external_define(global.DLL_MAE, "MA_NavMeshDestroy", dll_cdecl, ty_real, 0);
    global.MA_NavMeshDebugDraw      = external_define(global.DLL_MAE, "MA_NavMeshDebugDraw", dll_cdecl, ty_real, 0);
    global.MA_NavMeshSetConfig      = external_define(global.DLL_MAE, "MA_NavMeshSetConfig", dll_cdecl, ty_real, 9, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real, ty_real);
    global.MA_NavMeshSetAgentConfig = external_define(global.DLL_MAE, "MA_NavMeshSetAgentConfig", dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
}
