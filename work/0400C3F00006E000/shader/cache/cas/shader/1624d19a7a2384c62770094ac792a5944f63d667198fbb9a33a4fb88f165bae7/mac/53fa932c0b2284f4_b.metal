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
    float4 m_42 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = as_type<float>(in.m_34.x);
    float _60 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _62 = in.m_37.x;
    float _64 = in.m_37.y;
    float _66 = in.m_37.z;
    float _68 = in.m_39.x;
    int _71 = as_type<int>(_60) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _73 = _71 + as_type<int>(_58);
    int _75 = _73 * 48;
    int _77 = _75 + 32;
    int _79 = _75 + 16;
    int _81 = _75 + 48;
    uint _84 = uint(int(uint(_77) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_84)];
    float _86 = as_type<float>(_dmw1.x);
    int _88 = _77 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw1.y);
    int _94 = _77 + 8;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>(_dmw1.z);
    int _100 = _77 + 12;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    float _104 = as_type<float>(_dmw1.w);
    uint _106 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_106)];
    float _108 = as_type<float>(_dmw0.x);
    int _110 = _79 + 4;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.y);
    int _116 = _79 + 8;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.z);
    int _122 = _79 + 12;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw0.w);
    uint _128 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_128)];
    float _130 = as_type<float>(_dmw2.x);
    int _132 = _81 + 4;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw2.y);
    int _138 = _81 + 8;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw2.z);
    int _144 = _81 + 12;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw2.w);
    float _150 = _92 * _64;
    float _152 = _114 * _64;
    float _154 = fma(_86, _62, _150);
    float _156 = _136 * _64;
    float _158 = fma(_108, _62, _152);
    float _160 = fma(_98, _66, _154);
    float _162 = fma(_130, _62, _156);
    float _164 = fma(_120, _66, _158);
    float _166 = _104 + _160;
    float _168 = fma(_142, _66, _162);
    float _170 = _126 + _164;
    float _172 = _166 * _68;
    float _174 = _148 + _168;
    float _176 = _170 * _68;
    float _178 = _172 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _182 = _174 * _68;
    float _184 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[2].x, _178);
    float _186 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[0].x, _180);
    float _188 = _172 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _190 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[2].z, _184);
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[0].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[1].x, _188);
    float _196 = _190 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _198 = _192 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[1].z, _194);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _204 = _196 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _208 = _198 + _206;
    float _210 = _200 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _212 = _204 * _204;
    float _214 = _210 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _216 = fma(_208, _208, _212);
    float _218 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[2].x, _214);
    float _220 = sqrt(_216);
    float _222 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].z, _218);
    float _224 = _222 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _228 = _220 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _230 = _194;
    float _232 = _212;
    float _234 = _108;
    float _236 = _222;
    if (!_228)
    {
        _230 = _224;
    }
    float _238 = _230;
    float _240 = _238;
    if (!_228)
    {
        _232 = _198;
    }
    float _242 = _232;
    float _244 = _242;
    if (!_228)
    {
        _234 = _210;
    }
    float _246 = _234;
    float _248 = _246;
    if (!_228)
    {
        _236 = _196;
    }
    float _250 = _236;
    bool _252 = !_228;
    float _254 = _250;
    if (!_252)
    {
        float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _260 = _220 + _258;
        float _262 = _210 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _264 = rsqrt(_216);
        float _266 = _260 * _256;
        float _268 = _266 * 0.15915493667125701904296875;
        float _270 = _268 * 6.283185482025146484375;
        float _272 = cos(_270);
        float _274 = _268 * 6.283185482025146484375;
        float _276 = sin(_274);
        float _278 = _272 + (-1.0);
        float _280 = fma(_276, _262, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _284 = _264 * _280;
        float _286 = fma(_210, _272, _282);
        float _288 = fma(_208, _284, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _290 = _286 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _292 = fma(_204, _284, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _294 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[2].x, _290);
        float _296 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[2].z, _294);
        float _298 = _296 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _248 = _286;
        _244 = _288;
        _254 = _292;
        _240 = _298;
    }
    float _300 = _248;
    float _302 = _244;
    float _304 = _254;
    float _306 = _240;
    float _308 = _300 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _310 = _300 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_42.x = _198;
    out.m_42.y = _210;
    out.m_42.z = _196;
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[1].x, _308);
    float _314 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[0].x, _310);
    out.m_44.w = _224;
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c4)._m0[1].z, _312);
    float _318 = fma(_304, (*spvDescriptorSet0.vp_c4)._m0[0].z, _314);
    float _320 = _316 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _324 = _320 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _326 = _320 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _328 = _320 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _330 = _320 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[7].x, _324);
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[8].x, _326);
    float _336 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[9].x, _328);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[10].x, _330);
    float _340 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[7].z, _332);
    float _342 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[8].z, _334);
    float _344 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[9].z, _336);
    float _346 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[10].z, _338);
    float _348 = _340 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _350 = _342 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _352 = _344 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _354 = _346 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _348;
    out.gl_Position.y = _350;
    out.gl_Position.z = _352;
    out.gl_Position.w = _354;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = as_type<float>(in.m_34.x);
    float _60 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _62 = in.m_37.x;
    float _64 = in.m_37.y;
    float _66 = in.m_37.z;
    float _68 = in.m_39.x;
    int _71 = as_type<int>(_60) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _73 = _71 + as_type<int>(_58);
    int _75 = _73 * 48;
    int _77 = _75 + 32;
    int _79 = _75 + 16;
    int _81 = _75 + 48;
    uint _84 = uint(int(uint(_77) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_84)];
    float _86 = as_type<float>(_dmw1.x);
    int _88 = _77 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw1.y);
    int _94 = _77 + 8;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>(_dmw1.z);
    int _100 = _77 + 12;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    float _104 = as_type<float>(_dmw1.w);
    uint _106 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_106)];
    float _108 = as_type<float>(_dmw0.x);
    int _110 = _79 + 4;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.y);
    int _116 = _79 + 8;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.z);
    int _122 = _79 + 12;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw0.w);
    uint _128 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_128)];
    float _130 = as_type<float>(_dmw2.x);
    int _132 = _81 + 4;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw2.y);
    int _138 = _81 + 8;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw2.z);
    int _144 = _81 + 12;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw2.w);
    float _150 = _92 * _64;
    float _152 = _114 * _64;
    float _154 = fma(_86, _62, _150);
    float _156 = _136 * _64;
    float _158 = fma(_108, _62, _152);
    float _160 = fma(_98, _66, _154);
    float _162 = fma(_130, _62, _156);
    float _164 = fma(_120, _66, _158);
    float _166 = _104 + _160;
    float _168 = fma(_142, _66, _162);
    float _170 = _126 + _164;
    float _172 = _166 * _68;
    float _174 = _148 + _168;
    float _176 = _170 * _68;
    float _178 = _172 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _182 = _174 * _68;
    float _184 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[2].x, _178);
    float _186 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[0].x, _180);
    float _188 = _172 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _190 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[2].z, _184);
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[0].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[1].x, _188);
    float _196 = _190 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _198 = _192 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[1].z, _194);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _204 = _196 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _208 = _198 + _206;
    float _210 = _200 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _212 = _204 * _204;
    float _214 = _210 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _216 = fma(_208, _208, _212);
    float _218 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[2].x, _214);
    float _220 = sqrt(_216);
    float _222 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].z, _218);
    float _224 = _222 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _228 = _220 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _230 = _194;
    float _232 = _212;
    float _234 = _108;
    float _236 = _222;
    if (!_228)
    {
        _230 = _224;
    }
    float _238 = _230;
    float _240 = _238;
    if (!_228)
    {
        _232 = _198;
    }
    float _242 = _232;
    float _244 = _242;
    if (!_228)
    {
        _234 = _210;
    }
    float _246 = _234;
    float _248 = _246;
    if (!_228)
    {
        _236 = _196;
    }
    float _250 = _236;
    bool _252 = !_228;
    float _254 = _250;
    if (!_252)
    {
        float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _260 = _220 + _258;
        float _262 = _210 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _264 = rsqrt(_216);
        float _266 = _260 * _256;
        float _268 = _266 * 0.15915493667125701904296875;
        float _270 = _268 * 6.283185482025146484375;
        float _272 = cos(_270);
        float _274 = _268 * 6.283185482025146484375;
        float _276 = sin(_274);
        float _278 = _272 + (-1.0);
        float _280 = fma(_276, _262, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _284 = _264 * _280;
        float _286 = fma(_210, _272, _282);
        float _288 = fma(_208, _284, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _290 = _286 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _292 = fma(_204, _284, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _294 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[2].x, _290);
        float _296 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[2].z, _294);
        float _298 = _296 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _248 = _286;
        _244 = _288;
        _254 = _292;
        _240 = _298;
    }
    float _300 = _248;
    float _302 = _244;
    float _304 = _254;
    float _306 = _240;
    float _308 = _300 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _310 = _300 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_42.x = _198;
    out.m_42.y = _210;
    out.m_42.z = _196;
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[1].x, _308);
    float _314 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[0].x, _310);
    out.m_44.w = _224;
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c4)._m0[1].z, _312);
    float _318 = fma(_304, (*spvDescriptorSet0.vp_c4)._m0[0].z, _314);
    float _320 = _316 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _324 = _320 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _326 = _320 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _328 = _320 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _330 = _320 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[7].x, _324);
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[8].x, _326);
    float _336 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[9].x, _328);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[10].x, _330);
    float _340 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[7].z, _332);
    float _342 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[8].z, _334);
    float _344 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[9].z, _336);
    float _346 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[10].z, _338);
    float _348 = _340 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _350 = _342 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _352 = _344 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _354 = _346 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _348;
    out.gl_Position.y = _350;
    out.gl_Position.z = _352;
    out.gl_Position.w = _354;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = as_type<float>(in.m_34.x);
    float _60 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _62 = in.m_37.x;
    float _64 = in.m_37.y;
    float _66 = in.m_37.z;
    float _68 = in.m_39.x;
    int _71 = as_type<int>(_60) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _73 = _71 + as_type<int>(_58);
    int _75 = _73 * 48;
    int _77 = _75 + 32;
    int _79 = _75 + 16;
    int _81 = _75 + 48;
    uint _84 = uint(int(uint(_77) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_84)];
    float _86 = as_type<float>(_dmw1.x);
    int _88 = _77 + 4;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw1.y);
    int _94 = _77 + 8;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    float _98 = as_type<float>(_dmw1.z);
    int _100 = _77 + 12;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    float _104 = as_type<float>(_dmw1.w);
    uint _106 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_106)];
    float _108 = as_type<float>(_dmw0.x);
    int _110 = _79 + 4;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    float _114 = as_type<float>(_dmw0.y);
    int _116 = _79 + 8;
    uint _118 = uint(int(uint(_116) >> uint(2)));
    float _120 = as_type<float>(_dmw0.z);
    int _122 = _79 + 12;
    uint _124 = uint(int(uint(_122) >> uint(2)));
    float _126 = as_type<float>(_dmw0.w);
    uint _128 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_128)];
    float _130 = as_type<float>(_dmw2.x);
    int _132 = _81 + 4;
    uint _134 = uint(int(uint(_132) >> uint(2)));
    float _136 = as_type<float>(_dmw2.y);
    int _138 = _81 + 8;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    float _142 = as_type<float>(_dmw2.z);
    int _144 = _81 + 12;
    uint _146 = uint(int(uint(_144) >> uint(2)));
    float _148 = as_type<float>(_dmw2.w);
    float _150 = _92 * _64;
    float _152 = _114 * _64;
    float _154 = fma(_86, _62, _150);
    float _156 = _136 * _64;
    float _158 = fma(_108, _62, _152);
    float _160 = fma(_98, _66, _154);
    float _162 = fma(_130, _62, _156);
    float _164 = fma(_120, _66, _158);
    float _166 = _104 + _160;
    float _168 = fma(_142, _66, _162);
    float _170 = _126 + _164;
    float _172 = _166 * _68;
    float _174 = _148 + _168;
    float _176 = _170 * _68;
    float _178 = _172 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _182 = _174 * _68;
    float _184 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[2].x, _178);
    float _186 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[0].x, _180);
    float _188 = _172 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _190 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[2].z, _184);
    float _192 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[0].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c7)._m0[1].x, _188);
    float _196 = _190 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _198 = _192 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c7)._m0[1].z, _194);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _204 = _196 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _208 = _198 + _206;
    float _210 = _200 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _212 = _204 * _204;
    float _214 = _210 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _216 = fma(_208, _208, _212);
    float _218 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[2].x, _214);
    float _220 = sqrt(_216);
    float _222 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].z, _218);
    float _224 = _222 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _228 = _220 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _230 = _194;
    float _232 = _212;
    float _234 = _108;
    float _236 = _222;
    if (!_228)
    {
        _230 = _224;
    }
    float _238 = _230;
    float _240 = _238;
    if (!_228)
    {
        _232 = _198;
    }
    float _242 = _232;
    float _244 = _242;
    if (!_228)
    {
        _234 = _210;
    }
    float _246 = _234;
    float _248 = _246;
    if (!_228)
    {
        _236 = _196;
    }
    float _250 = _236;
    bool _252 = !_228;
    float _254 = _250;
    if (!_252)
    {
        float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _260 = _220 + _258;
        float _262 = _210 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _264 = rsqrt(_216);
        float _266 = _260 * _256;
        float _268 = _266 * 0.15915493667125701904296875;
        float _270 = _268 * 6.283185482025146484375;
        float _272 = cos(_270);
        float _274 = _268 * 6.283185482025146484375;
        float _276 = sin(_274);
        float _278 = _272 + (-1.0);
        float _280 = fma(_276, _262, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _284 = _264 * _280;
        float _286 = fma(_210, _272, _282);
        float _288 = fma(_208, _284, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _290 = _286 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _292 = fma(_204, _284, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _294 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[2].x, _290);
        float _296 = fma(_292, (*spvDescriptorSet0.vp_c4)._m0[2].z, _294);
        float _298 = _296 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _248 = _286;
        _244 = _288;
        _254 = _292;
        _240 = _298;
    }
    float _300 = _248;
    float _302 = _244;
    float _304 = _254;
    float _306 = _240;
    float _308 = _300 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _310 = _300 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    out.m_42.x = _198;
    out.m_42.y = _210;
    out.m_42.z = _196;
    float _312 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[1].x, _308);
    float _314 = fma(_302, (*spvDescriptorSet0.vp_c4)._m0[0].x, _310);
    out.m_44.w = _224;
    float _316 = fma(_304, (*spvDescriptorSet0.vp_c4)._m0[1].z, _312);
    float _318 = fma(_304, (*spvDescriptorSet0.vp_c4)._m0[0].z, _314);
    float _320 = _316 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _322 = _318 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _324 = _320 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _326 = _320 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _328 = _320 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _330 = _320 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _332 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[7].x, _324);
    float _334 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[8].x, _326);
    float _336 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[9].x, _328);
    float _338 = fma(_322, (*spvDescriptorSet0.vp_c4)._m0[10].x, _330);
    float _340 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[7].z, _332);
    float _342 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[8].z, _334);
    float _344 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[9].z, _336);
    float _346 = fma(_306, (*spvDescriptorSet0.vp_c4)._m0[10].z, _338);
    float _348 = _340 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _350 = _342 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _352 = _344 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _354 = _346 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.gl_Position.x = _348;
    out.gl_Position.y = _350;
    out.gl_Position.z = _352;
    out.gl_Position.w = _354;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, 0u); dm_cw(dm_gs, dm_p, 17, 0u); dm_cw(dm_gs, dm_p, 18, 0u); dm_cw(dm_gs, dm_p, 19, 0x3f800000u); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

