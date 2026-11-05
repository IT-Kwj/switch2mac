#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
};

struct main0_out
{
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_26 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _42 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _44 = _40 * _40;
    float _46 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    float _48 = fma(_42, _42, _44);
    float _50 = in.m_26.x;
    float _52 = in.m_26.y;
    float _54 = in.m_26.z;
    float _56 = precise::max(0.0, _46);
    float _58 = sqrt(_48);
    float _60 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _62 = -_56;
    float _64 = fma(_60, (*spvDescriptorSet0.vp_c9)._m0[26].w, _62);
    bool _68 = _58 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _70 = 0.0;
    float _72 = _56;
    float _74 = _64;
    if (!_68)
    {
        float _76 = -_42;
        float _78 = _76 + (-0.0);
        _70 = _78;
    }
    float _80 = _70;
    float _82 = _80;
    if (!_68)
    {
        float _84 = -_40;
        float _86 = _84 + (-0.0);
        _72 = _86;
    }
    float _88 = _72;
    bool _90 = !_68;
    float _92 = _88;
    if (!_90)
    {
        float _94 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _96 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _98 = _58 + _96;
        float _100 = rsqrt(_48);
        float _102 = _98 * _94;
        float _104 = _64 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _106 = _102 * 0.15915493667125701904296875;
        float _108 = _106 * 6.283185482025146484375;
        float _110 = cos(_108);
        float _112 = _106 * 6.283185482025146484375;
        float _114 = sin(_112);
        float _116 = _110 + (-1.0);
        float _118 = _116 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _120 = fma(_114, _104, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _122 = fma(_64, _110, _118);
        float _124 = -_120;
        float _126 = _100 * _124;
        float _128 = _42 * _126;
        float _130 = _40 * _126;
        _74 = _122;
        _82 = _128;
        _92 = _130;
    }
    float _132 = _74;
    float _134 = _82;
    float _136 = _92;
    float _138 = _132 * _132;
    float _140 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _142 = _52 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _144 = _50 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _146 = fma(_134, _134, _138);
    float _148 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _140);
    float _150 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _152 = _142 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _154 = fma(_136, _136, _146);
    float _156 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _158 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _148);
    float _160 = _54 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _162 = rsqrt(_154);
    float _164 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _156);
    float _166 = _142 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _168 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _150);
    float _170 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[1].x, _152);
    float _172 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _164);
    float _174 = _142 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[0].x, _166);
    float _178 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _168);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[1].z, _170);
    float _182 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[2].x, _174);
    float _184 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[0].z, _176);
    float _186 = _180 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[2].z, _182);
    float _190 = _162 * _132;
    float _192 = _162 * _134;
    float _194 = _162 * _136;
    float _196 = _184 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _198 = _158 + _190;
    float _200 = _172 + _192;
    float _202 = _178 + _194;
    float _204 = _188 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _206 = -_190;
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[15].z, _206);
    float _210 = -_192;
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c7)._m0[15].z, _210);
    float _214 = -_194;
    float _216 = fma(_202, (*spvDescriptorSet0.vp_c7)._m0[15].z, _214);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _222 = -_212;
    float _224 = fma(_222, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _226 = -_216;
    float _228 = fma(_226, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _230 = _186 + _220;
    float _232 = _196 + _224;
    float _234 = _204 + _228;
    float _236 = _230 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _238 = _230 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _240 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[1].x, _236);
    float _242 = _230 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _244 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[0].x, _238);
    float _246 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[1].z, _240);
    float _248 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[2].x, _242);
    float _250 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[0].z, _244);
    float _252 = _246 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _254 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[2].z, _248);
    float _256 = _250 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _258 = _252 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _260 = _252 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _262 = _252 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _264 = _254 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[10].x, _258);
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[7].x, _260);
    float _270 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[8].x, _262);
    float _272 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[10].z, _266);
    float _274 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[7].z, _268);
    float _276 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[8].z, _270);
    float _278 = _272 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _280 = _274 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _284 = _278 * 0.999998986721038818359375;
    out.gl_Position.x = _280;
    out.gl_Position.y = _282;
    out.gl_Position.z = _284;
    out.gl_Position.w = _278;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _42 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _44 = _40 * _40;
    float _46 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    float _48 = fma(_42, _42, _44);
    float _50 = in.m_26.x;
    float _52 = in.m_26.y;
    float _54 = in.m_26.z;
    float _56 = precise::max(0.0, _46);
    float _58 = sqrt(_48);
    float _60 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _62 = -_56;
    float _64 = fma(_60, (*spvDescriptorSet0.vp_c9)._m0[26].w, _62);
    bool _68 = _58 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _70 = 0.0;
    float _72 = _56;
    float _74 = _64;
    if (!_68)
    {
        float _76 = -_42;
        float _78 = _76 + (-0.0);
        _70 = _78;
    }
    float _80 = _70;
    float _82 = _80;
    if (!_68)
    {
        float _84 = -_40;
        float _86 = _84 + (-0.0);
        _72 = _86;
    }
    float _88 = _72;
    bool _90 = !_68;
    float _92 = _88;
    if (!_90)
    {
        float _94 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _96 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _98 = _58 + _96;
        float _100 = rsqrt(_48);
        float _102 = _98 * _94;
        float _104 = _64 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _106 = _102 * 0.15915493667125701904296875;
        float _108 = _106 * 6.283185482025146484375;
        float _110 = cos(_108);
        float _112 = _106 * 6.283185482025146484375;
        float _114 = sin(_112);
        float _116 = _110 + (-1.0);
        float _118 = _116 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _120 = fma(_114, _104, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _122 = fma(_64, _110, _118);
        float _124 = -_120;
        float _126 = _100 * _124;
        float _128 = _42 * _126;
        float _130 = _40 * _126;
        _74 = _122;
        _82 = _128;
        _92 = _130;
    }
    float _132 = _74;
    float _134 = _82;
    float _136 = _92;
    float _138 = _132 * _132;
    float _140 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _142 = _52 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _144 = _50 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _146 = fma(_134, _134, _138);
    float _148 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _140);
    float _150 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _152 = _142 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _154 = fma(_136, _136, _146);
    float _156 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _158 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _148);
    float _160 = _54 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _162 = rsqrt(_154);
    float _164 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _156);
    float _166 = _142 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _168 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _150);
    float _170 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[1].x, _152);
    float _172 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _164);
    float _174 = _142 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[0].x, _166);
    float _178 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _168);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[1].z, _170);
    float _182 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[2].x, _174);
    float _184 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[0].z, _176);
    float _186 = _180 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[2].z, _182);
    float _190 = _162 * _132;
    float _192 = _162 * _134;
    float _194 = _162 * _136;
    float _196 = _184 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _198 = _158 + _190;
    float _200 = _172 + _192;
    float _202 = _178 + _194;
    float _204 = _188 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _206 = -_190;
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[15].z, _206);
    float _210 = -_192;
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c7)._m0[15].z, _210);
    float _214 = -_194;
    float _216 = fma(_202, (*spvDescriptorSet0.vp_c7)._m0[15].z, _214);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _222 = -_212;
    float _224 = fma(_222, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _226 = -_216;
    float _228 = fma(_226, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _230 = _186 + _220;
    float _232 = _196 + _224;
    float _234 = _204 + _228;
    float _236 = _230 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _238 = _230 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _240 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[1].x, _236);
    float _242 = _230 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _244 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[0].x, _238);
    float _246 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[1].z, _240);
    float _248 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[2].x, _242);
    float _250 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[0].z, _244);
    float _252 = _246 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _254 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[2].z, _248);
    float _256 = _250 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _258 = _252 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _260 = _252 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _262 = _252 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _264 = _254 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[10].x, _258);
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[7].x, _260);
    float _270 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[8].x, _262);
    float _272 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[10].z, _266);
    float _274 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[7].z, _268);
    float _276 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[8].z, _270);
    float _278 = _272 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _280 = _274 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _284 = _278 * 0.999998986721038818359375;
    out.gl_Position.x = _280;
    out.gl_Position.y = _282;
    out.gl_Position.z = _284;
    out.gl_Position.w = _278;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _40 = (*spvDescriptorSet0.vp_c7)._m0[10].z * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _42 = (*spvDescriptorSet0.vp_c7)._m0[10].x * (*spvDescriptorSet0.vp_c9)._m0[26].w;
    float _44 = _40 * _40;
    float _46 = (*spvDescriptorSet0.vp_c9)._m0[2651].w + (-220.0);
    float _48 = fma(_42, _42, _44);
    float _50 = in.m_26.x;
    float _52 = in.m_26.y;
    float _54 = in.m_26.z;
    float _56 = precise::max(0.0, _46);
    float _58 = sqrt(_48);
    float _60 = -(*spvDescriptorSet0.vp_c7)._m0[10].y;
    float _62 = -_56;
    float _64 = fma(_60, (*spvDescriptorSet0.vp_c9)._m0[26].w, _62);
    bool _68 = _58 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _70 = 0.0;
    float _72 = _56;
    float _74 = _64;
    if (!_68)
    {
        float _76 = -_42;
        float _78 = _76 + (-0.0);
        _70 = _78;
    }
    float _80 = _70;
    float _82 = _80;
    if (!_68)
    {
        float _84 = -_40;
        float _86 = _84 + (-0.0);
        _72 = _86;
    }
    float _88 = _72;
    bool _90 = !_68;
    float _92 = _88;
    if (!_90)
    {
        float _94 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _96 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _98 = _58 + _96;
        float _100 = rsqrt(_48);
        float _102 = _98 * _94;
        float _104 = _64 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _106 = _102 * 0.15915493667125701904296875;
        float _108 = _106 * 6.283185482025146484375;
        float _110 = cos(_108);
        float _112 = _106 * 6.283185482025146484375;
        float _114 = sin(_112);
        float _116 = _110 + (-1.0);
        float _118 = _116 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _120 = fma(_114, _104, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _122 = fma(_64, _110, _118);
        float _124 = -_120;
        float _126 = _100 * _124;
        float _128 = _42 * _126;
        float _130 = _40 * _126;
        _74 = _122;
        _82 = _128;
        _92 = _130;
    }
    float _132 = _74;
    float _134 = _82;
    float _136 = _92;
    float _138 = _132 * _132;
    float _140 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2651].y;
    float _142 = _52 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _144 = _50 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _146 = fma(_134, _134, _138);
    float _148 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2651].x, _140);
    float _150 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2652].y;
    float _152 = _142 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _154 = fma(_136, _136, _146);
    float _156 = (*spvDescriptorSet0.vp_c7)._m0[10].y * (*spvDescriptorSet0.vp_c9)._m0[2650].y;
    float _158 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2651].z, _148);
    float _160 = _54 * (*spvDescriptorSet0.vp_c7)._m0[15].x;
    float _162 = rsqrt(_154);
    float _164 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2650].x, _156);
    float _166 = _142 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _168 = fma((*spvDescriptorSet0.vp_c7)._m0[10].x, (*spvDescriptorSet0.vp_c9)._m0[2652].x, _150);
    float _170 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[1].x, _152);
    float _172 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2650].z, _164);
    float _174 = _142 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _176 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[0].x, _166);
    float _178 = fma((*spvDescriptorSet0.vp_c7)._m0[10].z, (*spvDescriptorSet0.vp_c9)._m0[2652].z, _168);
    float _180 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[1].z, _170);
    float _182 = fma(_144, (*spvDescriptorSet0.vp_c7)._m0[2].x, _174);
    float _184 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[0].z, _176);
    float _186 = _180 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _188 = fma(_160, (*spvDescriptorSet0.vp_c7)._m0[2].z, _182);
    float _190 = _162 * _132;
    float _192 = _162 * _134;
    float _194 = _162 * _136;
    float _196 = _184 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _198 = _158 + _190;
    float _200 = _172 + _192;
    float _202 = _178 + _194;
    float _204 = _188 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _206 = -_190;
    float _208 = fma(_198, (*spvDescriptorSet0.vp_c7)._m0[15].z, _206);
    float _210 = -_192;
    float _212 = fma(_200, (*spvDescriptorSet0.vp_c7)._m0[15].z, _210);
    float _214 = -_194;
    float _216 = fma(_202, (*spvDescriptorSet0.vp_c7)._m0[15].z, _214);
    float _218 = -_208;
    float _220 = fma(_218, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2651].w);
    float _222 = -_212;
    float _224 = fma(_222, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2650].w);
    float _226 = -_216;
    float _228 = fma(_226, (*spvDescriptorSet0.vp_c7)._m0[10].w, (*spvDescriptorSet0.vp_c9)._m0[2652].w);
    float _230 = _186 + _220;
    float _232 = _196 + _224;
    float _234 = _204 + _228;
    float _236 = _230 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _238 = _230 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _240 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[1].x, _236);
    float _242 = _230 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _244 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[0].x, _238);
    float _246 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[1].z, _240);
    float _248 = fma(_232, (*spvDescriptorSet0.vp_c4)._m0[2].x, _242);
    float _250 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[0].z, _244);
    float _252 = _246 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _254 = fma(_234, (*spvDescriptorSet0.vp_c4)._m0[2].z, _248);
    float _256 = _250 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _258 = _252 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _260 = _252 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _262 = _252 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _264 = _254 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _266 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[10].x, _258);
    float _268 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[7].x, _260);
    float _270 = fma(_256, (*spvDescriptorSet0.vp_c4)._m0[8].x, _262);
    float _272 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[10].z, _266);
    float _274 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[7].z, _268);
    float _276 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[8].z, _270);
    float _278 = _272 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _280 = _274 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _282 = _276 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _284 = _278 * 0.999998986721038818359375;
    out.gl_Position.x = _280;
    out.gl_Position.y = _282;
    out.gl_Position.z = _284;
    out.gl_Position.w = _278;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

