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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c7 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c4 [[id(2)]];
    const device _27* vp_s0 [[id(3)]];
};

struct main0_out
{
    float4 m_42 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_37 [[attribute(0)]];
    float4 m_39 [[attribute(5)]];
    uint4 m_34 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = as_type<float>(in.m_34.x);
    float _58 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _60 = in.m_37.x;
    float _62 = in.m_37.y;
    float _64 = in.m_37.z;
    float _66 = in.m_39.x;
    int _69 = as_type<int>(_58) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _71 = _69 + as_type<int>(_56);
    int _73 = _71 * 48;
    int _75 = _73 + 32;
    int _77 = _73 + 16;
    int _79 = _73 + 48;
    uint _82 = uint(int(uint(_75) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_82)];
    float _84 = as_type<float>(_dmw1.x);
    int _86 = _75 + 4;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>(_dmw1.y);
    int _92 = _75 + 8;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    float _96 = as_type<float>(_dmw1.z);
    int _98 = _75 + 12;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>(_dmw1.w);
    uint _104 = uint(int(uint(_77) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_104)];
    float _106 = as_type<float>(_dmw0.x);
    int _108 = _77 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.y);
    int _114 = _77 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.z);
    int _120 = _77 + 12;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw0.w);
    uint _126 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_126)];
    float _128 = as_type<float>(_dmw2.x);
    int _130 = _79 + 4;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw2.y);
    int _136 = _79 + 8;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw2.z);
    int _142 = _79 + 12;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.w);
    float _148 = _90 * _62;
    float _150 = _112 * _62;
    float _152 = fma(_84, _60, _148);
    float _154 = _134 * _62;
    float _156 = fma(_106, _60, _150);
    float _158 = fma(_96, _64, _152);
    float _160 = fma(_128, _60, _154);
    float _162 = fma(_118, _64, _156);
    float _164 = _102 + _158;
    float _166 = fma(_140, _64, _160);
    float _168 = _124 + _162;
    float _170 = _164 * _66;
    float _172 = _146 + _166;
    float _174 = _168 * _66;
    float _176 = _170 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _180 = _172 * _66;
    float _182 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[2].x, _176);
    float _184 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[0].x, _178);
    float _186 = _170 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _188 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[2].z, _182);
    float _190 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[0].z, _184);
    float _192 = _188 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _194 = _190 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _198 = _192 + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _202 = _194 + _200;
    float _204 = _198 * _198;
    float _206 = fma(_202, _202, _204);
    float _208 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[1].x, _186);
    float _210 = sqrt(_206);
    float _212 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[1].z, _208);
    float _214 = _212 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _216 = _214 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _218 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].x, _216);
    bool _222 = _210 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _224 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[2].z, _218);
    float _226 = _224 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _228 = _212;
    float _230 = _214;
    float _232 = _194;
    float _234 = _226;
    if (!_222)
    {
        _228 = _192;
    }
    float _236 = _228;
    bool _238 = !_222;
    float _240 = _236;
    if (!_238)
    {
        float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _246 = _210 + _244;
        float _248 = rsqrt(_206);
        float _250 = _246 * _242;
        float _252 = _214 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _254 = _250 * 0.15915493667125701904296875;
        float _256 = _254 * 6.283185482025146484375;
        float _258 = cos(_256);
        float _260 = _254 * 6.283185482025146484375;
        float _262 = sin(_260);
        float _264 = _258 + (-1.0);
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _268 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _270 = fma(_214, _258, _266);
        float _272 = _248 * _268;
        float _274 = _270 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _276 = fma(_202, _272, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _278 = fma(_198, _272, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _280 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[2].x, _274);
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[2].z, _280);
        float _284 = _282 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _230 = _270;
        _232 = _276;
        _240 = _278;
        _234 = _284;
    }
    float _286 = _230;
    float _288 = _232;
    float _290 = _240;
    float _292 = _234;
    float _294 = _286 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _296 = _286 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_42.x = _174;
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[1].x, _294);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[0].x, _296);
    out.m_42.z = _180;
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c4)._m0[1].z, _298);
    float _304 = fma(_290, (*spvDescriptorSet0.vp_c4)._m0[0].z, _300);
    float _306 = _302 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _308 = _304 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _310 = _306 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _312 = _306 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _314 = _306 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _316 = _306 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[7].x, _310);
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[8].x, _312);
    float _322 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[9].x, _314);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[10].x, _316);
    float _326 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[7].z, _318);
    float _328 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[8].z, _320);
    float _330 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[9].z, _322);
    float _332 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[10].z, _324);
    float _334 = _326 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _340 = _332 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _334;
    out.gl_Position.y = _336;
    out.gl_Position.z = _338;
    out.gl_Position.w = _340;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = as_type<float>(in.m_34.x);
    float _58 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _60 = in.m_37.x;
    float _62 = in.m_37.y;
    float _64 = in.m_37.z;
    float _66 = in.m_39.x;
    int _69 = as_type<int>(_58) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _71 = _69 + as_type<int>(_56);
    int _73 = _71 * 48;
    int _75 = _73 + 32;
    int _77 = _73 + 16;
    int _79 = _73 + 48;
    uint _82 = uint(int(uint(_75) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_82)];
    float _84 = as_type<float>(_dmw1.x);
    int _86 = _75 + 4;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>(_dmw1.y);
    int _92 = _75 + 8;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    float _96 = as_type<float>(_dmw1.z);
    int _98 = _75 + 12;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>(_dmw1.w);
    uint _104 = uint(int(uint(_77) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_104)];
    float _106 = as_type<float>(_dmw0.x);
    int _108 = _77 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.y);
    int _114 = _77 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.z);
    int _120 = _77 + 12;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw0.w);
    uint _126 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_126)];
    float _128 = as_type<float>(_dmw2.x);
    int _130 = _79 + 4;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw2.y);
    int _136 = _79 + 8;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw2.z);
    int _142 = _79 + 12;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.w);
    float _148 = _90 * _62;
    float _150 = _112 * _62;
    float _152 = fma(_84, _60, _148);
    float _154 = _134 * _62;
    float _156 = fma(_106, _60, _150);
    float _158 = fma(_96, _64, _152);
    float _160 = fma(_128, _60, _154);
    float _162 = fma(_118, _64, _156);
    float _164 = _102 + _158;
    float _166 = fma(_140, _64, _160);
    float _168 = _124 + _162;
    float _170 = _164 * _66;
    float _172 = _146 + _166;
    float _174 = _168 * _66;
    float _176 = _170 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _180 = _172 * _66;
    float _182 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[2].x, _176);
    float _184 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[0].x, _178);
    float _186 = _170 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _188 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[2].z, _182);
    float _190 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[0].z, _184);
    float _192 = _188 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _194 = _190 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _198 = _192 + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _202 = _194 + _200;
    float _204 = _198 * _198;
    float _206 = fma(_202, _202, _204);
    float _208 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[1].x, _186);
    float _210 = sqrt(_206);
    float _212 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[1].z, _208);
    float _214 = _212 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _216 = _214 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _218 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].x, _216);
    bool _222 = _210 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _224 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[2].z, _218);
    float _226 = _224 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _228 = _212;
    float _230 = _214;
    float _232 = _194;
    float _234 = _226;
    if (!_222)
    {
        _228 = _192;
    }
    float _236 = _228;
    bool _238 = !_222;
    float _240 = _236;
    if (!_238)
    {
        float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _246 = _210 + _244;
        float _248 = rsqrt(_206);
        float _250 = _246 * _242;
        float _252 = _214 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _254 = _250 * 0.15915493667125701904296875;
        float _256 = _254 * 6.283185482025146484375;
        float _258 = cos(_256);
        float _260 = _254 * 6.283185482025146484375;
        float _262 = sin(_260);
        float _264 = _258 + (-1.0);
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _268 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _270 = fma(_214, _258, _266);
        float _272 = _248 * _268;
        float _274 = _270 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _276 = fma(_202, _272, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _278 = fma(_198, _272, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _280 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[2].x, _274);
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[2].z, _280);
        float _284 = _282 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _230 = _270;
        _232 = _276;
        _240 = _278;
        _234 = _284;
    }
    float _286 = _230;
    float _288 = _232;
    float _290 = _240;
    float _292 = _234;
    float _294 = _286 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _296 = _286 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_42.x = _174;
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[1].x, _294);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[0].x, _296);
    out.m_42.z = _180;
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c4)._m0[1].z, _298);
    float _304 = fma(_290, (*spvDescriptorSet0.vp_c4)._m0[0].z, _300);
    float _306 = _302 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _308 = _304 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _310 = _306 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _312 = _306 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _314 = _306 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _316 = _306 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[7].x, _310);
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[8].x, _312);
    float _322 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[9].x, _314);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[10].x, _316);
    float _326 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[7].z, _318);
    float _328 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[8].z, _320);
    float _330 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[9].z, _322);
    float _332 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[10].z, _324);
    float _334 = _326 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _340 = _332 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _334;
    out.gl_Position.y = _336;
    out.gl_Position.z = _338;
    out.gl_Position.w = _340;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _56 = as_type<float>(in.m_34.x);
    float _58 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _60 = in.m_37.x;
    float _62 = in.m_37.y;
    float _64 = in.m_37.z;
    float _66 = in.m_39.x;
    int _69 = as_type<int>(_58) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _71 = _69 + as_type<int>(_56);
    int _73 = _71 * 48;
    int _75 = _73 + 32;
    int _77 = _73 + 16;
    int _79 = _73 + 48;
    uint _82 = uint(int(uint(_75) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_82)];
    float _84 = as_type<float>(_dmw1.x);
    int _86 = _75 + 4;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    float _90 = as_type<float>(_dmw1.y);
    int _92 = _75 + 8;
    uint _94 = uint(int(uint(_92) >> uint(2)));
    float _96 = as_type<float>(_dmw1.z);
    int _98 = _75 + 12;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    float _102 = as_type<float>(_dmw1.w);
    uint _104 = uint(int(uint(_77) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_104)];
    float _106 = as_type<float>(_dmw0.x);
    int _108 = _77 + 4;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    float _112 = as_type<float>(_dmw0.y);
    int _114 = _77 + 8;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw0.z);
    int _120 = _77 + 12;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw0.w);
    uint _126 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_126)];
    float _128 = as_type<float>(_dmw2.x);
    int _130 = _79 + 4;
    uint _132 = uint(int(uint(_130) >> uint(2)));
    float _134 = as_type<float>(_dmw2.y);
    int _136 = _79 + 8;
    uint _138 = uint(int(uint(_136) >> uint(2)));
    float _140 = as_type<float>(_dmw2.z);
    int _142 = _79 + 12;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.w);
    float _148 = _90 * _62;
    float _150 = _112 * _62;
    float _152 = fma(_84, _60, _148);
    float _154 = _134 * _62;
    float _156 = fma(_106, _60, _150);
    float _158 = fma(_96, _64, _152);
    float _160 = fma(_128, _60, _154);
    float _162 = fma(_118, _64, _156);
    float _164 = _102 + _158;
    float _166 = fma(_140, _64, _160);
    float _168 = _124 + _162;
    float _170 = _164 * _66;
    float _172 = _146 + _166;
    float _174 = _168 * _66;
    float _176 = _170 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _178 = _170 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _180 = _172 * _66;
    float _182 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[2].x, _176);
    float _184 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[0].x, _178);
    float _186 = _170 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _188 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[2].z, _182);
    float _190 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[0].z, _184);
    float _192 = _188 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _194 = _190 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _198 = _192 + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _202 = _194 + _200;
    float _204 = _198 * _198;
    float _206 = fma(_202, _202, _204);
    float _208 = fma(_174, (*spvDescriptorSet0.vp_c7)._m0[1].x, _186);
    float _210 = sqrt(_206);
    float _212 = fma(_180, (*spvDescriptorSet0.vp_c7)._m0[1].z, _208);
    float _214 = _212 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _216 = _214 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _218 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].x, _216);
    bool _222 = _210 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _224 = fma(_192, (*spvDescriptorSet0.vp_c4)._m0[2].z, _218);
    float _226 = _224 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _228 = _212;
    float _230 = _214;
    float _232 = _194;
    float _234 = _226;
    if (!_222)
    {
        _228 = _192;
    }
    float _236 = _228;
    bool _238 = !_222;
    float _240 = _236;
    if (!_238)
    {
        float _242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _246 = _210 + _244;
        float _248 = rsqrt(_206);
        float _250 = _246 * _242;
        float _252 = _214 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _254 = _250 * 0.15915493667125701904296875;
        float _256 = _254 * 6.283185482025146484375;
        float _258 = cos(_256);
        float _260 = _254 * 6.283185482025146484375;
        float _262 = sin(_260);
        float _264 = _258 + (-1.0);
        float _266 = _264 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _268 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _270 = fma(_214, _258, _266);
        float _272 = _248 * _268;
        float _274 = _270 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _276 = fma(_202, _272, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _278 = fma(_198, _272, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _280 = fma(_276, (*spvDescriptorSet0.vp_c4)._m0[2].x, _274);
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c4)._m0[2].z, _280);
        float _284 = _282 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _230 = _270;
        _232 = _276;
        _240 = _278;
        _234 = _284;
    }
    float _286 = _230;
    float _288 = _232;
    float _290 = _240;
    float _292 = _234;
    float _294 = _286 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _296 = _286 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_42.x = _174;
    float _298 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[1].x, _294);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[0].x, _296);
    out.m_42.z = _180;
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c4)._m0[1].z, _298);
    float _304 = fma(_290, (*spvDescriptorSet0.vp_c4)._m0[0].z, _300);
    float _306 = _302 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _308 = _304 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _310 = _306 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _312 = _306 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _314 = _306 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _316 = _306 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _318 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[7].x, _310);
    float _320 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[8].x, _312);
    float _322 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[9].x, _314);
    float _324 = fma(_308, (*spvDescriptorSet0.vp_c4)._m0[10].x, _316);
    float _326 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[7].z, _318);
    float _328 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[8].z, _320);
    float _330 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[9].z, _322);
    float _332 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[10].z, _324);
    float _334 = _326 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _336 = _328 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _338 = _330 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _340 = _332 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _334;
    out.gl_Position.y = _336;
    out.gl_Position.z = _338;
    out.gl_Position.w = _340;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

