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
    constant _16* vp_c5 [[id(0)]];
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
    float4 m_30 [[attribute(0)]];
    uint4 m_27 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _44 = as_type<float>(in.m_27.x);
    float _46 = in.m_30.x;
    float _48 = in.m_30.y;
    float _50 = in.m_30.z;
    int _53 = as_type<int>(_44) * 48;
    int _55 = _53 + 32;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    uint _60 = uint(int(uint(int(_58)) >> uint(2)));
    int _62 = int(_58) & 3;
    float _64 = (*spvDescriptorSet0.vp_c5)._m0[int(_60)][_62];
    int _66 = int(_58) + 1;
    uint _68 = uint(int(uint(_66) >> uint(2)));
    int _70 = _66 & 3;
    float _72 = (*spvDescriptorSet0.vp_c5)._m0[int(_68)][_70];
    uint _74 = uint(int(uint(_53) >> uint(2)));
    uint _76 = uint(int(uint(int(_74)) >> uint(2)));
    int _78 = int(_74) & 3;
    float _80 = (*spvDescriptorSet0.vp_c5)._m0[int(_76)][_78];
    int _82 = int(_74) + 1;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    int _86 = _82 & 3;
    float _88 = (*spvDescriptorSet0.vp_c5)._m0[int(_84)][_86];
    int _90 = _53 + 40;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    uint _94 = uint(int(uint(int(_92)) >> uint(2)));
    int _96 = int(_92) & 3;
    float _98 = (*spvDescriptorSet0.vp_c5)._m0[int(_94)][_96];
    int _100 = int(_92) + 1;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    int _104 = _100 & 3;
    float _106 = (*spvDescriptorSet0.vp_c5)._m0[int(_102)][_104];
    int _108 = _53 + 8;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.vp_c5)._m0[int(_112)][_114];
    int _118 = int(_110) + 1;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    int _122 = _118 & 3;
    float _124 = (*spvDescriptorSet0.vp_c5)._m0[int(_120)][_122];
    int _126 = _53 + 16;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    uint _130 = uint(int(uint(int(_128)) >> uint(2)));
    int _132 = int(_128) & 3;
    float _134 = (*spvDescriptorSet0.vp_c5)._m0[int(_130)][_132];
    int _136 = int(_128) + 1;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    int _140 = _136 & 3;
    float _142 = (*spvDescriptorSet0.vp_c5)._m0[int(_138)][_140];
    int _144 = _53 + 24;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    uint _148 = uint(int(uint(int(_146)) >> uint(2)));
    int _150 = int(_146) & 3;
    float _152 = (*spvDescriptorSet0.vp_c5)._m0[int(_148)][_150];
    int _154 = int(_146) + 1;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    int _158 = _154 & 3;
    float _160 = (*spvDescriptorSet0.vp_c5)._m0[int(_156)][_158];
    float _162 = _48 * _72;
    float _164 = fma(_46, _64, _162);
    float _166 = _48 * _88;
    float _168 = fma(_46, _80, _166);
    float _170 = fma(_50, _98, _164);
    float _172 = _170 + _106;
    float _174 = fma(_50, _116, _168);
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _178 = _172 + _176;
    float _180 = _174 + _124;
    float _182 = _178 * _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _186 = _180 + _184;
    float _188 = _48 * _142;
    float _190 = fma(_186, _186, _182);
    float _192 = fma(_46, _134, _188);
    float _194 = sqrt(_190);
    float _196 = fma(_50, _152, _192);
    float _198 = _196 + _160;
    float _200 = _198 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _202 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[2].x, _200);
    bool _206 = _194 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _208 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _210 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _212 = _196;
    float _214 = _46;
    float _216 = _198;
    float _218 = _210;
    if (!_206)
    {
        _212 = _180;
    }
    float _220 = _212;
    float _222 = _220;
    if (!_206)
    {
        _214 = _172;
    }
    float _224 = _214;
    bool _226 = !_206;
    float _228 = _224;
    if (!_226)
    {
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _234 = _194 + _232;
        float _236 = _198 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _238 = rsqrt(_190);
        float _240 = _234 * _230;
        float _242 = _240 * 0.15915493667125701904296875;
        float _244 = _242 * 6.283185482025146484375;
        float _246 = cos(_244);
        float _248 = _242 * 6.283185482025146484375;
        float _250 = sin(_248);
        float _252 = _246 + (-1.0);
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _256 = fma(_250, _236, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _258 = fma(_198, _246, _254);
        float _260 = _238 * _256;
        float _262 = _258 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _264 = fma(_186, _260, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _266 = fma(_178, _260, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _268 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[2].x, _262);
        float _270 = fma(_266, (*spvDescriptorSet0.vp_c4)._m0[2].z, _268);
        float _272 = _270 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _216 = _258;
        _222 = _264;
        _228 = _266;
        _218 = _272;
    }
    float _274 = _216;
    float _276 = _222;
    float _278 = _228;
    float _280 = _218;
    float _282 = _274 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _284 = _274 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _286 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[1].x, _282);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[0].x, _284);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[1].z, _286);
    float _292 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[0].z, _288);
    float _294 = _290 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _296 = _292 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _298 = _294 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _300 = _294 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _302 = _294 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[8].x, _298);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[7].x, _300);
    float _310 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[9].x, _302);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[10].x, _304);
    float _314 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[8].z, _306);
    float _316 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[7].z, _308);
    float _318 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[9].z, _310);
    float _320 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[10].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _324 = _316 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _326 = _318 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _324;
    out.gl_Position.y = _322;
    out.gl_Position.z = _326;
    out.gl_Position.w = _328;
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
    float _44 = as_type<float>(in.m_27.x);
    float _46 = in.m_30.x;
    float _48 = in.m_30.y;
    float _50 = in.m_30.z;
    int _53 = as_type<int>(_44) * 48;
    int _55 = _53 + 32;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    uint _60 = uint(int(uint(int(_58)) >> uint(2)));
    int _62 = int(_58) & 3;
    float _64 = (*spvDescriptorSet0.vp_c5)._m0[int(_60)][_62];
    int _66 = int(_58) + 1;
    uint _68 = uint(int(uint(_66) >> uint(2)));
    int _70 = _66 & 3;
    float _72 = (*spvDescriptorSet0.vp_c5)._m0[int(_68)][_70];
    uint _74 = uint(int(uint(_53) >> uint(2)));
    uint _76 = uint(int(uint(int(_74)) >> uint(2)));
    int _78 = int(_74) & 3;
    float _80 = (*spvDescriptorSet0.vp_c5)._m0[int(_76)][_78];
    int _82 = int(_74) + 1;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    int _86 = _82 & 3;
    float _88 = (*spvDescriptorSet0.vp_c5)._m0[int(_84)][_86];
    int _90 = _53 + 40;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    uint _94 = uint(int(uint(int(_92)) >> uint(2)));
    int _96 = int(_92) & 3;
    float _98 = (*spvDescriptorSet0.vp_c5)._m0[int(_94)][_96];
    int _100 = int(_92) + 1;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    int _104 = _100 & 3;
    float _106 = (*spvDescriptorSet0.vp_c5)._m0[int(_102)][_104];
    int _108 = _53 + 8;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.vp_c5)._m0[int(_112)][_114];
    int _118 = int(_110) + 1;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    int _122 = _118 & 3;
    float _124 = (*spvDescriptorSet0.vp_c5)._m0[int(_120)][_122];
    int _126 = _53 + 16;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    uint _130 = uint(int(uint(int(_128)) >> uint(2)));
    int _132 = int(_128) & 3;
    float _134 = (*spvDescriptorSet0.vp_c5)._m0[int(_130)][_132];
    int _136 = int(_128) + 1;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    int _140 = _136 & 3;
    float _142 = (*spvDescriptorSet0.vp_c5)._m0[int(_138)][_140];
    int _144 = _53 + 24;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    uint _148 = uint(int(uint(int(_146)) >> uint(2)));
    int _150 = int(_146) & 3;
    float _152 = (*spvDescriptorSet0.vp_c5)._m0[int(_148)][_150];
    int _154 = int(_146) + 1;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    int _158 = _154 & 3;
    float _160 = (*spvDescriptorSet0.vp_c5)._m0[int(_156)][_158];
    float _162 = _48 * _72;
    float _164 = fma(_46, _64, _162);
    float _166 = _48 * _88;
    float _168 = fma(_46, _80, _166);
    float _170 = fma(_50, _98, _164);
    float _172 = _170 + _106;
    float _174 = fma(_50, _116, _168);
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _178 = _172 + _176;
    float _180 = _174 + _124;
    float _182 = _178 * _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _186 = _180 + _184;
    float _188 = _48 * _142;
    float _190 = fma(_186, _186, _182);
    float _192 = fma(_46, _134, _188);
    float _194 = sqrt(_190);
    float _196 = fma(_50, _152, _192);
    float _198 = _196 + _160;
    float _200 = _198 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _202 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[2].x, _200);
    bool _206 = _194 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _208 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _210 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _212 = _196;
    float _214 = _46;
    float _216 = _198;
    float _218 = _210;
    if (!_206)
    {
        _212 = _180;
    }
    float _220 = _212;
    float _222 = _220;
    if (!_206)
    {
        _214 = _172;
    }
    float _224 = _214;
    bool _226 = !_206;
    float _228 = _224;
    if (!_226)
    {
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _234 = _194 + _232;
        float _236 = _198 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _238 = rsqrt(_190);
        float _240 = _234 * _230;
        float _242 = _240 * 0.15915493667125701904296875;
        float _244 = _242 * 6.283185482025146484375;
        float _246 = cos(_244);
        float _248 = _242 * 6.283185482025146484375;
        float _250 = sin(_248);
        float _252 = _246 + (-1.0);
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _256 = fma(_250, _236, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _258 = fma(_198, _246, _254);
        float _260 = _238 * _256;
        float _262 = _258 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _264 = fma(_186, _260, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _266 = fma(_178, _260, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _268 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[2].x, _262);
        float _270 = fma(_266, (*spvDescriptorSet0.vp_c4)._m0[2].z, _268);
        float _272 = _270 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _216 = _258;
        _222 = _264;
        _228 = _266;
        _218 = _272;
    }
    float _274 = _216;
    float _276 = _222;
    float _278 = _228;
    float _280 = _218;
    float _282 = _274 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _284 = _274 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _286 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[1].x, _282);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[0].x, _284);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[1].z, _286);
    float _292 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[0].z, _288);
    float _294 = _290 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _296 = _292 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _298 = _294 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _300 = _294 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _302 = _294 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[8].x, _298);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[7].x, _300);
    float _310 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[9].x, _302);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[10].x, _304);
    float _314 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[8].z, _306);
    float _316 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[7].z, _308);
    float _318 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[9].z, _310);
    float _320 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[10].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _324 = _316 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _326 = _318 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _324;
    out.gl_Position.y = _322;
    out.gl_Position.z = _326;
    out.gl_Position.w = _328;
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
    float _44 = as_type<float>(in.m_27.x);
    float _46 = in.m_30.x;
    float _48 = in.m_30.y;
    float _50 = in.m_30.z;
    int _53 = as_type<int>(_44) * 48;
    int _55 = _53 + 32;
    uint _58 = uint(int(uint(_55) >> uint(2)));
    uint _60 = uint(int(uint(int(_58)) >> uint(2)));
    int _62 = int(_58) & 3;
    float _64 = (*spvDescriptorSet0.vp_c5)._m0[int(_60)][_62];
    int _66 = int(_58) + 1;
    uint _68 = uint(int(uint(_66) >> uint(2)));
    int _70 = _66 & 3;
    float _72 = (*spvDescriptorSet0.vp_c5)._m0[int(_68)][_70];
    uint _74 = uint(int(uint(_53) >> uint(2)));
    uint _76 = uint(int(uint(int(_74)) >> uint(2)));
    int _78 = int(_74) & 3;
    float _80 = (*spvDescriptorSet0.vp_c5)._m0[int(_76)][_78];
    int _82 = int(_74) + 1;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    int _86 = _82 & 3;
    float _88 = (*spvDescriptorSet0.vp_c5)._m0[int(_84)][_86];
    int _90 = _53 + 40;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    uint _94 = uint(int(uint(int(_92)) >> uint(2)));
    int _96 = int(_92) & 3;
    float _98 = (*spvDescriptorSet0.vp_c5)._m0[int(_94)][_96];
    int _100 = int(_92) + 1;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    int _104 = _100 & 3;
    float _106 = (*spvDescriptorSet0.vp_c5)._m0[int(_102)][_104];
    int _108 = _53 + 8;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.vp_c5)._m0[int(_112)][_114];
    int _118 = int(_110) + 1;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    int _122 = _118 & 3;
    float _124 = (*spvDescriptorSet0.vp_c5)._m0[int(_120)][_122];
    int _126 = _53 + 16;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    uint _130 = uint(int(uint(int(_128)) >> uint(2)));
    int _132 = int(_128) & 3;
    float _134 = (*spvDescriptorSet0.vp_c5)._m0[int(_130)][_132];
    int _136 = int(_128) + 1;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    int _140 = _136 & 3;
    float _142 = (*spvDescriptorSet0.vp_c5)._m0[int(_138)][_140];
    int _144 = _53 + 24;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    uint _148 = uint(int(uint(int(_146)) >> uint(2)));
    int _150 = int(_146) & 3;
    float _152 = (*spvDescriptorSet0.vp_c5)._m0[int(_148)][_150];
    int _154 = int(_146) + 1;
    uint _156 = uint(int(uint(_154) >> uint(2)));
    int _158 = _154 & 3;
    float _160 = (*spvDescriptorSet0.vp_c5)._m0[int(_156)][_158];
    float _162 = _48 * _72;
    float _164 = fma(_46, _64, _162);
    float _166 = _48 * _88;
    float _168 = fma(_46, _80, _166);
    float _170 = fma(_50, _98, _164);
    float _172 = _170 + _106;
    float _174 = fma(_50, _116, _168);
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _178 = _172 + _176;
    float _180 = _174 + _124;
    float _182 = _178 * _178;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _186 = _180 + _184;
    float _188 = _48 * _142;
    float _190 = fma(_186, _186, _182);
    float _192 = fma(_46, _134, _188);
    float _194 = sqrt(_190);
    float _196 = fma(_50, _152, _192);
    float _198 = _196 + _160;
    float _200 = _198 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _202 = fma(_180, (*spvDescriptorSet0.vp_c4)._m0[2].x, _200);
    bool _206 = _194 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _208 = fma(_172, (*spvDescriptorSet0.vp_c4)._m0[2].z, _202);
    float _210 = _208 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _212 = _196;
    float _214 = _46;
    float _216 = _198;
    float _218 = _210;
    if (!_206)
    {
        _212 = _180;
    }
    float _220 = _212;
    float _222 = _220;
    if (!_206)
    {
        _214 = _172;
    }
    float _224 = _214;
    bool _226 = !_206;
    float _228 = _224;
    if (!_226)
    {
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _234 = _194 + _232;
        float _236 = _198 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _238 = rsqrt(_190);
        float _240 = _234 * _230;
        float _242 = _240 * 0.15915493667125701904296875;
        float _244 = _242 * 6.283185482025146484375;
        float _246 = cos(_244);
        float _248 = _242 * 6.283185482025146484375;
        float _250 = sin(_248);
        float _252 = _246 + (-1.0);
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _256 = fma(_250, _236, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _258 = fma(_198, _246, _254);
        float _260 = _238 * _256;
        float _262 = _258 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _264 = fma(_186, _260, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _266 = fma(_178, _260, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _268 = fma(_264, (*spvDescriptorSet0.vp_c4)._m0[2].x, _262);
        float _270 = fma(_266, (*spvDescriptorSet0.vp_c4)._m0[2].z, _268);
        float _272 = _270 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _216 = _258;
        _222 = _264;
        _228 = _266;
        _218 = _272;
    }
    float _274 = _216;
    float _276 = _222;
    float _278 = _228;
    float _280 = _218;
    float _282 = _274 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _284 = _274 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _286 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[1].x, _282);
    float _288 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[0].x, _284);
    float _290 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[1].z, _286);
    float _292 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[0].z, _288);
    float _294 = _290 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _296 = _292 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _298 = _294 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _300 = _294 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _302 = _294 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _306 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[8].x, _298);
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[7].x, _300);
    float _310 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[9].x, _302);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[10].x, _304);
    float _314 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[8].z, _306);
    float _316 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[7].z, _308);
    float _318 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[9].z, _310);
    float _320 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[10].z, _312);
    float _322 = _314 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _324 = _316 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _326 = _318 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _328 = _320 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _324;
    out.gl_Position.y = _322;
    out.gl_Position.z = _326;
    out.gl_Position.w = _328;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

