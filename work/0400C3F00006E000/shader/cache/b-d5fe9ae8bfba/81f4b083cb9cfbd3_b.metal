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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_81 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
    float4 m_71 [[attribute(12)]];
    float4 m_75 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2332 = false;
    bool _348 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2618 = as_type<float>(_130);
        out.gl_Position.z = _2618;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_53.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    float _166 = as_type<float>(_164);
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_164);
        out.gl_Position.z = _2684;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _136;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = _140 * _174;
    float _190 = _168 * _168;
    float _192 = _170 * _170;
    float _194 = _172 * _172;
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = 0.0;
    float _220 = _208;
    float _222 = _210;
    float _224 = _204;
    float _226 = _202;
    float _228 = _168;
    float _230 = _206;
    if (_214)
    {
        float _232 = rsqrt(_202);
        _218 = _232;
    }
    float _234 = _218;
    if (!_214)
    {
        _220 = 0.0;
    }
    float _236 = _220;
    bool _238 = _212 > 0.0;
    float _240 = _212;
    float _242 = _236;
    if (!_214)
    {
        _240 = 0.0;
        _222 = 0.0;
    }
    float _244 = _240;
    float _246 = _222;
    float _248 = _246;
    float _250 = _244;
    if (!_216)
    {
        _166 = 0.0;
    }
    float _252 = _166;
    float _254 = 0.0;
    float _256 = _252;
    if (_216)
    {
        float _258 = rsqrt(_204);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (_238)
    {
        float _264 = rsqrt(_206);
        _262 = _264;
    }
    float _266 = _262;
    float _268 = _234;
    if (_214)
    {
        float _270 = _234 * _168;
        _248 = _270;
    }
    float _272 = _248;
    if (_214)
    {
        float _274 = _234 * _176;
        _242 = _274;
    }
    float _276 = _242;
    if (_214)
    {
        float _278 = _234 * _182;
        _250 = _278;
    }
    float _280 = _250;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_238)
    {
        _224 = 0.0;
        _226 = 0.0;
    }
    float _284 = _224;
    float _286 = _226;
    float _288 = _286;
    float _290 = _284;
    if (!_216)
    {
        _228 = 0.0;
    }
    float _292 = _228;
    float _294 = _292;
    if (!_238)
    {
        _268 = 0.0;
    }
    float _296 = _268;
    float _298 = _296;
    if (_216)
    {
        float _300 = _260 * _170;
        _256 = _300;
    }
    float _302 = _256;
    if (!_216)
    {
        _230 = 0.0;
    }
    float _304 = _230;
    float _306 = _304;
    if (_216)
    {
        float _308 = _260 * _178;
        _306 = _308;
    }
    float _310 = _306;
    if (_216)
    {
        float _312 = _260 * _184;
        _294 = _312;
    }
    float _314 = _294;
    if (_238)
    {
        float _316 = _266 * _172;
        _288 = _316;
    }
    float _318 = _288;
    if (_238)
    {
        float _320 = _266 * _180;
        _298 = _320;
    }
    float _322 = _298;
    if (_238)
    {
        float _324 = _266 * _186;
        _290 = _324;
    }
    float _326 = _290;
    bool _328 = !_282;
    float _346;
    if (!_328)
    {
        float _330 = in.m_61.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _188;
    }
    _348 = false;
    float _350 = _346;
    float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _354 = in.m_48.x;
    float _356 = in.m_48.y;
    float _358 = in.m_48.z;
    float _360 = -_188;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _350 + _364;
    float _368 = in.m_61.x;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _384 = _350 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _350 + _386;
    float _390 = _188 * _352;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = _362 * _352;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = in.m_61.z;
    float _400 = 1.0 / _376;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    float _410 = in.m_61.y;
    float _412 = precise::min(_392, _396);
    float _414 = _372 * _140;
    float _416 = _178 * _356;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = 1.0 / _404;
    float _424 = fma(_176, _354, _416);
    float _426 = -_412;
    float _428 = _426 + 1.0;
    bool _430 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_350);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _184 * _356;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _454 = _452 != 0;
    float _456 = exp2(_414);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _460 = 1.0 + _458;
    float _462 = _366 * _400;
    float _464 = fma(_182, _354, _442);
    bool _466 = !_446;
    int _468 = _466 ? 0 : 1;
    float _470 = fma(_408, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = _398 * 2.0;
    float _474 = 1.0 / _460;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _486 = _484 != 0;
    float _488 = _368 + _398;
    float _490 = _410 * 2.0;
    float _492 = _388 * _422;
    bool _494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(1.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = _488 + (-1.0);
    float _506 = floor(_472);
    float _508 = -_456;
    float _510 = _508 + 1.0;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    bool _514 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _522 = _518 || _520;
    float _524 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _526;
    float _530 = fma(_512, _410, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _532 = _522 ? _510 : 0.0;
    float _534 = floor(_490);
    float _536 = _368 * 2.0;
    float _538 = _530 * _140;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = _410;
    if (_502)
    {
        float _546 = _532 * _474;
        _158 = _546;
    }
    float _548 = _158;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = fma(_542, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _560 = 1.0 / _380;
    bool _562 = _506 >= 0.0;
    bool _564 = isnan(_506);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    float _572 = fma(_528, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _574 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _576 = isnan(_350);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _586;
    int _590 = _570 ? 0 : 1;
    float _592 = fma(_368, 6.283185482025146484375, _538);
    float _594 = floor(_536);
    bool _596 = _534 > 0.0;
    float _598 = in.m_57.w;
    bool _600 = _534 >= 0.0;
    bool _602 = isnan(_534);
    bool _604 = _600 || _602;
    bool _606 = isnan(0.0);
    bool _608 = _604 || _606;
    float _610 = fma(_186, _358, _464);
    bool _612 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _614 = isnan(_350);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_180, _358, _424);
    bool _626 = !_454;
    int _628 = _626 ? 0 : 1;
    float _630 = _384 * _560;
    float _632 = _410 + _398;
    float _634 = -_622;
    float _636 = _634 + 1.0;
    float _638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _640 = fma(_420, _630, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _642 = fma(_552, _630, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _644 = fma(_556, _630, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _646 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _648 = isnan(_350);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = _584 * _636;
    float _660 = _632 + (-1.0);
    float _662 = -_584;
    float _664 = _662 + 1.0;
    bool _666 = _506 > 0.0;
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _670 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _672 = _656 * _664;
    float _674 = _368 + _410;
    float _676 = -_656;
    float _678 = _676 + 1.0;
    float _680 = _548 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _682 = _674 + (-1.0);
    float _684 = _440 * _678;
    float _686 = fma(_588, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _688 = _548 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _690;
    float _694 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _696 = _470 * _684;
    float _698 = _558 * _684;
    bool _700 = !_450;
    int _702 = _700 ? 0 : 1;
    float _704 = _572 * _684;
    bool _706 = _594 >= 0.0;
    bool _708 = isnan(_594);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _716;
    float _720 = _688 * _638;
    float _722 = fma(_692, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _724 = fma(_718, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _726 = ~_590;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    float _732 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[203].x, _720);
    int _734 = _730;
    if (!_666)
    {
        int _736 = ~_590;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    float _742 = _398 + (-0.5);
    bool _744 = !_486;
    int _746 = _744 ? 0 : 1;
    float _748 = _624 + _598;
    int _750 = _714 ? 0 : 1;
    int _752 = _608 ? 0 : 1;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _764 = _762 != 0;
    float _766 = _680 * _668;
    bool _768 = _594 > 0.0;
    float _770 = -_440;
    float _772 = _770 + 1.0;
    int _774 = ~_752;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = floor(_732);
    int _782 = _778;
    if (!_596)
    {
        int _784 = ~_752;
        int _786 = _784 + 1;
        _782 = _786;
    }
    int _788 = _782;
    float _790 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].x, _696);
    float _792 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].y, _698);
    float _794 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].z, _704);
    bool _796 = !_760;
    int _798 = _796 ? 0 : 1;
    float _800 = in.m_63.x;
    float _802 = in.m_63.y;
    float _804 = in.m_63.z;
    int _806 = ~_750;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[203].z, _766);
    bool _814 = !_756;
    int _816 = _814 ? 0 : 1;
    float _818 = fma(_642, _672, _792);
    int _820 = _810;
    if (!_768)
    {
        int _822 = ~_750;
        int _824 = _822 + 1;
        _820 = _824;
    }
    int _826 = _820;
    float _828 = _732 + 0.25;
    int _830 = abs(_798);
    float _832 = floor(_812);
    int _834 = abs(_816);
    float _836 = -_780;
    float _838 = _732 + _836;
    float _840 = float(_826);
    float _842 = fma(_640, _672, _790);
    float _844 = float(_830);
    float _846 = fma(_644, _672, _794);
    float _848 = float(_740);
    float _850 = floor(_828);
    float _852 = float(_834);
    float _854 = _844 * _840;
    float _856 = fma(_722, _658, _842);
    bool _858 = _838 >= 0.5;
    bool _860 = isnan(_838);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.5);
    bool _866 = _862 || _864;
    float _868 = _410 + (-0.5);
    float _870 = _852 * _848;
    float _872 = _854 * (-2.0);
    float _874 = _732 * 6.283185482025146484375;
    float _876 = _812 + 0.25;
    float _878 = -_832;
    float _880 = _812 + _878;
    float _882 = fma(_872, _802, _802);
    float _884 = fma(_670, _872, _670);
    float _886 = floor(_876);
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].y, _882);
    float _890 = -_850;
    float _892 = _828 + _890;
    int _894 = abs(_468);
    float _896 = _874 * 0.15915493667125701904296875;
    bool _898 = !_482;
    int _900 = _898 ? 0 : 1;
    float _902 = _812 * 6.283185482025146484375;
    bool _904 = _880 >= 0.5;
    bool _906 = isnan(_880);
    bool _908 = _904 || _906;
    bool _910 = isnan(0.5);
    bool _912 = _908 || _910;
    float _914 = fma(_884, _548, _888);
    int _916 = abs(_900);
    float _918 = _896 * 6.283185482025146484375;
    float _920 = sin(_918);
    int _922 = abs(_702);
    float _924 = fma(_686, _658, _818);
    bool _926 = !_866;
    float _928 = _926 ? 0.5 : (-0.5);
    float _930 = fma(_724, _658, _846);
    bool _932 = _892 > 0.5;
    float _934 = -_886;
    float _936 = _876 + _934;
    bool _938 = !_912;
    float _940 = _938 ? 0.5 : (-0.5);
    float _942 = _928 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _944 = _942 * 2.0;
    float _946 = float(_922);
    float _948 = _902 * 0.15915493667125701904296875;
    float _950 = float(_916);
    float _952 = _940 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _954 = _952 * 2.0;
    int _956 = abs(_746);
    float _958 = _946 * _944;
    float _960 = _950 * _954;
    bool _962 = !_478;
    int _964 = _962 ? 0 : 1;
    float _966 = _892;
    float _968 = _936;
    if (_932)
    {
        float _970 = -_892;
        float _972 = _970 + 1.0;
        _966 = _972;
    }
    float _974 = _966;
    int _976 = abs(_628);
    float _978 = _920 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _980 = float(_894);
    float _982 = _948 * 6.283185482025146484375;
    float _984 = sin(_982);
    int _986 = abs(_964);
    float _988 = fma(_974, 4.0, -1.0);
    bool _990 = _936 > 0.5;
    float _992 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].y, _924);
    float _994 = fma(_980, _978, _958);
    float _996 = float(_976);
    float _998 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1000 = float(_986);
    float _1002 = float(_788);
    float _1004 = fma(_996, _998, _994);
    float _1006 = _592 * 0.15915493667125701904296875;
    if (_990)
    {
        float _1008 = -_936;
        float _1010 = _1008 + 1.0;
        _968 = _1010;
    }
    float _1012 = _968;
    float _1014 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1016 = fma(_1004, 3.1415927410125732421875, _800);
    bool _1018 = !_764;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = fma(_1012, 4.0, -1.0);
    float _1024 = fma(_1000, _1014, _960);
    float _1026 = _1006 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    int _1030 = abs(_1020);
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1034 = float(_956);
    float _1036 = _870 * (-2.0);
    float _1038 = _914 * 0.15915493667125701904296875;
    float _1040 = float(_1030);
    float _1042 = _368 + (-0.5);
    float _1044 = fma(_1034, _1032, _1024);
    float _1046 = fma(_1016, _1036, _1016);
    float _1048 = fma(_694, _1036, _694);
    float _1050 = _1040 * _1002;
    float _1052 = fma(_1044, 3.1415927410125732421875, _804);
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1046);
    float _1056 = in.m_65.x;
    float _1058 = in.m_65.y;
    float _1060 = in.m_65.z;
    float _1062 = _1050 * (-2.0);
    float _1064 = _1038 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = fma(_1048, _548, _1054);
    float _1070 = in.m_67.y;
    float _1072 = fma(_1052, _1062, _1052);
    float _1074 = fma(_524, _1062, _524);
    float _1076 = _1068 * 0.15915493667125701904296875;
    float _1078 = in.m_67.x;
    float _1080 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1072);
    float _1082 = abs(_1028);
    float _1084 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1086 = _1038 * 6.283185482025146484375;
    float _1088 = cos(_1086);
    float _1090 = in.m_67.z;
    float _1092 = fma(_1074, _548, _1080);
    float _1094 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1084);
    float _1096 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].x, _856);
    float _1098 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].z, _930);
    float _1100 = _1092 * 0.15915493667125701904296875;
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1096 * _1056;
    float _1108 = _992 * _1058;
    float _1110 = _1098 * _1060;
    float _1112 = _1076 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = -_1094;
    float _1118 = _1116 + _1070;
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1122 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1118);
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1078);
    float _1130 = _1100 * 6.283185482025146484375;
    float _1132 = cos(_1130);
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1090);
    float _1136 = _1120 * _1128;
    float _1138 = _1122 * _1126;
    float _1140 = _1104 * _1066;
    float _1142 = in.m_59.w;
    float _1144 = _1124 * _1134;
    float _1146 = _1104 * _1088;
    float _1148 = _1100 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1114 * _1088;
    float _1154 = _1114 * _1066;
    float _1156 = _1114 * _1132;
    float _1158 = _1104 * _1132;
    float _1160 = _1088 * _1132;
    float _1162 = _1066 * _1132;
    float _1164 = _1156 * _1138;
    float _1166 = _1158 * _1138;
    float _1168 = fma(_1150, _1152, _1140);
    float _1170 = -_1138;
    float _1172 = _1150 * _1170;
    float _1174 = -_1146;
    float _1176 = fma(_1150, _1154, _1174);
    float _1178 = -_1154;
    float _1180 = fma(_1150, _1146, _1178);
    float _1182 = fma(_1168, _1136, _1164);
    float _1184 = fma(_1160, _1136, _1172);
    float _1186 = fma(_1150, _1140, _1152);
    float _1188 = fma(_1180, _1136, _1166);
    float _1190 = fma(_1176, _1144, _1182);
    float _1192 = fma(_1162, _1144, _1184);
    float _1194 = _610 + _1142;
    float _1196 = fma(_1186, _1144, _1188);
    float _1198 = _1190 * _314;
    float _1200 = _1190 * _310;
    float _1202 = _1190 * _302;
    float _1204 = fma(_1192, _280, _1198);
    float _1206 = fma(_1192, _276, _1200);
    float _1208 = fma(_1192, _272, _1202);
    float _1210 = fma(_1196, _326, _1204);
    float _1212 = fma(_1196, _322, _1206);
    float _1214 = fma(_1196, _318, _1208);
    float _1216 = in.m_69.y;
    float _1218 = _1194 + _1210;
    float _1220 = _748 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1218 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1220 + _1226;
    float _1230 = _1224 * _1224;
    float _1232 = fma(_1228, _1228, _1230);
    float _1234 = sqrt(_1232);
    float _1236 = _356 + _1216;
    float _1238 = _1236 + _1214;
    bool _1240 = _1234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1244 = _1234 + _1242;
    float _1246 = _1212;
    float _1248 = _1208;
    float _1250 = _1244;
    float _1252 = _1138;
    float _1254 = _1218;
    float _1256 = _1192;
    float _1258 = _1224;
    float _1260 = _1236;
    float _1262 = _1136;
    float _1264 = _1214;
    if (_1240)
    {
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1266;
    }
    float _1268 = _1246;
    if (_1240)
    {
        float _1270 = rsqrt(_1232);
        _1248 = _1270;
    }
    float _1272 = _1248;
    float _1274 = _1268;
    if (_1240)
    {
        float _1276 = _1244 * _1268;
        _1250 = _1276;
    }
    float _1278 = _1250;
    if (_1240)
    {
        float _1280 = _1238 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1280;
    }
    float _1282 = _1274;
    float _1284 = _1282;
    if (_1240)
    {
        float _1286 = _1278 * 0.15915493667125701904296875;
        _1252 = _1286;
    }
    float _1288 = _1252;
    float _1290 = _1278;
    float _1292 = _1288;
    if (_1240)
    {
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = _1298;
    if (_1240)
    {
        float _1302 = fma(_1298, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = _1304;
    if (!_1240)
    {
        _1284 = _1220;
    }
    float _1308 = _1284;
    float _1310 = _1308;
    if (_1240)
    {
        float _1312 = _1272 * _1304;
        _1306 = _1312;
    }
    float _1314 = _1306;
    float _1316 = _1314;
    if (_1240)
    {
        float _1318 = fma(_1224, _1314, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1254 = _1318;
    }
    float _1320 = _1254;
    float _1322 = _1320;
    if (_1240)
    {
        float _1324 = fma(_1228, _1314, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1310 = _1324;
    }
    float _1326 = _1310;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1330 = _1320 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1334 = _1326 + _1332;
    float _1336 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1338 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4379 = float2(_1338, _1336);
    float _1340 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4379, float2(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4379, float2(0.0), isnan(_4379)), level(0.0)).x;
    float _1342 = _1334;
    float _1344 = _1326;
    if (_1240)
    {
        float _1346 = _1288 * 6.283185482025146484375;
        float _1348 = cos(_1346);
        _1342 = _1348;
    }
    float _1350 = _1342;
    bool _1352 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1354 = isnan(0.5);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1360 = _1356 || _1358;
    if (!_1240)
    {
        _1316 = _1238;
    }
    float _1362 = _1316;
    float _1364 = _1362;
    float _1366 = _1350;
    if (_1240)
    {
        float _1368 = _1350 + (-1.0);
        _1256 = _1368;
    }
    float _1370 = _1256;
    float _1372 = _1370;
    if (_1240)
    {
        float _1374 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1372 = _1374;
    }
    float _1376 = _1372;
    float _1378 = _1376;
    if (_1240)
    {
        float _1380 = fma(_1238, _1350, _1376);
        _1364 = _1380;
    }
    float _1382 = _1364;
    if (!_1360)
    {
        float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1386 = _748 + _1384;
        _1366 = _1386;
    }
    float _1388 = _1366;
    float _1390 = _1388;
    if (!_1360)
    {
        float _1392 = -_1236;
        float _1394 = _1392 + _1382;
        _1292 = _1394;
    }
    float _1396 = _1292;
    float _1398 = fma(_1340, 100.0, _1236);
    float _1400 = fma(_1340, 100.0, _1382);
    float _1402 = _1400;
    if (!_1360)
    {
        float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1406 = _1398 + _1404;
        _1378 = _1406;
    }
    float _1408 = _1378;
    float _1410 = _1408;
    if (!_1360)
    {
        float _1412 = _1408 * _1408;
        _1258 = _1412;
    }
    float _1414 = _1258;
    if (!_1360)
    {
        float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1418 = _1194 + _1416;
        _1410 = _1418;
    }
    float _1420 = _1410;
    float _1422 = _1420;
    if (!_1360)
    {
        float _1424 = fma(_1388, _1388, _1414);
        _1390 = _1424;
    }
    float _1426 = _1390;
    float _1428 = _1426;
    if (!_1360)
    {
        float _1430 = fma(_1420, _1420, _1426);
        _1428 = _1430;
    }
    float _1432 = _1428;
    if (!_1360)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1422 = _1434;
    }
    float _1436 = _1422;
    float _1438 = _1432;
    float _1440 = _1436;
    if (!_1360)
    {
        float _1442 = sqrt(_1432);
        _1438 = _1442;
    }
    float _1444 = _1438;
    float _1446 = _1444;
    if (!_1360)
    {
        float _1448 = precise::min(_1444, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1260 = _1448;
    }
    float _1450 = _1260;
    float _1452 = _1450;
    if (!_1360)
    {
        float _1454 = -_1194;
        float _1456 = _1454 + _1320;
        _1446 = _1456;
    }
    float _1458 = _1446;
    if (!_1360)
    {
        float _1460 = _1450 * _1436;
        _1440 = _1460;
    }
    float _1462 = _1440;
    if (!_1360)
    {
        float _1464 = -_748;
        float _1466 = _1464 + _1326;
        _1452 = _1466;
    }
    float _1468 = _1452;
    if (!_1360)
    {
        float _1470 = fma(_1396, _1462, _1398);
        _1402 = _1470;
    }
    float _1472 = _1402;
    if (!_1360)
    {
        float _1474 = fma(_1468, _1462, _748);
        _1344 = _1474;
    }
    float _1476 = _1344;
    if (!_1360)
    {
        float _1478 = fma(_1458, _1462, _1194);
        _1322 = _1478;
    }
    float _1480 = _1322;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1472 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1476 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1492 = _1480 + _1490;
    float _1494 = _1484 * _1484;
    float _1496 = fma(_1488, _1488, _1494);
    float _1498 = fma(_1492, _1492, _1496);
    float _1500 = rsqrt(_1498);
    float _1502 = sqrt(_1498);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1488 * _1504;
    float _1508 = _1492 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1238;
    float _1526 = _1522;
    float _1528 = _1484;
    float _1530 = _1506;
    float _1532 = _1508;
    if (_1518)
    {
        float _1534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1534;
    }
    float _1536 = _1524;
    float _1538 = _1536;
    if (_1518)
    {
        float _1540 = _1522 * _1536;
        _1526 = _1540;
    }
    float _1542 = _1526;
    if (_1518)
    {
        float _1544 = rsqrt(_1514);
        _1538 = _1544;
    }
    float _1546 = _1538;
    if (_1518)
    {
        float _1548 = _1542 * 0.15915493667125701904296875;
        _1262 = _1548;
    }
    float _1550 = _1262;
    float _1552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1554 = _1414;
    if (_1518)
    {
        float _1556 = _1550 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = precise::max(0.0, _1552);
    float _1564 = _1232;
    float _1566 = _1562;
    if (_1518)
    {
        float _1568 = _1550 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1564 = _1570;
    }
    float _1572 = _1564;
    float _1574 = -_1504;
    float _1576 = -_1562;
    float _1578 = fma(_1484, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1580;
    }
    float _1582 = _1528;
    float _1584 = _1560;
    float _1586 = _1582;
    if (_1518)
    {
        float _1588 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1264 = _1588;
    }
    float _1590 = _1264;
    float _1592 = _1590;
    if (!_1518)
    {
        _1584 = _1578;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (_1518)
    {
        float _1598 = _1546 * _1590;
        _1592 = _1598;
    }
    float _1600 = _1592;
    if (_1518)
    {
        float _1602 = _1572 + (-1.0);
        _1566 = _1602;
    }
    float _1604 = _1566;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1506 * _1600;
        _1530 = _1608;
    }
    float _1610 = _1530;
    if (_1518)
    {
        float _1612 = _1508 * _1600;
        _1532 = _1612;
    }
    float _1614 = _1532;
    if (_1518)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1616;
    }
    float _1618 = _1586;
    float _1620 = _1618;
    if (!_1518)
    {
        _1606 = _1512;
    }
    float _1622 = _1606;
    float _1624 = _1622;
    if (_1518)
    {
        float _1626 = _1614 * _1614;
        _1624 = _1626;
    }
    float _1628 = _1624;
    if (_1518)
    {
        float _1630 = fma(_1578, _1572, _1618);
        _1596 = _1630;
    }
    float _1632 = _1596;
    if (!_1518)
    {
        _1620 = _1510;
    }
    float _1634 = _1620;
    float _1636 = _1634;
    if (_1518)
    {
        float _1638 = _1610 * _1610;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1644 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1646 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1648 = fma(_1632, _1632, _1640);
    float _1650 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1642);
    float _1652 = floor(_1644);
    float _1654 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1646);
    float _1656 = _1648 + _1628;
    float _1658 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1650);
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1662 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1660);
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1668 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1670 = rsqrt(_1656);
    float _1672 = -_1664;
    float _1674 = _1672 + 1.0;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = fma(_1194, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1666);
    float _1684 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1686 = -_1678;
    float _1688 = fma(_1686, _1676, 1.0);
    float _1690 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1692 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1694 = abs(_1674);
    float _1696 = log2(_1694);
    float _1698 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1700 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1690);
    float _1702 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = _1670 * _1610;
    float _1706 = _1670 * _1632;
    float _1708 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1700);
    float _1710 = _1670 * _1614;
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1714 = floor(_1680);
    float _1716 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1720 = -_1712;
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1720);
    float _1724 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1728 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1730 = -_1710;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1722);
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1718);
    float _1736 = log2(_1688);
    float _1738 = fma(_1732, -0.5, 0.5);
    float _1740 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1742 = fma(_1732, 0.5, 0.5);
    float _1744 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1740);
    float _1746 = exp2(_1726);
    float _1748 = -_1652;
    float _1750 = _1644 + _1748;
    float _1752 = -_1714;
    float _1754 = _1680 + _1752;
    float _1756 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1758 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1728);
    float _1760 = _1706 + 1.0;
    float _1762 = fma(_1742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1764 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1756);
    float _1766 = 1.0 / _1744;
    float _1768 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1758);
    float _1770 = fma(_1742, _1762, -0.212114393711090087890625);
    float _1772 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1764);
    float _1774 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1768);
    float _1776 = sqrt(_1738);
    float _1778 = -_1706;
    float _1780 = fma(_1746, _1760, _1778);
    float _1782 = _1736 * 0.693147182464599609375;
    float2 _5140 = float2(_1750, _1754);
    float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5140, float2(0.0), isnan(_5140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5140, float2(0.0), isnan(_5140)), level(0.0)).x;
    float _1786 = fma(_1742, _1770, 1.570728778839111328125);
    float _1788 = fma(_1780, 0.5, 0.5);
    float _1790 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1792 = _1772 * _1766;
    float _1794 = _1774 * _1766;
    float _1796 = fma(_1792, 0.5, 0.5);
    float _1798 = fma(_1794, -0.5, 0.5);
    float _1800 = _1776 * 0.636619746685028076171875;
    float3 _5172 = float3(_1796, _1798, _1790);
    float _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).x;
    float _1804 = -_1786;
    float _1806 = fma(_1800, _1804, 1.0);
    float3 _5188 = float3(_1796, _1798, _1790);
    float4 _1809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5188, float3(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5188, float3(0.0), isnan(_5188)), level(0.0)).xyzw;
    float _1811 = _1809.x;
    float _1813 = _1809.y;
    float _1815 = _1809.z;
    float _1817 = _1809.w;
    float2 _5204 = float2(_1806, _1788);
    float3 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5204, float2(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5204, float2(0.0), isnan(_5204)), level(0.0)).xyz;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1831 = in.m_71.y;
    float _1833 = -_1094;
    float _1835 = -_1070;
    bool _1837 = _1833 != _1835;
    bool _1839 = isnan(_1833);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan(_1835);
    bool _1845 = _1841 || _1843;
    float _1847 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = _1829 * _368;
    float _1851 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1857 = _1078 == 0.0;
    bool _1859 = !_1845;
    bool _1861 = _1857 && _1859;
    float _1863 = _1851 * _368;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1867 = _1865 != 0;
    float _1869 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1873 = _1871 != 0;
    float _1875 = trunc(_1849);
    int _1877 = int(_1875);
    float _1879 = in.m_73.x;
    float _1881 = in.m_73.y;
    float _1883 = in.m_73.z;
    bool _1885 = _1090 == 0.0;
    bool _1887 = _1885 && _1861;
    float _1889 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    bool _1891 = _368 > 0.5;
    bool _1893 = _1891 && _1867;
    bool _1895 = _410 > 0.5;
    float _1897 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1889);
    float _1899 = trunc(_1863);
    int _1901 = int(_1899);
    float _1903 = -_1831;
    float _1905 = _1903 + 1.0;
    float _1907 = _1831;
    if (_1873)
    {
        float _1909 = _1895 ? _1905 : _1831;
        _1907 = _1909;
    }
    float _1911 = _1907;
    float _1913 = exp2(_1847);
    int _1915 = _1877 << 4;
    int _1917 = _1915 + 1712;
    float _1919 = in.m_71.x;
    float _1921 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _1924 = uint(int(uint(_1917) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = _1901 << 4;
    int _1942 = _1940 + 1968;
    float _1944 = _1881;
    float _1946 = _1879;
    float _1948 = _1883;
    if (!_1887)
    {
        float _1950 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1881);
        _1944 = _1950;
    }
    float _1952 = _1944;
    if (!_1887)
    {
        float _1954 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1879);
        _1946 = _1954;
    }
    float _1956 = _1946;
    if (!_1887)
    {
        float _1958 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1883);
        _1948 = _1958;
    }
    float _1960 = _1948;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1964 = _1917 + 8;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
    int _1970 = int(_1966) & 3;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[int(_1968)][_1970];
    float _1974 = _1156 * _1952;
    float _1976 = -_1952;
    float _1978 = _1150 * _1976;
    float _1980 = _1158 * _1952;
    float _1982 = -_1913;
    float _1984 = _1982 + 1.0;
    float _1986 = fma(_1168, _1956, _1974);
    float _1988 = fma(_1160, _1956, _1978);
    float _1990 = fma(_1180, _1956, _1980);
    uint _1992 = uint(int(uint(_1942) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    float _2008 = fma(_1176, _1960, _1986);
    float _2010 = fma(_1162, _1960, _1988);
    float _2012 = fma(_1186, _1960, _1990);
    float _2014 = in.m_75.y;
    float _2016 = _2008 * _310;
    float _2018 = _2008 * _314;
    float _2020 = _1919;
    if (!_1867)
    {
        _544 = _1919;
    }
    float _2022 = _544;
    float _2024 = _2022;
    if (_1893)
    {
        float _2026 = -_1919;
        float _2028 = _2026 + 1.0;
        _2020 = _2028;
    }
    float _2030 = _2020;
    float _2032 = fma(_2010, _276, _2016);
    float _2034 = fma(_2010, _280, _2018);
    int _2036 = _1942 + 8;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    float _2046 = in.m_75.w;
    if (_1867)
    {
        _2024 = _2030;
    }
    float _2048 = _2024;
    float _2050 = fma(_2012, _322, _2032);
    float _2052 = in.m_75.z;
    float _2054 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2058 = _1921 * _1962;
    bool _2060 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2062 = isnan(_1502);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2068 = _2064 || _2066;
    float _2070 = _2056 * _1853;
    out.m_77.x = _2070;
    out.m_77.y = _2058;
    float _2072 = in.m_69.x;
    float _2074 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2076 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2078 = _2056;
    float _2080 = _2072;
    if (!_2068)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2082 = _2078;
    out.m_79.y = _2014;
    float _2084 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2046;
    float _2088 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_79.z = _2052;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2092 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_81.x = _2084;
    out.m_81.y = _2086;
    out.m_81.z = _2090;
    out.m_81.w = _1855;
    float _2094 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2100 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2102 = _2008 * _302;
    float _2104 = fma(_2012, _326, _2034);
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = fma(_2010, _272, _2102);
    out.m_83.x = _2096;
    out.m_83.y = _2100;
    out.m_83.z = _2106;
    float _2110 = fma(_2012, _318, _2108);
    float _2112 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2114 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2112);
    out.m_85.x = _2050;
    out.m_85.y = _2110;
    out.m_85.z = _2104;
    float _2116 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2114);
    float _2118 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2120 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2122 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2118);
    float _2124 = 1.0 / _2120;
    float _2126 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2122);
    float _2128 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1897);
    float _2130 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.gl_Position.x = _1772;
    out.gl_Position.y = _1774;
    out.gl_Position.z = _2128;
    out.gl_Position.w = _1744;
    float _2132 = _2130 + _2120;
    float _2134 = _2132 * _2124;
    float _2136 = _2134 * 0.5;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2138);
    float _2142 = -_2054;
    float _2144 = _2142 + 1.0;
    float _2146 = _1772;
    float _2148 = _2128;
    float _2150 = _2144;
    float _2152 = _2082;
    float _2154 = _2082;
    if (!_2068)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2156 = _2146;
    float _2158 = 1.0 / _2140;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2162 = _2158 * _2160;
    float _2164 = abs(_2162);
    float _2166 = log2(_2164);
    bool _2168 = _2162 <= 8000.0;
    bool _2170 = isnan(_2162);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(8000.0);
    bool _2176 = _2172 || _2174;
    float _2178 = float(_2176);
    float _2180 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2182 = exp2(_2180);
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2186 = precise::clamp(_2184, 0.0, 1.0);
    float _2188 = fma(_2186, -2.0, 3.0);
    float _2190 = _2186 * _2186;
    float _2192 = _2190 * _2188;
    float _2194 = in.m_75.x;
    float _2196 = -_2192;
    float _2198 = _2196 + 1.0;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2192);
    float _2202 = _2128 + _1744;
    float _2204 = _2178 * _2200;
    float _2206 = _2202 * 0.5;
    float _2208 = _2156;
    float _2210 = _2156;
    if (!_2068)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2212 = _2148;
    float _2214 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_87.z = _2206;
    out.m_87.w = _1744;
    out.m_79.x = _2194;
    float _2216 = _2194;
    float _2218 = _2212;
    float _2220 = _2212;
    if (!_2068)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2222 = _2216;
    float _2224 = -_1784;
    float _2226 = _2224 + 1.0;
    float _2228 = _2226 * _2214;
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -_2230;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2236 = _2234 * _2072;
    float _2238 = _2222;
    float _2240 = _2222;
    if (!_2068)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2242 = _2080;
    float _2244 = _2054 * _1802;
    float _2246 = _2236 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2248 = _1817 * _2244;
    float _2250 = _1817 * _2144;
    out.m_89.x = _2246;
    float _2252 = _2242;
    float _2254 = _2242;
    if (!_2068)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2256 = _2150;
    float _2258 = _1827 * _2244;
    float _2260 = fma(_1823, _2248, _1811);
    float _2262 = fma(_1825, _2248, _1813);
    float _2264 = fma(_1817, _2258, _1815);
    out.m_91.x = _2260;
    out.m_91.y = _2262;
    out.m_91.z = _2264;
    out.m_91.w = _2250;
    bool _2266 = !_2068;
    float _2268 = _2256;
    float _2270 = _2256;
    if (!_2266)
    {
        bool _2272 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2274 = isnan(_1502);
        bool _2276 = _2272 || _2274;
        bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2280 = _2276 || _2278;
        if (!_2280)
        {
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2284 = _1502 + _2282;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2286;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2298 = 1.0 / _2288;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2312 = _2284 * _2298;
            float _2314 = precise::clamp(_2312, 0.0, 1.0);
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2320 = fma(_2314, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2322 = fma(_2314, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2324 = fma(_2314, _2302, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2326 = fma(_2314, _2318, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2328 = fma(_2314, _2306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2330 = fma(_2314, _2310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2154 = _2322;
            _2270 = _2328;
            _2220 = _2320;
            _2254 = _2326;
            _2210 = _2324;
            _2240 = _2330;
            _2332 = true;
        }
        else
        {
            bool _2334 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2336 = isnan(_1502);
            bool _2338 = _2334 || _2336;
            bool _2340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2342 = _2338 || _2340;
            if (!_2342)
            {
                _2218 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2344 = _2218;
            _2220 = _2344;
            if (!_2342)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2346 = _2152;
            _2154 = _2346;
            if (!_2342)
            {
                _2208 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2348 = _2208;
            _2210 = _2348;
            if (!_2342)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2350 = _2252;
            _2254 = _2350;
            if (!_2342)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2352 = _2268;
            _2270 = _2352;
            if (!_2342)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2354 = _2238;
            bool _2356 = !_2342;
            _2240 = _2354;
            if (!_2356)
            {
                bool _2358 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2360 = isnan(_1502);
                bool _2362 = _2358 || _2360;
                bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2366 = _2362 || _2364;
                if (!_2366)
                {
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2370 = _1502 + _2368;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2372;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2384 = 1.0 / _2374;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2398 = _2370 * _2384;
                    float _2400 = precise::clamp(_2398, 0.0, 1.0);
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2406 = fma(_2400, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2408 = fma(_2400, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2410 = fma(_2400, _2388, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2412 = fma(_2400, _2404, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2414 = fma(_2400, _2392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2416 = fma(_2400, _2396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2154 = _2408;
                    _2270 = _2414;
                    _2220 = _2406;
                    _2254 = _2412;
                    _2210 = _2410;
                    _2240 = _2416;
                    _2332 = true;
                }
                else
                {
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2220 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2210 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2332 = false;
    float _2418 = _2154;
    float _2420 = _2270;
    float _2422 = _2220;
    float _2424 = _2254;
    float _2426 = _2210;
    float _2428 = _2240;
    float _2430 = fma(_2110, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2418;
    float _2436 = _2434 + _2420;
    float _2438 = -_2422;
    float _2440 = _2438 + _2424;
    float _2442 = -_2426;
    float _2444 = _2442 + _2428;
    bool _2446 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2448 = fma(_2432, _2436, _2418);
    float _2450 = fma(_2432, _2440, _2422);
    float _2452 = fma(_2432, _2444, _2426);
    float _2454 = _2448 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2456 = fma(_2450, 0.298911988735198974609375, _2454);
    float _2458 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2460 = fma(_2452, 0.114477999508380889892578125, _2456);
    out.m_89.w = _2458;
    float _2462 = -_2460;
    float _2464 = _2450 + _2462;
    float _2466 = -_2460;
    float _2468 = _2448 + _2466;
    float _2470 = -_2460;
    float _2472 = _2452 + _2470;
    out.m_93.x = 0.0;
    float _2474 = fma(_2464, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    float _2476 = fma(_2468, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    float _2478 = fma(_2472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    out.m_95.x = _2474;
    out.m_95.y = _2476;
    out.m_95.z = _2478;
    if (!_2446)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2480 = -_1472;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2484 = -_1476;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2488 = -_1480;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2492 = _2482 * _2482;
    float _2494 = fma(_2486, _2486, _2492);
    float _2496 = fma(_2490, _2490, _2494);
    float _2498 = sqrt(_2496);
    float _2500 = rsqrt(_2496);
    float _2502 = -_2498;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2506 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2486 * _2500;
    float _2512 = _2482 * _2500;
    float _2514 = abs(_2508);
    float _2516 = log2(_2514);
    float _2518 = _2490 * _2500;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = _2110 * _2512;
    float _2524 = -_2512;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = fma(_2050, _2510, _2522);
    float _2532 = -_2518;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = fma(_2104, _2518, _2530);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2542 = _2534 + _2540;
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2546 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = exp2(_2544);
    float _2552 = _2550 * _2548;
    float _2554 = _2538 * _2552;
    float _2556 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2556;
    out.m_93.y = _2558;
    out.m_93.z = _2560;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2332 = false;
    bool _348 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2618 = as_type<float>(_130);
        out.gl_Position.z = _2618;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_53.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    float _166 = as_type<float>(_164);
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_164);
        out.gl_Position.z = _2684;
    }
    if (_156)
    {
        return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _136;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = _140 * _174;
    float _190 = _168 * _168;
    float _192 = _170 * _170;
    float _194 = _172 * _172;
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = 0.0;
    float _220 = _208;
    float _222 = _210;
    float _224 = _204;
    float _226 = _202;
    float _228 = _168;
    float _230 = _206;
    if (_214)
    {
        float _232 = rsqrt(_202);
        _218 = _232;
    }
    float _234 = _218;
    if (!_214)
    {
        _220 = 0.0;
    }
    float _236 = _220;
    bool _238 = _212 > 0.0;
    float _240 = _212;
    float _242 = _236;
    if (!_214)
    {
        _240 = 0.0;
        _222 = 0.0;
    }
    float _244 = _240;
    float _246 = _222;
    float _248 = _246;
    float _250 = _244;
    if (!_216)
    {
        _166 = 0.0;
    }
    float _252 = _166;
    float _254 = 0.0;
    float _256 = _252;
    if (_216)
    {
        float _258 = rsqrt(_204);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (_238)
    {
        float _264 = rsqrt(_206);
        _262 = _264;
    }
    float _266 = _262;
    float _268 = _234;
    if (_214)
    {
        float _270 = _234 * _168;
        _248 = _270;
    }
    float _272 = _248;
    if (_214)
    {
        float _274 = _234 * _176;
        _242 = _274;
    }
    float _276 = _242;
    if (_214)
    {
        float _278 = _234 * _182;
        _250 = _278;
    }
    float _280 = _250;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_238)
    {
        _224 = 0.0;
        _226 = 0.0;
    }
    float _284 = _224;
    float _286 = _226;
    float _288 = _286;
    float _290 = _284;
    if (!_216)
    {
        _228 = 0.0;
    }
    float _292 = _228;
    float _294 = _292;
    if (!_238)
    {
        _268 = 0.0;
    }
    float _296 = _268;
    float _298 = _296;
    if (_216)
    {
        float _300 = _260 * _170;
        _256 = _300;
    }
    float _302 = _256;
    if (!_216)
    {
        _230 = 0.0;
    }
    float _304 = _230;
    float _306 = _304;
    if (_216)
    {
        float _308 = _260 * _178;
        _306 = _308;
    }
    float _310 = _306;
    if (_216)
    {
        float _312 = _260 * _184;
        _294 = _312;
    }
    float _314 = _294;
    if (_238)
    {
        float _316 = _266 * _172;
        _288 = _316;
    }
    float _318 = _288;
    if (_238)
    {
        float _320 = _266 * _180;
        _298 = _320;
    }
    float _322 = _298;
    if (_238)
    {
        float _324 = _266 * _186;
        _290 = _324;
    }
    float _326 = _290;
    bool _328 = !_282;
    float _346;
    if (!_328)
    {
        float _330 = in.m_61.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _188;
    }
    _348 = false;
    float _350 = _346;
    float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _354 = in.m_48.x;
    float _356 = in.m_48.y;
    float _358 = in.m_48.z;
    float _360 = -_188;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _350 + _364;
    float _368 = in.m_61.x;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _384 = _350 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _350 + _386;
    float _390 = _188 * _352;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = _362 * _352;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = in.m_61.z;
    float _400 = 1.0 / _376;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    float _410 = in.m_61.y;
    float _412 = precise::min(_392, _396);
    float _414 = _372 * _140;
    float _416 = _178 * _356;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = 1.0 / _404;
    float _424 = fma(_176, _354, _416);
    float _426 = -_412;
    float _428 = _426 + 1.0;
    bool _430 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_350);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _184 * _356;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _454 = _452 != 0;
    float _456 = exp2(_414);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _460 = 1.0 + _458;
    float _462 = _366 * _400;
    float _464 = fma(_182, _354, _442);
    bool _466 = !_446;
    int _468 = _466 ? 0 : 1;
    float _470 = fma(_408, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = _398 * 2.0;
    float _474 = 1.0 / _460;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _486 = _484 != 0;
    float _488 = _368 + _398;
    float _490 = _410 * 2.0;
    float _492 = _388 * _422;
    bool _494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(1.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = _488 + (-1.0);
    float _506 = floor(_472);
    float _508 = -_456;
    float _510 = _508 + 1.0;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    bool _514 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _522 = _518 || _520;
    float _524 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _526;
    float _530 = fma(_512, _410, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _532 = _522 ? _510 : 0.0;
    float _534 = floor(_490);
    float _536 = _368 * 2.0;
    float _538 = _530 * _140;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = _410;
    if (_502)
    {
        float _546 = _532 * _474;
        _158 = _546;
    }
    float _548 = _158;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = fma(_542, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _560 = 1.0 / _380;
    bool _562 = _506 >= 0.0;
    bool _564 = isnan(_506);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    float _572 = fma(_528, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _574 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _576 = isnan(_350);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _586;
    int _590 = _570 ? 0 : 1;
    float _592 = fma(_368, 6.283185482025146484375, _538);
    float _594 = floor(_536);
    bool _596 = _534 > 0.0;
    float _598 = in.m_57.w;
    bool _600 = _534 >= 0.0;
    bool _602 = isnan(_534);
    bool _604 = _600 || _602;
    bool _606 = isnan(0.0);
    bool _608 = _604 || _606;
    float _610 = fma(_186, _358, _464);
    bool _612 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _614 = isnan(_350);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_180, _358, _424);
    bool _626 = !_454;
    int _628 = _626 ? 0 : 1;
    float _630 = _384 * _560;
    float _632 = _410 + _398;
    float _634 = -_622;
    float _636 = _634 + 1.0;
    float _638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _640 = fma(_420, _630, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _642 = fma(_552, _630, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _644 = fma(_556, _630, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _646 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _648 = isnan(_350);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = _584 * _636;
    float _660 = _632 + (-1.0);
    float _662 = -_584;
    float _664 = _662 + 1.0;
    bool _666 = _506 > 0.0;
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _670 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _672 = _656 * _664;
    float _674 = _368 + _410;
    float _676 = -_656;
    float _678 = _676 + 1.0;
    float _680 = _548 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _682 = _674 + (-1.0);
    float _684 = _440 * _678;
    float _686 = fma(_588, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _688 = _548 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _690;
    float _694 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _696 = _470 * _684;
    float _698 = _558 * _684;
    bool _700 = !_450;
    int _702 = _700 ? 0 : 1;
    float _704 = _572 * _684;
    bool _706 = _594 >= 0.0;
    bool _708 = isnan(_594);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _716;
    float _720 = _688 * _638;
    float _722 = fma(_692, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _724 = fma(_718, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _726 = ~_590;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    float _732 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[203].x, _720);
    int _734 = _730;
    if (!_666)
    {
        int _736 = ~_590;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    float _742 = _398 + (-0.5);
    bool _744 = !_486;
    int _746 = _744 ? 0 : 1;
    float _748 = _624 + _598;
    int _750 = _714 ? 0 : 1;
    int _752 = _608 ? 0 : 1;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _764 = _762 != 0;
    float _766 = _680 * _668;
    bool _768 = _594 > 0.0;
    float _770 = -_440;
    float _772 = _770 + 1.0;
    int _774 = ~_752;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = floor(_732);
    int _782 = _778;
    if (!_596)
    {
        int _784 = ~_752;
        int _786 = _784 + 1;
        _782 = _786;
    }
    int _788 = _782;
    float _790 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].x, _696);
    float _792 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].y, _698);
    float _794 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].z, _704);
    bool _796 = !_760;
    int _798 = _796 ? 0 : 1;
    float _800 = in.m_63.x;
    float _802 = in.m_63.y;
    float _804 = in.m_63.z;
    int _806 = ~_750;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[203].z, _766);
    bool _814 = !_756;
    int _816 = _814 ? 0 : 1;
    float _818 = fma(_642, _672, _792);
    int _820 = _810;
    if (!_768)
    {
        int _822 = ~_750;
        int _824 = _822 + 1;
        _820 = _824;
    }
    int _826 = _820;
    float _828 = _732 + 0.25;
    int _830 = abs(_798);
    float _832 = floor(_812);
    int _834 = abs(_816);
    float _836 = -_780;
    float _838 = _732 + _836;
    float _840 = float(_826);
    float _842 = fma(_640, _672, _790);
    float _844 = float(_830);
    float _846 = fma(_644, _672, _794);
    float _848 = float(_740);
    float _850 = floor(_828);
    float _852 = float(_834);
    float _854 = _844 * _840;
    float _856 = fma(_722, _658, _842);
    bool _858 = _838 >= 0.5;
    bool _860 = isnan(_838);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.5);
    bool _866 = _862 || _864;
    float _868 = _410 + (-0.5);
    float _870 = _852 * _848;
    float _872 = _854 * (-2.0);
    float _874 = _732 * 6.283185482025146484375;
    float _876 = _812 + 0.25;
    float _878 = -_832;
    float _880 = _812 + _878;
    float _882 = fma(_872, _802, _802);
    float _884 = fma(_670, _872, _670);
    float _886 = floor(_876);
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].y, _882);
    float _890 = -_850;
    float _892 = _828 + _890;
    int _894 = abs(_468);
    float _896 = _874 * 0.15915493667125701904296875;
    bool _898 = !_482;
    int _900 = _898 ? 0 : 1;
    float _902 = _812 * 6.283185482025146484375;
    bool _904 = _880 >= 0.5;
    bool _906 = isnan(_880);
    bool _908 = _904 || _906;
    bool _910 = isnan(0.5);
    bool _912 = _908 || _910;
    float _914 = fma(_884, _548, _888);
    int _916 = abs(_900);
    float _918 = _896 * 6.283185482025146484375;
    float _920 = sin(_918);
    int _922 = abs(_702);
    float _924 = fma(_686, _658, _818);
    bool _926 = !_866;
    float _928 = _926 ? 0.5 : (-0.5);
    float _930 = fma(_724, _658, _846);
    bool _932 = _892 > 0.5;
    float _934 = -_886;
    float _936 = _876 + _934;
    bool _938 = !_912;
    float _940 = _938 ? 0.5 : (-0.5);
    float _942 = _928 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _944 = _942 * 2.0;
    float _946 = float(_922);
    float _948 = _902 * 0.15915493667125701904296875;
    float _950 = float(_916);
    float _952 = _940 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _954 = _952 * 2.0;
    int _956 = abs(_746);
    float _958 = _946 * _944;
    float _960 = _950 * _954;
    bool _962 = !_478;
    int _964 = _962 ? 0 : 1;
    float _966 = _892;
    float _968 = _936;
    if (_932)
    {
        float _970 = -_892;
        float _972 = _970 + 1.0;
        _966 = _972;
    }
    float _974 = _966;
    int _976 = abs(_628);
    float _978 = _920 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _980 = float(_894);
    float _982 = _948 * 6.283185482025146484375;
    float _984 = sin(_982);
    int _986 = abs(_964);
    float _988 = fma(_974, 4.0, -1.0);
    bool _990 = _936 > 0.5;
    float _992 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].y, _924);
    float _994 = fma(_980, _978, _958);
    float _996 = float(_976);
    float _998 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1000 = float(_986);
    float _1002 = float(_788);
    float _1004 = fma(_996, _998, _994);
    float _1006 = _592 * 0.15915493667125701904296875;
    if (_990)
    {
        float _1008 = -_936;
        float _1010 = _1008 + 1.0;
        _968 = _1010;
    }
    float _1012 = _968;
    float _1014 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1016 = fma(_1004, 3.1415927410125732421875, _800);
    bool _1018 = !_764;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = fma(_1012, 4.0, -1.0);
    float _1024 = fma(_1000, _1014, _960);
    float _1026 = _1006 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    int _1030 = abs(_1020);
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1034 = float(_956);
    float _1036 = _870 * (-2.0);
    float _1038 = _914 * 0.15915493667125701904296875;
    float _1040 = float(_1030);
    float _1042 = _368 + (-0.5);
    float _1044 = fma(_1034, _1032, _1024);
    float _1046 = fma(_1016, _1036, _1016);
    float _1048 = fma(_694, _1036, _694);
    float _1050 = _1040 * _1002;
    float _1052 = fma(_1044, 3.1415927410125732421875, _804);
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1046);
    float _1056 = in.m_65.x;
    float _1058 = in.m_65.y;
    float _1060 = in.m_65.z;
    float _1062 = _1050 * (-2.0);
    float _1064 = _1038 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = fma(_1048, _548, _1054);
    float _1070 = in.m_67.y;
    float _1072 = fma(_1052, _1062, _1052);
    float _1074 = fma(_524, _1062, _524);
    float _1076 = _1068 * 0.15915493667125701904296875;
    float _1078 = in.m_67.x;
    float _1080 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1072);
    float _1082 = abs(_1028);
    float _1084 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1086 = _1038 * 6.283185482025146484375;
    float _1088 = cos(_1086);
    float _1090 = in.m_67.z;
    float _1092 = fma(_1074, _548, _1080);
    float _1094 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1084);
    float _1096 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].x, _856);
    float _1098 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].z, _930);
    float _1100 = _1092 * 0.15915493667125701904296875;
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1096 * _1056;
    float _1108 = _992 * _1058;
    float _1110 = _1098 * _1060;
    float _1112 = _1076 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = -_1094;
    float _1118 = _1116 + _1070;
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1122 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1118);
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1078);
    float _1130 = _1100 * 6.283185482025146484375;
    float _1132 = cos(_1130);
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1090);
    float _1136 = _1120 * _1128;
    float _1138 = _1122 * _1126;
    float _1140 = _1104 * _1066;
    float _1142 = in.m_59.w;
    float _1144 = _1124 * _1134;
    float _1146 = _1104 * _1088;
    float _1148 = _1100 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1114 * _1088;
    float _1154 = _1114 * _1066;
    float _1156 = _1114 * _1132;
    float _1158 = _1104 * _1132;
    float _1160 = _1088 * _1132;
    float _1162 = _1066 * _1132;
    float _1164 = _1156 * _1138;
    float _1166 = _1158 * _1138;
    float _1168 = fma(_1150, _1152, _1140);
    float _1170 = -_1138;
    float _1172 = _1150 * _1170;
    float _1174 = -_1146;
    float _1176 = fma(_1150, _1154, _1174);
    float _1178 = -_1154;
    float _1180 = fma(_1150, _1146, _1178);
    float _1182 = fma(_1168, _1136, _1164);
    float _1184 = fma(_1160, _1136, _1172);
    float _1186 = fma(_1150, _1140, _1152);
    float _1188 = fma(_1180, _1136, _1166);
    float _1190 = fma(_1176, _1144, _1182);
    float _1192 = fma(_1162, _1144, _1184);
    float _1194 = _610 + _1142;
    float _1196 = fma(_1186, _1144, _1188);
    float _1198 = _1190 * _314;
    float _1200 = _1190 * _310;
    float _1202 = _1190 * _302;
    float _1204 = fma(_1192, _280, _1198);
    float _1206 = fma(_1192, _276, _1200);
    float _1208 = fma(_1192, _272, _1202);
    float _1210 = fma(_1196, _326, _1204);
    float _1212 = fma(_1196, _322, _1206);
    float _1214 = fma(_1196, _318, _1208);
    float _1216 = in.m_69.y;
    float _1218 = _1194 + _1210;
    float _1220 = _748 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1218 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1220 + _1226;
    float _1230 = _1224 * _1224;
    float _1232 = fma(_1228, _1228, _1230);
    float _1234 = sqrt(_1232);
    float _1236 = _356 + _1216;
    float _1238 = _1236 + _1214;
    bool _1240 = _1234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1244 = _1234 + _1242;
    float _1246 = _1212;
    float _1248 = _1208;
    float _1250 = _1244;
    float _1252 = _1138;
    float _1254 = _1218;
    float _1256 = _1192;
    float _1258 = _1224;
    float _1260 = _1236;
    float _1262 = _1136;
    float _1264 = _1214;
    if (_1240)
    {
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1266;
    }
    float _1268 = _1246;
    if (_1240)
    {
        float _1270 = rsqrt(_1232);
        _1248 = _1270;
    }
    float _1272 = _1248;
    float _1274 = _1268;
    if (_1240)
    {
        float _1276 = _1244 * _1268;
        _1250 = _1276;
    }
    float _1278 = _1250;
    if (_1240)
    {
        float _1280 = _1238 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1280;
    }
    float _1282 = _1274;
    float _1284 = _1282;
    if (_1240)
    {
        float _1286 = _1278 * 0.15915493667125701904296875;
        _1252 = _1286;
    }
    float _1288 = _1252;
    float _1290 = _1278;
    float _1292 = _1288;
    if (_1240)
    {
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = _1298;
    if (_1240)
    {
        float _1302 = fma(_1298, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = _1304;
    if (!_1240)
    {
        _1284 = _1220;
    }
    float _1308 = _1284;
    float _1310 = _1308;
    if (_1240)
    {
        float _1312 = _1272 * _1304;
        _1306 = _1312;
    }
    float _1314 = _1306;
    float _1316 = _1314;
    if (_1240)
    {
        float _1318 = fma(_1224, _1314, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1254 = _1318;
    }
    float _1320 = _1254;
    float _1322 = _1320;
    if (_1240)
    {
        float _1324 = fma(_1228, _1314, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1310 = _1324;
    }
    float _1326 = _1310;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1330 = _1320 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1334 = _1326 + _1332;
    float _1336 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1338 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4379 = float2(_1338, _1336);
    float _1340 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4379, float2(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4379, float2(0.0), isnan(_4379)), level(0.0)).x;
    float _1342 = _1334;
    float _1344 = _1326;
    if (_1240)
    {
        float _1346 = _1288 * 6.283185482025146484375;
        float _1348 = cos(_1346);
        _1342 = _1348;
    }
    float _1350 = _1342;
    bool _1352 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1354 = isnan(0.5);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1360 = _1356 || _1358;
    if (!_1240)
    {
        _1316 = _1238;
    }
    float _1362 = _1316;
    float _1364 = _1362;
    float _1366 = _1350;
    if (_1240)
    {
        float _1368 = _1350 + (-1.0);
        _1256 = _1368;
    }
    float _1370 = _1256;
    float _1372 = _1370;
    if (_1240)
    {
        float _1374 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1372 = _1374;
    }
    float _1376 = _1372;
    float _1378 = _1376;
    if (_1240)
    {
        float _1380 = fma(_1238, _1350, _1376);
        _1364 = _1380;
    }
    float _1382 = _1364;
    if (!_1360)
    {
        float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1386 = _748 + _1384;
        _1366 = _1386;
    }
    float _1388 = _1366;
    float _1390 = _1388;
    if (!_1360)
    {
        float _1392 = -_1236;
        float _1394 = _1392 + _1382;
        _1292 = _1394;
    }
    float _1396 = _1292;
    float _1398 = fma(_1340, 100.0, _1236);
    float _1400 = fma(_1340, 100.0, _1382);
    float _1402 = _1400;
    if (!_1360)
    {
        float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1406 = _1398 + _1404;
        _1378 = _1406;
    }
    float _1408 = _1378;
    float _1410 = _1408;
    if (!_1360)
    {
        float _1412 = _1408 * _1408;
        _1258 = _1412;
    }
    float _1414 = _1258;
    if (!_1360)
    {
        float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1418 = _1194 + _1416;
        _1410 = _1418;
    }
    float _1420 = _1410;
    float _1422 = _1420;
    if (!_1360)
    {
        float _1424 = fma(_1388, _1388, _1414);
        _1390 = _1424;
    }
    float _1426 = _1390;
    float _1428 = _1426;
    if (!_1360)
    {
        float _1430 = fma(_1420, _1420, _1426);
        _1428 = _1430;
    }
    float _1432 = _1428;
    if (!_1360)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1422 = _1434;
    }
    float _1436 = _1422;
    float _1438 = _1432;
    float _1440 = _1436;
    if (!_1360)
    {
        float _1442 = sqrt(_1432);
        _1438 = _1442;
    }
    float _1444 = _1438;
    float _1446 = _1444;
    if (!_1360)
    {
        float _1448 = precise::min(_1444, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1260 = _1448;
    }
    float _1450 = _1260;
    float _1452 = _1450;
    if (!_1360)
    {
        float _1454 = -_1194;
        float _1456 = _1454 + _1320;
        _1446 = _1456;
    }
    float _1458 = _1446;
    if (!_1360)
    {
        float _1460 = _1450 * _1436;
        _1440 = _1460;
    }
    float _1462 = _1440;
    if (!_1360)
    {
        float _1464 = -_748;
        float _1466 = _1464 + _1326;
        _1452 = _1466;
    }
    float _1468 = _1452;
    if (!_1360)
    {
        float _1470 = fma(_1396, _1462, _1398);
        _1402 = _1470;
    }
    float _1472 = _1402;
    if (!_1360)
    {
        float _1474 = fma(_1468, _1462, _748);
        _1344 = _1474;
    }
    float _1476 = _1344;
    if (!_1360)
    {
        float _1478 = fma(_1458, _1462, _1194);
        _1322 = _1478;
    }
    float _1480 = _1322;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1472 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1476 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1492 = _1480 + _1490;
    float _1494 = _1484 * _1484;
    float _1496 = fma(_1488, _1488, _1494);
    float _1498 = fma(_1492, _1492, _1496);
    float _1500 = rsqrt(_1498);
    float _1502 = sqrt(_1498);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1488 * _1504;
    float _1508 = _1492 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1238;
    float _1526 = _1522;
    float _1528 = _1484;
    float _1530 = _1506;
    float _1532 = _1508;
    if (_1518)
    {
        float _1534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1534;
    }
    float _1536 = _1524;
    float _1538 = _1536;
    if (_1518)
    {
        float _1540 = _1522 * _1536;
        _1526 = _1540;
    }
    float _1542 = _1526;
    if (_1518)
    {
        float _1544 = rsqrt(_1514);
        _1538 = _1544;
    }
    float _1546 = _1538;
    if (_1518)
    {
        float _1548 = _1542 * 0.15915493667125701904296875;
        _1262 = _1548;
    }
    float _1550 = _1262;
    float _1552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1554 = _1414;
    if (_1518)
    {
        float _1556 = _1550 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = precise::max(0.0, _1552);
    float _1564 = _1232;
    float _1566 = _1562;
    if (_1518)
    {
        float _1568 = _1550 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1564 = _1570;
    }
    float _1572 = _1564;
    float _1574 = -_1504;
    float _1576 = -_1562;
    float _1578 = fma(_1484, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1580;
    }
    float _1582 = _1528;
    float _1584 = _1560;
    float _1586 = _1582;
    if (_1518)
    {
        float _1588 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1264 = _1588;
    }
    float _1590 = _1264;
    float _1592 = _1590;
    if (!_1518)
    {
        _1584 = _1578;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (_1518)
    {
        float _1598 = _1546 * _1590;
        _1592 = _1598;
    }
    float _1600 = _1592;
    if (_1518)
    {
        float _1602 = _1572 + (-1.0);
        _1566 = _1602;
    }
    float _1604 = _1566;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1506 * _1600;
        _1530 = _1608;
    }
    float _1610 = _1530;
    if (_1518)
    {
        float _1612 = _1508 * _1600;
        _1532 = _1612;
    }
    float _1614 = _1532;
    if (_1518)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1616;
    }
    float _1618 = _1586;
    float _1620 = _1618;
    if (!_1518)
    {
        _1606 = _1512;
    }
    float _1622 = _1606;
    float _1624 = _1622;
    if (_1518)
    {
        float _1626 = _1614 * _1614;
        _1624 = _1626;
    }
    float _1628 = _1624;
    if (_1518)
    {
        float _1630 = fma(_1578, _1572, _1618);
        _1596 = _1630;
    }
    float _1632 = _1596;
    if (!_1518)
    {
        _1620 = _1510;
    }
    float _1634 = _1620;
    float _1636 = _1634;
    if (_1518)
    {
        float _1638 = _1610 * _1610;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1644 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1646 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1648 = fma(_1632, _1632, _1640);
    float _1650 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1642);
    float _1652 = floor(_1644);
    float _1654 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1646);
    float _1656 = _1648 + _1628;
    float _1658 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1650);
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1662 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1660);
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1668 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1670 = rsqrt(_1656);
    float _1672 = -_1664;
    float _1674 = _1672 + 1.0;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = fma(_1194, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1666);
    float _1684 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1686 = -_1678;
    float _1688 = fma(_1686, _1676, 1.0);
    float _1690 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1692 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1694 = abs(_1674);
    float _1696 = log2(_1694);
    float _1698 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1700 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1690);
    float _1702 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = _1670 * _1610;
    float _1706 = _1670 * _1632;
    float _1708 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1700);
    float _1710 = _1670 * _1614;
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1714 = floor(_1680);
    float _1716 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1720 = -_1712;
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1720);
    float _1724 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1728 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1730 = -_1710;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1722);
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1718);
    float _1736 = log2(_1688);
    float _1738 = fma(_1732, -0.5, 0.5);
    float _1740 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1742 = fma(_1732, 0.5, 0.5);
    float _1744 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1740);
    float _1746 = exp2(_1726);
    float _1748 = -_1652;
    float _1750 = _1644 + _1748;
    float _1752 = -_1714;
    float _1754 = _1680 + _1752;
    float _1756 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1758 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1728);
    float _1760 = _1706 + 1.0;
    float _1762 = fma(_1742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1764 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1756);
    float _1766 = 1.0 / _1744;
    float _1768 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1758);
    float _1770 = fma(_1742, _1762, -0.212114393711090087890625);
    float _1772 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1764);
    float _1774 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1768);
    float _1776 = sqrt(_1738);
    float _1778 = -_1706;
    float _1780 = fma(_1746, _1760, _1778);
    float _1782 = _1736 * 0.693147182464599609375;
    float2 _5140 = float2(_1750, _1754);
    float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5140, float2(0.0), isnan(_5140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5140, float2(0.0), isnan(_5140)), level(0.0)).x;
    float _1786 = fma(_1742, _1770, 1.570728778839111328125);
    float _1788 = fma(_1780, 0.5, 0.5);
    float _1790 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1792 = _1772 * _1766;
    float _1794 = _1774 * _1766;
    float _1796 = fma(_1792, 0.5, 0.5);
    float _1798 = fma(_1794, -0.5, 0.5);
    float _1800 = _1776 * 0.636619746685028076171875;
    float3 _5172 = float3(_1796, _1798, _1790);
    float _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).x;
    float _1804 = -_1786;
    float _1806 = fma(_1800, _1804, 1.0);
    float3 _5188 = float3(_1796, _1798, _1790);
    float4 _1809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5188, float3(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5188, float3(0.0), isnan(_5188)), level(0.0)).xyzw;
    float _1811 = _1809.x;
    float _1813 = _1809.y;
    float _1815 = _1809.z;
    float _1817 = _1809.w;
    float2 _5204 = float2(_1806, _1788);
    float3 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5204, float2(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5204, float2(0.0), isnan(_5204)), level(0.0)).xyz;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1831 = in.m_71.y;
    float _1833 = -_1094;
    float _1835 = -_1070;
    bool _1837 = _1833 != _1835;
    bool _1839 = isnan(_1833);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan(_1835);
    bool _1845 = _1841 || _1843;
    float _1847 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = _1829 * _368;
    float _1851 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1857 = _1078 == 0.0;
    bool _1859 = !_1845;
    bool _1861 = _1857 && _1859;
    float _1863 = _1851 * _368;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1867 = _1865 != 0;
    float _1869 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1873 = _1871 != 0;
    float _1875 = trunc(_1849);
    int _1877 = int(_1875);
    float _1879 = in.m_73.x;
    float _1881 = in.m_73.y;
    float _1883 = in.m_73.z;
    bool _1885 = _1090 == 0.0;
    bool _1887 = _1885 && _1861;
    float _1889 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    bool _1891 = _368 > 0.5;
    bool _1893 = _1891 && _1867;
    bool _1895 = _410 > 0.5;
    float _1897 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1889);
    float _1899 = trunc(_1863);
    int _1901 = int(_1899);
    float _1903 = -_1831;
    float _1905 = _1903 + 1.0;
    float _1907 = _1831;
    if (_1873)
    {
        float _1909 = _1895 ? _1905 : _1831;
        _1907 = _1909;
    }
    float _1911 = _1907;
    float _1913 = exp2(_1847);
    int _1915 = _1877 << 4;
    int _1917 = _1915 + 1712;
    float _1919 = in.m_71.x;
    float _1921 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _1924 = uint(int(uint(_1917) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = _1901 << 4;
    int _1942 = _1940 + 1968;
    float _1944 = _1881;
    float _1946 = _1879;
    float _1948 = _1883;
    if (!_1887)
    {
        float _1950 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1881);
        _1944 = _1950;
    }
    float _1952 = _1944;
    if (!_1887)
    {
        float _1954 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1879);
        _1946 = _1954;
    }
    float _1956 = _1946;
    if (!_1887)
    {
        float _1958 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1883);
        _1948 = _1958;
    }
    float _1960 = _1948;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1964 = _1917 + 8;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
    int _1970 = int(_1966) & 3;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[int(_1968)][_1970];
    float _1974 = _1156 * _1952;
    float _1976 = -_1952;
    float _1978 = _1150 * _1976;
    float _1980 = _1158 * _1952;
    float _1982 = -_1913;
    float _1984 = _1982 + 1.0;
    float _1986 = fma(_1168, _1956, _1974);
    float _1988 = fma(_1160, _1956, _1978);
    float _1990 = fma(_1180, _1956, _1980);
    uint _1992 = uint(int(uint(_1942) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    float _2008 = fma(_1176, _1960, _1986);
    float _2010 = fma(_1162, _1960, _1988);
    float _2012 = fma(_1186, _1960, _1990);
    float _2014 = in.m_75.y;
    float _2016 = _2008 * _310;
    float _2018 = _2008 * _314;
    float _2020 = _1919;
    if (!_1867)
    {
        _544 = _1919;
    }
    float _2022 = _544;
    float _2024 = _2022;
    if (_1893)
    {
        float _2026 = -_1919;
        float _2028 = _2026 + 1.0;
        _2020 = _2028;
    }
    float _2030 = _2020;
    float _2032 = fma(_2010, _276, _2016);
    float _2034 = fma(_2010, _280, _2018);
    int _2036 = _1942 + 8;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    float _2046 = in.m_75.w;
    if (_1867)
    {
        _2024 = _2030;
    }
    float _2048 = _2024;
    float _2050 = fma(_2012, _322, _2032);
    float _2052 = in.m_75.z;
    float _2054 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2058 = _1921 * _1962;
    bool _2060 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2062 = isnan(_1502);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2068 = _2064 || _2066;
    float _2070 = _2056 * _1853;
    out.m_77.x = _2070;
    out.m_77.y = _2058;
    float _2072 = in.m_69.x;
    float _2074 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2076 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2078 = _2056;
    float _2080 = _2072;
    if (!_2068)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2082 = _2078;
    out.m_79.y = _2014;
    float _2084 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2046;
    float _2088 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_79.z = _2052;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2092 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_81.x = _2084;
    out.m_81.y = _2086;
    out.m_81.z = _2090;
    out.m_81.w = _1855;
    float _2094 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2100 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2102 = _2008 * _302;
    float _2104 = fma(_2012, _326, _2034);
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = fma(_2010, _272, _2102);
    out.m_83.x = _2096;
    out.m_83.y = _2100;
    out.m_83.z = _2106;
    float _2110 = fma(_2012, _318, _2108);
    float _2112 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2114 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2112);
    out.m_85.x = _2050;
    out.m_85.y = _2110;
    out.m_85.z = _2104;
    float _2116 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2114);
    float _2118 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2120 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2122 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2118);
    float _2124 = 1.0 / _2120;
    float _2126 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2122);
    float _2128 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1897);
    float _2130 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.gl_Position.x = _1772;
    out.gl_Position.y = _1774;
    out.gl_Position.z = _2128;
    out.gl_Position.w = _1744;
    float _2132 = _2130 + _2120;
    float _2134 = _2132 * _2124;
    float _2136 = _2134 * 0.5;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2138);
    float _2142 = -_2054;
    float _2144 = _2142 + 1.0;
    float _2146 = _1772;
    float _2148 = _2128;
    float _2150 = _2144;
    float _2152 = _2082;
    float _2154 = _2082;
    if (!_2068)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2156 = _2146;
    float _2158 = 1.0 / _2140;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2162 = _2158 * _2160;
    float _2164 = abs(_2162);
    float _2166 = log2(_2164);
    bool _2168 = _2162 <= 8000.0;
    bool _2170 = isnan(_2162);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(8000.0);
    bool _2176 = _2172 || _2174;
    float _2178 = float(_2176);
    float _2180 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2182 = exp2(_2180);
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2186 = precise::clamp(_2184, 0.0, 1.0);
    float _2188 = fma(_2186, -2.0, 3.0);
    float _2190 = _2186 * _2186;
    float _2192 = _2190 * _2188;
    float _2194 = in.m_75.x;
    float _2196 = -_2192;
    float _2198 = _2196 + 1.0;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2192);
    float _2202 = _2128 + _1744;
    float _2204 = _2178 * _2200;
    float _2206 = _2202 * 0.5;
    float _2208 = _2156;
    float _2210 = _2156;
    if (!_2068)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2212 = _2148;
    float _2214 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_87.z = _2206;
    out.m_87.w = _1744;
    out.m_79.x = _2194;
    float _2216 = _2194;
    float _2218 = _2212;
    float _2220 = _2212;
    if (!_2068)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2222 = _2216;
    float _2224 = -_1784;
    float _2226 = _2224 + 1.0;
    float _2228 = _2226 * _2214;
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -_2230;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2236 = _2234 * _2072;
    float _2238 = _2222;
    float _2240 = _2222;
    if (!_2068)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2242 = _2080;
    float _2244 = _2054 * _1802;
    float _2246 = _2236 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2248 = _1817 * _2244;
    float _2250 = _1817 * _2144;
    out.m_89.x = _2246;
    float _2252 = _2242;
    float _2254 = _2242;
    if (!_2068)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2256 = _2150;
    float _2258 = _1827 * _2244;
    float _2260 = fma(_1823, _2248, _1811);
    float _2262 = fma(_1825, _2248, _1813);
    float _2264 = fma(_1817, _2258, _1815);
    out.m_91.x = _2260;
    out.m_91.y = _2262;
    out.m_91.z = _2264;
    out.m_91.w = _2250;
    bool _2266 = !_2068;
    float _2268 = _2256;
    float _2270 = _2256;
    if (!_2266)
    {
        bool _2272 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2274 = isnan(_1502);
        bool _2276 = _2272 || _2274;
        bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2280 = _2276 || _2278;
        if (!_2280)
        {
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2284 = _1502 + _2282;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2286;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2298 = 1.0 / _2288;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2312 = _2284 * _2298;
            float _2314 = precise::clamp(_2312, 0.0, 1.0);
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2320 = fma(_2314, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2322 = fma(_2314, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2324 = fma(_2314, _2302, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2326 = fma(_2314, _2318, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2328 = fma(_2314, _2306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2330 = fma(_2314, _2310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2154 = _2322;
            _2270 = _2328;
            _2220 = _2320;
            _2254 = _2326;
            _2210 = _2324;
            _2240 = _2330;
            _2332 = true;
        }
        else
        {
            bool _2334 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2336 = isnan(_1502);
            bool _2338 = _2334 || _2336;
            bool _2340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2342 = _2338 || _2340;
            if (!_2342)
            {
                _2218 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2344 = _2218;
            _2220 = _2344;
            if (!_2342)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2346 = _2152;
            _2154 = _2346;
            if (!_2342)
            {
                _2208 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2348 = _2208;
            _2210 = _2348;
            if (!_2342)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2350 = _2252;
            _2254 = _2350;
            if (!_2342)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2352 = _2268;
            _2270 = _2352;
            if (!_2342)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2354 = _2238;
            bool _2356 = !_2342;
            _2240 = _2354;
            if (!_2356)
            {
                bool _2358 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2360 = isnan(_1502);
                bool _2362 = _2358 || _2360;
                bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2366 = _2362 || _2364;
                if (!_2366)
                {
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2370 = _1502 + _2368;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2372;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2384 = 1.0 / _2374;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2398 = _2370 * _2384;
                    float _2400 = precise::clamp(_2398, 0.0, 1.0);
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2406 = fma(_2400, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2408 = fma(_2400, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2410 = fma(_2400, _2388, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2412 = fma(_2400, _2404, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2414 = fma(_2400, _2392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2416 = fma(_2400, _2396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2154 = _2408;
                    _2270 = _2414;
                    _2220 = _2406;
                    _2254 = _2412;
                    _2210 = _2410;
                    _2240 = _2416;
                    _2332 = true;
                }
                else
                {
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2220 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2210 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2332 = false;
    float _2418 = _2154;
    float _2420 = _2270;
    float _2422 = _2220;
    float _2424 = _2254;
    float _2426 = _2210;
    float _2428 = _2240;
    float _2430 = fma(_2110, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2418;
    float _2436 = _2434 + _2420;
    float _2438 = -_2422;
    float _2440 = _2438 + _2424;
    float _2442 = -_2426;
    float _2444 = _2442 + _2428;
    bool _2446 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2448 = fma(_2432, _2436, _2418);
    float _2450 = fma(_2432, _2440, _2422);
    float _2452 = fma(_2432, _2444, _2426);
    float _2454 = _2448 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2456 = fma(_2450, 0.298911988735198974609375, _2454);
    float _2458 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2460 = fma(_2452, 0.114477999508380889892578125, _2456);
    out.m_89.w = _2458;
    float _2462 = -_2460;
    float _2464 = _2450 + _2462;
    float _2466 = -_2460;
    float _2468 = _2448 + _2466;
    float _2470 = -_2460;
    float _2472 = _2452 + _2470;
    out.m_93.x = 0.0;
    float _2474 = fma(_2464, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    float _2476 = fma(_2468, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    float _2478 = fma(_2472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    out.m_95.x = _2474;
    out.m_95.y = _2476;
    out.m_95.z = _2478;
    if (!_2446)
    {
        return out;
    }
    float _2480 = -_1472;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2484 = -_1476;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2488 = -_1480;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2492 = _2482 * _2482;
    float _2494 = fma(_2486, _2486, _2492);
    float _2496 = fma(_2490, _2490, _2494);
    float _2498 = sqrt(_2496);
    float _2500 = rsqrt(_2496);
    float _2502 = -_2498;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2506 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2486 * _2500;
    float _2512 = _2482 * _2500;
    float _2514 = abs(_2508);
    float _2516 = log2(_2514);
    float _2518 = _2490 * _2500;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = _2110 * _2512;
    float _2524 = -_2512;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = fma(_2050, _2510, _2522);
    float _2532 = -_2518;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = fma(_2104, _2518, _2530);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2542 = _2534 + _2540;
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2546 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = exp2(_2544);
    float _2552 = _2550 * _2548;
    float _2554 = _2538 * _2552;
    float _2556 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2556;
    out.m_93.y = _2558;
    out.m_93.z = _2560;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2332 = false;
    bool _348 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2618 = as_type<float>(_130);
        out.gl_Position.z = _2618;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_53.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_51.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    float _166 = as_type<float>(_164);
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2684 = as_type<float>(_164);
        out.gl_Position.z = _2684;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = 1.0 / _136;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = _140 * _174;
    float _190 = _168 * _168;
    float _192 = _170 * _170;
    float _194 = _172 * _172;
    float _196 = fma(_176, _176, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_180, _180, _194);
    float _202 = fma(_182, _182, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = fma(_186, _186, _200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    float _212 = sqrt(_206);
    bool _214 = _208 > 0.0;
    bool _216 = _210 > 0.0;
    float _218 = 0.0;
    float _220 = _208;
    float _222 = _210;
    float _224 = _204;
    float _226 = _202;
    float _228 = _168;
    float _230 = _206;
    if (_214)
    {
        float _232 = rsqrt(_202);
        _218 = _232;
    }
    float _234 = _218;
    if (!_214)
    {
        _220 = 0.0;
    }
    float _236 = _220;
    bool _238 = _212 > 0.0;
    float _240 = _212;
    float _242 = _236;
    if (!_214)
    {
        _240 = 0.0;
        _222 = 0.0;
    }
    float _244 = _240;
    float _246 = _222;
    float _248 = _246;
    float _250 = _244;
    if (!_216)
    {
        _166 = 0.0;
    }
    float _252 = _166;
    float _254 = 0.0;
    float _256 = _252;
    if (_216)
    {
        float _258 = rsqrt(_204);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (_238)
    {
        float _264 = rsqrt(_206);
        _262 = _264;
    }
    float _266 = _262;
    float _268 = _234;
    if (_214)
    {
        float _270 = _234 * _168;
        _248 = _270;
    }
    float _272 = _248;
    if (_214)
    {
        float _274 = _234 * _176;
        _242 = _274;
    }
    float _276 = _242;
    if (_214)
    {
        float _278 = _234 * _182;
        _250 = _278;
    }
    float _280 = _250;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_238)
    {
        _224 = 0.0;
        _226 = 0.0;
    }
    float _284 = _224;
    float _286 = _226;
    float _288 = _286;
    float _290 = _284;
    if (!_216)
    {
        _228 = 0.0;
    }
    float _292 = _228;
    float _294 = _292;
    if (!_238)
    {
        _268 = 0.0;
    }
    float _296 = _268;
    float _298 = _296;
    if (_216)
    {
        float _300 = _260 * _170;
        _256 = _300;
    }
    float _302 = _256;
    if (!_216)
    {
        _230 = 0.0;
    }
    float _304 = _230;
    float _306 = _304;
    if (_216)
    {
        float _308 = _260 * _178;
        _306 = _308;
    }
    float _310 = _306;
    if (_216)
    {
        float _312 = _260 * _184;
        _294 = _312;
    }
    float _314 = _294;
    if (_238)
    {
        float _316 = _266 * _172;
        _288 = _316;
    }
    float _318 = _288;
    if (_238)
    {
        float _320 = _266 * _180;
        _298 = _320;
    }
    float _322 = _298;
    if (_238)
    {
        float _324 = _266 * _186;
        _290 = _324;
    }
    float _326 = _290;
    bool _328 = !_282;
    float _346;
    if (!_328)
    {
        float _330 = in.m_61.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        _346 = _188;
    }
    _348 = false;
    float _350 = _346;
    float _352 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _354 = in.m_48.x;
    float _356 = in.m_48.y;
    float _358 = in.m_48.z;
    float _360 = -_188;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _366 = _350 + _364;
    float _368 = in.m_61.x;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _384 = _350 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _388 = _350 + _386;
    float _390 = _188 * _352;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = _362 * _352;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = in.m_61.z;
    float _400 = 1.0 / _376;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _406;
    float _410 = in.m_61.y;
    float _412 = precise::min(_392, _396);
    float _414 = _372 * _140;
    float _416 = _178 * _356;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = 1.0 / _404;
    float _424 = fma(_176, _354, _416);
    float _426 = -_412;
    float _428 = _426 + 1.0;
    bool _430 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _432 = isnan(_350);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _184 * _356;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _450 = _448 != 0;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _454 = _452 != 0;
    float _456 = exp2(_414);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _460 = 1.0 + _458;
    float _462 = _366 * _400;
    float _464 = fma(_182, _354, _442);
    bool _466 = !_446;
    int _468 = _466 ? 0 : 1;
    float _470 = fma(_408, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _472 = _398 * 2.0;
    float _474 = 1.0 / _460;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _486 = _484 != 0;
    float _488 = _368 + _398;
    float _490 = _410 * 2.0;
    float _492 = _388 * _422;
    bool _494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _496 = isnan(1.0);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _502 = _498 || _500;
    float _504 = _488 + (-1.0);
    float _506 = floor(_472);
    float _508 = -_456;
    float _510 = _508 + 1.0;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    bool _514 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _522 = _518 || _520;
    float _524 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _526;
    float _530 = fma(_512, _410, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _532 = _522 ? _510 : 0.0;
    float _534 = floor(_490);
    float _536 = _368 * 2.0;
    float _538 = _530 * _140;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _540;
    float _544 = _410;
    if (_502)
    {
        float _546 = _532 * _474;
        _158 = _546;
    }
    float _548 = _158;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = fma(_542, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _560 = 1.0 / _380;
    bool _562 = _506 >= 0.0;
    bool _564 = isnan(_506);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    float _572 = fma(_528, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _574 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _576 = isnan(_350);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _586;
    int _590 = _570 ? 0 : 1;
    float _592 = fma(_368, 6.283185482025146484375, _538);
    float _594 = floor(_536);
    bool _596 = _534 > 0.0;
    float _598 = in.m_57.w;
    bool _600 = _534 >= 0.0;
    bool _602 = isnan(_534);
    bool _604 = _600 || _602;
    bool _606 = isnan(0.0);
    bool _608 = _604 || _606;
    float _610 = fma(_186, _358, _464);
    bool _612 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _614 = isnan(_350);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = fma(_180, _358, _424);
    bool _626 = !_454;
    int _628 = _626 ? 0 : 1;
    float _630 = _384 * _560;
    float _632 = _410 + _398;
    float _634 = -_622;
    float _636 = _634 + 1.0;
    float _638 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _640 = fma(_420, _630, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _642 = fma(_552, _630, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _644 = fma(_556, _630, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _646 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _648 = isnan(_350);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = _584 * _636;
    float _660 = _632 + (-1.0);
    float _662 = -_584;
    float _664 = _662 + 1.0;
    bool _666 = _506 > 0.0;
    float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _670 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _672 = _656 * _664;
    float _674 = _368 + _410;
    float _676 = -_656;
    float _678 = _676 + 1.0;
    float _680 = _548 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _682 = _674 + (-1.0);
    float _684 = _440 * _678;
    float _686 = fma(_588, _492, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _688 = _548 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _690;
    float _694 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _696 = _470 * _684;
    float _698 = _558 * _684;
    bool _700 = !_450;
    int _702 = _700 ? 0 : 1;
    float _704 = _572 * _684;
    bool _706 = _594 >= 0.0;
    bool _708 = isnan(_594);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _716;
    float _720 = _688 * _638;
    float _722 = fma(_692, _492, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _724 = fma(_718, _492, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    int _726 = ~_590;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    float _732 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[203].x, _720);
    int _734 = _730;
    if (!_666)
    {
        int _736 = ~_590;
        int _738 = _736 + 1;
        _734 = _738;
    }
    int _740 = _734;
    float _742 = _398 + (-0.5);
    bool _744 = !_486;
    int _746 = _744 ? 0 : 1;
    float _748 = _624 + _598;
    int _750 = _714 ? 0 : 1;
    int _752 = _608 ? 0 : 1;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _764 = _762 != 0;
    float _766 = _680 * _668;
    bool _768 = _594 > 0.0;
    float _770 = -_440;
    float _772 = _770 + 1.0;
    int _774 = ~_752;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    float _780 = floor(_732);
    int _782 = _778;
    if (!_596)
    {
        int _784 = ~_752;
        int _786 = _784 + 1;
        _782 = _786;
    }
    int _788 = _782;
    float _790 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].x, _696);
    float _792 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].y, _698);
    float _794 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[143].z, _704);
    bool _796 = !_760;
    int _798 = _796 ? 0 : 1;
    float _800 = in.m_63.x;
    float _802 = in.m_63.y;
    float _804 = in.m_63.z;
    int _806 = ~_750;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[203].z, _766);
    bool _814 = !_756;
    int _816 = _814 ? 0 : 1;
    float _818 = fma(_642, _672, _792);
    int _820 = _810;
    if (!_768)
    {
        int _822 = ~_750;
        int _824 = _822 + 1;
        _820 = _824;
    }
    int _826 = _820;
    float _828 = _732 + 0.25;
    int _830 = abs(_798);
    float _832 = floor(_812);
    int _834 = abs(_816);
    float _836 = -_780;
    float _838 = _732 + _836;
    float _840 = float(_826);
    float _842 = fma(_640, _672, _790);
    float _844 = float(_830);
    float _846 = fma(_644, _672, _794);
    float _848 = float(_740);
    float _850 = floor(_828);
    float _852 = float(_834);
    float _854 = _844 * _840;
    float _856 = fma(_722, _658, _842);
    bool _858 = _838 >= 0.5;
    bool _860 = isnan(_838);
    bool _862 = _858 || _860;
    bool _864 = isnan(0.5);
    bool _866 = _862 || _864;
    float _868 = _410 + (-0.5);
    float _870 = _852 * _848;
    float _872 = _854 * (-2.0);
    float _874 = _732 * 6.283185482025146484375;
    float _876 = _812 + 0.25;
    float _878 = -_832;
    float _880 = _812 + _878;
    float _882 = fma(_872, _802, _802);
    float _884 = fma(_670, _872, _670);
    float _886 = floor(_876);
    float _888 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[196].y, _882);
    float _890 = -_850;
    float _892 = _828 + _890;
    int _894 = abs(_468);
    float _896 = _874 * 0.15915493667125701904296875;
    bool _898 = !_482;
    int _900 = _898 ? 0 : 1;
    float _902 = _812 * 6.283185482025146484375;
    bool _904 = _880 >= 0.5;
    bool _906 = isnan(_880);
    bool _908 = _904 || _906;
    bool _910 = isnan(0.5);
    bool _912 = _908 || _910;
    float _914 = fma(_884, _548, _888);
    int _916 = abs(_900);
    float _918 = _896 * 6.283185482025146484375;
    float _920 = sin(_918);
    int _922 = abs(_702);
    float _924 = fma(_686, _658, _818);
    bool _926 = !_866;
    float _928 = _926 ? 0.5 : (-0.5);
    float _930 = fma(_724, _658, _846);
    bool _932 = _892 > 0.5;
    float _934 = -_886;
    float _936 = _876 + _934;
    bool _938 = !_912;
    float _940 = _938 ? 0.5 : (-0.5);
    float _942 = _928 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _944 = _942 * 2.0;
    float _946 = float(_922);
    float _948 = _902 * 0.15915493667125701904296875;
    float _950 = float(_916);
    float _952 = _940 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _954 = _952 * 2.0;
    int _956 = abs(_746);
    float _958 = _946 * _944;
    float _960 = _950 * _954;
    bool _962 = !_478;
    int _964 = _962 ? 0 : 1;
    float _966 = _892;
    float _968 = _936;
    if (_932)
    {
        float _970 = -_892;
        float _972 = _970 + 1.0;
        _966 = _972;
    }
    float _974 = _966;
    int _976 = abs(_628);
    float _978 = _920 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _980 = float(_894);
    float _982 = _948 * 6.283185482025146484375;
    float _984 = sin(_982);
    int _986 = abs(_964);
    float _988 = fma(_974, 4.0, -1.0);
    bool _990 = _936 > 0.5;
    float _992 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].y, _924);
    float _994 = fma(_980, _978, _958);
    float _996 = float(_976);
    float _998 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1000 = float(_986);
    float _1002 = float(_788);
    float _1004 = fma(_996, _998, _994);
    float _1006 = _592 * 0.15915493667125701904296875;
    if (_990)
    {
        float _1008 = -_936;
        float _1010 = _1008 + 1.0;
        _968 = _1010;
    }
    float _1012 = _968;
    float _1014 = _984 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1016 = fma(_1004, 3.1415927410125732421875, _800);
    bool _1018 = !_764;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = fma(_1012, 4.0, -1.0);
    float _1024 = fma(_1000, _1014, _960);
    float _1026 = _1006 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    int _1030 = abs(_1020);
    float _1032 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1034 = float(_956);
    float _1036 = _870 * (-2.0);
    float _1038 = _914 * 0.15915493667125701904296875;
    float _1040 = float(_1030);
    float _1042 = _368 + (-0.5);
    float _1044 = fma(_1034, _1032, _1024);
    float _1046 = fma(_1016, _1036, _1016);
    float _1048 = fma(_694, _1036, _694);
    float _1050 = _1040 * _1002;
    float _1052 = fma(_1044, 3.1415927410125732421875, _804);
    float _1054 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1046);
    float _1056 = in.m_65.x;
    float _1058 = in.m_65.y;
    float _1060 = in.m_65.z;
    float _1062 = _1050 * (-2.0);
    float _1064 = _1038 * 6.283185482025146484375;
    float _1066 = sin(_1064);
    float _1068 = fma(_1048, _548, _1054);
    float _1070 = in.m_67.y;
    float _1072 = fma(_1052, _1062, _1052);
    float _1074 = fma(_524, _1062, _524);
    float _1076 = _1068 * 0.15915493667125701904296875;
    float _1078 = in.m_67.x;
    float _1080 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1072);
    float _1082 = abs(_1028);
    float _1084 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1086 = _1038 * 6.283185482025146484375;
    float _1088 = cos(_1086);
    float _1090 = in.m_67.z;
    float _1092 = fma(_1074, _548, _1080);
    float _1094 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1084);
    float _1096 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].x, _856);
    float _1098 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[146].z, _930);
    float _1100 = _1092 * 0.15915493667125701904296875;
    float _1102 = _1076 * 6.283185482025146484375;
    float _1104 = sin(_1102);
    float _1106 = _1096 * _1056;
    float _1108 = _992 * _1058;
    float _1110 = _1098 * _1060;
    float _1112 = _1076 * 6.283185482025146484375;
    float _1114 = cos(_1112);
    float _1116 = -_1094;
    float _1118 = _1116 + _1070;
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1122 = _1108 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1124 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1118);
    float _1128 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1078);
    float _1130 = _1100 * 6.283185482025146484375;
    float _1132 = cos(_1130);
    float _1134 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1090);
    float _1136 = _1120 * _1128;
    float _1138 = _1122 * _1126;
    float _1140 = _1104 * _1066;
    float _1142 = in.m_59.w;
    float _1144 = _1124 * _1134;
    float _1146 = _1104 * _1088;
    float _1148 = _1100 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1114 * _1088;
    float _1154 = _1114 * _1066;
    float _1156 = _1114 * _1132;
    float _1158 = _1104 * _1132;
    float _1160 = _1088 * _1132;
    float _1162 = _1066 * _1132;
    float _1164 = _1156 * _1138;
    float _1166 = _1158 * _1138;
    float _1168 = fma(_1150, _1152, _1140);
    float _1170 = -_1138;
    float _1172 = _1150 * _1170;
    float _1174 = -_1146;
    float _1176 = fma(_1150, _1154, _1174);
    float _1178 = -_1154;
    float _1180 = fma(_1150, _1146, _1178);
    float _1182 = fma(_1168, _1136, _1164);
    float _1184 = fma(_1160, _1136, _1172);
    float _1186 = fma(_1150, _1140, _1152);
    float _1188 = fma(_1180, _1136, _1166);
    float _1190 = fma(_1176, _1144, _1182);
    float _1192 = fma(_1162, _1144, _1184);
    float _1194 = _610 + _1142;
    float _1196 = fma(_1186, _1144, _1188);
    float _1198 = _1190 * _314;
    float _1200 = _1190 * _310;
    float _1202 = _1190 * _302;
    float _1204 = fma(_1192, _280, _1198);
    float _1206 = fma(_1192, _276, _1200);
    float _1208 = fma(_1192, _272, _1202);
    float _1210 = fma(_1196, _326, _1204);
    float _1212 = fma(_1196, _322, _1206);
    float _1214 = fma(_1196, _318, _1208);
    float _1216 = in.m_69.y;
    float _1218 = _1194 + _1210;
    float _1220 = _748 + _1212;
    float _1222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1224 = _1218 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1220 + _1226;
    float _1230 = _1224 * _1224;
    float _1232 = fma(_1228, _1228, _1230);
    float _1234 = sqrt(_1232);
    float _1236 = _356 + _1216;
    float _1238 = _1236 + _1214;
    bool _1240 = _1234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1244 = _1234 + _1242;
    float _1246 = _1212;
    float _1248 = _1208;
    float _1250 = _1244;
    float _1252 = _1138;
    float _1254 = _1218;
    float _1256 = _1192;
    float _1258 = _1224;
    float _1260 = _1236;
    float _1262 = _1136;
    float _1264 = _1214;
    if (_1240)
    {
        float _1266 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1266;
    }
    float _1268 = _1246;
    if (_1240)
    {
        float _1270 = rsqrt(_1232);
        _1248 = _1270;
    }
    float _1272 = _1248;
    float _1274 = _1268;
    if (_1240)
    {
        float _1276 = _1244 * _1268;
        _1250 = _1276;
    }
    float _1278 = _1250;
    if (_1240)
    {
        float _1280 = _1238 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1280;
    }
    float _1282 = _1274;
    float _1284 = _1282;
    if (_1240)
    {
        float _1286 = _1278 * 0.15915493667125701904296875;
        _1252 = _1286;
    }
    float _1288 = _1252;
    float _1290 = _1278;
    float _1292 = _1288;
    if (_1240)
    {
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = _1298;
    if (_1240)
    {
        float _1302 = fma(_1298, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1300 = _1302;
    }
    float _1304 = _1300;
    float _1306 = _1304;
    if (!_1240)
    {
        _1284 = _1220;
    }
    float _1308 = _1284;
    float _1310 = _1308;
    if (_1240)
    {
        float _1312 = _1272 * _1304;
        _1306 = _1312;
    }
    float _1314 = _1306;
    float _1316 = _1314;
    if (_1240)
    {
        float _1318 = fma(_1224, _1314, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1254 = _1318;
    }
    float _1320 = _1254;
    float _1322 = _1320;
    if (_1240)
    {
        float _1324 = fma(_1228, _1314, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1310 = _1324;
    }
    float _1326 = _1310;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1330 = _1320 + _1328;
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1334 = _1326 + _1332;
    float _1336 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1338 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4379 = float2(_1338, _1336);
    float _1340 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4379, float2(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4379, float2(0.0), isnan(_4379)), level(0.0)).x;
    float _1342 = _1334;
    float _1344 = _1326;
    if (_1240)
    {
        float _1346 = _1288 * 6.283185482025146484375;
        float _1348 = cos(_1346);
        _1342 = _1348;
    }
    float _1350 = _1342;
    bool _1352 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1354 = isnan(0.5);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1360 = _1356 || _1358;
    if (!_1240)
    {
        _1316 = _1238;
    }
    float _1362 = _1316;
    float _1364 = _1362;
    float _1366 = _1350;
    if (_1240)
    {
        float _1368 = _1350 + (-1.0);
        _1256 = _1368;
    }
    float _1370 = _1256;
    float _1372 = _1370;
    if (_1240)
    {
        float _1374 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1372 = _1374;
    }
    float _1376 = _1372;
    float _1378 = _1376;
    if (_1240)
    {
        float _1380 = fma(_1238, _1350, _1376);
        _1364 = _1380;
    }
    float _1382 = _1364;
    if (!_1360)
    {
        float _1384 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1386 = _748 + _1384;
        _1366 = _1386;
    }
    float _1388 = _1366;
    float _1390 = _1388;
    if (!_1360)
    {
        float _1392 = -_1236;
        float _1394 = _1392 + _1382;
        _1292 = _1394;
    }
    float _1396 = _1292;
    float _1398 = fma(_1340, 100.0, _1236);
    float _1400 = fma(_1340, 100.0, _1382);
    float _1402 = _1400;
    if (!_1360)
    {
        float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1406 = _1398 + _1404;
        _1378 = _1406;
    }
    float _1408 = _1378;
    float _1410 = _1408;
    if (!_1360)
    {
        float _1412 = _1408 * _1408;
        _1258 = _1412;
    }
    float _1414 = _1258;
    if (!_1360)
    {
        float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1418 = _1194 + _1416;
        _1410 = _1418;
    }
    float _1420 = _1410;
    float _1422 = _1420;
    if (!_1360)
    {
        float _1424 = fma(_1388, _1388, _1414);
        _1390 = _1424;
    }
    float _1426 = _1390;
    float _1428 = _1426;
    if (!_1360)
    {
        float _1430 = fma(_1420, _1420, _1426);
        _1428 = _1430;
    }
    float _1432 = _1428;
    if (!_1360)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1422 = _1434;
    }
    float _1436 = _1422;
    float _1438 = _1432;
    float _1440 = _1436;
    if (!_1360)
    {
        float _1442 = sqrt(_1432);
        _1438 = _1442;
    }
    float _1444 = _1438;
    float _1446 = _1444;
    if (!_1360)
    {
        float _1448 = precise::min(_1444, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1260 = _1448;
    }
    float _1450 = _1260;
    float _1452 = _1450;
    if (!_1360)
    {
        float _1454 = -_1194;
        float _1456 = _1454 + _1320;
        _1446 = _1456;
    }
    float _1458 = _1446;
    if (!_1360)
    {
        float _1460 = _1450 * _1436;
        _1440 = _1460;
    }
    float _1462 = _1440;
    if (!_1360)
    {
        float _1464 = -_748;
        float _1466 = _1464 + _1326;
        _1452 = _1466;
    }
    float _1468 = _1452;
    if (!_1360)
    {
        float _1470 = fma(_1396, _1462, _1398);
        _1402 = _1470;
    }
    float _1472 = _1402;
    if (!_1360)
    {
        float _1474 = fma(_1468, _1462, _748);
        _1344 = _1474;
    }
    float _1476 = _1344;
    if (!_1360)
    {
        float _1478 = fma(_1458, _1462, _1194);
        _1322 = _1478;
    }
    float _1480 = _1322;
    float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1484 = _1472 + _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1488 = _1476 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1492 = _1480 + _1490;
    float _1494 = _1484 * _1484;
    float _1496 = fma(_1488, _1488, _1494);
    float _1498 = fma(_1492, _1492, _1496);
    float _1500 = rsqrt(_1498);
    float _1502 = sqrt(_1498);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1488 * _1504;
    float _1508 = _1492 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1238;
    float _1526 = _1522;
    float _1528 = _1484;
    float _1530 = _1506;
    float _1532 = _1508;
    if (_1518)
    {
        float _1534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1534;
    }
    float _1536 = _1524;
    float _1538 = _1536;
    if (_1518)
    {
        float _1540 = _1522 * _1536;
        _1526 = _1540;
    }
    float _1542 = _1526;
    if (_1518)
    {
        float _1544 = rsqrt(_1514);
        _1538 = _1544;
    }
    float _1546 = _1538;
    if (_1518)
    {
        float _1548 = _1542 * 0.15915493667125701904296875;
        _1262 = _1548;
    }
    float _1550 = _1262;
    float _1552 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1554 = _1414;
    if (_1518)
    {
        float _1556 = _1550 * 6.283185482025146484375;
        float _1558 = sin(_1556);
        _1554 = _1558;
    }
    float _1560 = _1554;
    float _1562 = precise::max(0.0, _1552);
    float _1564 = _1232;
    float _1566 = _1562;
    if (_1518)
    {
        float _1568 = _1550 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        _1564 = _1570;
    }
    float _1572 = _1564;
    float _1574 = -_1504;
    float _1576 = -_1562;
    float _1578 = fma(_1484, _1574, _1576);
    if (_1518)
    {
        float _1580 = _1578 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1580;
    }
    float _1582 = _1528;
    float _1584 = _1560;
    float _1586 = _1582;
    if (_1518)
    {
        float _1588 = fma(_1560, _1582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1264 = _1588;
    }
    float _1590 = _1264;
    float _1592 = _1590;
    if (!_1518)
    {
        _1584 = _1578;
    }
    float _1594 = _1584;
    float _1596 = _1594;
    if (_1518)
    {
        float _1598 = _1546 * _1590;
        _1592 = _1598;
    }
    float _1600 = _1592;
    if (_1518)
    {
        float _1602 = _1572 + (-1.0);
        _1566 = _1602;
    }
    float _1604 = _1566;
    float _1606 = _1604;
    if (_1518)
    {
        float _1608 = _1506 * _1600;
        _1530 = _1608;
    }
    float _1610 = _1530;
    if (_1518)
    {
        float _1612 = _1508 * _1600;
        _1532 = _1612;
    }
    float _1614 = _1532;
    if (_1518)
    {
        float _1616 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1616;
    }
    float _1618 = _1586;
    float _1620 = _1618;
    if (!_1518)
    {
        _1606 = _1512;
    }
    float _1622 = _1606;
    float _1624 = _1622;
    if (_1518)
    {
        float _1626 = _1614 * _1614;
        _1624 = _1626;
    }
    float _1628 = _1624;
    if (_1518)
    {
        float _1630 = fma(_1578, _1572, _1618);
        _1596 = _1630;
    }
    float _1632 = _1596;
    if (!_1518)
    {
        _1620 = _1510;
    }
    float _1634 = _1620;
    float _1636 = _1634;
    if (_1518)
    {
        float _1638 = _1610 * _1610;
        _1636 = _1638;
    }
    float _1640 = _1636;
    float _1642 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1644 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1646 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1648 = fma(_1632, _1632, _1640);
    float _1650 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1642);
    float _1652 = floor(_1644);
    float _1654 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1646);
    float _1656 = _1648 + _1628;
    float _1658 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1650);
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1662 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1660);
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1668 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1670 = rsqrt(_1656);
    float _1672 = -_1664;
    float _1674 = _1672 + 1.0;
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = fma(_1194, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1682 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1666);
    float _1684 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1686 = -_1678;
    float _1688 = fma(_1686, _1676, 1.0);
    float _1690 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1692 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1682);
    float _1694 = abs(_1674);
    float _1696 = log2(_1694);
    float _1698 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1700 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1690);
    float _1702 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = _1670 * _1610;
    float _1706 = _1670 * _1632;
    float _1708 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1700);
    float _1710 = _1670 * _1614;
    float _1712 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1714 = floor(_1680);
    float _1716 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1720 = -_1712;
    float _1722 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1720);
    float _1724 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1728 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1730 = -_1710;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1722);
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1718);
    float _1736 = log2(_1688);
    float _1738 = fma(_1732, -0.5, 0.5);
    float _1740 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1742 = fma(_1732, 0.5, 0.5);
    float _1744 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1740);
    float _1746 = exp2(_1726);
    float _1748 = -_1652;
    float _1750 = _1644 + _1748;
    float _1752 = -_1714;
    float _1754 = _1680 + _1752;
    float _1756 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1758 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1728);
    float _1760 = _1706 + 1.0;
    float _1762 = fma(_1742, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1764 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1756);
    float _1766 = 1.0 / _1744;
    float _1768 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1758);
    float _1770 = fma(_1742, _1762, -0.212114393711090087890625);
    float _1772 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1764);
    float _1774 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1768);
    float _1776 = sqrt(_1738);
    float _1778 = -_1706;
    float _1780 = fma(_1746, _1760, _1778);
    float _1782 = _1736 * 0.693147182464599609375;
    float2 _5140 = float2(_1750, _1754);
    float _1784 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5140, float2(0.0), isnan(_5140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5140, float2(0.0), isnan(_5140)), level(0.0)).x;
    float _1786 = fma(_1742, _1770, 1.570728778839111328125);
    float _1788 = fma(_1780, 0.5, 0.5);
    float _1790 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1792 = _1772 * _1766;
    float _1794 = _1774 * _1766;
    float _1796 = fma(_1792, 0.5, 0.5);
    float _1798 = fma(_1794, -0.5, 0.5);
    float _1800 = _1776 * 0.636619746685028076171875;
    float3 _5172 = float3(_1796, _1798, _1790);
    float _1802 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).x;
    float _1804 = -_1786;
    float _1806 = fma(_1800, _1804, 1.0);
    float3 _5188 = float3(_1796, _1798, _1790);
    float4 _1809 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5188, float3(0.0), isnan(_5188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5188, float3(0.0), isnan(_5188)), level(0.0)).xyzw;
    float _1811 = _1809.x;
    float _1813 = _1809.y;
    float _1815 = _1809.z;
    float _1817 = _1809.w;
    float2 _5204 = float2(_1806, _1788);
    float3 _1821 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5204, float2(0.0), isnan(_5204)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5204, float2(0.0), isnan(_5204)), level(0.0)).xyz;
    float _1823 = _1821.x;
    float _1825 = _1821.y;
    float _1827 = _1821.z;
    float _1829 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1831 = in.m_71.y;
    float _1833 = -_1094;
    float _1835 = -_1070;
    bool _1837 = _1833 != _1835;
    bool _1839 = isnan(_1833);
    bool _1841 = _1837 || _1839;
    bool _1843 = isnan(_1835);
    bool _1845 = _1841 || _1843;
    float _1847 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = _1829 * _368;
    float _1851 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1853 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1855 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1857 = _1078 == 0.0;
    bool _1859 = !_1845;
    bool _1861 = _1857 && _1859;
    float _1863 = _1851 * _368;
    int _1865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1867 = _1865 != 0;
    float _1869 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1873 = _1871 != 0;
    float _1875 = trunc(_1849);
    int _1877 = int(_1875);
    float _1879 = in.m_73.x;
    float _1881 = in.m_73.y;
    float _1883 = in.m_73.z;
    bool _1885 = _1090 == 0.0;
    bool _1887 = _1885 && _1861;
    float _1889 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    bool _1891 = _368 > 0.5;
    bool _1893 = _1891 && _1867;
    bool _1895 = _410 > 0.5;
    float _1897 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1889);
    float _1899 = trunc(_1863);
    int _1901 = int(_1899);
    float _1903 = -_1831;
    float _1905 = _1903 + 1.0;
    float _1907 = _1831;
    if (_1873)
    {
        float _1909 = _1895 ? _1905 : _1831;
        _1907 = _1909;
    }
    float _1911 = _1907;
    float _1913 = exp2(_1847);
    int _1915 = _1877 << 4;
    int _1917 = _1915 + 1712;
    float _1919 = in.m_71.x;
    float _1921 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _1924 = uint(int(uint(_1917) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    int _1940 = _1901 << 4;
    int _1942 = _1940 + 1968;
    float _1944 = _1881;
    float _1946 = _1879;
    float _1948 = _1883;
    if (!_1887)
    {
        float _1950 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1881);
        _1944 = _1950;
    }
    float _1952 = _1944;
    if (!_1887)
    {
        float _1954 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1879);
        _1946 = _1954;
    }
    float _1956 = _1946;
    if (!_1887)
    {
        float _1958 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1883);
        _1948 = _1958;
    }
    float _1960 = _1948;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1964 = _1917 + 8;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    uint _1968 = uint(int(uint(int(_1966)) >> uint(2)));
    int _1970 = int(_1966) & 3;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[int(_1968)][_1970];
    float _1974 = _1156 * _1952;
    float _1976 = -_1952;
    float _1978 = _1150 * _1976;
    float _1980 = _1158 * _1952;
    float _1982 = -_1913;
    float _1984 = _1982 + 1.0;
    float _1986 = fma(_1168, _1956, _1974);
    float _1988 = fma(_1160, _1956, _1978);
    float _1990 = fma(_1180, _1956, _1980);
    uint _1992 = uint(int(uint(_1942) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    float _2008 = fma(_1176, _1960, _1986);
    float _2010 = fma(_1162, _1960, _1988);
    float _2012 = fma(_1186, _1960, _1990);
    float _2014 = in.m_75.y;
    float _2016 = _2008 * _310;
    float _2018 = _2008 * _314;
    float _2020 = _1919;
    if (!_1867)
    {
        _544 = _1919;
    }
    float _2022 = _544;
    float _2024 = _2022;
    if (_1893)
    {
        float _2026 = -_1919;
        float _2028 = _2026 + 1.0;
        _2020 = _2028;
    }
    float _2030 = _2020;
    float _2032 = fma(_2010, _276, _2016);
    float _2034 = fma(_2010, _280, _2018);
    int _2036 = _1942 + 8;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    float _2046 = in.m_75.w;
    if (_1867)
    {
        _2024 = _2030;
    }
    float _2048 = _2024;
    float _2050 = fma(_2012, _322, _2032);
    float _2052 = in.m_75.z;
    float _2054 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2058 = _1921 * _1962;
    bool _2060 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2062 = isnan(_1502);
    bool _2064 = _2060 || _2062;
    bool _2066 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2068 = _2064 || _2066;
    float _2070 = _2056 * _1853;
    out.m_77.x = _2070;
    out.m_77.y = _2058;
    float _2072 = in.m_69.x;
    float _2074 = _1930 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2076 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2078 = _2056;
    float _2080 = _2072;
    if (!_2068)
    {
        _2078 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2082 = _2078;
    out.m_79.y = _2014;
    float _2084 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _2076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.w = _2046;
    float _2088 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_79.z = _2052;
    float _2090 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2092 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_81.x = _2084;
    out.m_81.y = _2086;
    out.m_81.z = _2090;
    out.m_81.w = _1855;
    float _2094 = _2006 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2096 = _2092 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2098 = _2044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2100 = _2094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2102 = _2008 * _302;
    float _2104 = fma(_2012, _326, _2034);
    float _2106 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2108 = fma(_2010, _272, _2102);
    out.m_83.x = _2096;
    out.m_83.y = _2100;
    out.m_83.z = _2106;
    float _2110 = fma(_2012, _318, _2108);
    float _2112 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2114 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2112);
    out.m_85.x = _2050;
    out.m_85.y = _2110;
    out.m_85.z = _2104;
    float _2116 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2114);
    float _2118 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2120 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2122 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2118);
    float _2124 = 1.0 / _2120;
    float _2126 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2122);
    float _2128 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1897);
    float _2130 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.gl_Position.x = _1772;
    out.gl_Position.y = _1774;
    out.gl_Position.z = _2128;
    out.gl_Position.w = _1744;
    float _2132 = _2130 + _2120;
    float _2134 = _2132 * _2124;
    float _2136 = _2134 * 0.5;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2140 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2138);
    float _2142 = -_2054;
    float _2144 = _2142 + 1.0;
    float _2146 = _1772;
    float _2148 = _2128;
    float _2150 = _2144;
    float _2152 = _2082;
    float _2154 = _2082;
    if (!_2068)
    {
        _2146 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2156 = _2146;
    float _2158 = 1.0 / _2140;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2162 = _2158 * _2160;
    float _2164 = abs(_2162);
    float _2166 = log2(_2164);
    bool _2168 = _2162 <= 8000.0;
    bool _2170 = isnan(_2162);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(8000.0);
    bool _2176 = _2172 || _2174;
    float _2178 = float(_2176);
    float _2180 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2182 = exp2(_2180);
    float _2184 = fma(_2182, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2186 = precise::clamp(_2184, 0.0, 1.0);
    float _2188 = fma(_2186, -2.0, 3.0);
    float _2190 = _2186 * _2186;
    float _2192 = _2190 * _2188;
    float _2194 = in.m_75.x;
    float _2196 = -_2192;
    float _2198 = _2196 + 1.0;
    float _2200 = fma(_2198, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2192);
    float _2202 = _2128 + _1744;
    float _2204 = _2178 * _2200;
    float _2206 = _2202 * 0.5;
    float _2208 = _2156;
    float _2210 = _2156;
    if (!_2068)
    {
        _2148 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2212 = _2148;
    float _2214 = _2204 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_87.z = _2206;
    out.m_87.w = _1744;
    out.m_79.x = _2194;
    float _2216 = _2194;
    float _2218 = _2212;
    float _2220 = _2212;
    if (!_2068)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2222 = _2216;
    float _2224 = -_1784;
    float _2226 = _2224 + 1.0;
    float _2228 = _2226 * _2214;
    float _2230 = precise::clamp(_2228, 0.0, 1.0);
    float _2232 = -_2230;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2236 = _2234 * _2072;
    float _2238 = _2222;
    float _2240 = _2222;
    if (!_2068)
    {
        _2080 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2242 = _2080;
    float _2244 = _2054 * _1802;
    float _2246 = _2236 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2248 = _1817 * _2244;
    float _2250 = _1817 * _2144;
    out.m_89.x = _2246;
    float _2252 = _2242;
    float _2254 = _2242;
    if (!_2068)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2256 = _2150;
    float _2258 = _1827 * _2244;
    float _2260 = fma(_1823, _2248, _1811);
    float _2262 = fma(_1825, _2248, _1813);
    float _2264 = fma(_1817, _2258, _1815);
    out.m_91.x = _2260;
    out.m_91.y = _2262;
    out.m_91.z = _2264;
    out.m_91.w = _2250;
    bool _2266 = !_2068;
    float _2268 = _2256;
    float _2270 = _2256;
    if (!_2266)
    {
        bool _2272 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2274 = isnan(_1502);
        bool _2276 = _2272 || _2274;
        bool _2278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2280 = _2276 || _2278;
        if (!_2280)
        {
            float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2284 = _1502 + _2282;
            float _2286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2286;
            float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2292 = _2290 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2296 = _2294 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2298 = 1.0 / _2288;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2302 = _2300 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2310 = _2308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2312 = _2284 * _2298;
            float _2314 = precise::clamp(_2312, 0.0, 1.0);
            float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2318 = _2316 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2320 = fma(_2314, _2292, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2322 = fma(_2314, _2296, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2324 = fma(_2314, _2302, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2326 = fma(_2314, _2318, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2328 = fma(_2314, _2306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2330 = fma(_2314, _2310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2154 = _2322;
            _2270 = _2328;
            _2220 = _2320;
            _2254 = _2326;
            _2210 = _2324;
            _2240 = _2330;
            _2332 = true;
        }
        else
        {
            bool _2334 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2336 = isnan(_1502);
            bool _2338 = _2334 || _2336;
            bool _2340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2342 = _2338 || _2340;
            if (!_2342)
            {
                _2218 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2344 = _2218;
            _2220 = _2344;
            if (!_2342)
            {
                _2152 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2346 = _2152;
            _2154 = _2346;
            if (!_2342)
            {
                _2208 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2348 = _2208;
            _2210 = _2348;
            if (!_2342)
            {
                _2252 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2350 = _2252;
            _2254 = _2350;
            if (!_2342)
            {
                _2268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2352 = _2268;
            _2270 = _2352;
            if (!_2342)
            {
                _2238 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2354 = _2238;
            bool _2356 = !_2342;
            _2240 = _2354;
            if (!_2356)
            {
                bool _2358 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2360 = isnan(_1502);
                bool _2362 = _2358 || _2360;
                bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2366 = _2362 || _2364;
                if (!_2366)
                {
                    float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2370 = _1502 + _2368;
                    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2372;
                    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2378 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2384 = 1.0 / _2374;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2398 = _2370 * _2384;
                    float _2400 = precise::clamp(_2398, 0.0, 1.0);
                    float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2406 = fma(_2400, _2378, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2408 = fma(_2400, _2382, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2410 = fma(_2400, _2388, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2412 = fma(_2400, _2404, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2414 = fma(_2400, _2392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2416 = fma(_2400, _2396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2154 = _2408;
                    _2270 = _2414;
                    _2220 = _2406;
                    _2254 = _2412;
                    _2210 = _2410;
                    _2240 = _2416;
                    _2332 = true;
                }
                else
                {
                    _2154 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2220 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2254 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2210 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2240 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2332 = false;
    float _2418 = _2154;
    float _2420 = _2270;
    float _2422 = _2220;
    float _2424 = _2254;
    float _2426 = _2210;
    float _2428 = _2240;
    float _2430 = fma(_2110, -0.5, 0.5);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = -_2418;
    float _2436 = _2434 + _2420;
    float _2438 = -_2422;
    float _2440 = _2438 + _2424;
    float _2442 = -_2426;
    float _2444 = _2442 + _2428;
    bool _2446 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2448 = fma(_2432, _2436, _2418);
    float _2450 = fma(_2432, _2440, _2422);
    float _2452 = fma(_2432, _2444, _2426);
    float _2454 = _2448 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2456 = fma(_2450, 0.298911988735198974609375, _2454);
    float _2458 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2460 = fma(_2452, 0.114477999508380889892578125, _2456);
    out.m_89.w = _2458;
    float _2462 = -_2460;
    float _2464 = _2450 + _2462;
    float _2466 = -_2460;
    float _2468 = _2448 + _2466;
    float _2470 = -_2460;
    float _2472 = _2452 + _2470;
    out.m_93.x = 0.0;
    float _2474 = fma(_2464, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    float _2476 = fma(_2468, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    float _2478 = fma(_2472, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2460);
    out.m_95.x = _2474;
    out.m_95.y = _2476;
    out.m_95.z = _2478;
    if (!_2446)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2480 = -_1472;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2484 = -_1476;
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2488 = -_1480;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2492 = _2482 * _2482;
    float _2494 = fma(_2486, _2486, _2492);
    float _2496 = fma(_2490, _2490, _2494);
    float _2498 = sqrt(_2496);
    float _2500 = rsqrt(_2496);
    float _2502 = -_2498;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2506 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2486 * _2500;
    float _2512 = _2482 * _2500;
    float _2514 = abs(_2508);
    float _2516 = log2(_2514);
    float _2518 = _2490 * _2500;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2522 = _2110 * _2512;
    float _2524 = -_2512;
    float _2526 = -_2520;
    float _2528 = fma(_2524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2526);
    float _2530 = fma(_2050, _2510, _2522);
    float _2532 = -_2518;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2528);
    float _2536 = fma(_2104, _2518, _2530);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2542 = _2534 + _2540;
    float _2544 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2546 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = exp2(_2544);
    float _2552 = _2550 * _2548;
    float _2554 = _2538 * _2552;
    float _2556 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2556;
    out.m_93.y = _2558;
    out.m_93.z = _2560;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

