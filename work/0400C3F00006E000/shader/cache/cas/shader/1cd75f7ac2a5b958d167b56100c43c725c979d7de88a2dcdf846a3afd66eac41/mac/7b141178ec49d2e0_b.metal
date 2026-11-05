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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_75 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2289 = false;
    bool _1536 = false;
    bool _402 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_50.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2574 = as_type<float>(_132);
        out.gl_Position.z = _2574;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_55.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_170);
        out.gl_Position.z = _2643;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _200 = _194;
    float _218;
    if (!_198)
    {
        float _202 = in.m_59.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_116);
        float _224 = 1.0 / _222;
        float _226 = _150 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _236 = 1.0 / _232;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _242 = _234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _228 + _250;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _256 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _258 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _260 = isnan(_228);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _246;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _228 + _272;
    out.m_61.x = _248;
    out.m_61.y = _242;
    out.m_61.z = _256;
    out.m_61.w = _254;
    float _276 = -_268;
    float _278 = _276 + 1.0;
    float _280 = _252 * _236;
    bool _282 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_228);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    bool _294 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_228);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _308 = _274 * _270;
    float _310 = _304 * _278;
    float _312 = -_304;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = _292 * _314;
    float _330 = fma(_318, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _332 = fma(_322, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = fma(_326, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = _330 * _328;
    float _342 = _332 * _328;
    float _344 = _334 * _328;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _340);
    float _360 = fma(_348, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_352, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _342);
    float _366 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _344);
    float _370 = fma(_360, _310, _358);
    float _372 = fma(_362, _310, _364);
    float _374 = fma(_366, _310, _368);
    float _376 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].x, _370);
    float _378 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].y, _372);
    float _380 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].z, _374);
    bool _382 = !_306;
    float _400;
    if (!_382)
    {
        float _384 = in.m_59.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_116);
        float _406 = 1.0 / _404;
        float _408 = _150 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_59.z;
    float _414 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _416 = log2(_414);
    float _418 = in.m_59.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _430 = _428 != 0;
    float _432 = in.m_59.y;
    bool _434 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _436 = isnan(1.0);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _442 = _438 || _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _446 = 1.0 + _444;
    bool _448 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _456 = _452 || _454;
    float _458 = _416 * _150;
    float _460 = 1.0 / _446;
    float _462 = _412 * 2.0;
    float _464 = _418 * 2.0;
    float _466 = exp2(_458);
    float _468 = _432 * 2.0;
    float _470 = floor(_462);
    float _472 = _418 + _432;
    float _474 = _472 + (-1.0);
    float _476 = floor(_464);
    float _478 = -_466;
    float _480 = _478 + 1.0;
    float _482 = _456 ? _480 : 0.0;
    bool _484 = _470 > 0.0;
    float _486 = floor(_468);
    bool _488 = _470 >= 0.0;
    bool _490 = isnan(_470);
    bool _492 = _488 || _490;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    float _498 = _432 + _412;
    if (_442)
    {
        float _500 = _482 * _460;
        _154 = _500;
    }
    float _502 = _154;
    bool _504 = !_430;
    int _506 = _504 ? 0 : 1;
    float _508 = _498 + (-1.0);
    int _510 = _496 ? 0 : 1;
    bool _512 = _476 > 0.0;
    float _514 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _516 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _518 = !_422;
    int _520 = _518 ? 0 : 1;
    bool _522 = _476 >= 0.0;
    bool _524 = isnan(_476);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = in.m_63.x;
    float _534 = in.m_63.y;
    float _536 = in.m_63.z;
    int _538 = ~_510;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    int _544 = _542;
    if (!_484)
    {
        int _546 = ~_510;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    int _552 = abs(_520);
    float _554 = float(_550);
    float _556 = float(_552);
    int _558 = _530 ? 0 : 1;
    bool _560 = !_426;
    int _562 = _560 ? 0 : 1;
    float _564 = _556 * _554;
    int _566 = ~_558;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = _418 + (-0.5);
    int _574 = abs(_562);
    int _576 = _570;
    if (!_512)
    {
        int _578 = ~_558;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 * (-2.0);
    bool _586 = _486 > 0.0;
    float _588 = float(_574);
    float _590 = fma(_584, _532, _532);
    float _592 = float(_582);
    float _594 = fma(_516, _584, _516);
    bool _596 = _486 >= 0.0;
    bool _598 = isnan(_486);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].x, _590);
    int _608 = abs(_506);
    float _610 = _588 * _592;
    int _612 = _604 ? 0 : 1;
    float _614 = _432 + (-0.5);
    float _616 = float(_608);
    float _618 = _610 * (-2.0);
    int _620 = ~_612;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    float _626 = fma(_594, _502, _606);
    int _628 = _624;
    if (!_586)
    {
        int _630 = ~_612;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = fma(_618, _534, _534);
    float _638 = fma(_514, _618, _514);
    float _640 = _418 + _412;
    float _642 = float(_634);
    float _644 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[196].y, _636);
    float _646 = _626 * 0.15915493667125701904296875;
    float _648 = _640 + (-1.0);
    float _650 = _616 * _642;
    float _652 = fma(_638, _502, _644);
    float _654 = in.m_65.x;
    float _656 = in.m_65.y;
    float _658 = in.m_65.z;
    float _660 = _650 * (-2.0);
    float _662 = _646 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = _652 * 0.15915493667125701904296875;
    float _668 = in.m_67.x;
    float _670 = in.m_67.y;
    float _672 = in.m_67.z;
    float _674 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _676 = fma(_660, _536, _536);
    float _678 = _412 + (-0.5);
    float _680 = fma(_674, _660, _674);
    float _682 = _646 * 6.283185482025146484375;
    float _684 = cos(_682);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _676);
    float _688 = fma(_680, _502, _686);
    float _690 = _666 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = _688 * 0.15915493667125701904296875;
    float _696 = _380 * _658;
    float _698 = _378 * _656;
    float _700 = _376 * _654;
    float _702 = _666 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _710 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _712 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _718 = _708 * _710;
    float _720 = _694 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _706 * _712;
    float _726 = _716 * _714;
    float _728 = in.m_50.x;
    float _730 = in.m_50.y;
    float _732 = in.m_50.z;
    float _734 = _664 * _692;
    float _736 = _684 * _692;
    float _738 = _694 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _684 * _704;
    float _744 = _664 * _704;
    float _746 = _684 * _722;
    float _748 = _664 * _722;
    float _750 = _704 * _722;
    float _752 = _692 * _722;
    float _754 = _746 * _718;
    float _756 = fma(_740, _742, _734);
    float _758 = -_718;
    float _760 = _740 * _758;
    float _762 = _748 * _718;
    float _764 = -_736;
    float _766 = fma(_740, _744, _764);
    float _768 = -_744;
    float _770 = fma(_740, _736, _768);
    float _772 = fma(_756, _724, _754);
    float _774 = fma(_740, _734, _742);
    float _776 = fma(_750, _724, _760);
    float _778 = fma(_766, _724, _762);
    float _780 = fma(_770, _726, _772);
    float _782 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _784 = fma(_752, _726, _776);
    float _786 = fma(_774, _726, _778);
    float _788 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _790 = _780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _792 = _780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _794 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _796 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _788);
    float _798 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _792);
    float _802 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _794);
    float _804 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    float _810 = _802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _818 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _820 = _812 + _814;
    float _822 = _810 + _816;
    float _824 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _818);
    float _826 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _828 = _820 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _832 = _822 + _830;
    float _834 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _836 = _828 * _828;
    float _838 = _832 * _832;
    float _840 = _834 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _842 = _836 + _838;
    float _844 = sqrt(_842);
    bool _846 = _844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _844 + _848;
    float _852 = 0.0;
    float _854 = _780;
    float _856 = _834;
    float _858 = _820;
    float _860 = _822;
    float _862 = _836;
    float _864 = _838;
    if (_846)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _866;
    }
    float _868 = _852;
    float _870 = _868;
    if (_846)
    {
        float _872 = _850 * _868;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = _780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _878 = _874;
    if (_846)
    {
        float _880 = rsqrt(_842);
        _854 = _880;
    }
    float _882 = _854;
    if (_846)
    {
        float _884 = _874 * 0.15915493667125701904296875;
        _878 = _884;
    }
    float _886 = _878;
    float _888 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _876);
    float _890 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _892 = _728;
    if (_846)
    {
        float _894 = _886 * 6.283185482025146484375;
        float _896 = sin(_894);
        _892 = _896;
    }
    float _898 = _892;
    float _900 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _902 = _890 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _904 = _840 + _902;
    float _906 = floor(_900);
    float _908 = fma(_810, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _910 = _904;
    if (_846)
    {
        float _912 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _856 = _912;
    }
    float _914 = _856;
    float _916 = _914;
    if (_846)
    {
        float _918 = fma(_898, _914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _916 = _918;
    }
    float _920 = _916;
    float _922 = floor(_908);
    float _924 = _920;
    if (_846)
    {
        float _926 = _882 * _920;
        _924 = _926;
    }
    float _928 = _924;
    if (_846)
    {
        float _930 = fma(_828, _928, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _858 = _930;
    }
    float _932 = _858;
    if (_846)
    {
        float _934 = fma(_832, _928, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _860 = _934;
    }
    float _936 = _860;
    float _938 = -_906;
    float _940 = _900 + _938;
    float _942 = fma(_932, 6.2500002968590706586837768554688e-05, 0.5);
    float _944 = fma(_936, 6.2500002968590706586837768554688e-05, 0.5);
    float _946 = -_922;
    float _948 = _908 + _946;
    float2 _3868 = float2(_942, _944);
    float3 _952 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3868, float2(0.0), isnan(_3868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3868, float2(0.0), isnan(_3868)), level(0.0)).xyz;
    float _954 = _952.x;
    float _956 = _952.y;
    float _958 = _952.z;
    float2 _3884 = float2(_940, _948);
    float _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3884, float2(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3884, float2(0.0), isnan(_3884)), level(0.0)).x;
    float _962 = in.m_69.y;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _966 = in.m_59.w;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _974 = _972 != 0;
    float _976 = in.m_69.x;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _980 = _978 != 0;
    float _982 = 1.0 / _970;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _990 = _988 != 0;
    bool _992 = _432 > 0.5;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _998 = 1.0 / _986;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1002 = _1000 != 0;
    float _1004 = -_962;
    float _1006 = _1004 + 1.0;
    float _1008 = 1.0 / _996;
    bool _1010 = _966 > 0.5;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1012;
    bool _1016 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1018 = isnan(_410);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    int _1028 = _1010 ? as_type<int>(_1006) : as_type<int>(_962);
    int _1030 = 0;
    bool _1032 = _1010;
    bool _1034 = _1002;
    float _1036 = _962;
    float _1038 = _976;
    if (_980)
    {
        float _1040 = -_976;
        float _1042 = _1040 + 1.0;
        _1030 = as_type<int>(_1042);
    }
    int _1044 = _1030;
    if (_974)
    {
        bool _1046 = _418 > 0.5;
        _1032 = _1046;
    }
    bool _1048 = _1032;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1050;
    float _1054 = _1002 ? as_type<float>(_1028) : _962;
    float _1056 = _1014 * _998;
    if (_980)
    {
        bool _1058 = _412 > 0.5;
        _1034 = _1058;
    }
    bool _1060 = _1034;
    float _1062 = _1052 * _982;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1066 = _410 + _1064;
    if (_990)
    {
        float _1068 = _992 ? _1006 : _962;
        _1036 = _1068;
    }
    float _1070 = _1036;
    float _1072 = -_1026;
    float _1074 = _1072 + 1.0;
    bool _1076 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1078 = isnan(_410);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = fma(_1062, _1066, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1090 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1092 = isnan(_410);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = in.m_71.x;
    float _1104 = in.m_71.y;
    float _1106 = in.m_71.z;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1112 = _1086 * _1074;
    float _1114 = -_1086;
    float _1116 = _1114 + 1.0;
    bool _1118 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1120 = isnan(_410);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = -_1100;
    float _1132 = _1130 + 1.0;
    bool _1134 = _670 != 0.0;
    bool _1136 = isnan(_670);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1100 * _1116;
    float _1146 = _1110 * _1008;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1150 = _410 + _1148;
    float _1152 = _1128 * _1132;
    bool _1154 = _668 == 0.0;
    bool _1156 = !_1142;
    bool _1158 = _1154 && _1156;
    float _1160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1162 = fma(_1146, _1150, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1164 = _1088 * _1152;
    bool _1166 = _672 == 0.0;
    bool _1168 = _1166 && _1158;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1172 = _410 + _1170;
    int _1174 = as_type<int>(_1146);
    float _1176 = _1164;
    if (_974)
    {
        float _1178 = -_976;
        float _1180 = _1178 + 1.0;
        _1174 = as_type<int>(_1180);
    }
    int _1182 = _1174;
    float _1184 = 0.0;
    if (!_974)
    {
        _1184 = _976;
    }
    float _1186 = _1184;
    float _1188 = -_1128;
    float _1190 = _1188 + 1.0;
    float _1192 = fma(_1056, _1172, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1196 = _1186;
    float _1198 = _1190;
    if (_974)
    {
        float _1200 = _1048 ? as_type<float>(_1182) : _976;
        _1196 = _1200;
    }
    float _1202 = _1196;
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1164);
    float _1206 = in.m_73.x;
    float _1208 = in.m_73.y;
    float _1210 = in.m_73.z;
    float _1212 = in.m_73.w;
    if (_980)
    {
        float _1214 = _1060 ? as_type<float>(_1044) : _976;
        _1038 = _1214;
    }
    float _1216 = _1038;
    float _1218 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1220 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1222 = 0.0;
    float _1224 = _1102;
    if (_1168)
    {
        _1222 = _1102;
    }
    float _1226 = _1222;
    float _1228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1232 = _1226;
    if (_1168)
    {
        _1198 = _1106;
    }
    float _1234 = _1198;
    float _1236 = fma(_1162, _1144, _1204);
    float _1238 = _1234;
    if (_1168)
    {
        _1176 = _1226;
    }
    float _1240 = _1176;
    float _1242 = _1240;
    if (!_1168)
    {
        float _1244 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1238 = _1244;
    }
    float _1246 = _1238;
    if (!_1168)
    {
        _1232 = _1102;
    }
    float _1248 = _1232;
    float _1250 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1168)
    {
        _1224 = _1104;
    }
    float _1252 = _1224;
    float _1254 = _1252;
    if (!_1168)
    {
        float _1256 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1104);
        _1254 = _1256;
    }
    float _1258 = _1254;
    float _1260 = fma(_1192, _1112, _1236);
    if (!_1168)
    {
        float _1262 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1242 = _1262;
    }
    float _1264 = _1242;
    float _1266 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1268 = _1218 * _964;
    float _1270 = _886;
    if (_846)
    {
        float _1272 = _886 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1260);
    float _1280 = _1266 * _1160;
    float _1282 = _1220 * _1194;
    float _1284 = _1230 * _1228;
    float _1286 = _1210 * _1248;
    float _1288 = _1208 * _1106;
    float _1290 = _1206 * _1104;
    float _1292 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1294 = -_1286;
    float _1296 = fma(_1206, _1106, _1294);
    float _1298 = -_1288;
    float _1300 = fma(_1210, _1104, _1298);
    float _1302 = -_1290;
    float _1304 = fma(_1208, _1248, _1302);
    out.m_75.x = _1282;
    out.m_75.y = _1280;
    out.m_75.z = _1284;
    out.m_75.w = _1268;
    float _1306 = _1296 * _1212;
    float _1308 = _1300 * _1212;
    float _1310 = _1304 * _1212;
    float _1312 = _756 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1314 = _756 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1316 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1318 = _756 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1320 = -_740;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1292);
    float _1324 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1312);
    float _1326 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1314);
    float _1328 = -_740;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1316);
    float _1332 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1318);
    float _1334 = _770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1336 = -_740;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1250);
    float _1340 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1322);
    float _1342 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1324);
    float _1344 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1330);
    float _1346 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1338);
    float _1348 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1326);
    float _1350 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1352 = _1340 * _1208;
    float _1354 = _1346 * _1258;
    float _1356 = _1340 * _1258;
    float _1358 = _1306 * _1340;
    float _1360 = _770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1362 = fma(_1342, _1264, _1354);
    float _1364 = _1354;
    float _1366 = _1356;
    float _1368 = _1206;
    float _1370 = _1310;
    if (_846)
    {
        float _1372 = _1276 + (-1.0);
        _1364 = _1372;
    }
    float _1374 = _1364;
    float _1376 = _770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1378 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1334);
    float _1380 = _1346 * _1208;
    float _1382 = _1374;
    if (_846)
    {
        float _1384 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1384;
    }
    float _1386 = _1382;
    float _1388 = _1344 * _1208;
    float _1390 = _1306 * _1346;
    float _1392 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1360);
    float _1394 = fma(_1348, _1264, _1356);
    if (_846)
    {
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _932 + _1396;
        _1366 = _1398;
    }
    float _1400 = _1366;
    if (_846)
    {
        float _1402 = fma(_904, _1276, _1386);
        _910 = _1402;
    }
    float _1404 = _910;
    float _1406 = _1344 * _1258;
    float _1408 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1376);
    float _1410 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1412 = fma(_1342, _1206, _1380);
    float _1414 = fma(_1308, _1342, _1390);
    float _1416 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1392);
    float _1418 = fma(_1348, _1206, _1352);
    float _1420 = fma(_1350, _1206, _1388);
    if (_846)
    {
        float _1422 = _1400 * _1400;
        _862 = _1422;
    }
    float _1424 = _862;
    if (_846)
    {
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1428 = _936 + _1426;
        _1368 = _1428;
    }
    float _1430 = _1368;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1434 = _1404 + _1432;
    float _1436 = _1306 * _1344;
    float _1438 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1408);
    if (_846)
    {
        float _1440 = _1430 * _1430;
        _864 = _1440;
    }
    float _1442 = _864;
    float _1444 = fma(_1434, _1434, _1424);
    float _1446 = fma(_1308, _1348, _1358);
    float _1448 = fma(_1308, _1350, _1436);
    float _1450 = _1444 + _1442;
    float _1452 = fma(_1410, _1210, _1412);
    float _1454 = fma(_1416, _1210, _1418);
    float _1456 = fma(_1438, _1210, _1420);
    float _1458 = sqrt(_1450);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1462 = fma(_1350, _1264, _1406);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1468 = fma(_1410, _1246, _1362);
    float _1470 = fma(_1310, _1410, _1414);
    float _1472 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1480 = fma(_1310, _1416, _1446);
    float _1482 = fma(_1310, _1438, _1448);
    float _1484 = fma(_1416, _1246, _1394);
    float _1486 = fma(_1438, _1246, _1462);
    out.m_77.x = _1472;
    out.m_77.y = _1474;
    out.m_77.z = _1476;
    out.m_77.w = _1478;
    bool _1488 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1458);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    out.m_79.x = _1452;
    out.m_79.y = _1454;
    out.m_79.z = _1456;
    out.m_81.x = _1470;
    out.m_81.y = _1480;
    out.m_81.z = _1482;
    out.m_83.x = _1468;
    out.m_83.y = _1484;
    out.m_83.z = _1486;
    if (!_1496)
    {
        _1370 = 1.0;
    }
    float _1498 = _1370;
    out.m_85.x = _954;
    out.m_85.y = _956;
    out.m_85.z = _958;
    bool _1500 = !_1496;
    float _1502 = _1498;
    float _1504 = _956;
    float _1506 = _958;
    if (!_1500)
    {
        bool _1508 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1510 = isnan(_1458);
        bool _1512 = _1508 || _1510;
        bool _1514 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1516 = _1512 || _1514;
        if (!_1516)
        {
            float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1520 = _1458 + _1518;
            float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1524 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1522;
            float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1528 = _1526 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1530 = 1.0 / _1524;
            float _1532 = _1520 * _1530;
            float _1534 = fma(_1532, _1528, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1502 = _1534;
            _1504 = _1530;
            _1536 = true;
        }
        else
        {
            bool _1538 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1540 = isnan(_1458);
            bool _1542 = _1538 || _1540;
            bool _1544 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1546 = _1542 || _1544;
            if (!_1546)
            {
                float _1548 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1550 = _1458 + _1548;
                float _1552 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1554 = _1552 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1558 = _1556 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1560 = 1.0 / _1554;
                float _1562 = _1550 * _1560;
                float _1564 = fma(_1562, _1558, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1502 = _1564;
                _1504 = _1560;
                _1536 = true;
            }
            else
            {
                _1502 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1536 = false;
    float _1566 = _1502;
    float _1568 = _1504;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1572 = _1404 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1576 = _932 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1580 = _936 + _1578;
    float _1582 = fma(_1572, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1584 = fma(_1576, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1586 = fma(_1580, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1588 = -_840;
    float _1590 = _1588 + _1582;
    float _1592 = -_812;
    float _1594 = _1592 + _1584;
    float _1596 = -_810;
    float _1598 = _1596 + _1586;
    float _1600 = _1590 * _1590;
    float _1602 = fma(_1594, _1594, _1600);
    float _1604 = fma(_1598, _1598, _1602);
    float _1606 = sqrt(_1604);
    bool _1608 = _1606 > 0.0;
    float _1610 = _1606;
    float _1612 = _1568;
    float _1614 = _1590;
    if (!_1608)
    {
        _1610 = _1584;
    }
    float _1616 = _1610;
    float _1618 = _1616;
    if (!_1608)
    {
        _1612 = _1582;
    }
    float _1620 = _1612;
    float _1622 = _1620;
    if (!_1608)
    {
        _1506 = _1586;
    }
    float _1624 = _1506;
    bool _1626 = !_1608;
    float _1628 = _1624;
    float _1630 = _1624;
    if (!_1626)
    {
        float _1632 = _194 * _194;
        float _1634 = fma(_192, _192, _1632);
        float _1636 = fma(_196, _196, _1634);
        float _1638 = rsqrt(_1604);
        float _1640 = sqrt(_1636);
        float _1642 = _1594 * _1638;
        float _1644 = _1590 * _1638;
        float _1646 = _1598 * _1638;
        bool _1648 = _1640 > 0.0;
        float _1650 = _1638;
        float _1652 = _1640;
        _1614 = _1644;
        if (!_1648)
        {
            _1650 = _1584;
        }
        float _1654 = _1650;
        _1618 = _1654;
        if (!_1648)
        {
            _1652 = _1582;
        }
        float _1656 = _1652;
        _1622 = _1656;
        if (!_1648)
        {
            _1628 = _1586;
        }
        float _1658 = _1628;
        bool _1660 = !_1648;
        _1630 = _1658;
        if (!_1660)
        {
            float _1662 = rsqrt(_1636);
            float _1664 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1666 = _194 * _1662;
            float _1668 = _192 * _1662;
            float _1670 = _196 * _1662;
            float _1672 = _1644 * _1666;
            float _1674 = fma(_1642, _1668, _1672);
            float _1676 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1678 = fma(_1646, _1670, _1674);
            float _1680 = _1678 * _1676;
            float _1682 = fma(_192, _1680, _1584);
            float _1684 = fma(_194, _1680, _1582);
            float _1686 = fma(_196, _1680, _1586);
            _1622 = _1684;
            _1618 = _1682;
            _1630 = _1686;
        }
    }
    float _1688 = _1622;
    float _1690 = _1618;
    float _1692 = _1630;
    float _1694 = _1614;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1688 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1692 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = fma(_1702, _1702, _1708);
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = fma(_1706, _1706, _1710);
    float _1716 = rsqrt(_1714);
    float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1702 * _1718;
    float _1722 = _1706 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 + _1726;
    float _1730 = sqrt(_1728);
    bool _1732 = _1730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = _1730 + _1734;
    float _1738 = _1472;
    float _1740 = _1728;
    float _1742 = _1736;
    float _1744 = _1694;
    float _1746 = _1698;
    float _1748 = _1720;
    if (_1732)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1738 = _1750;
    }
    float _1752 = _1738;
    if (_1732)
    {
        float _1754 = rsqrt(_1728);
        _1740 = _1754;
    }
    float _1756 = _1740;
    float _1758 = _1756;
    if (_1732)
    {
        float _1760 = _1736 * _1752;
        _1742 = _1760;
    }
    float _1762 = _1742;
    if (_1732)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1744 = _1764;
    }
    float _1766 = _1744;
    float _1768 = _1752;
    float _1770 = _1766;
    if (_1732)
    {
        float _1772 = _1766 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1768 = _1774;
    }
    float _1776 = _1768;
    float _1778 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1780 = precise::max(0.0, _1778);
    float _1782 = _1706;
    float _1784 = _1780;
    if (_1732)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        _1782 = _1788;
    }
    float _1790 = _1782;
    float _1792 = -_1718;
    float _1794 = -_1780;
    float _1796 = fma(_1698, _1792, _1794);
    if (_1732)
    {
        float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1798;
    }
    float _1800 = _1746;
    float _1802 = _1800;
    float _1804 = _1776;
    if (_1732)
    {
        float _1806 = _1776 + (-1.0);
        _1784 = _1806;
    }
    float _1808 = _1784;
    if (_1732)
    {
        float _1810 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1810;
    }
    float _1812 = _1770;
    float _1814 = sqrt(_1714);
    float _1816 = _1790;
    if (_1732)
    {
        float _1818 = fma(_1790, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1816 = _1818;
    }
    float _1820 = _1816;
    float _1822 = _1820;
    if (!_1732)
    {
        _1802 = _1722;
    }
    float _1824 = _1802;
    float _1826 = _1824;
    if (_1732)
    {
        float _1828 = _1756 * _1820;
        _200 = _1828;
    }
    float _1830 = _200;
    if (!_1732)
    {
        _1822 = _1796;
    }
    float _1832 = _1822;
    float _1834 = _1832;
    if (_1732)
    {
        float _1836 = fma(_1796, _1776, _1812);
        _1834 = _1836;
    }
    float _1838 = _1834;
    if (!_1732)
    {
        _1758 = _1724;
    }
    float _1840 = _1758;
    float _1842 = _1840;
    if (_1732)
    {
        float _1844 = _1720 * _1830;
        _1748 = _1844;
    }
    float _1846 = _1748;
    if (_1732)
    {
        float _1848 = _1722 * _1830;
        _1826 = _1848;
    }
    float _1850 = _1826;
    if (!_1732)
    {
        _1804 = _1726;
    }
    float _1852 = _1804;
    float _1854 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1856 = _1852;
    if (_1732)
    {
        float _1858 = _1846 * _1846;
        _1842 = _1858;
    }
    float _1860 = _1842;
    if (_1732)
    {
        float _1862 = _1850 * _1850;
        _1856 = _1862;
    }
    float _1864 = _1856;
    float _1866 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1868 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1854);
    float _1870 = fma(_1838, _1838, _1860);
    float _1872 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1866);
    float _1874 = _1870 + _1864;
    float _1876 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1880 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1878);
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1886 = rsqrt(_1874);
    float _1888 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1890 = -_1882;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1896 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1888);
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1894);
    float _1902 = abs(_1892);
    float _1904 = log2(_1902);
    float _1906 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1910 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1912 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1872);
    float _1914 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = -_1908;
    float _1918 = fma(_1916, _1712, 1.0);
    float _1920 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1922 = _1886 * _1846;
    float _1924 = _1886 * _1838;
    float _1926 = _1886 * _1850;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1920);
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1932 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1934 = log2(_1918);
    float _1936 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1928);
    float _1938 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1940 = -_1930;
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1940);
    float _1944 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    float _1948 = -_1926;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1942);
    float _1952 = exp2(_1938);
    float _1954 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma(_1950, 0.5, 0.5);
    float _1962 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1954);
    float _1964 = _1924 + 1.0;
    float _1966 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1956);
    float _1968 = 1.0 / _1946;
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1962);
    float _1974 = _1934 * 0.693147182464599609375;
    float _1976 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1978 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = sqrt(_1958);
    float _1982 = -_1924;
    float _1984 = fma(_1952, _1964, _1982);
    float _1986 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1988 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1966);
    float _1990 = fma(_1960, _1976, 1.570728778839111328125);
    float _1992 = fma(_1984, 0.5, 0.5);
    float _1994 = _1986 * _1968;
    float _1996 = _1988 * _1968;
    float _1998 = fma(_1994, 0.5, 0.5);
    float _2000 = fma(_1996, -0.5, 0.5);
    float _2002 = _1980 * 0.636619746685028076171875;
    float _2004 = -_1990;
    float _2006 = fma(_2002, _2004, 1.0);
    float3 _5660 = float3(_1998, _2000, _1978);
    float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5660, float3(0.0), isnan(_5660)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5660, float3(0.0), isnan(_5660)), level(0.0)).x;
    float3 _5671 = float3(_1998, _2000, _1978);
    float4 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).xyzw;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _2011.w;
    float2 _5687 = float2(_2006, _1992);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5687, float2(0.0), isnan(_5687)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5687, float2(0.0), isnan(_5687)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _840 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = -_960;
    float _2033 = _2031 + 1.0;
    bool _2035 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2037 = isnan(_1814);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2047 = _840 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2049 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2045);
    float _2051 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2047);
    float _2053 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2055 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2051);
    float _2057 = 1.0 / _2053;
    float _2059 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2061 = _2059 + _2053;
    float _2063 = _2061 * _2057;
    float _2065 = _2063 * 0.5;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2069 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2067);
    float _2071 = 1.0 / _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2075 = _2071 * _2073;
    float _2077 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2079 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2081 = abs(_2075);
    float _2083 = log2(_2081);
    float _2085 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2077);
    float _2087 = _1946 * 0.5;
    float _2089 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2085);
    float _2091 = exp2(_2079);
    bool _2093 = _2075 <= 8000.0;
    bool _2095 = isnan(_2075);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan(8000.0);
    bool _2101 = _2097 || _2099;
    float _2103 = float(_2101);
    float _2105 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2107 = _2105 + _1946;
    out.gl_Position.x = _1986;
    out.gl_Position.y = _1988;
    out.gl_Position.z = _2105;
    out.gl_Position.w = _1946;
    float _2109 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2111 = _2107 * 0.5;
    float _2113 = exp2(_2109);
    float _2115 = _2105;
    float _2117 = _1988;
    float _2119 = _1946;
    float _2121 = _1986;
    if (!_2043)
    {
        _2115 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2123 = _2115;
    float _2125 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = -_2091;
    float _2131 = _2129 + 1.0;
    float _2133 = fma(_1988, -0.5, _2087);
    float _2135 = _2133;
    float _2137 = _2123;
    float _2139 = _2123;
    if (!_2043)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2141 = _2117;
    float _2143 = fma(_2127, -2.0, 3.0);
    float _2145 = _2127 * _2127;
    float _2147 = in.m_87.x;
    float _2149 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2151 = _2145 * _2143;
    float _2153 = -_2151;
    float _2155 = _2153 + 1.0;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2151);
    float _2159 = _2103 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2163 = _2033 * _2161;
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = -_2165;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2171 = _2169 * _2147;
    float _2173 = _1986 + _1946;
    float _2175 = _2141;
    float _2177 = _2141;
    if (!_2043)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2179 = _2119;
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = _2173 * 0.5;
    float _2185 = _2183;
    float _2187 = _2179;
    float _2189 = _2179;
    if (!_2043)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2191 = _2121;
    out.m_89.x = _2181;
    out.m_91.x = _2183;
    out.m_91.y = _2133;
    out.m_91.z = _2111;
    out.m_91.w = _1946;
    float _2193 = _2191;
    float _2195 = _2191;
    if (!_2043)
    {
        _2135 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2197 = _2135;
    float _2199 = _2197;
    float _2201 = _2197;
    if (!_2043)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2203 = _2185;
    float _2205 = _2149 * _2008;
    float _2207 = -_2149;
    float _2209 = _2207 + 1.0;
    float _2211 = _2019 * _2205;
    float _2213 = _2027 * _2205;
    float _2215 = _2019 * _2209;
    float _2217 = fma(_2023, _2211, _2013);
    float _2219 = fma(_2025, _2211, _2015);
    float _2221 = fma(_2019, _2213, _2017);
    out.m_93.x = _2217;
    out.m_93.y = _2219;
    out.m_93.z = _2221;
    out.m_93.w = _2215;
    bool _2223 = !_2043;
    float _2225 = _2203;
    float _2227 = _2203;
    if (!_2223)
    {
        bool _2229 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2231 = isnan(_1814);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2237 = _2233 || _2235;
        if (!_2237)
        {
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2241 = _1814 + _2239;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2245 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2243;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2251 = 1.0 / _2245;
            float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2269 = _2241 * _2251;
            float _2271 = precise::clamp(_2269, 0.0, 1.0);
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2277 = fma(_2271, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2279 = fma(_2271, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2281 = fma(_2271, _2255, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2271, _2259, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2285 = fma(_2271, _2263, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2287 = fma(_2271, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2227 = _2281;
            _2177 = _2285;
            _2201 = _2277;
            _2139 = _2283;
            _2189 = _2279;
            _2195 = _2287;
            _2289 = true;
        }
        else
        {
            bool _2291 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2293 = isnan(_1814);
            bool _2295 = _2291 || _2293;
            bool _2297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2299 = _2295 || _2297;
            if (!_2299)
            {
                _2199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2301 = _2199;
            _2201 = _2301;
            if (!_2299)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2303 = _2225;
            _2227 = _2303;
            if (!_2299)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2305 = _2187;
            _2189 = _2305;
            if (!_2299)
            {
                _2137 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2307 = _2137;
            _2139 = _2307;
            if (!_2299)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2309 = _2175;
            _2177 = _2309;
            if (!_2299)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2311 = _2193;
            bool _2313 = !_2299;
            _2195 = _2311;
            if (!_2313)
            {
                bool _2315 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2317 = isnan(_1814);
                bool _2319 = _2315 || _2317;
                bool _2321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2323 = _2319 || _2321;
                if (!_2323)
                {
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2327 = _1814 + _2325;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2329;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2337 = 1.0 / _2331;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2355 = _2327 * _2337;
                    float _2357 = precise::clamp(_2355, 0.0, 1.0);
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2363 = fma(_2357, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2365 = fma(_2357, _2361, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2367 = fma(_2357, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2357, _2345, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2371 = fma(_2357, _2349, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2373 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2227 = _2367;
                    _2177 = _2371;
                    _2201 = _2363;
                    _2139 = _2369;
                    _2189 = _2365;
                    _2195 = _2373;
                    _2289 = true;
                }
                else
                {
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2139 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2289 = false;
    float _2375 = _2227;
    float _2377 = _2177;
    float _2379 = _2201;
    float _2381 = _2139;
    float _2383 = _2189;
    float _2385 = _2195;
    float _2387 = fma(_1484, -0.5, 0.5);
    float _2389 = precise::clamp(_2387, 0.0, 1.0);
    float _2391 = -_2375;
    float _2393 = _2391 + _2377;
    float _2395 = -_2379;
    float _2397 = _2395 + _2381;
    float _2399 = -_2383;
    float _2401 = _2399 + _2385;
    bool _2403 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2405 = fma(_2389, _2393, _2375);
    float _2407 = fma(_2389, _2397, _2379);
    float _2409 = fma(_2389, _2401, _2383);
    float _2411 = _2405 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2413 = fma(_2407, 0.298911988735198974609375, _2411);
    float _2415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2409, 0.114477999508380889892578125, _2413);
    out.m_53.x = _2415;
    float _2419 = -_2417;
    float _2421 = _2407 + _2419;
    float _2423 = -_2417;
    float _2425 = _2405 + _2423;
    float _2427 = -_2417;
    float _2429 = _2409 + _2427;
    float _2431 = fma(_2421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    float _2433 = fma(_2425, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    float _2435 = fma(_2429, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    out.m_97.x = _2431;
    out.m_97.y = _2433;
    out.m_97.z = _2435;
    if (!_2403)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2437 = -_1688;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2441 = -_1690;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2445 = -_1692;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2449 = _2439 * _2439;
    float _2451 = fma(_2443, _2443, _2449);
    float _2453 = fma(_2447, _2447, _2451);
    float _2455 = sqrt(_2453);
    float _2457 = rsqrt(_2453);
    float _2459 = -_2455;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2463 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = _2443 * _2457;
    float _2469 = _2439 * _2457;
    float _2471 = abs(_2465);
    float _2473 = log2(_2471);
    float _2475 = _2447 * _2457;
    float _2477 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2479 = _1484 * _2469;
    float _2481 = -_2469;
    float _2483 = -_2477;
    float _2485 = fma(_2481, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2483);
    float _2487 = fma(_1468, _2467, _2479);
    float _2489 = -_2475;
    float _2491 = fma(_2489, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2485);
    float _2493 = fma(_1486, _2475, _2487);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2499 = _2491 + _2497;
    float _2501 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2503 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = exp2(_2501);
    float _2509 = _2507 * _2505;
    float _2511 = _2495 * _2509;
    float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2517 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2513;
    out.m_95.y = _2515;
    out.m_95.z = _2517;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2289 = false;
    bool _1536 = false;
    bool _402 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_50.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2574 = as_type<float>(_132);
        out.gl_Position.z = _2574;
    }
    if (!_120)
    {
        return out;
    }
    float _136 = in.m_55.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_170);
        out.gl_Position.z = _2643;
    }
    if (_164)
    {
        return out;
    }
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _200 = _194;
    float _218;
    if (!_198)
    {
        float _202 = in.m_59.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_116);
        float _224 = 1.0 / _222;
        float _226 = _150 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _236 = 1.0 / _232;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _242 = _234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _228 + _250;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _256 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _258 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _260 = isnan(_228);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _246;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _228 + _272;
    out.m_61.x = _248;
    out.m_61.y = _242;
    out.m_61.z = _256;
    out.m_61.w = _254;
    float _276 = -_268;
    float _278 = _276 + 1.0;
    float _280 = _252 * _236;
    bool _282 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_228);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    bool _294 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_228);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _308 = _274 * _270;
    float _310 = _304 * _278;
    float _312 = -_304;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = _292 * _314;
    float _330 = fma(_318, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _332 = fma(_322, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = fma(_326, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = _330 * _328;
    float _342 = _332 * _328;
    float _344 = _334 * _328;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _340);
    float _360 = fma(_348, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_352, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _342);
    float _366 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _344);
    float _370 = fma(_360, _310, _358);
    float _372 = fma(_362, _310, _364);
    float _374 = fma(_366, _310, _368);
    float _376 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].x, _370);
    float _378 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].y, _372);
    float _380 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].z, _374);
    bool _382 = !_306;
    float _400;
    if (!_382)
    {
        float _384 = in.m_59.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_116);
        float _406 = 1.0 / _404;
        float _408 = _150 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_59.z;
    float _414 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _416 = log2(_414);
    float _418 = in.m_59.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _430 = _428 != 0;
    float _432 = in.m_59.y;
    bool _434 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _436 = isnan(1.0);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _442 = _438 || _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _446 = 1.0 + _444;
    bool _448 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _456 = _452 || _454;
    float _458 = _416 * _150;
    float _460 = 1.0 / _446;
    float _462 = _412 * 2.0;
    float _464 = _418 * 2.0;
    float _466 = exp2(_458);
    float _468 = _432 * 2.0;
    float _470 = floor(_462);
    float _472 = _418 + _432;
    float _474 = _472 + (-1.0);
    float _476 = floor(_464);
    float _478 = -_466;
    float _480 = _478 + 1.0;
    float _482 = _456 ? _480 : 0.0;
    bool _484 = _470 > 0.0;
    float _486 = floor(_468);
    bool _488 = _470 >= 0.0;
    bool _490 = isnan(_470);
    bool _492 = _488 || _490;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    float _498 = _432 + _412;
    if (_442)
    {
        float _500 = _482 * _460;
        _154 = _500;
    }
    float _502 = _154;
    bool _504 = !_430;
    int _506 = _504 ? 0 : 1;
    float _508 = _498 + (-1.0);
    int _510 = _496 ? 0 : 1;
    bool _512 = _476 > 0.0;
    float _514 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _516 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _518 = !_422;
    int _520 = _518 ? 0 : 1;
    bool _522 = _476 >= 0.0;
    bool _524 = isnan(_476);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = in.m_63.x;
    float _534 = in.m_63.y;
    float _536 = in.m_63.z;
    int _538 = ~_510;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    int _544 = _542;
    if (!_484)
    {
        int _546 = ~_510;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    int _552 = abs(_520);
    float _554 = float(_550);
    float _556 = float(_552);
    int _558 = _530 ? 0 : 1;
    bool _560 = !_426;
    int _562 = _560 ? 0 : 1;
    float _564 = _556 * _554;
    int _566 = ~_558;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = _418 + (-0.5);
    int _574 = abs(_562);
    int _576 = _570;
    if (!_512)
    {
        int _578 = ~_558;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 * (-2.0);
    bool _586 = _486 > 0.0;
    float _588 = float(_574);
    float _590 = fma(_584, _532, _532);
    float _592 = float(_582);
    float _594 = fma(_516, _584, _516);
    bool _596 = _486 >= 0.0;
    bool _598 = isnan(_486);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].x, _590);
    int _608 = abs(_506);
    float _610 = _588 * _592;
    int _612 = _604 ? 0 : 1;
    float _614 = _432 + (-0.5);
    float _616 = float(_608);
    float _618 = _610 * (-2.0);
    int _620 = ~_612;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    float _626 = fma(_594, _502, _606);
    int _628 = _624;
    if (!_586)
    {
        int _630 = ~_612;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = fma(_618, _534, _534);
    float _638 = fma(_514, _618, _514);
    float _640 = _418 + _412;
    float _642 = float(_634);
    float _644 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[196].y, _636);
    float _646 = _626 * 0.15915493667125701904296875;
    float _648 = _640 + (-1.0);
    float _650 = _616 * _642;
    float _652 = fma(_638, _502, _644);
    float _654 = in.m_65.x;
    float _656 = in.m_65.y;
    float _658 = in.m_65.z;
    float _660 = _650 * (-2.0);
    float _662 = _646 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = _652 * 0.15915493667125701904296875;
    float _668 = in.m_67.x;
    float _670 = in.m_67.y;
    float _672 = in.m_67.z;
    float _674 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _676 = fma(_660, _536, _536);
    float _678 = _412 + (-0.5);
    float _680 = fma(_674, _660, _674);
    float _682 = _646 * 6.283185482025146484375;
    float _684 = cos(_682);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _676);
    float _688 = fma(_680, _502, _686);
    float _690 = _666 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = _688 * 0.15915493667125701904296875;
    float _696 = _380 * _658;
    float _698 = _378 * _656;
    float _700 = _376 * _654;
    float _702 = _666 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _710 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _712 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _718 = _708 * _710;
    float _720 = _694 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _706 * _712;
    float _726 = _716 * _714;
    float _728 = in.m_50.x;
    float _730 = in.m_50.y;
    float _732 = in.m_50.z;
    float _734 = _664 * _692;
    float _736 = _684 * _692;
    float _738 = _694 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _684 * _704;
    float _744 = _664 * _704;
    float _746 = _684 * _722;
    float _748 = _664 * _722;
    float _750 = _704 * _722;
    float _752 = _692 * _722;
    float _754 = _746 * _718;
    float _756 = fma(_740, _742, _734);
    float _758 = -_718;
    float _760 = _740 * _758;
    float _762 = _748 * _718;
    float _764 = -_736;
    float _766 = fma(_740, _744, _764);
    float _768 = -_744;
    float _770 = fma(_740, _736, _768);
    float _772 = fma(_756, _724, _754);
    float _774 = fma(_740, _734, _742);
    float _776 = fma(_750, _724, _760);
    float _778 = fma(_766, _724, _762);
    float _780 = fma(_770, _726, _772);
    float _782 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _784 = fma(_752, _726, _776);
    float _786 = fma(_774, _726, _778);
    float _788 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _790 = _780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _792 = _780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _794 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _796 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _788);
    float _798 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _792);
    float _802 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _794);
    float _804 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    float _810 = _802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _818 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _820 = _812 + _814;
    float _822 = _810 + _816;
    float _824 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _818);
    float _826 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _828 = _820 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _832 = _822 + _830;
    float _834 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _836 = _828 * _828;
    float _838 = _832 * _832;
    float _840 = _834 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _842 = _836 + _838;
    float _844 = sqrt(_842);
    bool _846 = _844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _844 + _848;
    float _852 = 0.0;
    float _854 = _780;
    float _856 = _834;
    float _858 = _820;
    float _860 = _822;
    float _862 = _836;
    float _864 = _838;
    if (_846)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _866;
    }
    float _868 = _852;
    float _870 = _868;
    if (_846)
    {
        float _872 = _850 * _868;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = _780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _878 = _874;
    if (_846)
    {
        float _880 = rsqrt(_842);
        _854 = _880;
    }
    float _882 = _854;
    if (_846)
    {
        float _884 = _874 * 0.15915493667125701904296875;
        _878 = _884;
    }
    float _886 = _878;
    float _888 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _876);
    float _890 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _892 = _728;
    if (_846)
    {
        float _894 = _886 * 6.283185482025146484375;
        float _896 = sin(_894);
        _892 = _896;
    }
    float _898 = _892;
    float _900 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _902 = _890 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _904 = _840 + _902;
    float _906 = floor(_900);
    float _908 = fma(_810, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _910 = _904;
    if (_846)
    {
        float _912 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _856 = _912;
    }
    float _914 = _856;
    float _916 = _914;
    if (_846)
    {
        float _918 = fma(_898, _914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _916 = _918;
    }
    float _920 = _916;
    float _922 = floor(_908);
    float _924 = _920;
    if (_846)
    {
        float _926 = _882 * _920;
        _924 = _926;
    }
    float _928 = _924;
    if (_846)
    {
        float _930 = fma(_828, _928, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _858 = _930;
    }
    float _932 = _858;
    if (_846)
    {
        float _934 = fma(_832, _928, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _860 = _934;
    }
    float _936 = _860;
    float _938 = -_906;
    float _940 = _900 + _938;
    float _942 = fma(_932, 6.2500002968590706586837768554688e-05, 0.5);
    float _944 = fma(_936, 6.2500002968590706586837768554688e-05, 0.5);
    float _946 = -_922;
    float _948 = _908 + _946;
    float2 _3868 = float2(_942, _944);
    float3 _952 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3868, float2(0.0), isnan(_3868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3868, float2(0.0), isnan(_3868)), level(0.0)).xyz;
    float _954 = _952.x;
    float _956 = _952.y;
    float _958 = _952.z;
    float2 _3884 = float2(_940, _948);
    float _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3884, float2(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3884, float2(0.0), isnan(_3884)), level(0.0)).x;
    float _962 = in.m_69.y;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _966 = in.m_59.w;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _974 = _972 != 0;
    float _976 = in.m_69.x;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _980 = _978 != 0;
    float _982 = 1.0 / _970;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _990 = _988 != 0;
    bool _992 = _432 > 0.5;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _998 = 1.0 / _986;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1002 = _1000 != 0;
    float _1004 = -_962;
    float _1006 = _1004 + 1.0;
    float _1008 = 1.0 / _996;
    bool _1010 = _966 > 0.5;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1012;
    bool _1016 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1018 = isnan(_410);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    int _1028 = _1010 ? as_type<int>(_1006) : as_type<int>(_962);
    int _1030 = 0;
    bool _1032 = _1010;
    bool _1034 = _1002;
    float _1036 = _962;
    float _1038 = _976;
    if (_980)
    {
        float _1040 = -_976;
        float _1042 = _1040 + 1.0;
        _1030 = as_type<int>(_1042);
    }
    int _1044 = _1030;
    if (_974)
    {
        bool _1046 = _418 > 0.5;
        _1032 = _1046;
    }
    bool _1048 = _1032;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1050;
    float _1054 = _1002 ? as_type<float>(_1028) : _962;
    float _1056 = _1014 * _998;
    if (_980)
    {
        bool _1058 = _412 > 0.5;
        _1034 = _1058;
    }
    bool _1060 = _1034;
    float _1062 = _1052 * _982;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1066 = _410 + _1064;
    if (_990)
    {
        float _1068 = _992 ? _1006 : _962;
        _1036 = _1068;
    }
    float _1070 = _1036;
    float _1072 = -_1026;
    float _1074 = _1072 + 1.0;
    bool _1076 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1078 = isnan(_410);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = fma(_1062, _1066, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1090 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1092 = isnan(_410);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = in.m_71.x;
    float _1104 = in.m_71.y;
    float _1106 = in.m_71.z;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1112 = _1086 * _1074;
    float _1114 = -_1086;
    float _1116 = _1114 + 1.0;
    bool _1118 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1120 = isnan(_410);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = -_1100;
    float _1132 = _1130 + 1.0;
    bool _1134 = _670 != 0.0;
    bool _1136 = isnan(_670);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1100 * _1116;
    float _1146 = _1110 * _1008;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1150 = _410 + _1148;
    float _1152 = _1128 * _1132;
    bool _1154 = _668 == 0.0;
    bool _1156 = !_1142;
    bool _1158 = _1154 && _1156;
    float _1160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1162 = fma(_1146, _1150, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1164 = _1088 * _1152;
    bool _1166 = _672 == 0.0;
    bool _1168 = _1166 && _1158;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1172 = _410 + _1170;
    int _1174 = as_type<int>(_1146);
    float _1176 = _1164;
    if (_974)
    {
        float _1178 = -_976;
        float _1180 = _1178 + 1.0;
        _1174 = as_type<int>(_1180);
    }
    int _1182 = _1174;
    float _1184 = 0.0;
    if (!_974)
    {
        _1184 = _976;
    }
    float _1186 = _1184;
    float _1188 = -_1128;
    float _1190 = _1188 + 1.0;
    float _1192 = fma(_1056, _1172, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1196 = _1186;
    float _1198 = _1190;
    if (_974)
    {
        float _1200 = _1048 ? as_type<float>(_1182) : _976;
        _1196 = _1200;
    }
    float _1202 = _1196;
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1164);
    float _1206 = in.m_73.x;
    float _1208 = in.m_73.y;
    float _1210 = in.m_73.z;
    float _1212 = in.m_73.w;
    if (_980)
    {
        float _1214 = _1060 ? as_type<float>(_1044) : _976;
        _1038 = _1214;
    }
    float _1216 = _1038;
    float _1218 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1220 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1222 = 0.0;
    float _1224 = _1102;
    if (_1168)
    {
        _1222 = _1102;
    }
    float _1226 = _1222;
    float _1228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1232 = _1226;
    if (_1168)
    {
        _1198 = _1106;
    }
    float _1234 = _1198;
    float _1236 = fma(_1162, _1144, _1204);
    float _1238 = _1234;
    if (_1168)
    {
        _1176 = _1226;
    }
    float _1240 = _1176;
    float _1242 = _1240;
    if (!_1168)
    {
        float _1244 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1238 = _1244;
    }
    float _1246 = _1238;
    if (!_1168)
    {
        _1232 = _1102;
    }
    float _1248 = _1232;
    float _1250 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1168)
    {
        _1224 = _1104;
    }
    float _1252 = _1224;
    float _1254 = _1252;
    if (!_1168)
    {
        float _1256 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1104);
        _1254 = _1256;
    }
    float _1258 = _1254;
    float _1260 = fma(_1192, _1112, _1236);
    if (!_1168)
    {
        float _1262 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1242 = _1262;
    }
    float _1264 = _1242;
    float _1266 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1268 = _1218 * _964;
    float _1270 = _886;
    if (_846)
    {
        float _1272 = _886 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1260);
    float _1280 = _1266 * _1160;
    float _1282 = _1220 * _1194;
    float _1284 = _1230 * _1228;
    float _1286 = _1210 * _1248;
    float _1288 = _1208 * _1106;
    float _1290 = _1206 * _1104;
    float _1292 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1294 = -_1286;
    float _1296 = fma(_1206, _1106, _1294);
    float _1298 = -_1288;
    float _1300 = fma(_1210, _1104, _1298);
    float _1302 = -_1290;
    float _1304 = fma(_1208, _1248, _1302);
    out.m_75.x = _1282;
    out.m_75.y = _1280;
    out.m_75.z = _1284;
    out.m_75.w = _1268;
    float _1306 = _1296 * _1212;
    float _1308 = _1300 * _1212;
    float _1310 = _1304 * _1212;
    float _1312 = _756 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1314 = _756 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1316 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1318 = _756 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1320 = -_740;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1292);
    float _1324 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1312);
    float _1326 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1314);
    float _1328 = -_740;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1316);
    float _1332 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1318);
    float _1334 = _770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1336 = -_740;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1250);
    float _1340 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1322);
    float _1342 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1324);
    float _1344 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1330);
    float _1346 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1338);
    float _1348 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1326);
    float _1350 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1352 = _1340 * _1208;
    float _1354 = _1346 * _1258;
    float _1356 = _1340 * _1258;
    float _1358 = _1306 * _1340;
    float _1360 = _770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1362 = fma(_1342, _1264, _1354);
    float _1364 = _1354;
    float _1366 = _1356;
    float _1368 = _1206;
    float _1370 = _1310;
    if (_846)
    {
        float _1372 = _1276 + (-1.0);
        _1364 = _1372;
    }
    float _1374 = _1364;
    float _1376 = _770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1378 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1334);
    float _1380 = _1346 * _1208;
    float _1382 = _1374;
    if (_846)
    {
        float _1384 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1384;
    }
    float _1386 = _1382;
    float _1388 = _1344 * _1208;
    float _1390 = _1306 * _1346;
    float _1392 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1360);
    float _1394 = fma(_1348, _1264, _1356);
    if (_846)
    {
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _932 + _1396;
        _1366 = _1398;
    }
    float _1400 = _1366;
    if (_846)
    {
        float _1402 = fma(_904, _1276, _1386);
        _910 = _1402;
    }
    float _1404 = _910;
    float _1406 = _1344 * _1258;
    float _1408 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1376);
    float _1410 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1412 = fma(_1342, _1206, _1380);
    float _1414 = fma(_1308, _1342, _1390);
    float _1416 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1392);
    float _1418 = fma(_1348, _1206, _1352);
    float _1420 = fma(_1350, _1206, _1388);
    if (_846)
    {
        float _1422 = _1400 * _1400;
        _862 = _1422;
    }
    float _1424 = _862;
    if (_846)
    {
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1428 = _936 + _1426;
        _1368 = _1428;
    }
    float _1430 = _1368;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1434 = _1404 + _1432;
    float _1436 = _1306 * _1344;
    float _1438 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1408);
    if (_846)
    {
        float _1440 = _1430 * _1430;
        _864 = _1440;
    }
    float _1442 = _864;
    float _1444 = fma(_1434, _1434, _1424);
    float _1446 = fma(_1308, _1348, _1358);
    float _1448 = fma(_1308, _1350, _1436);
    float _1450 = _1444 + _1442;
    float _1452 = fma(_1410, _1210, _1412);
    float _1454 = fma(_1416, _1210, _1418);
    float _1456 = fma(_1438, _1210, _1420);
    float _1458 = sqrt(_1450);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1462 = fma(_1350, _1264, _1406);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1468 = fma(_1410, _1246, _1362);
    float _1470 = fma(_1310, _1410, _1414);
    float _1472 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1480 = fma(_1310, _1416, _1446);
    float _1482 = fma(_1310, _1438, _1448);
    float _1484 = fma(_1416, _1246, _1394);
    float _1486 = fma(_1438, _1246, _1462);
    out.m_77.x = _1472;
    out.m_77.y = _1474;
    out.m_77.z = _1476;
    out.m_77.w = _1478;
    bool _1488 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1458);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    out.m_79.x = _1452;
    out.m_79.y = _1454;
    out.m_79.z = _1456;
    out.m_81.x = _1470;
    out.m_81.y = _1480;
    out.m_81.z = _1482;
    out.m_83.x = _1468;
    out.m_83.y = _1484;
    out.m_83.z = _1486;
    if (!_1496)
    {
        _1370 = 1.0;
    }
    float _1498 = _1370;
    out.m_85.x = _954;
    out.m_85.y = _956;
    out.m_85.z = _958;
    bool _1500 = !_1496;
    float _1502 = _1498;
    float _1504 = _956;
    float _1506 = _958;
    if (!_1500)
    {
        bool _1508 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1510 = isnan(_1458);
        bool _1512 = _1508 || _1510;
        bool _1514 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1516 = _1512 || _1514;
        if (!_1516)
        {
            float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1520 = _1458 + _1518;
            float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1524 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1522;
            float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1528 = _1526 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1530 = 1.0 / _1524;
            float _1532 = _1520 * _1530;
            float _1534 = fma(_1532, _1528, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1502 = _1534;
            _1504 = _1530;
            _1536 = true;
        }
        else
        {
            bool _1538 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1540 = isnan(_1458);
            bool _1542 = _1538 || _1540;
            bool _1544 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1546 = _1542 || _1544;
            if (!_1546)
            {
                float _1548 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1550 = _1458 + _1548;
                float _1552 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1554 = _1552 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1558 = _1556 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1560 = 1.0 / _1554;
                float _1562 = _1550 * _1560;
                float _1564 = fma(_1562, _1558, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1502 = _1564;
                _1504 = _1560;
                _1536 = true;
            }
            else
            {
                _1502 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1536 = false;
    float _1566 = _1502;
    float _1568 = _1504;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1572 = _1404 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1576 = _932 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1580 = _936 + _1578;
    float _1582 = fma(_1572, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1584 = fma(_1576, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1586 = fma(_1580, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1588 = -_840;
    float _1590 = _1588 + _1582;
    float _1592 = -_812;
    float _1594 = _1592 + _1584;
    float _1596 = -_810;
    float _1598 = _1596 + _1586;
    float _1600 = _1590 * _1590;
    float _1602 = fma(_1594, _1594, _1600);
    float _1604 = fma(_1598, _1598, _1602);
    float _1606 = sqrt(_1604);
    bool _1608 = _1606 > 0.0;
    float _1610 = _1606;
    float _1612 = _1568;
    float _1614 = _1590;
    if (!_1608)
    {
        _1610 = _1584;
    }
    float _1616 = _1610;
    float _1618 = _1616;
    if (!_1608)
    {
        _1612 = _1582;
    }
    float _1620 = _1612;
    float _1622 = _1620;
    if (!_1608)
    {
        _1506 = _1586;
    }
    float _1624 = _1506;
    bool _1626 = !_1608;
    float _1628 = _1624;
    float _1630 = _1624;
    if (!_1626)
    {
        float _1632 = _194 * _194;
        float _1634 = fma(_192, _192, _1632);
        float _1636 = fma(_196, _196, _1634);
        float _1638 = rsqrt(_1604);
        float _1640 = sqrt(_1636);
        float _1642 = _1594 * _1638;
        float _1644 = _1590 * _1638;
        float _1646 = _1598 * _1638;
        bool _1648 = _1640 > 0.0;
        float _1650 = _1638;
        float _1652 = _1640;
        _1614 = _1644;
        if (!_1648)
        {
            _1650 = _1584;
        }
        float _1654 = _1650;
        _1618 = _1654;
        if (!_1648)
        {
            _1652 = _1582;
        }
        float _1656 = _1652;
        _1622 = _1656;
        if (!_1648)
        {
            _1628 = _1586;
        }
        float _1658 = _1628;
        bool _1660 = !_1648;
        _1630 = _1658;
        if (!_1660)
        {
            float _1662 = rsqrt(_1636);
            float _1664 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1666 = _194 * _1662;
            float _1668 = _192 * _1662;
            float _1670 = _196 * _1662;
            float _1672 = _1644 * _1666;
            float _1674 = fma(_1642, _1668, _1672);
            float _1676 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1678 = fma(_1646, _1670, _1674);
            float _1680 = _1678 * _1676;
            float _1682 = fma(_192, _1680, _1584);
            float _1684 = fma(_194, _1680, _1582);
            float _1686 = fma(_196, _1680, _1586);
            _1622 = _1684;
            _1618 = _1682;
            _1630 = _1686;
        }
    }
    float _1688 = _1622;
    float _1690 = _1618;
    float _1692 = _1630;
    float _1694 = _1614;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1688 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1692 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = fma(_1702, _1702, _1708);
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = fma(_1706, _1706, _1710);
    float _1716 = rsqrt(_1714);
    float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1702 * _1718;
    float _1722 = _1706 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 + _1726;
    float _1730 = sqrt(_1728);
    bool _1732 = _1730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = _1730 + _1734;
    float _1738 = _1472;
    float _1740 = _1728;
    float _1742 = _1736;
    float _1744 = _1694;
    float _1746 = _1698;
    float _1748 = _1720;
    if (_1732)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1738 = _1750;
    }
    float _1752 = _1738;
    if (_1732)
    {
        float _1754 = rsqrt(_1728);
        _1740 = _1754;
    }
    float _1756 = _1740;
    float _1758 = _1756;
    if (_1732)
    {
        float _1760 = _1736 * _1752;
        _1742 = _1760;
    }
    float _1762 = _1742;
    if (_1732)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1744 = _1764;
    }
    float _1766 = _1744;
    float _1768 = _1752;
    float _1770 = _1766;
    if (_1732)
    {
        float _1772 = _1766 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1768 = _1774;
    }
    float _1776 = _1768;
    float _1778 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1780 = precise::max(0.0, _1778);
    float _1782 = _1706;
    float _1784 = _1780;
    if (_1732)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        _1782 = _1788;
    }
    float _1790 = _1782;
    float _1792 = -_1718;
    float _1794 = -_1780;
    float _1796 = fma(_1698, _1792, _1794);
    if (_1732)
    {
        float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1798;
    }
    float _1800 = _1746;
    float _1802 = _1800;
    float _1804 = _1776;
    if (_1732)
    {
        float _1806 = _1776 + (-1.0);
        _1784 = _1806;
    }
    float _1808 = _1784;
    if (_1732)
    {
        float _1810 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1810;
    }
    float _1812 = _1770;
    float _1814 = sqrt(_1714);
    float _1816 = _1790;
    if (_1732)
    {
        float _1818 = fma(_1790, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1816 = _1818;
    }
    float _1820 = _1816;
    float _1822 = _1820;
    if (!_1732)
    {
        _1802 = _1722;
    }
    float _1824 = _1802;
    float _1826 = _1824;
    if (_1732)
    {
        float _1828 = _1756 * _1820;
        _200 = _1828;
    }
    float _1830 = _200;
    if (!_1732)
    {
        _1822 = _1796;
    }
    float _1832 = _1822;
    float _1834 = _1832;
    if (_1732)
    {
        float _1836 = fma(_1796, _1776, _1812);
        _1834 = _1836;
    }
    float _1838 = _1834;
    if (!_1732)
    {
        _1758 = _1724;
    }
    float _1840 = _1758;
    float _1842 = _1840;
    if (_1732)
    {
        float _1844 = _1720 * _1830;
        _1748 = _1844;
    }
    float _1846 = _1748;
    if (_1732)
    {
        float _1848 = _1722 * _1830;
        _1826 = _1848;
    }
    float _1850 = _1826;
    if (!_1732)
    {
        _1804 = _1726;
    }
    float _1852 = _1804;
    float _1854 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1856 = _1852;
    if (_1732)
    {
        float _1858 = _1846 * _1846;
        _1842 = _1858;
    }
    float _1860 = _1842;
    if (_1732)
    {
        float _1862 = _1850 * _1850;
        _1856 = _1862;
    }
    float _1864 = _1856;
    float _1866 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1868 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1854);
    float _1870 = fma(_1838, _1838, _1860);
    float _1872 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1866);
    float _1874 = _1870 + _1864;
    float _1876 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1880 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1878);
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1886 = rsqrt(_1874);
    float _1888 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1890 = -_1882;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1896 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1888);
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1894);
    float _1902 = abs(_1892);
    float _1904 = log2(_1902);
    float _1906 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1910 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1912 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1872);
    float _1914 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = -_1908;
    float _1918 = fma(_1916, _1712, 1.0);
    float _1920 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1922 = _1886 * _1846;
    float _1924 = _1886 * _1838;
    float _1926 = _1886 * _1850;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1920);
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1932 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1934 = log2(_1918);
    float _1936 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1928);
    float _1938 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1940 = -_1930;
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1940);
    float _1944 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    float _1948 = -_1926;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1942);
    float _1952 = exp2(_1938);
    float _1954 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma(_1950, 0.5, 0.5);
    float _1962 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1954);
    float _1964 = _1924 + 1.0;
    float _1966 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1956);
    float _1968 = 1.0 / _1946;
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1962);
    float _1974 = _1934 * 0.693147182464599609375;
    float _1976 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1978 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = sqrt(_1958);
    float _1982 = -_1924;
    float _1984 = fma(_1952, _1964, _1982);
    float _1986 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1988 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1966);
    float _1990 = fma(_1960, _1976, 1.570728778839111328125);
    float _1992 = fma(_1984, 0.5, 0.5);
    float _1994 = _1986 * _1968;
    float _1996 = _1988 * _1968;
    float _1998 = fma(_1994, 0.5, 0.5);
    float _2000 = fma(_1996, -0.5, 0.5);
    float _2002 = _1980 * 0.636619746685028076171875;
    float _2004 = -_1990;
    float _2006 = fma(_2002, _2004, 1.0);
    float3 _5660 = float3(_1998, _2000, _1978);
    float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5660, float3(0.0), isnan(_5660)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5660, float3(0.0), isnan(_5660)), level(0.0)).x;
    float3 _5671 = float3(_1998, _2000, _1978);
    float4 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).xyzw;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _2011.w;
    float2 _5687 = float2(_2006, _1992);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5687, float2(0.0), isnan(_5687)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5687, float2(0.0), isnan(_5687)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _840 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = -_960;
    float _2033 = _2031 + 1.0;
    bool _2035 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2037 = isnan(_1814);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2047 = _840 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2049 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2045);
    float _2051 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2047);
    float _2053 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2055 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2051);
    float _2057 = 1.0 / _2053;
    float _2059 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2061 = _2059 + _2053;
    float _2063 = _2061 * _2057;
    float _2065 = _2063 * 0.5;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2069 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2067);
    float _2071 = 1.0 / _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2075 = _2071 * _2073;
    float _2077 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2079 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2081 = abs(_2075);
    float _2083 = log2(_2081);
    float _2085 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2077);
    float _2087 = _1946 * 0.5;
    float _2089 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2085);
    float _2091 = exp2(_2079);
    bool _2093 = _2075 <= 8000.0;
    bool _2095 = isnan(_2075);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan(8000.0);
    bool _2101 = _2097 || _2099;
    float _2103 = float(_2101);
    float _2105 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2107 = _2105 + _1946;
    out.gl_Position.x = _1986;
    out.gl_Position.y = _1988;
    out.gl_Position.z = _2105;
    out.gl_Position.w = _1946;
    float _2109 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2111 = _2107 * 0.5;
    float _2113 = exp2(_2109);
    float _2115 = _2105;
    float _2117 = _1988;
    float _2119 = _1946;
    float _2121 = _1986;
    if (!_2043)
    {
        _2115 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2123 = _2115;
    float _2125 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = -_2091;
    float _2131 = _2129 + 1.0;
    float _2133 = fma(_1988, -0.5, _2087);
    float _2135 = _2133;
    float _2137 = _2123;
    float _2139 = _2123;
    if (!_2043)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2141 = _2117;
    float _2143 = fma(_2127, -2.0, 3.0);
    float _2145 = _2127 * _2127;
    float _2147 = in.m_87.x;
    float _2149 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2151 = _2145 * _2143;
    float _2153 = -_2151;
    float _2155 = _2153 + 1.0;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2151);
    float _2159 = _2103 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2163 = _2033 * _2161;
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = -_2165;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2171 = _2169 * _2147;
    float _2173 = _1986 + _1946;
    float _2175 = _2141;
    float _2177 = _2141;
    if (!_2043)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2179 = _2119;
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = _2173 * 0.5;
    float _2185 = _2183;
    float _2187 = _2179;
    float _2189 = _2179;
    if (!_2043)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2191 = _2121;
    out.m_89.x = _2181;
    out.m_91.x = _2183;
    out.m_91.y = _2133;
    out.m_91.z = _2111;
    out.m_91.w = _1946;
    float _2193 = _2191;
    float _2195 = _2191;
    if (!_2043)
    {
        _2135 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2197 = _2135;
    float _2199 = _2197;
    float _2201 = _2197;
    if (!_2043)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2203 = _2185;
    float _2205 = _2149 * _2008;
    float _2207 = -_2149;
    float _2209 = _2207 + 1.0;
    float _2211 = _2019 * _2205;
    float _2213 = _2027 * _2205;
    float _2215 = _2019 * _2209;
    float _2217 = fma(_2023, _2211, _2013);
    float _2219 = fma(_2025, _2211, _2015);
    float _2221 = fma(_2019, _2213, _2017);
    out.m_93.x = _2217;
    out.m_93.y = _2219;
    out.m_93.z = _2221;
    out.m_93.w = _2215;
    bool _2223 = !_2043;
    float _2225 = _2203;
    float _2227 = _2203;
    if (!_2223)
    {
        bool _2229 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2231 = isnan(_1814);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2237 = _2233 || _2235;
        if (!_2237)
        {
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2241 = _1814 + _2239;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2245 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2243;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2251 = 1.0 / _2245;
            float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2269 = _2241 * _2251;
            float _2271 = precise::clamp(_2269, 0.0, 1.0);
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2277 = fma(_2271, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2279 = fma(_2271, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2281 = fma(_2271, _2255, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2271, _2259, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2285 = fma(_2271, _2263, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2287 = fma(_2271, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2227 = _2281;
            _2177 = _2285;
            _2201 = _2277;
            _2139 = _2283;
            _2189 = _2279;
            _2195 = _2287;
            _2289 = true;
        }
        else
        {
            bool _2291 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2293 = isnan(_1814);
            bool _2295 = _2291 || _2293;
            bool _2297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2299 = _2295 || _2297;
            if (!_2299)
            {
                _2199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2301 = _2199;
            _2201 = _2301;
            if (!_2299)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2303 = _2225;
            _2227 = _2303;
            if (!_2299)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2305 = _2187;
            _2189 = _2305;
            if (!_2299)
            {
                _2137 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2307 = _2137;
            _2139 = _2307;
            if (!_2299)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2309 = _2175;
            _2177 = _2309;
            if (!_2299)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2311 = _2193;
            bool _2313 = !_2299;
            _2195 = _2311;
            if (!_2313)
            {
                bool _2315 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2317 = isnan(_1814);
                bool _2319 = _2315 || _2317;
                bool _2321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2323 = _2319 || _2321;
                if (!_2323)
                {
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2327 = _1814 + _2325;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2329;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2337 = 1.0 / _2331;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2355 = _2327 * _2337;
                    float _2357 = precise::clamp(_2355, 0.0, 1.0);
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2363 = fma(_2357, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2365 = fma(_2357, _2361, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2367 = fma(_2357, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2357, _2345, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2371 = fma(_2357, _2349, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2373 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2227 = _2367;
                    _2177 = _2371;
                    _2201 = _2363;
                    _2139 = _2369;
                    _2189 = _2365;
                    _2195 = _2373;
                    _2289 = true;
                }
                else
                {
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2139 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2289 = false;
    float _2375 = _2227;
    float _2377 = _2177;
    float _2379 = _2201;
    float _2381 = _2139;
    float _2383 = _2189;
    float _2385 = _2195;
    float _2387 = fma(_1484, -0.5, 0.5);
    float _2389 = precise::clamp(_2387, 0.0, 1.0);
    float _2391 = -_2375;
    float _2393 = _2391 + _2377;
    float _2395 = -_2379;
    float _2397 = _2395 + _2381;
    float _2399 = -_2383;
    float _2401 = _2399 + _2385;
    bool _2403 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2405 = fma(_2389, _2393, _2375);
    float _2407 = fma(_2389, _2397, _2379);
    float _2409 = fma(_2389, _2401, _2383);
    float _2411 = _2405 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2413 = fma(_2407, 0.298911988735198974609375, _2411);
    float _2415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2409, 0.114477999508380889892578125, _2413);
    out.m_53.x = _2415;
    float _2419 = -_2417;
    float _2421 = _2407 + _2419;
    float _2423 = -_2417;
    float _2425 = _2405 + _2423;
    float _2427 = -_2417;
    float _2429 = _2409 + _2427;
    float _2431 = fma(_2421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    float _2433 = fma(_2425, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    float _2435 = fma(_2429, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    out.m_97.x = _2431;
    out.m_97.y = _2433;
    out.m_97.z = _2435;
    if (!_2403)
    {
        return out;
    }
    float _2437 = -_1688;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2441 = -_1690;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2445 = -_1692;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2449 = _2439 * _2439;
    float _2451 = fma(_2443, _2443, _2449);
    float _2453 = fma(_2447, _2447, _2451);
    float _2455 = sqrt(_2453);
    float _2457 = rsqrt(_2453);
    float _2459 = -_2455;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2463 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = _2443 * _2457;
    float _2469 = _2439 * _2457;
    float _2471 = abs(_2465);
    float _2473 = log2(_2471);
    float _2475 = _2447 * _2457;
    float _2477 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2479 = _1484 * _2469;
    float _2481 = -_2469;
    float _2483 = -_2477;
    float _2485 = fma(_2481, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2483);
    float _2487 = fma(_1468, _2467, _2479);
    float _2489 = -_2475;
    float _2491 = fma(_2489, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2485);
    float _2493 = fma(_1486, _2475, _2487);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2499 = _2491 + _2497;
    float _2501 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2503 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = exp2(_2501);
    float _2509 = _2507 * _2505;
    float _2511 = _2495 * _2509;
    float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2517 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2513;
    out.m_95.y = _2515;
    out.m_95.z = _2517;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2289 = false;
    bool _1536 = false;
    bool _402 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_50.w;
    float _113 = trunc(_111);
    int _116 = int(_113);
    bool _120 = _116 >= 1;
    float _122 = 0.0;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _122;
    float _126 = _124;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _124 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2574 = as_type<float>(_132);
        out.gl_Position.z = _2574;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_55.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_116);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    if (_164)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _126;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _134 = as_type<int>(_168);
    }
    int _170 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_170);
        out.gl_Position.z = _2643;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_57.x;
    float _174 = in.m_57.y;
    float _176 = in.m_57.z;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _180 = _174 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _182 = _174 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _184 = _174 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _186 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[4].x, _180);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[5].x, _182);
    float _190 = fma(_172, (*spvDescriptorSet0.vp_c10)._m0[6].x, _184);
    float _192 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[4].z, _186);
    float _194 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[5].z, _188);
    float _196 = fma(_176, (*spvDescriptorSet0.vp_c10)._m0[6].z, _190);
    bool _198 = !_178;
    float _200 = _194;
    float _218;
    if (!_198)
    {
        float _202 = in.m_59.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_116);
        float _224 = 1.0 / _222;
        float _226 = _150 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _236 = 1.0 / _232;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _242 = _234 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _246 = _244 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _248 = _238 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _228 + _250;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _256 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _258 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _260 = isnan(_228);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = 1.0 / _246;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _228 + _272;
    out.m_61.x = _248;
    out.m_61.y = _242;
    out.m_61.z = _256;
    out.m_61.w = _254;
    float _276 = -_268;
    float _278 = _276 + 1.0;
    float _280 = _252 * _236;
    bool _282 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_228);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    bool _294 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_228);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _308 = _274 * _270;
    float _310 = _304 * _278;
    float _312 = -_304;
    float _314 = _312 + 1.0;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = _292 * _314;
    float _330 = fma(_318, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _332 = fma(_322, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = fma(_326, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = -_292;
    float _338 = _336 + 1.0;
    float _340 = _330 * _328;
    float _342 = _332 * _328;
    float _344 = _334 * _328;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _340);
    float _360 = fma(_348, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _362 = fma(_352, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _364 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _342);
    float _366 = fma(_356, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _344);
    float _370 = fma(_360, _310, _358);
    float _372 = fma(_362, _310, _364);
    float _374 = fma(_366, _310, _368);
    float _376 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].x, _370);
    float _378 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].y, _372);
    float _380 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[145].z, _374);
    bool _382 = !_306;
    float _400;
    if (!_382)
    {
        float _384 = in.m_59.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_116);
        float _406 = 1.0 / _404;
        float _408 = _150 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_59.z;
    float _414 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _416 = log2(_414);
    float _418 = in.m_59.x;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _422 = _420 != 0;
    int _424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _426 = _424 != 0;
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _430 = _428 != 0;
    float _432 = in.m_59.y;
    bool _434 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _436 = isnan(1.0);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _442 = _438 || _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _446 = 1.0 + _444;
    bool _448 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _456 = _452 || _454;
    float _458 = _416 * _150;
    float _460 = 1.0 / _446;
    float _462 = _412 * 2.0;
    float _464 = _418 * 2.0;
    float _466 = exp2(_458);
    float _468 = _432 * 2.0;
    float _470 = floor(_462);
    float _472 = _418 + _432;
    float _474 = _472 + (-1.0);
    float _476 = floor(_464);
    float _478 = -_466;
    float _480 = _478 + 1.0;
    float _482 = _456 ? _480 : 0.0;
    bool _484 = _470 > 0.0;
    float _486 = floor(_468);
    bool _488 = _470 >= 0.0;
    bool _490 = isnan(_470);
    bool _492 = _488 || _490;
    bool _494 = isnan(0.0);
    bool _496 = _492 || _494;
    float _498 = _432 + _412;
    if (_442)
    {
        float _500 = _482 * _460;
        _154 = _500;
    }
    float _502 = _154;
    bool _504 = !_430;
    int _506 = _504 ? 0 : 1;
    float _508 = _498 + (-1.0);
    int _510 = _496 ? 0 : 1;
    bool _512 = _476 > 0.0;
    float _514 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _516 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _518 = !_422;
    int _520 = _518 ? 0 : 1;
    bool _522 = _476 >= 0.0;
    bool _524 = isnan(_476);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = in.m_63.x;
    float _534 = in.m_63.y;
    float _536 = in.m_63.z;
    int _538 = ~_510;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    int _544 = _542;
    if (!_484)
    {
        int _546 = ~_510;
        int _548 = _546 + 1;
        _544 = _548;
    }
    int _550 = _544;
    int _552 = abs(_520);
    float _554 = float(_550);
    float _556 = float(_552);
    int _558 = _530 ? 0 : 1;
    bool _560 = !_426;
    int _562 = _560 ? 0 : 1;
    float _564 = _556 * _554;
    int _566 = ~_558;
    int _568 = _566 + 1;
    int _570 = _568 + 1;
    float _572 = _418 + (-0.5);
    int _574 = abs(_562);
    int _576 = _570;
    if (!_512)
    {
        int _578 = ~_558;
        int _580 = _578 + 1;
        _576 = _580;
    }
    int _582 = _576;
    float _584 = _564 * (-2.0);
    bool _586 = _486 > 0.0;
    float _588 = float(_574);
    float _590 = fma(_584, _532, _532);
    float _592 = float(_582);
    float _594 = fma(_516, _584, _516);
    bool _596 = _486 >= 0.0;
    bool _598 = isnan(_486);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].x, _590);
    int _608 = abs(_506);
    float _610 = _588 * _592;
    int _612 = _604 ? 0 : 1;
    float _614 = _432 + (-0.5);
    float _616 = float(_608);
    float _618 = _610 * (-2.0);
    int _620 = ~_612;
    int _622 = _620 + 1;
    int _624 = _622 + 1;
    float _626 = fma(_594, _502, _606);
    int _628 = _624;
    if (!_586)
    {
        int _630 = ~_612;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = fma(_618, _534, _534);
    float _638 = fma(_514, _618, _514);
    float _640 = _418 + _412;
    float _642 = float(_634);
    float _644 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[196].y, _636);
    float _646 = _626 * 0.15915493667125701904296875;
    float _648 = _640 + (-1.0);
    float _650 = _616 * _642;
    float _652 = fma(_638, _502, _644);
    float _654 = in.m_65.x;
    float _656 = in.m_65.y;
    float _658 = in.m_65.z;
    float _660 = _650 * (-2.0);
    float _662 = _646 * 6.283185482025146484375;
    float _664 = sin(_662);
    float _666 = _652 * 0.15915493667125701904296875;
    float _668 = in.m_67.x;
    float _670 = in.m_67.y;
    float _672 = in.m_67.z;
    float _674 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _676 = fma(_660, _536, _536);
    float _678 = _412 + (-0.5);
    float _680 = fma(_674, _660, _674);
    float _682 = _646 * 6.283185482025146484375;
    float _684 = cos(_682);
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _676);
    float _688 = fma(_680, _502, _686);
    float _690 = _666 * 6.283185482025146484375;
    float _692 = sin(_690);
    float _694 = _688 * 0.15915493667125701904296875;
    float _696 = _380 * _658;
    float _698 = _378 * _656;
    float _700 = _376 * _654;
    float _702 = _666 * 6.283185482025146484375;
    float _704 = cos(_702);
    float _706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _668);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _670);
    float _710 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _712 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _714 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _672);
    float _718 = _708 * _710;
    float _720 = _694 * 6.283185482025146484375;
    float _722 = cos(_720);
    float _724 = _706 * _712;
    float _726 = _716 * _714;
    float _728 = in.m_50.x;
    float _730 = in.m_50.y;
    float _732 = in.m_50.z;
    float _734 = _664 * _692;
    float _736 = _684 * _692;
    float _738 = _694 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _684 * _704;
    float _744 = _664 * _704;
    float _746 = _684 * _722;
    float _748 = _664 * _722;
    float _750 = _704 * _722;
    float _752 = _692 * _722;
    float _754 = _746 * _718;
    float _756 = fma(_740, _742, _734);
    float _758 = -_718;
    float _760 = _740 * _758;
    float _762 = _748 * _718;
    float _764 = -_736;
    float _766 = fma(_740, _744, _764);
    float _768 = -_744;
    float _770 = fma(_740, _736, _768);
    float _772 = fma(_756, _724, _754);
    float _774 = fma(_740, _734, _742);
    float _776 = fma(_750, _724, _760);
    float _778 = fma(_766, _724, _762);
    float _780 = fma(_770, _726, _772);
    float _782 = _730 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _784 = fma(_752, _726, _776);
    float _786 = fma(_774, _726, _778);
    float _788 = _730 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _790 = _780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _792 = _780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _794 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _796 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[4].x, _788);
    float _798 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _790);
    float _800 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _792);
    float _802 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[6].z, _794);
    float _804 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _806 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].z, _798);
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].z, _800);
    float _810 = _802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _814 = _806 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _818 = _730 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _820 = _812 + _814;
    float _822 = _810 + _816;
    float _824 = fma(_728, (*spvDescriptorSet0.vp_c10)._m0[5].x, _818);
    float _826 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _828 = _820 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _832 = _822 + _830;
    float _834 = fma(_732, (*spvDescriptorSet0.vp_c10)._m0[5].z, _824);
    float _836 = _828 * _828;
    float _838 = _832 * _832;
    float _840 = _834 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _842 = _836 + _838;
    float _844 = sqrt(_842);
    bool _846 = _844 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = _844 + _848;
    float _852 = 0.0;
    float _854 = _780;
    float _856 = _834;
    float _858 = _820;
    float _860 = _822;
    float _862 = _836;
    float _864 = _838;
    if (_846)
    {
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _852 = _866;
    }
    float _868 = _852;
    float _870 = _868;
    if (_846)
    {
        float _872 = _850 * _868;
        _870 = _872;
    }
    float _874 = _870;
    float _876 = _780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _878 = _874;
    if (_846)
    {
        float _880 = rsqrt(_842);
        _854 = _880;
    }
    float _882 = _854;
    if (_846)
    {
        float _884 = _874 * 0.15915493667125701904296875;
        _878 = _884;
    }
    float _886 = _878;
    float _888 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _876);
    float _890 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].z, _888);
    float _892 = _728;
    if (_846)
    {
        float _894 = _886 * 6.283185482025146484375;
        float _896 = sin(_894);
        _892 = _896;
    }
    float _898 = _892;
    float _900 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _902 = _890 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _904 = _840 + _902;
    float _906 = floor(_900);
    float _908 = fma(_810, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _910 = _904;
    if (_846)
    {
        float _912 = _904 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _856 = _912;
    }
    float _914 = _856;
    float _916 = _914;
    if (_846)
    {
        float _918 = fma(_898, _914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _916 = _918;
    }
    float _920 = _916;
    float _922 = floor(_908);
    float _924 = _920;
    if (_846)
    {
        float _926 = _882 * _920;
        _924 = _926;
    }
    float _928 = _924;
    if (_846)
    {
        float _930 = fma(_828, _928, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _858 = _930;
    }
    float _932 = _858;
    if (_846)
    {
        float _934 = fma(_832, _928, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _860 = _934;
    }
    float _936 = _860;
    float _938 = -_906;
    float _940 = _900 + _938;
    float _942 = fma(_932, 6.2500002968590706586837768554688e-05, 0.5);
    float _944 = fma(_936, 6.2500002968590706586837768554688e-05, 0.5);
    float _946 = -_922;
    float _948 = _908 + _946;
    float2 _3868 = float2(_942, _944);
    float3 _952 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3868, float2(0.0), isnan(_3868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3868, float2(0.0), isnan(_3868)), level(0.0)).xyz;
    float _954 = _952.x;
    float _956 = _952.y;
    float _958 = _952.z;
    float2 _3884 = float2(_940, _948);
    float _960 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3884, float2(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3884, float2(0.0), isnan(_3884)), level(0.0)).x;
    float _962 = in.m_69.y;
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _966 = in.m_59.w;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _974 = _972 != 0;
    float _976 = in.m_69.x;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _980 = _978 != 0;
    float _982 = 1.0 / _970;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _990 = _988 != 0;
    bool _992 = _432 > 0.5;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _998 = 1.0 / _986;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1002 = _1000 != 0;
    float _1004 = -_962;
    float _1006 = _1004 + 1.0;
    float _1008 = 1.0 / _996;
    bool _1010 = _966 > 0.5;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1012;
    bool _1016 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1018 = isnan(_410);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    int _1028 = _1010 ? as_type<int>(_1006) : as_type<int>(_962);
    int _1030 = 0;
    bool _1032 = _1010;
    bool _1034 = _1002;
    float _1036 = _962;
    float _1038 = _976;
    if (_980)
    {
        float _1040 = -_976;
        float _1042 = _1040 + 1.0;
        _1030 = as_type<int>(_1042);
    }
    int _1044 = _1030;
    if (_974)
    {
        bool _1046 = _418 > 0.5;
        _1032 = _1046;
    }
    bool _1048 = _1032;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1050;
    float _1054 = _1002 ? as_type<float>(_1028) : _962;
    float _1056 = _1014 * _998;
    if (_980)
    {
        bool _1058 = _412 > 0.5;
        _1034 = _1058;
    }
    bool _1060 = _1034;
    float _1062 = _1052 * _982;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1066 = _410 + _1064;
    if (_990)
    {
        float _1068 = _992 ? _1006 : _962;
        _1036 = _1068;
    }
    float _1070 = _1036;
    float _1072 = -_1026;
    float _1074 = _1072 + 1.0;
    bool _1076 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1078 = isnan(_410);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = fma(_1062, _1066, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1090 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1092 = isnan(_410);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = in.m_71.x;
    float _1104 = in.m_71.y;
    float _1106 = in.m_71.z;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1112 = _1086 * _1074;
    float _1114 = -_1086;
    float _1116 = _1114 + 1.0;
    bool _1118 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1120 = isnan(_410);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = -_1100;
    float _1132 = _1130 + 1.0;
    bool _1134 = _670 != 0.0;
    bool _1136 = isnan(_670);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan(0.0);
    bool _1142 = _1138 || _1140;
    float _1144 = _1100 * _1116;
    float _1146 = _1110 * _1008;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1150 = _410 + _1148;
    float _1152 = _1128 * _1132;
    bool _1154 = _668 == 0.0;
    bool _1156 = !_1142;
    bool _1158 = _1154 && _1156;
    float _1160 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1162 = fma(_1146, _1150, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1164 = _1088 * _1152;
    bool _1166 = _672 == 0.0;
    bool _1168 = _1166 && _1158;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1172 = _410 + _1170;
    int _1174 = as_type<int>(_1146);
    float _1176 = _1164;
    if (_974)
    {
        float _1178 = -_976;
        float _1180 = _1178 + 1.0;
        _1174 = as_type<int>(_1180);
    }
    int _1182 = _1174;
    float _1184 = 0.0;
    if (!_974)
    {
        _1184 = _976;
    }
    float _1186 = _1184;
    float _1188 = -_1128;
    float _1190 = _1188 + 1.0;
    float _1192 = fma(_1056, _1172, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1196 = _1186;
    float _1198 = _1190;
    if (_974)
    {
        float _1200 = _1048 ? as_type<float>(_1182) : _976;
        _1196 = _1200;
    }
    float _1202 = _1196;
    float _1204 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1164);
    float _1206 = in.m_73.x;
    float _1208 = in.m_73.y;
    float _1210 = in.m_73.z;
    float _1212 = in.m_73.w;
    if (_980)
    {
        float _1214 = _1060 ? as_type<float>(_1044) : _976;
        _1038 = _1214;
    }
    float _1216 = _1038;
    float _1218 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1220 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1222 = 0.0;
    float _1224 = _1102;
    if (_1168)
    {
        _1222 = _1102;
    }
    float _1226 = _1222;
    float _1228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1230 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1232 = _1226;
    if (_1168)
    {
        _1198 = _1106;
    }
    float _1234 = _1198;
    float _1236 = fma(_1162, _1144, _1204);
    float _1238 = _1234;
    if (_1168)
    {
        _1176 = _1226;
    }
    float _1240 = _1176;
    float _1242 = _1240;
    if (!_1168)
    {
        float _1244 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1238 = _1244;
    }
    float _1246 = _1238;
    if (!_1168)
    {
        _1232 = _1102;
    }
    float _1248 = _1232;
    float _1250 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1168)
    {
        _1224 = _1104;
    }
    float _1252 = _1224;
    float _1254 = _1252;
    if (!_1168)
    {
        float _1256 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1104);
        _1254 = _1256;
    }
    float _1258 = _1254;
    float _1260 = fma(_1192, _1112, _1236);
    if (!_1168)
    {
        float _1262 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1248);
        _1242 = _1262;
    }
    float _1264 = _1242;
    float _1266 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1268 = _1218 * _964;
    float _1270 = _886;
    if (_846)
    {
        float _1272 = _886 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1260);
    float _1280 = _1266 * _1160;
    float _1282 = _1220 * _1194;
    float _1284 = _1230 * _1228;
    float _1286 = _1210 * _1248;
    float _1288 = _1208 * _1106;
    float _1290 = _1206 * _1104;
    float _1292 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1294 = -_1286;
    float _1296 = fma(_1206, _1106, _1294);
    float _1298 = -_1288;
    float _1300 = fma(_1210, _1104, _1298);
    float _1302 = -_1290;
    float _1304 = fma(_1208, _1248, _1302);
    out.m_75.x = _1282;
    out.m_75.y = _1280;
    out.m_75.z = _1284;
    out.m_75.w = _1268;
    float _1306 = _1296 * _1212;
    float _1308 = _1300 * _1212;
    float _1310 = _1304 * _1212;
    float _1312 = _756 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1314 = _756 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1316 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1318 = _756 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1320 = -_740;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1292);
    float _1324 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1312);
    float _1326 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1314);
    float _1328 = -_740;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1316);
    float _1332 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1318);
    float _1334 = _770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1336 = -_740;
    float _1338 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1250);
    float _1340 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1322);
    float _1342 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1324);
    float _1344 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1330);
    float _1346 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1338);
    float _1348 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1326);
    float _1350 = fma(_766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1352 = _1340 * _1208;
    float _1354 = _1346 * _1258;
    float _1356 = _1340 * _1258;
    float _1358 = _1306 * _1340;
    float _1360 = _770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1362 = fma(_1342, _1264, _1354);
    float _1364 = _1354;
    float _1366 = _1356;
    float _1368 = _1206;
    float _1370 = _1310;
    if (_846)
    {
        float _1372 = _1276 + (-1.0);
        _1364 = _1372;
    }
    float _1374 = _1364;
    float _1376 = _770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1378 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1334);
    float _1380 = _1346 * _1208;
    float _1382 = _1374;
    if (_846)
    {
        float _1384 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1382 = _1384;
    }
    float _1386 = _1382;
    float _1388 = _1344 * _1208;
    float _1390 = _1306 * _1346;
    float _1392 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1360);
    float _1394 = fma(_1348, _1264, _1356);
    if (_846)
    {
        float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1398 = _932 + _1396;
        _1366 = _1398;
    }
    float _1400 = _1366;
    if (_846)
    {
        float _1402 = fma(_904, _1276, _1386);
        _910 = _1402;
    }
    float _1404 = _910;
    float _1406 = _1344 * _1258;
    float _1408 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1376);
    float _1410 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1412 = fma(_1342, _1206, _1380);
    float _1414 = fma(_1308, _1342, _1390);
    float _1416 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1392);
    float _1418 = fma(_1348, _1206, _1352);
    float _1420 = fma(_1350, _1206, _1388);
    if (_846)
    {
        float _1422 = _1400 * _1400;
        _862 = _1422;
    }
    float _1424 = _862;
    if (_846)
    {
        float _1426 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1428 = _936 + _1426;
        _1368 = _1428;
    }
    float _1430 = _1368;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1434 = _1404 + _1432;
    float _1436 = _1306 * _1344;
    float _1438 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1408);
    if (_846)
    {
        float _1440 = _1430 * _1430;
        _864 = _1440;
    }
    float _1442 = _864;
    float _1444 = fma(_1434, _1434, _1424);
    float _1446 = fma(_1308, _1348, _1358);
    float _1448 = fma(_1308, _1350, _1436);
    float _1450 = _1444 + _1442;
    float _1452 = fma(_1410, _1210, _1412);
    float _1454 = fma(_1416, _1210, _1418);
    float _1456 = fma(_1438, _1210, _1420);
    float _1458 = sqrt(_1450);
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1462 = fma(_1350, _1264, _1406);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1468 = fma(_1410, _1246, _1362);
    float _1470 = fma(_1310, _1410, _1414);
    float _1472 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1278 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1480 = fma(_1310, _1416, _1446);
    float _1482 = fma(_1310, _1438, _1448);
    float _1484 = fma(_1416, _1246, _1394);
    float _1486 = fma(_1438, _1246, _1462);
    out.m_77.x = _1472;
    out.m_77.y = _1474;
    out.m_77.z = _1476;
    out.m_77.w = _1478;
    bool _1488 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1490 = isnan(_1458);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1496 = _1492 || _1494;
    out.m_79.x = _1452;
    out.m_79.y = _1454;
    out.m_79.z = _1456;
    out.m_81.x = _1470;
    out.m_81.y = _1480;
    out.m_81.z = _1482;
    out.m_83.x = _1468;
    out.m_83.y = _1484;
    out.m_83.z = _1486;
    if (!_1496)
    {
        _1370 = 1.0;
    }
    float _1498 = _1370;
    out.m_85.x = _954;
    out.m_85.y = _956;
    out.m_85.z = _958;
    bool _1500 = !_1496;
    float _1502 = _1498;
    float _1504 = _956;
    float _1506 = _958;
    if (!_1500)
    {
        bool _1508 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1510 = isnan(_1458);
        bool _1512 = _1508 || _1510;
        bool _1514 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1516 = _1512 || _1514;
        if (!_1516)
        {
            float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1520 = _1458 + _1518;
            float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1524 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1522;
            float _1526 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1528 = _1526 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1530 = 1.0 / _1524;
            float _1532 = _1520 * _1530;
            float _1534 = fma(_1532, _1528, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1502 = _1534;
            _1504 = _1530;
            _1536 = true;
        }
        else
        {
            bool _1538 = _1458 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1540 = isnan(_1458);
            bool _1542 = _1538 || _1540;
            bool _1544 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1546 = _1542 || _1544;
            if (!_1546)
            {
                float _1548 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1550 = _1458 + _1548;
                float _1552 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1554 = _1552 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1558 = _1556 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1560 = 1.0 / _1554;
                float _1562 = _1550 * _1560;
                float _1564 = fma(_1562, _1558, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1502 = _1564;
                _1504 = _1560;
                _1536 = true;
            }
            else
            {
                _1502 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1536 = false;
    float _1566 = _1502;
    float _1568 = _1504;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1572 = _1404 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1576 = _932 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1580 = _936 + _1578;
    float _1582 = fma(_1572, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1584 = fma(_1576, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1586 = fma(_1580, _1566, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1588 = -_840;
    float _1590 = _1588 + _1582;
    float _1592 = -_812;
    float _1594 = _1592 + _1584;
    float _1596 = -_810;
    float _1598 = _1596 + _1586;
    float _1600 = _1590 * _1590;
    float _1602 = fma(_1594, _1594, _1600);
    float _1604 = fma(_1598, _1598, _1602);
    float _1606 = sqrt(_1604);
    bool _1608 = _1606 > 0.0;
    float _1610 = _1606;
    float _1612 = _1568;
    float _1614 = _1590;
    if (!_1608)
    {
        _1610 = _1584;
    }
    float _1616 = _1610;
    float _1618 = _1616;
    if (!_1608)
    {
        _1612 = _1582;
    }
    float _1620 = _1612;
    float _1622 = _1620;
    if (!_1608)
    {
        _1506 = _1586;
    }
    float _1624 = _1506;
    bool _1626 = !_1608;
    float _1628 = _1624;
    float _1630 = _1624;
    if (!_1626)
    {
        float _1632 = _194 * _194;
        float _1634 = fma(_192, _192, _1632);
        float _1636 = fma(_196, _196, _1634);
        float _1638 = rsqrt(_1604);
        float _1640 = sqrt(_1636);
        float _1642 = _1594 * _1638;
        float _1644 = _1590 * _1638;
        float _1646 = _1598 * _1638;
        bool _1648 = _1640 > 0.0;
        float _1650 = _1638;
        float _1652 = _1640;
        _1614 = _1644;
        if (!_1648)
        {
            _1650 = _1584;
        }
        float _1654 = _1650;
        _1618 = _1654;
        if (!_1648)
        {
            _1652 = _1582;
        }
        float _1656 = _1652;
        _1622 = _1656;
        if (!_1648)
        {
            _1628 = _1586;
        }
        float _1658 = _1628;
        bool _1660 = !_1648;
        _1630 = _1658;
        if (!_1660)
        {
            float _1662 = rsqrt(_1636);
            float _1664 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1666 = _194 * _1662;
            float _1668 = _192 * _1662;
            float _1670 = _196 * _1662;
            float _1672 = _1644 * _1666;
            float _1674 = fma(_1642, _1668, _1672);
            float _1676 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1678 = fma(_1646, _1670, _1674);
            float _1680 = _1678 * _1676;
            float _1682 = fma(_192, _1680, _1584);
            float _1684 = fma(_194, _1680, _1582);
            float _1686 = fma(_196, _1680, _1586);
            _1622 = _1684;
            _1618 = _1682;
            _1630 = _1686;
        }
    }
    float _1688 = _1622;
    float _1690 = _1618;
    float _1692 = _1630;
    float _1694 = _1614;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1688 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1692 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = fma(_1702, _1702, _1708);
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = fma(_1706, _1706, _1710);
    float _1716 = rsqrt(_1714);
    float _1718 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1720 = _1702 * _1718;
    float _1722 = _1706 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 + _1726;
    float _1730 = sqrt(_1728);
    bool _1732 = _1730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = _1730 + _1734;
    float _1738 = _1472;
    float _1740 = _1728;
    float _1742 = _1736;
    float _1744 = _1694;
    float _1746 = _1698;
    float _1748 = _1720;
    if (_1732)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1738 = _1750;
    }
    float _1752 = _1738;
    if (_1732)
    {
        float _1754 = rsqrt(_1728);
        _1740 = _1754;
    }
    float _1756 = _1740;
    float _1758 = _1756;
    if (_1732)
    {
        float _1760 = _1736 * _1752;
        _1742 = _1760;
    }
    float _1762 = _1742;
    if (_1732)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1744 = _1764;
    }
    float _1766 = _1744;
    float _1768 = _1752;
    float _1770 = _1766;
    if (_1732)
    {
        float _1772 = _1766 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1768 = _1774;
    }
    float _1776 = _1768;
    float _1778 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1780 = precise::max(0.0, _1778);
    float _1782 = _1706;
    float _1784 = _1780;
    if (_1732)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        _1782 = _1788;
    }
    float _1790 = _1782;
    float _1792 = -_1718;
    float _1794 = -_1780;
    float _1796 = fma(_1698, _1792, _1794);
    if (_1732)
    {
        float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1798;
    }
    float _1800 = _1746;
    float _1802 = _1800;
    float _1804 = _1776;
    if (_1732)
    {
        float _1806 = _1776 + (-1.0);
        _1784 = _1806;
    }
    float _1808 = _1784;
    if (_1732)
    {
        float _1810 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1770 = _1810;
    }
    float _1812 = _1770;
    float _1814 = sqrt(_1714);
    float _1816 = _1790;
    if (_1732)
    {
        float _1818 = fma(_1790, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1816 = _1818;
    }
    float _1820 = _1816;
    float _1822 = _1820;
    if (!_1732)
    {
        _1802 = _1722;
    }
    float _1824 = _1802;
    float _1826 = _1824;
    if (_1732)
    {
        float _1828 = _1756 * _1820;
        _200 = _1828;
    }
    float _1830 = _200;
    if (!_1732)
    {
        _1822 = _1796;
    }
    float _1832 = _1822;
    float _1834 = _1832;
    if (_1732)
    {
        float _1836 = fma(_1796, _1776, _1812);
        _1834 = _1836;
    }
    float _1838 = _1834;
    if (!_1732)
    {
        _1758 = _1724;
    }
    float _1840 = _1758;
    float _1842 = _1840;
    if (_1732)
    {
        float _1844 = _1720 * _1830;
        _1748 = _1844;
    }
    float _1846 = _1748;
    if (_1732)
    {
        float _1848 = _1722 * _1830;
        _1826 = _1848;
    }
    float _1850 = _1826;
    if (!_1732)
    {
        _1804 = _1726;
    }
    float _1852 = _1804;
    float _1854 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1856 = _1852;
    if (_1732)
    {
        float _1858 = _1846 * _1846;
        _1842 = _1858;
    }
    float _1860 = _1842;
    if (_1732)
    {
        float _1862 = _1850 * _1850;
        _1856 = _1862;
    }
    float _1864 = _1856;
    float _1866 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1868 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1854);
    float _1870 = fma(_1838, _1838, _1860);
    float _1872 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1866);
    float _1874 = _1870 + _1864;
    float _1876 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1880 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1878);
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1886 = rsqrt(_1874);
    float _1888 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1890 = -_1882;
    float _1892 = _1890 + 1.0;
    float _1894 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1896 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1888);
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1894);
    float _1902 = abs(_1892);
    float _1904 = log2(_1902);
    float _1906 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1910 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1912 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1872);
    float _1914 = _1906 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = -_1908;
    float _1918 = fma(_1916, _1712, 1.0);
    float _1920 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1922 = _1886 * _1846;
    float _1924 = _1886 * _1838;
    float _1926 = _1886 * _1850;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1920);
    float _1930 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1932 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1934 = log2(_1918);
    float _1936 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1928);
    float _1938 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1940 = -_1930;
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1940);
    float _1944 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    float _1948 = -_1926;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1942);
    float _1952 = exp2(_1938);
    float _1954 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma(_1950, 0.5, 0.5);
    float _1962 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1954);
    float _1964 = _1924 + 1.0;
    float _1966 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1956);
    float _1968 = 1.0 / _1946;
    float _1970 = fma(_1960, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1972 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1962);
    float _1974 = _1934 * 0.693147182464599609375;
    float _1976 = fma(_1960, _1970, -0.212114393711090087890625);
    float _1978 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = sqrt(_1958);
    float _1982 = -_1924;
    float _1984 = fma(_1952, _1964, _1982);
    float _1986 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1988 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1966);
    float _1990 = fma(_1960, _1976, 1.570728778839111328125);
    float _1992 = fma(_1984, 0.5, 0.5);
    float _1994 = _1986 * _1968;
    float _1996 = _1988 * _1968;
    float _1998 = fma(_1994, 0.5, 0.5);
    float _2000 = fma(_1996, -0.5, 0.5);
    float _2002 = _1980 * 0.636619746685028076171875;
    float _2004 = -_1990;
    float _2006 = fma(_2002, _2004, 1.0);
    float3 _5660 = float3(_1998, _2000, _1978);
    float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5660, float3(0.0), isnan(_5660)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5660, float3(0.0), isnan(_5660)), level(0.0)).x;
    float3 _5671 = float3(_1998, _2000, _1978);
    float4 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5671, float3(0.0), isnan(_5671)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5671, float3(0.0), isnan(_5671)), level(0.0)).xyzw;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _2011.w;
    float2 _5687 = float2(_2006, _1992);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5687, float2(0.0), isnan(_5687)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5687, float2(0.0), isnan(_5687)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _840 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = -_960;
    float _2033 = _2031 + 1.0;
    bool _2035 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2037 = isnan(_1814);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2047 = _840 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2049 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2045);
    float _2051 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2047);
    float _2053 = _2049 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2055 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2051);
    float _2057 = 1.0 / _2053;
    float _2059 = _2055 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2061 = _2059 + _2053;
    float _2063 = _2061 * _2057;
    float _2065 = _2063 * 0.5;
    float _2067 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2069 = fma(_2065, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2067);
    float _2071 = 1.0 / _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2075 = _2071 * _2073;
    float _2077 = _1910 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2079 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2081 = abs(_2075);
    float _2083 = log2(_2081);
    float _2085 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2077);
    float _2087 = _1946 * 0.5;
    float _2089 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2085);
    float _2091 = exp2(_2079);
    bool _2093 = _2075 <= 8000.0;
    bool _2095 = isnan(_2075);
    bool _2097 = _2093 || _2095;
    bool _2099 = isnan(8000.0);
    bool _2101 = _2097 || _2099;
    float _2103 = float(_2101);
    float _2105 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2107 = _2105 + _1946;
    out.gl_Position.x = _1986;
    out.gl_Position.y = _1988;
    out.gl_Position.z = _2105;
    out.gl_Position.w = _1946;
    float _2109 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2111 = _2107 * 0.5;
    float _2113 = exp2(_2109);
    float _2115 = _2105;
    float _2117 = _1988;
    float _2119 = _1946;
    float _2121 = _1986;
    if (!_2043)
    {
        _2115 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2123 = _2115;
    float _2125 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2127 = precise::clamp(_2125, 0.0, 1.0);
    float _2129 = -_2091;
    float _2131 = _2129 + 1.0;
    float _2133 = fma(_1988, -0.5, _2087);
    float _2135 = _2133;
    float _2137 = _2123;
    float _2139 = _2123;
    if (!_2043)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2141 = _2117;
    float _2143 = fma(_2127, -2.0, 3.0);
    float _2145 = _2127 * _2127;
    float _2147 = in.m_87.x;
    float _2149 = _2131 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2151 = _2145 * _2143;
    float _2153 = -_2151;
    float _2155 = _2153 + 1.0;
    float _2157 = fma(_2155, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2151);
    float _2159 = _2103 * _2157;
    float _2161 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2163 = _2033 * _2161;
    float _2165 = precise::clamp(_2163, 0.0, 1.0);
    float _2167 = -_2165;
    float _2169 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2171 = _2169 * _2147;
    float _2173 = _1986 + _1946;
    float _2175 = _2141;
    float _2177 = _2141;
    if (!_2043)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2179 = _2119;
    float _2181 = _2171 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2183 = _2173 * 0.5;
    float _2185 = _2183;
    float _2187 = _2179;
    float _2189 = _2179;
    if (!_2043)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2191 = _2121;
    out.m_89.x = _2181;
    out.m_91.x = _2183;
    out.m_91.y = _2133;
    out.m_91.z = _2111;
    out.m_91.w = _1946;
    float _2193 = _2191;
    float _2195 = _2191;
    if (!_2043)
    {
        _2135 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2197 = _2135;
    float _2199 = _2197;
    float _2201 = _2197;
    if (!_2043)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2203 = _2185;
    float _2205 = _2149 * _2008;
    float _2207 = -_2149;
    float _2209 = _2207 + 1.0;
    float _2211 = _2019 * _2205;
    float _2213 = _2027 * _2205;
    float _2215 = _2019 * _2209;
    float _2217 = fma(_2023, _2211, _2013);
    float _2219 = fma(_2025, _2211, _2015);
    float _2221 = fma(_2019, _2213, _2017);
    out.m_93.x = _2217;
    out.m_93.y = _2219;
    out.m_93.z = _2221;
    out.m_93.w = _2215;
    bool _2223 = !_2043;
    float _2225 = _2203;
    float _2227 = _2203;
    if (!_2223)
    {
        bool _2229 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2231 = isnan(_1814);
        bool _2233 = _2229 || _2231;
        bool _2235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2237 = _2233 || _2235;
        if (!_2237)
        {
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2241 = _1814 + _2239;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2245 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2243;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2251 = 1.0 / _2245;
            float _2253 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2255 = _2253 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2269 = _2241 * _2251;
            float _2271 = precise::clamp(_2269, 0.0, 1.0);
            float _2273 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2277 = fma(_2271, _2249, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2279 = fma(_2271, _2275, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2281 = fma(_2271, _2255, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2283 = fma(_2271, _2259, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2285 = fma(_2271, _2263, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2287 = fma(_2271, _2267, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2227 = _2281;
            _2177 = _2285;
            _2201 = _2277;
            _2139 = _2283;
            _2189 = _2279;
            _2195 = _2287;
            _2289 = true;
        }
        else
        {
            bool _2291 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2293 = isnan(_1814);
            bool _2295 = _2291 || _2293;
            bool _2297 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2299 = _2295 || _2297;
            if (!_2299)
            {
                _2199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2301 = _2199;
            _2201 = _2301;
            if (!_2299)
            {
                _2225 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2303 = _2225;
            _2227 = _2303;
            if (!_2299)
            {
                _2187 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2305 = _2187;
            _2189 = _2305;
            if (!_2299)
            {
                _2137 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2307 = _2137;
            _2139 = _2307;
            if (!_2299)
            {
                _2175 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2309 = _2175;
            _2177 = _2309;
            if (!_2299)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2311 = _2193;
            bool _2313 = !_2299;
            _2195 = _2311;
            if (!_2313)
            {
                bool _2315 = _1814 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2317 = isnan(_1814);
                bool _2319 = _2315 || _2317;
                bool _2321 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2323 = _2319 || _2321;
                if (!_2323)
                {
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2327 = _1814 + _2325;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2331 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2329;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2337 = 1.0 / _2331;
                    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2345 = _2343 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2347 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2349 = _2347 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2351 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2353 = _2351 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2355 = _2327 * _2337;
                    float _2357 = precise::clamp(_2355, 0.0, 1.0);
                    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2361 = _2359 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2363 = fma(_2357, _2335, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2365 = fma(_2357, _2361, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2367 = fma(_2357, _2341, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2369 = fma(_2357, _2345, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2371 = fma(_2357, _2349, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2373 = fma(_2357, _2353, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2227 = _2367;
                    _2177 = _2371;
                    _2201 = _2363;
                    _2139 = _2369;
                    _2189 = _2365;
                    _2195 = _2373;
                    _2289 = true;
                }
                else
                {
                    _2227 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2177 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2139 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2189 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2289 = false;
    float _2375 = _2227;
    float _2377 = _2177;
    float _2379 = _2201;
    float _2381 = _2139;
    float _2383 = _2189;
    float _2385 = _2195;
    float _2387 = fma(_1484, -0.5, 0.5);
    float _2389 = precise::clamp(_2387, 0.0, 1.0);
    float _2391 = -_2375;
    float _2393 = _2391 + _2377;
    float _2395 = -_2379;
    float _2397 = _2395 + _2381;
    float _2399 = -_2383;
    float _2401 = _2399 + _2385;
    bool _2403 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2405 = fma(_2389, _2393, _2375);
    float _2407 = fma(_2389, _2397, _2379);
    float _2409 = fma(_2389, _2401, _2383);
    float _2411 = _2405 * 0.586610972881317138671875;
    out.m_95.x = 0.0;
    float _2413 = fma(_2407, 0.298911988735198974609375, _2411);
    float _2415 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2409, 0.114477999508380889892578125, _2413);
    out.m_53.x = _2415;
    float _2419 = -_2417;
    float _2421 = _2407 + _2419;
    float _2423 = -_2417;
    float _2425 = _2405 + _2423;
    float _2427 = -_2417;
    float _2429 = _2409 + _2427;
    float _2431 = fma(_2421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    float _2433 = fma(_2425, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    float _2435 = fma(_2429, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2417);
    out.m_97.x = _2431;
    out.m_97.y = _2433;
    out.m_97.z = _2435;
    if (!_2403)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2437 = -_1688;
    float _2439 = _2437 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2441 = -_1690;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2445 = -_1692;
    float _2447 = _2445 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2449 = _2439 * _2439;
    float _2451 = fma(_2443, _2443, _2449);
    float _2453 = fma(_2447, _2447, _2451);
    float _2455 = sqrt(_2453);
    float _2457 = rsqrt(_2453);
    float _2459 = -_2455;
    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2463 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2465 = precise::clamp(_2463, 0.0, 1.0);
    float _2467 = _2443 * _2457;
    float _2469 = _2439 * _2457;
    float _2471 = abs(_2465);
    float _2473 = log2(_2471);
    float _2475 = _2447 * _2457;
    float _2477 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2479 = _1484 * _2469;
    float _2481 = -_2469;
    float _2483 = -_2477;
    float _2485 = fma(_2481, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2483);
    float _2487 = fma(_1468, _2467, _2479);
    float _2489 = -_2475;
    float _2491 = fma(_2489, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2485);
    float _2493 = fma(_1486, _2475, _2487);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2499 = _2491 + _2497;
    float _2501 = _2473 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2503 = _2499 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2505 = precise::clamp(_2503, 0.0, 1.0);
    float _2507 = exp2(_2501);
    float _2509 = _2507 * _2505;
    float _2511 = _2495 * _2509;
    float _2513 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2515 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2517 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_95.x = _2513;
    out.m_95.y = _2515;
    out.m_95.z = _2517;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

