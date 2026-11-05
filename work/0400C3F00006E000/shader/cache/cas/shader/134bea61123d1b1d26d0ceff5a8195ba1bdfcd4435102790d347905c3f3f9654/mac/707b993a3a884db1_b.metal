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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c11 [[id(0)]];
    constant _16* vp_c7 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _29* vp_s0 [[id(4)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_39 [[attribute(0)]];
    float4 m_41 [[attribute(5)]];
    uint4 m_36 [[attribute(7)]];
    float4 m_43 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _64 = in.m_39.x;
    float _66 = in.m_39.y;
    float _68 = in.m_39.z;
    float _70 = in.m_41.x;
    int _73 = as_type<int>(_62) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _75 = _73 + as_type<int>(_60);
    int _77 = _75 * 48;
    int _79 = _77 + 32;
    int _81 = _77 + 16;
    int _83 = _77 + 48;
    uint _86 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_86)];
    float _88 = as_type<float>(_dmw1.x);
    int _90 = _79 + 4;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    float _94 = as_type<float>(_dmw1.y);
    int _96 = _79 + 8;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>(_dmw1.z);
    int _102 = _79 + 12;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw1.w);
    uint _108 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_108)];
    float _110 = as_type<float>(_dmw0.x);
    int _112 = _81 + 4;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>(_dmw0.y);
    int _118 = _81 + 8;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw0.z);
    int _124 = _81 + 12;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.w);
    uint _130 = uint(int(uint(_83) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw2.x);
    int _134 = _83 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw2.y);
    int _140 = _83 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw2.z);
    int _146 = _83 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw2.w);
    float _152 = _94 * _66;
    float _154 = _116 * _66;
    float _156 = fma(_88, _64, _152);
    float _158 = _138 * _66;
    float _160 = fma(_110, _64, _154);
    float _162 = fma(_100, _68, _156);
    float _164 = fma(_132, _64, _158);
    float _166 = fma(_122, _68, _160);
    float _168 = _106 + _162;
    float _170 = fma(_144, _68, _164);
    float _172 = _128 + _166;
    float _174 = _168 * _70;
    float _176 = _150 + _170;
    float _178 = _172 * _70;
    float _180 = _174 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _184 = _176 * _70;
    float _186 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[2].x, _180);
    float _188 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[0].x, _182);
    float _190 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[2].z, _186);
    float _192 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[0].z, _188);
    float _194 = _190 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _196 = _192 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _198 = _174 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _202 = _194 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _206 = _196 + _204;
    float _208 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[1].x, _198);
    float _210 = _202 * _202;
    float _212 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[1].z, _208);
    float _214 = fma(_206, _206, _210);
    float _216 = _212 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _218 = sqrt(_214);
    float _220 = _216 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _222 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].x, _220);
    float _224 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].z, _222);
    float _226 = _224 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _230 = _218 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _232 = _220;
    float _234 = _196;
    float _236 = _194;
    float _238 = _226;
    if (!_230)
    {
        _232 = _196;
    }
    float _240 = _232;
    float _242 = _240;
    if (!_230)
    {
        _234 = _216;
    }
    float _244 = _234;
    bool _246 = !_230;
    float _248 = _244;
    if (!_246)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _254 = _218 + _252;
        float _256 = _216 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = rsqrt(_214);
        float _260 = _254 * _250;
        float _262 = _260 * 0.15915493667125701904296875;
        float _264 = _262 * 6.283185482025146484375;
        float _266 = cos(_264);
        float _268 = _262 * 6.283185482025146484375;
        float _270 = sin(_268);
        float _272 = _266 + (-1.0);
        float _274 = _272 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _276 = fma(_270, _256, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _278 = fma(_216, _266, _274);
        float _280 = _258 * _276;
        float _282 = _278 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _284 = fma(_206, _280, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _286 = fma(_202, _280, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _288 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[2].x, _282);
        float _290 = fma(_286, (*spvDescriptorSet0.vp_c4)._m0[2].z, _288);
        float _292 = _290 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _248 = _278;
        _242 = _284;
        _236 = _286;
        _238 = _292;
    }
    float _294 = _248;
    float _296 = _242;
    float _298 = _236;
    float _300 = _238;
    float _302 = _294 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _306 = in.m_43.x;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[1].x, _302);
    float _310 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[0].x, _304);
    float _312 = in.m_43.y;
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[1].z, _308);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[0].z, _310);
    float _318 = _314 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _320 = _316 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _322 = _318 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _324 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[9].x, _322);
    float _326 = _318 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _328 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[9].z, _324);
    float _330 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[10].x, _326);
    out.m_46.x = _306;
    float _332 = _328 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[10].z, _330);
    out.m_46.y = _312;
    float _336 = _332 * 10000.0;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _334 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _342 = _338 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _344 = _318 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _346 = _318 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _348 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[10].z, _340);
    float _350 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[7].x, _344);
    float _352 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[8].x, _346);
    float _354 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[9].z, _332);
    float _356 = 1.0 / _348;
    float _358 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[7].z, _350);
    float _360 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[8].z, _352);
    float _362 = _358 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _364 = _360 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _366 = _340 * _356;
    float _368 = _354 * _366;
    out.gl_Position.x = _362;
    out.gl_Position.y = _364;
    out.gl_Position.z = _368;
    out.gl_Position.w = _340;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _64 = in.m_39.x;
    float _66 = in.m_39.y;
    float _68 = in.m_39.z;
    float _70 = in.m_41.x;
    int _73 = as_type<int>(_62) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _75 = _73 + as_type<int>(_60);
    int _77 = _75 * 48;
    int _79 = _77 + 32;
    int _81 = _77 + 16;
    int _83 = _77 + 48;
    uint _86 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_86)];
    float _88 = as_type<float>(_dmw1.x);
    int _90 = _79 + 4;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    float _94 = as_type<float>(_dmw1.y);
    int _96 = _79 + 8;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>(_dmw1.z);
    int _102 = _79 + 12;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw1.w);
    uint _108 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_108)];
    float _110 = as_type<float>(_dmw0.x);
    int _112 = _81 + 4;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>(_dmw0.y);
    int _118 = _81 + 8;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw0.z);
    int _124 = _81 + 12;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.w);
    uint _130 = uint(int(uint(_83) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw2.x);
    int _134 = _83 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw2.y);
    int _140 = _83 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw2.z);
    int _146 = _83 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw2.w);
    float _152 = _94 * _66;
    float _154 = _116 * _66;
    float _156 = fma(_88, _64, _152);
    float _158 = _138 * _66;
    float _160 = fma(_110, _64, _154);
    float _162 = fma(_100, _68, _156);
    float _164 = fma(_132, _64, _158);
    float _166 = fma(_122, _68, _160);
    float _168 = _106 + _162;
    float _170 = fma(_144, _68, _164);
    float _172 = _128 + _166;
    float _174 = _168 * _70;
    float _176 = _150 + _170;
    float _178 = _172 * _70;
    float _180 = _174 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _184 = _176 * _70;
    float _186 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[2].x, _180);
    float _188 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[0].x, _182);
    float _190 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[2].z, _186);
    float _192 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[0].z, _188);
    float _194 = _190 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _196 = _192 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _198 = _174 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _202 = _194 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _206 = _196 + _204;
    float _208 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[1].x, _198);
    float _210 = _202 * _202;
    float _212 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[1].z, _208);
    float _214 = fma(_206, _206, _210);
    float _216 = _212 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _218 = sqrt(_214);
    float _220 = _216 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _222 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].x, _220);
    float _224 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].z, _222);
    float _226 = _224 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _230 = _218 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _232 = _220;
    float _234 = _196;
    float _236 = _194;
    float _238 = _226;
    if (!_230)
    {
        _232 = _196;
    }
    float _240 = _232;
    float _242 = _240;
    if (!_230)
    {
        _234 = _216;
    }
    float _244 = _234;
    bool _246 = !_230;
    float _248 = _244;
    if (!_246)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _254 = _218 + _252;
        float _256 = _216 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = rsqrt(_214);
        float _260 = _254 * _250;
        float _262 = _260 * 0.15915493667125701904296875;
        float _264 = _262 * 6.283185482025146484375;
        float _266 = cos(_264);
        float _268 = _262 * 6.283185482025146484375;
        float _270 = sin(_268);
        float _272 = _266 + (-1.0);
        float _274 = _272 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _276 = fma(_270, _256, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _278 = fma(_216, _266, _274);
        float _280 = _258 * _276;
        float _282 = _278 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _284 = fma(_206, _280, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _286 = fma(_202, _280, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _288 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[2].x, _282);
        float _290 = fma(_286, (*spvDescriptorSet0.vp_c4)._m0[2].z, _288);
        float _292 = _290 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _248 = _278;
        _242 = _284;
        _236 = _286;
        _238 = _292;
    }
    float _294 = _248;
    float _296 = _242;
    float _298 = _236;
    float _300 = _238;
    float _302 = _294 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _306 = in.m_43.x;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[1].x, _302);
    float _310 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[0].x, _304);
    float _312 = in.m_43.y;
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[1].z, _308);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[0].z, _310);
    float _318 = _314 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _320 = _316 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _322 = _318 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _324 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[9].x, _322);
    float _326 = _318 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _328 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[9].z, _324);
    float _330 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[10].x, _326);
    out.m_46.x = _306;
    float _332 = _328 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[10].z, _330);
    out.m_46.y = _312;
    float _336 = _332 * 10000.0;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _334 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _342 = _338 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _344 = _318 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _346 = _318 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _348 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[10].z, _340);
    float _350 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[7].x, _344);
    float _352 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[8].x, _346);
    float _354 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[9].z, _332);
    float _356 = 1.0 / _348;
    float _358 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[7].z, _350);
    float _360 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[8].z, _352);
    float _362 = _358 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _364 = _360 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _366 = _340 * _356;
    float _368 = _354 * _366;
    out.gl_Position.x = _362;
    out.gl_Position.y = _364;
    out.gl_Position.z = _368;
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
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(in.m_36.x);
    float _62 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[0]);
    float _64 = in.m_39.x;
    float _66 = in.m_39.y;
    float _68 = in.m_39.z;
    float _70 = in.m_41.x;
    int _73 = as_type<int>(_62) * as_type<int>((*spvDescriptorSet0.vp_c7)._m0[9].y);
    int _75 = _73 + as_type<int>(_60);
    int _77 = _75 * 48;
    int _79 = _77 + 32;
    int _81 = _77 + 16;
    int _83 = _77 + 48;
    uint _86 = uint(int(uint(_79) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_86)];
    float _88 = as_type<float>(_dmw1.x);
    int _90 = _79 + 4;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    float _94 = as_type<float>(_dmw1.y);
    int _96 = _79 + 8;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    float _100 = as_type<float>(_dmw1.z);
    int _102 = _79 + 12;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    float _106 = as_type<float>(_dmw1.w);
    uint _108 = uint(int(uint(_81) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_108)];
    float _110 = as_type<float>(_dmw0.x);
    int _112 = _81 + 4;
    uint _114 = uint(int(uint(_112) >> uint(2)));
    float _116 = as_type<float>(_dmw0.y);
    int _118 = _81 + 8;
    uint _120 = uint(int(uint(_118) >> uint(2)));
    float _122 = as_type<float>(_dmw0.z);
    int _124 = _81 + 12;
    uint _126 = uint(int(uint(_124) >> uint(2)));
    float _128 = as_type<float>(_dmw0.w);
    uint _130 = uint(int(uint(_83) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_130)];
    float _132 = as_type<float>(_dmw2.x);
    int _134 = _83 + 4;
    uint _136 = uint(int(uint(_134) >> uint(2)));
    float _138 = as_type<float>(_dmw2.y);
    int _140 = _83 + 8;
    uint _142 = uint(int(uint(_140) >> uint(2)));
    float _144 = as_type<float>(_dmw2.z);
    int _146 = _83 + 12;
    uint _148 = uint(int(uint(_146) >> uint(2)));
    float _150 = as_type<float>(_dmw2.w);
    float _152 = _94 * _66;
    float _154 = _116 * _66;
    float _156 = fma(_88, _64, _152);
    float _158 = _138 * _66;
    float _160 = fma(_110, _64, _154);
    float _162 = fma(_100, _68, _156);
    float _164 = fma(_132, _64, _158);
    float _166 = fma(_122, _68, _160);
    float _168 = _106 + _162;
    float _170 = fma(_144, _68, _164);
    float _172 = _128 + _166;
    float _174 = _168 * _70;
    float _176 = _150 + _170;
    float _178 = _172 * _70;
    float _180 = _174 * (*spvDescriptorSet0.vp_c7)._m0[2].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _184 = _176 * _70;
    float _186 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[2].x, _180);
    float _188 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[0].x, _182);
    float _190 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[2].z, _186);
    float _192 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[0].z, _188);
    float _194 = _190 + (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _196 = _192 + (*spvDescriptorSet0.vp_c7)._m0[0].w;
    float _198 = _174 * (*spvDescriptorSet0.vp_c7)._m0[1].y;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _202 = _194 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _206 = _196 + _204;
    float _208 = fma(_178, (*spvDescriptorSet0.vp_c7)._m0[1].x, _198);
    float _210 = _202 * _202;
    float _212 = fma(_184, (*spvDescriptorSet0.vp_c7)._m0[1].z, _208);
    float _214 = fma(_206, _206, _210);
    float _216 = _212 + (*spvDescriptorSet0.vp_c7)._m0[1].w;
    float _218 = sqrt(_214);
    float _220 = _216 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _222 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[2].x, _220);
    float _224 = fma(_194, (*spvDescriptorSet0.vp_c4)._m0[2].z, _222);
    float _226 = _224 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _230 = _218 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _232 = _220;
    float _234 = _196;
    float _236 = _194;
    float _238 = _226;
    if (!_230)
    {
        _232 = _196;
    }
    float _240 = _232;
    float _242 = _240;
    if (!_230)
    {
        _234 = _216;
    }
    float _244 = _234;
    bool _246 = !_230;
    float _248 = _244;
    if (!_246)
    {
        float _250 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _254 = _218 + _252;
        float _256 = _216 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _258 = rsqrt(_214);
        float _260 = _254 * _250;
        float _262 = _260 * 0.15915493667125701904296875;
        float _264 = _262 * 6.283185482025146484375;
        float _266 = cos(_264);
        float _268 = _262 * 6.283185482025146484375;
        float _270 = sin(_268);
        float _272 = _266 + (-1.0);
        float _274 = _272 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _276 = fma(_270, _256, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _278 = fma(_216, _266, _274);
        float _280 = _258 * _276;
        float _282 = _278 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _284 = fma(_206, _280, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _286 = fma(_202, _280, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _288 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[2].x, _282);
        float _290 = fma(_286, (*spvDescriptorSet0.vp_c4)._m0[2].z, _288);
        float _292 = _290 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _248 = _278;
        _242 = _284;
        _236 = _286;
        _238 = _292;
    }
    float _294 = _248;
    float _296 = _242;
    float _298 = _236;
    float _300 = _238;
    float _302 = _294 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _306 = in.m_43.x;
    float _308 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[1].x, _302);
    float _310 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[0].x, _304);
    float _312 = in.m_43.y;
    float _314 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[1].z, _308);
    float _316 = fma(_298, (*spvDescriptorSet0.vp_c4)._m0[0].z, _310);
    float _318 = _314 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _320 = _316 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _322 = _318 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _324 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[9].x, _322);
    float _326 = _318 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _328 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[9].z, _324);
    float _330 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[10].x, _326);
    out.m_46.x = _306;
    float _332 = _328 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _334 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[10].z, _330);
    out.m_46.y = _312;
    float _336 = _332 * 10000.0;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _334 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    float _342 = _338 * (*spvDescriptorSet0.vp_c11)._m0[42].x;
    float _344 = _318 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _346 = _318 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _348 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[10].z, _340);
    float _350 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[7].x, _344);
    float _352 = fma(_320, (*spvDescriptorSet0.vp_c4)._m0[8].x, _346);
    float _354 = fma(_342, (*spvDescriptorSet0.vp_c4)._m0[9].z, _332);
    float _356 = 1.0 / _348;
    float _358 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[7].z, _350);
    float _360 = fma(_300, (*spvDescriptorSet0.vp_c4)._m0[8].z, _352);
    float _362 = _358 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _364 = _360 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _366 = _340 * _356;
    float _368 = _354 * _366;
    out.gl_Position.x = _362;
    out.gl_Position.y = _364;
    out.gl_Position.z = _368;
    out.gl_Position.w = _340;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

