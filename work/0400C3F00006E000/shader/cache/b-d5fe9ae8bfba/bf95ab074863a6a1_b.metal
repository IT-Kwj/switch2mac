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
    float4 m_63 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_81 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_69 [[attribute(10)]];
    float4 m_73 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2135 = false;
    bool _1400 = false;
    bool _446 = false;
    bool _330 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_50.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2420 = as_type<float>(_130);
        out.gl_Position.z = _2420;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_55.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_53.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2489 = as_type<float>(_168);
        out.gl_Position.z = _2489;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_59.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _244;
    float _250 = -_240;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = _228 * _248;
    bool _260 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_224);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = fma(_256, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _270 * _252;
    float _284 = fma(_274, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_280, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = _276 * _282;
    float _294 = _284 * _282;
    float _296 = _286 * _282;
    float _298 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _300 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _304 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].x, _298);
    float _306 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].y, _300);
    float _308 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].z, _302);
    bool _310 = !_246;
    float _328;
    if (!_310)
    {
        float _312 = in.m_59.x;
        float _314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _320 = _318 * _314;
        float _322 = floor(_320);
        float _324 = -_322;
        float _326 = _320 + _324;
        _328 = _326;
        _330 = true;
    }
    else
    {
        float _332 = float(_114);
        float _334 = 1.0 / _332;
        float _336 = _148 * _334;
        _328 = _336;
    }
    _330 = false;
    float _338 = _328;
    bool _340 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _342 = isnan(_338);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _356 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _358 = isnan(_338);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _338 + _372;
    float _376 = 1.0 / _354;
    float _378 = -_350;
    float _380 = _378 + 1.0;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _384 = _366 * _380;
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = _370 * _376;
    float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _398 = _396 * _384;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _398);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _406 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[116].x, _402);
    float _410 = in.m_61.x;
    float _412 = in.m_61.y;
    float _414 = in.m_61.z;
    float _416 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _416;
    out.m_63.y = _406;
    out.m_63.z = _394;
    out.m_63.w = _418;
    float _420 = _308 * _414;
    float _422 = _306 * _412;
    float _424 = _304 * _410;
    bool _426 = !_382;
    float _444;
    if (!_426)
    {
        float _428 = in.m_59.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_114);
        float _450 = 1.0 / _448;
        float _452 = _148 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = in.m_59.z;
    float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _460 = log2(_458);
    float _462 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = in.m_59.x;
    float _466 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _470 = 1.0 + _468;
    float _472 = in.m_59.y;
    float _474 = 1.0 / _470;
    float _476 = _460 * _148;
    float _478 = exp2(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _456 * 2.0;
    float _494 = _464 * 2.0;
    float _496 = floor(_492);
    float _498 = _464 + _472;
    float _500 = _472 * 2.0;
    float _502 = _498 + (-1.0);
    float _504 = -_478;
    float _506 = _504 + 1.0;
    float _508 = floor(_494);
    bool _510 = _496 > 0.0;
    float _512 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _514 = _496 >= 0.0;
    bool _516 = isnan(_496);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = floor(_500);
    int _526 = _522 ? 0 : 1;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    int _538 = ~_526;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    bool _544 = !_482;
    int _546 = _544 ? 0 : 1;
    int _548 = _542;
    float _550 = _454;
    if (!_510)
    {
        int _552 = ~_526;
        int _554 = _552 + 1;
        _548 = _554;
    }
    int _556 = _548;
    float _558 = in.m_65.x;
    float _560 = in.m_65.y;
    float _562 = in.m_65.z;
    int _564 = abs(_546);
    bool _566 = _508 > 0.0;
    bool _568 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    bool _578 = _508 >= 0.0;
    bool _580 = isnan(_508);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = float(_564);
    float _590 = float(_556);
    bool _592 = !_486;
    int _594 = _592 ? 0 : 1;
    float _596 = _576 ? _506 : 0.0;
    float _598 = _588 * _590;
    int _600 = _586 ? 0 : 1;
    bool _602 = _524 > 0.0;
    if (_536)
    {
        float _604 = _596 * _474;
        _152 = _604;
    }
    float _606 = _152;
    int _608 = abs(_594);
    float _610 = _598 * (-2.0);
    bool _612 = _524 >= 0.0;
    bool _614 = isnan(_524);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = _464 + (-0.5);
    float _624 = fma(_610, _558, _558);
    int _626 = ~_600;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = _472 + _456;
    bool _634 = !_490;
    int _636 = _634 ? 0 : 1;
    float _638 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].x, _624);
    int _640 = _630;
    if (!_566)
    {
        int _642 = ~_600;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _632 + (-1.0);
    int _650 = _620 ? 0 : 1;
    float _652 = float(_608);
    int _654 = abs(_636);
    float _656 = float(_646);
    float _658 = fma(_512, _610, _512);
    int _660 = ~_650;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    if (!_602)
    {
        int _668 = ~_650;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _652 * _656;
    float _676 = fma(_658, _606, _638);
    float _678 = _674 * (-2.0);
    float _680 = float(_654);
    float _682 = _676 * 0.15915493667125701904296875;
    float _684 = float(_672);
    float _686 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _688 = fma(_678, _560, _560);
    float _690 = _464 + _456;
    float _692 = _680 * _684;
    float _694 = _472 + (-0.5);
    float _696 = fma(_686, _678, _686);
    float _698 = _690 + (-1.0);
    float _700 = _692 * (-2.0);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _688);
    float _704 = _456 + (-0.5);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _682 * 6.283185482025146484375;
    float _710 = cos(_708);
    float _712 = fma(_696, _606, _702);
    float _714 = fma(_700, _562, _562);
    float _716 = fma(_706, _700, _706);
    float _718 = in.m_67.x;
    float _720 = in.m_67.y;
    float _722 = in.m_67.z;
    float _724 = _712 * 0.15915493667125701904296875;
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _728 = _682 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_716, _606, _726);
    float _734 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _732 * 0.15915493667125701904296875;
    float _738 = _724 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _724 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _752 = _736 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _462 * _746;
    float _758 = _466 * _748;
    float _760 = _734 * _750;
    float _762 = in.m_50.x;
    float _764 = in.m_50.y;
    float _766 = in.m_50.z;
    float _768 = _710 * _740;
    float _770 = _730 * _740;
    float _772 = _736 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _710 * _744;
    float _778 = _730 * _744;
    float _780 = _710 * _754;
    float _782 = _730 * _754;
    float _784 = _744 * _754;
    float _786 = _740 * _754;
    float _788 = _780 * _758;
    float _790 = fma(_774, _776, _770);
    float _792 = fma(_774, _770, _776);
    float _794 = -_758;
    float _796 = _774 * _794;
    float _798 = -_768;
    float _800 = fma(_774, _778, _798);
    float _802 = _782 * _758;
    float _804 = -_778;
    float _806 = fma(_774, _768, _804);
    float _808 = fma(_790, _756, _788);
    float _810 = fma(_784, _756, _796);
    float _812 = fma(_800, _756, _802);
    float _814 = _764 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _816 = fma(_806, _760, _808);
    float _818 = fma(_786, _760, _810);
    float _820 = _764 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[4].x, _814);
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _828 = fma(_792, _760, _812);
    float _830 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].x, _826);
    float _836 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].z, _822);
    float _838 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].z, _830);
    float _840 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _832);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _834);
    float _844 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _846 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _850 = _842 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _852 = _764 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _854 = _844 + _848;
    float _856 = _846 + _850;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[5].x, _852);
    float _860 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _862 = _854 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _866 = _856 + _864;
    float _868 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].z, _858);
    float _870 = fma(_844, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _872 = _862 * _862;
    float _874 = _866 * _866;
    float _876 = floor(_870);
    float _878 = _872 + _874;
    float _880 = sqrt(_878);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = _880 + _884;
    float _888 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _892 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _894 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _896 = fma(_846, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _898 = _842;
    float _900 = _816;
    float _902 = _868;
    float _904 = _856;
    float _906 = _806;
    float _908 = _872;
    float _910 = _874;
    if (_882)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _898 = _912;
    }
    float _914 = _898;
    float _916 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _918 = _894 + _916;
    float _920 = _916;
    float _922 = _918;
    if (!_882)
    {
        _920 = _854;
    }
    float _924 = _920;
    float _926 = _924;
    if (_882)
    {
        float _928 = rsqrt(_878);
        _900 = _928;
    }
    float _930 = _900;
    if (_882)
    {
        float _932 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _902 = _932;
    }
    float _934 = _902;
    float _936 = _914;
    float _938 = _934;
    if (_882)
    {
        float _940 = _886 * _914;
        _936 = _940;
    }
    float _942 = _936;
    float _944 = floor(_896);
    float _946 = _942;
    if (_882)
    {
        float _948 = _942 * 0.15915493667125701904296875;
        _946 = _948;
    }
    float _950 = _946;
    float _952 = _762;
    if (_882)
    {
        float _954 = _950 * 6.283185482025146484375;
        float _956 = sin(_954);
        _952 = _956;
    }
    float _958 = _952;
    float _960 = -_944;
    float _962 = _896 + _960;
    if (_882)
    {
        float _964 = fma(_958, _934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _938 = _964;
    }
    float _966 = _938;
    float _968 = _966;
    if (_882)
    {
        float _970 = _930 * _966;
        _968 = _970;
    }
    float _972 = _968;
    float _974 = -_876;
    float _976 = _870 + _974;
    if (_882)
    {
        float _978 = fma(_862, _972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _926 = _978;
    }
    float _980 = _926;
    if (_882)
    {
        float _982 = fma(_866, _972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _904 = _982;
    }
    float _984 = _904;
    float _986 = fma(_980, 6.2500002968590706586837768554688e-05, 0.5);
    float _988 = fma(_984, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3764 = float2(_986, _988);
    float3 _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3764, float2(0.0), isnan(_3764)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3764, float2(0.0), isnan(_3764)), level(0.0)).xyz;
    float _994 = _992.x;
    float _996 = _992.y;
    float _998 = _992.z;
    float2 _3780 = float2(_976, _962);
    float _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3780, float2(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3780, float2(0.0), isnan(_3780)), level(0.0)).x;
    float _1002 = in.m_69.x;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1012 = _472 > 0.5;
    float _1014 = 1.0 / _1006;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1016;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1022 = _1020 != 0;
    bool _1024 = _720 != 0.0;
    bool _1026 = isnan(_720);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = in.m_69.y;
    bool _1036 = _464 > 0.5;
    bool _1038 = _1036 && _1022;
    float _1040 = 1.0 / _1010;
    bool _1042 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1044 = isnan(_454);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1058 = _718 == 0.0;
    bool _1060 = !_1032;
    bool _1062 = _1058 && _1060;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1066 = _1064 != 0;
    float _1068 = -_1052;
    float _1070 = _1068 + 1.0;
    bool _1072 = _722 == 0.0;
    bool _1074 = _1072 && _1062;
    float _1076 = _1018 * _1014;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1080 = _454 + _1078;
    float _1082 = in.m_71.x;
    float _1084 = in.m_71.y;
    float _1086 = in.m_71.z;
    float _1088 = 0.0;
    if (_1022)
    {
        _1088 = _1002;
    }
    float _1090 = _1088;
    float _1092 = fma(_1076, _1080, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1094 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1096 = isnan(_454);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1056 * _1040;
    bool _1108 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1110 = isnan(_454);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = _1090;
    float _1122 = _1034;
    if (_1038)
    {
        float _1124 = -_1090;
        float _1126 = _1124 + 1.0;
        _1120 = _1126;
    }
    float _1128 = _1120;
    float _1130 = _1104 * _1070;
    float _1132 = -_1104;
    float _1134 = _1132 + 1.0;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1138 = _454 + _1136;
    if (!_1022)
    {
        _550 = _1002;
    }
    float _1140 = _550;
    float _1142 = -_1034;
    float _1144 = _1142 + 1.0;
    float _1146 = _1118 * _1134;
    float _1148 = -_1118;
    float _1150 = _1148 + 1.0;
    float _1152 = _1140;
    if (_1022)
    {
        _1152 = _1128;
    }
    float _1154 = _1152;
    float _1156 = fma(_1106, _1138, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1158 = _1092 * _1146;
    float _1160 = _1128;
    if (_882)
    {
        float _1162 = _950 * 6.283185482025146484375;
        float _1164 = cos(_1162);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1170 = _780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1172 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1158);
    float _1174 = _806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1084;
    float _1178 = _1082;
    float _1180 = _1086;
    if (!_1074)
    {
        float _1182 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1084);
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = _780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1188 = _1184;
    if (!_1074)
    {
        float _1190 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1082);
        _1178 = _1190;
    }
    float _1192 = _1178;
    if (!_1074)
    {
        float _1194 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1180 = _1194;
    }
    float _1196 = _1180;
    float _1198 = fma(_1156, _1130, _1172);
    float _1200 = -_774;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1186);
    float _1204 = -_774;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1168);
    float _1208 = -_774;
    float _1210 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1170);
    float _1212 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1198);
    float _1214 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1202);
    float _1216 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1206);
    float _1218 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1210);
    float _1220 = _790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1214 * _1184;
    float _1224 = _1216 * _1184;
    float _1226 = _1218 * _1184;
    float _1228 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1230 = _1228;
    if (_882)
    {
        float _1232 = _1166 + (-1.0);
        _1188 = _1232;
    }
    float _1234 = _1188;
    float _1236 = _790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1238 = _790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1240 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1228);
    if (_882)
    {
        float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1242;
    }
    float _1244 = _1230;
    float _1246 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1236);
    float _1248 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1238);
    float _1250 = _806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1252 = _806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1254 = _1246;
    if (_882)
    {
        float _1256 = fma(_918, _1166, _1244);
        _922 = _1256;
    }
    float _1258 = _922;
    if (_882)
    {
        float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1262 = _980 + _1260;
        _906 = _1262;
    }
    float _1264 = _906;
    float _1266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1268 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1246);
    float _1270 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1248);
    if (_882)
    {
        float _1272 = _1264 * _1264;
        _908 = _1272;
    }
    float _1274 = _908;
    float _1276 = in.m_73.w;
    if (_882)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1280 = _984 + _1278;
        _1254 = _1280;
    }
    float _1282 = _1254;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1286 = _1258 + _1284;
    if (_1066)
    {
        float _1288 = _1012 ? _1144 : _1034;
        _1122 = _1288;
    }
    float _1290 = _1122;
    float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1294 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1250);
    float _1296 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1298 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1252);
    if (_882)
    {
        float _1300 = _1282 * _1282;
        _910 = _1300;
    }
    float _1302 = _910;
    float _1304 = fma(_1286, _1286, _1274);
    float _1306 = fma(_1240, _1192, _1222);
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1310 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1312 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1296);
    float _1314 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1316 = _1304 + _1302;
    float _1318 = fma(_1270, _1192, _1226);
    float _1320 = _1308 * _1266;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1324 = sqrt(_1316);
    float _1326 = fma(_1268, _1192, _1224);
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1330 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1334 = fma(_1310, _1196, _1306);
    float _1336 = fma(_1312, _1196, _1326);
    float _1338 = _1330 * _1292;
    float _1340 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1348 = fma(_1314, _1196, _1318);
    out.m_75.w = _1276;
    bool _1350 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1352 = isnan(_1324);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1358 = _1354 || _1356;
    out.m_77.x = _1338;
    out.m_77.y = _1320;
    out.m_79.x = _1340;
    out.m_79.y = _1342;
    out.m_79.z = _1344;
    out.m_79.w = _1346;
    out.m_81.x = _1334;
    out.m_81.y = _1336;
    out.m_81.z = _1348;
    float _1360 = _1316;
    float _1362 = _1304;
    if (!_1358)
    {
        _1360 = 1.0;
    }
    float _1364 = _1360;
    out.m_83.x = _994;
    out.m_83.y = _996;
    out.m_83.z = _998;
    bool _1366 = !_1358;
    float _1368 = _1364;
    float _1370 = _994;
    if (!_1366)
    {
        bool _1372 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1324);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1324 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1368 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1324);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1324 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1368 = _1428;
                _1400 = true;
            }
            else
            {
                _1368 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1368;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1434 = _1258 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _980 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _984 + _1440;
    float _1444 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1446 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = fma(_1442, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1450 = -_894;
    float _1452 = _1450 + _1444;
    float _1454 = -_844;
    float _1456 = _1454 + _1446;
    float _1458 = -_846;
    float _1460 = _1458 + _1448;
    float _1462 = _1452 * _1452;
    float _1464 = fma(_1456, _1456, _1462);
    float _1466 = fma(_1460, _1460, _1464);
    float _1468 = sqrt(_1466);
    bool _1470 = _1468 > 0.0;
    float _1472 = _1444;
    float _1474 = _1448;
    float _1476 = _1446;
    if (!_1470)
    {
        _1370 = _1446;
    }
    float _1478 = _1370;
    bool _1480 = !_1470;
    float _1482 = _1478;
    if (!_1480)
    {
        float _1484 = _192 * _192;
        float _1486 = fma(_190, _190, _1484);
        float _1488 = fma(_194, _194, _1486);
        float _1490 = rsqrt(_1466);
        float _1492 = sqrt(_1488);
        float _1494 = _1456 * _1490;
        float _1496 = _1452 * _1490;
        float _1498 = _1460 * _1490;
        bool _1500 = _1492 > 0.0;
        float _1502 = _1492;
        _1362 = _1498;
        if (!_1500)
        {
            _1502 = _1446;
        }
        float _1504 = _1502;
        bool _1506 = !_1500;
        _1482 = _1504;
        if (!_1506)
        {
            float _1508 = rsqrt(_1488);
            float _1510 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1512 = _192 * _1508;
            float _1514 = _190 * _1508;
            float _1516 = _194 * _1508;
            float _1518 = _1496 * _1512;
            float _1520 = fma(_1494, _1514, _1518);
            float _1522 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1524 = fma(_1498, _1516, _1520);
            float _1526 = _1524 * _1522;
            float _1528 = fma(_190, _1526, _1446);
            float _1530 = fma(_192, _1526, _1444);
            float _1532 = fma(_194, _1526, _1448);
            _1472 = _1530;
            _1482 = _1528;
            _1474 = _1532;
        }
    }
    float _1534 = _1472;
    float _1536 = _1482;
    float _1538 = _1474;
    float _1540 = _1362;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1534 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1536 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = sqrt(_1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1548 * _1564;
    float _1568 = _1552 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _194;
    float _1586 = _1582;
    float _1588 = _1544;
    float _1590 = _1540;
    float _1592 = _1566;
    if (_1578)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1594;
    }
    float _1596 = _1584;
    float _1598 = _1596;
    if (_1578)
    {
        float _1600 = _1582 * _1596;
        _1586 = _1600;
    }
    float _1602 = _1586;
    if (_1578)
    {
        float _1604 = rsqrt(_1574);
        _1598 = _1604;
    }
    float _1606 = _1598;
    float _1608 = _1606;
    if (_1578)
    {
        float _1610 = _1602 * 0.15915493667125701904296875;
        _1476 = _1610;
    }
    float _1612 = _1476;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = _1552;
    if (_1578)
    {
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = precise::max(0.0, _1614);
    float _1626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1628 = _192;
    float _1630 = _1624;
    if (_1578)
    {
        float _1632 = _1612 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1628 = _1634;
    }
    float _1636 = _1628;
    float _1638 = -_1564;
    float _1640 = -_1624;
    float _1642 = fma(_1544, _1638, _1640);
    if (_1578)
    {
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1644;
    }
    float _1646 = _1588;
    float _1648 = _1622;
    float _1650 = _1646;
    if (_1578)
    {
        float _1652 = fma(_1622, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = _1654;
    if (!_1578)
    {
        _1650 = _1642;
    }
    float _1658 = _1650;
    float _1660 = _1658;
    if (_1578)
    {
        float _1662 = _1606 * _1654;
        _1590 = _1662;
    }
    float _1664 = _1590;
    if (!_1578)
    {
        _1656 = _1570;
    }
    float _1666 = _1656;
    float _1668 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = _1666;
    float _1672 = _1636;
    if (_1578)
    {
        float _1674 = _1636 + (-1.0);
        _1630 = _1674;
    }
    float _1676 = _1630;
    float _1678 = _1676;
    if (_1578)
    {
        float _1680 = _1566 * _1664;
        _1592 = _1680;
    }
    float _1682 = _1592;
    float _1684 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    if (_1578)
    {
        float _1686 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1686;
    }
    float _1688 = _1608;
    if (!_1578)
    {
        _1678 = _1568;
    }
    float _1690 = _1678;
    float _1692 = _1690;
    if (_1578)
    {
        float _1694 = _1568 * _1664;
        _1692 = _1694;
    }
    float _1696 = _1692;
    if (_1578)
    {
        float _1698 = _1682 * _1682;
        _1670 = _1698;
    }
    float _1700 = _1670;
    if (_1578)
    {
        float _1702 = fma(_1642, _1636, _1688);
        _1660 = _1702;
    }
    float _1704 = _1660;
    if (!_1578)
    {
        _1672 = _1572;
    }
    float _1706 = _1672;
    float _1708 = _1706;
    if (_1578)
    {
        float _1710 = _1696 * _1696;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1716 = fma(_1704, _1704, _1700);
    float _1718 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1714);
    float _1720 = _1716 + _1712;
    float _1722 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1726 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1724);
    float _1728 = precise::clamp(_1726, 0.0, 1.0);
    float _1730 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1718);
    float _1732 = rsqrt(_1720);
    float _1734 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = -_1728;
    float _1738 = _1736 + 1.0;
    float _1740 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1722);
    float _1742 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1744 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1746 = abs(_1738);
    float _1748 = log2(_1746);
    float _1750 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1740);
    float _1752 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1744);
    float _1754 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1626, 1.0);
    float _1764 = _1732 * _1682;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1770 = _1732 * _1704;
    float _1772 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1774 = _1732 * _1696;
    float _1776 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1768);
    float _1778 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1780 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1782 = -_1772;
    float _1784 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1776);
    float _1788 = log2(_1762);
    float _1790 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1792 = -_1774;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1796 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1786);
    float _1798 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1790);
    float _1802 = fma(_1794, -0.5, 0.5);
    float _1804 = fma(_1794, 0.5, 0.5);
    float _1806 = exp2(_1780);
    float _1808 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1798);
    float _1810 = _1770 + 1.0;
    float _1812 = fma(_1804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1814 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1800);
    float _1816 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1808);
    float _1818 = fma(_1804, _1812, -0.212114393711090087890625);
    float _1820 = 1.0 / _1796;
    float _1822 = _1788 * 0.693147182464599609375;
    float _1824 = fma(_1804, _1818, 1.570728778839111328125);
    float _1826 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1828 = sqrt(_1802);
    float _1830 = -_1770;
    float _1832 = fma(_1806, _1810, _1830);
    float _1834 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1816);
    float _1836 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1814);
    float _1838 = fma(_1832, 0.5, 0.5);
    float _1840 = _1834 * _1820;
    float _1842 = _1836 * _1820;
    float _1844 = fma(_1840, 0.5, 0.5);
    float _1846 = fma(_1842, -0.5, 0.5);
    float _1848 = _1828 * 0.636619746685028076171875;
    float _1850 = -_1824;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _5228 = float3(_1844, _1846, _1826);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5228, float3(0.0), isnan(_5228)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5228, float3(0.0), isnan(_5228)), level(0.0)).x;
    float3 _5239 = float3(_1844, _1846, _1826);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5239, float3(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5239, float3(0.0), isnan(_5239)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _5255 = float2(_1852, _1838);
    float3 _1867 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5255, float2(0.0), isnan(_5255)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5255, float2(0.0), isnan(_5255)), level(0.0)).xyz;
    float _1869 = _1867.x;
    float _1871 = _1867.y;
    float _1873 = _1867.z;
    float _1875 = _894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1877 = _894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1879 = -_1000;
    float _1881 = _1879 + 1.0;
    bool _1883 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1885 = isnan(_1562);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1891 = _1887 || _1889;
    float _1893 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1875);
    float _1895 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1877);
    float _1897 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1893);
    float _1899 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1895);
    float _1901 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1903 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1905 = 1.0 / _1901;
    float _1907 = _1903 + _1901;
    float _1909 = _1907 * _1905;
    float _1911 = _1909 * 0.5;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1915 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1913);
    float _1917 = 1.0 / _1915;
    float _1919 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1925 = _1917 * _1923;
    float _1927 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1921);
    float _1929 = abs(_1925);
    float _1931 = log2(_1929);
    float _1933 = in.m_85.x;
    float _1935 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1927);
    float _1937 = _1935 + _1796;
    out.gl_Position.x = _1834;
    out.gl_Position.y = _1836;
    out.gl_Position.z = _1935;
    out.gl_Position.w = _1796;
    bool _1939 = _1925 <= 8000.0;
    bool _1941 = isnan(_1925);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan(8000.0);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    float _1951 = _1937 * 0.5;
    float _1953 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1955 = _1935;
    float _1957 = _1834;
    float _1959 = _1796;
    float _1961 = _1836;
    if (!_1891)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1963 = _1955;
    float _1965 = exp2(_1953);
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1969 = precise::clamp(_1967, 0.0, 1.0);
    float _1971 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1973 = _1834 + _1796;
    float _1975 = _1963;
    float _1977 = _1963;
    if (!_1891)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1979 = _1957;
    float _1981 = fma(_1969, -2.0, 3.0);
    float _1983 = _1969 * _1969;
    float _1985 = _1973 * 0.5;
    float _1987 = exp2(_1971);
    float _1989 = _1983 * _1981;
    float _1991 = -_1989;
    float _1993 = _1991 + 1.0;
    float _1995 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1989);
    float _1997 = _1949 * _1995;
    float _1999 = -_1987;
    float _2001 = _1999 + 1.0;
    float _2003 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2005 = _1881 * _2003;
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = -_2007;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = _1796 * 0.5;
    float _2015 = _1979;
    float _2017 = _1979;
    if (!_1891)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2019 = _1959;
    float _2021 = _2011 * _1933;
    float _2023 = fma(_1836, -0.5, _2013);
    float _2025 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2027 = _2019;
    float _2029 = _2019;
    if (!_1891)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2031 = _1961;
    float _2033 = _2021 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _1985;
    out.m_87.y = _2023;
    out.m_87.z = _1951;
    out.m_87.w = _1796;
    out.m_89.x = _2033;
    float _2035 = _2033;
    float _2037 = _2031;
    float _2039 = _2031;
    if (!_1891)
    {
        _2035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2041 = _2035;
    float _2043 = _2025 * _1854;
    float _2045 = -_2025;
    float _2047 = _2045 + 1.0;
    float _2049 = _1865 * _2043;
    float _2051 = _1873 * _2043;
    float _2053 = _1865 * _2047;
    float _2055 = _2047;
    float _2057 = _2041;
    float _2059 = _2041;
    if (!_1891)
    {
        _2055 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2061 = _2055;
    float _2063 = fma(_1869, _2049, _1859);
    float _2065 = fma(_1871, _2049, _1861);
    float _2067 = fma(_1865, _2051, _1863);
    out.m_91.x = _2063;
    out.m_91.y = _2065;
    out.m_91.z = _2067;
    out.m_91.w = _2053;
    bool _2069 = !_1891;
    float _2071 = _2061;
    float _2073 = _2061;
    if (!_2069)
    {
        bool _2075 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2077 = isnan(_1562);
        bool _2079 = _2075 || _2077;
        bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2083 = _2079 || _2081;
        if (!_2083)
        {
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2087 = _1562 + _2085;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2091 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2089;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2097 = 1.0 / _2091;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2115 = _2087 * _2097;
            float _2117 = precise::clamp(_2115, 0.0, 1.0);
            float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2123 = fma(_2117, _2095, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2125 = fma(_2117, _2121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2127 = fma(_2117, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2129 = fma(_2117, _2105, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2131 = fma(_2117, _2109, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2133 = fma(_2117, _2113, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2073 = _2127;
            _2039 = _2131;
            _2059 = _2123;
            _1977 = _2129;
            _2029 = _2125;
            _2017 = _2133;
            _2135 = true;
        }
        else
        {
            bool _2137 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2139 = isnan(_1562);
            bool _2141 = _2137 || _2139;
            bool _2143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2145 = _2141 || _2143;
            if (!_2145)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2147 = _2057;
            _2059 = _2147;
            if (!_2145)
            {
                _2071 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2149 = _2071;
            _2073 = _2149;
            if (!_2145)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2151 = _2027;
            _2029 = _2151;
            if (!_2145)
            {
                _1975 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2153 = _1975;
            _1977 = _2153;
            if (!_2145)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2155 = _2037;
            _2039 = _2155;
            if (!_2145)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2157 = _2015;
            bool _2159 = !_2145;
            _2017 = _2157;
            if (!_2159)
            {
                bool _2161 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2163 = isnan(_1562);
                bool _2165 = _2161 || _2163;
                bool _2167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2169 = _2165 || _2167;
                if (!_2169)
                {
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2173 = _1562 + _2171;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2177 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2175;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2183 = 1.0 / _2177;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2201 = _2173 * _2183;
                    float _2203 = precise::clamp(_2201, 0.0, 1.0);
                    float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2209 = fma(_2203, _2181, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2211 = fma(_2203, _2207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2213 = fma(_2203, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2215 = fma(_2203, _2191, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2217 = fma(_2203, _2195, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2219 = fma(_2203, _2199, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2073 = _2213;
                    _2039 = _2217;
                    _2059 = _2209;
                    _1977 = _2215;
                    _2029 = _2211;
                    _2017 = _2219;
                    _2135 = true;
                }
                else
                {
                    _2073 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1977 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2135 = false;
    float _2221 = _2073;
    float _2223 = _2039;
    float _2225 = _2059;
    float _2227 = _1977;
    float _2229 = _2029;
    float _2231 = _2017;
    float _2233 = fma(_1336, -0.5, 0.5);
    float _2235 = precise::clamp(_2233, 0.0, 1.0);
    float _2237 = -_2221;
    float _2239 = _2237 + _2223;
    float _2241 = -_2225;
    float _2243 = _2241 + _2227;
    float _2245 = -_2229;
    float _2247 = _2245 + _2231;
    bool _2249 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2251 = fma(_2235, _2239, _2221);
    float _2253 = fma(_2235, _2243, _2225);
    float _2255 = fma(_2235, _2247, _2229);
    float _2257 = _2251 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2259 = fma(_2253, 0.298911988735198974609375, _2257);
    float _2261 = fma(_2255, 0.114477999508380889892578125, _2259);
    float _2263 = -_2261;
    float _2265 = _2253 + _2263;
    float _2267 = -_2261;
    float _2269 = _2251 + _2267;
    float _2271 = -_2261;
    float _2273 = _2255 + _2271;
    float _2275 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2277 = fma(_2265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    float _2279 = fma(_2269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    float _2281 = fma(_2273, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    out.m_53.x = _2275;
    out.m_95.x = _2277;
    out.m_95.y = _2279;
    out.m_95.z = _2281;
    if (!_2249)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2283 = -_1534;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2287 = -_1536;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2291 = -_1538;
    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2295 = _2285 * _2285;
    float _2297 = fma(_2289, _2289, _2295);
    float _2299 = fma(_2293, _2293, _2297);
    float _2301 = sqrt(_2299);
    float _2303 = rsqrt(_2299);
    float _2305 = -_2301;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2309 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = _2289 * _2303;
    float _2315 = _2285 * _2303;
    float _2317 = abs(_2311);
    float _2319 = log2(_2317);
    float _2321 = _2293 * _2303;
    float _2323 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2325 = _1336 * _2315;
    float _2327 = -_2315;
    float _2329 = -_2323;
    float _2331 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2329);
    float _2333 = fma(_1334, _2313, _2325);
    float _2335 = -_2321;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2331);
    float _2339 = fma(_1348, _2321, _2333);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2345 = _2337 + _2343;
    float _2347 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2351 = precise::clamp(_2349, 0.0, 1.0);
    float _2353 = exp2(_2347);
    float _2355 = _2353 * _2351;
    float _2357 = _2341 * _2355;
    float _2359 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2361 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2363 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2359;
    out.m_93.y = _2361;
    out.m_93.z = _2363;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2135 = false;
    bool _1400 = false;
    bool _446 = false;
    bool _330 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_50.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2420 = as_type<float>(_130);
        out.gl_Position.z = _2420;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_55.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_53.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2489 = as_type<float>(_168);
        out.gl_Position.z = _2489;
    }
    if (_162)
    {
        return out;
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_59.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _244;
    float _250 = -_240;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = _228 * _248;
    bool _260 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_224);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = fma(_256, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _270 * _252;
    float _284 = fma(_274, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_280, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = _276 * _282;
    float _294 = _284 * _282;
    float _296 = _286 * _282;
    float _298 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _300 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _304 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].x, _298);
    float _306 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].y, _300);
    float _308 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].z, _302);
    bool _310 = !_246;
    float _328;
    if (!_310)
    {
        float _312 = in.m_59.x;
        float _314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _320 = _318 * _314;
        float _322 = floor(_320);
        float _324 = -_322;
        float _326 = _320 + _324;
        _328 = _326;
        _330 = true;
    }
    else
    {
        float _332 = float(_114);
        float _334 = 1.0 / _332;
        float _336 = _148 * _334;
        _328 = _336;
    }
    _330 = false;
    float _338 = _328;
    bool _340 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _342 = isnan(_338);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _356 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _358 = isnan(_338);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _338 + _372;
    float _376 = 1.0 / _354;
    float _378 = -_350;
    float _380 = _378 + 1.0;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _384 = _366 * _380;
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = _370 * _376;
    float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _398 = _396 * _384;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _398);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _406 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[116].x, _402);
    float _410 = in.m_61.x;
    float _412 = in.m_61.y;
    float _414 = in.m_61.z;
    float _416 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _416;
    out.m_63.y = _406;
    out.m_63.z = _394;
    out.m_63.w = _418;
    float _420 = _308 * _414;
    float _422 = _306 * _412;
    float _424 = _304 * _410;
    bool _426 = !_382;
    float _444;
    if (!_426)
    {
        float _428 = in.m_59.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_114);
        float _450 = 1.0 / _448;
        float _452 = _148 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = in.m_59.z;
    float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _460 = log2(_458);
    float _462 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = in.m_59.x;
    float _466 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _470 = 1.0 + _468;
    float _472 = in.m_59.y;
    float _474 = 1.0 / _470;
    float _476 = _460 * _148;
    float _478 = exp2(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _456 * 2.0;
    float _494 = _464 * 2.0;
    float _496 = floor(_492);
    float _498 = _464 + _472;
    float _500 = _472 * 2.0;
    float _502 = _498 + (-1.0);
    float _504 = -_478;
    float _506 = _504 + 1.0;
    float _508 = floor(_494);
    bool _510 = _496 > 0.0;
    float _512 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _514 = _496 >= 0.0;
    bool _516 = isnan(_496);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = floor(_500);
    int _526 = _522 ? 0 : 1;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    int _538 = ~_526;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    bool _544 = !_482;
    int _546 = _544 ? 0 : 1;
    int _548 = _542;
    float _550 = _454;
    if (!_510)
    {
        int _552 = ~_526;
        int _554 = _552 + 1;
        _548 = _554;
    }
    int _556 = _548;
    float _558 = in.m_65.x;
    float _560 = in.m_65.y;
    float _562 = in.m_65.z;
    int _564 = abs(_546);
    bool _566 = _508 > 0.0;
    bool _568 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    bool _578 = _508 >= 0.0;
    bool _580 = isnan(_508);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = float(_564);
    float _590 = float(_556);
    bool _592 = !_486;
    int _594 = _592 ? 0 : 1;
    float _596 = _576 ? _506 : 0.0;
    float _598 = _588 * _590;
    int _600 = _586 ? 0 : 1;
    bool _602 = _524 > 0.0;
    if (_536)
    {
        float _604 = _596 * _474;
        _152 = _604;
    }
    float _606 = _152;
    int _608 = abs(_594);
    float _610 = _598 * (-2.0);
    bool _612 = _524 >= 0.0;
    bool _614 = isnan(_524);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = _464 + (-0.5);
    float _624 = fma(_610, _558, _558);
    int _626 = ~_600;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = _472 + _456;
    bool _634 = !_490;
    int _636 = _634 ? 0 : 1;
    float _638 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].x, _624);
    int _640 = _630;
    if (!_566)
    {
        int _642 = ~_600;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _632 + (-1.0);
    int _650 = _620 ? 0 : 1;
    float _652 = float(_608);
    int _654 = abs(_636);
    float _656 = float(_646);
    float _658 = fma(_512, _610, _512);
    int _660 = ~_650;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    if (!_602)
    {
        int _668 = ~_650;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _652 * _656;
    float _676 = fma(_658, _606, _638);
    float _678 = _674 * (-2.0);
    float _680 = float(_654);
    float _682 = _676 * 0.15915493667125701904296875;
    float _684 = float(_672);
    float _686 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _688 = fma(_678, _560, _560);
    float _690 = _464 + _456;
    float _692 = _680 * _684;
    float _694 = _472 + (-0.5);
    float _696 = fma(_686, _678, _686);
    float _698 = _690 + (-1.0);
    float _700 = _692 * (-2.0);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _688);
    float _704 = _456 + (-0.5);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _682 * 6.283185482025146484375;
    float _710 = cos(_708);
    float _712 = fma(_696, _606, _702);
    float _714 = fma(_700, _562, _562);
    float _716 = fma(_706, _700, _706);
    float _718 = in.m_67.x;
    float _720 = in.m_67.y;
    float _722 = in.m_67.z;
    float _724 = _712 * 0.15915493667125701904296875;
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _728 = _682 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_716, _606, _726);
    float _734 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _732 * 0.15915493667125701904296875;
    float _738 = _724 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _724 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _752 = _736 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _462 * _746;
    float _758 = _466 * _748;
    float _760 = _734 * _750;
    float _762 = in.m_50.x;
    float _764 = in.m_50.y;
    float _766 = in.m_50.z;
    float _768 = _710 * _740;
    float _770 = _730 * _740;
    float _772 = _736 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _710 * _744;
    float _778 = _730 * _744;
    float _780 = _710 * _754;
    float _782 = _730 * _754;
    float _784 = _744 * _754;
    float _786 = _740 * _754;
    float _788 = _780 * _758;
    float _790 = fma(_774, _776, _770);
    float _792 = fma(_774, _770, _776);
    float _794 = -_758;
    float _796 = _774 * _794;
    float _798 = -_768;
    float _800 = fma(_774, _778, _798);
    float _802 = _782 * _758;
    float _804 = -_778;
    float _806 = fma(_774, _768, _804);
    float _808 = fma(_790, _756, _788);
    float _810 = fma(_784, _756, _796);
    float _812 = fma(_800, _756, _802);
    float _814 = _764 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _816 = fma(_806, _760, _808);
    float _818 = fma(_786, _760, _810);
    float _820 = _764 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[4].x, _814);
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _828 = fma(_792, _760, _812);
    float _830 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].x, _826);
    float _836 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].z, _822);
    float _838 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].z, _830);
    float _840 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _832);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _834);
    float _844 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _846 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _850 = _842 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _852 = _764 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _854 = _844 + _848;
    float _856 = _846 + _850;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[5].x, _852);
    float _860 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _862 = _854 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _866 = _856 + _864;
    float _868 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].z, _858);
    float _870 = fma(_844, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _872 = _862 * _862;
    float _874 = _866 * _866;
    float _876 = floor(_870);
    float _878 = _872 + _874;
    float _880 = sqrt(_878);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = _880 + _884;
    float _888 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _892 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _894 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _896 = fma(_846, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _898 = _842;
    float _900 = _816;
    float _902 = _868;
    float _904 = _856;
    float _906 = _806;
    float _908 = _872;
    float _910 = _874;
    if (_882)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _898 = _912;
    }
    float _914 = _898;
    float _916 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _918 = _894 + _916;
    float _920 = _916;
    float _922 = _918;
    if (!_882)
    {
        _920 = _854;
    }
    float _924 = _920;
    float _926 = _924;
    if (_882)
    {
        float _928 = rsqrt(_878);
        _900 = _928;
    }
    float _930 = _900;
    if (_882)
    {
        float _932 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _902 = _932;
    }
    float _934 = _902;
    float _936 = _914;
    float _938 = _934;
    if (_882)
    {
        float _940 = _886 * _914;
        _936 = _940;
    }
    float _942 = _936;
    float _944 = floor(_896);
    float _946 = _942;
    if (_882)
    {
        float _948 = _942 * 0.15915493667125701904296875;
        _946 = _948;
    }
    float _950 = _946;
    float _952 = _762;
    if (_882)
    {
        float _954 = _950 * 6.283185482025146484375;
        float _956 = sin(_954);
        _952 = _956;
    }
    float _958 = _952;
    float _960 = -_944;
    float _962 = _896 + _960;
    if (_882)
    {
        float _964 = fma(_958, _934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _938 = _964;
    }
    float _966 = _938;
    float _968 = _966;
    if (_882)
    {
        float _970 = _930 * _966;
        _968 = _970;
    }
    float _972 = _968;
    float _974 = -_876;
    float _976 = _870 + _974;
    if (_882)
    {
        float _978 = fma(_862, _972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _926 = _978;
    }
    float _980 = _926;
    if (_882)
    {
        float _982 = fma(_866, _972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _904 = _982;
    }
    float _984 = _904;
    float _986 = fma(_980, 6.2500002968590706586837768554688e-05, 0.5);
    float _988 = fma(_984, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3764 = float2(_986, _988);
    float3 _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3764, float2(0.0), isnan(_3764)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3764, float2(0.0), isnan(_3764)), level(0.0)).xyz;
    float _994 = _992.x;
    float _996 = _992.y;
    float _998 = _992.z;
    float2 _3780 = float2(_976, _962);
    float _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3780, float2(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3780, float2(0.0), isnan(_3780)), level(0.0)).x;
    float _1002 = in.m_69.x;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1012 = _472 > 0.5;
    float _1014 = 1.0 / _1006;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1016;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1022 = _1020 != 0;
    bool _1024 = _720 != 0.0;
    bool _1026 = isnan(_720);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = in.m_69.y;
    bool _1036 = _464 > 0.5;
    bool _1038 = _1036 && _1022;
    float _1040 = 1.0 / _1010;
    bool _1042 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1044 = isnan(_454);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1058 = _718 == 0.0;
    bool _1060 = !_1032;
    bool _1062 = _1058 && _1060;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1066 = _1064 != 0;
    float _1068 = -_1052;
    float _1070 = _1068 + 1.0;
    bool _1072 = _722 == 0.0;
    bool _1074 = _1072 && _1062;
    float _1076 = _1018 * _1014;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1080 = _454 + _1078;
    float _1082 = in.m_71.x;
    float _1084 = in.m_71.y;
    float _1086 = in.m_71.z;
    float _1088 = 0.0;
    if (_1022)
    {
        _1088 = _1002;
    }
    float _1090 = _1088;
    float _1092 = fma(_1076, _1080, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1094 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1096 = isnan(_454);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1056 * _1040;
    bool _1108 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1110 = isnan(_454);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = _1090;
    float _1122 = _1034;
    if (_1038)
    {
        float _1124 = -_1090;
        float _1126 = _1124 + 1.0;
        _1120 = _1126;
    }
    float _1128 = _1120;
    float _1130 = _1104 * _1070;
    float _1132 = -_1104;
    float _1134 = _1132 + 1.0;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1138 = _454 + _1136;
    if (!_1022)
    {
        _550 = _1002;
    }
    float _1140 = _550;
    float _1142 = -_1034;
    float _1144 = _1142 + 1.0;
    float _1146 = _1118 * _1134;
    float _1148 = -_1118;
    float _1150 = _1148 + 1.0;
    float _1152 = _1140;
    if (_1022)
    {
        _1152 = _1128;
    }
    float _1154 = _1152;
    float _1156 = fma(_1106, _1138, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1158 = _1092 * _1146;
    float _1160 = _1128;
    if (_882)
    {
        float _1162 = _950 * 6.283185482025146484375;
        float _1164 = cos(_1162);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1170 = _780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1172 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1158);
    float _1174 = _806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1084;
    float _1178 = _1082;
    float _1180 = _1086;
    if (!_1074)
    {
        float _1182 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1084);
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = _780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1188 = _1184;
    if (!_1074)
    {
        float _1190 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1082);
        _1178 = _1190;
    }
    float _1192 = _1178;
    if (!_1074)
    {
        float _1194 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1180 = _1194;
    }
    float _1196 = _1180;
    float _1198 = fma(_1156, _1130, _1172);
    float _1200 = -_774;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1186);
    float _1204 = -_774;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1168);
    float _1208 = -_774;
    float _1210 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1170);
    float _1212 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1198);
    float _1214 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1202);
    float _1216 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1206);
    float _1218 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1210);
    float _1220 = _790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1214 * _1184;
    float _1224 = _1216 * _1184;
    float _1226 = _1218 * _1184;
    float _1228 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1230 = _1228;
    if (_882)
    {
        float _1232 = _1166 + (-1.0);
        _1188 = _1232;
    }
    float _1234 = _1188;
    float _1236 = _790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1238 = _790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1240 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1228);
    if (_882)
    {
        float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1242;
    }
    float _1244 = _1230;
    float _1246 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1236);
    float _1248 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1238);
    float _1250 = _806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1252 = _806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1254 = _1246;
    if (_882)
    {
        float _1256 = fma(_918, _1166, _1244);
        _922 = _1256;
    }
    float _1258 = _922;
    if (_882)
    {
        float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1262 = _980 + _1260;
        _906 = _1262;
    }
    float _1264 = _906;
    float _1266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1268 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1246);
    float _1270 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1248);
    if (_882)
    {
        float _1272 = _1264 * _1264;
        _908 = _1272;
    }
    float _1274 = _908;
    float _1276 = in.m_73.w;
    if (_882)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1280 = _984 + _1278;
        _1254 = _1280;
    }
    float _1282 = _1254;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1286 = _1258 + _1284;
    if (_1066)
    {
        float _1288 = _1012 ? _1144 : _1034;
        _1122 = _1288;
    }
    float _1290 = _1122;
    float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1294 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1250);
    float _1296 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1298 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1252);
    if (_882)
    {
        float _1300 = _1282 * _1282;
        _910 = _1300;
    }
    float _1302 = _910;
    float _1304 = fma(_1286, _1286, _1274);
    float _1306 = fma(_1240, _1192, _1222);
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1310 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1312 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1296);
    float _1314 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1316 = _1304 + _1302;
    float _1318 = fma(_1270, _1192, _1226);
    float _1320 = _1308 * _1266;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1324 = sqrt(_1316);
    float _1326 = fma(_1268, _1192, _1224);
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1330 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1334 = fma(_1310, _1196, _1306);
    float _1336 = fma(_1312, _1196, _1326);
    float _1338 = _1330 * _1292;
    float _1340 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1348 = fma(_1314, _1196, _1318);
    out.m_75.w = _1276;
    bool _1350 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1352 = isnan(_1324);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1358 = _1354 || _1356;
    out.m_77.x = _1338;
    out.m_77.y = _1320;
    out.m_79.x = _1340;
    out.m_79.y = _1342;
    out.m_79.z = _1344;
    out.m_79.w = _1346;
    out.m_81.x = _1334;
    out.m_81.y = _1336;
    out.m_81.z = _1348;
    float _1360 = _1316;
    float _1362 = _1304;
    if (!_1358)
    {
        _1360 = 1.0;
    }
    float _1364 = _1360;
    out.m_83.x = _994;
    out.m_83.y = _996;
    out.m_83.z = _998;
    bool _1366 = !_1358;
    float _1368 = _1364;
    float _1370 = _994;
    if (!_1366)
    {
        bool _1372 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1324);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1324 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1368 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1324);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1324 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1368 = _1428;
                _1400 = true;
            }
            else
            {
                _1368 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1368;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1434 = _1258 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _980 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _984 + _1440;
    float _1444 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1446 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = fma(_1442, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1450 = -_894;
    float _1452 = _1450 + _1444;
    float _1454 = -_844;
    float _1456 = _1454 + _1446;
    float _1458 = -_846;
    float _1460 = _1458 + _1448;
    float _1462 = _1452 * _1452;
    float _1464 = fma(_1456, _1456, _1462);
    float _1466 = fma(_1460, _1460, _1464);
    float _1468 = sqrt(_1466);
    bool _1470 = _1468 > 0.0;
    float _1472 = _1444;
    float _1474 = _1448;
    float _1476 = _1446;
    if (!_1470)
    {
        _1370 = _1446;
    }
    float _1478 = _1370;
    bool _1480 = !_1470;
    float _1482 = _1478;
    if (!_1480)
    {
        float _1484 = _192 * _192;
        float _1486 = fma(_190, _190, _1484);
        float _1488 = fma(_194, _194, _1486);
        float _1490 = rsqrt(_1466);
        float _1492 = sqrt(_1488);
        float _1494 = _1456 * _1490;
        float _1496 = _1452 * _1490;
        float _1498 = _1460 * _1490;
        bool _1500 = _1492 > 0.0;
        float _1502 = _1492;
        _1362 = _1498;
        if (!_1500)
        {
            _1502 = _1446;
        }
        float _1504 = _1502;
        bool _1506 = !_1500;
        _1482 = _1504;
        if (!_1506)
        {
            float _1508 = rsqrt(_1488);
            float _1510 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1512 = _192 * _1508;
            float _1514 = _190 * _1508;
            float _1516 = _194 * _1508;
            float _1518 = _1496 * _1512;
            float _1520 = fma(_1494, _1514, _1518);
            float _1522 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1524 = fma(_1498, _1516, _1520);
            float _1526 = _1524 * _1522;
            float _1528 = fma(_190, _1526, _1446);
            float _1530 = fma(_192, _1526, _1444);
            float _1532 = fma(_194, _1526, _1448);
            _1472 = _1530;
            _1482 = _1528;
            _1474 = _1532;
        }
    }
    float _1534 = _1472;
    float _1536 = _1482;
    float _1538 = _1474;
    float _1540 = _1362;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1534 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1536 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = sqrt(_1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1548 * _1564;
    float _1568 = _1552 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _194;
    float _1586 = _1582;
    float _1588 = _1544;
    float _1590 = _1540;
    float _1592 = _1566;
    if (_1578)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1594;
    }
    float _1596 = _1584;
    float _1598 = _1596;
    if (_1578)
    {
        float _1600 = _1582 * _1596;
        _1586 = _1600;
    }
    float _1602 = _1586;
    if (_1578)
    {
        float _1604 = rsqrt(_1574);
        _1598 = _1604;
    }
    float _1606 = _1598;
    float _1608 = _1606;
    if (_1578)
    {
        float _1610 = _1602 * 0.15915493667125701904296875;
        _1476 = _1610;
    }
    float _1612 = _1476;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = _1552;
    if (_1578)
    {
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = precise::max(0.0, _1614);
    float _1626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1628 = _192;
    float _1630 = _1624;
    if (_1578)
    {
        float _1632 = _1612 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1628 = _1634;
    }
    float _1636 = _1628;
    float _1638 = -_1564;
    float _1640 = -_1624;
    float _1642 = fma(_1544, _1638, _1640);
    if (_1578)
    {
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1644;
    }
    float _1646 = _1588;
    float _1648 = _1622;
    float _1650 = _1646;
    if (_1578)
    {
        float _1652 = fma(_1622, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = _1654;
    if (!_1578)
    {
        _1650 = _1642;
    }
    float _1658 = _1650;
    float _1660 = _1658;
    if (_1578)
    {
        float _1662 = _1606 * _1654;
        _1590 = _1662;
    }
    float _1664 = _1590;
    if (!_1578)
    {
        _1656 = _1570;
    }
    float _1666 = _1656;
    float _1668 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = _1666;
    float _1672 = _1636;
    if (_1578)
    {
        float _1674 = _1636 + (-1.0);
        _1630 = _1674;
    }
    float _1676 = _1630;
    float _1678 = _1676;
    if (_1578)
    {
        float _1680 = _1566 * _1664;
        _1592 = _1680;
    }
    float _1682 = _1592;
    float _1684 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    if (_1578)
    {
        float _1686 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1686;
    }
    float _1688 = _1608;
    if (!_1578)
    {
        _1678 = _1568;
    }
    float _1690 = _1678;
    float _1692 = _1690;
    if (_1578)
    {
        float _1694 = _1568 * _1664;
        _1692 = _1694;
    }
    float _1696 = _1692;
    if (_1578)
    {
        float _1698 = _1682 * _1682;
        _1670 = _1698;
    }
    float _1700 = _1670;
    if (_1578)
    {
        float _1702 = fma(_1642, _1636, _1688);
        _1660 = _1702;
    }
    float _1704 = _1660;
    if (!_1578)
    {
        _1672 = _1572;
    }
    float _1706 = _1672;
    float _1708 = _1706;
    if (_1578)
    {
        float _1710 = _1696 * _1696;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1716 = fma(_1704, _1704, _1700);
    float _1718 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1714);
    float _1720 = _1716 + _1712;
    float _1722 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1726 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1724);
    float _1728 = precise::clamp(_1726, 0.0, 1.0);
    float _1730 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1718);
    float _1732 = rsqrt(_1720);
    float _1734 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = -_1728;
    float _1738 = _1736 + 1.0;
    float _1740 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1722);
    float _1742 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1744 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1746 = abs(_1738);
    float _1748 = log2(_1746);
    float _1750 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1740);
    float _1752 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1744);
    float _1754 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1626, 1.0);
    float _1764 = _1732 * _1682;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1770 = _1732 * _1704;
    float _1772 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1774 = _1732 * _1696;
    float _1776 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1768);
    float _1778 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1780 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1782 = -_1772;
    float _1784 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1776);
    float _1788 = log2(_1762);
    float _1790 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1792 = -_1774;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1796 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1786);
    float _1798 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1790);
    float _1802 = fma(_1794, -0.5, 0.5);
    float _1804 = fma(_1794, 0.5, 0.5);
    float _1806 = exp2(_1780);
    float _1808 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1798);
    float _1810 = _1770 + 1.0;
    float _1812 = fma(_1804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1814 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1800);
    float _1816 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1808);
    float _1818 = fma(_1804, _1812, -0.212114393711090087890625);
    float _1820 = 1.0 / _1796;
    float _1822 = _1788 * 0.693147182464599609375;
    float _1824 = fma(_1804, _1818, 1.570728778839111328125);
    float _1826 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1828 = sqrt(_1802);
    float _1830 = -_1770;
    float _1832 = fma(_1806, _1810, _1830);
    float _1834 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1816);
    float _1836 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1814);
    float _1838 = fma(_1832, 0.5, 0.5);
    float _1840 = _1834 * _1820;
    float _1842 = _1836 * _1820;
    float _1844 = fma(_1840, 0.5, 0.5);
    float _1846 = fma(_1842, -0.5, 0.5);
    float _1848 = _1828 * 0.636619746685028076171875;
    float _1850 = -_1824;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _5228 = float3(_1844, _1846, _1826);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5228, float3(0.0), isnan(_5228)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5228, float3(0.0), isnan(_5228)), level(0.0)).x;
    float3 _5239 = float3(_1844, _1846, _1826);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5239, float3(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5239, float3(0.0), isnan(_5239)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _5255 = float2(_1852, _1838);
    float3 _1867 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5255, float2(0.0), isnan(_5255)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5255, float2(0.0), isnan(_5255)), level(0.0)).xyz;
    float _1869 = _1867.x;
    float _1871 = _1867.y;
    float _1873 = _1867.z;
    float _1875 = _894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1877 = _894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1879 = -_1000;
    float _1881 = _1879 + 1.0;
    bool _1883 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1885 = isnan(_1562);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1891 = _1887 || _1889;
    float _1893 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1875);
    float _1895 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1877);
    float _1897 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1893);
    float _1899 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1895);
    float _1901 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1903 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1905 = 1.0 / _1901;
    float _1907 = _1903 + _1901;
    float _1909 = _1907 * _1905;
    float _1911 = _1909 * 0.5;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1915 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1913);
    float _1917 = 1.0 / _1915;
    float _1919 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1925 = _1917 * _1923;
    float _1927 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1921);
    float _1929 = abs(_1925);
    float _1931 = log2(_1929);
    float _1933 = in.m_85.x;
    float _1935 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1927);
    float _1937 = _1935 + _1796;
    out.gl_Position.x = _1834;
    out.gl_Position.y = _1836;
    out.gl_Position.z = _1935;
    out.gl_Position.w = _1796;
    bool _1939 = _1925 <= 8000.0;
    bool _1941 = isnan(_1925);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan(8000.0);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    float _1951 = _1937 * 0.5;
    float _1953 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1955 = _1935;
    float _1957 = _1834;
    float _1959 = _1796;
    float _1961 = _1836;
    if (!_1891)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1963 = _1955;
    float _1965 = exp2(_1953);
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1969 = precise::clamp(_1967, 0.0, 1.0);
    float _1971 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1973 = _1834 + _1796;
    float _1975 = _1963;
    float _1977 = _1963;
    if (!_1891)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1979 = _1957;
    float _1981 = fma(_1969, -2.0, 3.0);
    float _1983 = _1969 * _1969;
    float _1985 = _1973 * 0.5;
    float _1987 = exp2(_1971);
    float _1989 = _1983 * _1981;
    float _1991 = -_1989;
    float _1993 = _1991 + 1.0;
    float _1995 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1989);
    float _1997 = _1949 * _1995;
    float _1999 = -_1987;
    float _2001 = _1999 + 1.0;
    float _2003 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2005 = _1881 * _2003;
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = -_2007;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = _1796 * 0.5;
    float _2015 = _1979;
    float _2017 = _1979;
    if (!_1891)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2019 = _1959;
    float _2021 = _2011 * _1933;
    float _2023 = fma(_1836, -0.5, _2013);
    float _2025 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2027 = _2019;
    float _2029 = _2019;
    if (!_1891)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2031 = _1961;
    float _2033 = _2021 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _1985;
    out.m_87.y = _2023;
    out.m_87.z = _1951;
    out.m_87.w = _1796;
    out.m_89.x = _2033;
    float _2035 = _2033;
    float _2037 = _2031;
    float _2039 = _2031;
    if (!_1891)
    {
        _2035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2041 = _2035;
    float _2043 = _2025 * _1854;
    float _2045 = -_2025;
    float _2047 = _2045 + 1.0;
    float _2049 = _1865 * _2043;
    float _2051 = _1873 * _2043;
    float _2053 = _1865 * _2047;
    float _2055 = _2047;
    float _2057 = _2041;
    float _2059 = _2041;
    if (!_1891)
    {
        _2055 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2061 = _2055;
    float _2063 = fma(_1869, _2049, _1859);
    float _2065 = fma(_1871, _2049, _1861);
    float _2067 = fma(_1865, _2051, _1863);
    out.m_91.x = _2063;
    out.m_91.y = _2065;
    out.m_91.z = _2067;
    out.m_91.w = _2053;
    bool _2069 = !_1891;
    float _2071 = _2061;
    float _2073 = _2061;
    if (!_2069)
    {
        bool _2075 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2077 = isnan(_1562);
        bool _2079 = _2075 || _2077;
        bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2083 = _2079 || _2081;
        if (!_2083)
        {
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2087 = _1562 + _2085;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2091 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2089;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2097 = 1.0 / _2091;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2115 = _2087 * _2097;
            float _2117 = precise::clamp(_2115, 0.0, 1.0);
            float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2123 = fma(_2117, _2095, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2125 = fma(_2117, _2121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2127 = fma(_2117, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2129 = fma(_2117, _2105, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2131 = fma(_2117, _2109, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2133 = fma(_2117, _2113, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2073 = _2127;
            _2039 = _2131;
            _2059 = _2123;
            _1977 = _2129;
            _2029 = _2125;
            _2017 = _2133;
            _2135 = true;
        }
        else
        {
            bool _2137 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2139 = isnan(_1562);
            bool _2141 = _2137 || _2139;
            bool _2143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2145 = _2141 || _2143;
            if (!_2145)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2147 = _2057;
            _2059 = _2147;
            if (!_2145)
            {
                _2071 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2149 = _2071;
            _2073 = _2149;
            if (!_2145)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2151 = _2027;
            _2029 = _2151;
            if (!_2145)
            {
                _1975 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2153 = _1975;
            _1977 = _2153;
            if (!_2145)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2155 = _2037;
            _2039 = _2155;
            if (!_2145)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2157 = _2015;
            bool _2159 = !_2145;
            _2017 = _2157;
            if (!_2159)
            {
                bool _2161 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2163 = isnan(_1562);
                bool _2165 = _2161 || _2163;
                bool _2167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2169 = _2165 || _2167;
                if (!_2169)
                {
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2173 = _1562 + _2171;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2177 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2175;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2183 = 1.0 / _2177;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2201 = _2173 * _2183;
                    float _2203 = precise::clamp(_2201, 0.0, 1.0);
                    float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2209 = fma(_2203, _2181, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2211 = fma(_2203, _2207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2213 = fma(_2203, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2215 = fma(_2203, _2191, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2217 = fma(_2203, _2195, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2219 = fma(_2203, _2199, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2073 = _2213;
                    _2039 = _2217;
                    _2059 = _2209;
                    _1977 = _2215;
                    _2029 = _2211;
                    _2017 = _2219;
                    _2135 = true;
                }
                else
                {
                    _2073 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1977 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2135 = false;
    float _2221 = _2073;
    float _2223 = _2039;
    float _2225 = _2059;
    float _2227 = _1977;
    float _2229 = _2029;
    float _2231 = _2017;
    float _2233 = fma(_1336, -0.5, 0.5);
    float _2235 = precise::clamp(_2233, 0.0, 1.0);
    float _2237 = -_2221;
    float _2239 = _2237 + _2223;
    float _2241 = -_2225;
    float _2243 = _2241 + _2227;
    float _2245 = -_2229;
    float _2247 = _2245 + _2231;
    bool _2249 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2251 = fma(_2235, _2239, _2221);
    float _2253 = fma(_2235, _2243, _2225);
    float _2255 = fma(_2235, _2247, _2229);
    float _2257 = _2251 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2259 = fma(_2253, 0.298911988735198974609375, _2257);
    float _2261 = fma(_2255, 0.114477999508380889892578125, _2259);
    float _2263 = -_2261;
    float _2265 = _2253 + _2263;
    float _2267 = -_2261;
    float _2269 = _2251 + _2267;
    float _2271 = -_2261;
    float _2273 = _2255 + _2271;
    float _2275 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2277 = fma(_2265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    float _2279 = fma(_2269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    float _2281 = fma(_2273, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    out.m_53.x = _2275;
    out.m_95.x = _2277;
    out.m_95.y = _2279;
    out.m_95.z = _2281;
    if (!_2249)
    {
        return out;
    }
    float _2283 = -_1534;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2287 = -_1536;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2291 = -_1538;
    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2295 = _2285 * _2285;
    float _2297 = fma(_2289, _2289, _2295);
    float _2299 = fma(_2293, _2293, _2297);
    float _2301 = sqrt(_2299);
    float _2303 = rsqrt(_2299);
    float _2305 = -_2301;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2309 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = _2289 * _2303;
    float _2315 = _2285 * _2303;
    float _2317 = abs(_2311);
    float _2319 = log2(_2317);
    float _2321 = _2293 * _2303;
    float _2323 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2325 = _1336 * _2315;
    float _2327 = -_2315;
    float _2329 = -_2323;
    float _2331 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2329);
    float _2333 = fma(_1334, _2313, _2325);
    float _2335 = -_2321;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2331);
    float _2339 = fma(_1348, _2321, _2333);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2345 = _2337 + _2343;
    float _2347 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2351 = precise::clamp(_2349, 0.0, 1.0);
    float _2353 = exp2(_2347);
    float _2355 = _2353 * _2351;
    float _2357 = _2341 * _2355;
    float _2359 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2361 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2363 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2359;
    out.m_93.y = _2361;
    out.m_93.z = _2363;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2135 = false;
    bool _1400 = false;
    bool _446 = false;
    bool _330 = false;
    bool _216 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_50.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2420 = as_type<float>(_130);
        out.gl_Position.z = _2420;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_55.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_53.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2489 = as_type<float>(_168);
        out.gl_Position.z = _2489;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _178 = _172 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _180 = _172 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _184 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[4].x, _178);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[5].x, _180);
    float _188 = fma(_170, (*spvDescriptorSet0.vp_c10)._m0[6].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].z, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].z, _186);
    float _194 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].z, _188);
    bool _196 = !_176;
    float _214;
    if (!_196)
    {
        float _198 = in.m_59.x;
        float _200 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _204 = fma(_202, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _206 = _204 * _200;
        float _208 = floor(_206);
        float _210 = -_208;
        float _212 = _206 + _210;
        _214 = _212;
        _216 = true;
    }
    else
    {
        float _218 = float(_114);
        float _220 = 1.0 / _218;
        float _222 = _148 * _220;
        _214 = _222;
    }
    _216 = false;
    float _224 = _214;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _224 + _226;
    bool _230 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _232 = isnan(_224);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _242;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _248 = 1.0 / _244;
    float _250 = -_240;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = _228 * _248;
    bool _260 = _224 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _262 = isnan(_224);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = fma(_256, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _270 * _252;
    float _284 = fma(_274, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_280, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = -_270;
    float _290 = _288 + 1.0;
    float _292 = _276 * _282;
    float _294 = _284 * _282;
    float _296 = _286 * _282;
    float _298 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _300 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].y, _296);
    float _302 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _304 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].x, _298);
    float _306 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].y, _300);
    float _308 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[144].z, _302);
    bool _310 = !_246;
    float _328;
    if (!_310)
    {
        float _312 = in.m_59.x;
        float _314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _316 = _312 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _320 = _318 * _314;
        float _322 = floor(_320);
        float _324 = -_322;
        float _326 = _320 + _324;
        _328 = _326;
        _330 = true;
    }
    else
    {
        float _332 = float(_114);
        float _334 = 1.0 / _332;
        float _336 = _148 * _334;
        _328 = _336;
    }
    _330 = false;
    float _338 = _328;
    bool _340 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _342 = isnan(_338);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _356 = _338 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _358 = isnan(_338);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _374 = _338 + _372;
    float _376 = 1.0 / _354;
    float _378 = -_350;
    float _380 = _378 + 1.0;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _384 = _366 * _380;
    float _386 = -_366;
    float _388 = _386 + 1.0;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _392 = _370 * _376;
    float _394 = _390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _396 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _398 = _396 * _384;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _402 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[115].x, _398);
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _406 = _400 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _408 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[116].x, _402);
    float _410 = in.m_61.x;
    float _412 = in.m_61.y;
    float _414 = in.m_61.z;
    float _416 = _404 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _418 = _408 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _416;
    out.m_63.y = _406;
    out.m_63.z = _394;
    out.m_63.w = _418;
    float _420 = _308 * _414;
    float _422 = _306 * _412;
    float _424 = _304 * _410;
    bool _426 = !_382;
    float _444;
    if (!_426)
    {
        float _428 = in.m_59.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_114);
        float _450 = 1.0 / _448;
        float _452 = _148 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = in.m_59.z;
    float _458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _460 = log2(_458);
    float _462 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _464 = in.m_59.x;
    float _466 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _470 = 1.0 + _468;
    float _472 = in.m_59.y;
    float _474 = 1.0 / _470;
    float _476 = _460 * _148;
    float _478 = exp2(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _490 = _488 != 0;
    float _492 = _456 * 2.0;
    float _494 = _464 * 2.0;
    float _496 = floor(_492);
    float _498 = _464 + _472;
    float _500 = _472 * 2.0;
    float _502 = _498 + (-1.0);
    float _504 = -_478;
    float _506 = _504 + 1.0;
    float _508 = floor(_494);
    bool _510 = _496 > 0.0;
    float _512 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _514 = _496 >= 0.0;
    bool _516 = isnan(_496);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = floor(_500);
    int _526 = _522 ? 0 : 1;
    bool _528 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _530 = isnan(1.0);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _536 = _532 || _534;
    int _538 = ~_526;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    bool _544 = !_482;
    int _546 = _544 ? 0 : 1;
    int _548 = _542;
    float _550 = _454;
    if (!_510)
    {
        int _552 = ~_526;
        int _554 = _552 + 1;
        _548 = _554;
    }
    int _556 = _548;
    float _558 = in.m_65.x;
    float _560 = in.m_65.y;
    float _562 = in.m_65.z;
    int _564 = abs(_546);
    bool _566 = _508 > 0.0;
    bool _568 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    bool _578 = _508 >= 0.0;
    bool _580 = isnan(_508);
    bool _582 = _578 || _580;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    float _588 = float(_564);
    float _590 = float(_556);
    bool _592 = !_486;
    int _594 = _592 ? 0 : 1;
    float _596 = _576 ? _506 : 0.0;
    float _598 = _588 * _590;
    int _600 = _586 ? 0 : 1;
    bool _602 = _524 > 0.0;
    if (_536)
    {
        float _604 = _596 * _474;
        _152 = _604;
    }
    float _606 = _152;
    int _608 = abs(_594);
    float _610 = _598 * (-2.0);
    bool _612 = _524 >= 0.0;
    bool _614 = isnan(_524);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = _464 + (-0.5);
    float _624 = fma(_610, _558, _558);
    int _626 = ~_600;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = _472 + _456;
    bool _634 = !_490;
    int _636 = _634 ? 0 : 1;
    float _638 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[196].x, _624);
    int _640 = _630;
    if (!_566)
    {
        int _642 = ~_600;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = _632 + (-1.0);
    int _650 = _620 ? 0 : 1;
    float _652 = float(_608);
    int _654 = abs(_636);
    float _656 = float(_646);
    float _658 = fma(_512, _610, _512);
    int _660 = ~_650;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    int _666 = _664;
    if (!_602)
    {
        int _668 = ~_650;
        int _670 = _668 + 1;
        _666 = _670;
    }
    int _672 = _666;
    float _674 = _652 * _656;
    float _676 = fma(_658, _606, _638);
    float _678 = _674 * (-2.0);
    float _680 = float(_654);
    float _682 = _676 * 0.15915493667125701904296875;
    float _684 = float(_672);
    float _686 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _688 = fma(_678, _560, _560);
    float _690 = _464 + _456;
    float _692 = _680 * _684;
    float _694 = _472 + (-0.5);
    float _696 = fma(_686, _678, _686);
    float _698 = _690 + (-1.0);
    float _700 = _692 * (-2.0);
    float _702 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _688);
    float _704 = _456 + (-0.5);
    float _706 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _708 = _682 * 6.283185482025146484375;
    float _710 = cos(_708);
    float _712 = fma(_696, _606, _702);
    float _714 = fma(_700, _562, _562);
    float _716 = fma(_706, _700, _706);
    float _718 = in.m_67.x;
    float _720 = in.m_67.y;
    float _722 = in.m_67.z;
    float _724 = _712 * 0.15915493667125701904296875;
    float _726 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _728 = _682 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = fma(_716, _606, _726);
    float _734 = _420 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _732 * 0.15915493667125701904296875;
    float _738 = _724 * 6.283185482025146484375;
    float _740 = sin(_738);
    float _742 = _724 * 6.283185482025146484375;
    float _744 = cos(_742);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _718);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _720);
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _722);
    float _752 = _736 * 6.283185482025146484375;
    float _754 = cos(_752);
    float _756 = _462 * _746;
    float _758 = _466 * _748;
    float _760 = _734 * _750;
    float _762 = in.m_50.x;
    float _764 = in.m_50.y;
    float _766 = in.m_50.z;
    float _768 = _710 * _740;
    float _770 = _730 * _740;
    float _772 = _736 * 6.283185482025146484375;
    float _774 = sin(_772);
    float _776 = _710 * _744;
    float _778 = _730 * _744;
    float _780 = _710 * _754;
    float _782 = _730 * _754;
    float _784 = _744 * _754;
    float _786 = _740 * _754;
    float _788 = _780 * _758;
    float _790 = fma(_774, _776, _770);
    float _792 = fma(_774, _770, _776);
    float _794 = -_758;
    float _796 = _774 * _794;
    float _798 = -_768;
    float _800 = fma(_774, _778, _798);
    float _802 = _782 * _758;
    float _804 = -_778;
    float _806 = fma(_774, _768, _804);
    float _808 = fma(_790, _756, _788);
    float _810 = fma(_784, _756, _796);
    float _812 = fma(_800, _756, _802);
    float _814 = _764 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _816 = fma(_806, _760, _808);
    float _818 = fma(_786, _760, _810);
    float _820 = _764 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _822 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[4].x, _814);
    float _824 = _816 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _826 = _816 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _828 = fma(_792, _760, _812);
    float _830 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[6].x, _820);
    float _832 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[24].x, _824);
    float _834 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[26].x, _826);
    float _836 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[4].z, _822);
    float _838 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[6].z, _830);
    float _840 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _832);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _834);
    float _844 = _836 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _846 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _840 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _850 = _842 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _852 = _764 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _854 = _844 + _848;
    float _856 = _846 + _850;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[5].x, _852);
    float _860 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _862 = _854 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _866 = _856 + _864;
    float _868 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[5].z, _858);
    float _870 = fma(_844, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _872 = _862 * _862;
    float _874 = _866 * _866;
    float _876 = floor(_870);
    float _878 = _872 + _874;
    float _880 = sqrt(_878);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = _880 + _884;
    float _888 = _816 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _892 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _894 = _868 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _896 = fma(_846, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _898 = _842;
    float _900 = _816;
    float _902 = _868;
    float _904 = _856;
    float _906 = _806;
    float _908 = _872;
    float _910 = _874;
    if (_882)
    {
        float _912 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _898 = _912;
    }
    float _914 = _898;
    float _916 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _918 = _894 + _916;
    float _920 = _916;
    float _922 = _918;
    if (!_882)
    {
        _920 = _854;
    }
    float _924 = _920;
    float _926 = _924;
    if (_882)
    {
        float _928 = rsqrt(_878);
        _900 = _928;
    }
    float _930 = _900;
    if (_882)
    {
        float _932 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _902 = _932;
    }
    float _934 = _902;
    float _936 = _914;
    float _938 = _934;
    if (_882)
    {
        float _940 = _886 * _914;
        _936 = _940;
    }
    float _942 = _936;
    float _944 = floor(_896);
    float _946 = _942;
    if (_882)
    {
        float _948 = _942 * 0.15915493667125701904296875;
        _946 = _948;
    }
    float _950 = _946;
    float _952 = _762;
    if (_882)
    {
        float _954 = _950 * 6.283185482025146484375;
        float _956 = sin(_954);
        _952 = _956;
    }
    float _958 = _952;
    float _960 = -_944;
    float _962 = _896 + _960;
    if (_882)
    {
        float _964 = fma(_958, _934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _938 = _964;
    }
    float _966 = _938;
    float _968 = _966;
    if (_882)
    {
        float _970 = _930 * _966;
        _968 = _970;
    }
    float _972 = _968;
    float _974 = -_876;
    float _976 = _870 + _974;
    if (_882)
    {
        float _978 = fma(_862, _972, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _926 = _978;
    }
    float _980 = _926;
    if (_882)
    {
        float _982 = fma(_866, _972, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _904 = _982;
    }
    float _984 = _904;
    float _986 = fma(_980, 6.2500002968590706586837768554688e-05, 0.5);
    float _988 = fma(_984, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3764 = float2(_986, _988);
    float3 _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3764, float2(0.0), isnan(_3764)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3764, float2(0.0), isnan(_3764)), level(0.0)).xyz;
    float _994 = _992.x;
    float _996 = _992.y;
    float _998 = _992.z;
    float2 _3780 = float2(_976, _962);
    float _1000 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3780, float2(0.0), isnan(_3780)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3780, float2(0.0), isnan(_3780)), level(0.0)).x;
    float _1002 = in.m_69.x;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1012 = _472 > 0.5;
    float _1014 = 1.0 / _1006;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1016;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1022 = _1020 != 0;
    bool _1024 = _720 != 0.0;
    bool _1026 = isnan(_720);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = in.m_69.y;
    bool _1036 = _464 > 0.5;
    bool _1038 = _1036 && _1022;
    float _1040 = 1.0 / _1010;
    bool _1042 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1044 = isnan(_454);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1050 = _1046 || _1048;
    float _1052 = float(_1050);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1058 = _718 == 0.0;
    bool _1060 = !_1032;
    bool _1062 = _1058 && _1060;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1066 = _1064 != 0;
    float _1068 = -_1052;
    float _1070 = _1068 + 1.0;
    bool _1072 = _722 == 0.0;
    bool _1074 = _1072 && _1062;
    float _1076 = _1018 * _1014;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1080 = _454 + _1078;
    float _1082 = in.m_71.x;
    float _1084 = in.m_71.y;
    float _1086 = in.m_71.z;
    float _1088 = 0.0;
    if (_1022)
    {
        _1088 = _1002;
    }
    float _1090 = _1088;
    float _1092 = fma(_1076, _1080, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1094 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1096 = isnan(_454);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = _1056 * _1040;
    bool _1108 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1110 = isnan(_454);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = _1090;
    float _1122 = _1034;
    if (_1038)
    {
        float _1124 = -_1090;
        float _1126 = _1124 + 1.0;
        _1120 = _1126;
    }
    float _1128 = _1120;
    float _1130 = _1104 * _1070;
    float _1132 = -_1104;
    float _1134 = _1132 + 1.0;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1138 = _454 + _1136;
    if (!_1022)
    {
        _550 = _1002;
    }
    float _1140 = _550;
    float _1142 = -_1034;
    float _1144 = _1142 + 1.0;
    float _1146 = _1118 * _1134;
    float _1148 = -_1118;
    float _1150 = _1148 + 1.0;
    float _1152 = _1140;
    if (_1022)
    {
        _1152 = _1128;
    }
    float _1154 = _1152;
    float _1156 = fma(_1106, _1138, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1158 = _1092 * _1146;
    float _1160 = _1128;
    if (_882)
    {
        float _1162 = _950 * 6.283185482025146484375;
        float _1164 = cos(_1162);
        _1160 = _1164;
    }
    float _1166 = _1160;
    float _1168 = _780 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1170 = _780 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1172 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1158);
    float _1174 = _806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1176 = _1084;
    float _1178 = _1082;
    float _1180 = _1086;
    if (!_1074)
    {
        float _1182 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1084);
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = _780 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1188 = _1184;
    if (!_1074)
    {
        float _1190 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1082);
        _1178 = _1190;
    }
    float _1192 = _1178;
    if (!_1074)
    {
        float _1194 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1180 = _1194;
    }
    float _1196 = _1180;
    float _1198 = fma(_1156, _1130, _1172);
    float _1200 = -_774;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1186);
    float _1204 = -_774;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1168);
    float _1208 = -_774;
    float _1210 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1170);
    float _1212 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1198);
    float _1214 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1202);
    float _1216 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1206);
    float _1218 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1210);
    float _1220 = _790 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1214 * _1184;
    float _1224 = _1216 * _1184;
    float _1226 = _1218 * _1184;
    float _1228 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1230 = _1228;
    if (_882)
    {
        float _1232 = _1166 + (-1.0);
        _1188 = _1232;
    }
    float _1234 = _1188;
    float _1236 = _790 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1238 = _790 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1240 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1228);
    if (_882)
    {
        float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1230 = _1242;
    }
    float _1244 = _1230;
    float _1246 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1236);
    float _1248 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1238);
    float _1250 = _806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1252 = _806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1254 = _1246;
    if (_882)
    {
        float _1256 = fma(_918, _1166, _1244);
        _922 = _1256;
    }
    float _1258 = _922;
    if (_882)
    {
        float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1262 = _980 + _1260;
        _906 = _1262;
    }
    float _1264 = _906;
    float _1266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1268 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1246);
    float _1270 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1248);
    if (_882)
    {
        float _1272 = _1264 * _1264;
        _908 = _1272;
    }
    float _1274 = _908;
    float _1276 = in.m_73.w;
    if (_882)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1280 = _984 + _1278;
        _1254 = _1280;
    }
    float _1282 = _1254;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1286 = _1258 + _1284;
    if (_1066)
    {
        float _1288 = _1012 ? _1144 : _1034;
        _1122 = _1288;
    }
    float _1290 = _1122;
    float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1294 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1250);
    float _1296 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1174);
    float _1298 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1252);
    if (_882)
    {
        float _1300 = _1282 * _1282;
        _910 = _1300;
    }
    float _1302 = _910;
    float _1304 = fma(_1286, _1286, _1274);
    float _1306 = fma(_1240, _1192, _1222);
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1310 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1294);
    float _1312 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1296);
    float _1314 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1298);
    float _1316 = _1304 + _1302;
    float _1318 = fma(_1270, _1192, _1226);
    float _1320 = _1308 * _1266;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1324 = sqrt(_1316);
    float _1326 = fma(_1268, _1192, _1224);
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1330 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1334 = fma(_1310, _1196, _1306);
    float _1336 = fma(_1312, _1196, _1326);
    float _1338 = _1330 * _1292;
    float _1340 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1348 = fma(_1314, _1196, _1318);
    out.m_75.w = _1276;
    bool _1350 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1352 = isnan(_1324);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1358 = _1354 || _1356;
    out.m_77.x = _1338;
    out.m_77.y = _1320;
    out.m_79.x = _1340;
    out.m_79.y = _1342;
    out.m_79.z = _1344;
    out.m_79.w = _1346;
    out.m_81.x = _1334;
    out.m_81.y = _1336;
    out.m_81.z = _1348;
    float _1360 = _1316;
    float _1362 = _1304;
    if (!_1358)
    {
        _1360 = 1.0;
    }
    float _1364 = _1360;
    out.m_83.x = _994;
    out.m_83.y = _996;
    out.m_83.z = _998;
    bool _1366 = !_1358;
    float _1368 = _1364;
    float _1370 = _994;
    if (!_1366)
    {
        bool _1372 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1324);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1324 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1368 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1324 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1324);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1324 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1368 = _1428;
                _1400 = true;
            }
            else
            {
                _1368 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1368;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1434 = _1258 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1438 = _980 + _1436;
    float _1440 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1442 = _984 + _1440;
    float _1444 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1446 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1448 = fma(_1442, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1450 = -_894;
    float _1452 = _1450 + _1444;
    float _1454 = -_844;
    float _1456 = _1454 + _1446;
    float _1458 = -_846;
    float _1460 = _1458 + _1448;
    float _1462 = _1452 * _1452;
    float _1464 = fma(_1456, _1456, _1462);
    float _1466 = fma(_1460, _1460, _1464);
    float _1468 = sqrt(_1466);
    bool _1470 = _1468 > 0.0;
    float _1472 = _1444;
    float _1474 = _1448;
    float _1476 = _1446;
    if (!_1470)
    {
        _1370 = _1446;
    }
    float _1478 = _1370;
    bool _1480 = !_1470;
    float _1482 = _1478;
    if (!_1480)
    {
        float _1484 = _192 * _192;
        float _1486 = fma(_190, _190, _1484);
        float _1488 = fma(_194, _194, _1486);
        float _1490 = rsqrt(_1466);
        float _1492 = sqrt(_1488);
        float _1494 = _1456 * _1490;
        float _1496 = _1452 * _1490;
        float _1498 = _1460 * _1490;
        bool _1500 = _1492 > 0.0;
        float _1502 = _1492;
        _1362 = _1498;
        if (!_1500)
        {
            _1502 = _1446;
        }
        float _1504 = _1502;
        bool _1506 = !_1500;
        _1482 = _1504;
        if (!_1506)
        {
            float _1508 = rsqrt(_1488);
            float _1510 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1512 = _192 * _1508;
            float _1514 = _190 * _1508;
            float _1516 = _194 * _1508;
            float _1518 = _1496 * _1512;
            float _1520 = fma(_1494, _1514, _1518);
            float _1522 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1524 = fma(_1498, _1516, _1520);
            float _1526 = _1524 * _1522;
            float _1528 = fma(_190, _1526, _1446);
            float _1530 = fma(_192, _1526, _1444);
            float _1532 = fma(_194, _1526, _1448);
            _1472 = _1530;
            _1482 = _1528;
            _1474 = _1532;
        }
    }
    float _1534 = _1472;
    float _1536 = _1482;
    float _1538 = _1474;
    float _1540 = _1362;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1544 = _1534 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1548 = _1536 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1552 = _1538 + _1550;
    float _1554 = _1544 * _1544;
    float _1556 = fma(_1548, _1548, _1554);
    float _1558 = fma(_1552, _1552, _1556);
    float _1560 = rsqrt(_1558);
    float _1562 = sqrt(_1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1548 * _1564;
    float _1568 = _1552 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _194;
    float _1586 = _1582;
    float _1588 = _1544;
    float _1590 = _1540;
    float _1592 = _1566;
    if (_1578)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1594;
    }
    float _1596 = _1584;
    float _1598 = _1596;
    if (_1578)
    {
        float _1600 = _1582 * _1596;
        _1586 = _1600;
    }
    float _1602 = _1586;
    if (_1578)
    {
        float _1604 = rsqrt(_1574);
        _1598 = _1604;
    }
    float _1606 = _1598;
    float _1608 = _1606;
    if (_1578)
    {
        float _1610 = _1602 * 0.15915493667125701904296875;
        _1476 = _1610;
    }
    float _1612 = _1476;
    float _1614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1616 = _1552;
    if (_1578)
    {
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        _1616 = _1620;
    }
    float _1622 = _1616;
    float _1624 = precise::max(0.0, _1614);
    float _1626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1628 = _192;
    float _1630 = _1624;
    if (_1578)
    {
        float _1632 = _1612 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1628 = _1634;
    }
    float _1636 = _1628;
    float _1638 = -_1564;
    float _1640 = -_1624;
    float _1642 = fma(_1544, _1638, _1640);
    if (_1578)
    {
        float _1644 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1644;
    }
    float _1646 = _1588;
    float _1648 = _1622;
    float _1650 = _1646;
    if (_1578)
    {
        float _1652 = fma(_1622, _1646, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = _1654;
    if (!_1578)
    {
        _1650 = _1642;
    }
    float _1658 = _1650;
    float _1660 = _1658;
    if (_1578)
    {
        float _1662 = _1606 * _1654;
        _1590 = _1662;
    }
    float _1664 = _1590;
    if (!_1578)
    {
        _1656 = _1570;
    }
    float _1666 = _1656;
    float _1668 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = _1666;
    float _1672 = _1636;
    if (_1578)
    {
        float _1674 = _1636 + (-1.0);
        _1630 = _1674;
    }
    float _1676 = _1630;
    float _1678 = _1676;
    if (_1578)
    {
        float _1680 = _1566 * _1664;
        _1592 = _1680;
    }
    float _1682 = _1592;
    float _1684 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1668);
    if (_1578)
    {
        float _1686 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1686;
    }
    float _1688 = _1608;
    if (!_1578)
    {
        _1678 = _1568;
    }
    float _1690 = _1678;
    float _1692 = _1690;
    if (_1578)
    {
        float _1694 = _1568 * _1664;
        _1692 = _1694;
    }
    float _1696 = _1692;
    if (_1578)
    {
        float _1698 = _1682 * _1682;
        _1670 = _1698;
    }
    float _1700 = _1670;
    if (_1578)
    {
        float _1702 = fma(_1642, _1636, _1688);
        _1660 = _1702;
    }
    float _1704 = _1660;
    if (!_1578)
    {
        _1672 = _1572;
    }
    float _1706 = _1672;
    float _1708 = _1706;
    if (_1578)
    {
        float _1710 = _1696 * _1696;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1716 = fma(_1704, _1704, _1700);
    float _1718 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1714);
    float _1720 = _1716 + _1712;
    float _1722 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1724 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1726 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1724);
    float _1728 = precise::clamp(_1726, 0.0, 1.0);
    float _1730 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1718);
    float _1732 = rsqrt(_1720);
    float _1734 = _1534 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1736 = -_1728;
    float _1738 = _1736 + 1.0;
    float _1740 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1722);
    float _1742 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1744 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1734);
    float _1746 = abs(_1738);
    float _1748 = log2(_1746);
    float _1750 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1740);
    float _1752 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1744);
    float _1754 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1626, 1.0);
    float _1764 = _1732 * _1682;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1768 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1770 = _1732 * _1704;
    float _1772 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1774 = _1732 * _1696;
    float _1776 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1768);
    float _1778 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1780 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1782 = -_1772;
    float _1784 = fma(_1770, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1776);
    float _1788 = log2(_1762);
    float _1790 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1792 = -_1774;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1796 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1786);
    float _1798 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1800 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1790);
    float _1802 = fma(_1794, -0.5, 0.5);
    float _1804 = fma(_1794, 0.5, 0.5);
    float _1806 = exp2(_1780);
    float _1808 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1798);
    float _1810 = _1770 + 1.0;
    float _1812 = fma(_1804, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1814 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1800);
    float _1816 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1808);
    float _1818 = fma(_1804, _1812, -0.212114393711090087890625);
    float _1820 = 1.0 / _1796;
    float _1822 = _1788 * 0.693147182464599609375;
    float _1824 = fma(_1804, _1818, 1.570728778839111328125);
    float _1826 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1828 = sqrt(_1802);
    float _1830 = -_1770;
    float _1832 = fma(_1806, _1810, _1830);
    float _1834 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1816);
    float _1836 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1814);
    float _1838 = fma(_1832, 0.5, 0.5);
    float _1840 = _1834 * _1820;
    float _1842 = _1836 * _1820;
    float _1844 = fma(_1840, 0.5, 0.5);
    float _1846 = fma(_1842, -0.5, 0.5);
    float _1848 = _1828 * 0.636619746685028076171875;
    float _1850 = -_1824;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _5228 = float3(_1844, _1846, _1826);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5228, float3(0.0), isnan(_5228)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5228, float3(0.0), isnan(_5228)), level(0.0)).x;
    float3 _5239 = float3(_1844, _1846, _1826);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5239, float3(0.0), isnan(_5239)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5239, float3(0.0), isnan(_5239)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _5255 = float2(_1852, _1838);
    float3 _1867 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5255, float2(0.0), isnan(_5255)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5255, float2(0.0), isnan(_5255)), level(0.0)).xyz;
    float _1869 = _1867.x;
    float _1871 = _1867.y;
    float _1873 = _1867.z;
    float _1875 = _894 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1877 = _894 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1879 = -_1000;
    float _1881 = _1879 + 1.0;
    bool _1883 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1885 = isnan(_1562);
    bool _1887 = _1883 || _1885;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1891 = _1887 || _1889;
    float _1893 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1875);
    float _1895 = fma(_844, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1877);
    float _1897 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1893);
    float _1899 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1895);
    float _1901 = _1897 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1903 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1905 = 1.0 / _1901;
    float _1907 = _1903 + _1901;
    float _1909 = _1907 * _1905;
    float _1911 = _1909 * 0.5;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1915 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1913);
    float _1917 = 1.0 / _1915;
    float _1919 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1921 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1919);
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1925 = _1917 * _1923;
    float _1927 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1921);
    float _1929 = abs(_1925);
    float _1931 = log2(_1929);
    float _1933 = in.m_85.x;
    float _1935 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1927);
    float _1937 = _1935 + _1796;
    out.gl_Position.x = _1834;
    out.gl_Position.y = _1836;
    out.gl_Position.z = _1935;
    out.gl_Position.w = _1796;
    bool _1939 = _1925 <= 8000.0;
    bool _1941 = isnan(_1925);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan(8000.0);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    float _1951 = _1937 * 0.5;
    float _1953 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1955 = _1935;
    float _1957 = _1834;
    float _1959 = _1796;
    float _1961 = _1836;
    if (!_1891)
    {
        _1955 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1963 = _1955;
    float _1965 = exp2(_1953);
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1969 = precise::clamp(_1967, 0.0, 1.0);
    float _1971 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1973 = _1834 + _1796;
    float _1975 = _1963;
    float _1977 = _1963;
    if (!_1891)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1979 = _1957;
    float _1981 = fma(_1969, -2.0, 3.0);
    float _1983 = _1969 * _1969;
    float _1985 = _1973 * 0.5;
    float _1987 = exp2(_1971);
    float _1989 = _1983 * _1981;
    float _1991 = -_1989;
    float _1993 = _1991 + 1.0;
    float _1995 = fma(_1993, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1989);
    float _1997 = _1949 * _1995;
    float _1999 = -_1987;
    float _2001 = _1999 + 1.0;
    float _2003 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2005 = _1881 * _2003;
    float _2007 = precise::clamp(_2005, 0.0, 1.0);
    float _2009 = -_2007;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = _1796 * 0.5;
    float _2015 = _1979;
    float _2017 = _1979;
    if (!_1891)
    {
        _1959 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2019 = _1959;
    float _2021 = _2011 * _1933;
    float _2023 = fma(_1836, -0.5, _2013);
    float _2025 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2027 = _2019;
    float _2029 = _2019;
    if (!_1891)
    {
        _1961 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2031 = _1961;
    float _2033 = _2021 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_87.x = _1985;
    out.m_87.y = _2023;
    out.m_87.z = _1951;
    out.m_87.w = _1796;
    out.m_89.x = _2033;
    float _2035 = _2033;
    float _2037 = _2031;
    float _2039 = _2031;
    if (!_1891)
    {
        _2035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2041 = _2035;
    float _2043 = _2025 * _1854;
    float _2045 = -_2025;
    float _2047 = _2045 + 1.0;
    float _2049 = _1865 * _2043;
    float _2051 = _1873 * _2043;
    float _2053 = _1865 * _2047;
    float _2055 = _2047;
    float _2057 = _2041;
    float _2059 = _2041;
    if (!_1891)
    {
        _2055 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2061 = _2055;
    float _2063 = fma(_1869, _2049, _1859);
    float _2065 = fma(_1871, _2049, _1861);
    float _2067 = fma(_1865, _2051, _1863);
    out.m_91.x = _2063;
    out.m_91.y = _2065;
    out.m_91.z = _2067;
    out.m_91.w = _2053;
    bool _2069 = !_1891;
    float _2071 = _2061;
    float _2073 = _2061;
    if (!_2069)
    {
        bool _2075 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2077 = isnan(_1562);
        bool _2079 = _2075 || _2077;
        bool _2081 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2083 = _2079 || _2081;
        if (!_2083)
        {
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2087 = _1562 + _2085;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2091 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2089;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2097 = 1.0 / _2091;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2111 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2113 = _2111 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2115 = _2087 * _2097;
            float _2117 = precise::clamp(_2115, 0.0, 1.0);
            float _2119 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2121 = _2119 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2123 = fma(_2117, _2095, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2125 = fma(_2117, _2121, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2127 = fma(_2117, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2129 = fma(_2117, _2105, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2131 = fma(_2117, _2109, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2133 = fma(_2117, _2113, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2073 = _2127;
            _2039 = _2131;
            _2059 = _2123;
            _1977 = _2129;
            _2029 = _2125;
            _2017 = _2133;
            _2135 = true;
        }
        else
        {
            bool _2137 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2139 = isnan(_1562);
            bool _2141 = _2137 || _2139;
            bool _2143 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2145 = _2141 || _2143;
            if (!_2145)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2147 = _2057;
            _2059 = _2147;
            if (!_2145)
            {
                _2071 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2149 = _2071;
            _2073 = _2149;
            if (!_2145)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2151 = _2027;
            _2029 = _2151;
            if (!_2145)
            {
                _1975 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2153 = _1975;
            _1977 = _2153;
            if (!_2145)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2155 = _2037;
            _2039 = _2155;
            if (!_2145)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2157 = _2015;
            bool _2159 = !_2145;
            _2017 = _2157;
            if (!_2159)
            {
                bool _2161 = _1562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2163 = isnan(_1562);
                bool _2165 = _2161 || _2163;
                bool _2167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2169 = _2165 || _2167;
                if (!_2169)
                {
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2173 = _1562 + _2171;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2177 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2175;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2183 = 1.0 / _2177;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2199 = _2197 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2201 = _2173 * _2183;
                    float _2203 = precise::clamp(_2201, 0.0, 1.0);
                    float _2205 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2207 = _2205 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2209 = fma(_2203, _2181, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2211 = fma(_2203, _2207, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2213 = fma(_2203, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2215 = fma(_2203, _2191, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2217 = fma(_2203, _2195, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2219 = fma(_2203, _2199, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2073 = _2213;
                    _2039 = _2217;
                    _2059 = _2209;
                    _1977 = _2215;
                    _2029 = _2211;
                    _2017 = _2219;
                    _2135 = true;
                }
                else
                {
                    _2073 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1977 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2135 = false;
    float _2221 = _2073;
    float _2223 = _2039;
    float _2225 = _2059;
    float _2227 = _1977;
    float _2229 = _2029;
    float _2231 = _2017;
    float _2233 = fma(_1336, -0.5, 0.5);
    float _2235 = precise::clamp(_2233, 0.0, 1.0);
    float _2237 = -_2221;
    float _2239 = _2237 + _2223;
    float _2241 = -_2225;
    float _2243 = _2241 + _2227;
    float _2245 = -_2229;
    float _2247 = _2245 + _2231;
    bool _2249 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2251 = fma(_2235, _2239, _2221);
    float _2253 = fma(_2235, _2243, _2225);
    float _2255 = fma(_2235, _2247, _2229);
    float _2257 = _2251 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2259 = fma(_2253, 0.298911988735198974609375, _2257);
    float _2261 = fma(_2255, 0.114477999508380889892578125, _2259);
    float _2263 = -_2261;
    float _2265 = _2253 + _2263;
    float _2267 = -_2261;
    float _2269 = _2251 + _2267;
    float _2271 = -_2261;
    float _2273 = _2255 + _2271;
    float _2275 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2277 = fma(_2265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    float _2279 = fma(_2269, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    float _2281 = fma(_2273, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2261);
    out.m_53.x = _2275;
    out.m_95.x = _2277;
    out.m_95.y = _2279;
    out.m_95.z = _2281;
    if (!_2249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2283 = -_1534;
    float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2287 = -_1536;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2291 = -_1538;
    float _2293 = _2291 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2295 = _2285 * _2285;
    float _2297 = fma(_2289, _2289, _2295);
    float _2299 = fma(_2293, _2293, _2297);
    float _2301 = sqrt(_2299);
    float _2303 = rsqrt(_2299);
    float _2305 = -_2301;
    float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2309 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = _2289 * _2303;
    float _2315 = _2285 * _2303;
    float _2317 = abs(_2311);
    float _2319 = log2(_2317);
    float _2321 = _2293 * _2303;
    float _2323 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2325 = _1336 * _2315;
    float _2327 = -_2315;
    float _2329 = -_2323;
    float _2331 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2329);
    float _2333 = fma(_1334, _2313, _2325);
    float _2335 = -_2321;
    float _2337 = fma(_2335, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2331);
    float _2339 = fma(_1348, _2321, _2333);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2345 = _2337 + _2343;
    float _2347 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2349 = _2345 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2351 = precise::clamp(_2349, 0.0, 1.0);
    float _2353 = exp2(_2347);
    float _2355 = _2353 * _2351;
    float _2357 = _2341 * _2355;
    float _2359 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2361 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2363 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2359;
    out.m_93.y = _2361;
    out.m_93.z = _2363;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

