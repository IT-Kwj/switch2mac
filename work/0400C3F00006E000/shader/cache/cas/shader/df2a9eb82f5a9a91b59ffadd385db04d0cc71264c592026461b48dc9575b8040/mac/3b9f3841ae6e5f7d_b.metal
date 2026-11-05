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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_73 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2874 = false;
    bool _454 = false;
    bool _326 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3179 = as_type<float>(_124);
        out.gl_Position.z = _3179;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_162);
        out.gl_Position.z = _3248;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_53.x;
    float _166 = in.m_53.y;
    float _168 = in.m_53.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _186;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_108);
        float _216 = 1.0 / _214;
        float _218 = _142 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _240;
    float _246 = -_236;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _224 * _244;
    bool _256 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_220);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = fma(_252, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _266 * _248;
    float _280 = fma(_270, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_276, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = -_266;
    float _286 = _284 + 1.0;
    float _288 = _272 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _298 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _300 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _294);
    float _302 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _296);
    float _304 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _298);
    bool _306 = !_242;
    float _324;
    if (!_306)
    {
        float _308 = in.m_55.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_108);
        float _330 = 1.0 / _328;
        float _332 = _142 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_57.x;
    float _338 = in.m_57.y;
    float _340 = in.m_57.z;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _344 = _334 + _342;
    bool _346 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_334);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _360;
    float _366 = _302 * _338;
    float _368 = _304 * _340;
    float _370 = _300 * _336;
    float _372 = _344 * _364;
    bool _374 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _376 = isnan(_334);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_356;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _398;
    float _402 = _384 * _388;
    float _404 = fma(_392, _372, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _406 = fma(_396, _372, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _408 = fma(_400, _372, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _410 = -_384;
    float _412 = _410 + 1.0;
    float _414 = _404 * _402;
    float _416 = _406 * _402;
    float _418 = _408 * _402;
    float _420 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].x, _414);
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].y, _416);
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].z, _418);
    float _426 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].x, _420);
    float _428 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].y, _422);
    float _430 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].z, _424);
    bool _432 = !_362;
    float _434 = _430;
    float _452;
    if (!_432)
    {
        float _436 = in.m_55.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_108);
        float _458 = 1.0 / _456;
        float _460 = _142 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _466 = int(_464);
    float _468 = in.m_55.x;
    float _470 = in.m_55.y;
    float _472 = in.m_59.y;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _488 = float(_466);
    float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _492 = log2(_490);
    float _494 = float(uint(_476));
    float _496 = 1.0 / _488;
    int _498 = ~_476;
    int _500 = _498 + 1;
    int _502 = ~_476;
    int _504 = _502 + 1;
    int _506 = ~_476;
    int _508 = _506 + 1;
    float _510 = 1.0 / _494;
    float _512 = _496 * _142;
    float _514 = 1.0 / _482;
    int _516 = as_type<int>(_510) + (-2);
    float _518 = trunc(_512);
    int _520 = int(_518);
    float _522 = 1.0 / _486;
    float _524 = float(uint(_520));
    float _526 = as_type<float>(_516) * _524;
    float _528 = trunc(_526);
    float _530 = precise::max(_528, 0.0);
    uint _533 = uint(_530);
    int _535 = ~_476;
    int _537 = _535 + 1;
    int _539 = _500 * int(_533);
    int _541 = _539 + _520;
    float _543 = float(_476);
    float _545 = float(uint(_541));
    float _547 = as_type<float>(_516) * _545;
    float _549 = trunc(_547);
    float _551 = precise::max(_549, 0.0);
    uint _553 = uint(_551);
    int _555 = int(_533) + int(_553);
    float _557 = float(_108);
    int _559 = _537 * _555;
    int _561 = _559 + _520;
    float _563 = float(_520);
    float _565 = 1.0 / _557;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _569 = _567 != 0;
    bool _571 = _563 >= _543;
    bool _573 = isnan(_563);
    bool _575 = _571 || _573;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    bool _583 = !_569;
    float _585 = _583 ? 7.345489978790283203125 : 1.0;
    bool _587 = uint(_561) >= uint(_476);
    float _589 = trunc(_581);
    int _591 = int(_589);
    float _593 = _585 * _468;
    bool _595 = !_587;
    int _597 = _595 ? 0 : (-1);
    bool _599 = _476 == 0;
    int _601 = ~_555;
    int _603 = _601 + _597;
    int _605 = _603 + 1;
    float _607 = floor(_593);
    float _609 = _543 * _142;
    int _611 = _476 * _605;
    int _613 = _611 + _520;
    float _615 = _609 * _565;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _627 = _625 != 0;
    int _629 = ~_591;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _635 = !_599;
    int _637 = _635 ? _613 : (-1);
    float _639 = trunc(_615);
    int _641 = int(_639);
    float _643 = -_607;
    float _645 = _593 + _643;
    int _647 = _637 * _633;
    int _649 = _476 + (-1);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _653 = _645 * _543;
    bool _655 = !_623;
    int _657 = _655 ? 0 : 1;
    int _659 = _591 * _649;
    int _661 = _659 + _647;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _665 = _663 != 0;
    float _667 = trunc(_653);
    int _669 = int(_667);
    int _671 = abs(_657);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _675 = 1.0 + _673;
    bool _677 = !_665;
    int _679 = _677 ? 0 : 1;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _683 = _681 != 0;
    bool _685 = !_619;
    int _687 = _685 ? 0 : 1;
    float _689 = 1.0 / _675;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _697 = _695 != 0;
    int _699 = _661 * _671;
    int _701 = abs(_679);
    float _703 = -_472;
    float _705 = _703 + 1.0;
    int _707 = abs(_687);
    bool _709 = _470 > 0.5;
    int _711 = _669 * _701;
    int _713 = _711 + _520;
    bool _715 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _717 = isnan(1.0);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _723 = _719 || _721;
    int _725 = _641 * _707;
    int _727 = _725 + _699;
    float _729 = _472;
    if (_683)
    {
        float _731 = _709 ? _705 : _472;
        _729 = _731;
    }
    float _733 = _729;
    float _735 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _739 = _737 != 0;
    float _741 = in.m_46.x;
    float _743 = in.m_46.y;
    float _745 = in.m_46.z;
    bool _747 = !_627;
    int _749 = _747 ? 0 : 1;
    float _751 = fma(_735, -2.0, _651);
    bool _753 = !_739;
    int _755 = _753 ? 0 : 1;
    float _757 = 0.0;
    if (_693)
    {
        float _759 = in.m_55.x;
        _757 = _759;
    }
    float _761 = _757;
    int _763 = abs(_749);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _769 = abs(_755);
    float _771 = _468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _773 = _713 * _763;
    int _775 = _773 + _727;
    float _777 = 1.0 / _767;
    float _779 = -_478;
    float _781 = fma(_771, 2.0, _779);
    int _783 = _669 * _769;
    int _785 = _783 + _775;
    float _787 = -_142;
    float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[76].x, _781);
    float _791 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _751);
    float _793 = float(uint(_785));
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _803 = as_type<float>(_516) * _793;
    float _805 = _743 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _807 = _743 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _809 = _743 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _811 = _492 * _142;
    float _813 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[4].x, _805);
    float _815 = trunc(_803);
    float _817 = precise::max(_815, 0.0);
    uint _819 = uint(_817);
    float _821 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[5].x, _807);
    float _823 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[6].x, _809);
    float _825 = in.m_59.x;
    float _827 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _833;
    float _837 = in.m_55.z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _843 = exp2(_811);
    float _845 = _835 * _777;
    float _847 = _468 * 2.0;
    out.m_63.x = _827;
    out.m_63.y = _829;
    out.m_63.z = _831;
    out.m_63.w = _801;
    float _849 = _841 * _514;
    bool _851 = _761 > 0.5;
    bool _853 = _851 && _693;
    float _855 = _470 + _468;
    float _857 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[4].z, _813);
    float _859 = floor(_847);
    float _861 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[6].z, _823);
    float _863 = -_843;
    float _865 = _863 + 1.0;
    int _867 = _504 * int(_819);
    int _869 = _867 + _785;
    float _871 = _470 * 2.0;
    float _873 = _855 + (-1.0);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _875;
    float _879 = float(uint(_869));
    float _881 = floor(_871);
    bool _883 = _859 >= 0.0;
    bool _885 = isnan(_859);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = _877 * _522;
    float _895 = _470 + _837;
    float _897 = as_type<float>(_516) * _879;
    float _899 = _879;
    if (_693)
    {
        _899 = _825;
    }
    float _901 = _899;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _905 = _891 ? 0 : 1;
    float _907 = _895 + (-1.0);
    bool _909 = _859 > 0.0;
    float _911 = trunc(_897);
    float _913 = precise::max(_911, 0.0);
    uint _915 = uint(_913);
    float _917 = _901;
    if (_853)
    {
        float _919 = -_901;
        float _921 = _919 + 1.0;
        _917 = _921;
    }
    float _923 = _917;
    bool _925 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _933 = _929 || _931;
    float _935 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _937 = _933 ? _865 : 0.0;
    bool _939 = _881 > 0.0;
    bool _941 = _881 >= 0.0;
    bool _943 = isnan(_881);
    bool _945 = _941 || _943;
    bool _947 = isnan(0.0);
    bool _949 = _945 || _947;
    float _951 = _837 * 2.0;
    float _953 = floor(_951);
    int _955 = int(_819) + int(_915);
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _961 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _957);
    float _963 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _959);
    float _965 = _957;
    if (!_693)
    {
        _965 = _825;
    }
    float _967 = _965;
    int _969 = _508 * _955;
    int _971 = _969 + _785;
    float _973 = _967;
    if (_693)
    {
        _973 = _923;
    }
    float _975 = _973;
    float _977 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _961);
    float _979 = float(uint(_713));
    float _981 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _963);
    if (_723)
    {
        float _983 = _937 * _689;
        _146 = _983;
    }
    float _985 = _146;
    bool _987 = uint(_971) >= uint(_476);
    bool _989 = _953 >= 0.0;
    bool _991 = isnan(_953);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = as_type<float>(_516) * _979;
    int _1001 = ~_905;
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1009 = _462 + _1007;
    int _1011 = _1005;
    if (!_909)
    {
        int _1013 = ~_905;
        int _1015 = _1013 + 1;
        _1011 = _1015;
    }
    int _1017 = _1011;
    int _1019 = _949 ? 0 : 1;
    float _1021 = trunc(_999);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    bool _1027 = !_987;
    int _1029 = _1027 ? 0 : (-1);
    float _1031 = fma(_845, _1009, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1043 = _1041 != 0;
    int _1045 = _997 ? 0 : 1;
    int _1047 = ~_955;
    int _1049 = _1047 + _1029;
    int _1051 = _1049 + 1;
    float _1053 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1055 = _953 > 0.0;
    float _1057 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1059 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    int _1061 = _476 * _1051;
    int _1063 = _1061 + _785;
    bool _1065 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1067 = isnan(_462);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = -_791;
    float _1079 = fma(_981, _1057, _1077);
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1083 = _462 + _1081;
    int _1085 = ~_476;
    int _1087 = _1085 + 1;
    bool _1089 = !_599;
    int _1091 = _1089 ? _1063 : (-1);
    float _1093 = fma(_849, _1083, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1095 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_462);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    int _1107 = _1087 * int(_1025);
    int _1109 = _1107 + _713;
    int _1111 = _1091 >> 31;
    float _1113 = -_1075;
    float _1115 = _1113 + 1.0;
    bool _1117 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1119 = isnan(_462);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1105;
    float _1131 = _1129 + 1.0;
    int _1133 = _1111 & 3;
    float _1135 = _1105 * _1115;
    float _1137 = float(uint(_1109));
    float _1139 = _1127 * _1131;
    int _1141 = _1091 + _1133;
    float _1143 = -_1127;
    float _1145 = _1143 + 1.0;
    bool _1147 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1149 = isnan(_462);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1161 = _462 + _1159;
    int _1163 = _1141 >> 2;
    float _1165 = as_type<float>(_516) * _1137;
    float _1167 = _1157 * _1145;
    int _1169 = _1163 << 4;
    int _1171 = _1169 + 368;
    float _1173 = fma(_893, _1161, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1175 = -_1157;
    float _1177 = _1175 + 1.0;
    float _1179 = _1031 * _1167;
    uint _1181 = uint(int(uint(_1171) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[int(_1191)][_1193];
    float _1197 = trunc(_1165);
    float _1199 = precise::max(_1197, 0.0);
    uint _1201 = uint(_1199);
    int _1203 = ~_1045;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1179);
    int _1211 = _1207;
    if (!_1055)
    {
        int _1213 = ~_1045;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    int _1219 = ~_1019;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    float _1225 = fma(_1093, _1139, _1209);
    float _1227 = fma(_977, _1053, _789);
    bool _1229 = !_1035;
    int _1231 = _1229 ? 0 : 1;
    int _1233 = _1091 & 3;
    bool _1235 = _1233 != 0;
    int _1237 = _1223;
    if (!_939)
    {
        int _1239 = ~_1019;
        int _1241 = _1239 + 1;
        _1237 = _1241;
    }
    int _1243 = _1237;
    bool _1245 = uint(_1233) > 1u;
    int _1247 = abs(_1231);
    float _1249 = float(_1017);
    int _1251 = _1171 + 8;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    uint _1255 = uint(int(uint(int(_1253)) >> uint(2)));
    int _1257 = int(_1253) & 3;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[int(_1255)][_1257];
    int _1261 = int(_1253) + 1;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    int _1265 = _1261 & 3;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[int(_1263)][_1265];
    int _1269 = _1091 & 3;
    bool _1271 = _1269 != 0;
    float _1273 = fma(_1173, _1135, _1225);
    int _1275 = int(_1025) + int(_1201);
    float _1277 = _1079 + 0.5;
    int _1279 = _1271 ? 0 : 1;
    float _1281 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1273);
    int _1283 = ~_476;
    int _1285 = _1283 + 1;
    int _1287 = ~_1279;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    int _1293 = _1291;
    if (!_1245)
    {
        int _1295 = ~_1279;
        int _1297 = _1295 + 1;
        _1293 = _1297;
    }
    int _1299 = _1293;
    int _1301 = _1285 * _1275;
    int _1303 = _1301 + _713;
    float _1305 = float(_1217);
    float _1307 = _1227 + 0.5;
    bool _1309 = !_1235;
    int _1311 = _1309 ? 0 : 1;
    int _1313 = abs(_1299);
    float _1315 = float(_1247);
    out.m_65.x = _1307;
    out.m_65.y = _1277;
    int _1317 = abs(_1311);
    bool _1319 = uint(_1303) >= uint(_476);
    float _1321 = _1315 * _1305;
    bool _1323 = !_1039;
    int _1325 = _1323 ? 0 : 1;
    bool _1327 = _1233 != 3;
    float _1329 = _1059 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1331 = !_1319;
    int _1333 = _1331 ? 0 : (-1);
    float _1335 = _861 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1337 = ~_1313;
    int _1339 = _1337 + 1;
    int _1341 = _1339 + 1;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1345 = _1329 + _1343;
    int _1347 = abs(_1325);
    bool _1349 = uint(_1233) >= 2u;
    int _1351 = _1341 * as_type<int>(_1195);
    int _1353 = ~_1275;
    int _1355 = _1353 + _1333;
    int _1357 = _1355 + 1;
    float _1359 = float(_1347);
    int _1361 = ~_1317;
    int _1363 = _1361 + 1;
    int _1365 = _1363 + 1;
    int _1367 = _476 * _1357;
    int _1369 = _1367 + _713;
    int _1371 = _1349 ? 0 : 1;
    float _1373 = _1359 * _1249;
    bool _1375 = !_697;
    int _1377 = _1375 ? 0 : 1;
    int _1379 = _1365 * as_type<int>(_1187);
    int _1381 = _1379 + _1351;
    int _1383 = ~_1371;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    float _1389 = in.m_67.x;
    float _1391 = in.m_67.y;
    float _1393 = in.m_67.z;
    bool _1395 = _1233 != 3;
    float _1397 = _1373 * (-2.0);
    int _1399 = _1387;
    if (_1327)
    {
        int _1401 = ~_1371;
        int _1403 = _1401 + 1;
        _1399 = _1403;
    }
    int _1405 = _1399;
    float _1407 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1409 = abs(_1377);
    float _1411 = _857 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1413 = !_1395;
    int _1415 = _1413 ? 0 : (-1);
    int _1417 = abs(_1405);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1421 = _1411 + _1419;
    int _1423 = abs(_1415);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1427 = _1335 + _1425;
    int _1429 = ~_1417;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    float _1435 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1407);
    int _1437 = ~_1423;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    int _1443 = _1433 * as_type<int>(_1259);
    int _1445 = _1443 + _1381;
    int _1447 = ~_1409;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1435);
    int _1455 = _1441 * as_type<int>(_1267);
    int _1457 = _1455 + _1445;
    float _1459 = _1321 * (-2.0);
    float _1461 = fma(_1397, _1391, _1391);
    bool _1463 = _1453 >= 0.0;
    int _1465 = _1457 * _1451;
    bool _1467 = !_599;
    int _1469 = _1467 ? _1369 : (-1);
    float _1471 = fma(_1459, _1389, _1389);
    float _1473 = fma(_935, _1397, _935);
    float _1475 = _1345 * _1345;
    float _1477 = fma(_903, _1459, _903);
    float _1479 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1481 = _468 + (-0.5);
    float _1483 = fma(_1421, _1421, _1475);
    float _1485 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1487 = _1469 * _1409;
    int _1489 = _1487 + _1465;
    float _1491 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1493 = fma(_1427, _1427, _1483);
    float _1495 = _1393;
    float _1497 = as_type<float>(_1423);
    float _1499 = _1411;
    if (_1463)
    {
        _434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1501 = _434;
    float _1503 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1471);
    bool _1505 = !_1043;
    int _1507 = _1505 ? 0 : 1;
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1511 = rsqrt(_1493);
    float _1513 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1515 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1517 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1519 = as_type<int>(_1501);
    if (_1463)
    {
        float _1521 = _1501 * 5.0;
        _1519 = as_type<int>(_1521);
    }
    int _1523 = _1519;
    float _1525 = float(_1489);
    float _1527 = fma(_1477, _985, _1503);
    int _1529 = abs(_1507);
    out.m_69.x = _1509;
    out.m_69.y = _1513;
    out.m_69.z = _1515;
    out.m_69.w = _1517;
    float _1531 = _470 + (-0.5);
    if (_1463)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5299 = as_type<float>(_1523);
        out.gl_Position.z = _5299;
    }
    float _1533 = float(_1243);
    out.m_71.x = _1525;
    float _1535 = _1345 * _1511;
    float _1537 = _1421 * _1511;
    if (_1463)
    {
        out.m_49.x = 0.0;
    }
    if (_1463)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1539 = -_1535;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1543 = float(_1529);
    float _1545 = _1427 * _1511;
    float _1547 = -_1537;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1553 = _1541 + _1551;
    float _1555 = _1527 * 0.15915493667125701904296875;
    float _1557 = -_1545;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1563 = _1549 + _1561;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1567 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1461);
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1571 = _1559 + _1569;
    float _1573 = _1543 * _1533;
    float _1575 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1565);
    float _1577 = fma(_1473, _985, _1567);
    float _1579 = -_1535;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1345);
    float _1583 = _1573 * (-2.0);
    float _1585 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1575);
    float _1587 = _1577 * 0.15915493667125701904296875;
    float _1589 = -_1537;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1421);
    float _1593 = _1581 * _1581;
    float _1595 = -_1545;
    float _1597 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    bool _1599 = _1585 >= 0.0;
    float _1601 = _837 + _468;
    float _1603 = fma(_1591, _1591, _1593);
    float _1605 = fma(_1583, _1393, _1393);
    float _1607 = _1601 + (-1.0);
    float _1609 = fma(_1597, _1597, _1603);
    float _1611 = _1555 * 6.283185482025146484375;
    float _1613 = sin(_1611);
    float _1615 = _837 + (-0.5);
    float _1617 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1619 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1605);
    if (_1599)
    {
        _1495 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1621 = _1495;
    float _1623 = fma(_1617, _1583, _1617);
    float _1625 = _1555 * 6.283185482025146484375;
    float _1627 = cos(_1625);
    int _1629 = as_type<int>(_1621);
    if (_1599)
    {
        out.m_49.x = 0.0;
    }
    if (_1599)
    {
        float _1631 = _1621 * 5.0;
        _1629 = as_type<int>(_1631);
    }
    int _1633 = _1629;
    float _1635 = fma(_1623, _985, _1619);
    float _1637 = _1587 * 6.283185482025146484375;
    float _1639 = sin(_1637);
    if (_1599)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5499 = as_type<float>(_1633);
        out.gl_Position.z = _5499;
    }
    float _1641 = _1635 * 0.15915493667125701904296875;
    float _1643 = _1587 * 6.283185482025146484375;
    float _1645 = cos(_1643);
    float _1647 = sqrt(_1609);
    if (_1599)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1649 = in.m_73.x;
    float _1651 = in.m_73.y;
    float _1653 = in.m_73.z;
    float _1655 = _1641 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = _1511 * _1647;
    float _1661 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1663 = _1613 * _1639;
    float _1665 = _1627 * _1645;
    float _1667 = _1627 * _1639;
    float _1669 = _1613 * _1645;
    float _1671 = _1641 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = _1639 * _1657;
    float _1677 = _1627 * _1657;
    float _1679 = _1645 * _1657;
    float _1681 = _1613 * _1657;
    float _1683 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1685 = _1659 * _1661;
    float _1687 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1651);
    float _1691 = _1659 * _1683;
    float _1693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1649);
    float _1695 = _1659 * _1687;
    float _1697 = _1689 * _1685;
    float _1699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1653);
    float _1701 = _1693 * _1691;
    float _1703 = fma(_1673, _1665, _1663);
    float _1705 = _1677 * _1697;
    float _1707 = _1699 * _1695;
    float _1709 = -_1669;
    float _1711 = fma(_1673, _1667, _1709);
    float _1713 = -_1697;
    float _1715 = _1673 * _1713;
    float _1717 = fma(_1703, _1701, _1705);
    float _1719 = -_1667;
    float _1721 = fma(_1673, _1669, _1719);
    float _1723 = _1681 * _1697;
    float _1725 = fma(_1679, _1701, _1715);
    float _1727 = fma(_1711, _1707, _1717);
    float _1729 = fma(_1673, _1663, _1665);
    float _1731 = fma(_1721, _1701, _1723);
    float _1733 = fma(_1675, _1707, _1725);
    float _1735 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1739 = fma(_1729, _1707, _1731);
    float _1741 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1743 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1745 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1737);
    float _1747 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1741);
    float _1749 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1743);
    float _1751 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1745);
    float _1753 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1747);
    float _1755 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1757 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1759 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1761 = _1335 + _1755;
    float _1763 = _1411 + _1757;
    float _1765 = _1329 + _1759;
    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1769 = _1761 + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1773 = _1763 + _1771;
    float _1775 = _1769 * _1769;
    float _1777 = fma(_1773, _1773, _1775);
    float _1779 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1781 = sqrt(_1777);
    float _1783 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1779);
    float _1785 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1783);
    bool _1787 = _1781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = _1779;
    float _1791 = _1761;
    if (!_1787)
    {
        _1789 = _1763;
    }
    float _1793 = _1789;
    float _1795 = _1793;
    if (!_1787)
    {
        _1497 = _1765;
    }
    float _1797 = _1497;
    bool _1799 = !_1787;
    float _1801 = _1797;
    if (!_1799)
    {
        float _1803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1807 = _1781 + _1805;
        float _1809 = rsqrt(_1777);
        float _1811 = _1807 * _1803;
        float _1813 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = _1811 * 0.15915493667125701904296875;
        float _1817 = _1815 * 6.283185482025146484375;
        float _1819 = cos(_1817);
        float _1821 = _1815 * 6.283185482025146484375;
        float _1823 = sin(_1821);
        float _1825 = _1819 + (-1.0);
        float _1827 = fma(_1823, _1813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1831 = _1809 * _1827;
        float _1833 = fma(_1765, _1819, _1829);
        float _1835 = fma(_1773, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1837 = fma(_1769, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1801 = _1833;
        _1795 = _1835;
        _1791 = _1837;
    }
    float _1839 = _1801;
    float _1841 = _1795;
    float _1843 = _1791;
    float _1845 = -_1329;
    float _1847 = _1845 + _1839;
    float _1849 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = -_1411;
    float _1853 = _1851 + _1841;
    float _1855 = -_1335;
    float _1857 = _1855 + _1843;
    float _1859 = _1847 * _1847;
    float _1861 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1863 = 1.0 / _1849;
    float _1865 = fma(_1853, _1853, _1859);
    float _1867 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1861);
    float _1869 = fma(_1857, _1857, _1865);
    float _1871 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1867);
    bool _1873 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1875 = isnan(0.5);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1881 = _1877 || _1879;
    float _1883 = sqrt(_1869);
    float _1885 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    float _1897 = _1885 + _1849;
    float _1899 = _1897 * _1863;
    float _1901 = _1899 * 0.5;
    bool _1903 = _1883 > 0.0;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = 1.0 / _1907;
    bool _1911 = !_1903;
    float _1913 = _1841;
    float _1915 = _1839;
    float _1917 = _1843;
    float _1919 = _1909;
    if (!_1911)
    {
        float _1921 = _186 * _186;
        float _1923 = rsqrt(_1869);
        float _1925 = fma(_184, _184, _1921);
        float _1927 = fma(_188, _188, _1925);
        float _1929 = sqrt(_1927);
        float _1931 = _1847 * _1923;
        float _1933 = _1857 * _1923;
        bool _1935 = _1929 > 0.0;
        float _1937 = _1853 * _1923;
        bool _1939 = !_1935;
        if (!_1939)
        {
            float _1941 = rsqrt(_1927);
            float _1943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1945 = _186 * _1941;
            float _1947 = _184 * _1941;
            float _1949 = _1931 * _1945;
            float _1951 = _188 * _1941;
            float _1953 = fma(_1937, _1947, _1949);
            float _1955 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1957 = fma(_1933, _1951, _1953);
            float _1959 = _1957 * _1955;
            float _1961 = fma(_184, _1959, _1841);
            float _1963 = fma(_186, _1959, _1839);
            float _1965 = fma(_188, _1959, _1843);
            _1913 = _1961;
            _1915 = _1963;
            _1917 = _1965;
        }
    }
    float _1967 = _1913;
    float _1969 = _1915;
    float _1971 = _1917;
    float _1973 = -_1537;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1967);
    float _1977 = -_1535;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1969);
    float _1981 = -_1545;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1971);
    float _1985 = _1979;
    float _1987 = _1975;
    float _1989 = _1983;
    if (_1895)
    {
        _192 = 1.0;
    }
    float _1991 = _192;
    float _1993 = _1991;
    if (!_1881)
    {
        float _1995 = _1553 * _1553;
        float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1999 = -_1335;
        float _2001 = _1999 + _1971;
        float _2003 = -_1329;
        float _2005 = _2003 + _1969;
        float _2007 = fma(_1563, _1563, _1995);
        float _2009 = -_1411;
        float _2011 = _2009 + _1967;
        float _2013 = fma(_1571, _1571, _2007);
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2017 = sqrt(_2013);
        float _2019 = 1.0 / _1659;
        float _2021 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2023 = precise::min(_2017, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2025 = _2023 * _1997;
        float _2027 = _2025 * _2019;
        float _2029 = _2021 * _2027;
        float _2031 = _2001 * _2027;
        float _2033 = fma(_2005, _2029, _1541);
        float _2035 = fma(_2011, _2029, _1549);
        float _2037 = fma(_2021, _2031, _1559);
        _1985 = _2033;
        _1987 = _2035;
        _1989 = _2037;
    }
    float _2039 = _1985;
    float _2041 = _1987;
    float _2043 = _1989;
    if (_1895)
    {
        _1499 = 1.0;
    }
    float _2045 = _1499;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2049 = _1909 * _2047;
    float _2051 = _2045;
    if (!_1895)
    {
        float _2053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = _2053 * 0.15915493667125701904296875;
        float _2057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2059 = _2055 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        float _2063 = _2057 * 0.15915493667125701904296875;
        float _2065 = _2055 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2061;
        float _2071 = _2063 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2063 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2081;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2085;
        float _2089 = 1.0 / _2087;
        float _2091 = _2079 * _2083;
        float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2095 = fma(_2049, _2091, _2093);
        float _2097 = _2095 * _2089;
        float _2099 = precise::clamp(_2097, 0.0, 1.0);
        _1919 = _2055;
        _1993 = _2099;
    }
    float _2101 = _1919;
    float _2103 = _1993;
    float _2105 = _2101;
    if (!_1895)
    {
        float _2107 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2109 = _2107 * 0.15915493667125701904296875;
        float _2111 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2113 = _2109 * 6.283185482025146484375;
        float _2115 = cos(_2113);
        float _2117 = _2111 * 0.15915493667125701904296875;
        float _2119 = _2109 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        float _2123 = 1.0 / _2115;
        float _2125 = _2117 * 6.283185482025146484375;
        float _2127 = cos(_2125);
        float _2129 = _2121 * _2123;
        float _2131 = _2117 * 6.283185482025146484375;
        float _2133 = sin(_2131);
        float _2135 = _2127 * _2129;
        float _2137 = 1.0 / _2135;
        float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2141 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2139;
        float _2143 = 1.0 / _2141;
        float _2145 = _2133 * _2137;
        float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2149 = fma(_2049, _2145, _2147);
        float _2151 = _2149 * _2143;
        float _2153 = precise::clamp(_2151, 0.0, 1.0);
        float _2155 = -_2153;
        float _2157 = _2155 + 1.0;
        _2105 = _2115;
        _2051 = _2157;
    }
    float _2159 = _2105;
    float _2161 = _2051;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2165 = _2039 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2041 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2173 = _2043 + _2171;
    float _2175 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2177 = _2165 * _2165;
    float _2179 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2175);
    float _2181 = fma(_2169, _2169, _2177);
    float _2183 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2179);
    float _2185 = fma(_2173, _2173, _2181);
    float _2187 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2189 = rsqrt(_2185);
    float _2191 = sqrt(_2185);
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2195 = _2169 * _2193;
    float _2197 = _2173 * _2193;
    float _2199 = _2195 * _2195;
    float _2201 = _2197 * _2197;
    float _2203 = _2199 + _2201;
    float _2205 = sqrt(_2203);
    bool _2207 = _2205 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2211 = _2205 + _2209;
    float _2213 = _2159;
    float _2215 = _2203;
    float _2217 = _2211;
    float _2219 = _2165;
    if (_2207)
    {
        float _2221 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2213 = _2221;
    }
    float _2223 = _2213;
    if (_2207)
    {
        float _2225 = rsqrt(_2203);
        _2215 = _2225;
    }
    float _2227 = _2215;
    float _2229 = _2223;
    float _2231 = _2227;
    if (_2207)
    {
        float _2233 = _2211 * _2223;
        _2217 = _2233;
    }
    float _2235 = _2217;
    if (_2207)
    {
        float _2237 = _2235 * 0.15915493667125701904296875;
        _2229 = _2237;
    }
    float _2239 = _2229;
    float _2241 = _2189;
    float _2243 = _2239;
    if (_2207)
    {
        float _2245 = _2239 * 6.283185482025146484375;
        float _2247 = sin(_2245);
        _2241 = _2247;
    }
    float _2249 = _2241;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2253 = precise::max(0.0, _2251);
    float _2255 = _2173;
    float _2257 = _2253;
    if (_2207)
    {
        float _2259 = _2239 * 6.283185482025146484375;
        float _2261 = cos(_2259);
        _2255 = _2261;
    }
    float _2263 = _2255;
    float _2265 = -_2193;
    float _2267 = -_2253;
    float _2269 = fma(_2165, _2265, _2267);
    float _2271 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2207)
    {
        float _2273 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2273;
    }
    float _2275 = _2219;
    float _2277 = _2275;
    if (!_2207)
    {
        _2243 = _2195;
    }
    float _2279 = _2243;
    float _2281 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2283 = _2249;
    float _2285 = _2279;
    if (_2207)
    {
        float _2287 = fma(_2249, _2275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    float _2293 = _2263;
    if (_2207)
    {
        float _2295 = _2263 + (-1.0);
        _2257 = _2295;
    }
    float _2297 = _2257;
    float _2299 = _2297;
    if (_2207)
    {
        float _2301 = _2227 * _2289;
        _2271 = _2301;
    }
    float _2303 = _2271;
    if (!_2207)
    {
        _2291 = _2269;
    }
    float _2305 = _2291;
    float _2307 = _2305;
    if (_2207)
    {
        float _2309 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2277 = _2309;
    }
    float _2311 = _2277;
    if (_2207)
    {
        float _2313 = _2195 * _2303;
        _2285 = _2313;
    }
    float _2315 = _2285;
    if (!_2207)
    {
        _2299 = _2197;
    }
    float _2317 = _2299;
    float _2319 = _2317;
    if (_2207)
    {
        float _2321 = _2197 * _2303;
        _2319 = _2321;
    }
    float _2323 = _2319;
    if (!_2207)
    {
        _2231 = _2199;
    }
    float _2325 = _2231;
    float _2327 = _2325;
    if (_2207)
    {
        float _2329 = fma(_2269, _2263, _2311);
        _2307 = _2329;
    }
    float _2331 = _2307;
    if (_2207)
    {
        float _2333 = _2315 * _2315;
        _2327 = _2333;
    }
    float _2335 = _2327;
    if (!_2207)
    {
        _2293 = _2201;
    }
    float _2337 = _2293;
    float _2339 = _2337;
    if (_2207)
    {
        float _2341 = _2323 * _2323;
        _2339 = _2341;
    }
    float _2343 = _2339;
    float _2345 = fma(_2331, _2331, _2335);
    float _2347 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2349 = floor(_2281);
    float _2351 = _2345 + _2343;
    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2355 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2353);
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2347);
    float _2361 = -_2357;
    float _2363 = _2361 + 1.0;
    float _2365 = rsqrt(_2351);
    float _2367 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2359);
    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2371 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2373 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2375 = abs(_2363);
    float _2377 = log2(_2375);
    float _2379 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2381 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2373);
    float _2385 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2379);
    float _2387 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2389 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2383);
    float _2391 = _2365 * _2315;
    float _2393 = _2365 * _2323;
    float _2395 = _2365 * _2331;
    float _2397 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2385);
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2401 = _2389 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2403 = -_2387;
    float _2405 = fma(_2403, _2369, 1.0);
    float _2407 = _2397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2409 = -_2399;
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2409);
    float _2413 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2415 = floor(_2371);
    float _2417 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2419 = -_2393;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2411);
    float _2423 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2413);
    float _2425 = -_2349;
    float _2427 = _2281 + _2425;
    float _2429 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2431 = fma(_2421, -0.5, 0.5);
    float _2433 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2423);
    float _2435 = exp2(_2417);
    float _2437 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2429);
    float _2439 = fma(_2421, 0.5, 0.5);
    float _2441 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2433);
    float _2443 = _2395 + 1.0;
    float _2445 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2437);
    float _2447 = log2(_2405);
    float _2449 = -_2415;
    float _2451 = _2371 + _2449;
    float _2453 = fma(_2439, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2455 = fma(_2439, _2453, -0.212114393711090087890625);
    float _2457 = 1.0 / _2441;
    float _2459 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2461 = -_2395;
    float _2463 = fma(_2435, _2443, _2461);
    float _2465 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2445);
    float _2467 = sqrt(_2431);
    float _2469 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2459);
    float _2471 = _2447 * 0.693147182464599609375;
    float2 _6811 = float2(_2427, _2451);
    float _2473 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6811, float2(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6811, float2(0.0), isnan(_6811)), level(0.0)).x;
    float _2475 = fma(_2439, _2455, 1.570728778839111328125);
    float _2477 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2469);
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2481 = _2465 * _2457;
    float _2483 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2477);
    float _2485 = fma(_2481, 0.5, 0.5);
    float _2487 = _2483 * _2457;
    float _2489 = _2467 * 0.636619746685028076171875;
    float _2491 = fma(_2487, -0.5, 0.5);
    float _2493 = -_2475;
    float _2495 = fma(_2489, _2493, 1.0);
    float _2497 = fma(_2463, 0.5, 0.5);
    float3 _6860 = float3(_2485, _2491, _2479);
    float _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6860, float3(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6860, float3(0.0), isnan(_6860)), level(0.0)).x;
    float3 _6871 = float3(_2485, _2491, _2479);
    float4 _2502 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6871, float3(0.0), isnan(_6871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6871, float3(0.0), isnan(_6871)), level(0.0)).xyzw;
    float _2504 = _2502.x;
    float _2506 = _2502.y;
    float _2508 = _2502.z;
    float _2510 = _2502.w;
    float2 _6887 = float2(_2495, _2497);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6887, float2(0.0), isnan(_6887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6887, float2(0.0), isnan(_6887)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    float _2522 = abs(_2049);
    float _2524 = log2(_2522);
    float _2526 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2528 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2530 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2532 = _1651 != 0.0;
    bool _2534 = isnan(_1651);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan(0.0);
    bool _2540 = _2536 || _2538;
    float _2542 = in.m_75.x;
    float _2544 = in.m_75.y;
    float _2546 = in.m_75.z;
    float _2548 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2526);
    float _2550 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2528);
    bool _2552 = _1649 == 0.0;
    bool _2554 = !_2540;
    bool _2556 = _2552 && _2554;
    float _2558 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2530);
    float _2560 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2562 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2564 = _1653 == 0.0;
    bool _2566 = _2564 && _2556;
    float _2568 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2570 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2572 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2574 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2576 = -_1673;
    float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2580 = -_1673;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2562);
    float _2584 = -_1673;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2568);
    float _2588 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2570);
    float _2592 = exp2(_2574);
    float _2594 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2596 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2598 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2548);
    float _2600 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2550);
    float _2602 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2604 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2558);
    float _2606 = _2544;
    float _2608 = _2542;
    float _2610 = _2546;
    float _2612 = _2441;
    float _2614 = _2483;
    if (!_2566)
    {
        float _2616 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2544);
        _2606 = _2616;
    }
    float _2618 = _2606;
    if (!_2566)
    {
        float _2620 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2542);
        _2608 = _2620;
    }
    float _2622 = _2608;
    if (!_2566)
    {
        float _2624 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2546);
        _2610 = _2624;
    }
    float _2626 = _2610;
    float _2628 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2578);
    float _2630 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2582);
    float _2632 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2586);
    float _2634 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2590);
    float _2636 = _2628 * _2618;
    float _2638 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2632 * _2618;
    float _2644 = exp2(_2572);
    float _2646 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2596);
    float _2648 = fma(_2598, _2622, _2636);
    float _2650 = fma(_2640, -2.0, 3.0);
    float _2652 = _2640 * _2640;
    float _2654 = fma(_2604, _2622, _2642);
    float _2656 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2634);
    float _2658 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2594);
    float _2660 = _2652 * _2650;
    float _2662 = in.m_77.x;
    float _2664 = _2630 * _2618;
    bool _2666 = _2049 <= 8000.0;
    bool _2668 = isnan(_2049);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan(8000.0);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = -_2660;
    float _2680 = _2678 + 1.0;
    float _2682 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2602);
    float _2684 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2658);
    float _2686 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    float _2688 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2660);
    float _2690 = fma(_2600, _2622, _2664);
    float _2692 = _2441 * 0.5;
    float _2694 = -_2644;
    float _2696 = _2694 + 1.0;
    float _2698 = _2676 * _2688;
    float _2700 = _2656 + _2441;
    float _2702 = _2465 + _2441;
    float _2704 = fma(_2483, -0.5, _2692);
    float _2706 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2708 = fma(_2684, _2626, _2690);
    float _2710 = fma(_2682, _2626, _2648);
    float _2712 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2714 = _2700 * 0.5;
    float _2716 = _2702 * 0.5;
    float _2718 = fma(_2686, _2626, _2654);
    bool _2720 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2722 = isnan(_2191);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2728 = _2724 || _2726;
    out.gl_Position.x = _2465;
    out.gl_Position.y = _2483;
    out.gl_Position.z = _2656;
    out.gl_Position.w = _2441;
    out.m_79.x = _2716;
    out.m_79.y = _2704;
    out.m_79.z = _2714;
    out.m_79.w = _2441;
    out.m_81.x = _2710;
    out.m_81.y = _2708;
    out.m_81.z = _2718;
    float _2730 = _2103 * _2161;
    float _2732 = _2656;
    float _2734 = _2730;
    if (!_2728)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2736 = _2612;
    float _2738 = _2736;
    float _2740 = _2736;
    if (!_2728)
    {
        _2732 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2742 = _2732;
    float _2744 = _2742;
    float _2746 = _2742;
    if (!_2728)
    {
        _2614 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2748 = _2614;
    float _2750 = -_2473;
    float _2752 = _2750 + 1.0;
    float _2754 = _2752 * _2706;
    float _2756 = precise::clamp(_2754, 0.0, 1.0);
    float _2758 = -_2756;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2762 = _2760 * _2662;
    float _2764 = _2762 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2766 = _2712 * _2499;
    float _2768 = -_2712;
    float _2770 = _2768 + 1.0;
    out.m_83.x = _2764;
    float _2772 = _2510 * _2766;
    float _2774 = _2520 * _2766;
    float _2776 = _2510 * _2770;
    float _2778 = fma(_2516, _2772, _2504);
    float _2780 = fma(_2518, _2772, _2506);
    float _2782 = fma(_2510, _2774, _2508);
    float _2784 = _2730 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2786 = _2506;
    float _2788 = _2504;
    float _2790 = _2748;
    float _2792 = _2748;
    if (!_2728)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2794 = _2786;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2728)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2800 = _2788;
    out.m_85.x = _2778;
    out.m_85.y = _2780;
    out.m_85.z = _2782;
    out.m_85.w = _2776;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2728)
    {
        _2734 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2806 = _2734;
    bool _2808 = !_2728;
    float _2810 = _2806;
    float _2812 = _2806;
    if (!_2808)
    {
        bool _2814 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2816 = isnan(_2191);
        bool _2818 = _2814 || _2816;
        bool _2820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2822 = _2818 || _2820;
        if (!_2822)
        {
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2826 = _2191 + _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2830 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2828;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2836 = 1.0 / _2830;
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2854 = _2826 * _2836;
            float _2856 = precise::clamp(_2854, 0.0, 1.0);
            float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2862 = fma(_2856, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2864 = fma(_2856, _2860, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2866 = fma(_2856, _2840, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2868 = fma(_2856, _2844, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2870 = fma(_2856, _2848, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2872 = fma(_2856, _2852, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2804 = _2864;
            _2792 = _2870;
            _2798 = _2862;
            _2746 = _2868;
            _2740 = _2866;
            _2812 = _2872;
            _2874 = true;
        }
        else
        {
            bool _2876 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2878 = isnan(_2191);
            bool _2880 = _2876 || _2878;
            bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2884 = _2880 || _2882;
            if (!_2884)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2886 = _2796;
            _2798 = _2886;
            if (!_2884)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2888 = _2802;
            _2804 = _2888;
            if (!_2884)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2890 = _2738;
            _2740 = _2890;
            if (!_2884)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2892 = _2744;
            _2746 = _2892;
            if (!_2884)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2894 = _2790;
            _2792 = _2894;
            if (!_2884)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2896 = _2810;
            bool _2898 = !_2884;
            _2812 = _2896;
            if (!_2898)
            {
                bool _2900 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2902 = isnan(_2191);
                bool _2904 = _2900 || _2902;
                bool _2906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2908 = _2904 || _2906;
                if (!_2908)
                {
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2912 = _2191 + _2910;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2916 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2914;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2922 = 1.0 / _2916;
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2940 = _2912 * _2922;
                    float _2942 = precise::clamp(_2940, 0.0, 1.0);
                    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2948 = fma(_2942, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2950 = fma(_2942, _2946, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2952 = fma(_2942, _2926, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2954 = fma(_2942, _2930, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2956 = fma(_2942, _2934, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2958 = fma(_2942, _2938, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2804 = _2950;
                    _2792 = _2956;
                    _2798 = _2948;
                    _2746 = _2954;
                    _2740 = _2952;
                    _2812 = _2958;
                    _2874 = true;
                }
                else
                {
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2874 = false;
    float _2960 = _2804;
    float _2962 = _2792;
    float _2964 = _2798;
    float _2966 = _2746;
    float _2968 = _2740;
    float _2970 = _2812;
    float _2972 = fma(_2708, -0.5, 0.5);
    float _2974 = precise::clamp(_2972, 0.0, 1.0);
    float _2976 = -_2960;
    float _2978 = _2976 + _2962;
    float _2980 = -_2964;
    float _2982 = _2980 + _2966;
    out.m_87.x = 0.0;
    float _2984 = -_2968;
    float _2986 = _2984 + _2970;
    float _2988 = fma(_2974, _2978, _2960);
    float _2990 = fma(_2974, _2982, _2964);
    bool _2992 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2994 = _2988 * 0.586610972881317138671875;
    float _2996 = fma(_2974, _2986, _2968);
    float _2998 = _2784 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3000 = fma(_2990, 0.298911988735198974609375, _2994);
    bool _3002 = _2103 > 0.0;
    bool _3004 = isnan(_2103);
    bool _3006 = _3002 || _3004;
    bool _3008 = isnan(0.0);
    bool _3010 = _3006 || _3008;
    float _3012 = fma(_2996, 0.114477999508380889892578125, _3000);
    out.m_49.x = _2998;
    bool _3014 = _2161 <= 0.0;
    bool _3016 = !_3010;
    bool _3018 = _3014 || _3016;
    float _3020 = -_3012;
    float _3022 = _2990 + _3020;
    float _3024 = -_3012;
    float _3026 = _2996 + _3024;
    float _3028 = fma(_3022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    float _3030 = -_3012;
    float _3032 = _2988 + _3030;
    float _3034 = fma(_3032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    float _3036 = fma(_3026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    bool _3038 = !_2992;
    if (!_3038)
    {
        float _3040 = -_2039;
        float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3044 = -_2041;
        float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3048 = -_2043;
        float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3052 = _3042 * _3042;
        float _3054 = fma(_3046, _3046, _3052);
        float _3056 = fma(_3050, _3050, _3054);
        float _3058 = sqrt(_3056);
        float _3060 = rsqrt(_3056);
        float _3062 = -_3058;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3068 = precise::clamp(_3066, 0.0, 1.0);
        float _3070 = _3046 * _3060;
        float _3072 = _3042 * _3060;
        float _3074 = abs(_3068);
        float _3076 = log2(_3074);
        float _3078 = _3050 * _3060;
        float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3082 = _2708 * _3072;
        float _3084 = -_3072;
        float _3086 = -_3080;
        float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
        float _3090 = fma(_2710, _3070, _3082);
        float _3092 = -_3078;
        float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
        float _3096 = fma(_2718, _3078, _3090);
        float _3098 = precise::clamp(_3096, 0.0, 1.0);
        float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3102 = _3094 + _3100;
        float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3108 = precise::clamp(_3106, 0.0, 1.0);
        float _3110 = exp2(_3104);
        float _3112 = _3110 * _3108;
        float _3114 = _3098 * _3112;
        float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3116;
        out.m_87.y = _3118;
        out.m_87.z = _3120;
    }
    out.m_89.x = _3028;
    out.m_89.y = _3034;
    out.m_89.z = _3036;
    if (!_3018)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3122 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3122;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2874 = false;
    bool _454 = false;
    bool _326 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3179 = as_type<float>(_124);
        out.gl_Position.z = _3179;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_162);
        out.gl_Position.z = _3248;
    }
    if (_156)
    {
        return out;
    }
    float _164 = in.m_53.x;
    float _166 = in.m_53.y;
    float _168 = in.m_53.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _186;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_108);
        float _216 = 1.0 / _214;
        float _218 = _142 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _240;
    float _246 = -_236;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _224 * _244;
    bool _256 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_220);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = fma(_252, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _266 * _248;
    float _280 = fma(_270, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_276, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = -_266;
    float _286 = _284 + 1.0;
    float _288 = _272 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _298 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _300 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _294);
    float _302 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _296);
    float _304 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _298);
    bool _306 = !_242;
    float _324;
    if (!_306)
    {
        float _308 = in.m_55.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_108);
        float _330 = 1.0 / _328;
        float _332 = _142 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_57.x;
    float _338 = in.m_57.y;
    float _340 = in.m_57.z;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _344 = _334 + _342;
    bool _346 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_334);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _360;
    float _366 = _302 * _338;
    float _368 = _304 * _340;
    float _370 = _300 * _336;
    float _372 = _344 * _364;
    bool _374 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _376 = isnan(_334);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_356;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _398;
    float _402 = _384 * _388;
    float _404 = fma(_392, _372, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _406 = fma(_396, _372, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _408 = fma(_400, _372, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _410 = -_384;
    float _412 = _410 + 1.0;
    float _414 = _404 * _402;
    float _416 = _406 * _402;
    float _418 = _408 * _402;
    float _420 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].x, _414);
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].y, _416);
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].z, _418);
    float _426 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].x, _420);
    float _428 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].y, _422);
    float _430 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].z, _424);
    bool _432 = !_362;
    float _434 = _430;
    float _452;
    if (!_432)
    {
        float _436 = in.m_55.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_108);
        float _458 = 1.0 / _456;
        float _460 = _142 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _466 = int(_464);
    float _468 = in.m_55.x;
    float _470 = in.m_55.y;
    float _472 = in.m_59.y;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _488 = float(_466);
    float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _492 = log2(_490);
    float _494 = float(uint(_476));
    float _496 = 1.0 / _488;
    int _498 = ~_476;
    int _500 = _498 + 1;
    int _502 = ~_476;
    int _504 = _502 + 1;
    int _506 = ~_476;
    int _508 = _506 + 1;
    float _510 = 1.0 / _494;
    float _512 = _496 * _142;
    float _514 = 1.0 / _482;
    int _516 = as_type<int>(_510) + (-2);
    float _518 = trunc(_512);
    int _520 = int(_518);
    float _522 = 1.0 / _486;
    float _524 = float(uint(_520));
    float _526 = as_type<float>(_516) * _524;
    float _528 = trunc(_526);
    float _530 = precise::max(_528, 0.0);
    uint _533 = uint(_530);
    int _535 = ~_476;
    int _537 = _535 + 1;
    int _539 = _500 * int(_533);
    int _541 = _539 + _520;
    float _543 = float(_476);
    float _545 = float(uint(_541));
    float _547 = as_type<float>(_516) * _545;
    float _549 = trunc(_547);
    float _551 = precise::max(_549, 0.0);
    uint _553 = uint(_551);
    int _555 = int(_533) + int(_553);
    float _557 = float(_108);
    int _559 = _537 * _555;
    int _561 = _559 + _520;
    float _563 = float(_520);
    float _565 = 1.0 / _557;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _569 = _567 != 0;
    bool _571 = _563 >= _543;
    bool _573 = isnan(_563);
    bool _575 = _571 || _573;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    bool _583 = !_569;
    float _585 = _583 ? 7.345489978790283203125 : 1.0;
    bool _587 = uint(_561) >= uint(_476);
    float _589 = trunc(_581);
    int _591 = int(_589);
    float _593 = _585 * _468;
    bool _595 = !_587;
    int _597 = _595 ? 0 : (-1);
    bool _599 = _476 == 0;
    int _601 = ~_555;
    int _603 = _601 + _597;
    int _605 = _603 + 1;
    float _607 = floor(_593);
    float _609 = _543 * _142;
    int _611 = _476 * _605;
    int _613 = _611 + _520;
    float _615 = _609 * _565;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _627 = _625 != 0;
    int _629 = ~_591;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _635 = !_599;
    int _637 = _635 ? _613 : (-1);
    float _639 = trunc(_615);
    int _641 = int(_639);
    float _643 = -_607;
    float _645 = _593 + _643;
    int _647 = _637 * _633;
    int _649 = _476 + (-1);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _653 = _645 * _543;
    bool _655 = !_623;
    int _657 = _655 ? 0 : 1;
    int _659 = _591 * _649;
    int _661 = _659 + _647;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _665 = _663 != 0;
    float _667 = trunc(_653);
    int _669 = int(_667);
    int _671 = abs(_657);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _675 = 1.0 + _673;
    bool _677 = !_665;
    int _679 = _677 ? 0 : 1;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _683 = _681 != 0;
    bool _685 = !_619;
    int _687 = _685 ? 0 : 1;
    float _689 = 1.0 / _675;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _697 = _695 != 0;
    int _699 = _661 * _671;
    int _701 = abs(_679);
    float _703 = -_472;
    float _705 = _703 + 1.0;
    int _707 = abs(_687);
    bool _709 = _470 > 0.5;
    int _711 = _669 * _701;
    int _713 = _711 + _520;
    bool _715 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _717 = isnan(1.0);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _723 = _719 || _721;
    int _725 = _641 * _707;
    int _727 = _725 + _699;
    float _729 = _472;
    if (_683)
    {
        float _731 = _709 ? _705 : _472;
        _729 = _731;
    }
    float _733 = _729;
    float _735 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _739 = _737 != 0;
    float _741 = in.m_46.x;
    float _743 = in.m_46.y;
    float _745 = in.m_46.z;
    bool _747 = !_627;
    int _749 = _747 ? 0 : 1;
    float _751 = fma(_735, -2.0, _651);
    bool _753 = !_739;
    int _755 = _753 ? 0 : 1;
    float _757 = 0.0;
    if (_693)
    {
        float _759 = in.m_55.x;
        _757 = _759;
    }
    float _761 = _757;
    int _763 = abs(_749);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _769 = abs(_755);
    float _771 = _468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _773 = _713 * _763;
    int _775 = _773 + _727;
    float _777 = 1.0 / _767;
    float _779 = -_478;
    float _781 = fma(_771, 2.0, _779);
    int _783 = _669 * _769;
    int _785 = _783 + _775;
    float _787 = -_142;
    float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[76].x, _781);
    float _791 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _751);
    float _793 = float(uint(_785));
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _803 = as_type<float>(_516) * _793;
    float _805 = _743 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _807 = _743 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _809 = _743 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _811 = _492 * _142;
    float _813 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[4].x, _805);
    float _815 = trunc(_803);
    float _817 = precise::max(_815, 0.0);
    uint _819 = uint(_817);
    float _821 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[5].x, _807);
    float _823 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[6].x, _809);
    float _825 = in.m_59.x;
    float _827 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _833;
    float _837 = in.m_55.z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _843 = exp2(_811);
    float _845 = _835 * _777;
    float _847 = _468 * 2.0;
    out.m_63.x = _827;
    out.m_63.y = _829;
    out.m_63.z = _831;
    out.m_63.w = _801;
    float _849 = _841 * _514;
    bool _851 = _761 > 0.5;
    bool _853 = _851 && _693;
    float _855 = _470 + _468;
    float _857 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[4].z, _813);
    float _859 = floor(_847);
    float _861 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[6].z, _823);
    float _863 = -_843;
    float _865 = _863 + 1.0;
    int _867 = _504 * int(_819);
    int _869 = _867 + _785;
    float _871 = _470 * 2.0;
    float _873 = _855 + (-1.0);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _875;
    float _879 = float(uint(_869));
    float _881 = floor(_871);
    bool _883 = _859 >= 0.0;
    bool _885 = isnan(_859);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = _877 * _522;
    float _895 = _470 + _837;
    float _897 = as_type<float>(_516) * _879;
    float _899 = _879;
    if (_693)
    {
        _899 = _825;
    }
    float _901 = _899;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _905 = _891 ? 0 : 1;
    float _907 = _895 + (-1.0);
    bool _909 = _859 > 0.0;
    float _911 = trunc(_897);
    float _913 = precise::max(_911, 0.0);
    uint _915 = uint(_913);
    float _917 = _901;
    if (_853)
    {
        float _919 = -_901;
        float _921 = _919 + 1.0;
        _917 = _921;
    }
    float _923 = _917;
    bool _925 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _933 = _929 || _931;
    float _935 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _937 = _933 ? _865 : 0.0;
    bool _939 = _881 > 0.0;
    bool _941 = _881 >= 0.0;
    bool _943 = isnan(_881);
    bool _945 = _941 || _943;
    bool _947 = isnan(0.0);
    bool _949 = _945 || _947;
    float _951 = _837 * 2.0;
    float _953 = floor(_951);
    int _955 = int(_819) + int(_915);
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _961 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _957);
    float _963 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _959);
    float _965 = _957;
    if (!_693)
    {
        _965 = _825;
    }
    float _967 = _965;
    int _969 = _508 * _955;
    int _971 = _969 + _785;
    float _973 = _967;
    if (_693)
    {
        _973 = _923;
    }
    float _975 = _973;
    float _977 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _961);
    float _979 = float(uint(_713));
    float _981 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _963);
    if (_723)
    {
        float _983 = _937 * _689;
        _146 = _983;
    }
    float _985 = _146;
    bool _987 = uint(_971) >= uint(_476);
    bool _989 = _953 >= 0.0;
    bool _991 = isnan(_953);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = as_type<float>(_516) * _979;
    int _1001 = ~_905;
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1009 = _462 + _1007;
    int _1011 = _1005;
    if (!_909)
    {
        int _1013 = ~_905;
        int _1015 = _1013 + 1;
        _1011 = _1015;
    }
    int _1017 = _1011;
    int _1019 = _949 ? 0 : 1;
    float _1021 = trunc(_999);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    bool _1027 = !_987;
    int _1029 = _1027 ? 0 : (-1);
    float _1031 = fma(_845, _1009, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1043 = _1041 != 0;
    int _1045 = _997 ? 0 : 1;
    int _1047 = ~_955;
    int _1049 = _1047 + _1029;
    int _1051 = _1049 + 1;
    float _1053 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1055 = _953 > 0.0;
    float _1057 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1059 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    int _1061 = _476 * _1051;
    int _1063 = _1061 + _785;
    bool _1065 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1067 = isnan(_462);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = -_791;
    float _1079 = fma(_981, _1057, _1077);
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1083 = _462 + _1081;
    int _1085 = ~_476;
    int _1087 = _1085 + 1;
    bool _1089 = !_599;
    int _1091 = _1089 ? _1063 : (-1);
    float _1093 = fma(_849, _1083, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1095 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_462);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    int _1107 = _1087 * int(_1025);
    int _1109 = _1107 + _713;
    int _1111 = _1091 >> 31;
    float _1113 = -_1075;
    float _1115 = _1113 + 1.0;
    bool _1117 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1119 = isnan(_462);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1105;
    float _1131 = _1129 + 1.0;
    int _1133 = _1111 & 3;
    float _1135 = _1105 * _1115;
    float _1137 = float(uint(_1109));
    float _1139 = _1127 * _1131;
    int _1141 = _1091 + _1133;
    float _1143 = -_1127;
    float _1145 = _1143 + 1.0;
    bool _1147 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1149 = isnan(_462);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1161 = _462 + _1159;
    int _1163 = _1141 >> 2;
    float _1165 = as_type<float>(_516) * _1137;
    float _1167 = _1157 * _1145;
    int _1169 = _1163 << 4;
    int _1171 = _1169 + 368;
    float _1173 = fma(_893, _1161, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1175 = -_1157;
    float _1177 = _1175 + 1.0;
    float _1179 = _1031 * _1167;
    uint _1181 = uint(int(uint(_1171) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[int(_1191)][_1193];
    float _1197 = trunc(_1165);
    float _1199 = precise::max(_1197, 0.0);
    uint _1201 = uint(_1199);
    int _1203 = ~_1045;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1179);
    int _1211 = _1207;
    if (!_1055)
    {
        int _1213 = ~_1045;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    int _1219 = ~_1019;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    float _1225 = fma(_1093, _1139, _1209);
    float _1227 = fma(_977, _1053, _789);
    bool _1229 = !_1035;
    int _1231 = _1229 ? 0 : 1;
    int _1233 = _1091 & 3;
    bool _1235 = _1233 != 0;
    int _1237 = _1223;
    if (!_939)
    {
        int _1239 = ~_1019;
        int _1241 = _1239 + 1;
        _1237 = _1241;
    }
    int _1243 = _1237;
    bool _1245 = uint(_1233) > 1u;
    int _1247 = abs(_1231);
    float _1249 = float(_1017);
    int _1251 = _1171 + 8;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    uint _1255 = uint(int(uint(int(_1253)) >> uint(2)));
    int _1257 = int(_1253) & 3;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[int(_1255)][_1257];
    int _1261 = int(_1253) + 1;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    int _1265 = _1261 & 3;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[int(_1263)][_1265];
    int _1269 = _1091 & 3;
    bool _1271 = _1269 != 0;
    float _1273 = fma(_1173, _1135, _1225);
    int _1275 = int(_1025) + int(_1201);
    float _1277 = _1079 + 0.5;
    int _1279 = _1271 ? 0 : 1;
    float _1281 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1273);
    int _1283 = ~_476;
    int _1285 = _1283 + 1;
    int _1287 = ~_1279;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    int _1293 = _1291;
    if (!_1245)
    {
        int _1295 = ~_1279;
        int _1297 = _1295 + 1;
        _1293 = _1297;
    }
    int _1299 = _1293;
    int _1301 = _1285 * _1275;
    int _1303 = _1301 + _713;
    float _1305 = float(_1217);
    float _1307 = _1227 + 0.5;
    bool _1309 = !_1235;
    int _1311 = _1309 ? 0 : 1;
    int _1313 = abs(_1299);
    float _1315 = float(_1247);
    out.m_65.x = _1307;
    out.m_65.y = _1277;
    int _1317 = abs(_1311);
    bool _1319 = uint(_1303) >= uint(_476);
    float _1321 = _1315 * _1305;
    bool _1323 = !_1039;
    int _1325 = _1323 ? 0 : 1;
    bool _1327 = _1233 != 3;
    float _1329 = _1059 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1331 = !_1319;
    int _1333 = _1331 ? 0 : (-1);
    float _1335 = _861 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1337 = ~_1313;
    int _1339 = _1337 + 1;
    int _1341 = _1339 + 1;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1345 = _1329 + _1343;
    int _1347 = abs(_1325);
    bool _1349 = uint(_1233) >= 2u;
    int _1351 = _1341 * as_type<int>(_1195);
    int _1353 = ~_1275;
    int _1355 = _1353 + _1333;
    int _1357 = _1355 + 1;
    float _1359 = float(_1347);
    int _1361 = ~_1317;
    int _1363 = _1361 + 1;
    int _1365 = _1363 + 1;
    int _1367 = _476 * _1357;
    int _1369 = _1367 + _713;
    int _1371 = _1349 ? 0 : 1;
    float _1373 = _1359 * _1249;
    bool _1375 = !_697;
    int _1377 = _1375 ? 0 : 1;
    int _1379 = _1365 * as_type<int>(_1187);
    int _1381 = _1379 + _1351;
    int _1383 = ~_1371;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    float _1389 = in.m_67.x;
    float _1391 = in.m_67.y;
    float _1393 = in.m_67.z;
    bool _1395 = _1233 != 3;
    float _1397 = _1373 * (-2.0);
    int _1399 = _1387;
    if (_1327)
    {
        int _1401 = ~_1371;
        int _1403 = _1401 + 1;
        _1399 = _1403;
    }
    int _1405 = _1399;
    float _1407 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1409 = abs(_1377);
    float _1411 = _857 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1413 = !_1395;
    int _1415 = _1413 ? 0 : (-1);
    int _1417 = abs(_1405);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1421 = _1411 + _1419;
    int _1423 = abs(_1415);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1427 = _1335 + _1425;
    int _1429 = ~_1417;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    float _1435 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1407);
    int _1437 = ~_1423;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    int _1443 = _1433 * as_type<int>(_1259);
    int _1445 = _1443 + _1381;
    int _1447 = ~_1409;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1435);
    int _1455 = _1441 * as_type<int>(_1267);
    int _1457 = _1455 + _1445;
    float _1459 = _1321 * (-2.0);
    float _1461 = fma(_1397, _1391, _1391);
    bool _1463 = _1453 >= 0.0;
    int _1465 = _1457 * _1451;
    bool _1467 = !_599;
    int _1469 = _1467 ? _1369 : (-1);
    float _1471 = fma(_1459, _1389, _1389);
    float _1473 = fma(_935, _1397, _935);
    float _1475 = _1345 * _1345;
    float _1477 = fma(_903, _1459, _903);
    float _1479 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1481 = _468 + (-0.5);
    float _1483 = fma(_1421, _1421, _1475);
    float _1485 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1487 = _1469 * _1409;
    int _1489 = _1487 + _1465;
    float _1491 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1493 = fma(_1427, _1427, _1483);
    float _1495 = _1393;
    float _1497 = as_type<float>(_1423);
    float _1499 = _1411;
    if (_1463)
    {
        _434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1501 = _434;
    float _1503 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1471);
    bool _1505 = !_1043;
    int _1507 = _1505 ? 0 : 1;
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1511 = rsqrt(_1493);
    float _1513 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1515 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1517 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1519 = as_type<int>(_1501);
    if (_1463)
    {
        float _1521 = _1501 * 5.0;
        _1519 = as_type<int>(_1521);
    }
    int _1523 = _1519;
    float _1525 = float(_1489);
    float _1527 = fma(_1477, _985, _1503);
    int _1529 = abs(_1507);
    out.m_69.x = _1509;
    out.m_69.y = _1513;
    out.m_69.z = _1515;
    out.m_69.w = _1517;
    float _1531 = _470 + (-0.5);
    if (_1463)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5299 = as_type<float>(_1523);
        out.gl_Position.z = _5299;
    }
    float _1533 = float(_1243);
    out.m_71.x = _1525;
    float _1535 = _1345 * _1511;
    float _1537 = _1421 * _1511;
    if (_1463)
    {
        out.m_49.x = 0.0;
    }
    if (_1463)
    {
        return out;
    }
    float _1539 = -_1535;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1543 = float(_1529);
    float _1545 = _1427 * _1511;
    float _1547 = -_1537;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1553 = _1541 + _1551;
    float _1555 = _1527 * 0.15915493667125701904296875;
    float _1557 = -_1545;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1563 = _1549 + _1561;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1567 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1461);
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1571 = _1559 + _1569;
    float _1573 = _1543 * _1533;
    float _1575 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1565);
    float _1577 = fma(_1473, _985, _1567);
    float _1579 = -_1535;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1345);
    float _1583 = _1573 * (-2.0);
    float _1585 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1575);
    float _1587 = _1577 * 0.15915493667125701904296875;
    float _1589 = -_1537;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1421);
    float _1593 = _1581 * _1581;
    float _1595 = -_1545;
    float _1597 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    bool _1599 = _1585 >= 0.0;
    float _1601 = _837 + _468;
    float _1603 = fma(_1591, _1591, _1593);
    float _1605 = fma(_1583, _1393, _1393);
    float _1607 = _1601 + (-1.0);
    float _1609 = fma(_1597, _1597, _1603);
    float _1611 = _1555 * 6.283185482025146484375;
    float _1613 = sin(_1611);
    float _1615 = _837 + (-0.5);
    float _1617 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1619 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1605);
    if (_1599)
    {
        _1495 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1621 = _1495;
    float _1623 = fma(_1617, _1583, _1617);
    float _1625 = _1555 * 6.283185482025146484375;
    float _1627 = cos(_1625);
    int _1629 = as_type<int>(_1621);
    if (_1599)
    {
        out.m_49.x = 0.0;
    }
    if (_1599)
    {
        float _1631 = _1621 * 5.0;
        _1629 = as_type<int>(_1631);
    }
    int _1633 = _1629;
    float _1635 = fma(_1623, _985, _1619);
    float _1637 = _1587 * 6.283185482025146484375;
    float _1639 = sin(_1637);
    if (_1599)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5499 = as_type<float>(_1633);
        out.gl_Position.z = _5499;
    }
    float _1641 = _1635 * 0.15915493667125701904296875;
    float _1643 = _1587 * 6.283185482025146484375;
    float _1645 = cos(_1643);
    float _1647 = sqrt(_1609);
    if (_1599)
    {
        return out;
    }
    float _1649 = in.m_73.x;
    float _1651 = in.m_73.y;
    float _1653 = in.m_73.z;
    float _1655 = _1641 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = _1511 * _1647;
    float _1661 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1663 = _1613 * _1639;
    float _1665 = _1627 * _1645;
    float _1667 = _1627 * _1639;
    float _1669 = _1613 * _1645;
    float _1671 = _1641 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = _1639 * _1657;
    float _1677 = _1627 * _1657;
    float _1679 = _1645 * _1657;
    float _1681 = _1613 * _1657;
    float _1683 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1685 = _1659 * _1661;
    float _1687 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1651);
    float _1691 = _1659 * _1683;
    float _1693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1649);
    float _1695 = _1659 * _1687;
    float _1697 = _1689 * _1685;
    float _1699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1653);
    float _1701 = _1693 * _1691;
    float _1703 = fma(_1673, _1665, _1663);
    float _1705 = _1677 * _1697;
    float _1707 = _1699 * _1695;
    float _1709 = -_1669;
    float _1711 = fma(_1673, _1667, _1709);
    float _1713 = -_1697;
    float _1715 = _1673 * _1713;
    float _1717 = fma(_1703, _1701, _1705);
    float _1719 = -_1667;
    float _1721 = fma(_1673, _1669, _1719);
    float _1723 = _1681 * _1697;
    float _1725 = fma(_1679, _1701, _1715);
    float _1727 = fma(_1711, _1707, _1717);
    float _1729 = fma(_1673, _1663, _1665);
    float _1731 = fma(_1721, _1701, _1723);
    float _1733 = fma(_1675, _1707, _1725);
    float _1735 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1739 = fma(_1729, _1707, _1731);
    float _1741 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1743 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1745 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1737);
    float _1747 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1741);
    float _1749 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1743);
    float _1751 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1745);
    float _1753 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1747);
    float _1755 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1757 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1759 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1761 = _1335 + _1755;
    float _1763 = _1411 + _1757;
    float _1765 = _1329 + _1759;
    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1769 = _1761 + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1773 = _1763 + _1771;
    float _1775 = _1769 * _1769;
    float _1777 = fma(_1773, _1773, _1775);
    float _1779 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1781 = sqrt(_1777);
    float _1783 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1779);
    float _1785 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1783);
    bool _1787 = _1781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = _1779;
    float _1791 = _1761;
    if (!_1787)
    {
        _1789 = _1763;
    }
    float _1793 = _1789;
    float _1795 = _1793;
    if (!_1787)
    {
        _1497 = _1765;
    }
    float _1797 = _1497;
    bool _1799 = !_1787;
    float _1801 = _1797;
    if (!_1799)
    {
        float _1803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1807 = _1781 + _1805;
        float _1809 = rsqrt(_1777);
        float _1811 = _1807 * _1803;
        float _1813 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = _1811 * 0.15915493667125701904296875;
        float _1817 = _1815 * 6.283185482025146484375;
        float _1819 = cos(_1817);
        float _1821 = _1815 * 6.283185482025146484375;
        float _1823 = sin(_1821);
        float _1825 = _1819 + (-1.0);
        float _1827 = fma(_1823, _1813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1831 = _1809 * _1827;
        float _1833 = fma(_1765, _1819, _1829);
        float _1835 = fma(_1773, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1837 = fma(_1769, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1801 = _1833;
        _1795 = _1835;
        _1791 = _1837;
    }
    float _1839 = _1801;
    float _1841 = _1795;
    float _1843 = _1791;
    float _1845 = -_1329;
    float _1847 = _1845 + _1839;
    float _1849 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = -_1411;
    float _1853 = _1851 + _1841;
    float _1855 = -_1335;
    float _1857 = _1855 + _1843;
    float _1859 = _1847 * _1847;
    float _1861 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1863 = 1.0 / _1849;
    float _1865 = fma(_1853, _1853, _1859);
    float _1867 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1861);
    float _1869 = fma(_1857, _1857, _1865);
    float _1871 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1867);
    bool _1873 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1875 = isnan(0.5);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1881 = _1877 || _1879;
    float _1883 = sqrt(_1869);
    float _1885 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    float _1897 = _1885 + _1849;
    float _1899 = _1897 * _1863;
    float _1901 = _1899 * 0.5;
    bool _1903 = _1883 > 0.0;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = 1.0 / _1907;
    bool _1911 = !_1903;
    float _1913 = _1841;
    float _1915 = _1839;
    float _1917 = _1843;
    float _1919 = _1909;
    if (!_1911)
    {
        float _1921 = _186 * _186;
        float _1923 = rsqrt(_1869);
        float _1925 = fma(_184, _184, _1921);
        float _1927 = fma(_188, _188, _1925);
        float _1929 = sqrt(_1927);
        float _1931 = _1847 * _1923;
        float _1933 = _1857 * _1923;
        bool _1935 = _1929 > 0.0;
        float _1937 = _1853 * _1923;
        bool _1939 = !_1935;
        if (!_1939)
        {
            float _1941 = rsqrt(_1927);
            float _1943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1945 = _186 * _1941;
            float _1947 = _184 * _1941;
            float _1949 = _1931 * _1945;
            float _1951 = _188 * _1941;
            float _1953 = fma(_1937, _1947, _1949);
            float _1955 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1957 = fma(_1933, _1951, _1953);
            float _1959 = _1957 * _1955;
            float _1961 = fma(_184, _1959, _1841);
            float _1963 = fma(_186, _1959, _1839);
            float _1965 = fma(_188, _1959, _1843);
            _1913 = _1961;
            _1915 = _1963;
            _1917 = _1965;
        }
    }
    float _1967 = _1913;
    float _1969 = _1915;
    float _1971 = _1917;
    float _1973 = -_1537;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1967);
    float _1977 = -_1535;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1969);
    float _1981 = -_1545;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1971);
    float _1985 = _1979;
    float _1987 = _1975;
    float _1989 = _1983;
    if (_1895)
    {
        _192 = 1.0;
    }
    float _1991 = _192;
    float _1993 = _1991;
    if (!_1881)
    {
        float _1995 = _1553 * _1553;
        float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1999 = -_1335;
        float _2001 = _1999 + _1971;
        float _2003 = -_1329;
        float _2005 = _2003 + _1969;
        float _2007 = fma(_1563, _1563, _1995);
        float _2009 = -_1411;
        float _2011 = _2009 + _1967;
        float _2013 = fma(_1571, _1571, _2007);
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2017 = sqrt(_2013);
        float _2019 = 1.0 / _1659;
        float _2021 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2023 = precise::min(_2017, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2025 = _2023 * _1997;
        float _2027 = _2025 * _2019;
        float _2029 = _2021 * _2027;
        float _2031 = _2001 * _2027;
        float _2033 = fma(_2005, _2029, _1541);
        float _2035 = fma(_2011, _2029, _1549);
        float _2037 = fma(_2021, _2031, _1559);
        _1985 = _2033;
        _1987 = _2035;
        _1989 = _2037;
    }
    float _2039 = _1985;
    float _2041 = _1987;
    float _2043 = _1989;
    if (_1895)
    {
        _1499 = 1.0;
    }
    float _2045 = _1499;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2049 = _1909 * _2047;
    float _2051 = _2045;
    if (!_1895)
    {
        float _2053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = _2053 * 0.15915493667125701904296875;
        float _2057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2059 = _2055 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        float _2063 = _2057 * 0.15915493667125701904296875;
        float _2065 = _2055 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2061;
        float _2071 = _2063 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2063 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2081;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2085;
        float _2089 = 1.0 / _2087;
        float _2091 = _2079 * _2083;
        float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2095 = fma(_2049, _2091, _2093);
        float _2097 = _2095 * _2089;
        float _2099 = precise::clamp(_2097, 0.0, 1.0);
        _1919 = _2055;
        _1993 = _2099;
    }
    float _2101 = _1919;
    float _2103 = _1993;
    float _2105 = _2101;
    if (!_1895)
    {
        float _2107 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2109 = _2107 * 0.15915493667125701904296875;
        float _2111 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2113 = _2109 * 6.283185482025146484375;
        float _2115 = cos(_2113);
        float _2117 = _2111 * 0.15915493667125701904296875;
        float _2119 = _2109 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        float _2123 = 1.0 / _2115;
        float _2125 = _2117 * 6.283185482025146484375;
        float _2127 = cos(_2125);
        float _2129 = _2121 * _2123;
        float _2131 = _2117 * 6.283185482025146484375;
        float _2133 = sin(_2131);
        float _2135 = _2127 * _2129;
        float _2137 = 1.0 / _2135;
        float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2141 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2139;
        float _2143 = 1.0 / _2141;
        float _2145 = _2133 * _2137;
        float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2149 = fma(_2049, _2145, _2147);
        float _2151 = _2149 * _2143;
        float _2153 = precise::clamp(_2151, 0.0, 1.0);
        float _2155 = -_2153;
        float _2157 = _2155 + 1.0;
        _2105 = _2115;
        _2051 = _2157;
    }
    float _2159 = _2105;
    float _2161 = _2051;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2165 = _2039 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2041 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2173 = _2043 + _2171;
    float _2175 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2177 = _2165 * _2165;
    float _2179 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2175);
    float _2181 = fma(_2169, _2169, _2177);
    float _2183 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2179);
    float _2185 = fma(_2173, _2173, _2181);
    float _2187 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2189 = rsqrt(_2185);
    float _2191 = sqrt(_2185);
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2195 = _2169 * _2193;
    float _2197 = _2173 * _2193;
    float _2199 = _2195 * _2195;
    float _2201 = _2197 * _2197;
    float _2203 = _2199 + _2201;
    float _2205 = sqrt(_2203);
    bool _2207 = _2205 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2211 = _2205 + _2209;
    float _2213 = _2159;
    float _2215 = _2203;
    float _2217 = _2211;
    float _2219 = _2165;
    if (_2207)
    {
        float _2221 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2213 = _2221;
    }
    float _2223 = _2213;
    if (_2207)
    {
        float _2225 = rsqrt(_2203);
        _2215 = _2225;
    }
    float _2227 = _2215;
    float _2229 = _2223;
    float _2231 = _2227;
    if (_2207)
    {
        float _2233 = _2211 * _2223;
        _2217 = _2233;
    }
    float _2235 = _2217;
    if (_2207)
    {
        float _2237 = _2235 * 0.15915493667125701904296875;
        _2229 = _2237;
    }
    float _2239 = _2229;
    float _2241 = _2189;
    float _2243 = _2239;
    if (_2207)
    {
        float _2245 = _2239 * 6.283185482025146484375;
        float _2247 = sin(_2245);
        _2241 = _2247;
    }
    float _2249 = _2241;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2253 = precise::max(0.0, _2251);
    float _2255 = _2173;
    float _2257 = _2253;
    if (_2207)
    {
        float _2259 = _2239 * 6.283185482025146484375;
        float _2261 = cos(_2259);
        _2255 = _2261;
    }
    float _2263 = _2255;
    float _2265 = -_2193;
    float _2267 = -_2253;
    float _2269 = fma(_2165, _2265, _2267);
    float _2271 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2207)
    {
        float _2273 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2273;
    }
    float _2275 = _2219;
    float _2277 = _2275;
    if (!_2207)
    {
        _2243 = _2195;
    }
    float _2279 = _2243;
    float _2281 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2283 = _2249;
    float _2285 = _2279;
    if (_2207)
    {
        float _2287 = fma(_2249, _2275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    float _2293 = _2263;
    if (_2207)
    {
        float _2295 = _2263 + (-1.0);
        _2257 = _2295;
    }
    float _2297 = _2257;
    float _2299 = _2297;
    if (_2207)
    {
        float _2301 = _2227 * _2289;
        _2271 = _2301;
    }
    float _2303 = _2271;
    if (!_2207)
    {
        _2291 = _2269;
    }
    float _2305 = _2291;
    float _2307 = _2305;
    if (_2207)
    {
        float _2309 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2277 = _2309;
    }
    float _2311 = _2277;
    if (_2207)
    {
        float _2313 = _2195 * _2303;
        _2285 = _2313;
    }
    float _2315 = _2285;
    if (!_2207)
    {
        _2299 = _2197;
    }
    float _2317 = _2299;
    float _2319 = _2317;
    if (_2207)
    {
        float _2321 = _2197 * _2303;
        _2319 = _2321;
    }
    float _2323 = _2319;
    if (!_2207)
    {
        _2231 = _2199;
    }
    float _2325 = _2231;
    float _2327 = _2325;
    if (_2207)
    {
        float _2329 = fma(_2269, _2263, _2311);
        _2307 = _2329;
    }
    float _2331 = _2307;
    if (_2207)
    {
        float _2333 = _2315 * _2315;
        _2327 = _2333;
    }
    float _2335 = _2327;
    if (!_2207)
    {
        _2293 = _2201;
    }
    float _2337 = _2293;
    float _2339 = _2337;
    if (_2207)
    {
        float _2341 = _2323 * _2323;
        _2339 = _2341;
    }
    float _2343 = _2339;
    float _2345 = fma(_2331, _2331, _2335);
    float _2347 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2349 = floor(_2281);
    float _2351 = _2345 + _2343;
    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2355 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2353);
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2347);
    float _2361 = -_2357;
    float _2363 = _2361 + 1.0;
    float _2365 = rsqrt(_2351);
    float _2367 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2359);
    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2371 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2373 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2375 = abs(_2363);
    float _2377 = log2(_2375);
    float _2379 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2381 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2373);
    float _2385 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2379);
    float _2387 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2389 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2383);
    float _2391 = _2365 * _2315;
    float _2393 = _2365 * _2323;
    float _2395 = _2365 * _2331;
    float _2397 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2385);
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2401 = _2389 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2403 = -_2387;
    float _2405 = fma(_2403, _2369, 1.0);
    float _2407 = _2397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2409 = -_2399;
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2409);
    float _2413 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2415 = floor(_2371);
    float _2417 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2419 = -_2393;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2411);
    float _2423 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2413);
    float _2425 = -_2349;
    float _2427 = _2281 + _2425;
    float _2429 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2431 = fma(_2421, -0.5, 0.5);
    float _2433 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2423);
    float _2435 = exp2(_2417);
    float _2437 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2429);
    float _2439 = fma(_2421, 0.5, 0.5);
    float _2441 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2433);
    float _2443 = _2395 + 1.0;
    float _2445 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2437);
    float _2447 = log2(_2405);
    float _2449 = -_2415;
    float _2451 = _2371 + _2449;
    float _2453 = fma(_2439, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2455 = fma(_2439, _2453, -0.212114393711090087890625);
    float _2457 = 1.0 / _2441;
    float _2459 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2461 = -_2395;
    float _2463 = fma(_2435, _2443, _2461);
    float _2465 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2445);
    float _2467 = sqrt(_2431);
    float _2469 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2459);
    float _2471 = _2447 * 0.693147182464599609375;
    float2 _6811 = float2(_2427, _2451);
    float _2473 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6811, float2(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6811, float2(0.0), isnan(_6811)), level(0.0)).x;
    float _2475 = fma(_2439, _2455, 1.570728778839111328125);
    float _2477 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2469);
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2481 = _2465 * _2457;
    float _2483 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2477);
    float _2485 = fma(_2481, 0.5, 0.5);
    float _2487 = _2483 * _2457;
    float _2489 = _2467 * 0.636619746685028076171875;
    float _2491 = fma(_2487, -0.5, 0.5);
    float _2493 = -_2475;
    float _2495 = fma(_2489, _2493, 1.0);
    float _2497 = fma(_2463, 0.5, 0.5);
    float3 _6860 = float3(_2485, _2491, _2479);
    float _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6860, float3(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6860, float3(0.0), isnan(_6860)), level(0.0)).x;
    float3 _6871 = float3(_2485, _2491, _2479);
    float4 _2502 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6871, float3(0.0), isnan(_6871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6871, float3(0.0), isnan(_6871)), level(0.0)).xyzw;
    float _2504 = _2502.x;
    float _2506 = _2502.y;
    float _2508 = _2502.z;
    float _2510 = _2502.w;
    float2 _6887 = float2(_2495, _2497);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6887, float2(0.0), isnan(_6887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6887, float2(0.0), isnan(_6887)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    float _2522 = abs(_2049);
    float _2524 = log2(_2522);
    float _2526 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2528 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2530 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2532 = _1651 != 0.0;
    bool _2534 = isnan(_1651);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan(0.0);
    bool _2540 = _2536 || _2538;
    float _2542 = in.m_75.x;
    float _2544 = in.m_75.y;
    float _2546 = in.m_75.z;
    float _2548 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2526);
    float _2550 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2528);
    bool _2552 = _1649 == 0.0;
    bool _2554 = !_2540;
    bool _2556 = _2552 && _2554;
    float _2558 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2530);
    float _2560 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2562 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2564 = _1653 == 0.0;
    bool _2566 = _2564 && _2556;
    float _2568 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2570 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2572 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2574 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2576 = -_1673;
    float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2580 = -_1673;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2562);
    float _2584 = -_1673;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2568);
    float _2588 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2570);
    float _2592 = exp2(_2574);
    float _2594 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2596 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2598 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2548);
    float _2600 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2550);
    float _2602 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2604 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2558);
    float _2606 = _2544;
    float _2608 = _2542;
    float _2610 = _2546;
    float _2612 = _2441;
    float _2614 = _2483;
    if (!_2566)
    {
        float _2616 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2544);
        _2606 = _2616;
    }
    float _2618 = _2606;
    if (!_2566)
    {
        float _2620 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2542);
        _2608 = _2620;
    }
    float _2622 = _2608;
    if (!_2566)
    {
        float _2624 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2546);
        _2610 = _2624;
    }
    float _2626 = _2610;
    float _2628 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2578);
    float _2630 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2582);
    float _2632 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2586);
    float _2634 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2590);
    float _2636 = _2628 * _2618;
    float _2638 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2632 * _2618;
    float _2644 = exp2(_2572);
    float _2646 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2596);
    float _2648 = fma(_2598, _2622, _2636);
    float _2650 = fma(_2640, -2.0, 3.0);
    float _2652 = _2640 * _2640;
    float _2654 = fma(_2604, _2622, _2642);
    float _2656 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2634);
    float _2658 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2594);
    float _2660 = _2652 * _2650;
    float _2662 = in.m_77.x;
    float _2664 = _2630 * _2618;
    bool _2666 = _2049 <= 8000.0;
    bool _2668 = isnan(_2049);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan(8000.0);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = -_2660;
    float _2680 = _2678 + 1.0;
    float _2682 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2602);
    float _2684 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2658);
    float _2686 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    float _2688 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2660);
    float _2690 = fma(_2600, _2622, _2664);
    float _2692 = _2441 * 0.5;
    float _2694 = -_2644;
    float _2696 = _2694 + 1.0;
    float _2698 = _2676 * _2688;
    float _2700 = _2656 + _2441;
    float _2702 = _2465 + _2441;
    float _2704 = fma(_2483, -0.5, _2692);
    float _2706 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2708 = fma(_2684, _2626, _2690);
    float _2710 = fma(_2682, _2626, _2648);
    float _2712 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2714 = _2700 * 0.5;
    float _2716 = _2702 * 0.5;
    float _2718 = fma(_2686, _2626, _2654);
    bool _2720 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2722 = isnan(_2191);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2728 = _2724 || _2726;
    out.gl_Position.x = _2465;
    out.gl_Position.y = _2483;
    out.gl_Position.z = _2656;
    out.gl_Position.w = _2441;
    out.m_79.x = _2716;
    out.m_79.y = _2704;
    out.m_79.z = _2714;
    out.m_79.w = _2441;
    out.m_81.x = _2710;
    out.m_81.y = _2708;
    out.m_81.z = _2718;
    float _2730 = _2103 * _2161;
    float _2732 = _2656;
    float _2734 = _2730;
    if (!_2728)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2736 = _2612;
    float _2738 = _2736;
    float _2740 = _2736;
    if (!_2728)
    {
        _2732 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2742 = _2732;
    float _2744 = _2742;
    float _2746 = _2742;
    if (!_2728)
    {
        _2614 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2748 = _2614;
    float _2750 = -_2473;
    float _2752 = _2750 + 1.0;
    float _2754 = _2752 * _2706;
    float _2756 = precise::clamp(_2754, 0.0, 1.0);
    float _2758 = -_2756;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2762 = _2760 * _2662;
    float _2764 = _2762 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2766 = _2712 * _2499;
    float _2768 = -_2712;
    float _2770 = _2768 + 1.0;
    out.m_83.x = _2764;
    float _2772 = _2510 * _2766;
    float _2774 = _2520 * _2766;
    float _2776 = _2510 * _2770;
    float _2778 = fma(_2516, _2772, _2504);
    float _2780 = fma(_2518, _2772, _2506);
    float _2782 = fma(_2510, _2774, _2508);
    float _2784 = _2730 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2786 = _2506;
    float _2788 = _2504;
    float _2790 = _2748;
    float _2792 = _2748;
    if (!_2728)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2794 = _2786;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2728)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2800 = _2788;
    out.m_85.x = _2778;
    out.m_85.y = _2780;
    out.m_85.z = _2782;
    out.m_85.w = _2776;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2728)
    {
        _2734 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2806 = _2734;
    bool _2808 = !_2728;
    float _2810 = _2806;
    float _2812 = _2806;
    if (!_2808)
    {
        bool _2814 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2816 = isnan(_2191);
        bool _2818 = _2814 || _2816;
        bool _2820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2822 = _2818 || _2820;
        if (!_2822)
        {
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2826 = _2191 + _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2830 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2828;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2836 = 1.0 / _2830;
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2854 = _2826 * _2836;
            float _2856 = precise::clamp(_2854, 0.0, 1.0);
            float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2862 = fma(_2856, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2864 = fma(_2856, _2860, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2866 = fma(_2856, _2840, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2868 = fma(_2856, _2844, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2870 = fma(_2856, _2848, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2872 = fma(_2856, _2852, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2804 = _2864;
            _2792 = _2870;
            _2798 = _2862;
            _2746 = _2868;
            _2740 = _2866;
            _2812 = _2872;
            _2874 = true;
        }
        else
        {
            bool _2876 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2878 = isnan(_2191);
            bool _2880 = _2876 || _2878;
            bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2884 = _2880 || _2882;
            if (!_2884)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2886 = _2796;
            _2798 = _2886;
            if (!_2884)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2888 = _2802;
            _2804 = _2888;
            if (!_2884)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2890 = _2738;
            _2740 = _2890;
            if (!_2884)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2892 = _2744;
            _2746 = _2892;
            if (!_2884)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2894 = _2790;
            _2792 = _2894;
            if (!_2884)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2896 = _2810;
            bool _2898 = !_2884;
            _2812 = _2896;
            if (!_2898)
            {
                bool _2900 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2902 = isnan(_2191);
                bool _2904 = _2900 || _2902;
                bool _2906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2908 = _2904 || _2906;
                if (!_2908)
                {
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2912 = _2191 + _2910;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2916 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2914;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2922 = 1.0 / _2916;
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2940 = _2912 * _2922;
                    float _2942 = precise::clamp(_2940, 0.0, 1.0);
                    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2948 = fma(_2942, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2950 = fma(_2942, _2946, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2952 = fma(_2942, _2926, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2954 = fma(_2942, _2930, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2956 = fma(_2942, _2934, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2958 = fma(_2942, _2938, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2804 = _2950;
                    _2792 = _2956;
                    _2798 = _2948;
                    _2746 = _2954;
                    _2740 = _2952;
                    _2812 = _2958;
                    _2874 = true;
                }
                else
                {
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2874 = false;
    float _2960 = _2804;
    float _2962 = _2792;
    float _2964 = _2798;
    float _2966 = _2746;
    float _2968 = _2740;
    float _2970 = _2812;
    float _2972 = fma(_2708, -0.5, 0.5);
    float _2974 = precise::clamp(_2972, 0.0, 1.0);
    float _2976 = -_2960;
    float _2978 = _2976 + _2962;
    float _2980 = -_2964;
    float _2982 = _2980 + _2966;
    out.m_87.x = 0.0;
    float _2984 = -_2968;
    float _2986 = _2984 + _2970;
    float _2988 = fma(_2974, _2978, _2960);
    float _2990 = fma(_2974, _2982, _2964);
    bool _2992 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2994 = _2988 * 0.586610972881317138671875;
    float _2996 = fma(_2974, _2986, _2968);
    float _2998 = _2784 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3000 = fma(_2990, 0.298911988735198974609375, _2994);
    bool _3002 = _2103 > 0.0;
    bool _3004 = isnan(_2103);
    bool _3006 = _3002 || _3004;
    bool _3008 = isnan(0.0);
    bool _3010 = _3006 || _3008;
    float _3012 = fma(_2996, 0.114477999508380889892578125, _3000);
    out.m_49.x = _2998;
    bool _3014 = _2161 <= 0.0;
    bool _3016 = !_3010;
    bool _3018 = _3014 || _3016;
    float _3020 = -_3012;
    float _3022 = _2990 + _3020;
    float _3024 = -_3012;
    float _3026 = _2996 + _3024;
    float _3028 = fma(_3022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    float _3030 = -_3012;
    float _3032 = _2988 + _3030;
    float _3034 = fma(_3032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    float _3036 = fma(_3026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    bool _3038 = !_2992;
    if (!_3038)
    {
        float _3040 = -_2039;
        float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3044 = -_2041;
        float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3048 = -_2043;
        float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3052 = _3042 * _3042;
        float _3054 = fma(_3046, _3046, _3052);
        float _3056 = fma(_3050, _3050, _3054);
        float _3058 = sqrt(_3056);
        float _3060 = rsqrt(_3056);
        float _3062 = -_3058;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3068 = precise::clamp(_3066, 0.0, 1.0);
        float _3070 = _3046 * _3060;
        float _3072 = _3042 * _3060;
        float _3074 = abs(_3068);
        float _3076 = log2(_3074);
        float _3078 = _3050 * _3060;
        float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3082 = _2708 * _3072;
        float _3084 = -_3072;
        float _3086 = -_3080;
        float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
        float _3090 = fma(_2710, _3070, _3082);
        float _3092 = -_3078;
        float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
        float _3096 = fma(_2718, _3078, _3090);
        float _3098 = precise::clamp(_3096, 0.0, 1.0);
        float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3102 = _3094 + _3100;
        float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3108 = precise::clamp(_3106, 0.0, 1.0);
        float _3110 = exp2(_3104);
        float _3112 = _3110 * _3108;
        float _3114 = _3098 * _3112;
        float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3116;
        out.m_87.y = _3118;
        out.m_87.z = _3120;
    }
    out.m_89.x = _3028;
    out.m_89.y = _3034;
    out.m_89.z = _3036;
    if (!_3018)
    {
        return out;
    }
    float _3122 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3122;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2874 = false;
    bool _454 = false;
    bool _326 = false;
    bool _212 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_49.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3179 = as_type<float>(_124);
        out.gl_Position.z = _3179;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = 0.0;
    float _146 = _142;
    if (_138)
    {
        float _148 = float(_108);
        _144 = _148;
    }
    float _150 = _144;
    bool _152 = _142 >= _150;
    bool _154 = !_138;
    bool _156 = _152 || _154;
    if (_156)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _118;
    if (_156)
    {
        out.m_49.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3248 = as_type<float>(_162);
        out.gl_Position.z = _3248;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_53.x;
    float _166 = in.m_53.y;
    float _168 = in.m_53.z;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _174 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _176 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _178 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _172);
    float _180 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _174);
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _182);
    bool _190 = !_170;
    float _192 = _186;
    float _210;
    if (!_190)
    {
        float _194 = in.m_55.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _210 = _208;
        _212 = true;
    }
    else
    {
        float _214 = float(_108);
        float _216 = 1.0 / _214;
        float _218 = _142 * _216;
        _210 = _218;
    }
    _212 = false;
    float _220 = _210;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _220 + _222;
    bool _226 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _228 = isnan(_220);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _240;
    float _246 = -_236;
    float _248 = _246 + 1.0;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = _224 * _244;
    bool _256 = _220 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _258 = isnan(_220);
    bool _260 = _256 || _258;
    bool _262 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _264 = _260 || _262;
    float _266 = float(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = fma(_252, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _274;
    float _278 = _266 * _248;
    float _280 = fma(_270, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_276, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = -_266;
    float _286 = _284 + 1.0;
    float _288 = _272 * _278;
    float _290 = _280 * _278;
    float _292 = _282 * _278;
    float _294 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _296 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _298 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _300 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].x, _294);
    float _302 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].y, _296);
    float _304 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[144].z, _298);
    bool _306 = !_242;
    float _324;
    if (!_306)
    {
        float _308 = in.m_55.x;
        float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _312 = _308 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _314 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _316 = _314 * _310;
        float _318 = floor(_316);
        float _320 = -_318;
        float _322 = _316 + _320;
        _324 = _322;
        _326 = true;
    }
    else
    {
        float _328 = float(_108);
        float _330 = 1.0 / _328;
        float _332 = _142 * _330;
        _324 = _332;
    }
    _326 = false;
    float _334 = _324;
    float _336 = in.m_57.x;
    float _338 = in.m_57.y;
    float _340 = in.m_57.z;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _344 = _334 + _342;
    bool _346 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_334);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _358;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = 1.0 / _360;
    float _366 = _302 * _338;
    float _368 = _304 * _340;
    float _370 = _300 * _336;
    float _372 = _344 * _364;
    bool _374 = _334 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _376 = isnan(_334);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = -_356;
    float _388 = _386 + 1.0;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _398;
    float _402 = _384 * _388;
    float _404 = fma(_392, _372, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _406 = fma(_396, _372, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _408 = fma(_400, _372, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _410 = -_384;
    float _412 = _410 + 1.0;
    float _414 = _404 * _402;
    float _416 = _406 * _402;
    float _418 = _408 * _402;
    float _420 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].x, _414);
    float _422 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].y, _416);
    float _424 = fma(_412, (*spvDescriptorSet0.vp_c9)._m0[107].z, _418);
    float _426 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].x, _420);
    float _428 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].y, _422);
    float _430 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[108].z, _424);
    bool _432 = !_362;
    float _434 = _430;
    float _452;
    if (!_432)
    {
        float _436 = in.m_55.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_108);
        float _458 = 1.0 / _456;
        float _460 = _142 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _466 = int(_464);
    float _468 = in.m_55.x;
    float _470 = in.m_55.y;
    float _472 = in.m_59.y;
    float _474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _476 = int(_474);
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _488 = float(_466);
    float _490 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _492 = log2(_490);
    float _494 = float(uint(_476));
    float _496 = 1.0 / _488;
    int _498 = ~_476;
    int _500 = _498 + 1;
    int _502 = ~_476;
    int _504 = _502 + 1;
    int _506 = ~_476;
    int _508 = _506 + 1;
    float _510 = 1.0 / _494;
    float _512 = _496 * _142;
    float _514 = 1.0 / _482;
    int _516 = as_type<int>(_510) + (-2);
    float _518 = trunc(_512);
    int _520 = int(_518);
    float _522 = 1.0 / _486;
    float _524 = float(uint(_520));
    float _526 = as_type<float>(_516) * _524;
    float _528 = trunc(_526);
    float _530 = precise::max(_528, 0.0);
    uint _533 = uint(_530);
    int _535 = ~_476;
    int _537 = _535 + 1;
    int _539 = _500 * int(_533);
    int _541 = _539 + _520;
    float _543 = float(_476);
    float _545 = float(uint(_541));
    float _547 = as_type<float>(_516) * _545;
    float _549 = trunc(_547);
    float _551 = precise::max(_549, 0.0);
    uint _553 = uint(_551);
    int _555 = int(_533) + int(_553);
    float _557 = float(_108);
    int _559 = _537 * _555;
    int _561 = _559 + _520;
    float _563 = float(_520);
    float _565 = 1.0 / _557;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _569 = _567 != 0;
    bool _571 = _563 >= _543;
    bool _573 = isnan(_563);
    bool _575 = _571 || _573;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    bool _583 = !_569;
    float _585 = _583 ? 7.345489978790283203125 : 1.0;
    bool _587 = uint(_561) >= uint(_476);
    float _589 = trunc(_581);
    int _591 = int(_589);
    float _593 = _585 * _468;
    bool _595 = !_587;
    int _597 = _595 ? 0 : (-1);
    bool _599 = _476 == 0;
    int _601 = ~_555;
    int _603 = _601 + _597;
    int _605 = _603 + 1;
    float _607 = floor(_593);
    float _609 = _543 * _142;
    int _611 = _476 * _605;
    int _613 = _611 + _520;
    float _615 = _609 * _565;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _627 = _625 != 0;
    int _629 = ~_591;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _635 = !_599;
    int _637 = _635 ? _613 : (-1);
    float _639 = trunc(_615);
    int _641 = int(_639);
    float _643 = -_607;
    float _645 = _593 + _643;
    int _647 = _637 * _633;
    int _649 = _476 + (-1);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _653 = _645 * _543;
    bool _655 = !_623;
    int _657 = _655 ? 0 : 1;
    int _659 = _591 * _649;
    int _661 = _659 + _647;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _665 = _663 != 0;
    float _667 = trunc(_653);
    int _669 = int(_667);
    int _671 = abs(_657);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _675 = 1.0 + _673;
    bool _677 = !_665;
    int _679 = _677 ? 0 : 1;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _683 = _681 != 0;
    bool _685 = !_619;
    int _687 = _685 ? 0 : 1;
    float _689 = 1.0 / _675;
    int _691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _693 = _691 != 0;
    int _695 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _697 = _695 != 0;
    int _699 = _661 * _671;
    int _701 = abs(_679);
    float _703 = -_472;
    float _705 = _703 + 1.0;
    int _707 = abs(_687);
    bool _709 = _470 > 0.5;
    int _711 = _669 * _701;
    int _713 = _711 + _520;
    bool _715 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _717 = isnan(1.0);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _723 = _719 || _721;
    int _725 = _641 * _707;
    int _727 = _725 + _699;
    float _729 = _472;
    if (_683)
    {
        float _731 = _709 ? _705 : _472;
        _729 = _731;
    }
    float _733 = _729;
    float _735 = _470 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _739 = _737 != 0;
    float _741 = in.m_46.x;
    float _743 = in.m_46.y;
    float _745 = in.m_46.z;
    bool _747 = !_627;
    int _749 = _747 ? 0 : 1;
    float _751 = fma(_735, -2.0, _651);
    bool _753 = !_739;
    int _755 = _753 ? 0 : 1;
    float _757 = 0.0;
    if (_693)
    {
        float _759 = in.m_55.x;
        _757 = _759;
    }
    float _761 = _757;
    int _763 = abs(_749);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _769 = abs(_755);
    float _771 = _468 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _773 = _713 * _763;
    int _775 = _773 + _727;
    float _777 = 1.0 / _767;
    float _779 = -_478;
    float _781 = fma(_771, 2.0, _779);
    int _783 = _669 * _769;
    int _785 = _783 + _775;
    float _787 = -_142;
    float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[76].x, _781);
    float _791 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _751);
    float _793 = float(uint(_785));
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _803 = as_type<float>(_516) * _793;
    float _805 = _743 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _807 = _743 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _809 = _743 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _811 = _492 * _142;
    float _813 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[4].x, _805);
    float _815 = trunc(_803);
    float _817 = precise::max(_815, 0.0);
    uint _819 = uint(_817);
    float _821 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[5].x, _807);
    float _823 = fma(_741, (*spvDescriptorSet0.vp_c10)._m0[6].x, _809);
    float _825 = in.m_59.x;
    float _827 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _833;
    float _837 = in.m_55.z;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _843 = exp2(_811);
    float _845 = _835 * _777;
    float _847 = _468 * 2.0;
    out.m_63.x = _827;
    out.m_63.y = _829;
    out.m_63.z = _831;
    out.m_63.w = _801;
    float _849 = _841 * _514;
    bool _851 = _761 > 0.5;
    bool _853 = _851 && _693;
    float _855 = _470 + _468;
    float _857 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[4].z, _813);
    float _859 = floor(_847);
    float _861 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[6].z, _823);
    float _863 = -_843;
    float _865 = _863 + 1.0;
    int _867 = _504 * int(_819);
    int _869 = _867 + _785;
    float _871 = _470 * 2.0;
    float _873 = _855 + (-1.0);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _875;
    float _879 = float(uint(_869));
    float _881 = floor(_871);
    bool _883 = _859 >= 0.0;
    bool _885 = isnan(_859);
    bool _887 = _883 || _885;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    float _893 = _877 * _522;
    float _895 = _470 + _837;
    float _897 = as_type<float>(_516) * _879;
    float _899 = _879;
    if (_693)
    {
        _899 = _825;
    }
    float _901 = _899;
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _905 = _891 ? 0 : 1;
    float _907 = _895 + (-1.0);
    bool _909 = _859 > 0.0;
    float _911 = trunc(_897);
    float _913 = precise::max(_911, 0.0);
    uint _915 = uint(_913);
    float _917 = _901;
    if (_853)
    {
        float _919 = -_901;
        float _921 = _919 + 1.0;
        _917 = _921;
    }
    float _923 = _917;
    bool _925 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _927 = isnan(0.0);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _933 = _929 || _931;
    float _935 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _937 = _933 ? _865 : 0.0;
    bool _939 = _881 > 0.0;
    bool _941 = _881 >= 0.0;
    bool _943 = isnan(_881);
    bool _945 = _941 || _943;
    bool _947 = isnan(0.0);
    bool _949 = _945 || _947;
    float _951 = _837 * 2.0;
    float _953 = floor(_951);
    int _955 = int(_819) + int(_915);
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _961 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[78].z, _957);
    float _963 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[78].w, _959);
    float _965 = _957;
    if (!_693)
    {
        _965 = _825;
    }
    float _967 = _965;
    int _969 = _508 * _955;
    int _971 = _969 + _785;
    float _973 = _967;
    if (_693)
    {
        _973 = _923;
    }
    float _975 = _973;
    float _977 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _961);
    float _979 = float(uint(_713));
    float _981 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _963);
    if (_723)
    {
        float _983 = _937 * _689;
        _146 = _983;
    }
    float _985 = _146;
    bool _987 = uint(_971) >= uint(_476);
    bool _989 = _953 >= 0.0;
    bool _991 = isnan(_953);
    bool _993 = _989 || _991;
    bool _995 = isnan(0.0);
    bool _997 = _993 || _995;
    float _999 = as_type<float>(_516) * _979;
    int _1001 = ~_905;
    int _1003 = _1001 + 1;
    int _1005 = _1003 + 1;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1009 = _462 + _1007;
    int _1011 = _1005;
    if (!_909)
    {
        int _1013 = ~_905;
        int _1015 = _1013 + 1;
        _1011 = _1015;
    }
    int _1017 = _1011;
    int _1019 = _949 ? 0 : 1;
    float _1021 = trunc(_999);
    float _1023 = precise::max(_1021, 0.0);
    uint _1025 = uint(_1023);
    bool _1027 = !_987;
    int _1029 = _1027 ? 0 : (-1);
    float _1031 = fma(_845, _1009, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1043 = _1041 != 0;
    int _1045 = _997 ? 0 : 1;
    int _1047 = ~_955;
    int _1049 = _1047 + _1029;
    int _1051 = _1049 + 1;
    float _1053 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1055 = _953 > 0.0;
    float _1057 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1059 = fma(_745, (*spvDescriptorSet0.vp_c10)._m0[5].z, _821);
    int _1061 = _476 * _1051;
    int _1063 = _1061 + _785;
    bool _1065 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1067 = isnan(_462);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = -_791;
    float _1079 = fma(_981, _1057, _1077);
    float _1081 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1083 = _462 + _1081;
    int _1085 = ~_476;
    int _1087 = _1085 + 1;
    bool _1089 = !_599;
    int _1091 = _1089 ? _1063 : (-1);
    float _1093 = fma(_849, _1083, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1095 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_462);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    int _1107 = _1087 * int(_1025);
    int _1109 = _1107 + _713;
    int _1111 = _1091 >> 31;
    float _1113 = -_1075;
    float _1115 = _1113 + 1.0;
    bool _1117 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1119 = isnan(_462);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1105;
    float _1131 = _1129 + 1.0;
    int _1133 = _1111 & 3;
    float _1135 = _1105 * _1115;
    float _1137 = float(uint(_1109));
    float _1139 = _1127 * _1131;
    int _1141 = _1091 + _1133;
    float _1143 = -_1127;
    float _1145 = _1143 + 1.0;
    bool _1147 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1149 = isnan(_462);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1161 = _462 + _1159;
    int _1163 = _1141 >> 2;
    float _1165 = as_type<float>(_516) * _1137;
    float _1167 = _1157 * _1145;
    int _1169 = _1163 << 4;
    int _1171 = _1169 + 368;
    float _1173 = fma(_893, _1161, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1175 = -_1157;
    float _1177 = _1175 + 1.0;
    float _1179 = _1031 * _1167;
    uint _1181 = uint(int(uint(_1171) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[int(_1191)][_1193];
    float _1197 = trunc(_1165);
    float _1199 = precise::max(_1197, 0.0);
    uint _1201 = uint(_1199);
    int _1203 = ~_1045;
    int _1205 = _1203 + 1;
    int _1207 = _1205 + 1;
    float _1209 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1179);
    int _1211 = _1207;
    if (!_1055)
    {
        int _1213 = ~_1045;
        int _1215 = _1213 + 1;
        _1211 = _1215;
    }
    int _1217 = _1211;
    int _1219 = ~_1019;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    float _1225 = fma(_1093, _1139, _1209);
    float _1227 = fma(_977, _1053, _789);
    bool _1229 = !_1035;
    int _1231 = _1229 ? 0 : 1;
    int _1233 = _1091 & 3;
    bool _1235 = _1233 != 0;
    int _1237 = _1223;
    if (!_939)
    {
        int _1239 = ~_1019;
        int _1241 = _1239 + 1;
        _1237 = _1241;
    }
    int _1243 = _1237;
    bool _1245 = uint(_1233) > 1u;
    int _1247 = abs(_1231);
    float _1249 = float(_1017);
    int _1251 = _1171 + 8;
    uint _1253 = uint(int(uint(_1251) >> uint(2)));
    uint _1255 = uint(int(uint(int(_1253)) >> uint(2)));
    int _1257 = int(_1253) & 3;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[int(_1255)][_1257];
    int _1261 = int(_1253) + 1;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    int _1265 = _1261 & 3;
    float _1267 = (*spvDescriptorSet0.vp_c9)._m0[int(_1263)][_1265];
    int _1269 = _1091 & 3;
    bool _1271 = _1269 != 0;
    float _1273 = fma(_1173, _1135, _1225);
    int _1275 = int(_1025) + int(_1201);
    float _1277 = _1079 + 0.5;
    int _1279 = _1271 ? 0 : 1;
    float _1281 = fma(_1075, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1273);
    int _1283 = ~_476;
    int _1285 = _1283 + 1;
    int _1287 = ~_1279;
    int _1289 = _1287 + 1;
    int _1291 = _1289 + 1;
    int _1293 = _1291;
    if (!_1245)
    {
        int _1295 = ~_1279;
        int _1297 = _1295 + 1;
        _1293 = _1297;
    }
    int _1299 = _1293;
    int _1301 = _1285 * _1275;
    int _1303 = _1301 + _713;
    float _1305 = float(_1217);
    float _1307 = _1227 + 0.5;
    bool _1309 = !_1235;
    int _1311 = _1309 ? 0 : 1;
    int _1313 = abs(_1299);
    float _1315 = float(_1247);
    out.m_65.x = _1307;
    out.m_65.y = _1277;
    int _1317 = abs(_1311);
    bool _1319 = uint(_1303) >= uint(_476);
    float _1321 = _1315 * _1305;
    bool _1323 = !_1039;
    int _1325 = _1323 ? 0 : 1;
    bool _1327 = _1233 != 3;
    float _1329 = _1059 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1331 = !_1319;
    int _1333 = _1331 ? 0 : (-1);
    float _1335 = _861 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1337 = ~_1313;
    int _1339 = _1337 + 1;
    int _1341 = _1339 + 1;
    float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1345 = _1329 + _1343;
    int _1347 = abs(_1325);
    bool _1349 = uint(_1233) >= 2u;
    int _1351 = _1341 * as_type<int>(_1195);
    int _1353 = ~_1275;
    int _1355 = _1353 + _1333;
    int _1357 = _1355 + 1;
    float _1359 = float(_1347);
    int _1361 = ~_1317;
    int _1363 = _1361 + 1;
    int _1365 = _1363 + 1;
    int _1367 = _476 * _1357;
    int _1369 = _1367 + _713;
    int _1371 = _1349 ? 0 : 1;
    float _1373 = _1359 * _1249;
    bool _1375 = !_697;
    int _1377 = _1375 ? 0 : 1;
    int _1379 = _1365 * as_type<int>(_1187);
    int _1381 = _1379 + _1351;
    int _1383 = ~_1371;
    int _1385 = _1383 + 1;
    int _1387 = _1385 + 1;
    float _1389 = in.m_67.x;
    float _1391 = in.m_67.y;
    float _1393 = in.m_67.z;
    bool _1395 = _1233 != 3;
    float _1397 = _1373 * (-2.0);
    int _1399 = _1387;
    if (_1327)
    {
        int _1401 = ~_1371;
        int _1403 = _1401 + 1;
        _1399 = _1403;
    }
    int _1405 = _1399;
    float _1407 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1409 = abs(_1377);
    float _1411 = _857 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1413 = !_1395;
    int _1415 = _1413 ? 0 : (-1);
    int _1417 = abs(_1405);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1421 = _1411 + _1419;
    int _1423 = abs(_1415);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1427 = _1335 + _1425;
    int _1429 = ~_1417;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    float _1435 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1407);
    int _1437 = ~_1423;
    int _1439 = _1437 + 1;
    int _1441 = _1439 + 1;
    int _1443 = _1433 * as_type<int>(_1259);
    int _1445 = _1443 + _1381;
    int _1447 = ~_1409;
    int _1449 = _1447 + 1;
    int _1451 = _1449 + 1;
    float _1453 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1435);
    int _1455 = _1441 * as_type<int>(_1267);
    int _1457 = _1455 + _1445;
    float _1459 = _1321 * (-2.0);
    float _1461 = fma(_1397, _1391, _1391);
    bool _1463 = _1453 >= 0.0;
    int _1465 = _1457 * _1451;
    bool _1467 = !_599;
    int _1469 = _1467 ? _1369 : (-1);
    float _1471 = fma(_1459, _1389, _1389);
    float _1473 = fma(_935, _1397, _935);
    float _1475 = _1345 * _1345;
    float _1477 = fma(_903, _1459, _903);
    float _1479 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1481 = _468 + (-0.5);
    float _1483 = fma(_1421, _1421, _1475);
    float _1485 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1487 = _1469 * _1409;
    int _1489 = _1487 + _1465;
    float _1491 = _426 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1493 = fma(_1427, _1427, _1483);
    float _1495 = _1393;
    float _1497 = as_type<float>(_1423);
    float _1499 = _1411;
    if (_1463)
    {
        _434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1501 = _434;
    float _1503 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1471);
    bool _1505 = !_1043;
    int _1507 = _1505 ? 0 : 1;
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1511 = rsqrt(_1493);
    float _1513 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1515 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1517 = _1281 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1519 = as_type<int>(_1501);
    if (_1463)
    {
        float _1521 = _1501 * 5.0;
        _1519 = as_type<int>(_1521);
    }
    int _1523 = _1519;
    float _1525 = float(_1489);
    float _1527 = fma(_1477, _985, _1503);
    int _1529 = abs(_1507);
    out.m_69.x = _1509;
    out.m_69.y = _1513;
    out.m_69.z = _1515;
    out.m_69.w = _1517;
    float _1531 = _470 + (-0.5);
    if (_1463)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5299 = as_type<float>(_1523);
        out.gl_Position.z = _5299;
    }
    float _1533 = float(_1243);
    out.m_71.x = _1525;
    float _1535 = _1345 * _1511;
    float _1537 = _1421 * _1511;
    if (_1463)
    {
        out.m_49.x = 0.0;
    }
    if (_1463)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1539 = -_1535;
    float _1541 = fma(_1539, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1329);
    float _1543 = float(_1529);
    float _1545 = _1427 * _1511;
    float _1547 = -_1537;
    float _1549 = fma(_1547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1411);
    float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1553 = _1541 + _1551;
    float _1555 = _1527 * 0.15915493667125701904296875;
    float _1557 = -_1545;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    float _1561 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1563 = _1549 + _1561;
    float _1565 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1567 = fma(_1531, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1461);
    float _1569 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1571 = _1559 + _1569;
    float _1573 = _1543 * _1533;
    float _1575 = fma(_1563, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1565);
    float _1577 = fma(_1473, _985, _1567);
    float _1579 = -_1535;
    float _1581 = fma(_1579, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1345);
    float _1583 = _1573 * (-2.0);
    float _1585 = fma(_1571, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1575);
    float _1587 = _1577 * 0.15915493667125701904296875;
    float _1589 = -_1537;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1421);
    float _1593 = _1581 * _1581;
    float _1595 = -_1545;
    float _1597 = fma(_1595, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1427);
    bool _1599 = _1585 >= 0.0;
    float _1601 = _837 + _468;
    float _1603 = fma(_1591, _1591, _1593);
    float _1605 = fma(_1583, _1393, _1393);
    float _1607 = _1601 + (-1.0);
    float _1609 = fma(_1597, _1597, _1603);
    float _1611 = _1555 * 6.283185482025146484375;
    float _1613 = sin(_1611);
    float _1615 = _837 + (-0.5);
    float _1617 = fma(_1607, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1619 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1605);
    if (_1599)
    {
        _1495 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1621 = _1495;
    float _1623 = fma(_1617, _1583, _1617);
    float _1625 = _1555 * 6.283185482025146484375;
    float _1627 = cos(_1625);
    int _1629 = as_type<int>(_1621);
    if (_1599)
    {
        out.m_49.x = 0.0;
    }
    if (_1599)
    {
        float _1631 = _1621 * 5.0;
        _1629 = as_type<int>(_1631);
    }
    int _1633 = _1629;
    float _1635 = fma(_1623, _985, _1619);
    float _1637 = _1587 * 6.283185482025146484375;
    float _1639 = sin(_1637);
    if (_1599)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5499 = as_type<float>(_1633);
        out.gl_Position.z = _5499;
    }
    float _1641 = _1635 * 0.15915493667125701904296875;
    float _1643 = _1587 * 6.283185482025146484375;
    float _1645 = cos(_1643);
    float _1647 = sqrt(_1609);
    if (_1599)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1649 = in.m_73.x;
    float _1651 = in.m_73.y;
    float _1653 = in.m_73.z;
    float _1655 = _1641 * 6.283185482025146484375;
    float _1657 = cos(_1655);
    float _1659 = _1511 * _1647;
    float _1661 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1663 = _1613 * _1639;
    float _1665 = _1627 * _1645;
    float _1667 = _1627 * _1639;
    float _1669 = _1613 * _1645;
    float _1671 = _1641 * 6.283185482025146484375;
    float _1673 = sin(_1671);
    float _1675 = _1639 * _1657;
    float _1677 = _1627 * _1657;
    float _1679 = _1645 * _1657;
    float _1681 = _1613 * _1657;
    float _1683 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1685 = _1659 * _1661;
    float _1687 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1689 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1651);
    float _1691 = _1659 * _1683;
    float _1693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1649);
    float _1695 = _1659 * _1687;
    float _1697 = _1689 * _1685;
    float _1699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1653);
    float _1701 = _1693 * _1691;
    float _1703 = fma(_1673, _1665, _1663);
    float _1705 = _1677 * _1697;
    float _1707 = _1699 * _1695;
    float _1709 = -_1669;
    float _1711 = fma(_1673, _1667, _1709);
    float _1713 = -_1697;
    float _1715 = _1673 * _1713;
    float _1717 = fma(_1703, _1701, _1705);
    float _1719 = -_1667;
    float _1721 = fma(_1673, _1669, _1719);
    float _1723 = _1681 * _1697;
    float _1725 = fma(_1679, _1701, _1715);
    float _1727 = fma(_1711, _1707, _1717);
    float _1729 = fma(_1673, _1663, _1665);
    float _1731 = fma(_1721, _1701, _1723);
    float _1733 = fma(_1675, _1707, _1725);
    float _1735 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1737 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1739 = fma(_1729, _1707, _1731);
    float _1741 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1743 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1735);
    float _1745 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1737);
    float _1747 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1741);
    float _1749 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1743);
    float _1751 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1745);
    float _1753 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1747);
    float _1755 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1757 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1759 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1761 = _1335 + _1755;
    float _1763 = _1411 + _1757;
    float _1765 = _1329 + _1759;
    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1769 = _1761 + _1767;
    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1773 = _1763 + _1771;
    float _1775 = _1769 * _1769;
    float _1777 = fma(_1773, _1773, _1775);
    float _1779 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1781 = sqrt(_1777);
    float _1783 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1779);
    float _1785 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1783);
    bool _1787 = _1781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1789 = _1779;
    float _1791 = _1761;
    if (!_1787)
    {
        _1789 = _1763;
    }
    float _1793 = _1789;
    float _1795 = _1793;
    if (!_1787)
    {
        _1497 = _1765;
    }
    float _1797 = _1497;
    bool _1799 = !_1787;
    float _1801 = _1797;
    if (!_1799)
    {
        float _1803 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1807 = _1781 + _1805;
        float _1809 = rsqrt(_1777);
        float _1811 = _1807 * _1803;
        float _1813 = _1765 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1815 = _1811 * 0.15915493667125701904296875;
        float _1817 = _1815 * 6.283185482025146484375;
        float _1819 = cos(_1817);
        float _1821 = _1815 * 6.283185482025146484375;
        float _1823 = sin(_1821);
        float _1825 = _1819 + (-1.0);
        float _1827 = fma(_1823, _1813, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1829 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1831 = _1809 * _1827;
        float _1833 = fma(_1765, _1819, _1829);
        float _1835 = fma(_1773, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1837 = fma(_1769, _1831, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1801 = _1833;
        _1795 = _1835;
        _1791 = _1837;
    }
    float _1839 = _1801;
    float _1841 = _1795;
    float _1843 = _1791;
    float _1845 = -_1329;
    float _1847 = _1845 + _1839;
    float _1849 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1851 = -_1411;
    float _1853 = _1851 + _1841;
    float _1855 = -_1335;
    float _1857 = _1855 + _1843;
    float _1859 = _1847 * _1847;
    float _1861 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1863 = 1.0 / _1849;
    float _1865 = fma(_1853, _1853, _1859);
    float _1867 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1861);
    float _1869 = fma(_1857, _1857, _1865);
    float _1871 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1867);
    bool _1873 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1875 = isnan(0.5);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1881 = _1877 || _1879;
    float _1883 = sqrt(_1869);
    float _1885 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1889 = isnan(0.5);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1895 = _1891 || _1893;
    float _1897 = _1885 + _1849;
    float _1899 = _1897 * _1863;
    float _1901 = _1899 * 0.5;
    bool _1903 = _1883 > 0.0;
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1907 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1905);
    float _1909 = 1.0 / _1907;
    bool _1911 = !_1903;
    float _1913 = _1841;
    float _1915 = _1839;
    float _1917 = _1843;
    float _1919 = _1909;
    if (!_1911)
    {
        float _1921 = _186 * _186;
        float _1923 = rsqrt(_1869);
        float _1925 = fma(_184, _184, _1921);
        float _1927 = fma(_188, _188, _1925);
        float _1929 = sqrt(_1927);
        float _1931 = _1847 * _1923;
        float _1933 = _1857 * _1923;
        bool _1935 = _1929 > 0.0;
        float _1937 = _1853 * _1923;
        bool _1939 = !_1935;
        if (!_1939)
        {
            float _1941 = rsqrt(_1927);
            float _1943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1945 = _186 * _1941;
            float _1947 = _184 * _1941;
            float _1949 = _1931 * _1945;
            float _1951 = _188 * _1941;
            float _1953 = fma(_1937, _1947, _1949);
            float _1955 = _1943 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1957 = fma(_1933, _1951, _1953);
            float _1959 = _1957 * _1955;
            float _1961 = fma(_184, _1959, _1841);
            float _1963 = fma(_186, _1959, _1839);
            float _1965 = fma(_188, _1959, _1843);
            _1913 = _1961;
            _1915 = _1963;
            _1917 = _1965;
        }
    }
    float _1967 = _1913;
    float _1969 = _1915;
    float _1971 = _1917;
    float _1973 = -_1537;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1967);
    float _1977 = -_1535;
    float _1979 = fma(_1977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1969);
    float _1981 = -_1545;
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1971);
    float _1985 = _1979;
    float _1987 = _1975;
    float _1989 = _1983;
    if (_1895)
    {
        _192 = 1.0;
    }
    float _1991 = _192;
    float _1993 = _1991;
    if (!_1881)
    {
        float _1995 = _1553 * _1553;
        float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1999 = -_1335;
        float _2001 = _1999 + _1971;
        float _2003 = -_1329;
        float _2005 = _2003 + _1969;
        float _2007 = fma(_1563, _1563, _1995);
        float _2009 = -_1411;
        float _2011 = _2009 + _1967;
        float _2013 = fma(_1571, _1571, _2007);
        float _2015 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2017 = sqrt(_2013);
        float _2019 = 1.0 / _1659;
        float _2021 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2023 = precise::min(_2017, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2025 = _2023 * _1997;
        float _2027 = _2025 * _2019;
        float _2029 = _2021 * _2027;
        float _2031 = _2001 * _2027;
        float _2033 = fma(_2005, _2029, _1541);
        float _2035 = fma(_2011, _2029, _1549);
        float _2037 = fma(_2021, _2031, _1559);
        _1985 = _2033;
        _1987 = _2035;
        _1989 = _2037;
    }
    float _2039 = _1985;
    float _2041 = _1987;
    float _2043 = _1989;
    if (_1895)
    {
        _1499 = 1.0;
    }
    float _2045 = _1499;
    float _2047 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2049 = _1909 * _2047;
    float _2051 = _2045;
    if (!_1895)
    {
        float _2053 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2055 = _2053 * 0.15915493667125701904296875;
        float _2057 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2059 = _2055 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        float _2063 = _2057 * 0.15915493667125701904296875;
        float _2065 = _2055 * 6.283185482025146484375;
        float _2067 = sin(_2065);
        float _2069 = 1.0 / _2061;
        float _2071 = _2063 * 6.283185482025146484375;
        float _2073 = cos(_2071);
        float _2075 = _2067 * _2069;
        float _2077 = _2063 * 6.283185482025146484375;
        float _2079 = sin(_2077);
        float _2081 = _2073 * _2075;
        float _2083 = 1.0 / _2081;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2087 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2085;
        float _2089 = 1.0 / _2087;
        float _2091 = _2079 * _2083;
        float _2093 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2095 = fma(_2049, _2091, _2093);
        float _2097 = _2095 * _2089;
        float _2099 = precise::clamp(_2097, 0.0, 1.0);
        _1919 = _2055;
        _1993 = _2099;
    }
    float _2101 = _1919;
    float _2103 = _1993;
    float _2105 = _2101;
    if (!_1895)
    {
        float _2107 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2109 = _2107 * 0.15915493667125701904296875;
        float _2111 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2113 = _2109 * 6.283185482025146484375;
        float _2115 = cos(_2113);
        float _2117 = _2111 * 0.15915493667125701904296875;
        float _2119 = _2109 * 6.283185482025146484375;
        float _2121 = sin(_2119);
        float _2123 = 1.0 / _2115;
        float _2125 = _2117 * 6.283185482025146484375;
        float _2127 = cos(_2125);
        float _2129 = _2121 * _2123;
        float _2131 = _2117 * 6.283185482025146484375;
        float _2133 = sin(_2131);
        float _2135 = _2127 * _2129;
        float _2137 = 1.0 / _2135;
        float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2141 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2139;
        float _2143 = 1.0 / _2141;
        float _2145 = _2133 * _2137;
        float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2149 = fma(_2049, _2145, _2147);
        float _2151 = _2149 * _2143;
        float _2153 = precise::clamp(_2151, 0.0, 1.0);
        float _2155 = -_2153;
        float _2157 = _2155 + 1.0;
        _2105 = _2115;
        _2051 = _2157;
    }
    float _2159 = _2105;
    float _2161 = _2051;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2165 = _2039 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2041 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2173 = _2043 + _2171;
    float _2175 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2177 = _2165 * _2165;
    float _2179 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2175);
    float _2181 = fma(_2169, _2169, _2177);
    float _2183 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2179);
    float _2185 = fma(_2173, _2173, _2181);
    float _2187 = _2183 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2189 = rsqrt(_2185);
    float _2191 = sqrt(_2185);
    float _2193 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2195 = _2169 * _2193;
    float _2197 = _2173 * _2193;
    float _2199 = _2195 * _2195;
    float _2201 = _2197 * _2197;
    float _2203 = _2199 + _2201;
    float _2205 = sqrt(_2203);
    bool _2207 = _2205 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2211 = _2205 + _2209;
    float _2213 = _2159;
    float _2215 = _2203;
    float _2217 = _2211;
    float _2219 = _2165;
    if (_2207)
    {
        float _2221 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2213 = _2221;
    }
    float _2223 = _2213;
    if (_2207)
    {
        float _2225 = rsqrt(_2203);
        _2215 = _2225;
    }
    float _2227 = _2215;
    float _2229 = _2223;
    float _2231 = _2227;
    if (_2207)
    {
        float _2233 = _2211 * _2223;
        _2217 = _2233;
    }
    float _2235 = _2217;
    if (_2207)
    {
        float _2237 = _2235 * 0.15915493667125701904296875;
        _2229 = _2237;
    }
    float _2239 = _2229;
    float _2241 = _2189;
    float _2243 = _2239;
    if (_2207)
    {
        float _2245 = _2239 * 6.283185482025146484375;
        float _2247 = sin(_2245);
        _2241 = _2247;
    }
    float _2249 = _2241;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2253 = precise::max(0.0, _2251);
    float _2255 = _2173;
    float _2257 = _2253;
    if (_2207)
    {
        float _2259 = _2239 * 6.283185482025146484375;
        float _2261 = cos(_2259);
        _2255 = _2261;
    }
    float _2263 = _2255;
    float _2265 = -_2193;
    float _2267 = -_2253;
    float _2269 = fma(_2165, _2265, _2267);
    float _2271 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2207)
    {
        float _2273 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2219 = _2273;
    }
    float _2275 = _2219;
    float _2277 = _2275;
    if (!_2207)
    {
        _2243 = _2195;
    }
    float _2279 = _2243;
    float _2281 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2283 = _2249;
    float _2285 = _2279;
    if (_2207)
    {
        float _2287 = fma(_2249, _2275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    float _2293 = _2263;
    if (_2207)
    {
        float _2295 = _2263 + (-1.0);
        _2257 = _2295;
    }
    float _2297 = _2257;
    float _2299 = _2297;
    if (_2207)
    {
        float _2301 = _2227 * _2289;
        _2271 = _2301;
    }
    float _2303 = _2271;
    if (!_2207)
    {
        _2291 = _2269;
    }
    float _2305 = _2291;
    float _2307 = _2305;
    if (_2207)
    {
        float _2309 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2277 = _2309;
    }
    float _2311 = _2277;
    if (_2207)
    {
        float _2313 = _2195 * _2303;
        _2285 = _2313;
    }
    float _2315 = _2285;
    if (!_2207)
    {
        _2299 = _2197;
    }
    float _2317 = _2299;
    float _2319 = _2317;
    if (_2207)
    {
        float _2321 = _2197 * _2303;
        _2319 = _2321;
    }
    float _2323 = _2319;
    if (!_2207)
    {
        _2231 = _2199;
    }
    float _2325 = _2231;
    float _2327 = _2325;
    if (_2207)
    {
        float _2329 = fma(_2269, _2263, _2311);
        _2307 = _2329;
    }
    float _2331 = _2307;
    if (_2207)
    {
        float _2333 = _2315 * _2315;
        _2327 = _2333;
    }
    float _2335 = _2327;
    if (!_2207)
    {
        _2293 = _2201;
    }
    float _2337 = _2293;
    float _2339 = _2337;
    if (_2207)
    {
        float _2341 = _2323 * _2323;
        _2339 = _2341;
    }
    float _2343 = _2339;
    float _2345 = fma(_2331, _2331, _2335);
    float _2347 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2349 = floor(_2281);
    float _2351 = _2345 + _2343;
    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2355 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2353);
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2347);
    float _2361 = -_2357;
    float _2363 = _2361 + 1.0;
    float _2365 = rsqrt(_2351);
    float _2367 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2359);
    float _2369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2371 = fma(_1559, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2373 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2375 = abs(_2363);
    float _2377 = log2(_2375);
    float _2379 = _2039 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2381 = _2367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2373);
    float _2385 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2379);
    float _2387 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2389 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2383);
    float _2391 = _2365 * _2315;
    float _2393 = _2365 * _2323;
    float _2395 = _2365 * _2331;
    float _2397 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2385);
    float _2399 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2401 = _2389 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2403 = -_2387;
    float _2405 = fma(_2403, _2369, 1.0);
    float _2407 = _2397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2409 = -_2399;
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2409);
    float _2413 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2415 = floor(_2371);
    float _2417 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2419 = -_2393;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2411);
    float _2423 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2413);
    float _2425 = -_2349;
    float _2427 = _2281 + _2425;
    float _2429 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2431 = fma(_2421, -0.5, 0.5);
    float _2433 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2423);
    float _2435 = exp2(_2417);
    float _2437 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2429);
    float _2439 = fma(_2421, 0.5, 0.5);
    float _2441 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2433);
    float _2443 = _2395 + 1.0;
    float _2445 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2437);
    float _2447 = log2(_2405);
    float _2449 = -_2415;
    float _2451 = _2371 + _2449;
    float _2453 = fma(_2439, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2455 = fma(_2439, _2453, -0.212114393711090087890625);
    float _2457 = 1.0 / _2441;
    float _2459 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2461 = -_2395;
    float _2463 = fma(_2435, _2443, _2461);
    float _2465 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2445);
    float _2467 = sqrt(_2431);
    float _2469 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2459);
    float _2471 = _2447 * 0.693147182464599609375;
    float2 _6811 = float2(_2427, _2451);
    float _2473 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6811, float2(0.0), isnan(_6811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6811, float2(0.0), isnan(_6811)), level(0.0)).x;
    float _2475 = fma(_2439, _2455, 1.570728778839111328125);
    float _2477 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2469);
    float _2479 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2481 = _2465 * _2457;
    float _2483 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2477);
    float _2485 = fma(_2481, 0.5, 0.5);
    float _2487 = _2483 * _2457;
    float _2489 = _2467 * 0.636619746685028076171875;
    float _2491 = fma(_2487, -0.5, 0.5);
    float _2493 = -_2475;
    float _2495 = fma(_2489, _2493, 1.0);
    float _2497 = fma(_2463, 0.5, 0.5);
    float3 _6860 = float3(_2485, _2491, _2479);
    float _2499 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6860, float3(0.0), isnan(_6860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6860, float3(0.0), isnan(_6860)), level(0.0)).x;
    float3 _6871 = float3(_2485, _2491, _2479);
    float4 _2502 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6871, float3(0.0), isnan(_6871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6871, float3(0.0), isnan(_6871)), level(0.0)).xyzw;
    float _2504 = _2502.x;
    float _2506 = _2502.y;
    float _2508 = _2502.z;
    float _2510 = _2502.w;
    float2 _6887 = float2(_2495, _2497);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6887, float2(0.0), isnan(_6887)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6887, float2(0.0), isnan(_6887)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    float _2522 = abs(_2049);
    float _2524 = log2(_2522);
    float _2526 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2528 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2530 = _1703 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2532 = _1651 != 0.0;
    bool _2534 = isnan(_1651);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan(0.0);
    bool _2540 = _2536 || _2538;
    float _2542 = in.m_75.x;
    float _2544 = in.m_75.y;
    float _2546 = in.m_75.z;
    float _2548 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2526);
    float _2550 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2528);
    bool _2552 = _1649 == 0.0;
    bool _2554 = !_2540;
    bool _2556 = _2552 && _2554;
    float _2558 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2530);
    float _2560 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2562 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2564 = _1653 == 0.0;
    bool _2566 = _2564 && _2556;
    float _2568 = _1677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2570 = _2401 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2572 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2574 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2576 = -_1673;
    float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2560);
    float _2580 = -_1673;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2562);
    float _2584 = -_1673;
    float _2586 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2568);
    float _2588 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = fma(_2407, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2570);
    float _2592 = exp2(_2574);
    float _2594 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2596 = _1711 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2598 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2548);
    float _2600 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2550);
    float _2602 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2604 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2558);
    float _2606 = _2544;
    float _2608 = _2542;
    float _2610 = _2546;
    float _2612 = _2441;
    float _2614 = _2483;
    if (!_2566)
    {
        float _2616 = fma(_1651, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2544);
        _2606 = _2616;
    }
    float _2618 = _2606;
    if (!_2566)
    {
        float _2620 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2542);
        _2608 = _2620;
    }
    float _2622 = _2608;
    if (!_2566)
    {
        float _2624 = fma(_1653, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2546);
        _2610 = _2624;
    }
    float _2626 = _2610;
    float _2628 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2578);
    float _2630 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2582);
    float _2632 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2586);
    float _2634 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2590);
    float _2636 = _2628 * _2618;
    float _2638 = fma(_2592, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2632 * _2618;
    float _2644 = exp2(_2572);
    float _2646 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2596);
    float _2648 = fma(_2598, _2622, _2636);
    float _2650 = fma(_2640, -2.0, 3.0);
    float _2652 = _2640 * _2640;
    float _2654 = fma(_2604, _2622, _2642);
    float _2656 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2634);
    float _2658 = fma(_1675, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2594);
    float _2660 = _2652 * _2650;
    float _2662 = in.m_77.x;
    float _2664 = _2630 * _2618;
    bool _2666 = _2049 <= 8000.0;
    bool _2668 = isnan(_2049);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan(8000.0);
    bool _2674 = _2670 || _2672;
    float _2676 = float(_2674);
    float _2678 = -_2660;
    float _2680 = _2678 + 1.0;
    float _2682 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2602);
    float _2684 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2658);
    float _2686 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2646);
    float _2688 = fma(_2680, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2660);
    float _2690 = fma(_2600, _2622, _2664);
    float _2692 = _2441 * 0.5;
    float _2694 = -_2644;
    float _2696 = _2694 + 1.0;
    float _2698 = _2676 * _2688;
    float _2700 = _2656 + _2441;
    float _2702 = _2465 + _2441;
    float _2704 = fma(_2483, -0.5, _2692);
    float _2706 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2708 = fma(_2684, _2626, _2690);
    float _2710 = fma(_2682, _2626, _2648);
    float _2712 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2714 = _2700 * 0.5;
    float _2716 = _2702 * 0.5;
    float _2718 = fma(_2686, _2626, _2654);
    bool _2720 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2722 = isnan(_2191);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2728 = _2724 || _2726;
    out.gl_Position.x = _2465;
    out.gl_Position.y = _2483;
    out.gl_Position.z = _2656;
    out.gl_Position.w = _2441;
    out.m_79.x = _2716;
    out.m_79.y = _2704;
    out.m_79.z = _2714;
    out.m_79.w = _2441;
    out.m_81.x = _2710;
    out.m_81.y = _2708;
    out.m_81.z = _2718;
    float _2730 = _2103 * _2161;
    float _2732 = _2656;
    float _2734 = _2730;
    if (!_2728)
    {
        _2612 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2736 = _2612;
    float _2738 = _2736;
    float _2740 = _2736;
    if (!_2728)
    {
        _2732 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2742 = _2732;
    float _2744 = _2742;
    float _2746 = _2742;
    if (!_2728)
    {
        _2614 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2748 = _2614;
    float _2750 = -_2473;
    float _2752 = _2750 + 1.0;
    float _2754 = _2752 * _2706;
    float _2756 = precise::clamp(_2754, 0.0, 1.0);
    float _2758 = -_2756;
    float _2760 = fma(_2758, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2762 = _2760 * _2662;
    float _2764 = _2762 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2766 = _2712 * _2499;
    float _2768 = -_2712;
    float _2770 = _2768 + 1.0;
    out.m_83.x = _2764;
    float _2772 = _2510 * _2766;
    float _2774 = _2520 * _2766;
    float _2776 = _2510 * _2770;
    float _2778 = fma(_2516, _2772, _2504);
    float _2780 = fma(_2518, _2772, _2506);
    float _2782 = fma(_2510, _2774, _2508);
    float _2784 = _2730 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2786 = _2506;
    float _2788 = _2504;
    float _2790 = _2748;
    float _2792 = _2748;
    if (!_2728)
    {
        _2786 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2794 = _2786;
    float _2796 = _2794;
    float _2798 = _2794;
    if (!_2728)
    {
        _2788 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2800 = _2788;
    out.m_85.x = _2778;
    out.m_85.y = _2780;
    out.m_85.z = _2782;
    out.m_85.w = _2776;
    float _2802 = _2800;
    float _2804 = _2800;
    if (!_2728)
    {
        _2734 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2806 = _2734;
    bool _2808 = !_2728;
    float _2810 = _2806;
    float _2812 = _2806;
    if (!_2808)
    {
        bool _2814 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2816 = isnan(_2191);
        bool _2818 = _2814 || _2816;
        bool _2820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2822 = _2818 || _2820;
        if (!_2822)
        {
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2826 = _2191 + _2824;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2830 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2828;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2836 = 1.0 / _2830;
            float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2842 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2854 = _2826 * _2836;
            float _2856 = precise::clamp(_2854, 0.0, 1.0);
            float _2858 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2862 = fma(_2856, _2834, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2864 = fma(_2856, _2860, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2866 = fma(_2856, _2840, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2868 = fma(_2856, _2844, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2870 = fma(_2856, _2848, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2872 = fma(_2856, _2852, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2804 = _2864;
            _2792 = _2870;
            _2798 = _2862;
            _2746 = _2868;
            _2740 = _2866;
            _2812 = _2872;
            _2874 = true;
        }
        else
        {
            bool _2876 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2878 = isnan(_2191);
            bool _2880 = _2876 || _2878;
            bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2884 = _2880 || _2882;
            if (!_2884)
            {
                _2796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2886 = _2796;
            _2798 = _2886;
            if (!_2884)
            {
                _2802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2888 = _2802;
            _2804 = _2888;
            if (!_2884)
            {
                _2738 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2890 = _2738;
            _2740 = _2890;
            if (!_2884)
            {
                _2744 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2892 = _2744;
            _2746 = _2892;
            if (!_2884)
            {
                _2790 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2894 = _2790;
            _2792 = _2894;
            if (!_2884)
            {
                _2810 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2896 = _2810;
            bool _2898 = !_2884;
            _2812 = _2896;
            if (!_2898)
            {
                bool _2900 = _2191 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2902 = isnan(_2191);
                bool _2904 = _2900 || _2902;
                bool _2906 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2908 = _2904 || _2906;
                if (!_2908)
                {
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2912 = _2191 + _2910;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2916 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2914;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2922 = 1.0 / _2916;
                    float _2924 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2926 = _2924 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2930 = _2928 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2934 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2936 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2938 = _2936 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2940 = _2912 * _2922;
                    float _2942 = precise::clamp(_2940, 0.0, 1.0);
                    float _2944 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2948 = fma(_2942, _2920, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2950 = fma(_2942, _2946, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2952 = fma(_2942, _2926, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2954 = fma(_2942, _2930, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2956 = fma(_2942, _2934, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2958 = fma(_2942, _2938, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2804 = _2950;
                    _2792 = _2956;
                    _2798 = _2948;
                    _2746 = _2954;
                    _2740 = _2952;
                    _2812 = _2958;
                    _2874 = true;
                }
                else
                {
                    _2804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2792 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2746 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2740 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2812 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2874 = false;
    float _2960 = _2804;
    float _2962 = _2792;
    float _2964 = _2798;
    float _2966 = _2746;
    float _2968 = _2740;
    float _2970 = _2812;
    float _2972 = fma(_2708, -0.5, 0.5);
    float _2974 = precise::clamp(_2972, 0.0, 1.0);
    float _2976 = -_2960;
    float _2978 = _2976 + _2962;
    float _2980 = -_2964;
    float _2982 = _2980 + _2966;
    out.m_87.x = 0.0;
    float _2984 = -_2968;
    float _2986 = _2984 + _2970;
    float _2988 = fma(_2974, _2978, _2960);
    float _2990 = fma(_2974, _2982, _2964);
    bool _2992 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2994 = _2988 * 0.586610972881317138671875;
    float _2996 = fma(_2974, _2986, _2968);
    float _2998 = _2784 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3000 = fma(_2990, 0.298911988735198974609375, _2994);
    bool _3002 = _2103 > 0.0;
    bool _3004 = isnan(_2103);
    bool _3006 = _3002 || _3004;
    bool _3008 = isnan(0.0);
    bool _3010 = _3006 || _3008;
    float _3012 = fma(_2996, 0.114477999508380889892578125, _3000);
    out.m_49.x = _2998;
    bool _3014 = _2161 <= 0.0;
    bool _3016 = !_3010;
    bool _3018 = _3014 || _3016;
    float _3020 = -_3012;
    float _3022 = _2990 + _3020;
    float _3024 = -_3012;
    float _3026 = _2996 + _3024;
    float _3028 = fma(_3022, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    float _3030 = -_3012;
    float _3032 = _2988 + _3030;
    float _3034 = fma(_3032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    float _3036 = fma(_3026, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3012);
    bool _3038 = !_2992;
    if (!_3038)
    {
        float _3040 = -_2039;
        float _3042 = _3040 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3044 = -_2041;
        float _3046 = _3044 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3048 = -_2043;
        float _3050 = _3048 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3052 = _3042 * _3042;
        float _3054 = fma(_3046, _3046, _3052);
        float _3056 = fma(_3050, _3050, _3054);
        float _3058 = sqrt(_3056);
        float _3060 = rsqrt(_3056);
        float _3062 = -_3058;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3066 = _3064 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3068 = precise::clamp(_3066, 0.0, 1.0);
        float _3070 = _3046 * _3060;
        float _3072 = _3042 * _3060;
        float _3074 = abs(_3068);
        float _3076 = log2(_3074);
        float _3078 = _3050 * _3060;
        float _3080 = _3070 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3082 = _2708 * _3072;
        float _3084 = -_3072;
        float _3086 = -_3080;
        float _3088 = fma(_3084, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3086);
        float _3090 = fma(_2710, _3070, _3082);
        float _3092 = -_3078;
        float _3094 = fma(_3092, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3088);
        float _3096 = fma(_2718, _3078, _3090);
        float _3098 = precise::clamp(_3096, 0.0, 1.0);
        float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3102 = _3094 + _3100;
        float _3104 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3106 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3108 = precise::clamp(_3106, 0.0, 1.0);
        float _3110 = exp2(_3104);
        float _3112 = _3110 * _3108;
        float _3114 = _3098 * _3112;
        float _3116 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3118 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3120 = _3114 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _3116;
        out.m_87.y = _3118;
        out.m_87.z = _3120;
    }
    out.m_89.x = _3028;
    out.m_89.y = _3034;
    out.m_89.z = _3036;
    if (!_3018)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3122 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3122;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

