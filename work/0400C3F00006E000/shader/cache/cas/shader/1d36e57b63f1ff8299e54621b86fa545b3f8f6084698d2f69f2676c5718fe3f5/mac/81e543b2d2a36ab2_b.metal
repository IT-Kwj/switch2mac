#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c11 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _33* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d_array<float> vp_t_tcb_14 [[id(16)]];
    sampler vp_t_tcb_14Smplr [[id(17)]];
    texture2d<float> vp_t_tcb_1C [[id(18)]];
    sampler vp_t_tcb_1CSmplr [[id(19)]];
    sampler vp_t_tcb_24Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_95 [[user(locn0)]];
    float4 m_91 [[user(locn1)]];
    float4 m_93 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_111 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_103 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_109 [[user(locn10)]];
    float4 m_105 [[user(locn11)]];
    float4 m_107 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_87 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_68 [[attribute(6)]];
    float4 m_76 [[attribute(7)]];
    float4 m_80 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2516 = false;
    bool _476 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_63.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_66.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2801 = as_type<float>(_146);
        out.gl_Position.z = _2801;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_68.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_66.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2869 = as_type<float>(_182);
        out.gl_Position.z = _2869;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _184 = in.m_70.x;
    float _186 = in.m_70.y;
    float _188 = in.m_70.z;
    float _190 = in.m_72.x;
    float _192 = in.m_72.y;
    float _194 = in.m_72.z;
    float _196 = in.m_74.x;
    float _198 = in.m_74.y;
    float _200 = in.m_74.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    if (_226)
    {
        float _232 = rsqrt(_214);
        _230 = _232;
    }
    float _234 = _230;
    float _236 = 0.0;
    if (!_226)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _224 > 0.0;
    float _242 = 0.0;
    float _244 = _224;
    float _246 = _238;
    if (!_226)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_226)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _220;
    float _256 = _252;
    if (_228)
    {
        float _258 = rsqrt(_216);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_228)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    float _274 = _266;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _276 = _270;
    float _278 = 0.0;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_218);
        _278 = _282;
    }
    float _284 = _278;
    if (_226)
    {
        float _286 = _234 * _190;
        _246 = _286;
    }
    float _288 = _246;
    if (_226)
    {
        float _290 = _234 * _184;
        _250 = _290;
    }
    float _292 = _250;
    if (_226)
    {
        float _294 = _234 * _196;
        _256 = _294;
    }
    float _296 = _256;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_240)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _306;
    float _312 = _304;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _314 = _308;
    float _316 = _314;
    if (_228)
    {
        float _318 = _260 * _192;
        _280 = _318;
    }
    float _320 = _280;
    if (_228)
    {
        float _322 = _260 * _186;
        _272 = _322;
    }
    float _324 = _272;
    if (_228)
    {
        float _326 = _260 * _198;
        _274 = _326;
    }
    float _328 = _274;
    if (_240)
    {
        float _330 = _284 * _194;
        _310 = _330;
    }
    float _332 = _310;
    if (_240)
    {
        float _334 = _284 * _188;
        _316 = _334;
    }
    float _336 = _316;
    if (_240)
    {
        float _338 = _284 * _200;
        _312 = _338;
    }
    float _340 = _312;
    bool _342 = !_298;
    float _360;
    if (!_342)
    {
        float _344 = in.m_76.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_130);
        float _366 = 1.0 / _364;
        float _368 = _164 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = in.m_76.x;
    float _374 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _370 + _376;
    bool _380 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_370);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _392;
    float _396 = -_390;
    float _398 = _396 + 1.0;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = 1.0 / _394;
    float _404 = _374 * _372;
    float _406 = _378 * _402;
    bool _408 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_370);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = trunc(_404);
    int _430 = int(_428);
    float _432 = _418 * _398;
    float _434 = fma(_422, _406, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_426, _406, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _438 = -_418;
    float _440 = _438 + 1.0;
    float _442 = _434 * _432;
    float _444 = _436 * _432;
    float _446 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _450 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[144].x, _446);
    float _452 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[144].y, _448);
    int _454 = _430 << 4;
    int _456 = _454 + 1712;
    bool _458 = !_400;
    float _474;
    if (!_458)
    {
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _462 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_130);
        float _480 = 1.0 / _478;
        float _482 = _164 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = in.m_63.x;
    float _488 = in.m_63.y;
    float _490 = in.m_63.z;
    float _492 = in.m_74.w;
    float _494 = in.m_72.w;
    float _496 = _198 * _488;
    float _498 = _192 * _488;
    float _500 = fma(_196, _486, _496);
    float _502 = fma(_190, _486, _498);
    float _504 = fma(_200, _490, _500);
    float _506 = fma(_194, _490, _502);
    float _508 = _504 + _492;
    float _510 = _506 + _494;
    float _512 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _514 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _516 = floor(_512);
    float _518 = floor(_514);
    float _520 = -_516;
    float _522 = _512 + _520;
    float _524 = -_518;
    float _526 = _514 + _524;
    float2 _3373 = float2(_526, _522);
    float _528 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3373, float2(0.0), isnan(_3373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3373, float2(0.0), isnan(_3373)), level(0.0)).x;
    float _530 = in.m_78.w;
    float _532 = in.m_70.w;
    float _534 = _186 * _488;
    float _536 = in.m_80.x;
    float _538 = in.m_80.y;
    float _540 = trunc(_530);
    int _542 = int(_540);
    int _544 = _542 << 5;
    uint _547 = uint(int(uint(_544) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_547)];
    float _549 = as_type<float>(_dmw0.x);
    int _551 = _544 + 4;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    float _555 = as_type<float>(_dmw0.y);
    int _557 = _544 + 8;
    uint _559 = uint(int(uint(_557) >> uint(2)));
    float _561 = as_type<float>(_dmw0.z);
    int _563 = _544 + 12;
    uint _565 = uint(int(uint(_563) >> uint(2)));
    float _567 = as_type<float>(_dmw0.w);
    float _569 = fma(_184, _486, _534);
    float _571 = _450 * _536;
    float _573 = as_type<float>(int(gl_VertexIndex));
    float _575 = fma(_188, _490, _569);
    float _577 = _452 * _538;
    float _579 = _575 + _532;
    float _581 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _583 = _579 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _585 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _583);
    float _587 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _585);
    float _589 = _579 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = _587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _593 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    int _595 = as_type<int>(_573) & 1;
    bool _597 = _595 != 0;
    int _599 = as_type<int>(_573) & 2;
    bool _601 = _599 != 0;
    float _603 = 1.0 / _591;
    float _605 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _593);
    float _607 = _571 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _609 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _611 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _613 = _609 || _611;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    float _619 = _605 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _621 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _623 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.5);
    bool _629 = _625 || _627;
    float _631 = _619 + _591;
    float _633 = _631 * _603;
    float _635 = _633 * 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _639 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[30].w, _637);
    float _641 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _643 = 1.0 / _639;
    bool _645 = !_601;
    float _647 = _645 ? (-0.5) : 0.5;
    float _649 = _579 + _641;
    bool _651 = !_597;
    float _653 = _651 ? (-0.5) : 0.5;
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _647);
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _659 = _649 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _661 = _581 * _655;
    float _663 = _607 * _657;
    float _665 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _667 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[126].x, _659);
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _671 = _643 * _669;
    float _673 = _649 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _675 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[126].z, _667);
    float _677 = _665 * _320;
    bool _679 = _671 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _681 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[127].x, _673);
    bool _683 = _671 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _685 = _665 * _328;
    float _687 = _675 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _689 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[127].z, _681);
    bool _691 = !_679;
    int _693 = _691 ? 0 : 1;
    float _695 = fma(_663, _296, _685);
    float _697 = fma(_663, _288, _677);
    float _699 = _689 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _701 = trunc(_687);
    int _703 = int(_701);
    float _705 = -_661;
    float _707 = fma(_705, _340, _695);
    float _709 = -_661;
    float _711 = fma(_709, _332, _697);
    int _713 = 2;
    float _715 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _717 = _699;
    if (!_679)
    {
        _713 = 1;
    }
    int _719 = _713;
    float _721 = _665 * _324;
    int _723 = _719;
    if (!_683)
    {
        _723 = _693;
    }
    int _725 = _723;
    float _727 = _508 + _707;
    float _729 = _510 + _711;
    float _731 = trunc(_699);
    int _733 = int(_731);
    int _735 = _725 << 6;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _727 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _729 + _741;
    float _745 = fma(_663, _292, _721);
    int _747 = _735 + 48;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.vp_c15)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.vp_c15)._m0[int(_759)][_761];
    float _765 = _739 * _739;
    int _767 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _769 = _703 + _767;
    int _771 = _769 + 1;
    float _773 = -_661;
    float _775 = fma(_773, _336, _745);
    bool _777 = _771 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _779 = _735 + 56;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    uint _783 = uint(int(uint(int(_781)) >> uint(2)));
    int _785 = int(_781) & 3;
    float _787 = (*spvDescriptorSet0.vp_c15)._m0[int(_783)][_785];
    int _789 = int(_781) + 1;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    int _793 = _789 & 3;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[int(_791)][_793];
    float _797 = _579 + _775;
    int _799 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _801 = _733 + _799;
    int _803 = _801 + 1;
    float _805 = fma(_743, _743, _765);
    int _807 = _771 | _803;
    int _809 = _735 + 64;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.vp_c15)._m0[int(_813)][_815];
    int _819 = int(_811) + 1;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    int _823 = _819 & 3;
    float _825 = (*spvDescriptorSet0.vp_c15)._m0[int(_821)][_823];
    float _827 = sqrt(_805);
    bool _829 = _807 < 0;
    bool _831 = _829 || _777;
    bool _833 = _803 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _835 = _833 || _831;
    int _837 = _735 + 72;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.vp_c15)._m0[int(_841)][_843];
    int _847 = int(_839) + 1;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    int _851 = _847 & 3;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[int(_849)][_851];
    int _855 = _735 + 96;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    bool _873 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _875 = _771;
    if (!_835)
    {
        int _877 = _803 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _879 = _877 + _771;
        _875 = _879;
    }
    int _881 = _875;
    int _883 = _735 + 104;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    int _893 = int(_885) + 1;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    int _897 = _893 & 3;
    float _899 = (*spvDescriptorSet0.vp_c15)._m0[int(_895)][_897];
    int _901 = 0;
    if (!_835)
    {
        int _903 = _881 << 2;
        _901 = _903;
    }
    int _905 = _901;
    int _907 = _905;
    if (!_835)
    {
        int _909 = 12 & _905;
        _907 = _909;
    }
    int _911 = _907;
    float _913 = 0.0;
    if (!_873)
    {
        _913 = _729;
    }
    float _915 = _913;
    float _917 = _915;
    if (!_873)
    {
        _715 = _797;
    }
    float _919 = _715;
    float _921 = _567 * 2.0;
    float _923 = _549 * 2.0;
    float _925 = _555 * 2.0;
    float _927 = _549 * _549;
    float _929 = _561 * _921;
    float _931 = _555 * _921;
    float _933 = _549 * _921;
    float _935 = _561 * _561;
    float _937 = -_929;
    float _939 = fma(_555, _923, _937);
    float _941 = fma(_555, _923, _929);
    float _943 = fma(_561, _923, _931);
    float _945 = -_931;
    float _947 = fma(_561, _923, _945);
    float _949 = -_933;
    float _951 = fma(_561, _925, _949);
    float _953 = fma(_561, _925, _933);
    float _955 = _555 * _555;
    float _957 = _561;
    int _959 = as_type<int>(_927);
    float _961 = _919;
    if (!_873)
    {
        _957 = _727;
    }
    float _963 = _957;
    float _965 = fma(_927, -2.0, 1.0);
    float _967 = fma(_955, -2.0, 1.0);
    float _969 = _963;
    if (!_835)
    {
        uint _971 = uint(int(uint(_881) >> uint(2)));
        _959 = int(_971);
    }
    int _973 = _959;
    bool _975 = !_873;
    float _977 = 0.0;
    if (!_975)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _983 = _827 + _981;
        float _985 = _797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = rsqrt(_805);
        float _989 = _983 * _979;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _991 * 6.283185482025146484375;
        float _995 = cos(_993);
        float _997 = _991 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 + (-1.0);
        float _1003 = fma(_999, _985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1005 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = _987 * _1003;
        float _1009 = fma(_797, _995, _1005);
        float _1011 = fma(_743, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1013 = fma(_739, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _961 = _1009;
        _977 = _991;
        _917 = _1011;
        _969 = _1013;
    }
    float _1015 = _961;
    float _1017 = _977;
    float _1019 = _917;
    float _1021 = _969;
    float _1023 = _1017;
    if (!_835)
    {
        int _1025 = _973 << 4;
        int _1027 = _1025 + _911;
        _1023 = as_type<float>(_1027);
    }
    float _1029 = _1023;
    float _1031 = _649 * _871;
    float _1033 = -_579;
    float _1035 = _1033 + _1015;
    float _1037 = fma(_935, -2.0, _967);
    float _1039 = fma(_935, -2.0, _965);
    float _1041 = fma(_510, _863, _1031);
    float _1043 = _1029;
    if (!_835)
    {
        int _1045 = as_type<int>(_1029) + 400;
        uint _1047 = uint(int(uint(_1045) >> uint(2)));
        uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
        int _1051 = int(_1047) & 3;
        float _1053 = (*spvDescriptorSet0.vp_c15)._m0[int(_1049)][_1051];
        _1043 = _1053;
    }
    float _1055 = _1043;
    float _1057 = fma(_955, -2.0, _965);
    float _1059 = -_510;
    float _1061 = _1059 + _1019;
    float _1063 = _1035 * _324;
    float _1065 = fma(_508, _891, _1041);
    float _1067 = _1035 * _292;
    float _1069 = _1035 * _336;
    float _1071 = _649 * _763;
    float _1073 = -_508;
    float _1075 = _1073 + _1021;
    float _1077 = fma(_1061, _320, _1063);
    float _1079 = _1065 + _899;
    float _1081 = fma(_1061, _288, _1067);
    float _1083 = fma(_1061, _332, _1069);
    float _1085 = fma(_510, _755, _1071);
    float _1087 = fma(_1075, _328, _1077);
    float _1089 = _649 * _825;
    float _1091 = fma(_1075, _296, _1081);
    float _1093 = 1.0 / _1079;
    float _1095 = fma(_1075, _340, _1083);
    float _1097 = _1087 * _939;
    float _1099 = _1087 * _1039;
    float _1101 = _1087 * _953;
    int _1103 = _735 + 80;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    uint _1107 = uint(int(uint(int(_1105)) >> uint(2)));
    int _1109 = int(_1105) & 3;
    float _1111 = (*spvDescriptorSet0.vp_c15)._m0[int(_1107)][_1109];
    int _1113 = int(_1105) + 1;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    int _1117 = _1113 & 3;
    float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
    float _1121 = fma(_508, _787, _1085);
    float _1123 = fma(_1091, _941, _1099);
    float _1125 = _899;
    float _1127 = _1079;
    float _1129 = _1057;
    if (!_835)
    {
        float _1131 = floor(_687);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = _1121 + _795;
    float _1137 = fma(_1095, _951, _1123);
    int _1139 = _735 + 88;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    uint _1143 = uint(int(uint(int(_1141)) >> uint(2)));
    int _1145 = int(_1141) & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    int _1149 = int(_1141) + 1;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    int _1153 = _1149 & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    float _1157 = fma(_510, _817, _1089);
    float _1159 = fma(_1091, _1037, _1097);
    float _1161 = fma(_1091, _947, _1101);
    float _1163 = fma(_508, _845, _1157);
    float _1165 = fma(_1095, _943, _1159);
    float _1167 = fma(_1095, _1057, _1161);
    float _1169 = _579 + _1137;
    float _1171 = _1163 + _853;
    float _1173 = _510 + _1165;
    float _1175 = _508 + _1167;
    float _1177 = _1135 * _1093;
    float _1179 = _1169;
    float _1181 = _1173;
    float _1183 = _1175;
    float _1185 = _1119;
    float _1187 = _1111;
    if (!_617)
    {
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1191 = _579 + _1189;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1195 = _510 + _1193;
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1199 = _1191 * _1191;
        float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1203 = _508 + _1201;
        float _1205 = fma(_1195, _1195, _1199);
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1209 = fma(_1203, _1203, _1205);
        float _1211 = sqrt(_1209);
        float _1213 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = precise::min(_1211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1217 = _1215 * _1207;
        float _1219 = _1213 * _1217;
        float _1221 = fma(_1137, _1219, _579);
        float _1223 = fma(_1165, _1219, _510);
        float _1225 = fma(_1167, _1219, _508);
        _1179 = _1221;
        _1181 = _1223;
        _1183 = _1225;
    }
    float _1227 = _1179;
    float _1229 = _1181;
    float _1231 = _1183;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1237 = _795;
    if (!_835)
    {
        float _1239 = floor(_699);
        _1237 = _1239;
    }
    float _1241 = _1237;
    float _1243 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1233);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1235);
    bool _1249 = _1177 >= 0.0;
    float _1251 = _1171 * _1093;
    float _1253 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1245);
    float _1255 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1257 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1247);
    float _1259 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1243);
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1263 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1255);
    float _1265 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1267 = _1177 <= 1.0;
    bool _1269 = _1267 && _1249;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1273 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1263);
    float _1275 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1277 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1259);
    bool _1279 = _1251 >= 0.0;
    bool _1281 = _1279 && _1269;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1285 = -_1271;
    float _1287 = fma(_1285, _1265, 1.0);
    float _1289 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1291 = _1273;
    if (_629)
    {
        _1291 = 1.0;
    }
    float _1293 = _1291;
    float _1295 = _1293;
    float _1297 = _1241;
    if (!_629)
    {
        float _1299 = as_type<float>(in.m_87.w);
        int _1301 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1303 = _1301 == 4;
        bool _1305 = _1301 == 8;
        bool _1307 = _1301 == 12;
        int _1309 = as_type<int>(_1299) << 16;
        int _1311 = as_type<int>(_1299) << 8;
        int _1313 = as_type<int>(_1299) << 24;
        int _1315 = _1309 >> 24;
        int _1317 = _1311 >> 24;
        int _1319 = as_type<int>(_1299) >> 24;
        int _1321 = _1313 >> 24;
        float _1323 = float(_1315);
        float _1325 = float(_1317);
        float _1327 = float(_1319);
        float _1329 = _1323 * 0.0078740157186985015869140625;
        float _1331 = float(_1321);
        float _1333 = _1325 * 0.0078740157186985015869140625;
        float _1335 = _1327 * 0.0078740157186985015869140625;
        float _1337 = precise::min(_1329, 1.0);
        float _1339 = _1331 * 0.0078740157186985015869140625;
        float _1341 = precise::min(_1333, 1.0);
        float _1343 = precise::min(_1335, 1.0);
        float _1345 = precise::min(_1339, 1.0);
        float _1347 = precise::max(_1337, -1.0);
        float _1349 = precise::max(_1341, -1.0);
        float _1351 = precise::max(_1343, -1.0);
        float _1353 = precise::max(_1345, -1.0);
        float _1355 = _1353;
        if (_1303)
        {
            _1355 = _1347;
        }
        float _1357 = _1355;
        float _1359 = _1357;
        if (_1305)
        {
            _1359 = _1349;
        }
        float _1361 = _1359;
        float _1363 = _1361;
        if (_1307)
        {
            _1363 = _1351;
        }
        float _1365 = _1363;
        float _1367 = abs(_1365);
        float _1369 = (-0.0) + _1367;
        _1295 = _1369;
    }
    float _1371 = _1295;
    float _1373 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1289);
    bool _1375 = _1251 <= 1.0;
    bool _1377 = _1375 && _1281;
    float _1379 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1381 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1383 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1373);
    float _1385 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1387 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1379);
    bool _1389 = _1371 != 0.0;
    bool _1391 = isnan(_1371);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1383);
    float _1401 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1385);
    float _1403 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1387);
    float _1405 = log2(_1287);
    float _1407 = _649 * _1119;
    float _1409 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1401);
    float _1411 = _1387;
    if (_1377)
    {
        float _1413 = float(_725);
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1403);
    float _1419 = fma(_510, _1111, _1407);
    if (!_835)
    {
        float _1421 = -_1241;
        float _1423 = _699 + _1421;
        _1127 = _1423;
    }
    float _1425 = _1127;
    float _1427 = _1425;
    if (!_835)
    {
        float _1429 = -_1133;
        float _1431 = _687 + _1429;
        _1297 = _1431;
    }
    float _1433 = _1297;
    float _1435 = 1.0 / _1399;
    float _1437 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    if (_1397)
    {
        _1185 = _1417;
    }
    float _1439 = _1185;
    float _1441 = fma(_508, _1147, _1419);
    float _1443 = _1439;
    if (_1397)
    {
        _1187 = _1437;
    }
    float _1445 = _1187;
    float _1447 = _1445;
    if (!_1397)
    {
        _1443 = 0.0;
        _1447 = 0.0;
    }
    float _1449 = _1443;
    float _1451 = _1447;
    float _1453 = _1409;
    if (_1377)
    {
        float _1455 = rint(_1415);
        float _1457 = precise::max(_1455, 0.0);
        uint _1459 = uint(_1457);
        uint _1461 = clamp(_1459, 0u, 65535u);
        _1453 = as_type<float>(_1461);
    }
    float _1463 = _1453;
    float _1465 = _1441 + _1155;
    float _1467 = _1405 * 0.693147182464599609375;
    float _1469 = _1465 * _1093;
    float _1471 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1473 = _1403;
    if (!_835)
    {
        float _1475 = rint(_1055);
        float _1477 = precise::max(_1475, 0.0);
        uint _1479 = uint(_1477);
        uint _1481 = clamp(_1479, 0u, 65535u);
        _1473 = as_type<float>(_1481);
    }
    float _1483 = _1473;
    float _1485 = _1435 * _1449;
    float _1487 = _1435 * _1451;
    float _1489 = fma(_1485, 0.5, 0.5);
    float _1491 = fma(_1487, -0.5, 0.5);
    float _1493 = _1251;
    float _1495 = _1489;
    float _1497 = _1491;
    if (_1377)
    {
        float3 _4931 = float3(_1177, _1251, float(as_type<int>(_1463)));
        float3 _4935 = select(_4931, float3(0.0), isnan(_4931));
        float _1499 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4935.xy, uint(rint(_4935.z)), _1469, level(0.0));
        _1493 = _1499;
    }
    float _1501 = _1493;
    float3 _4945 = float3(_1489, _1491, _1471);
    float _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).x;
    float3 _4954 = float3(_1489, _1491, _1471);
    float4 _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4954, float3(0.0), isnan(_4954)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4954, float3(0.0), isnan(_4954)), level(0.0)).xyzw;
    float _1508 = _1506.x;
    float _1510 = _1506.y;
    float _1512 = _1506.z;
    float _1514 = _1506.w;
    float _1516 = _1133;
    if (!_835)
    {
        float3 _4977 = float3(_1433, _1425, float(as_type<int>(_1483)));
        float3 _4979 = select(_4977, float3(0.0), isnan(_4977));
        float _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4979.xy, uint(rint(_4979.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4979.xy, uint(rint(_4979.z)), level(0.0)).x;
        _1516 = _1518;
    }
    float _1520 = _1516;
    if (_835)
    {
        _717 = 1.0;
    }
    float _1522 = _717;
    float _1524 = _1522;
    if (!_835)
    {
        int _1526 = _881 << 4;
        int _1528 = _1526 + 2048;
        uint _1530 = uint(int(uint(_1528) >> uint(2)));
        uint _1532 = uint(int(uint(int(_1530)) >> uint(2)));
        int _1534 = int(_1530) & 3;
        float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
        int _1538 = int(_1530) + 1;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        int _1542 = _1538 & 3;
        float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
        int _1546 = _1528 + 8;
        uint _1548 = uint(int(uint(_1546) >> uint(2)));
        uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
        int _1552 = int(_1548) & 3;
        float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
        int _1556 = int(_1548) + 1;
        uint _1558 = uint(int(uint(_1556) >> uint(2)));
        int _1560 = _1556 & 3;
        float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
        float _1564 = _649 * _1544;
        float _1566 = fma(_510, _1536, _1564);
        float _1568 = fma(_508, _1554, _1566);
        float _1570 = _1568 + _1562;
        float _1572 = precise::clamp(_1570, 0.0, 1.0);
        float _1574 = -_1572;
        float _1576 = _1574 + _1520;
        float _1578 = fma(_1576, 500.0, 1.5);
        float _1580 = exp2(_1578);
        float _1582 = 0.0 + _1580;
        float _1584 = precise::clamp(_1582, 0.0, 1.0);
        _1524 = _1584;
    }
    float _1586 = _1524;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1590 = _1227 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1594 = _1229 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1231 + _1596;
    float _1600 = _1590 * _1590;
    float _1602 = fma(_1594, _1594, _1600);
    float _1604 = fma(_1598, _1598, _1602);
    float _1606 = rsqrt(_1604);
    float _1608 = sqrt(_1604);
    float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1612 = _1594 * _1610;
    float _1614 = _1598 * _1610;
    float _1616 = _1612 * _1612;
    float _1618 = _1614 * _1614;
    float _1620 = _1616 + _1618;
    float _1622 = sqrt(_1620);
    bool _1624 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1628 = _1622 + _1626;
    float _1630 = _1606;
    float _1632 = _1628;
    float _1634 = _1590;
    if (_1624)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1630 = _1636;
    }
    float _1638 = _1630;
    if (_1624)
    {
        float _1640 = rsqrt(_1620);
        _1495 = _1640;
    }
    float _1642 = _1495;
    float _1644 = _1642;
    if (_1624)
    {
        float _1646 = _1628 * _1638;
        _1632 = _1646;
    }
    float _1648 = _1632;
    if (_1624)
    {
        float _1650 = _1648 * 0.15915493667125701904296875;
        _1497 = _1650;
    }
    float _1652 = _1497;
    float _1654 = _1598;
    if (_1624)
    {
        float _1656 = _1652 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        _1654 = _1658;
    }
    float _1660 = _1654;
    float _1662 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1664 = precise::max(0.0, _1662);
    float _1666 = _1638;
    float _1668 = _1664;
    if (_1624)
    {
        float _1670 = _1652 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        _1666 = _1672;
    }
    float _1674 = _1666;
    float _1676 = -_1610;
    float _1678 = -_1664;
    float _1680 = fma(_1590, _1676, _1678);
    if (_1624)
    {
        float _1682 = _1680 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1682;
    }
    float _1684 = _1634;
    float _1686 = _1684;
    float _1688 = _1660;
    if (_1624)
    {
        float _1690 = fma(_1660, _1684, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1686 = _1690;
    }
    float _1692 = _1686;
    float _1694 = _1692;
    if (!_1624)
    {
        _1688 = _1612;
    }
    float _1696 = _1688;
    float _1698 = _1696;
    float _1700 = _1674;
    if (_1624)
    {
        float _1702 = _1674 + (-1.0);
        _1668 = _1702;
    }
    float _1704 = _1668;
    float _1706 = 0.0;
    float _1708 = _1704;
    if (_1624)
    {
        float _1710 = _1642 * _1692;
        _1706 = _1710;
    }
    float _1712 = _1706;
    if (!_1624)
    {
        _1694 = _1680;
    }
    float _1714 = _1694;
    float _1716 = _1714;
    if (_1624)
    {
        float _1718 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1718;
    }
    float _1720 = _1427;
    if (_1624)
    {
        float _1722 = _1612 * _1712;
        _1698 = _1722;
    }
    float _1724 = _1698;
    if (!_1624)
    {
        _1708 = _1614;
    }
    float _1726 = _1708;
    float _1728 = _1726;
    if (_1624)
    {
        float _1730 = _1614 * _1712;
        _1728 = _1730;
    }
    float _1732 = _1728;
    if (!_1624)
    {
        _1644 = _1616;
    }
    float _1734 = _1644;
    float _1736 = _1734;
    if (_1624)
    {
        float _1738 = fma(_1680, _1674, _1720);
        _1716 = _1738;
    }
    float _1740 = _1716;
    if (_1624)
    {
        float _1742 = _1724 * _1724;
        _1736 = _1742;
    }
    float _1744 = _1736;
    if (!_1624)
    {
        _1700 = _1618;
    }
    float _1746 = _1700;
    float _1748 = _1746;
    if (_1624)
    {
        float _1750 = _1732 * _1732;
        _1748 = _1750;
    }
    float _1752 = _1748;
    float _1754 = fma(_1740, _1740, _1744);
    float _1756 = _1754 + _1752;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1760 = fma(_1608, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1758);
    float _1762 = precise::clamp(_1760, 0.0, 1.0);
    float _1764 = -_1762;
    float _1766 = _1764 + 1.0;
    float _1768 = rsqrt(_1756);
    float _1770 = abs(_1766);
    float _1772 = log2(_1770);
    float _1774 = _1768 * _1724;
    float _1776 = _1768 * _1740;
    float _1778 = _1768 * _1732;
    float _1780 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = -_1780;
    float _1784 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = -_1778;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1790 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = fma(_1788, -0.5, 0.5);
    float _1794 = fma(_1788, 0.5, 0.5);
    float _1796 = exp2(_1790);
    float _1798 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1800 = fma(_1794, _1798, -0.212114393711090087890625);
    float _1802 = _1776 + 1.0;
    float _1804 = sqrt(_1792);
    float _1806 = fma(_1794, _1800, 1.570728778839111328125);
    float _1808 = -_1776;
    float _1810 = fma(_1796, _1802, _1808);
    float _1812 = fma(_1810, 0.5, 0.5);
    float _1814 = _1804 * 0.636619746685028076171875;
    float _1816 = -_1806;
    float _1818 = fma(_1814, _1816, 1.0);
    float2 _5448 = float2(_1818, _1812);
    float3 _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5448, float2(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5448, float2(0.0), isnan(_5448)), level(0.0)).xyz;
    float _1824 = _1822.x;
    float _1826 = _1822.y;
    float _1828 = _1822.z;
    float _1830 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1832 = in.m_76.y;
    float _1834 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1836 = _1830 * _372;
    float _1838 = in.m_76.w;
    bool _1840 = _372 > 0.5;
    float _1842 = exp2(_1834);
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1846 = _1844 != 0;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1852 = in.m_76.z;
    bool _1854 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1856 = isnan(_484);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = -_528;
    float _1868 = _1866 + 1.0;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1872 = _1870 != 0;
    out.m_89.x = _1229;
    out.m_89.y = _1227;
    out.m_89.z = _1231;
    float _1874 = trunc(_1836);
    int _1876 = int(_1874);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1880 = _1878 != 0;
    float _1882 = 1.0 / _1850;
    bool _1884 = _1832 > 0.5;
    bool _1886 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1888 = isnan(_484);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_647;
    int _1900 = _1884 ? as_type<int>(_1898) : as_type<int>(_647);
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1904 = _1902 != 0;
    int _1906 = _1876 << 4;
    int _1908 = _1906 + 1968;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1910;
    bool _1914 = !_1846;
    float _1916 = _1914 ? _647 : as_type<float>(_1900);
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1920 = uint(int(uint(_1908) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    bool _1936 = _1838 > 0.5;
    float _1938 = _1912 * _1882;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1942 = _484 + _1940;
    float _1944 = -_1896;
    float _1946 = _1944 + 1.0;
    float _1948 = -_647;
    int _1950 = _1936 ? as_type<int>(_1948) : as_type<int>(_647);
    float _1952 = -_1916;
    float _1954 = _1952 + 0.5;
    int _1956 = _1908 + 8;
    uint _1958 = uint(int(uint(_1956) >> uint(2)));
    uint _1960 = uint(int(uint(int(_1958)) >> uint(2)));
    int _1962 = int(_1958) & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    float _1966 = fma(_1938, _1942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1968 = _1852 > 0.5;
    float _1970 = _1864 * _1946;
    float _1972 = -_1864;
    float _1974 = _1972 + 1.0;
    float _1976 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    uint _1978 = uint(int(uint(_456) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    float _1994 = _1966 * _1970;
    bool _1996 = !_1872;
    float _1998 = _1996 ? _647 : as_type<float>(_1950);
    float _2000 = _647 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2004 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2002);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2006);
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1994);
    float _2012 = fma(_2000, _2000, 1.0);
    float _2014 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2004);
    float _2016 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2008);
    float _2018 = -_1998;
    float _2020 = _2018 + 0.5;
    float _2022 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2010);
    float _2024 = _510 + _2014;
    float _2026 = rsqrt(_2012);
    float _2028 = -_653;
    int _2030 = _1840 ? as_type<int>(_2028) : as_type<int>(_653);
    int _2032 = _456 + 8;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    bool _2042 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2044 = isnan(0.0);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2050 = _2046 || _2048;
    float _2052 = _508 + _2016;
    bool _2054 = !_1880;
    float _2056 = _2054 ? _653 : as_type<float>(_2030);
    float _2058 = _653 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2060 = -_653;
    int _2062 = _1968 ? as_type<int>(_2060) : as_type<int>(_653);
    float _2064 = -_2052;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2070 = fma(_2058, _292, _324);
    float _2072 = fma(_2058, _296, _328);
    float _2074 = _2056 + 0.5;
    float _2076 = precise::min(_2052, _2066);
    bool _2078 = !_1904;
    float _2080 = _2078 ? _653 : as_type<float>(_2062);
    float _2082 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_2050)
    {
        float _2084 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2082 = _2084;
    }
    float _2086 = _2082;
    float _2088 = -_332;
    float _2090 = _2026 * _2088;
    float _2092 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2094 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2096 = fma(_2058, _288, _320);
    float _2098 = _1934 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2100 = _2086;
    if (_2050)
    {
        float _2102 = precise::min(_2086, 20.0);
        _2100 = _2102;
    }
    float _2104 = _2100;
    float _2106 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = -_2000;
    float _2110 = fma(_2108, _332, _2096);
    float _2112 = -_2000;
    float _2114 = fma(_2112, _336, _2070);
    float _2116 = -_2000;
    float _2118 = fma(_2116, _340, _2072);
    float _2120 = _1964 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2122 = _2000 * _2026;
    float _2124 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2126 = -_336;
    float _2128 = _2026 * _2126;
    float _2130 = -_340;
    float _2132 = _2026 * _2130;
    float _2134 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2138 = -_2024;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2142 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2144 = -_2122;
    float _2146 = fma(_2144, _328, _2132);
    out.m_91.x = _2106;
    out.m_91.y = _2124;
    out.m_91.z = _2134;
    float _2148 = _2114 * _1039;
    float _2150 = precise::min(_2024, _2140);
    float _2152 = -_2122;
    float _2154 = fma(_2152, _320, _2090);
    float _2156 = _1984;
    float _2158 = _1992;
    if (_2050)
    {
        float _2160 = 1.0 / _2104;
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = precise::min(_2150, _2076);
    float _2168 = _2080 + 0.5;
    if (!_2050)
    {
        _2158 = 1.0;
    }
    float _2170 = _2158;
    float _2172 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2174 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2176 = _2092 * _1918;
    float _2178 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2182 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2184 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2186 = _2178 * _2136;
    float _2188 = -_2122;
    float _2190 = fma(_2188, _324, _2128);
    float _2192 = _2114 * _939;
    float _2194 = _2170;
    if (_2050)
    {
        float _2196 = _2166 * _2162;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _939 * _292;
    float _2204 = _2190 * _939;
    float _2206 = _2114 * _953;
    float _2208 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2210 = abs(_671);
    float _2212 = log2(_2210);
    float _2214 = _2182 * _2068;
    float _2216 = _1039 * _292;
    float _2218 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2220 = _953 * _292;
    float _2222 = _2184 * _2180;
    float _2224 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2226 = fma(_941, _288, _2216);
    float _2228 = fma(_2110, _947, _2206);
    float _2230 = _2190 * _1039;
    out.m_93.x = _2176;
    out.m_93.y = _2214;
    out.m_93.z = _2222;
    out.m_93.w = _2186;
    bool _2232 = _671 <= 8000.0;
    bool _2234 = isnan(_671);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan(8000.0);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    out.m_95.x = _2172;
    out.m_95.y = _2174;
    out.m_95.z = _2218;
    out.m_95.w = _2224;
    float _2244 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2246 = exp2(_2244);
    float _2248 = _2190 * _953;
    float _2250 = fma(_1037, _288, _2202);
    float _2252 = fma(_947, _288, _2220);
    float _2254 = fma(_2110, _1037, _2192);
    float _2256 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2258 = fma(_2154, _947, _2248);
    float _2260 = fma(_943, _296, _2250);
    float _2262 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2256);
    float _2264 = fma(_2146, _1057, _2258);
    float _2266 = fma(_951, _296, _2226);
    float _2268 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2262);
    float _2270 = fma(_1057, _296, _2252);
    float _2272 = fma(_2154, _1037, _2204);
    float _2274 = fma(_2110, _941, _2148);
    float _2276 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2268);
    float _2278 = fma(_2154, _941, _2230);
    out.m_97.x = _2260;
    out.m_97.y = _2266;
    out.m_97.z = _2270;
    float _2280 = fma(_2146, _943, _2272);
    float _2282 = _2276 + _1399;
    float _2284 = fma(_2146, _951, _2278);
    float _2286 = _2278;
    float _2288 = _2242;
    if (!_1397)
    {
        _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2290 = _2286;
    float _2292 = _2282 * 0.5;
    float _2294 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    out.gl_Position.x = _1417;
    out.gl_Position.y = _1437;
    out.gl_Position.z = _2276;
    out.gl_Position.w = _1399;
    int _2298 = as_type<int>(_2290);
    if (!_1397)
    {
        float _2300 = _2290 * 5.0;
        _2298 = as_type<int>(_2300);
    }
    int _2302 = _2298;
    float _2304 = fma(_2296, -2.0, 3.0);
    float _2306 = fma(_2118, _943, _2254);
    float _2308 = _2296 * _2296;
    float _2310 = -_1842;
    float _2312 = _2310 + 1.0;
    float _2314 = fma(_2118, _951, _2274);
    if (!_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6294 = as_type<float>(_2302);
        out.gl_Position.z = _6294;
    }
    float _2316 = _2308 * _2304;
    float _2318 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2320 = fma(_2118, _1057, _2228);
    out.m_99.x = _2280;
    out.m_99.y = _2284;
    out.m_99.z = _2264;
    float _2322 = -_2316;
    float _2324 = _2322 + 1.0;
    float _2326 = _2318 * _1503;
    float _2328 = -_2318;
    float _2330 = _2328 + 1.0;
    out.m_101.z = _2292;
    out.m_101.w = _1399;
    float _2332 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2316);
    float _2334 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2336 = _1514 * _2330;
    float _2338 = _1514 * _2326;
    float _2340 = _2242 * _2332;
    float _2342 = _2318;
    float _2344 = _2340;
    float _2346 = _2330;
    if (!_1377)
    {
        _2288 = 1.0;
    }
    float _2348 = _2288;
    out.m_103.x = _2306;
    out.m_103.y = _2314;
    out.m_103.z = _2320;
    float _2350 = _2348;
    if (_1377)
    {
        bool _2352 = _1501 >= _1469;
        bool _2354 = isnan(_1501);
        bool _2356 = _2352 || _2354;
        bool _2358 = isnan(_1469);
        bool _2360 = _2356 || _2358;
        float _2362 = float(_2360);
        _2350 = _2362;
    }
    float _2364 = _2350;
    float _2366 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2368 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_1608);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    float _2378 = _2334 * _1371;
    float _2380 = _1868 * _2366;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2364 * _1586;
    float _2386 = _2366;
    float _2388 = _2384;
    if (_1397)
    {
        _1129 = _2378;
    }
    float _2390 = _1129;
    float _2392 = -_2382;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2396 = _2390;
    if (!_1397)
    {
        _2396 = 0.0;
    }
    float _2398 = _2396;
    float _2400 = -_2384;
    float _2402 = fma(_2400, _2394, 1.0);
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    if (!_2376)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2406 = _2342;
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2410 = _2408;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2376)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2416 = _2344;
    float _2418 = _2416;
    float _2420 = _2416;
    if (!_2376)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2422 = _2386;
    out.m_105.x = _2408;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2376)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2346;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2376)
    {
        _2388 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2434 = _2388;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2376)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2440 = _2410;
    float _2442 = _1828 * _2326;
    float _2444 = fma(_1824, _2338, _1508);
    float _2446 = fma(_1826, _2338, _1510);
    float _2448 = fma(_1514, _2442, _1512);
    out.m_107.x = _2444;
    out.m_107.y = _2446;
    out.m_107.z = _2448;
    out.m_107.w = _2336;
    bool _2450 = !_2376;
    float _2452 = _2440;
    float _2454 = _2440;
    if (!_2450)
    {
        bool _2456 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2458 = isnan(_1608);
        bool _2460 = _2456 || _2458;
        bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2464 = _2460 || _2462;
        if (!_2464)
        {
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2468 = _1608 + _2466;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2470;
            float _2474 = 1.0 / _2472;
            float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2496 = _2468 * _2474;
            float _2498 = precise::clamp(_2496, 0.0, 1.0);
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2504 = fma(_2498, _2478, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2506 = fma(_2498, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2508 = fma(_2498, _2482, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2510 = fma(_2498, _2486, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2512 = fma(_2498, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2514 = fma(_2498, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2420 = _2506;
            _2438 = _2512;
            _2414 = _2504;
            _2432 = _2510;
            _2426 = _2508;
            _2454 = _2514;
            _2516 = true;
        }
        else
        {
            bool _2518 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2520 = isnan(_1608);
            bool _2522 = _2518 || _2520;
            bool _2524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2526 = _2522 || _2524;
            if (!_2526)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2528 = _2412;
            _2414 = _2528;
            if (!_2526)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2530 = _2418;
            _2420 = _2530;
            if (!_2526)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2532 = _2424;
            _2426 = _2532;
            if (!_2526)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2534 = _2430;
            _2432 = _2534;
            if (!_2526)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2536 = _2436;
            _2438 = _2536;
            if (!_2526)
            {
                _2452 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2538 = _2452;
            bool _2540 = !_2526;
            _2454 = _2538;
            if (!_2540)
            {
                bool _2542 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2544 = isnan(_1608);
                bool _2546 = _2542 || _2544;
                bool _2548 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2550 = _2546 || _2548;
                if (!_2550)
                {
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2554 = _1608 + _2552;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2556;
                    float _2560 = 1.0 / _2558;
                    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2582 = _2554 * _2560;
                    float _2584 = precise::clamp(_2582, 0.0, 1.0);
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2590 = fma(_2584, _2564, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2592 = fma(_2584, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2594 = fma(_2584, _2568, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2596 = fma(_2584, _2572, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2598 = fma(_2584, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2600 = fma(_2584, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2420 = _2592;
                    _2438 = _2598;
                    _2414 = _2590;
                    _2432 = _2596;
                    _2426 = _2594;
                    _2454 = _2600;
                    _2516 = true;
                }
                else
                {
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2454 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2516 = false;
    float _2602 = _2420;
    float _2604 = _2438;
    float _2606 = _2414;
    float _2608 = _2432;
    float _2610 = _2426;
    float _2612 = _2454;
    float _2614 = fma(_2314, -0.5, 0.5);
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = -_2602;
    float _2620 = _2618 + _2604;
    float _2622 = -_2606;
    float _2624 = _2622 + _2608;
    float _2626 = -_2610;
    float _2628 = _2626 + _2612;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2632 = fma(_2616, _2620, _2602);
    float _2634 = fma(_2616, _2624, _2606);
    float _2636 = fma(_2616, _2628, _2610);
    float _2638 = _2398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2640 = _2632 * 0.586610972881317138671875;
    out.m_66.x = 1.0;
    float _2642 = fma(_2634, 0.298911988735198974609375, _2640);
    out.m_105.w = _2638;
    float _2644 = fma(_2636, 0.114477999508380889892578125, _2642);
    out.m_109.x = 0.0;
    float _2646 = -_2644;
    float _2648 = _2634 + _2646;
    float _2650 = -_2644;
    float _2652 = _2632 + _2650;
    float _2654 = -_2644;
    float _2656 = _2636 + _2654;
    float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2660 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2662 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    out.m_111.x = _2658;
    out.m_111.y = _2660;
    out.m_111.z = _2662;
    if (!_2630)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2664 = -_1227;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2668 = -_1229;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2672 = -_1231;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2676 = _2666 * _2666;
    float _2678 = fma(_2670, _2670, _2676);
    float _2680 = fma(_2674, _2674, _2678);
    float _2682 = sqrt(_2680);
    float _2684 = rsqrt(_2680);
    float _2686 = -_2682;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2692 = precise::clamp(_2690, 0.0, 1.0);
    float _2694 = _2670 * _2684;
    float _2696 = _2666 * _2684;
    float _2698 = abs(_2692);
    float _2700 = log2(_2698);
    float _2702 = _2674 * _2684;
    float _2704 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2706 = _2314 * _2696;
    float _2708 = -_2696;
    float _2710 = -_2704;
    float _2712 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2710);
    float _2714 = fma(_2306, _2694, _2706);
    float _2716 = -_2702;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2712);
    float _2720 = fma(_2320, _2702, _2714);
    float _2722 = precise::clamp(_2720, 0.0, 1.0);
    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2726 = _2718 + _2724;
    float _2728 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = exp2(_2728);
    float _2736 = _2734 * _2732;
    float _2738 = _2722 * _2736;
    float _2740 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2742 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2744 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2740;
    out.m_109.y = _2742;
    out.m_109.z = _2744;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2516 = false;
    bool _476 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_63.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_66.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2801 = as_type<float>(_146);
        out.gl_Position.z = _2801;
    }
    if (!_134)
    {
        return out;
    }
    float _150 = in.m_68.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_66.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2869 = as_type<float>(_182);
        out.gl_Position.z = _2869;
    }
    if (_176)
    {
        return out;
    }
    float _184 = in.m_70.x;
    float _186 = in.m_70.y;
    float _188 = in.m_70.z;
    float _190 = in.m_72.x;
    float _192 = in.m_72.y;
    float _194 = in.m_72.z;
    float _196 = in.m_74.x;
    float _198 = in.m_74.y;
    float _200 = in.m_74.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    if (_226)
    {
        float _232 = rsqrt(_214);
        _230 = _232;
    }
    float _234 = _230;
    float _236 = 0.0;
    if (!_226)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _224 > 0.0;
    float _242 = 0.0;
    float _244 = _224;
    float _246 = _238;
    if (!_226)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_226)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _220;
    float _256 = _252;
    if (_228)
    {
        float _258 = rsqrt(_216);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_228)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    float _274 = _266;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _276 = _270;
    float _278 = 0.0;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_218);
        _278 = _282;
    }
    float _284 = _278;
    if (_226)
    {
        float _286 = _234 * _190;
        _246 = _286;
    }
    float _288 = _246;
    if (_226)
    {
        float _290 = _234 * _184;
        _250 = _290;
    }
    float _292 = _250;
    if (_226)
    {
        float _294 = _234 * _196;
        _256 = _294;
    }
    float _296 = _256;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_240)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _306;
    float _312 = _304;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _314 = _308;
    float _316 = _314;
    if (_228)
    {
        float _318 = _260 * _192;
        _280 = _318;
    }
    float _320 = _280;
    if (_228)
    {
        float _322 = _260 * _186;
        _272 = _322;
    }
    float _324 = _272;
    if (_228)
    {
        float _326 = _260 * _198;
        _274 = _326;
    }
    float _328 = _274;
    if (_240)
    {
        float _330 = _284 * _194;
        _310 = _330;
    }
    float _332 = _310;
    if (_240)
    {
        float _334 = _284 * _188;
        _316 = _334;
    }
    float _336 = _316;
    if (_240)
    {
        float _338 = _284 * _200;
        _312 = _338;
    }
    float _340 = _312;
    bool _342 = !_298;
    float _360;
    if (!_342)
    {
        float _344 = in.m_76.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_130);
        float _366 = 1.0 / _364;
        float _368 = _164 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = in.m_76.x;
    float _374 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _370 + _376;
    bool _380 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_370);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _392;
    float _396 = -_390;
    float _398 = _396 + 1.0;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = 1.0 / _394;
    float _404 = _374 * _372;
    float _406 = _378 * _402;
    bool _408 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_370);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = trunc(_404);
    int _430 = int(_428);
    float _432 = _418 * _398;
    float _434 = fma(_422, _406, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_426, _406, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _438 = -_418;
    float _440 = _438 + 1.0;
    float _442 = _434 * _432;
    float _444 = _436 * _432;
    float _446 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _450 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[144].x, _446);
    float _452 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[144].y, _448);
    int _454 = _430 << 4;
    int _456 = _454 + 1712;
    bool _458 = !_400;
    float _474;
    if (!_458)
    {
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _462 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_130);
        float _480 = 1.0 / _478;
        float _482 = _164 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = in.m_63.x;
    float _488 = in.m_63.y;
    float _490 = in.m_63.z;
    float _492 = in.m_74.w;
    float _494 = in.m_72.w;
    float _496 = _198 * _488;
    float _498 = _192 * _488;
    float _500 = fma(_196, _486, _496);
    float _502 = fma(_190, _486, _498);
    float _504 = fma(_200, _490, _500);
    float _506 = fma(_194, _490, _502);
    float _508 = _504 + _492;
    float _510 = _506 + _494;
    float _512 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _514 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _516 = floor(_512);
    float _518 = floor(_514);
    float _520 = -_516;
    float _522 = _512 + _520;
    float _524 = -_518;
    float _526 = _514 + _524;
    float2 _3373 = float2(_526, _522);
    float _528 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3373, float2(0.0), isnan(_3373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3373, float2(0.0), isnan(_3373)), level(0.0)).x;
    float _530 = in.m_78.w;
    float _532 = in.m_70.w;
    float _534 = _186 * _488;
    float _536 = in.m_80.x;
    float _538 = in.m_80.y;
    float _540 = trunc(_530);
    int _542 = int(_540);
    int _544 = _542 << 5;
    uint _547 = uint(int(uint(_544) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_547)];
    float _549 = as_type<float>(_dmw0.x);
    int _551 = _544 + 4;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    float _555 = as_type<float>(_dmw0.y);
    int _557 = _544 + 8;
    uint _559 = uint(int(uint(_557) >> uint(2)));
    float _561 = as_type<float>(_dmw0.z);
    int _563 = _544 + 12;
    uint _565 = uint(int(uint(_563) >> uint(2)));
    float _567 = as_type<float>(_dmw0.w);
    float _569 = fma(_184, _486, _534);
    float _571 = _450 * _536;
    float _573 = as_type<float>(int(gl_VertexIndex));
    float _575 = fma(_188, _490, _569);
    float _577 = _452 * _538;
    float _579 = _575 + _532;
    float _581 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _583 = _579 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _585 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _583);
    float _587 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _585);
    float _589 = _579 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = _587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _593 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    int _595 = as_type<int>(_573) & 1;
    bool _597 = _595 != 0;
    int _599 = as_type<int>(_573) & 2;
    bool _601 = _599 != 0;
    float _603 = 1.0 / _591;
    float _605 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _593);
    float _607 = _571 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _609 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _611 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _613 = _609 || _611;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    float _619 = _605 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _621 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _623 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.5);
    bool _629 = _625 || _627;
    float _631 = _619 + _591;
    float _633 = _631 * _603;
    float _635 = _633 * 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _639 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[30].w, _637);
    float _641 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _643 = 1.0 / _639;
    bool _645 = !_601;
    float _647 = _645 ? (-0.5) : 0.5;
    float _649 = _579 + _641;
    bool _651 = !_597;
    float _653 = _651 ? (-0.5) : 0.5;
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _647);
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _659 = _649 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _661 = _581 * _655;
    float _663 = _607 * _657;
    float _665 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _667 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[126].x, _659);
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _671 = _643 * _669;
    float _673 = _649 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _675 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[126].z, _667);
    float _677 = _665 * _320;
    bool _679 = _671 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _681 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[127].x, _673);
    bool _683 = _671 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _685 = _665 * _328;
    float _687 = _675 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _689 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[127].z, _681);
    bool _691 = !_679;
    int _693 = _691 ? 0 : 1;
    float _695 = fma(_663, _296, _685);
    float _697 = fma(_663, _288, _677);
    float _699 = _689 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _701 = trunc(_687);
    int _703 = int(_701);
    float _705 = -_661;
    float _707 = fma(_705, _340, _695);
    float _709 = -_661;
    float _711 = fma(_709, _332, _697);
    int _713 = 2;
    float _715 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _717 = _699;
    if (!_679)
    {
        _713 = 1;
    }
    int _719 = _713;
    float _721 = _665 * _324;
    int _723 = _719;
    if (!_683)
    {
        _723 = _693;
    }
    int _725 = _723;
    float _727 = _508 + _707;
    float _729 = _510 + _711;
    float _731 = trunc(_699);
    int _733 = int(_731);
    int _735 = _725 << 6;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _727 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _729 + _741;
    float _745 = fma(_663, _292, _721);
    int _747 = _735 + 48;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.vp_c15)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.vp_c15)._m0[int(_759)][_761];
    float _765 = _739 * _739;
    int _767 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _769 = _703 + _767;
    int _771 = _769 + 1;
    float _773 = -_661;
    float _775 = fma(_773, _336, _745);
    bool _777 = _771 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _779 = _735 + 56;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    uint _783 = uint(int(uint(int(_781)) >> uint(2)));
    int _785 = int(_781) & 3;
    float _787 = (*spvDescriptorSet0.vp_c15)._m0[int(_783)][_785];
    int _789 = int(_781) + 1;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    int _793 = _789 & 3;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[int(_791)][_793];
    float _797 = _579 + _775;
    int _799 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _801 = _733 + _799;
    int _803 = _801 + 1;
    float _805 = fma(_743, _743, _765);
    int _807 = _771 | _803;
    int _809 = _735 + 64;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.vp_c15)._m0[int(_813)][_815];
    int _819 = int(_811) + 1;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    int _823 = _819 & 3;
    float _825 = (*spvDescriptorSet0.vp_c15)._m0[int(_821)][_823];
    float _827 = sqrt(_805);
    bool _829 = _807 < 0;
    bool _831 = _829 || _777;
    bool _833 = _803 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _835 = _833 || _831;
    int _837 = _735 + 72;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.vp_c15)._m0[int(_841)][_843];
    int _847 = int(_839) + 1;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    int _851 = _847 & 3;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[int(_849)][_851];
    int _855 = _735 + 96;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    bool _873 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _875 = _771;
    if (!_835)
    {
        int _877 = _803 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _879 = _877 + _771;
        _875 = _879;
    }
    int _881 = _875;
    int _883 = _735 + 104;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    int _893 = int(_885) + 1;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    int _897 = _893 & 3;
    float _899 = (*spvDescriptorSet0.vp_c15)._m0[int(_895)][_897];
    int _901 = 0;
    if (!_835)
    {
        int _903 = _881 << 2;
        _901 = _903;
    }
    int _905 = _901;
    int _907 = _905;
    if (!_835)
    {
        int _909 = 12 & _905;
        _907 = _909;
    }
    int _911 = _907;
    float _913 = 0.0;
    if (!_873)
    {
        _913 = _729;
    }
    float _915 = _913;
    float _917 = _915;
    if (!_873)
    {
        _715 = _797;
    }
    float _919 = _715;
    float _921 = _567 * 2.0;
    float _923 = _549 * 2.0;
    float _925 = _555 * 2.0;
    float _927 = _549 * _549;
    float _929 = _561 * _921;
    float _931 = _555 * _921;
    float _933 = _549 * _921;
    float _935 = _561 * _561;
    float _937 = -_929;
    float _939 = fma(_555, _923, _937);
    float _941 = fma(_555, _923, _929);
    float _943 = fma(_561, _923, _931);
    float _945 = -_931;
    float _947 = fma(_561, _923, _945);
    float _949 = -_933;
    float _951 = fma(_561, _925, _949);
    float _953 = fma(_561, _925, _933);
    float _955 = _555 * _555;
    float _957 = _561;
    int _959 = as_type<int>(_927);
    float _961 = _919;
    if (!_873)
    {
        _957 = _727;
    }
    float _963 = _957;
    float _965 = fma(_927, -2.0, 1.0);
    float _967 = fma(_955, -2.0, 1.0);
    float _969 = _963;
    if (!_835)
    {
        uint _971 = uint(int(uint(_881) >> uint(2)));
        _959 = int(_971);
    }
    int _973 = _959;
    bool _975 = !_873;
    float _977 = 0.0;
    if (!_975)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _983 = _827 + _981;
        float _985 = _797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = rsqrt(_805);
        float _989 = _983 * _979;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _991 * 6.283185482025146484375;
        float _995 = cos(_993);
        float _997 = _991 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 + (-1.0);
        float _1003 = fma(_999, _985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1005 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = _987 * _1003;
        float _1009 = fma(_797, _995, _1005);
        float _1011 = fma(_743, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1013 = fma(_739, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _961 = _1009;
        _977 = _991;
        _917 = _1011;
        _969 = _1013;
    }
    float _1015 = _961;
    float _1017 = _977;
    float _1019 = _917;
    float _1021 = _969;
    float _1023 = _1017;
    if (!_835)
    {
        int _1025 = _973 << 4;
        int _1027 = _1025 + _911;
        _1023 = as_type<float>(_1027);
    }
    float _1029 = _1023;
    float _1031 = _649 * _871;
    float _1033 = -_579;
    float _1035 = _1033 + _1015;
    float _1037 = fma(_935, -2.0, _967);
    float _1039 = fma(_935, -2.0, _965);
    float _1041 = fma(_510, _863, _1031);
    float _1043 = _1029;
    if (!_835)
    {
        int _1045 = as_type<int>(_1029) + 400;
        uint _1047 = uint(int(uint(_1045) >> uint(2)));
        uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
        int _1051 = int(_1047) & 3;
        float _1053 = (*spvDescriptorSet0.vp_c15)._m0[int(_1049)][_1051];
        _1043 = _1053;
    }
    float _1055 = _1043;
    float _1057 = fma(_955, -2.0, _965);
    float _1059 = -_510;
    float _1061 = _1059 + _1019;
    float _1063 = _1035 * _324;
    float _1065 = fma(_508, _891, _1041);
    float _1067 = _1035 * _292;
    float _1069 = _1035 * _336;
    float _1071 = _649 * _763;
    float _1073 = -_508;
    float _1075 = _1073 + _1021;
    float _1077 = fma(_1061, _320, _1063);
    float _1079 = _1065 + _899;
    float _1081 = fma(_1061, _288, _1067);
    float _1083 = fma(_1061, _332, _1069);
    float _1085 = fma(_510, _755, _1071);
    float _1087 = fma(_1075, _328, _1077);
    float _1089 = _649 * _825;
    float _1091 = fma(_1075, _296, _1081);
    float _1093 = 1.0 / _1079;
    float _1095 = fma(_1075, _340, _1083);
    float _1097 = _1087 * _939;
    float _1099 = _1087 * _1039;
    float _1101 = _1087 * _953;
    int _1103 = _735 + 80;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    uint _1107 = uint(int(uint(int(_1105)) >> uint(2)));
    int _1109 = int(_1105) & 3;
    float _1111 = (*spvDescriptorSet0.vp_c15)._m0[int(_1107)][_1109];
    int _1113 = int(_1105) + 1;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    int _1117 = _1113 & 3;
    float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
    float _1121 = fma(_508, _787, _1085);
    float _1123 = fma(_1091, _941, _1099);
    float _1125 = _899;
    float _1127 = _1079;
    float _1129 = _1057;
    if (!_835)
    {
        float _1131 = floor(_687);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = _1121 + _795;
    float _1137 = fma(_1095, _951, _1123);
    int _1139 = _735 + 88;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    uint _1143 = uint(int(uint(int(_1141)) >> uint(2)));
    int _1145 = int(_1141) & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    int _1149 = int(_1141) + 1;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    int _1153 = _1149 & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    float _1157 = fma(_510, _817, _1089);
    float _1159 = fma(_1091, _1037, _1097);
    float _1161 = fma(_1091, _947, _1101);
    float _1163 = fma(_508, _845, _1157);
    float _1165 = fma(_1095, _943, _1159);
    float _1167 = fma(_1095, _1057, _1161);
    float _1169 = _579 + _1137;
    float _1171 = _1163 + _853;
    float _1173 = _510 + _1165;
    float _1175 = _508 + _1167;
    float _1177 = _1135 * _1093;
    float _1179 = _1169;
    float _1181 = _1173;
    float _1183 = _1175;
    float _1185 = _1119;
    float _1187 = _1111;
    if (!_617)
    {
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1191 = _579 + _1189;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1195 = _510 + _1193;
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1199 = _1191 * _1191;
        float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1203 = _508 + _1201;
        float _1205 = fma(_1195, _1195, _1199);
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1209 = fma(_1203, _1203, _1205);
        float _1211 = sqrt(_1209);
        float _1213 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = precise::min(_1211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1217 = _1215 * _1207;
        float _1219 = _1213 * _1217;
        float _1221 = fma(_1137, _1219, _579);
        float _1223 = fma(_1165, _1219, _510);
        float _1225 = fma(_1167, _1219, _508);
        _1179 = _1221;
        _1181 = _1223;
        _1183 = _1225;
    }
    float _1227 = _1179;
    float _1229 = _1181;
    float _1231 = _1183;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1237 = _795;
    if (!_835)
    {
        float _1239 = floor(_699);
        _1237 = _1239;
    }
    float _1241 = _1237;
    float _1243 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1233);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1235);
    bool _1249 = _1177 >= 0.0;
    float _1251 = _1171 * _1093;
    float _1253 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1245);
    float _1255 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1257 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1247);
    float _1259 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1243);
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1263 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1255);
    float _1265 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1267 = _1177 <= 1.0;
    bool _1269 = _1267 && _1249;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1273 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1263);
    float _1275 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1277 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1259);
    bool _1279 = _1251 >= 0.0;
    bool _1281 = _1279 && _1269;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1285 = -_1271;
    float _1287 = fma(_1285, _1265, 1.0);
    float _1289 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1291 = _1273;
    if (_629)
    {
        _1291 = 1.0;
    }
    float _1293 = _1291;
    float _1295 = _1293;
    float _1297 = _1241;
    if (!_629)
    {
        float _1299 = as_type<float>(in.m_87.w);
        int _1301 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1303 = _1301 == 4;
        bool _1305 = _1301 == 8;
        bool _1307 = _1301 == 12;
        int _1309 = as_type<int>(_1299) << 16;
        int _1311 = as_type<int>(_1299) << 8;
        int _1313 = as_type<int>(_1299) << 24;
        int _1315 = _1309 >> 24;
        int _1317 = _1311 >> 24;
        int _1319 = as_type<int>(_1299) >> 24;
        int _1321 = _1313 >> 24;
        float _1323 = float(_1315);
        float _1325 = float(_1317);
        float _1327 = float(_1319);
        float _1329 = _1323 * 0.0078740157186985015869140625;
        float _1331 = float(_1321);
        float _1333 = _1325 * 0.0078740157186985015869140625;
        float _1335 = _1327 * 0.0078740157186985015869140625;
        float _1337 = precise::min(_1329, 1.0);
        float _1339 = _1331 * 0.0078740157186985015869140625;
        float _1341 = precise::min(_1333, 1.0);
        float _1343 = precise::min(_1335, 1.0);
        float _1345 = precise::min(_1339, 1.0);
        float _1347 = precise::max(_1337, -1.0);
        float _1349 = precise::max(_1341, -1.0);
        float _1351 = precise::max(_1343, -1.0);
        float _1353 = precise::max(_1345, -1.0);
        float _1355 = _1353;
        if (_1303)
        {
            _1355 = _1347;
        }
        float _1357 = _1355;
        float _1359 = _1357;
        if (_1305)
        {
            _1359 = _1349;
        }
        float _1361 = _1359;
        float _1363 = _1361;
        if (_1307)
        {
            _1363 = _1351;
        }
        float _1365 = _1363;
        float _1367 = abs(_1365);
        float _1369 = (-0.0) + _1367;
        _1295 = _1369;
    }
    float _1371 = _1295;
    float _1373 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1289);
    bool _1375 = _1251 <= 1.0;
    bool _1377 = _1375 && _1281;
    float _1379 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1381 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1383 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1373);
    float _1385 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1387 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1379);
    bool _1389 = _1371 != 0.0;
    bool _1391 = isnan(_1371);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1383);
    float _1401 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1385);
    float _1403 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1387);
    float _1405 = log2(_1287);
    float _1407 = _649 * _1119;
    float _1409 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1401);
    float _1411 = _1387;
    if (_1377)
    {
        float _1413 = float(_725);
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1403);
    float _1419 = fma(_510, _1111, _1407);
    if (!_835)
    {
        float _1421 = -_1241;
        float _1423 = _699 + _1421;
        _1127 = _1423;
    }
    float _1425 = _1127;
    float _1427 = _1425;
    if (!_835)
    {
        float _1429 = -_1133;
        float _1431 = _687 + _1429;
        _1297 = _1431;
    }
    float _1433 = _1297;
    float _1435 = 1.0 / _1399;
    float _1437 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    if (_1397)
    {
        _1185 = _1417;
    }
    float _1439 = _1185;
    float _1441 = fma(_508, _1147, _1419);
    float _1443 = _1439;
    if (_1397)
    {
        _1187 = _1437;
    }
    float _1445 = _1187;
    float _1447 = _1445;
    if (!_1397)
    {
        _1443 = 0.0;
        _1447 = 0.0;
    }
    float _1449 = _1443;
    float _1451 = _1447;
    float _1453 = _1409;
    if (_1377)
    {
        float _1455 = rint(_1415);
        float _1457 = precise::max(_1455, 0.0);
        uint _1459 = uint(_1457);
        uint _1461 = clamp(_1459, 0u, 65535u);
        _1453 = as_type<float>(_1461);
    }
    float _1463 = _1453;
    float _1465 = _1441 + _1155;
    float _1467 = _1405 * 0.693147182464599609375;
    float _1469 = _1465 * _1093;
    float _1471 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1473 = _1403;
    if (!_835)
    {
        float _1475 = rint(_1055);
        float _1477 = precise::max(_1475, 0.0);
        uint _1479 = uint(_1477);
        uint _1481 = clamp(_1479, 0u, 65535u);
        _1473 = as_type<float>(_1481);
    }
    float _1483 = _1473;
    float _1485 = _1435 * _1449;
    float _1487 = _1435 * _1451;
    float _1489 = fma(_1485, 0.5, 0.5);
    float _1491 = fma(_1487, -0.5, 0.5);
    float _1493 = _1251;
    float _1495 = _1489;
    float _1497 = _1491;
    if (_1377)
    {
        float3 _4931 = float3(_1177, _1251, float(as_type<int>(_1463)));
        float3 _4935 = select(_4931, float3(0.0), isnan(_4931));
        float _1499 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4935.xy, uint(rint(_4935.z)), _1469, level(0.0));
        _1493 = _1499;
    }
    float _1501 = _1493;
    float3 _4945 = float3(_1489, _1491, _1471);
    float _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).x;
    float3 _4954 = float3(_1489, _1491, _1471);
    float4 _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4954, float3(0.0), isnan(_4954)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4954, float3(0.0), isnan(_4954)), level(0.0)).xyzw;
    float _1508 = _1506.x;
    float _1510 = _1506.y;
    float _1512 = _1506.z;
    float _1514 = _1506.w;
    float _1516 = _1133;
    if (!_835)
    {
        float3 _4977 = float3(_1433, _1425, float(as_type<int>(_1483)));
        float3 _4979 = select(_4977, float3(0.0), isnan(_4977));
        float _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4979.xy, uint(rint(_4979.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4979.xy, uint(rint(_4979.z)), level(0.0)).x;
        _1516 = _1518;
    }
    float _1520 = _1516;
    if (_835)
    {
        _717 = 1.0;
    }
    float _1522 = _717;
    float _1524 = _1522;
    if (!_835)
    {
        int _1526 = _881 << 4;
        int _1528 = _1526 + 2048;
        uint _1530 = uint(int(uint(_1528) >> uint(2)));
        uint _1532 = uint(int(uint(int(_1530)) >> uint(2)));
        int _1534 = int(_1530) & 3;
        float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
        int _1538 = int(_1530) + 1;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        int _1542 = _1538 & 3;
        float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
        int _1546 = _1528 + 8;
        uint _1548 = uint(int(uint(_1546) >> uint(2)));
        uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
        int _1552 = int(_1548) & 3;
        float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
        int _1556 = int(_1548) + 1;
        uint _1558 = uint(int(uint(_1556) >> uint(2)));
        int _1560 = _1556 & 3;
        float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
        float _1564 = _649 * _1544;
        float _1566 = fma(_510, _1536, _1564);
        float _1568 = fma(_508, _1554, _1566);
        float _1570 = _1568 + _1562;
        float _1572 = precise::clamp(_1570, 0.0, 1.0);
        float _1574 = -_1572;
        float _1576 = _1574 + _1520;
        float _1578 = fma(_1576, 500.0, 1.5);
        float _1580 = exp2(_1578);
        float _1582 = 0.0 + _1580;
        float _1584 = precise::clamp(_1582, 0.0, 1.0);
        _1524 = _1584;
    }
    float _1586 = _1524;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1590 = _1227 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1594 = _1229 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1231 + _1596;
    float _1600 = _1590 * _1590;
    float _1602 = fma(_1594, _1594, _1600);
    float _1604 = fma(_1598, _1598, _1602);
    float _1606 = rsqrt(_1604);
    float _1608 = sqrt(_1604);
    float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1612 = _1594 * _1610;
    float _1614 = _1598 * _1610;
    float _1616 = _1612 * _1612;
    float _1618 = _1614 * _1614;
    float _1620 = _1616 + _1618;
    float _1622 = sqrt(_1620);
    bool _1624 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1628 = _1622 + _1626;
    float _1630 = _1606;
    float _1632 = _1628;
    float _1634 = _1590;
    if (_1624)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1630 = _1636;
    }
    float _1638 = _1630;
    if (_1624)
    {
        float _1640 = rsqrt(_1620);
        _1495 = _1640;
    }
    float _1642 = _1495;
    float _1644 = _1642;
    if (_1624)
    {
        float _1646 = _1628 * _1638;
        _1632 = _1646;
    }
    float _1648 = _1632;
    if (_1624)
    {
        float _1650 = _1648 * 0.15915493667125701904296875;
        _1497 = _1650;
    }
    float _1652 = _1497;
    float _1654 = _1598;
    if (_1624)
    {
        float _1656 = _1652 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        _1654 = _1658;
    }
    float _1660 = _1654;
    float _1662 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1664 = precise::max(0.0, _1662);
    float _1666 = _1638;
    float _1668 = _1664;
    if (_1624)
    {
        float _1670 = _1652 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        _1666 = _1672;
    }
    float _1674 = _1666;
    float _1676 = -_1610;
    float _1678 = -_1664;
    float _1680 = fma(_1590, _1676, _1678);
    if (_1624)
    {
        float _1682 = _1680 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1682;
    }
    float _1684 = _1634;
    float _1686 = _1684;
    float _1688 = _1660;
    if (_1624)
    {
        float _1690 = fma(_1660, _1684, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1686 = _1690;
    }
    float _1692 = _1686;
    float _1694 = _1692;
    if (!_1624)
    {
        _1688 = _1612;
    }
    float _1696 = _1688;
    float _1698 = _1696;
    float _1700 = _1674;
    if (_1624)
    {
        float _1702 = _1674 + (-1.0);
        _1668 = _1702;
    }
    float _1704 = _1668;
    float _1706 = 0.0;
    float _1708 = _1704;
    if (_1624)
    {
        float _1710 = _1642 * _1692;
        _1706 = _1710;
    }
    float _1712 = _1706;
    if (!_1624)
    {
        _1694 = _1680;
    }
    float _1714 = _1694;
    float _1716 = _1714;
    if (_1624)
    {
        float _1718 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1718;
    }
    float _1720 = _1427;
    if (_1624)
    {
        float _1722 = _1612 * _1712;
        _1698 = _1722;
    }
    float _1724 = _1698;
    if (!_1624)
    {
        _1708 = _1614;
    }
    float _1726 = _1708;
    float _1728 = _1726;
    if (_1624)
    {
        float _1730 = _1614 * _1712;
        _1728 = _1730;
    }
    float _1732 = _1728;
    if (!_1624)
    {
        _1644 = _1616;
    }
    float _1734 = _1644;
    float _1736 = _1734;
    if (_1624)
    {
        float _1738 = fma(_1680, _1674, _1720);
        _1716 = _1738;
    }
    float _1740 = _1716;
    if (_1624)
    {
        float _1742 = _1724 * _1724;
        _1736 = _1742;
    }
    float _1744 = _1736;
    if (!_1624)
    {
        _1700 = _1618;
    }
    float _1746 = _1700;
    float _1748 = _1746;
    if (_1624)
    {
        float _1750 = _1732 * _1732;
        _1748 = _1750;
    }
    float _1752 = _1748;
    float _1754 = fma(_1740, _1740, _1744);
    float _1756 = _1754 + _1752;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1760 = fma(_1608, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1758);
    float _1762 = precise::clamp(_1760, 0.0, 1.0);
    float _1764 = -_1762;
    float _1766 = _1764 + 1.0;
    float _1768 = rsqrt(_1756);
    float _1770 = abs(_1766);
    float _1772 = log2(_1770);
    float _1774 = _1768 * _1724;
    float _1776 = _1768 * _1740;
    float _1778 = _1768 * _1732;
    float _1780 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = -_1780;
    float _1784 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = -_1778;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1790 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = fma(_1788, -0.5, 0.5);
    float _1794 = fma(_1788, 0.5, 0.5);
    float _1796 = exp2(_1790);
    float _1798 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1800 = fma(_1794, _1798, -0.212114393711090087890625);
    float _1802 = _1776 + 1.0;
    float _1804 = sqrt(_1792);
    float _1806 = fma(_1794, _1800, 1.570728778839111328125);
    float _1808 = -_1776;
    float _1810 = fma(_1796, _1802, _1808);
    float _1812 = fma(_1810, 0.5, 0.5);
    float _1814 = _1804 * 0.636619746685028076171875;
    float _1816 = -_1806;
    float _1818 = fma(_1814, _1816, 1.0);
    float2 _5448 = float2(_1818, _1812);
    float3 _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5448, float2(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5448, float2(0.0), isnan(_5448)), level(0.0)).xyz;
    float _1824 = _1822.x;
    float _1826 = _1822.y;
    float _1828 = _1822.z;
    float _1830 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1832 = in.m_76.y;
    float _1834 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1836 = _1830 * _372;
    float _1838 = in.m_76.w;
    bool _1840 = _372 > 0.5;
    float _1842 = exp2(_1834);
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1846 = _1844 != 0;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1852 = in.m_76.z;
    bool _1854 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1856 = isnan(_484);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = -_528;
    float _1868 = _1866 + 1.0;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1872 = _1870 != 0;
    out.m_89.x = _1229;
    out.m_89.y = _1227;
    out.m_89.z = _1231;
    float _1874 = trunc(_1836);
    int _1876 = int(_1874);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1880 = _1878 != 0;
    float _1882 = 1.0 / _1850;
    bool _1884 = _1832 > 0.5;
    bool _1886 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1888 = isnan(_484);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_647;
    int _1900 = _1884 ? as_type<int>(_1898) : as_type<int>(_647);
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1904 = _1902 != 0;
    int _1906 = _1876 << 4;
    int _1908 = _1906 + 1968;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1910;
    bool _1914 = !_1846;
    float _1916 = _1914 ? _647 : as_type<float>(_1900);
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1920 = uint(int(uint(_1908) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    bool _1936 = _1838 > 0.5;
    float _1938 = _1912 * _1882;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1942 = _484 + _1940;
    float _1944 = -_1896;
    float _1946 = _1944 + 1.0;
    float _1948 = -_647;
    int _1950 = _1936 ? as_type<int>(_1948) : as_type<int>(_647);
    float _1952 = -_1916;
    float _1954 = _1952 + 0.5;
    int _1956 = _1908 + 8;
    uint _1958 = uint(int(uint(_1956) >> uint(2)));
    uint _1960 = uint(int(uint(int(_1958)) >> uint(2)));
    int _1962 = int(_1958) & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    float _1966 = fma(_1938, _1942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1968 = _1852 > 0.5;
    float _1970 = _1864 * _1946;
    float _1972 = -_1864;
    float _1974 = _1972 + 1.0;
    float _1976 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    uint _1978 = uint(int(uint(_456) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    float _1994 = _1966 * _1970;
    bool _1996 = !_1872;
    float _1998 = _1996 ? _647 : as_type<float>(_1950);
    float _2000 = _647 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2004 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2002);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2006);
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1994);
    float _2012 = fma(_2000, _2000, 1.0);
    float _2014 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2004);
    float _2016 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2008);
    float _2018 = -_1998;
    float _2020 = _2018 + 0.5;
    float _2022 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2010);
    float _2024 = _510 + _2014;
    float _2026 = rsqrt(_2012);
    float _2028 = -_653;
    int _2030 = _1840 ? as_type<int>(_2028) : as_type<int>(_653);
    int _2032 = _456 + 8;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    bool _2042 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2044 = isnan(0.0);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2050 = _2046 || _2048;
    float _2052 = _508 + _2016;
    bool _2054 = !_1880;
    float _2056 = _2054 ? _653 : as_type<float>(_2030);
    float _2058 = _653 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2060 = -_653;
    int _2062 = _1968 ? as_type<int>(_2060) : as_type<int>(_653);
    float _2064 = -_2052;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2070 = fma(_2058, _292, _324);
    float _2072 = fma(_2058, _296, _328);
    float _2074 = _2056 + 0.5;
    float _2076 = precise::min(_2052, _2066);
    bool _2078 = !_1904;
    float _2080 = _2078 ? _653 : as_type<float>(_2062);
    float _2082 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_2050)
    {
        float _2084 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2082 = _2084;
    }
    float _2086 = _2082;
    float _2088 = -_332;
    float _2090 = _2026 * _2088;
    float _2092 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2094 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2096 = fma(_2058, _288, _320);
    float _2098 = _1934 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2100 = _2086;
    if (_2050)
    {
        float _2102 = precise::min(_2086, 20.0);
        _2100 = _2102;
    }
    float _2104 = _2100;
    float _2106 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = -_2000;
    float _2110 = fma(_2108, _332, _2096);
    float _2112 = -_2000;
    float _2114 = fma(_2112, _336, _2070);
    float _2116 = -_2000;
    float _2118 = fma(_2116, _340, _2072);
    float _2120 = _1964 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2122 = _2000 * _2026;
    float _2124 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2126 = -_336;
    float _2128 = _2026 * _2126;
    float _2130 = -_340;
    float _2132 = _2026 * _2130;
    float _2134 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2138 = -_2024;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2142 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2144 = -_2122;
    float _2146 = fma(_2144, _328, _2132);
    out.m_91.x = _2106;
    out.m_91.y = _2124;
    out.m_91.z = _2134;
    float _2148 = _2114 * _1039;
    float _2150 = precise::min(_2024, _2140);
    float _2152 = -_2122;
    float _2154 = fma(_2152, _320, _2090);
    float _2156 = _1984;
    float _2158 = _1992;
    if (_2050)
    {
        float _2160 = 1.0 / _2104;
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = precise::min(_2150, _2076);
    float _2168 = _2080 + 0.5;
    if (!_2050)
    {
        _2158 = 1.0;
    }
    float _2170 = _2158;
    float _2172 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2174 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2176 = _2092 * _1918;
    float _2178 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2182 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2184 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2186 = _2178 * _2136;
    float _2188 = -_2122;
    float _2190 = fma(_2188, _324, _2128);
    float _2192 = _2114 * _939;
    float _2194 = _2170;
    if (_2050)
    {
        float _2196 = _2166 * _2162;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _939 * _292;
    float _2204 = _2190 * _939;
    float _2206 = _2114 * _953;
    float _2208 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2210 = abs(_671);
    float _2212 = log2(_2210);
    float _2214 = _2182 * _2068;
    float _2216 = _1039 * _292;
    float _2218 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2220 = _953 * _292;
    float _2222 = _2184 * _2180;
    float _2224 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2226 = fma(_941, _288, _2216);
    float _2228 = fma(_2110, _947, _2206);
    float _2230 = _2190 * _1039;
    out.m_93.x = _2176;
    out.m_93.y = _2214;
    out.m_93.z = _2222;
    out.m_93.w = _2186;
    bool _2232 = _671 <= 8000.0;
    bool _2234 = isnan(_671);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan(8000.0);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    out.m_95.x = _2172;
    out.m_95.y = _2174;
    out.m_95.z = _2218;
    out.m_95.w = _2224;
    float _2244 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2246 = exp2(_2244);
    float _2248 = _2190 * _953;
    float _2250 = fma(_1037, _288, _2202);
    float _2252 = fma(_947, _288, _2220);
    float _2254 = fma(_2110, _1037, _2192);
    float _2256 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2258 = fma(_2154, _947, _2248);
    float _2260 = fma(_943, _296, _2250);
    float _2262 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2256);
    float _2264 = fma(_2146, _1057, _2258);
    float _2266 = fma(_951, _296, _2226);
    float _2268 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2262);
    float _2270 = fma(_1057, _296, _2252);
    float _2272 = fma(_2154, _1037, _2204);
    float _2274 = fma(_2110, _941, _2148);
    float _2276 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2268);
    float _2278 = fma(_2154, _941, _2230);
    out.m_97.x = _2260;
    out.m_97.y = _2266;
    out.m_97.z = _2270;
    float _2280 = fma(_2146, _943, _2272);
    float _2282 = _2276 + _1399;
    float _2284 = fma(_2146, _951, _2278);
    float _2286 = _2278;
    float _2288 = _2242;
    if (!_1397)
    {
        _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2290 = _2286;
    float _2292 = _2282 * 0.5;
    float _2294 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    out.gl_Position.x = _1417;
    out.gl_Position.y = _1437;
    out.gl_Position.z = _2276;
    out.gl_Position.w = _1399;
    int _2298 = as_type<int>(_2290);
    if (!_1397)
    {
        float _2300 = _2290 * 5.0;
        _2298 = as_type<int>(_2300);
    }
    int _2302 = _2298;
    float _2304 = fma(_2296, -2.0, 3.0);
    float _2306 = fma(_2118, _943, _2254);
    float _2308 = _2296 * _2296;
    float _2310 = -_1842;
    float _2312 = _2310 + 1.0;
    float _2314 = fma(_2118, _951, _2274);
    if (!_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6294 = as_type<float>(_2302);
        out.gl_Position.z = _6294;
    }
    float _2316 = _2308 * _2304;
    float _2318 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2320 = fma(_2118, _1057, _2228);
    out.m_99.x = _2280;
    out.m_99.y = _2284;
    out.m_99.z = _2264;
    float _2322 = -_2316;
    float _2324 = _2322 + 1.0;
    float _2326 = _2318 * _1503;
    float _2328 = -_2318;
    float _2330 = _2328 + 1.0;
    out.m_101.z = _2292;
    out.m_101.w = _1399;
    float _2332 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2316);
    float _2334 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2336 = _1514 * _2330;
    float _2338 = _1514 * _2326;
    float _2340 = _2242 * _2332;
    float _2342 = _2318;
    float _2344 = _2340;
    float _2346 = _2330;
    if (!_1377)
    {
        _2288 = 1.0;
    }
    float _2348 = _2288;
    out.m_103.x = _2306;
    out.m_103.y = _2314;
    out.m_103.z = _2320;
    float _2350 = _2348;
    if (_1377)
    {
        bool _2352 = _1501 >= _1469;
        bool _2354 = isnan(_1501);
        bool _2356 = _2352 || _2354;
        bool _2358 = isnan(_1469);
        bool _2360 = _2356 || _2358;
        float _2362 = float(_2360);
        _2350 = _2362;
    }
    float _2364 = _2350;
    float _2366 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2368 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_1608);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    float _2378 = _2334 * _1371;
    float _2380 = _1868 * _2366;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2364 * _1586;
    float _2386 = _2366;
    float _2388 = _2384;
    if (_1397)
    {
        _1129 = _2378;
    }
    float _2390 = _1129;
    float _2392 = -_2382;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2396 = _2390;
    if (!_1397)
    {
        _2396 = 0.0;
    }
    float _2398 = _2396;
    float _2400 = -_2384;
    float _2402 = fma(_2400, _2394, 1.0);
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    if (!_2376)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2406 = _2342;
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2410 = _2408;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2376)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2416 = _2344;
    float _2418 = _2416;
    float _2420 = _2416;
    if (!_2376)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2422 = _2386;
    out.m_105.x = _2408;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2376)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2346;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2376)
    {
        _2388 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2434 = _2388;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2376)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2440 = _2410;
    float _2442 = _1828 * _2326;
    float _2444 = fma(_1824, _2338, _1508);
    float _2446 = fma(_1826, _2338, _1510);
    float _2448 = fma(_1514, _2442, _1512);
    out.m_107.x = _2444;
    out.m_107.y = _2446;
    out.m_107.z = _2448;
    out.m_107.w = _2336;
    bool _2450 = !_2376;
    float _2452 = _2440;
    float _2454 = _2440;
    if (!_2450)
    {
        bool _2456 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2458 = isnan(_1608);
        bool _2460 = _2456 || _2458;
        bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2464 = _2460 || _2462;
        if (!_2464)
        {
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2468 = _1608 + _2466;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2470;
            float _2474 = 1.0 / _2472;
            float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2496 = _2468 * _2474;
            float _2498 = precise::clamp(_2496, 0.0, 1.0);
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2504 = fma(_2498, _2478, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2506 = fma(_2498, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2508 = fma(_2498, _2482, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2510 = fma(_2498, _2486, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2512 = fma(_2498, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2514 = fma(_2498, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2420 = _2506;
            _2438 = _2512;
            _2414 = _2504;
            _2432 = _2510;
            _2426 = _2508;
            _2454 = _2514;
            _2516 = true;
        }
        else
        {
            bool _2518 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2520 = isnan(_1608);
            bool _2522 = _2518 || _2520;
            bool _2524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2526 = _2522 || _2524;
            if (!_2526)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2528 = _2412;
            _2414 = _2528;
            if (!_2526)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2530 = _2418;
            _2420 = _2530;
            if (!_2526)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2532 = _2424;
            _2426 = _2532;
            if (!_2526)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2534 = _2430;
            _2432 = _2534;
            if (!_2526)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2536 = _2436;
            _2438 = _2536;
            if (!_2526)
            {
                _2452 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2538 = _2452;
            bool _2540 = !_2526;
            _2454 = _2538;
            if (!_2540)
            {
                bool _2542 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2544 = isnan(_1608);
                bool _2546 = _2542 || _2544;
                bool _2548 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2550 = _2546 || _2548;
                if (!_2550)
                {
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2554 = _1608 + _2552;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2556;
                    float _2560 = 1.0 / _2558;
                    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2582 = _2554 * _2560;
                    float _2584 = precise::clamp(_2582, 0.0, 1.0);
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2590 = fma(_2584, _2564, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2592 = fma(_2584, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2594 = fma(_2584, _2568, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2596 = fma(_2584, _2572, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2598 = fma(_2584, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2600 = fma(_2584, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2420 = _2592;
                    _2438 = _2598;
                    _2414 = _2590;
                    _2432 = _2596;
                    _2426 = _2594;
                    _2454 = _2600;
                    _2516 = true;
                }
                else
                {
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2454 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2516 = false;
    float _2602 = _2420;
    float _2604 = _2438;
    float _2606 = _2414;
    float _2608 = _2432;
    float _2610 = _2426;
    float _2612 = _2454;
    float _2614 = fma(_2314, -0.5, 0.5);
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = -_2602;
    float _2620 = _2618 + _2604;
    float _2622 = -_2606;
    float _2624 = _2622 + _2608;
    float _2626 = -_2610;
    float _2628 = _2626 + _2612;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2632 = fma(_2616, _2620, _2602);
    float _2634 = fma(_2616, _2624, _2606);
    float _2636 = fma(_2616, _2628, _2610);
    float _2638 = _2398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2640 = _2632 * 0.586610972881317138671875;
    out.m_66.x = 1.0;
    float _2642 = fma(_2634, 0.298911988735198974609375, _2640);
    out.m_105.w = _2638;
    float _2644 = fma(_2636, 0.114477999508380889892578125, _2642);
    out.m_109.x = 0.0;
    float _2646 = -_2644;
    float _2648 = _2634 + _2646;
    float _2650 = -_2644;
    float _2652 = _2632 + _2650;
    float _2654 = -_2644;
    float _2656 = _2636 + _2654;
    float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2660 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2662 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    out.m_111.x = _2658;
    out.m_111.y = _2660;
    out.m_111.z = _2662;
    if (!_2630)
    {
        return out;
    }
    float _2664 = -_1227;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2668 = -_1229;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2672 = -_1231;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2676 = _2666 * _2666;
    float _2678 = fma(_2670, _2670, _2676);
    float _2680 = fma(_2674, _2674, _2678);
    float _2682 = sqrt(_2680);
    float _2684 = rsqrt(_2680);
    float _2686 = -_2682;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2692 = precise::clamp(_2690, 0.0, 1.0);
    float _2694 = _2670 * _2684;
    float _2696 = _2666 * _2684;
    float _2698 = abs(_2692);
    float _2700 = log2(_2698);
    float _2702 = _2674 * _2684;
    float _2704 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2706 = _2314 * _2696;
    float _2708 = -_2696;
    float _2710 = -_2704;
    float _2712 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2710);
    float _2714 = fma(_2306, _2694, _2706);
    float _2716 = -_2702;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2712);
    float _2720 = fma(_2320, _2702, _2714);
    float _2722 = precise::clamp(_2720, 0.0, 1.0);
    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2726 = _2718 + _2724;
    float _2728 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = exp2(_2728);
    float _2736 = _2734 * _2732;
    float _2738 = _2722 * _2736;
    float _2740 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2742 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2744 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2740;
    out.m_109.y = _2742;
    out.m_109.z = _2744;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2516 = false;
    bool _476 = false;
    bool _362 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_63.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_66.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2801 = as_type<float>(_146);
        out.gl_Position.z = _2801;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_68.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_66.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2869 = as_type<float>(_182);
        out.gl_Position.z = _2869;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _184 = in.m_70.x;
    float _186 = in.m_70.y;
    float _188 = in.m_70.z;
    float _190 = in.m_72.x;
    float _192 = in.m_72.y;
    float _194 = in.m_72.z;
    float _196 = in.m_74.x;
    float _198 = in.m_74.y;
    float _200 = in.m_74.z;
    float _202 = _184 * _184;
    float _204 = _186 * _186;
    float _206 = _188 * _188;
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = fma(_194, _194, _206);
    float _214 = fma(_196, _196, _208);
    float _216 = fma(_198, _198, _210);
    float _218 = fma(_200, _200, _212);
    float _220 = sqrt(_214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    bool _226 = _220 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = _222;
    if (_226)
    {
        float _232 = rsqrt(_214);
        _230 = _232;
    }
    float _234 = _230;
    float _236 = 0.0;
    if (!_226)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _224 > 0.0;
    float _242 = 0.0;
    float _244 = _224;
    float _246 = _238;
    if (!_226)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = _248;
    if (!_226)
    {
        _244 = 0.0;
    }
    float _252 = _244;
    float _254 = _220;
    float _256 = _252;
    if (_228)
    {
        float _258 = rsqrt(_216);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = 0.0;
    if (!_228)
    {
        _262 = 0.0;
        _264 = 0.0;
    }
    float _266 = _262;
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    float _274 = _266;
    if (!_228)
    {
        _270 = 0.0;
    }
    float _276 = _270;
    float _278 = 0.0;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_218);
        _278 = _282;
    }
    float _284 = _278;
    if (_226)
    {
        float _286 = _234 * _190;
        _246 = _286;
    }
    float _288 = _246;
    if (_226)
    {
        float _290 = _234 * _184;
        _250 = _290;
    }
    float _292 = _250;
    if (_226)
    {
        float _294 = _234 * _196;
        _256 = _294;
    }
    float _296 = _256;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_240)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = 0.0;
    float _310 = _306;
    float _312 = _304;
    if (!_240)
    {
        _308 = 0.0;
    }
    float _314 = _308;
    float _316 = _314;
    if (_228)
    {
        float _318 = _260 * _192;
        _280 = _318;
    }
    float _320 = _280;
    if (_228)
    {
        float _322 = _260 * _186;
        _272 = _322;
    }
    float _324 = _272;
    if (_228)
    {
        float _326 = _260 * _198;
        _274 = _326;
    }
    float _328 = _274;
    if (_240)
    {
        float _330 = _284 * _194;
        _310 = _330;
    }
    float _332 = _310;
    if (_240)
    {
        float _334 = _284 * _188;
        _316 = _334;
    }
    float _336 = _316;
    if (_240)
    {
        float _338 = _284 * _200;
        _312 = _338;
    }
    float _340 = _312;
    bool _342 = !_298;
    float _360;
    if (!_342)
    {
        float _344 = in.m_76.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        float _364 = float(_130);
        float _366 = 1.0 / _364;
        float _368 = _164 * _366;
        _360 = _368;
    }
    _362 = false;
    float _370 = _360;
    float _372 = in.m_76.x;
    float _374 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _370 + _376;
    bool _380 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _382 = isnan(_370);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _392;
    float _396 = -_390;
    float _398 = _396 + 1.0;
    bool _400 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _402 = 1.0 / _394;
    float _404 = _374 * _372;
    float _406 = _378 * _402;
    bool _408 = _370 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _410 = isnan(_370);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = trunc(_404);
    int _430 = int(_428);
    float _432 = _418 * _398;
    float _434 = fma(_422, _406, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = fma(_426, _406, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _438 = -_418;
    float _440 = _438 + 1.0;
    float _442 = _434 * _432;
    float _444 = _436 * _432;
    float _446 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _442);
    float _448 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _444);
    float _450 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[144].x, _446);
    float _452 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[144].y, _448);
    int _454 = _430 << 4;
    int _456 = _454 + 1712;
    bool _458 = !_400;
    float _474;
    if (!_458)
    {
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _462 = _372 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        float _478 = float(_130);
        float _480 = 1.0 / _478;
        float _482 = _164 * _480;
        _474 = _482;
    }
    _476 = false;
    float _484 = _474;
    float _486 = in.m_63.x;
    float _488 = in.m_63.y;
    float _490 = in.m_63.z;
    float _492 = in.m_74.w;
    float _494 = in.m_72.w;
    float _496 = _198 * _488;
    float _498 = _192 * _488;
    float _500 = fma(_196, _486, _496);
    float _502 = fma(_190, _486, _498);
    float _504 = fma(_200, _490, _500);
    float _506 = fma(_194, _490, _502);
    float _508 = _504 + _492;
    float _510 = _506 + _494;
    float _512 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _514 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _516 = floor(_512);
    float _518 = floor(_514);
    float _520 = -_516;
    float _522 = _512 + _520;
    float _524 = -_518;
    float _526 = _514 + _524;
    float2 _3373 = float2(_526, _522);
    float _528 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3373, float2(0.0), isnan(_3373)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3373, float2(0.0), isnan(_3373)), level(0.0)).x;
    float _530 = in.m_78.w;
    float _532 = in.m_70.w;
    float _534 = _186 * _488;
    float _536 = in.m_80.x;
    float _538 = in.m_80.y;
    float _540 = trunc(_530);
    int _542 = int(_540);
    int _544 = _542 << 5;
    uint _547 = uint(int(uint(_544) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_547)];
    float _549 = as_type<float>(_dmw0.x);
    int _551 = _544 + 4;
    uint _553 = uint(int(uint(_551) >> uint(2)));
    float _555 = as_type<float>(_dmw0.y);
    int _557 = _544 + 8;
    uint _559 = uint(int(uint(_557) >> uint(2)));
    float _561 = as_type<float>(_dmw0.z);
    int _563 = _544 + 12;
    uint _565 = uint(int(uint(_563) >> uint(2)));
    float _567 = as_type<float>(_dmw0.w);
    float _569 = fma(_184, _486, _534);
    float _571 = _450 * _536;
    float _573 = as_type<float>(int(gl_VertexIndex));
    float _575 = fma(_188, _490, _569);
    float _577 = _452 * _538;
    float _579 = _575 + _532;
    float _581 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _583 = _579 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _585 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[11].x, _583);
    float _587 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _585);
    float _589 = _579 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _591 = _587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _593 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[10].x, _589);
    int _595 = as_type<int>(_573) & 1;
    bool _597 = _595 != 0;
    int _599 = as_type<int>(_573) & 2;
    bool _601 = _599 != 0;
    float _603 = 1.0 / _591;
    float _605 = fma(_508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _593);
    float _607 = _571 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _609 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _611 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _613 = _609 || _611;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    float _619 = _605 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _621 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _623 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.5);
    bool _629 = _625 || _627;
    float _631 = _619 + _591;
    float _633 = _631 * _603;
    float _635 = _633 * 0.5;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _639 = fma(_635, (*spvDescriptorSet0.vp_c8)._m0[30].w, _637);
    float _641 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _643 = 1.0 / _639;
    bool _645 = !_601;
    float _647 = _645 ? (-0.5) : 0.5;
    float _649 = _579 + _641;
    bool _651 = !_597;
    float _653 = _651 ? (-0.5) : 0.5;
    float _655 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _647);
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _653);
    float _659 = _649 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _661 = _581 * _655;
    float _663 = _607 * _657;
    float _665 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _667 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[126].x, _659);
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _671 = _643 * _669;
    float _673 = _649 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _675 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[126].z, _667);
    float _677 = _665 * _320;
    bool _679 = _671 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _681 = fma(_510, (*spvDescriptorSet0.vp_c15)._m0[127].x, _673);
    bool _683 = _671 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _685 = _665 * _328;
    float _687 = _675 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _689 = fma(_508, (*spvDescriptorSet0.vp_c15)._m0[127].z, _681);
    bool _691 = !_679;
    int _693 = _691 ? 0 : 1;
    float _695 = fma(_663, _296, _685);
    float _697 = fma(_663, _288, _677);
    float _699 = _689 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _701 = trunc(_687);
    int _703 = int(_701);
    float _705 = -_661;
    float _707 = fma(_705, _340, _695);
    float _709 = -_661;
    float _711 = fma(_709, _332, _697);
    int _713 = 2;
    float _715 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _717 = _699;
    if (!_679)
    {
        _713 = 1;
    }
    int _719 = _713;
    float _721 = _665 * _324;
    int _723 = _719;
    if (!_683)
    {
        _723 = _693;
    }
    int _725 = _723;
    float _727 = _508 + _707;
    float _729 = _510 + _711;
    float _731 = trunc(_699);
    int _733 = int(_731);
    int _735 = _725 << 6;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _727 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _729 + _741;
    float _745 = fma(_663, _292, _721);
    int _747 = _735 + 48;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.vp_c15)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.vp_c15)._m0[int(_759)][_761];
    float _765 = _739 * _739;
    int _767 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _769 = _703 + _767;
    int _771 = _769 + 1;
    float _773 = -_661;
    float _775 = fma(_773, _336, _745);
    bool _777 = _771 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _779 = _735 + 56;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    uint _783 = uint(int(uint(int(_781)) >> uint(2)));
    int _785 = int(_781) & 3;
    float _787 = (*spvDescriptorSet0.vp_c15)._m0[int(_783)][_785];
    int _789 = int(_781) + 1;
    uint _791 = uint(int(uint(_789) >> uint(2)));
    int _793 = _789 & 3;
    float _795 = (*spvDescriptorSet0.vp_c15)._m0[int(_791)][_793];
    float _797 = _579 + _775;
    int _799 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _801 = _733 + _799;
    int _803 = _801 + 1;
    float _805 = fma(_743, _743, _765);
    int _807 = _771 | _803;
    int _809 = _735 + 64;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.vp_c15)._m0[int(_813)][_815];
    int _819 = int(_811) + 1;
    uint _821 = uint(int(uint(_819) >> uint(2)));
    int _823 = _819 & 3;
    float _825 = (*spvDescriptorSet0.vp_c15)._m0[int(_821)][_823];
    float _827 = sqrt(_805);
    bool _829 = _807 < 0;
    bool _831 = _829 || _777;
    bool _833 = _803 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _835 = _833 || _831;
    int _837 = _735 + 72;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    uint _841 = uint(int(uint(int(_839)) >> uint(2)));
    int _843 = int(_839) & 3;
    float _845 = (*spvDescriptorSet0.vp_c15)._m0[int(_841)][_843];
    int _847 = int(_839) + 1;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    int _851 = _847 & 3;
    float _853 = (*spvDescriptorSet0.vp_c15)._m0[int(_849)][_851];
    int _855 = _735 + 96;
    uint _857 = uint(int(uint(_855) >> uint(2)));
    uint _859 = uint(int(uint(int(_857)) >> uint(2)));
    int _861 = int(_857) & 3;
    float _863 = (*spvDescriptorSet0.vp_c15)._m0[int(_859)][_861];
    int _865 = int(_857) + 1;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    int _869 = _865 & 3;
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[int(_867)][_869];
    bool _873 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _875 = _771;
    if (!_835)
    {
        int _877 = _803 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _879 = _877 + _771;
        _875 = _879;
    }
    int _881 = _875;
    int _883 = _735 + 104;
    uint _885 = uint(int(uint(_883) >> uint(2)));
    uint _887 = uint(int(uint(int(_885)) >> uint(2)));
    int _889 = int(_885) & 3;
    float _891 = (*spvDescriptorSet0.vp_c15)._m0[int(_887)][_889];
    int _893 = int(_885) + 1;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    int _897 = _893 & 3;
    float _899 = (*spvDescriptorSet0.vp_c15)._m0[int(_895)][_897];
    int _901 = 0;
    if (!_835)
    {
        int _903 = _881 << 2;
        _901 = _903;
    }
    int _905 = _901;
    int _907 = _905;
    if (!_835)
    {
        int _909 = 12 & _905;
        _907 = _909;
    }
    int _911 = _907;
    float _913 = 0.0;
    if (!_873)
    {
        _913 = _729;
    }
    float _915 = _913;
    float _917 = _915;
    if (!_873)
    {
        _715 = _797;
    }
    float _919 = _715;
    float _921 = _567 * 2.0;
    float _923 = _549 * 2.0;
    float _925 = _555 * 2.0;
    float _927 = _549 * _549;
    float _929 = _561 * _921;
    float _931 = _555 * _921;
    float _933 = _549 * _921;
    float _935 = _561 * _561;
    float _937 = -_929;
    float _939 = fma(_555, _923, _937);
    float _941 = fma(_555, _923, _929);
    float _943 = fma(_561, _923, _931);
    float _945 = -_931;
    float _947 = fma(_561, _923, _945);
    float _949 = -_933;
    float _951 = fma(_561, _925, _949);
    float _953 = fma(_561, _925, _933);
    float _955 = _555 * _555;
    float _957 = _561;
    int _959 = as_type<int>(_927);
    float _961 = _919;
    if (!_873)
    {
        _957 = _727;
    }
    float _963 = _957;
    float _965 = fma(_927, -2.0, 1.0);
    float _967 = fma(_955, -2.0, 1.0);
    float _969 = _963;
    if (!_835)
    {
        uint _971 = uint(int(uint(_881) >> uint(2)));
        _959 = int(_971);
    }
    int _973 = _959;
    bool _975 = !_873;
    float _977 = 0.0;
    if (!_975)
    {
        float _979 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _983 = _827 + _981;
        float _985 = _797 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _987 = rsqrt(_805);
        float _989 = _983 * _979;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _991 * 6.283185482025146484375;
        float _995 = cos(_993);
        float _997 = _991 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 + (-1.0);
        float _1003 = fma(_999, _985, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1005 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = _987 * _1003;
        float _1009 = fma(_797, _995, _1005);
        float _1011 = fma(_743, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1013 = fma(_739, _1007, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _961 = _1009;
        _977 = _991;
        _917 = _1011;
        _969 = _1013;
    }
    float _1015 = _961;
    float _1017 = _977;
    float _1019 = _917;
    float _1021 = _969;
    float _1023 = _1017;
    if (!_835)
    {
        int _1025 = _973 << 4;
        int _1027 = _1025 + _911;
        _1023 = as_type<float>(_1027);
    }
    float _1029 = _1023;
    float _1031 = _649 * _871;
    float _1033 = -_579;
    float _1035 = _1033 + _1015;
    float _1037 = fma(_935, -2.0, _967);
    float _1039 = fma(_935, -2.0, _965);
    float _1041 = fma(_510, _863, _1031);
    float _1043 = _1029;
    if (!_835)
    {
        int _1045 = as_type<int>(_1029) + 400;
        uint _1047 = uint(int(uint(_1045) >> uint(2)));
        uint _1049 = uint(int(uint(int(_1047)) >> uint(2)));
        int _1051 = int(_1047) & 3;
        float _1053 = (*spvDescriptorSet0.vp_c15)._m0[int(_1049)][_1051];
        _1043 = _1053;
    }
    float _1055 = _1043;
    float _1057 = fma(_955, -2.0, _965);
    float _1059 = -_510;
    float _1061 = _1059 + _1019;
    float _1063 = _1035 * _324;
    float _1065 = fma(_508, _891, _1041);
    float _1067 = _1035 * _292;
    float _1069 = _1035 * _336;
    float _1071 = _649 * _763;
    float _1073 = -_508;
    float _1075 = _1073 + _1021;
    float _1077 = fma(_1061, _320, _1063);
    float _1079 = _1065 + _899;
    float _1081 = fma(_1061, _288, _1067);
    float _1083 = fma(_1061, _332, _1069);
    float _1085 = fma(_510, _755, _1071);
    float _1087 = fma(_1075, _328, _1077);
    float _1089 = _649 * _825;
    float _1091 = fma(_1075, _296, _1081);
    float _1093 = 1.0 / _1079;
    float _1095 = fma(_1075, _340, _1083);
    float _1097 = _1087 * _939;
    float _1099 = _1087 * _1039;
    float _1101 = _1087 * _953;
    int _1103 = _735 + 80;
    uint _1105 = uint(int(uint(_1103) >> uint(2)));
    uint _1107 = uint(int(uint(int(_1105)) >> uint(2)));
    int _1109 = int(_1105) & 3;
    float _1111 = (*spvDescriptorSet0.vp_c15)._m0[int(_1107)][_1109];
    int _1113 = int(_1105) + 1;
    uint _1115 = uint(int(uint(_1113) >> uint(2)));
    int _1117 = _1113 & 3;
    float _1119 = (*spvDescriptorSet0.vp_c15)._m0[int(_1115)][_1117];
    float _1121 = fma(_508, _787, _1085);
    float _1123 = fma(_1091, _941, _1099);
    float _1125 = _899;
    float _1127 = _1079;
    float _1129 = _1057;
    if (!_835)
    {
        float _1131 = floor(_687);
        _1125 = _1131;
    }
    float _1133 = _1125;
    float _1135 = _1121 + _795;
    float _1137 = fma(_1095, _951, _1123);
    int _1139 = _735 + 88;
    uint _1141 = uint(int(uint(_1139) >> uint(2)));
    uint _1143 = uint(int(uint(int(_1141)) >> uint(2)));
    int _1145 = int(_1141) & 3;
    float _1147 = (*spvDescriptorSet0.vp_c15)._m0[int(_1143)][_1145];
    int _1149 = int(_1141) + 1;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    int _1153 = _1149 & 3;
    float _1155 = (*spvDescriptorSet0.vp_c15)._m0[int(_1151)][_1153];
    float _1157 = fma(_510, _817, _1089);
    float _1159 = fma(_1091, _1037, _1097);
    float _1161 = fma(_1091, _947, _1101);
    float _1163 = fma(_508, _845, _1157);
    float _1165 = fma(_1095, _943, _1159);
    float _1167 = fma(_1095, _1057, _1161);
    float _1169 = _579 + _1137;
    float _1171 = _1163 + _853;
    float _1173 = _510 + _1165;
    float _1175 = _508 + _1167;
    float _1177 = _1135 * _1093;
    float _1179 = _1169;
    float _1181 = _1173;
    float _1183 = _1175;
    float _1185 = _1119;
    float _1187 = _1111;
    if (!_617)
    {
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1191 = _579 + _1189;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1195 = _510 + _1193;
        float _1197 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1199 = _1191 * _1191;
        float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1203 = _508 + _1201;
        float _1205 = fma(_1195, _1195, _1199);
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1209 = fma(_1203, _1203, _1205);
        float _1211 = sqrt(_1209);
        float _1213 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1215 = precise::min(_1211, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1217 = _1215 * _1207;
        float _1219 = _1213 * _1217;
        float _1221 = fma(_1137, _1219, _579);
        float _1223 = fma(_1165, _1219, _510);
        float _1225 = fma(_1167, _1219, _508);
        _1179 = _1221;
        _1181 = _1223;
        _1183 = _1225;
    }
    float _1227 = _1179;
    float _1229 = _1181;
    float _1231 = _1183;
    float _1233 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1237 = _795;
    if (!_835)
    {
        float _1239 = floor(_699);
        _1237 = _1239;
    }
    float _1241 = _1237;
    float _1243 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1245 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1233);
    float _1247 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1235);
    bool _1249 = _1177 >= 0.0;
    float _1251 = _1171 * _1093;
    float _1253 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1245);
    float _1255 = _1227 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1257 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1247);
    float _1259 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1243);
    float _1261 = _1253 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1263 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1255);
    float _1265 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _1267 = _1177 <= 1.0;
    bool _1269 = _1267 && _1249;
    float _1271 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1273 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1263);
    float _1275 = _1257 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1277 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1259);
    bool _1279 = _1251 >= 0.0;
    bool _1281 = _1279 && _1269;
    float _1283 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1285 = -_1271;
    float _1287 = fma(_1285, _1265, 1.0);
    float _1289 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1291 = _1273;
    if (_629)
    {
        _1291 = 1.0;
    }
    float _1293 = _1291;
    float _1295 = _1293;
    float _1297 = _1241;
    if (!_629)
    {
        float _1299 = as_type<float>(in.m_87.w);
        int _1301 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1303 = _1301 == 4;
        bool _1305 = _1301 == 8;
        bool _1307 = _1301 == 12;
        int _1309 = as_type<int>(_1299) << 16;
        int _1311 = as_type<int>(_1299) << 8;
        int _1313 = as_type<int>(_1299) << 24;
        int _1315 = _1309 >> 24;
        int _1317 = _1311 >> 24;
        int _1319 = as_type<int>(_1299) >> 24;
        int _1321 = _1313 >> 24;
        float _1323 = float(_1315);
        float _1325 = float(_1317);
        float _1327 = float(_1319);
        float _1329 = _1323 * 0.0078740157186985015869140625;
        float _1331 = float(_1321);
        float _1333 = _1325 * 0.0078740157186985015869140625;
        float _1335 = _1327 * 0.0078740157186985015869140625;
        float _1337 = precise::min(_1329, 1.0);
        float _1339 = _1331 * 0.0078740157186985015869140625;
        float _1341 = precise::min(_1333, 1.0);
        float _1343 = precise::min(_1335, 1.0);
        float _1345 = precise::min(_1339, 1.0);
        float _1347 = precise::max(_1337, -1.0);
        float _1349 = precise::max(_1341, -1.0);
        float _1351 = precise::max(_1343, -1.0);
        float _1353 = precise::max(_1345, -1.0);
        float _1355 = _1353;
        if (_1303)
        {
            _1355 = _1347;
        }
        float _1357 = _1355;
        float _1359 = _1357;
        if (_1305)
        {
            _1359 = _1349;
        }
        float _1361 = _1359;
        float _1363 = _1361;
        if (_1307)
        {
            _1363 = _1351;
        }
        float _1365 = _1363;
        float _1367 = abs(_1365);
        float _1369 = (-0.0) + _1367;
        _1295 = _1369;
    }
    float _1371 = _1295;
    float _1373 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1289);
    bool _1375 = _1251 <= 1.0;
    bool _1377 = _1375 && _1281;
    float _1379 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1381 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1383 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1373);
    float _1385 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1387 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1379);
    bool _1389 = _1371 != 0.0;
    bool _1391 = isnan(_1371);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan(0.0);
    bool _1397 = _1393 || _1395;
    float _1399 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1383);
    float _1401 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1385);
    float _1403 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1387);
    float _1405 = log2(_1287);
    float _1407 = _649 * _1119;
    float _1409 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1401);
    float _1411 = _1387;
    if (_1377)
    {
        float _1413 = float(_725);
        _1411 = _1413;
    }
    float _1415 = _1411;
    float _1417 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1403);
    float _1419 = fma(_510, _1111, _1407);
    if (!_835)
    {
        float _1421 = -_1241;
        float _1423 = _699 + _1421;
        _1127 = _1423;
    }
    float _1425 = _1127;
    float _1427 = _1425;
    if (!_835)
    {
        float _1429 = -_1133;
        float _1431 = _687 + _1429;
        _1297 = _1431;
    }
    float _1433 = _1297;
    float _1435 = 1.0 / _1399;
    float _1437 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1409);
    if (_1397)
    {
        _1185 = _1417;
    }
    float _1439 = _1185;
    float _1441 = fma(_508, _1147, _1419);
    float _1443 = _1439;
    if (_1397)
    {
        _1187 = _1437;
    }
    float _1445 = _1187;
    float _1447 = _1445;
    if (!_1397)
    {
        _1443 = 0.0;
        _1447 = 0.0;
    }
    float _1449 = _1443;
    float _1451 = _1447;
    float _1453 = _1409;
    if (_1377)
    {
        float _1455 = rint(_1415);
        float _1457 = precise::max(_1455, 0.0);
        uint _1459 = uint(_1457);
        uint _1461 = clamp(_1459, 0u, 65535u);
        _1453 = as_type<float>(_1461);
    }
    float _1463 = _1453;
    float _1465 = _1441 + _1155;
    float _1467 = _1405 * 0.693147182464599609375;
    float _1469 = _1465 * _1093;
    float _1471 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1473 = _1403;
    if (!_835)
    {
        float _1475 = rint(_1055);
        float _1477 = precise::max(_1475, 0.0);
        uint _1479 = uint(_1477);
        uint _1481 = clamp(_1479, 0u, 65535u);
        _1473 = as_type<float>(_1481);
    }
    float _1483 = _1473;
    float _1485 = _1435 * _1449;
    float _1487 = _1435 * _1451;
    float _1489 = fma(_1485, 0.5, 0.5);
    float _1491 = fma(_1487, -0.5, 0.5);
    float _1493 = _1251;
    float _1495 = _1489;
    float _1497 = _1491;
    if (_1377)
    {
        float3 _4931 = float3(_1177, _1251, float(as_type<int>(_1463)));
        float3 _4935 = select(_4931, float3(0.0), isnan(_4931));
        float _1499 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4935.xy, uint(rint(_4935.z)), _1469, level(0.0));
        _1493 = _1499;
    }
    float _1501 = _1493;
    float3 _4945 = float3(_1489, _1491, _1471);
    float _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4945, float3(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4945, float3(0.0), isnan(_4945)), level(0.0)).x;
    float3 _4954 = float3(_1489, _1491, _1471);
    float4 _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4954, float3(0.0), isnan(_4954)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4954, float3(0.0), isnan(_4954)), level(0.0)).xyzw;
    float _1508 = _1506.x;
    float _1510 = _1506.y;
    float _1512 = _1506.z;
    float _1514 = _1506.w;
    float _1516 = _1133;
    if (!_835)
    {
        float3 _4977 = float3(_1433, _1425, float(as_type<int>(_1483)));
        float3 _4979 = select(_4977, float3(0.0), isnan(_4977));
        float _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4979.xy, uint(rint(_4979.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4979.xy, uint(rint(_4979.z)), level(0.0)).x;
        _1516 = _1518;
    }
    float _1520 = _1516;
    if (_835)
    {
        _717 = 1.0;
    }
    float _1522 = _717;
    float _1524 = _1522;
    if (!_835)
    {
        int _1526 = _881 << 4;
        int _1528 = _1526 + 2048;
        uint _1530 = uint(int(uint(_1528) >> uint(2)));
        uint _1532 = uint(int(uint(int(_1530)) >> uint(2)));
        int _1534 = int(_1530) & 3;
        float _1536 = (*spvDescriptorSet0.vp_c15)._m0[int(_1532)][_1534];
        int _1538 = int(_1530) + 1;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        int _1542 = _1538 & 3;
        float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
        int _1546 = _1528 + 8;
        uint _1548 = uint(int(uint(_1546) >> uint(2)));
        uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
        int _1552 = int(_1548) & 3;
        float _1554 = (*spvDescriptorSet0.vp_c15)._m0[int(_1550)][_1552];
        int _1556 = int(_1548) + 1;
        uint _1558 = uint(int(uint(_1556) >> uint(2)));
        int _1560 = _1556 & 3;
        float _1562 = (*spvDescriptorSet0.vp_c15)._m0[int(_1558)][_1560];
        float _1564 = _649 * _1544;
        float _1566 = fma(_510, _1536, _1564);
        float _1568 = fma(_508, _1554, _1566);
        float _1570 = _1568 + _1562;
        float _1572 = precise::clamp(_1570, 0.0, 1.0);
        float _1574 = -_1572;
        float _1576 = _1574 + _1520;
        float _1578 = fma(_1576, 500.0, 1.5);
        float _1580 = exp2(_1578);
        float _1582 = 0.0 + _1580;
        float _1584 = precise::clamp(_1582, 0.0, 1.0);
        _1524 = _1584;
    }
    float _1586 = _1524;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1590 = _1227 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1594 = _1229 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1231 + _1596;
    float _1600 = _1590 * _1590;
    float _1602 = fma(_1594, _1594, _1600);
    float _1604 = fma(_1598, _1598, _1602);
    float _1606 = rsqrt(_1604);
    float _1608 = sqrt(_1604);
    float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1612 = _1594 * _1610;
    float _1614 = _1598 * _1610;
    float _1616 = _1612 * _1612;
    float _1618 = _1614 * _1614;
    float _1620 = _1616 + _1618;
    float _1622 = sqrt(_1620);
    bool _1624 = _1622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1628 = _1622 + _1626;
    float _1630 = _1606;
    float _1632 = _1628;
    float _1634 = _1590;
    if (_1624)
    {
        float _1636 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1630 = _1636;
    }
    float _1638 = _1630;
    if (_1624)
    {
        float _1640 = rsqrt(_1620);
        _1495 = _1640;
    }
    float _1642 = _1495;
    float _1644 = _1642;
    if (_1624)
    {
        float _1646 = _1628 * _1638;
        _1632 = _1646;
    }
    float _1648 = _1632;
    if (_1624)
    {
        float _1650 = _1648 * 0.15915493667125701904296875;
        _1497 = _1650;
    }
    float _1652 = _1497;
    float _1654 = _1598;
    if (_1624)
    {
        float _1656 = _1652 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        _1654 = _1658;
    }
    float _1660 = _1654;
    float _1662 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1664 = precise::max(0.0, _1662);
    float _1666 = _1638;
    float _1668 = _1664;
    if (_1624)
    {
        float _1670 = _1652 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        _1666 = _1672;
    }
    float _1674 = _1666;
    float _1676 = -_1610;
    float _1678 = -_1664;
    float _1680 = fma(_1590, _1676, _1678);
    if (_1624)
    {
        float _1682 = _1680 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1682;
    }
    float _1684 = _1634;
    float _1686 = _1684;
    float _1688 = _1660;
    if (_1624)
    {
        float _1690 = fma(_1660, _1684, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1686 = _1690;
    }
    float _1692 = _1686;
    float _1694 = _1692;
    if (!_1624)
    {
        _1688 = _1612;
    }
    float _1696 = _1688;
    float _1698 = _1696;
    float _1700 = _1674;
    if (_1624)
    {
        float _1702 = _1674 + (-1.0);
        _1668 = _1702;
    }
    float _1704 = _1668;
    float _1706 = 0.0;
    float _1708 = _1704;
    if (_1624)
    {
        float _1710 = _1642 * _1692;
        _1706 = _1710;
    }
    float _1712 = _1706;
    if (!_1624)
    {
        _1694 = _1680;
    }
    float _1714 = _1694;
    float _1716 = _1714;
    if (_1624)
    {
        float _1718 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1427 = _1718;
    }
    float _1720 = _1427;
    if (_1624)
    {
        float _1722 = _1612 * _1712;
        _1698 = _1722;
    }
    float _1724 = _1698;
    if (!_1624)
    {
        _1708 = _1614;
    }
    float _1726 = _1708;
    float _1728 = _1726;
    if (_1624)
    {
        float _1730 = _1614 * _1712;
        _1728 = _1730;
    }
    float _1732 = _1728;
    if (!_1624)
    {
        _1644 = _1616;
    }
    float _1734 = _1644;
    float _1736 = _1734;
    if (_1624)
    {
        float _1738 = fma(_1680, _1674, _1720);
        _1716 = _1738;
    }
    float _1740 = _1716;
    if (_1624)
    {
        float _1742 = _1724 * _1724;
        _1736 = _1742;
    }
    float _1744 = _1736;
    if (!_1624)
    {
        _1700 = _1618;
    }
    float _1746 = _1700;
    float _1748 = _1746;
    if (_1624)
    {
        float _1750 = _1732 * _1732;
        _1748 = _1750;
    }
    float _1752 = _1748;
    float _1754 = fma(_1740, _1740, _1744);
    float _1756 = _1754 + _1752;
    float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1760 = fma(_1608, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1758);
    float _1762 = precise::clamp(_1760, 0.0, 1.0);
    float _1764 = -_1762;
    float _1766 = _1764 + 1.0;
    float _1768 = rsqrt(_1756);
    float _1770 = abs(_1766);
    float _1772 = log2(_1770);
    float _1774 = _1768 * _1724;
    float _1776 = _1768 * _1740;
    float _1778 = _1768 * _1732;
    float _1780 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = -_1780;
    float _1784 = fma(_1776, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = -_1778;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1790 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1792 = fma(_1788, -0.5, 0.5);
    float _1794 = fma(_1788, 0.5, 0.5);
    float _1796 = exp2(_1790);
    float _1798 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1800 = fma(_1794, _1798, -0.212114393711090087890625);
    float _1802 = _1776 + 1.0;
    float _1804 = sqrt(_1792);
    float _1806 = fma(_1794, _1800, 1.570728778839111328125);
    float _1808 = -_1776;
    float _1810 = fma(_1796, _1802, _1808);
    float _1812 = fma(_1810, 0.5, 0.5);
    float _1814 = _1804 * 0.636619746685028076171875;
    float _1816 = -_1806;
    float _1818 = fma(_1814, _1816, 1.0);
    float2 _5448 = float2(_1818, _1812);
    float3 _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5448, float2(0.0), isnan(_5448)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5448, float2(0.0), isnan(_5448)), level(0.0)).xyz;
    float _1824 = _1822.x;
    float _1826 = _1822.y;
    float _1828 = _1822.z;
    float _1830 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1832 = in.m_76.y;
    float _1834 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1836 = _1830 * _372;
    float _1838 = in.m_76.w;
    bool _1840 = _372 > 0.5;
    float _1842 = exp2(_1834);
    int _1844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1846 = _1844 != 0;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1852 = in.m_76.z;
    bool _1854 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1856 = isnan(_484);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1862 = _1858 || _1860;
    float _1864 = float(_1862);
    float _1866 = -_528;
    float _1868 = _1866 + 1.0;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1872 = _1870 != 0;
    out.m_89.x = _1229;
    out.m_89.y = _1227;
    out.m_89.z = _1231;
    float _1874 = trunc(_1836);
    int _1876 = int(_1874);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1880 = _1878 != 0;
    float _1882 = 1.0 / _1850;
    bool _1884 = _1832 > 0.5;
    bool _1886 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1888 = isnan(_484);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -_647;
    int _1900 = _1884 ? as_type<int>(_1898) : as_type<int>(_647);
    int _1902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1904 = _1902 != 0;
    int _1906 = _1876 << 4;
    int _1908 = _1906 + 1968;
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1910;
    bool _1914 = !_1846;
    float _1916 = _1914 ? _647 : as_type<float>(_1900);
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1920 = uint(int(uint(_1908) >> uint(2)));
    uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
    int _1924 = int(_1920) & 3;
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[int(_1922)][_1924];
    int _1928 = int(_1920) + 1;
    uint _1930 = uint(int(uint(_1928) >> uint(2)));
    int _1932 = _1928 & 3;
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[int(_1930)][_1932];
    bool _1936 = _1838 > 0.5;
    float _1938 = _1912 * _1882;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1942 = _484 + _1940;
    float _1944 = -_1896;
    float _1946 = _1944 + 1.0;
    float _1948 = -_647;
    int _1950 = _1936 ? as_type<int>(_1948) : as_type<int>(_647);
    float _1952 = -_1916;
    float _1954 = _1952 + 0.5;
    int _1956 = _1908 + 8;
    uint _1958 = uint(int(uint(_1956) >> uint(2)));
    uint _1960 = uint(int(uint(int(_1958)) >> uint(2)));
    int _1962 = int(_1958) & 3;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[int(_1960)][_1962];
    float _1966 = fma(_1938, _1942, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1968 = _1852 > 0.5;
    float _1970 = _1864 * _1946;
    float _1972 = -_1864;
    float _1974 = _1972 + 1.0;
    float _1976 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    uint _1978 = uint(int(uint(_456) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    float _1994 = _1966 * _1970;
    bool _1996 = !_1872;
    float _1998 = _1996 ? _647 : as_type<float>(_1950);
    float _2000 = _647 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2004 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2002);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2006);
    float _2010 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1994);
    float _2012 = fma(_2000, _2000, 1.0);
    float _2014 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2004);
    float _2016 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _2008);
    float _2018 = -_1998;
    float _2020 = _2018 + 0.5;
    float _2022 = fma(_1896, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2010);
    float _2024 = _510 + _2014;
    float _2026 = rsqrt(_2012);
    float _2028 = -_653;
    int _2030 = _1840 ? as_type<int>(_2028) : as_type<int>(_653);
    int _2032 = _456 + 8;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    uint _2036 = uint(int(uint(int(_2034)) >> uint(2)));
    int _2038 = int(_2034) & 3;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[int(_2036)][_2038];
    bool _2042 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _2044 = isnan(0.0);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _2050 = _2046 || _2048;
    float _2052 = _508 + _2016;
    bool _2054 = !_1880;
    float _2056 = _2054 ? _653 : as_type<float>(_2030);
    float _2058 = _653 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2060 = -_653;
    int _2062 = _1968 ? as_type<int>(_2060) : as_type<int>(_653);
    float _2064 = -_2052;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2070 = fma(_2058, _292, _324);
    float _2072 = fma(_2058, _296, _328);
    float _2074 = _2056 + 0.5;
    float _2076 = precise::min(_2052, _2066);
    bool _2078 = !_1904;
    float _2080 = _2078 ? _653 : as_type<float>(_2062);
    float _2082 = (*spvDescriptorSet0.vp_c11)._m0[20].z;
    if (_2050)
    {
        float _2084 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _2082 = _2084;
    }
    float _2086 = _2082;
    float _2088 = -_332;
    float _2090 = _2026 * _2088;
    float _2092 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2094 = _1926 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2096 = fma(_2058, _288, _320);
    float _2098 = _1934 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2100 = _2086;
    if (_2050)
    {
        float _2102 = precise::min(_2086, 20.0);
        _2100 = _2102;
    }
    float _2104 = _2100;
    float _2106 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = -_2000;
    float _2110 = fma(_2108, _332, _2096);
    float _2112 = -_2000;
    float _2114 = fma(_2112, _336, _2070);
    float _2116 = -_2000;
    float _2118 = fma(_2116, _340, _2072);
    float _2120 = _1964 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2122 = _2000 * _2026;
    float _2124 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2126 = -_336;
    float _2128 = _2026 * _2126;
    float _2130 = -_340;
    float _2132 = _2026 * _2130;
    float _2134 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2138 = -_2024;
    float _2140 = _2138 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _2142 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2144 = -_2122;
    float _2146 = fma(_2144, _328, _2132);
    out.m_91.x = _2106;
    out.m_91.y = _2124;
    out.m_91.z = _2134;
    float _2148 = _2114 * _1039;
    float _2150 = precise::min(_2024, _2140);
    float _2152 = -_2122;
    float _2154 = fma(_2152, _320, _2090);
    float _2156 = _1984;
    float _2158 = _1992;
    if (_2050)
    {
        float _2160 = 1.0 / _2104;
        _2156 = _2160;
    }
    float _2162 = _2156;
    float _2164 = _1992 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2166 = precise::min(_2150, _2076);
    float _2168 = _2080 + 0.5;
    if (!_2050)
    {
        _2158 = 1.0;
    }
    float _2170 = _2158;
    float _2172 = _2142 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2174 = _2164 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2176 = _2092 * _1918;
    float _2178 = _2020 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2182 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2184 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2186 = _2178 * _2136;
    float _2188 = -_2122;
    float _2190 = fma(_2188, _324, _2128);
    float _2192 = _2114 * _939;
    float _2194 = _2170;
    if (_2050)
    {
        float _2196 = _2166 * _2162;
        float _2198 = precise::clamp(_2196, 0.0, 1.0);
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _939 * _292;
    float _2204 = _2190 * _939;
    float _2206 = _2114 * _953;
    float _2208 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2210 = abs(_671);
    float _2212 = log2(_2210);
    float _2214 = _2182 * _2068;
    float _2216 = _1039 * _292;
    float _2218 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2220 = _953 * _292;
    float _2222 = _2184 * _2180;
    float _2224 = _2022 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2226 = fma(_941, _288, _2216);
    float _2228 = fma(_2110, _947, _2206);
    float _2230 = _2190 * _1039;
    out.m_93.x = _2176;
    out.m_93.y = _2214;
    out.m_93.z = _2222;
    out.m_93.w = _2186;
    bool _2232 = _671 <= 8000.0;
    bool _2234 = isnan(_671);
    bool _2236 = _2232 || _2234;
    bool _2238 = isnan(8000.0);
    bool _2240 = _2236 || _2238;
    float _2242 = float(_2240);
    out.m_95.x = _2172;
    out.m_95.y = _2174;
    out.m_95.z = _2218;
    out.m_95.w = _2224;
    float _2244 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2246 = exp2(_2244);
    float _2248 = _2190 * _953;
    float _2250 = fma(_1037, _288, _2202);
    float _2252 = fma(_947, _288, _2220);
    float _2254 = fma(_2110, _1037, _2192);
    float _2256 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2258 = fma(_2154, _947, _2248);
    float _2260 = fma(_943, _296, _2250);
    float _2262 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2256);
    float _2264 = fma(_2146, _1057, _2258);
    float _2266 = fma(_951, _296, _2226);
    float _2268 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2262);
    float _2270 = fma(_1057, _296, _2252);
    float _2272 = fma(_2154, _1037, _2204);
    float _2274 = fma(_2110, _941, _2148);
    float _2276 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2268);
    float _2278 = fma(_2154, _941, _2230);
    out.m_97.x = _2260;
    out.m_97.y = _2266;
    out.m_97.z = _2270;
    float _2280 = fma(_2146, _943, _2272);
    float _2282 = _2276 + _1399;
    float _2284 = fma(_2146, _951, _2278);
    float _2286 = _2278;
    float _2288 = _2242;
    if (!_1397)
    {
        _2286 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2290 = _2286;
    float _2292 = _2282 * 0.5;
    float _2294 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2296 = precise::clamp(_2294, 0.0, 1.0);
    out.gl_Position.x = _1417;
    out.gl_Position.y = _1437;
    out.gl_Position.z = _2276;
    out.gl_Position.w = _1399;
    int _2298 = as_type<int>(_2290);
    if (!_1397)
    {
        float _2300 = _2290 * 5.0;
        _2298 = as_type<int>(_2300);
    }
    int _2302 = _2298;
    float _2304 = fma(_2296, -2.0, 3.0);
    float _2306 = fma(_2118, _943, _2254);
    float _2308 = _2296 * _2296;
    float _2310 = -_1842;
    float _2312 = _2310 + 1.0;
    float _2314 = fma(_2118, _951, _2274);
    if (!_1397)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6294 = as_type<float>(_2302);
        out.gl_Position.z = _6294;
    }
    float _2316 = _2308 * _2304;
    float _2318 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2320 = fma(_2118, _1057, _2228);
    out.m_99.x = _2280;
    out.m_99.y = _2284;
    out.m_99.z = _2264;
    float _2322 = -_2316;
    float _2324 = _2322 + 1.0;
    float _2326 = _2318 * _1503;
    float _2328 = -_2318;
    float _2330 = _2328 + 1.0;
    out.m_101.z = _2292;
    out.m_101.w = _1399;
    float _2332 = fma(_2324, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2316);
    float _2334 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2336 = _1514 * _2330;
    float _2338 = _1514 * _2326;
    float _2340 = _2242 * _2332;
    float _2342 = _2318;
    float _2344 = _2340;
    float _2346 = _2330;
    if (!_1377)
    {
        _2288 = 1.0;
    }
    float _2348 = _2288;
    out.m_103.x = _2306;
    out.m_103.y = _2314;
    out.m_103.z = _2320;
    float _2350 = _2348;
    if (_1377)
    {
        bool _2352 = _1501 >= _1469;
        bool _2354 = isnan(_1501);
        bool _2356 = _2352 || _2354;
        bool _2358 = isnan(_1469);
        bool _2360 = _2356 || _2358;
        float _2362 = float(_2360);
        _2350 = _2362;
    }
    float _2364 = _2350;
    float _2366 = _2340 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2368 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2370 = isnan(_1608);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2376 = _2372 || _2374;
    float _2378 = _2334 * _1371;
    float _2380 = _1868 * _2366;
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2364 * _1586;
    float _2386 = _2366;
    float _2388 = _2384;
    if (_1397)
    {
        _1129 = _2378;
    }
    float _2390 = _1129;
    float _2392 = -_2382;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2396 = _2390;
    if (!_1397)
    {
        _2396 = 0.0;
    }
    float _2398 = _2396;
    float _2400 = -_2384;
    float _2402 = fma(_2400, _2394, 1.0);
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    if (!_2376)
    {
        _2342 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2406 = _2342;
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2410 = _2408;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2376)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2416 = _2344;
    float _2418 = _2416;
    float _2420 = _2416;
    if (!_2376)
    {
        _2386 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2422 = _2386;
    out.m_105.x = _2408;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2376)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2346;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2376)
    {
        _2388 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2434 = _2388;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2376)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2440 = _2410;
    float _2442 = _1828 * _2326;
    float _2444 = fma(_1824, _2338, _1508);
    float _2446 = fma(_1826, _2338, _1510);
    float _2448 = fma(_1514, _2442, _1512);
    out.m_107.x = _2444;
    out.m_107.y = _2446;
    out.m_107.z = _2448;
    out.m_107.w = _2336;
    bool _2450 = !_2376;
    float _2452 = _2440;
    float _2454 = _2440;
    if (!_2450)
    {
        bool _2456 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2458 = isnan(_1608);
        bool _2460 = _2456 || _2458;
        bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2464 = _2460 || _2462;
        if (!_2464)
        {
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2468 = _1608 + _2466;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2470;
            float _2474 = 1.0 / _2472;
            float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2478 = _2476 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2496 = _2468 * _2474;
            float _2498 = precise::clamp(_2496, 0.0, 1.0);
            float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2504 = fma(_2498, _2478, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2506 = fma(_2498, _2502, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2508 = fma(_2498, _2482, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2510 = fma(_2498, _2486, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2512 = fma(_2498, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2514 = fma(_2498, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2420 = _2506;
            _2438 = _2512;
            _2414 = _2504;
            _2432 = _2510;
            _2426 = _2508;
            _2454 = _2514;
            _2516 = true;
        }
        else
        {
            bool _2518 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2520 = isnan(_1608);
            bool _2522 = _2518 || _2520;
            bool _2524 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2526 = _2522 || _2524;
            if (!_2526)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2528 = _2412;
            _2414 = _2528;
            if (!_2526)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2530 = _2418;
            _2420 = _2530;
            if (!_2526)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2532 = _2424;
            _2426 = _2532;
            if (!_2526)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2534 = _2430;
            _2432 = _2534;
            if (!_2526)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2536 = _2436;
            _2438 = _2536;
            if (!_2526)
            {
                _2452 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2538 = _2452;
            bool _2540 = !_2526;
            _2454 = _2538;
            if (!_2540)
            {
                bool _2542 = _1608 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2544 = isnan(_1608);
                bool _2546 = _2542 || _2544;
                bool _2548 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2550 = _2546 || _2548;
                if (!_2550)
                {
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2554 = _1608 + _2552;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2556;
                    float _2560 = 1.0 / _2558;
                    float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2582 = _2554 * _2560;
                    float _2584 = precise::clamp(_2582, 0.0, 1.0);
                    float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2590 = fma(_2584, _2564, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2592 = fma(_2584, _2588, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2594 = fma(_2584, _2568, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2596 = fma(_2584, _2572, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2598 = fma(_2584, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2600 = fma(_2584, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2420 = _2592;
                    _2438 = _2598;
                    _2414 = _2590;
                    _2432 = _2596;
                    _2426 = _2594;
                    _2454 = _2600;
                    _2516 = true;
                }
                else
                {
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2454 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2516 = false;
    float _2602 = _2420;
    float _2604 = _2438;
    float _2606 = _2414;
    float _2608 = _2432;
    float _2610 = _2426;
    float _2612 = _2454;
    float _2614 = fma(_2314, -0.5, 0.5);
    float _2616 = precise::clamp(_2614, 0.0, 1.0);
    float _2618 = -_2602;
    float _2620 = _2618 + _2604;
    float _2622 = -_2606;
    float _2624 = _2622 + _2608;
    float _2626 = -_2610;
    float _2628 = _2626 + _2612;
    bool _2630 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2632 = fma(_2616, _2620, _2602);
    float _2634 = fma(_2616, _2624, _2606);
    float _2636 = fma(_2616, _2628, _2610);
    float _2638 = _2398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2640 = _2632 * 0.586610972881317138671875;
    out.m_66.x = 1.0;
    float _2642 = fma(_2634, 0.298911988735198974609375, _2640);
    out.m_105.w = _2638;
    float _2644 = fma(_2636, 0.114477999508380889892578125, _2642);
    out.m_109.x = 0.0;
    float _2646 = -_2644;
    float _2648 = _2634 + _2646;
    float _2650 = -_2644;
    float _2652 = _2632 + _2650;
    float _2654 = -_2644;
    float _2656 = _2636 + _2654;
    float _2658 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2660 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    float _2662 = fma(_2656, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2644);
    out.m_111.x = _2658;
    out.m_111.y = _2660;
    out.m_111.z = _2662;
    if (!_2630)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2664 = -_1227;
    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2668 = -_1229;
    float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2672 = -_1231;
    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2676 = _2666 * _2666;
    float _2678 = fma(_2670, _2670, _2676);
    float _2680 = fma(_2674, _2674, _2678);
    float _2682 = sqrt(_2680);
    float _2684 = rsqrt(_2680);
    float _2686 = -_2682;
    float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2690 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2692 = precise::clamp(_2690, 0.0, 1.0);
    float _2694 = _2670 * _2684;
    float _2696 = _2666 * _2684;
    float _2698 = abs(_2692);
    float _2700 = log2(_2698);
    float _2702 = _2674 * _2684;
    float _2704 = _2694 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2706 = _2314 * _2696;
    float _2708 = -_2696;
    float _2710 = -_2704;
    float _2712 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2710);
    float _2714 = fma(_2306, _2694, _2706);
    float _2716 = -_2702;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2712);
    float _2720 = fma(_2320, _2702, _2714);
    float _2722 = precise::clamp(_2720, 0.0, 1.0);
    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2726 = _2718 + _2724;
    float _2728 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2730 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = exp2(_2728);
    float _2736 = _2734 * _2732;
    float _2738 = _2722 * _2736;
    float _2740 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2742 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2744 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_109.x = _2740;
    out.m_109.y = _2742;
    out.m_109.z = _2744;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

