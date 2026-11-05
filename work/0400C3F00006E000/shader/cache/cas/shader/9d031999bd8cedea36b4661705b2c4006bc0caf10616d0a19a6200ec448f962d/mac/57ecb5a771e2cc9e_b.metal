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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3203 = false;
    bool _1046 = false;
    bool _834 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3509 = as_type<float>(_130);
        out.gl_Position.z = _3509;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_49.w;
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
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3573 = as_type<float>(_164);
        out.gl_Position.z = _3573;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_55.x;
    float _192 = in.m_55.y;
    float _194 = in.m_55.z;
    float _196 = in.m_57.w;
    float _198 = in.m_49.x;
    float _200 = in.m_49.y;
    float _202 = in.m_49.z;
    float _204 = _166 * _166;
    float _206 = _168 * _168;
    float _208 = _170 * _170;
    float _210 = fma(_174, _174, _204);
    float _212 = fma(_176, _176, _206);
    float _214 = fma(_178, _178, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = 0.0;
    float _234 = _216;
    float _236 = _218;
    float _238 = _220;
    float _240 = _194;
    float _242 = _190;
    if (_228)
    {
        float _244 = rsqrt(_216);
        _232 = _244;
    }
    float _246 = _232;
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_228)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    bool _256 = _226 > 0.0;
    float _258 = in.m_44.x;
    float _260 = in.m_44.y;
    float _262 = in.m_44.z;
    float _264 = 0.0;
    float _266 = _252;
    float _268 = _254;
    if (!_228)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = 0.0;
    float _274 = 0.0;
    float _276 = _270;
    if (!_230)
    {
        _272 = 0.0;
        _274 = 0.0;
    }
    float _278 = _272;
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    float _286 = _278;
    if (_230)
    {
        float _288 = rsqrt(_218);
        _282 = _288;
    }
    float _290 = _282;
    if (!_188)
    {
        float _292 = _172 * _172;
        float _294 = _292 * 0.5;
        _234 = _294;
    }
    float _296 = _234;
    float _298 = 0.0;
    float _300 = _296;
    if (!_230)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = _302;
    if (!_188)
    {
        float _306 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = 0.0;
    float _312 = _308;
    if (_256)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    if (_228)
    {
        float _318 = _246 * _174;
        _276 = _318;
    }
    float _320 = _276;
    if (_228)
    {
        float _322 = _246 * _166;
        _266 = _322;
    }
    float _324 = _266;
    if (_228)
    {
        float _326 = _246 * _190;
        _268 = _326;
    }
    float _328 = _268;
    if (!_256)
    {
        _236 = 0.0;
    }
    float _330 = _236;
    float _332 = _330;
    if (_230)
    {
        float _334 = _290 * _176;
        _284 = _334;
    }
    float _336 = _284;
    if (_230)
    {
        float _338 = _290 * _168;
        _286 = _338;
    }
    float _340 = _286;
    if (_230)
    {
        float _342 = _290 * _192;
        _304 = _342;
    }
    float _344 = _304;
    bool _346 = !_188;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _172 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _172);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _376;
        _238 = _362;
    }
    float _378 = _312;
    float _380 = _238;
    float _382 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _384 = 1.0 / _136;
    float _386 = _380;
    float _388 = _378;
    if (_256)
    {
        float _390 = _316 * _170;
        _332 = _390;
    }
    float _392 = _332;
    float _394 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _396 = _382 * _324;
    float _398 = _382 * _340;
    float _400 = _392;
    if (!_256)
    {
        _386 = 0.0;
    }
    float _402 = _386;
    float _404 = _382 * _392;
    float _406 = fma(_394, _320, _396);
    float _408 = _402;
    if (_256)
    {
        float _410 = _316 * _178;
        _408 = _410;
    }
    float _412 = _408;
    float _414 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _416 = fma(_394, _336, _398);
    if (!_256)
    {
        _400 = 0.0;
    }
    float _418 = _400;
    float _420 = _418;
    if (_256)
    {
        float _422 = _316 * _194;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = fma(_394, _412, _404);
    float _428 = fma(_414, _328, _406);
    float _430 = fma(_414, _344, _416);
    if (!_188)
    {
        _388 = _172;
    }
    float _432 = _388;
    bool _434 = !_188;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = 1.0 / _444;
        float _448 = _172 * _440;
        float _450 = exp2(_448);
        float _452 = -_450;
        float _454 = _452 + 1.0;
        float _456 = _454 * _446;
        _436 = _456;
    }
    float _458 = _436;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _462 = fma(_414, _424, _426);
    float _464 = fma(_458, _198, _428);
    float _466 = fma(_458, _200, _430);
    float _468 = fma(_458, _202, _462);
    float _470 = fma(_464, _196, _258);
    float _472 = fma(_466, _196, _260);
    float _474 = _140 * _384;
    float _476 = fma(_468, _196, _262);
    bool _478 = !_460;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _474;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _518 = 1.0 / _504;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _520;
    float _524 = 1.0 / _508;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _528 = _500 + _526;
    bool _530 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _532 = isnan(_500);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = 1.0 / _516;
    float _544 = _528 * _518;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _548 = _500 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _552 = _500 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _556 = _500 + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _522;
    float _562 = _548 * _524;
    bool _564 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _566 = isnan(_500);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = 1.0 / _512;
    float _578 = _552 * _542;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _580;
    float _584 = fma(_582, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _588 = _500 + _586;
    float _590 = _588 * _560;
    bool _592 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _594 = isnan(_500);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _604;
    float _608 = _556 * _576;
    float _610 = -_574;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = fma(_606, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _624 = _602 * _612;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _630 = fma(_616, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _636 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _638 = isnan(_500);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_540;
    float _650 = _648 + 1.0;
    float _652 = fma(_622, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _654 = fma(_628, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = fma(_634, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _658 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_500);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _646 * _650;
    bool _672 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _674 = isnan(_500);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_646;
    float _686 = _684 + 1.0;
    float _688 = -_602;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _692;
    float _696 = _682 * _686;
    float _698 = -_682;
    float _700 = _698 + 1.0;
    float _702 = _540 * _690;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _708;
    float _712 = _668 * _700;
    float _714 = fma(_694, _608, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _716 = fma(_706, _608, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _718 = fma(_710, _608, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _720 = _630 * _712;
    float _722 = _618 * _712;
    float _724 = -_668;
    float _726 = _724 + 1.0;
    float _728 = _584 * _712;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].x, _720);
    float _744 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].y, _722);
    float _746 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].z, _728);
    float _748 = fma(_732, _578, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _750 = fma(_736, _578, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _752 = fma(_740, _578, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _754 = fma(_652, _696, _742);
    float _756 = fma(_654, _696, _744);
    float _758 = in.m_57.x;
    float _760 = in.m_57.y;
    float _762 = in.m_57.z;
    float _764 = fma(_656, _696, _746);
    float _766 = fma(_716, _670, _754);
    float _768 = fma(_714, _670, _756);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _770;
    float _774 = fma(_718, _670, _764);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _776;
    float _780 = fma(_748, _702, _766);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _782;
    float _786 = fma(_772, _590, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _788 = fma(_778, _590, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _790 = fma(_750, _702, _768);
    float _792 = fma(_784, _590, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _794 = fma(_752, _702, _774);
    float _796 = fma(_786, _624, _780);
    float _798 = fma(_788, _624, _790);
    float _800 = fma(_792, _624, _794);
    float _802 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].x, _796);
    float _804 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].y, _798);
    float _806 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].z, _800);
    float _808 = _802 * _758;
    float _810 = _804 * _760;
    float _812 = _806 * _762;
    bool _814 = !_558;
    float _832;
    if (!_814)
    {
        float _816 = in.m_59.x;
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _820 = _816 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        _832 = _474;
    }
    _834 = false;
    float _836 = _832;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _836 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _854 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _856 = isnan(_836);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = 1.0 / _844;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _874 = isnan(_836);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    bool _884 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _886 = 1.0 / _852;
    float _888 = _848 * _866;
    bool _890 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _892 = isnan(_836);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = 1.0 / _870;
    float _904 = -_864;
    float _906 = _904 + 1.0;
    float _908 = fma(_888, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _914 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _916 = isnan(_836);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_900;
    float _928 = _926 + 1.0;
    float _930 = _900 * _906;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _936 = 1.0 / _912;
    float _938 = -_924;
    float _940 = _938 + 1.0;
    float _942 = _882 * _928;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _944;
    float _948 = _934 * _886;
    float _950 = _864 * _940;
    float _952 = _908 * _942;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _956 = _836 + _954;
    float _958 = -_882;
    float _960 = _958 + 1.0;
    bool _962 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _964 = isnan(_836);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _946 * _902;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _982 = _836 + _980;
    float _984 = fma(_948, _956, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _986 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[115].x, _952);
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _978 * _936;
    float _994 = fma(_974, _982, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _998 = _836 + _996;
    float _1000 = fma(_984, _930, _986);
    float _1002 = _924 * _990;
    float _1004 = fma(_992, _998, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1006 = fma(_994, _950, _1000);
    float _1008 = fma(_1004, _1002, _1006);
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1016 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1008);
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1026 = !_884;
    float _1044;
    if (!_1026)
    {
        float _1028 = in.m_59.x;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1032 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _1036 = _1034 * _1030;
        float _1038 = floor(_1036);
        float _1040 = -_1038;
        float _1042 = _1036 + _1040;
        _1044 = _1042;
        _1046 = true;
    }
    else
    {
        _1044 = _474;
    }
    _1046 = false;
    float _1048 = _1044;
    float _1050 = in.m_59.y;
    float _1052 = _472 * _176;
    float _1054 = _472 * _192;
    float _1056 = in.m_59.z;
    float _1058 = in.m_59.w;
    float _1060 = fma(_470, _174, _1052);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = in.m_55.w;
    float _1068 = fma(_470, _190, _1054);
    float _1070 = fma(_476, _178, _1060);
    float _1072 = in.m_59.x;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1084 = _1082 != 0;
    float _1086 = fma(_476, _194, _1068);
    float _1088 = in.m_53.w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1096 = _1050 * 2.0;
    float _1098 = _1086;
    int _1100 = as_type<int>(_1048);
    if (!_1064)
    {
        _240 = _1050;
    }
    float _1102 = _240;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1106 = _1056 * 2.0;
    float _1108 = floor(_1096);
    float _1110 = _1086 + _1066;
    float _1112 = _1102;
    if (!_1064)
    {
        _1098 = _1056;
    }
    float _1114 = _1098;
    float _1116 = _1114;
    if (_1064)
    {
        _1116 = _1050;
    }
    float _1118 = _1116;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1064)
    {
        _1112 = _1072;
    }
    float _1122 = _1112;
    float _1124 = floor(_1106);
    if (_1064)
    {
        _242 = _1072;
    }
    float _1126 = _242;
    float _1128 = _1070 + _1088;
    float _1130 = _1126;
    if (!_1064)
    {
        _1130 = _1056;
    }
    float _1132 = _1130;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1136 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1090);
    float _1138 = -_1110;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1144 = _1108 >= 0.0;
    bool _1146 = isnan(_1108);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    float _1154 = -_1092;
    float _1156 = fma(_1134, 2.0, _1154);
    bool _1158 = _1108 > 0.0;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1128 + _1160;
    int _1164 = _1152 ? 0 : 1;
    float _1166 = -_1094;
    float _1168 = fma(_1142, 2.0, _1166);
    float _1170 = _1132;
    float _1172 = _1140;
    if (!_1064)
    {
        _1170 = _1056;
    }
    float _1174 = _1170;
    float _1176 = _1072 * 2.0;
    bool _1178 = _1124 > 0.0;
    float _1180 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1120);
    bool _1182 = _1124 >= 0.0;
    bool _1184 = isnan(_1124);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    float _1192 = floor(_1176);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1196 = _1190 ? 0 : 1;
    float _1198 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1180);
    float _1200 = _1174;
    if (_1064)
    {
        _1200 = _1050;
    }
    float _1202 = _1200;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1206 = ~_1196;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1194);
    float _1214 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1204);
    int _1216 = ~_1164;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1224 = log2(_1222);
    int _1226 = _1210;
    int _1228 = _1220;
    if (!_1178)
    {
        int _1230 = ~_1196;
        int _1232 = _1230 + 1;
        _1226 = _1232;
    }
    int _1234 = _1226;
    float _1236 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1158)
    {
        int _1238 = ~_1164;
        int _1240 = _1238 + 1;
        _1228 = _1240;
    }
    int _1242 = _1228;
    float _1244 = _1050 + _1072;
    float _1246 = abs(_1162);
    float _1248 = abs(_1140);
    float _1250 = precise::max(_1246, _1248);
    float _1252 = fma(_1236, -2.0, _1104);
    float _1254 = _1056 + _1072;
    float _1256 = _1244 + (-1.0);
    bool _1258 = _1250 >= 16.0;
    float _1260 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1212);
    bool _1262 = !_1076;
    int _1264 = _1262 ? 0 : 1;
    float _1266 = _1254 + (-1.0);
    float _1268 = _1244;
    if (_1064)
    {
        _1268 = _1050;
    }
    float _1270 = _1268;
    float _1272 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1274 = _1270;
    if (!_1064)
    {
        _1274 = _1072;
    }
    float _1276 = _1274;
    float _1278 = _1224 * _140;
    int _1280 = abs(_1264);
    float _1282 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1286 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1288 = float(_1280);
    float _1290 = exp2(_1278);
    float _1292 = float(_1234);
    float _1294 = fma(_1286, -2.0, _1284);
    float _1296 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1214);
    bool _1298 = _1192 > 0.0;
    float _1300 = _1288 * _1292;
    bool _1302 = _1192 >= 0.0;
    bool _1304 = isnan(_1192);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = in.m_61.x;
    float _1314 = in.m_61.y;
    float _1316 = in.m_61.z;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1320 = 1.0 + _1318;
    bool _1322 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1324 = isnan(1.0);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1330 = _1326 || _1328;
    float _1332 = _1300 * (-2.0);
    bool _1334 = !_1084;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = 1.0 / _1320;
    int _1340 = _1310 ? 0 : 1;
    float _1342 = -_140;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1156);
    bool _1346 = !_1080;
    int _1348 = _1346 ? 0 : 1;
    float _1350 = -_1290;
    float _1352 = _1350 + 1.0;
    bool _1354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1136);
    int _1366 = abs(_1348);
    float _1368 = -_140;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1168);
    int _1372 = abs(_1336);
    float _1374 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1294);
    int _1376 = ~_1340;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    int _1382 = _1380;
    bool _1384 = _1362;
    if (_1258)
    {
        float _1386 = _1140 * 0.0625;
        _1172 = _1386;
    }
    float _1388 = _1172;
    if (!_1298)
    {
        int _1390 = ~_1340;
        int _1392 = _1390 + 1;
        _1382 = _1392;
    }
    int _1394 = _1382;
    float _1396 = _1162 * 0.0625;
    float _1398 = _1362 ? _1352 : 0.0;
    float _1400 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1252);
    float _1402 = float(_1242);
    float _1404 = fma(_1272, _1332, _1272);
    float _1406 = _1258 ? _1396 : _1162;
    if (_1330)
    {
        float _1408 = _1398 * _1338;
        _158 = _1408;
    }
    float _1410 = _158;
    float _1412 = _1072 + (-0.5);
    float _1414 = fma(_1332, _1312, _1312);
    float _1416 = float(_1372);
    float _1418 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1414);
    float _1420 = abs(_1406);
    bool _1422 = _1420 != 0.0;
    bool _1424 = isnan(_1420);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.0);
    bool _1430 = _1426 || _1428;
    float _1432 = _1050 + _1056;
    float _1434 = float(_1366);
    float _1436 = _1416 * _1402;
    float _1438 = float(_1394);
    float _1440 = fma(_1404, _1410, _1418);
    float _1442 = abs(_1388);
    bool _1444 = _1442 == 0.0;
    bool _1446 = !_1430;
    bool _1448 = _1444 && _1446;
    float _1450 = _1436 * (-2.0);
    float _1452 = abs(_1388);
    bool _1454 = _1452 == 0.0;
    float _1456 = _1434 * _1438;
    float _1458 = _1440 * 0.15915493667125701904296875;
    float _1460 = _1432 + (-1.0);
    float _1462 = _1456 * (-2.0);
    float _1464 = _1458 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = fma(_1282, _1450, _1282);
    float _1470 = fma(_1450, _1316, _1316);
    float _1472 = fma(_1462, _1314, _1314);
    float _1474 = _1056 + (-0.5);
    float _1476 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1478 = _1050 + (-0.5);
    int _1480 = as_type<int>(_1474);
    if (_1448)
    {
        bool _1482 = as_type<int>(_1388) >= 0;
        _1384 = _1482;
    }
    bool _1484 = _1384;
    float _1486 = _1458 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1470);
    float _1492 = fma(_1476, _1462, _1476);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1472);
    float _1496 = _1494;
    int _1498 = _1484 ? (-1) : 0;
    if (_1448)
    {
        int _1500 = _1484 ? 0 : 1078530011;
        _1480 = _1500;
    }
    int _1502 = _1480;
    float _1504 = fma(_1468, _1410, _1490);
    float _1506 = fma(_1492, _1410, _1494);
    int _1508 = _1502;
    if (_1448)
    {
        int _1510 = int(0x80000000) & as_type<int>(_1406);
        int _1512 = _1502 | _1510;
        _1496 = as_type<float>(_1512);
    }
    float _1514 = _1496;
    bool _1516 = !_1430;
    bool _1518 = _1516 && _1454;
    float _1520 = _1514;
    float _1522 = _1514;
    if (!_1518)
    {
        float _1524 = abs(_1406);
        bool _1526 = _1524 != as_type<float>(0x7f800000u /* inf */);
        bool _1528 = isnan(_1524);
        bool _1530 = _1526 || _1528;
        bool _1532 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1534 = _1530 || _1532;
        float _1536 = abs(_1388);
        bool _1538 = _1536 == as_type<float>(0x7f800000u /* inf */);
        float _1540 = abs(_1388);
        bool _1542 = _1540 == as_type<float>(0x7f800000u /* inf */);
        bool _1544 = !_1534;
        bool _1546 = _1542 && _1544;
        if (_1546)
        {
            bool _1548 = as_type<int>(_1388) >= 0;
            _1498 = _1548 ? (-1) : 0;
        }
        int _1550 = _1498;
        if (_1546)
        {
            _1508 = 1075235812;
        }
        int _1552 = _1508;
        int _1554 = _1552;
        if (_1546)
        {
            int _1556 = ~_1550;
            int _1558 = (_1556 != 0) ? _1552 : 1061752795;
            _1554 = _1558;
        }
        int _1560 = _1554;
        if (_1546)
        {
            int _1562 = int(0x80000000) & as_type<int>(_1406);
            int _1564 = _1560 | _1562;
            _1520 = as_type<float>(_1564);
        }
        float _1566 = _1520;
        bool _1568 = !_1534;
        bool _1570 = _1568 && _1538;
        _1522 = _1566;
        if (!_1570)
        {
            float _1572 = abs(_1406);
            float _1574 = abs(_1388);
            float _1576 = precise::max(_1572, _1574);
            float _1578 = abs(_1406);
            float _1580 = abs(_1388);
            float _1582 = precise::min(_1578, _1580);
            float _1584 = 1.0 / _1576;
            float _1586 = abs(_1406);
            float _1588 = abs(_1388);
            bool _1590 = _1586 > _1588;
            bool _1592 = as_type<int>(_1388) >= 0;
            float _1594 = _1582 * _1584;
            float _1596 = abs(_1406);
            float _1598 = abs(_1388);
            float _1600 = _1596 + _1598;
            int _1602 = as_type<int>(_1406) & int(0x80000000);
            float _1604 = _1594 * _1594;
            bool _1606 = _1600 > as_type<float>(0x7f800000u /* inf */);
            bool _1608 = isnan(_1600);
            bool _1610 = _1606 || _1608;
            bool _1612 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1614 = _1610 || _1612;
            float _1616 = _1604 + 11.33538818359375;
            float _1618 = fma(_1604, _1616, 28.84246826171875);
            float _1620 = fma(_1604, _1618, 19.6966705322265625);
            float _1622 = fma(_1604, -0.82336294651031494140625, -5.674867153167724609375);
            float _1624 = fma(_1604, _1622, -6.565555095672607421875);
            float _1626 = 1.0 / _1620;
            float _1628 = _1604 * _1624;
            float _1630 = _1594 * _1628;
            float _1632 = fma(_1630, _1626, _1594);
            float _1634 = _1632;
            _1522 = _1600;
            if (_1590)
            {
                float _1636 = -_1632;
                float _1638 = _1636 + 1.57079637050628662109375;
                _1634 = _1638;
            }
            float _1640 = _1634;
            int _1642 = as_type<int>(_1640);
            if (!_1592)
            {
                float _1644 = -_1640;
                float _1646 = _1644 + 3.1415927410125732421875;
                _1642 = as_type<int>(_1646);
            }
            int _1648 = _1642;
            if (!_1614)
            {
                int _1650 = _1602 | _1648;
                _1522 = as_type<float>(_1650);
            }
        }
    }
    float _1652 = _1522;
    float _1654 = in.m_63.x;
    float _1656 = in.m_63.y;
    float _1658 = in.m_63.z;
    float _1660 = -_1652;
    float _1662 = _1506 + _1660;
    float _1664 = _472 * _168;
    float _1666 = _1504 * 0.15915493667125701904296875;
    float _1668 = _1662 * 0.15915493667125701904296875;
    float _1670 = fma(_470, _166, _1664);
    float _1672 = _1666 * 6.283185482025146484375;
    float _1674 = cos(_1672);
    float _1676 = in.m_65.y;
    float _1678 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1680 = fma(_476, _170, _1670);
    float _1682 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1684 = in.m_51.w;
    float _1686 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1688 = _1668 * 6.283185482025146484375;
    float _1690 = sin(_1688);
    bool _1692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1694 = isnan(0.5);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1700 = _1696 || _1698;
    bool _1702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1704 = isnan(0.5);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1710 = _1706 || _1708;
    float _1712 = _1668 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1656);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1658);
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1654);
    float _1722 = _1466 * _1674;
    float _1724 = _1716 * _1678;
    float _1726 = _1718 * _1682;
    float _1728 = _1720 * _1686;
    float _1730 = _1666 * 6.283185482025146484375;
    float _1732 = sin(_1730);
    float _1734 = _1488 * _1690;
    float _1736 = _1466 * _1690;
    float _1738 = _1722 * _1724;
    float _1740 = _1690 * _1674;
    float _1742 = -_1676;
    float _1744 = _1742 + 1.0;
    float _1746 = _1680 + _1684;
    float _1748 = _1466 * _1714;
    float _1750 = _1488 * _1714;
    float _1752 = _1714 * _1674;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1756 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _474);
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1760 = _1488 * _1674;
    float _1762 = -_1734;
    float _1764 = fma(_1732, _1748, _1762);
    float _1766 = -_1724;
    float _1768 = _1732 * _1766;
    float _1770 = fma(_1732, _1736, _1750);
    float _1772 = fma(_1732, _1750, _1736);
    float _1774 = fma(_1764, _1728, _1738);
    float _1776 = fma(_1752, _1728, _1768);
    float _1778 = _1760 * _1724;
    float _1780 = -_1748;
    float _1782 = fma(_1732, _1734, _1780);
    float _1784 = fma(_1770, _1726, _1774);
    float _1786 = fma(_1740, _1726, _1776);
    float _1788 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1758);
    float _1790 = fma(_1772, _1728, _1778);
    float _1792 = _1110 + _1784;
    float _1794 = _1128 + _1786;
    float _1796 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1788);
    float _1798 = fma(_1782, _1726, _1790);
    float _1800 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1802 = _1792 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1806 = _1794 + _1804;
    float _1808 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1810 = _1802 * _1754;
    float _1812 = _1806 * _1754;
    float _1814 = 1.0 / _1808;
    float _1816 = fma(_1810, _1756, _1792);
    float _1818 = fma(_1812, _1756, _1794);
    float _1820 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1822 = _1746 + _1798;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1826 = _1816 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1830 = _1818 + _1828;
    float _1832 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1820);
    float _1834 = _1826 * _1826;
    float _1836 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1832);
    float _1838 = fma(_1830, _1830, _1834);
    float _1840 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1842 = sqrt(_1838);
    float _1844 = _1840 + _1808;
    float _1846 = _1844 * _1814;
    float _1848 = _1846 * 0.5;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1852 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1850);
    float _1854 = 1.0 / _1852;
    bool _1856 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1858 = _1750;
    float _1860 = _1790;
    float _1862 = _1674;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1866 = _1826;
    float _1868 = _1852;
    float _1870 = _1676;
    if (!_1856)
    {
        _1858 = _1818;
    }
    float _1872 = _1858;
    float _1874 = _1872;
    if (!_1856)
    {
        _1860 = _1816;
    }
    float _1876 = _1860;
    float _1878 = _1876;
    if (!_1856)
    {
        _1862 = _1822;
    }
    float _1880 = _1862;
    bool _1882 = !_1856;
    float _1884 = _1880;
    if (!_1882)
    {
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1890 = _1842 + _1888;
        float _1892 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = rsqrt(_1838);
        float _1896 = _1890 * _1886;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = _1898 * 6.283185482025146484375;
        float _1902 = cos(_1900);
        float _1904 = _1898 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        float _1908 = _1902 + (-1.0);
        float _1910 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1912 = fma(_1906, _1892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1914 = fma(_1822, _1902, _1910);
        float _1916 = _1894 * _1912;
        float _1918 = fma(_1830, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1920 = fma(_1826, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1874 = _1918;
        _1884 = _1914;
        _1878 = _1920;
    }
    float _1922 = _1874;
    float _1924 = _1884;
    float _1926 = _1878;
    float _1928 = _1924;
    float _1930 = _1922;
    float _1932 = _1926;
    if (_1710)
    {
        _1864 = 1.0;
    }
    float _1934 = _1864;
    float _1936 = _1934;
    if (!_1700)
    {
        float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1940 = _1746 + _1938;
        float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1944 = -_1128;
        float _1946 = _1944 + _1922;
        float _1948 = -_1746;
        float _1950 = _1948 + _1924;
        float _1952 = _1940 * _1940;
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1956 = _1110 + _1954;
        float _1958 = fma(_1162, _1162, _1952);
        float _1960 = fma(_1956, _1956, _1958);
        float _1962 = sqrt(_1960);
        float _1964 = precise::min(_1962, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1966 = _1964 * _1942;
        float _1968 = -_1110;
        float _1970 = _1968 + _1926;
        float _1972 = fma(_1946, _1966, _1128);
        float _1974 = fma(_1950, _1966, _1746);
        float _1976 = fma(_1970, _1966, _1110);
        _1928 = _1974;
        _1930 = _1972;
        _1932 = _1976;
        _1866 = _1962;
    }
    float _1978 = _1928;
    float _1980 = _1930;
    float _1982 = _1932;
    float _1984 = _1866;
    float _1986 = _1984;
    if (_1710)
    {
        _1868 = 1.0;
    }
    float _1988 = _1868;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1992 = _1854 * _1990;
    float _1994 = _1988;
    if (!_1710)
    {
        float _1996 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2002 = _1998 * 6.283185482025146484375;
        float _2004 = cos(_2002);
        float _2006 = _2000 * 0.15915493667125701904296875;
        float _2008 = _1998 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = 1.0 / _2004;
        float _2014 = _2006 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = _2006 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = 1.0 / _2024;
        float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2030 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2028;
        float _2032 = 1.0 / _2030;
        float _2034 = _2022 * _2026;
        float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2038 = fma(_1992, _2034, _2036);
        float _2040 = _2038 * _2032;
        float _2042 = precise::clamp(_2040, 0.0, 1.0);
        _1986 = _1998;
        _1936 = _2042;
    }
    float _2044 = _1986;
    float _2046 = _1936;
    float _2048 = _2044;
    if (!_1710)
    {
        float _2050 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        float _2060 = _2054 * 0.15915493667125701904296875;
        float _2062 = _2052 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2058;
        float _2068 = _2060 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2060 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2082;
        float _2086 = 1.0 / _2084;
        float _2088 = _2076 * _2080;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2092 = fma(_1992, _2088, _2090);
        float _2094 = _2092 * _2086;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        float _2098 = -_2096;
        float _2100 = _2098 + 1.0;
        _1994 = _2100;
    }
    float _2102 = _1994;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2106 = _1978 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2110 = _1980 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2114 = _1982 + _2112;
    float _2116 = _2106 * _2106;
    float _2118 = fma(_2110, _2110, _2116);
    float _2120 = fma(_2114, _2114, _2118);
    float _2122 = rsqrt(_2120);
    float _2124 = sqrt(_2120);
    float _2126 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2128 = _2110 * _2126;
    float _2130 = _2114 * _2126;
    float _2132 = _2128 * _2128;
    float _2134 = _2130 * _2130;
    float _2136 = _2132 + _2134;
    float _2138 = sqrt(_2136);
    bool _2140 = _2138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2144 = _2138 + _2142;
    float _2146 = _2114;
    float _2148 = _2136;
    float _2150 = _2144;
    float _2152 = _2126;
    if (_2140)
    {
        float _2154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2146 = _2154;
    }
    float _2156 = _2146;
    if (_2140)
    {
        float _2158 = rsqrt(_2136);
        _2148 = _2158;
    }
    float _2160 = _2148;
    if (_2140)
    {
        float _2162 = _2144 * _2156;
        _2150 = _2162;
    }
    float _2164 = _2150;
    if (_2140)
    {
        float _2166 = _2164 * 0.15915493667125701904296875;
        _2048 = _2166;
    }
    float _2168 = _2048;
    float _2170 = _2116;
    float _2172 = _2168;
    if (_2140)
    {
        float _2174 = _2168 * 6.283185482025146484375;
        float _2176 = sin(_2174);
        _2170 = _2176;
    }
    float _2178 = _2170;
    float _2180 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2182 = precise::max(0.0, _2180);
    float _2184 = _2122;
    float _2186 = _2182;
    float _2188 = _2180;
    if (_2140)
    {
        float _2190 = _2168 * 6.283185482025146484375;
        float _2192 = cos(_2190);
        _2184 = _2192;
    }
    float _2194 = _2184;
    float _2196 = -_2126;
    float _2198 = -_2182;
    float _2200 = fma(_2106, _2196, _2198);
    float _2202 = _2200;
    if (!_2140)
    {
        _2186 = _2128;
    }
    float _2204 = _2186;
    float _2206 = _2204;
    if (_2140)
    {
        float _2208 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2188 = _2208;
    }
    float _2210 = _2188;
    float _2212 = _2178;
    float _2214 = _2210;
    if (_2140)
    {
        float _2216 = fma(_2178, _2210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2212 = _2216;
    }
    float _2218 = _2212;
    float _2220 = _2218;
    float _2222 = _2194;
    if (_2140)
    {
        float _2224 = _2194 + (-1.0);
        _2214 = _2224;
    }
    float _2226 = _2214;
    float _2228 = _2226;
    if (_2140)
    {
        float _2230 = _2160 * _2218;
        _2152 = _2230;
    }
    float _2232 = _2152;
    if (!_2140)
    {
        _2220 = _2132;
    }
    float _2234 = _2220;
    float _2236 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2238 = _2234;
    if (_2140)
    {
        float _2240 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2240;
    }
    float _2242 = _2172;
    if (_2140)
    {
        float _2244 = _2128 * _2232;
        _2206 = _2244;
    }
    float _2246 = _2206;
    if (!_2140)
    {
        _2228 = _2130;
    }
    float _2248 = _2228;
    float _2250 = _2248;
    if (_2140)
    {
        float _2252 = _2130 * _2232;
        _2250 = _2252;
    }
    float _2254 = _2250;
    if (_2140)
    {
        float _2256 = fma(_2200, _2194, _2242);
        _2202 = _2256;
    }
    float _2258 = _2202;
    if (_2140)
    {
        float _2260 = _2246 * _2246;
        _2238 = _2260;
    }
    float _2262 = _2238;
    if (!_2140)
    {
        _2222 = _2134;
    }
    float _2264 = _2222;
    float _2266 = _2264;
    if (_2140)
    {
        float _2268 = _2254 * _2254;
        _2266 = _2268;
    }
    float _2270 = _2266;
    float _2272 = fma(_2258, _2258, _2262);
    float _2274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2276 = _2272 + _2270;
    float _2278 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2236);
    float _2280 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2284 = fma(_2124, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2282);
    float _2286 = precise::clamp(_2284, 0.0, 1.0);
    float _2288 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2290 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2278);
    float _2292 = rsqrt(_2276);
    float _2294 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2296 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2280);
    float _2298 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2300 = -_2286;
    float _2302 = _2300 + 1.0;
    float _2304 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2294);
    float _2306 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2296);
    float _2308 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2310 = abs(_2302);
    float _2312 = log2(_2310);
    float _2314 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2304);
    float _2316 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2318 = -_2308;
    float _2320 = fma(_2318, _2274, 1.0);
    float _2322 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2288);
    float _2324 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2326 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2328 = _2292 * _2246;
    float _2330 = _2292 * _2258;
    float _2332 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2322);
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2326);
    float _2336 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2338 = _2292 * _2254;
    float _2340 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2342 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2334);
    float _2344 = -_2336;
    float _2346 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2344);
    float _2348 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2350 = log2(_2320);
    float _2352 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2342);
    float _2354 = -_2338;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2346);
    float _2358 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2360 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2362 = fma(_2356, -0.5, 0.5);
    float _2364 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2358);
    float _2366 = 1.0 / _2352;
    float _2368 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2360);
    float _2370 = fma(_2356, 0.5, 0.5);
    float _2372 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2364);
    float _2374 = _2330 + 1.0;
    float _2376 = fma(_2370, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2378 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2372);
    float _2380 = exp2(_2348);
    float _2382 = _2350 * 0.693147182464599609375;
    float _2384 = fma(_2370, _2376, -0.212114393711090087890625);
    float _2386 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2388 = fma(_2370, _2384, 1.570728778839111328125);
    float _2390 = sqrt(_2362);
    float _2392 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2368);
    float _2394 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2392);
    float _2396 = -_2330;
    float _2398 = fma(_2380, _2374, _2396);
    float _2400 = _2378 * _2366;
    float _2402 = _2394 * _2366;
    float _2404 = fma(_2398, 0.5, 0.5);
    float _2406 = fma(_2400, 0.5, 0.5);
    float _2408 = fma(_2402, -0.5, 0.5);
    float _2410 = _2390 * 0.636619746685028076171875;
    float _2412 = -_2388;
    float _2414 = fma(_2410, _2412, 1.0);
    float3 _7029 = float3(_2406, _2408, _2386);
    float _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7029, float3(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7029, float3(0.0), isnan(_7029)), level(0.0)).x;
    float3 _7040 = float3(_2406, _2408, _2386);
    float4 _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7040, float3(0.0), isnan(_7040)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7040, float3(0.0), isnan(_7040)), level(0.0)).xyzw;
    float _2421 = _2419.x;
    float _2423 = _2419.y;
    float _2425 = _2419.z;
    float _2427 = _2419.w;
    float2 _7057 = float2(_2414, _2404);
    float3 _2431 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7057, float2(0.0), isnan(_7057)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7057, float2(0.0), isnan(_7057)), level(0.0)).xyz;
    float _2433 = _2431.x;
    float _2435 = _2431.y;
    float _2437 = _2431.z;
    out.m_67.x = _1018;
    out.m_67.y = _1020;
    out.m_67.z = _1022;
    out.m_67.w = _1024;
    float _2439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2445 = _1050 > 0.5;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2451 = in.m_65.x;
    bool _2453 = _1056 > 0.5;
    float _2455 = 1.0 / _2443;
    int _2457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2459 = _2457 != 0;
    float _2461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2465 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2467 = _1048 + _2465;
    int _2469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2471 = _2469 != 0;
    float _2473 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2475 = 1.0 / _2449;
    int _2477 = _2453 ? as_type<int>(_1744) : as_type<int>(_1676);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2485 = _2483 != 0;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2491 = _2445 ? as_type<int>(_1744) : as_type<int>(_1676);
    float _2493 = in.m_69.w;
    bool _2495 = _1058 > 0.5;
    float _2497 = 1.0 / _2463;
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2501 = _2499 != 0;
    out.m_71.x = _1752;
    out.m_71.y = _1772;
    out.m_71.z = _1764;
    out.m_73.x = _1980;
    out.m_73.y = _1978;
    out.m_73.z = _1982;
    float _2503 = _2485 ? as_type<float>(_2491) : _1676;
    float _2505 = 1.0 / _2489;
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2509 = _2507 != 0;
    float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2517 = _2515 != 0;
    float _2519 = as_type<float>(_2491);
    bool _2521 = _2501;
    bool _2523 = _2495;
    float _2525 = _2467;
    float _2527 = _2439;
    float _2529 = _2451;
    float _2531 = _2352;
    float _2533 = _2394;
    float _2535 = _2378;
    if (_2471)
    {
        float _2537 = in.m_59.z;
        _2519 = _2537;
    }
    float _2539 = _2519;
    float _2541 = _2501 ? as_type<float>(_2477) : _1676;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2543;
    float _2547 = 1.0 / _2481;
    if (_2459)
    {
        bool _2549 = _1072 > 0.5;
        _2521 = _2549;
    }
    bool _2551 = _2521;
    float _2553 = _2545 * _2455;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2555;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2561 = _2559 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2563 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2565 = isnan(_1048);
    bool _2567 = _2563 || _2565;
    bool _2569 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2571 = _2567 || _2569;
    float _2573 = float(_2571);
    float _2575 = 1.0 / _2513;
    float _2577 = _2557 * _2475;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2579;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2589 = _2587 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2591 = _2561 * _2505;
    float _2593 = _2581 * _2497;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2597 = _1048 + _2595;
    float _2599 = 1.0 / _2589;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2517)
    {
        float _2605 = _2495 ? _1744 : _1676;
        _1870 = _2605;
    }
    float _2607 = _1870;
    float _2609 = fma(_2553, _2597, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2613 = _1048 + _2611;
    bool _2615 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2617 = isnan(_1048);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = _2603 * _2547;
    float _2629 = _2585 * _2575;
    float _2631 = fma(_2591, _2613, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2635 = _1048 + _2633;
    bool _2637 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2639 = isnan(_1048);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2645 = _2641 || _2643;
    float _2647 = float(_2645);
    float _2649 = -_2625;
    float _2651 = _2649 + 1.0;
    bool _2653 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2655 = isnan(_1048);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = fma(_2577, _2635, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2667 = _2663;
    int _2669 = as_type<int>(_2609);
    float _2671 = _2607;
    if (_2471)
    {
        bool _2673 = _2539 > 0.5;
        _2523 = _2673;
    }
    bool _2675 = _2523;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2677;
    bool _2681 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2683 = isnan(_1048);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2689 = _2685 || _2687;
    float _2691 = float(_2689);
    float _2693 = _2647 * _2651;
    float _2695 = -_2647;
    float _2697 = _2695 + 1.0;
    float _2699 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2701 = _1048 + _2699;
    float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2705 = _1048 + _2703;
    float _2707 = -_2663;
    float _2709 = _2707 + 1.0;
    float _2711 = _2679 * _2599;
    float _2713 = fma(_2627, _2701, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2715 = fma(_2593, _2705, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2717 = _2691 * _2709;
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2721 = _1048 + _2719;
    bool _2723 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2725 = isnan(_1048);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = -_2691;
    float _2737 = _2735 + 1.0;
    bool _2739 = _1656 != 0.0;
    bool _2741 = isnan(_1656);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan(0.0);
    bool _2747 = _2743 || _2745;
    float _2749 = fma(_2629, _2721, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2751 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2753 = isnan(_1048);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2733 * _2737;
    float _2765 = -_2733;
    float _2767 = _2765 + 1.0;
    bool _2769 = _1654 == 0.0;
    bool _2771 = !_2747;
    bool _2773 = _2769 && _2771;
    float _2775 = in.m_75.x;
    float _2777 = in.m_75.y;
    float _2779 = in.m_75.z;
    float _2781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2783 = -_2761;
    float _2785 = _2783 + 1.0;
    bool _2787 = _1658 == 0.0;
    bool _2789 = _2787 && _2773;
    out.m_77.w = _2493;
    float _2791 = _2663 * _2697;
    if (!_2459)
    {
        _2667 = _2451;
    }
    float _2793 = _2667;
    float _2795 = fma(_2711, _2467, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2797 = _2503 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2799 = exp2(_2473);
    float _2801 = _2573 * _2767;
    bool _2803 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2805 = isnan(_1048);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = _2793;
    if (_2459)
    {
        float _2817 = -_2451;
        float _2819 = _2817 + 1.0;
        _1100 = as_type<int>(_2819);
    }
    int _2821 = _1100;
    float _2823 = -_2573;
    float _2825 = _2823 + 1.0;
    float _2827 = _2781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2829 = _2813 * _2785;
    float _2831 = -_2813;
    float _2833 = _2831 + 1.0;
    int _2835 = _2821;
    if (_2459)
    {
        float _2837 = _2551 ? as_type<float>(_2821) : _2451;
        _2815 = _2837;
    }
    float _2839 = _2815;
    if (_2471)
    {
        float _2841 = -_2451;
        float _2843 = _2841 + 1.0;
        _2835 = as_type<int>(_2843);
    }
    int _2845 = _2835;
    float _2847 = _2609 * _2829;
    float _2849 = _2761 * _2825;
    float _2851 = as_type<float>(_2845);
    if (_2509)
    {
        float _2853 = -_2451;
        float _2855 = _2853 + 1.0;
        _2669 = as_type<int>(_2855);
    }
    int _2857 = _2669;
    float _2859 = _2439 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2861 = _2857;
    float _2863 = _2775;
    int _2865 = as_type<int>(_2777);
    if (_2789)
    {
        _2525 = _2777;
    }
    float _2867 = _2525;
    float _2869 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2847);
    float _2871 = _2867;
    if (!_2471)
    {
        _2527 = _2451;
    }
    float _2873 = _2527;
    float _2875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2877 = _2873;
    if (_2471)
    {
        float _2879 = _2675 ? as_type<float>(_2845) : _2451;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = fma(_2827, _2607, -0.5);
    if (_2509)
    {
        float _2885 = _2445 ? as_type<float>(_2857) : _2451;
        _2529 = _2885;
    }
    float _2887 = _2529;
    float _2889 = fma(_2541, _2859, -0.5);
    if (_2789)
    {
        float _2891 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
        _2861 = as_type<int>(_2891);
    }
    int _2893 = _2861;
    int _2895 = _2893;
    if (_2789)
    {
        _2671 = _2867;
    }
    float _2897 = _2671;
    float _2899 = _2897;
    if (!_2789)
    {
        float _2901 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2775);
        _2863 = _2901;
    }
    float _2903 = _2863;
    float _2905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_2789)
    {
        _2871 = _2777;
    }
    float _2907 = _2871;
    float _2909 = fma(_2631, _2849, _2869);
    if (_2789)
    {
        float _2911 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2779);
        _2865 = as_type<int>(_2911);
    }
    int _2913 = _2865;
    float _2915 = _2839 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2917 = _2913;
    if (!_2789)
    {
        float _2919 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2779);
        _2917 = as_type<int>(_2919);
    }
    int _2921 = _2917;
    if (!_2789)
    {
        float _2923 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2907);
        _2895 = as_type<int>(_2923);
    }
    int _2925 = _2895;
    float _2927 = fma(_2665, _2801, _2909);
    float _2929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2931 = _2875 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2933 = -_1374;
    float _2935 = fma(_1260, _2889, _2933);
    bool _2937 = !_2789;
    float _2939 = _2937 ? as_type<float>(_2925) : _2907;
    float _2941 = fma(_2713, _2763, _2927);
    float _2943 = fma(_2931, _2887, -0.5);
    if (!_2789)
    {
        _2899 = as_type<float>(_2925);
    }
    float _2945 = _2899;
    float _2947 = -_1400;
    float _2949 = fma(_1364, _2883, _2947);
    float _2951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2953 = _2905 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2955 = fma(_1198, _2943, _1370);
    if (_2789)
    {
        _2851 = _2779;
    }
    float _2957 = _2851;
    float _2959 = _2939 * _2939;
    float _2961 = fma(_2953, _2881, -0.5);
    bool _2963 = !_2789;
    float _2965 = _2963 ? as_type<float>(_2921) : _2779;
    float _2967 = -_2799;
    float _2969 = _2967 + 1.0;
    float _2971 = _2915 * _2929;
    float _2973 = _2935 + 0.5;
    float _2975 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2977 = fma(_1296, _2961, _1344);
    float _2979 = _2957;
    if (!_2789)
    {
        _2979 = as_type<float>(_2921);
    }
    float _2981 = _2979;
    float _2983 = fma(_2965, _2965, _2959);
    float _2985 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2975);
    float _2987 = _2977 + 0.5;
    float _2989 = _2797 * _2951;
    float _2991 = _2955 + 0.5;
    float _2993 = _1760 * _2945;
    float _2995 = _2949 + 0.5;
    float _2997 = -_2945;
    float _2999 = _1732 * _2997;
    float _3001 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2985);
    out.m_79.x = _2991;
    out.m_79.y = _2973;
    float _3003 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3005 = fma(_1752, _2903, _2999);
    float _3007 = _2352 * 0.5;
    out.m_81.x = _2971;
    out.m_81.y = _2989;
    out.m_81.z = _2987;
    out.m_81.w = _2995;
    float _3009 = rsqrt(_2983);
    float _3011 = fma(_2715, _2717, _2941);
    float _3013 = fma(_2394, -0.5, _3007);
    float _3015 = fma(_1740, _2981, _3005);
    float _3017 = _2378 + _2352;
    float _3019 = fma(_1772, _2903, _2993);
    float _3021 = _1722 * _2945;
    float _3023 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3001);
    float _3025 = fma(_2749, _2791, _3011);
    float _3027 = _3017 * 0.5;
    float _3029 = _3023 + _2352;
    float _3031 = fma(_2795, _2693, _3025);
    float _3033 = fma(_1764, _2903, _3021);
    float _3035 = fma(_1782, _2981, _3019);
    float _3037 = _3029 * 0.5;
    float _3039 = _2965 * _3009;
    float _3041 = fma(_1770, _2981, _3033);
    float _3043 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3031);
    float _3045 = _2939 * _3009;
    out.m_83.x = _3027;
    out.m_83.y = _3013;
    out.m_83.z = _3037;
    out.m_83.w = _2352;
    bool _3047 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_2124);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = -_3045;
    float _3059 = _1740 * _3057;
    out.m_85.x = _3015;
    out.m_85.y = _3035;
    out.m_85.z = _3041;
    float _3061 = -_3045;
    float _3063 = _1782 * _3061;
    float _3065 = -_1732;
    float _3067 = fma(_3065, _3039, _3059);
    out.m_87.x = _3043;
    float _3069 = fma(_1760, _3039, _3063);
    out.gl_Position.x = _2378;
    out.gl_Position.y = _2394;
    out.gl_Position.z = _3023;
    out.gl_Position.w = _2352;
    float _3071 = -_3045;
    float _3073 = _1770 * _3071;
    float _3075 = fma(_1722, _3039, _3073);
    out.m_89.x = _3067;
    out.m_89.y = _3069;
    out.m_89.z = _3075;
    float _3077 = _3023;
    float _3079 = _3067;
    if (!_3055)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3081 = _2531;
    float _3083 = _3081;
    float _3085 = _3081;
    if (!_3055)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3087 = _3077;
    float _3089 = _3087;
    float _3091 = _3087;
    if (!_3055)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _2533;
    float _3095 = _3093;
    float _3097 = _3093;
    if (!_3055)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3099 = _2535;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3055)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3105 = _3079;
    float _3107 = _3003 * _2416;
    float _3109 = -_3003;
    float _3111 = _3109 + 1.0;
    float _3113 = _2427 * _3107;
    float _3115 = _2437 * _3107;
    float _3117 = _2427 * _3111;
    float _3119 = fma(_2433, _3113, _2421);
    float _3121 = fma(_2435, _3113, _2423);
    float _3123 = fma(_2427, _3115, _2425);
    float _3125 = _2046 * _2102;
    out.m_91.x = _3119;
    out.m_91.y = _3121;
    out.m_91.z = _3123;
    out.m_91.w = _3117;
    float _3127 = _3125 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3129 = _3125;
    float _3131 = _3105;
    float _3133 = _3105;
    if (!_3055)
    {
        _3129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3135 = _3129;
    bool _3137 = !_3055;
    float _3139 = _3135;
    float _3141 = _3135;
    if (!_3137)
    {
        bool _3143 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3145 = isnan(_2124);
        bool _3147 = _3143 || _3145;
        bool _3149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3151 = _3147 || _3149;
        if (!_3151)
        {
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3155 = _2124 + _3153;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3159 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3157;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3165 = 1.0 / _3159;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3183 = _3155 * _3165;
            float _3185 = precise::clamp(_3183, 0.0, 1.0);
            float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3191 = fma(_3185, _3163, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3193 = fma(_3185, _3189, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3195 = fma(_3185, _3169, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3197 = fma(_3185, _3173, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3199 = fma(_3185, _3177, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3201 = fma(_3185, _3181, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3195;
            _3103 = _3199;
            _3133 = _3191;
            _3097 = _3197;
            _3091 = _3193;
            _3141 = _3201;
            _3203 = true;
        }
        else
        {
            bool _3205 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3207 = isnan(_2124);
            bool _3209 = _3205 || _3207;
            bool _3211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3213 = _3209 || _3211;
            if (!_3213)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3215 = _3131;
            _3133 = _3215;
            if (!_3213)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3217 = _3083;
            _3085 = _3217;
            if (!_3213)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3219 = _3089;
            _3091 = _3219;
            if (!_3213)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3221 = _3095;
            _3097 = _3221;
            if (!_3213)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3223 = _3101;
            _3103 = _3223;
            if (!_3213)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3225 = _3139;
            bool _3227 = !_3213;
            _3141 = _3225;
            if (!_3227)
            {
                bool _3229 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3231 = isnan(_2124);
                bool _3233 = _3229 || _3231;
                bool _3235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3237 = _3233 || _3235;
                if (!_3237)
                {
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3241 = _2124 + _3239;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3245 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3243;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3251 = 1.0 / _3245;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3269 = _3241 * _3251;
                    float _3271 = precise::clamp(_3269, 0.0, 1.0);
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3277 = fma(_3271, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3279 = fma(_3271, _3275, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3281 = fma(_3271, _3255, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3283 = fma(_3271, _3259, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3285 = fma(_3271, _3263, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3287 = fma(_3271, _3267, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3281;
                    _3103 = _3285;
                    _3133 = _3277;
                    _3097 = _3283;
                    _3091 = _3279;
                    _3141 = _3287;
                    _3203 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3203 = false;
    float _3289 = _3085;
    float _3291 = _3103;
    float _3293 = _3133;
    float _3295 = _3097;
    float _3297 = _3091;
    float _3299 = _3141;
    float _3301 = fma(_3035, -0.5, 0.5);
    float _3303 = precise::clamp(_3301, 0.0, 1.0);
    float _3305 = -_3289;
    float _3307 = _3305 + _3291;
    float _3309 = _3127 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3311 = -_3293;
    float _3313 = _3311 + _3295;
    out.m_93.x = 0.0;
    float _3315 = fma(_3303, _3307, _3289);
    float _3317 = fma(_3303, _3313, _3293);
    out.m_47.x = _3309;
    float _3319 = -_3297;
    float _3321 = _3319 + _3299;
    float _3323 = _3315 * 0.586610972881317138671875;
    bool _3325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3327 = fma(_3303, _3321, _3297);
    float _3329 = fma(_3317, 0.298911988735198974609375, _3323);
    bool _3331 = _2046 > 0.0;
    bool _3333 = isnan(_2046);
    bool _3335 = _3331 || _3333;
    bool _3337 = isnan(0.0);
    bool _3339 = _3335 || _3337;
    float _3341 = fma(_3327, 0.114477999508380889892578125, _3329);
    bool _3343 = _2102 <= 0.0;
    bool _3345 = !_3339;
    bool _3347 = _3343 || _3345;
    float _3349 = -_3341;
    float _3351 = _3317 + _3349;
    float _3353 = -_3341;
    float _3355 = _3315 + _3353;
    float _3357 = -_3341;
    float _3359 = _3327 + _3357;
    float _3361 = fma(_3351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    float _3363 = fma(_3355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    float _3365 = fma(_3359, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    bool _3367 = !_3325;
    if (!_3367)
    {
        float _3369 = -_1978;
        float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3373 = -_1980;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3377 = -_1982;
        float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3381 = _3371 * _3371;
        float _3383 = fma(_3375, _3375, _3381);
        float _3385 = fma(_3379, _3379, _3383);
        float _3387 = sqrt(_3385);
        float _3389 = rsqrt(_3385);
        float _3391 = -_3387;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3395 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3397 = precise::clamp(_3395, 0.0, 1.0);
        float _3399 = _3375 * _3389;
        float _3401 = _3371 * _3389;
        float _3403 = abs(_3397);
        float _3405 = log2(_3403);
        float _3407 = _3379 * _3389;
        float _3409 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3411 = _3035 * _3401;
        float _3413 = -_3401;
        float _3415 = -_3409;
        float _3417 = fma(_3413, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3415);
        float _3419 = fma(_3015, _3399, _3411);
        float _3421 = -_3407;
        float _3423 = fma(_3421, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3417);
        float _3425 = fma(_3041, _3407, _3419);
        float _3427 = precise::clamp(_3425, 0.0, 1.0);
        float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3431 = _3423 + _3429;
        float _3433 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3437 = precise::clamp(_3435, 0.0, 1.0);
        float _3439 = exp2(_3433);
        float _3441 = _3439 * _3437;
        float _3443 = _3427 * _3441;
        float _3445 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3447 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3449 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3445;
        out.m_93.y = _3447;
        out.m_93.z = _3449;
    }
    out.m_95.x = _3361;
    out.m_95.y = _3363;
    out.m_95.z = _3365;
    if (!_3347)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3451 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3451;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3203 = false;
    bool _1046 = false;
    bool _834 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3509 = as_type<float>(_130);
        out.gl_Position.z = _3509;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_49.w;
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
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3573 = as_type<float>(_164);
        out.gl_Position.z = _3573;
    }
    if (_156)
    {
        return out;
    }
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_55.x;
    float _192 = in.m_55.y;
    float _194 = in.m_55.z;
    float _196 = in.m_57.w;
    float _198 = in.m_49.x;
    float _200 = in.m_49.y;
    float _202 = in.m_49.z;
    float _204 = _166 * _166;
    float _206 = _168 * _168;
    float _208 = _170 * _170;
    float _210 = fma(_174, _174, _204);
    float _212 = fma(_176, _176, _206);
    float _214 = fma(_178, _178, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = 0.0;
    float _234 = _216;
    float _236 = _218;
    float _238 = _220;
    float _240 = _194;
    float _242 = _190;
    if (_228)
    {
        float _244 = rsqrt(_216);
        _232 = _244;
    }
    float _246 = _232;
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_228)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    bool _256 = _226 > 0.0;
    float _258 = in.m_44.x;
    float _260 = in.m_44.y;
    float _262 = in.m_44.z;
    float _264 = 0.0;
    float _266 = _252;
    float _268 = _254;
    if (!_228)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = 0.0;
    float _274 = 0.0;
    float _276 = _270;
    if (!_230)
    {
        _272 = 0.0;
        _274 = 0.0;
    }
    float _278 = _272;
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    float _286 = _278;
    if (_230)
    {
        float _288 = rsqrt(_218);
        _282 = _288;
    }
    float _290 = _282;
    if (!_188)
    {
        float _292 = _172 * _172;
        float _294 = _292 * 0.5;
        _234 = _294;
    }
    float _296 = _234;
    float _298 = 0.0;
    float _300 = _296;
    if (!_230)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = _302;
    if (!_188)
    {
        float _306 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = 0.0;
    float _312 = _308;
    if (_256)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    if (_228)
    {
        float _318 = _246 * _174;
        _276 = _318;
    }
    float _320 = _276;
    if (_228)
    {
        float _322 = _246 * _166;
        _266 = _322;
    }
    float _324 = _266;
    if (_228)
    {
        float _326 = _246 * _190;
        _268 = _326;
    }
    float _328 = _268;
    if (!_256)
    {
        _236 = 0.0;
    }
    float _330 = _236;
    float _332 = _330;
    if (_230)
    {
        float _334 = _290 * _176;
        _284 = _334;
    }
    float _336 = _284;
    if (_230)
    {
        float _338 = _290 * _168;
        _286 = _338;
    }
    float _340 = _286;
    if (_230)
    {
        float _342 = _290 * _192;
        _304 = _342;
    }
    float _344 = _304;
    bool _346 = !_188;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _172 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _172);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _376;
        _238 = _362;
    }
    float _378 = _312;
    float _380 = _238;
    float _382 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _384 = 1.0 / _136;
    float _386 = _380;
    float _388 = _378;
    if (_256)
    {
        float _390 = _316 * _170;
        _332 = _390;
    }
    float _392 = _332;
    float _394 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _396 = _382 * _324;
    float _398 = _382 * _340;
    float _400 = _392;
    if (!_256)
    {
        _386 = 0.0;
    }
    float _402 = _386;
    float _404 = _382 * _392;
    float _406 = fma(_394, _320, _396);
    float _408 = _402;
    if (_256)
    {
        float _410 = _316 * _178;
        _408 = _410;
    }
    float _412 = _408;
    float _414 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _416 = fma(_394, _336, _398);
    if (!_256)
    {
        _400 = 0.0;
    }
    float _418 = _400;
    float _420 = _418;
    if (_256)
    {
        float _422 = _316 * _194;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = fma(_394, _412, _404);
    float _428 = fma(_414, _328, _406);
    float _430 = fma(_414, _344, _416);
    if (!_188)
    {
        _388 = _172;
    }
    float _432 = _388;
    bool _434 = !_188;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = 1.0 / _444;
        float _448 = _172 * _440;
        float _450 = exp2(_448);
        float _452 = -_450;
        float _454 = _452 + 1.0;
        float _456 = _454 * _446;
        _436 = _456;
    }
    float _458 = _436;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _462 = fma(_414, _424, _426);
    float _464 = fma(_458, _198, _428);
    float _466 = fma(_458, _200, _430);
    float _468 = fma(_458, _202, _462);
    float _470 = fma(_464, _196, _258);
    float _472 = fma(_466, _196, _260);
    float _474 = _140 * _384;
    float _476 = fma(_468, _196, _262);
    bool _478 = !_460;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _474;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _518 = 1.0 / _504;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _520;
    float _524 = 1.0 / _508;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _528 = _500 + _526;
    bool _530 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _532 = isnan(_500);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = 1.0 / _516;
    float _544 = _528 * _518;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _548 = _500 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _552 = _500 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _556 = _500 + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _522;
    float _562 = _548 * _524;
    bool _564 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _566 = isnan(_500);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = 1.0 / _512;
    float _578 = _552 * _542;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _580;
    float _584 = fma(_582, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _588 = _500 + _586;
    float _590 = _588 * _560;
    bool _592 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _594 = isnan(_500);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _604;
    float _608 = _556 * _576;
    float _610 = -_574;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = fma(_606, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _624 = _602 * _612;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _630 = fma(_616, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _636 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _638 = isnan(_500);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_540;
    float _650 = _648 + 1.0;
    float _652 = fma(_622, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _654 = fma(_628, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = fma(_634, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _658 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_500);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _646 * _650;
    bool _672 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _674 = isnan(_500);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_646;
    float _686 = _684 + 1.0;
    float _688 = -_602;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _692;
    float _696 = _682 * _686;
    float _698 = -_682;
    float _700 = _698 + 1.0;
    float _702 = _540 * _690;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _708;
    float _712 = _668 * _700;
    float _714 = fma(_694, _608, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _716 = fma(_706, _608, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _718 = fma(_710, _608, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _720 = _630 * _712;
    float _722 = _618 * _712;
    float _724 = -_668;
    float _726 = _724 + 1.0;
    float _728 = _584 * _712;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].x, _720);
    float _744 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].y, _722);
    float _746 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].z, _728);
    float _748 = fma(_732, _578, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _750 = fma(_736, _578, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _752 = fma(_740, _578, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _754 = fma(_652, _696, _742);
    float _756 = fma(_654, _696, _744);
    float _758 = in.m_57.x;
    float _760 = in.m_57.y;
    float _762 = in.m_57.z;
    float _764 = fma(_656, _696, _746);
    float _766 = fma(_716, _670, _754);
    float _768 = fma(_714, _670, _756);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _770;
    float _774 = fma(_718, _670, _764);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _776;
    float _780 = fma(_748, _702, _766);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _782;
    float _786 = fma(_772, _590, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _788 = fma(_778, _590, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _790 = fma(_750, _702, _768);
    float _792 = fma(_784, _590, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _794 = fma(_752, _702, _774);
    float _796 = fma(_786, _624, _780);
    float _798 = fma(_788, _624, _790);
    float _800 = fma(_792, _624, _794);
    float _802 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].x, _796);
    float _804 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].y, _798);
    float _806 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].z, _800);
    float _808 = _802 * _758;
    float _810 = _804 * _760;
    float _812 = _806 * _762;
    bool _814 = !_558;
    float _832;
    if (!_814)
    {
        float _816 = in.m_59.x;
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _820 = _816 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        _832 = _474;
    }
    _834 = false;
    float _836 = _832;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _836 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _854 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _856 = isnan(_836);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = 1.0 / _844;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _874 = isnan(_836);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    bool _884 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _886 = 1.0 / _852;
    float _888 = _848 * _866;
    bool _890 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _892 = isnan(_836);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = 1.0 / _870;
    float _904 = -_864;
    float _906 = _904 + 1.0;
    float _908 = fma(_888, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _914 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _916 = isnan(_836);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_900;
    float _928 = _926 + 1.0;
    float _930 = _900 * _906;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _936 = 1.0 / _912;
    float _938 = -_924;
    float _940 = _938 + 1.0;
    float _942 = _882 * _928;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _944;
    float _948 = _934 * _886;
    float _950 = _864 * _940;
    float _952 = _908 * _942;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _956 = _836 + _954;
    float _958 = -_882;
    float _960 = _958 + 1.0;
    bool _962 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _964 = isnan(_836);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _946 * _902;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _982 = _836 + _980;
    float _984 = fma(_948, _956, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _986 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[115].x, _952);
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _978 * _936;
    float _994 = fma(_974, _982, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _998 = _836 + _996;
    float _1000 = fma(_984, _930, _986);
    float _1002 = _924 * _990;
    float _1004 = fma(_992, _998, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1006 = fma(_994, _950, _1000);
    float _1008 = fma(_1004, _1002, _1006);
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1016 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1008);
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1026 = !_884;
    float _1044;
    if (!_1026)
    {
        float _1028 = in.m_59.x;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1032 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _1036 = _1034 * _1030;
        float _1038 = floor(_1036);
        float _1040 = -_1038;
        float _1042 = _1036 + _1040;
        _1044 = _1042;
        _1046 = true;
    }
    else
    {
        _1044 = _474;
    }
    _1046 = false;
    float _1048 = _1044;
    float _1050 = in.m_59.y;
    float _1052 = _472 * _176;
    float _1054 = _472 * _192;
    float _1056 = in.m_59.z;
    float _1058 = in.m_59.w;
    float _1060 = fma(_470, _174, _1052);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = in.m_55.w;
    float _1068 = fma(_470, _190, _1054);
    float _1070 = fma(_476, _178, _1060);
    float _1072 = in.m_59.x;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1084 = _1082 != 0;
    float _1086 = fma(_476, _194, _1068);
    float _1088 = in.m_53.w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1096 = _1050 * 2.0;
    float _1098 = _1086;
    int _1100 = as_type<int>(_1048);
    if (!_1064)
    {
        _240 = _1050;
    }
    float _1102 = _240;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1106 = _1056 * 2.0;
    float _1108 = floor(_1096);
    float _1110 = _1086 + _1066;
    float _1112 = _1102;
    if (!_1064)
    {
        _1098 = _1056;
    }
    float _1114 = _1098;
    float _1116 = _1114;
    if (_1064)
    {
        _1116 = _1050;
    }
    float _1118 = _1116;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1064)
    {
        _1112 = _1072;
    }
    float _1122 = _1112;
    float _1124 = floor(_1106);
    if (_1064)
    {
        _242 = _1072;
    }
    float _1126 = _242;
    float _1128 = _1070 + _1088;
    float _1130 = _1126;
    if (!_1064)
    {
        _1130 = _1056;
    }
    float _1132 = _1130;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1136 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1090);
    float _1138 = -_1110;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1144 = _1108 >= 0.0;
    bool _1146 = isnan(_1108);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    float _1154 = -_1092;
    float _1156 = fma(_1134, 2.0, _1154);
    bool _1158 = _1108 > 0.0;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1128 + _1160;
    int _1164 = _1152 ? 0 : 1;
    float _1166 = -_1094;
    float _1168 = fma(_1142, 2.0, _1166);
    float _1170 = _1132;
    float _1172 = _1140;
    if (!_1064)
    {
        _1170 = _1056;
    }
    float _1174 = _1170;
    float _1176 = _1072 * 2.0;
    bool _1178 = _1124 > 0.0;
    float _1180 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1120);
    bool _1182 = _1124 >= 0.0;
    bool _1184 = isnan(_1124);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    float _1192 = floor(_1176);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1196 = _1190 ? 0 : 1;
    float _1198 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1180);
    float _1200 = _1174;
    if (_1064)
    {
        _1200 = _1050;
    }
    float _1202 = _1200;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1206 = ~_1196;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1194);
    float _1214 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1204);
    int _1216 = ~_1164;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1224 = log2(_1222);
    int _1226 = _1210;
    int _1228 = _1220;
    if (!_1178)
    {
        int _1230 = ~_1196;
        int _1232 = _1230 + 1;
        _1226 = _1232;
    }
    int _1234 = _1226;
    float _1236 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1158)
    {
        int _1238 = ~_1164;
        int _1240 = _1238 + 1;
        _1228 = _1240;
    }
    int _1242 = _1228;
    float _1244 = _1050 + _1072;
    float _1246 = abs(_1162);
    float _1248 = abs(_1140);
    float _1250 = precise::max(_1246, _1248);
    float _1252 = fma(_1236, -2.0, _1104);
    float _1254 = _1056 + _1072;
    float _1256 = _1244 + (-1.0);
    bool _1258 = _1250 >= 16.0;
    float _1260 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1212);
    bool _1262 = !_1076;
    int _1264 = _1262 ? 0 : 1;
    float _1266 = _1254 + (-1.0);
    float _1268 = _1244;
    if (_1064)
    {
        _1268 = _1050;
    }
    float _1270 = _1268;
    float _1272 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1274 = _1270;
    if (!_1064)
    {
        _1274 = _1072;
    }
    float _1276 = _1274;
    float _1278 = _1224 * _140;
    int _1280 = abs(_1264);
    float _1282 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1286 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1288 = float(_1280);
    float _1290 = exp2(_1278);
    float _1292 = float(_1234);
    float _1294 = fma(_1286, -2.0, _1284);
    float _1296 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1214);
    bool _1298 = _1192 > 0.0;
    float _1300 = _1288 * _1292;
    bool _1302 = _1192 >= 0.0;
    bool _1304 = isnan(_1192);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = in.m_61.x;
    float _1314 = in.m_61.y;
    float _1316 = in.m_61.z;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1320 = 1.0 + _1318;
    bool _1322 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1324 = isnan(1.0);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1330 = _1326 || _1328;
    float _1332 = _1300 * (-2.0);
    bool _1334 = !_1084;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = 1.0 / _1320;
    int _1340 = _1310 ? 0 : 1;
    float _1342 = -_140;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1156);
    bool _1346 = !_1080;
    int _1348 = _1346 ? 0 : 1;
    float _1350 = -_1290;
    float _1352 = _1350 + 1.0;
    bool _1354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1136);
    int _1366 = abs(_1348);
    float _1368 = -_140;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1168);
    int _1372 = abs(_1336);
    float _1374 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1294);
    int _1376 = ~_1340;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    int _1382 = _1380;
    bool _1384 = _1362;
    if (_1258)
    {
        float _1386 = _1140 * 0.0625;
        _1172 = _1386;
    }
    float _1388 = _1172;
    if (!_1298)
    {
        int _1390 = ~_1340;
        int _1392 = _1390 + 1;
        _1382 = _1392;
    }
    int _1394 = _1382;
    float _1396 = _1162 * 0.0625;
    float _1398 = _1362 ? _1352 : 0.0;
    float _1400 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1252);
    float _1402 = float(_1242);
    float _1404 = fma(_1272, _1332, _1272);
    float _1406 = _1258 ? _1396 : _1162;
    if (_1330)
    {
        float _1408 = _1398 * _1338;
        _158 = _1408;
    }
    float _1410 = _158;
    float _1412 = _1072 + (-0.5);
    float _1414 = fma(_1332, _1312, _1312);
    float _1416 = float(_1372);
    float _1418 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1414);
    float _1420 = abs(_1406);
    bool _1422 = _1420 != 0.0;
    bool _1424 = isnan(_1420);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.0);
    bool _1430 = _1426 || _1428;
    float _1432 = _1050 + _1056;
    float _1434 = float(_1366);
    float _1436 = _1416 * _1402;
    float _1438 = float(_1394);
    float _1440 = fma(_1404, _1410, _1418);
    float _1442 = abs(_1388);
    bool _1444 = _1442 == 0.0;
    bool _1446 = !_1430;
    bool _1448 = _1444 && _1446;
    float _1450 = _1436 * (-2.0);
    float _1452 = abs(_1388);
    bool _1454 = _1452 == 0.0;
    float _1456 = _1434 * _1438;
    float _1458 = _1440 * 0.15915493667125701904296875;
    float _1460 = _1432 + (-1.0);
    float _1462 = _1456 * (-2.0);
    float _1464 = _1458 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = fma(_1282, _1450, _1282);
    float _1470 = fma(_1450, _1316, _1316);
    float _1472 = fma(_1462, _1314, _1314);
    float _1474 = _1056 + (-0.5);
    float _1476 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1478 = _1050 + (-0.5);
    int _1480 = as_type<int>(_1474);
    if (_1448)
    {
        bool _1482 = as_type<int>(_1388) >= 0;
        _1384 = _1482;
    }
    bool _1484 = _1384;
    float _1486 = _1458 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1470);
    float _1492 = fma(_1476, _1462, _1476);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1472);
    float _1496 = _1494;
    int _1498 = _1484 ? (-1) : 0;
    if (_1448)
    {
        int _1500 = _1484 ? 0 : 1078530011;
        _1480 = _1500;
    }
    int _1502 = _1480;
    float _1504 = fma(_1468, _1410, _1490);
    float _1506 = fma(_1492, _1410, _1494);
    int _1508 = _1502;
    if (_1448)
    {
        int _1510 = int(0x80000000) & as_type<int>(_1406);
        int _1512 = _1502 | _1510;
        _1496 = as_type<float>(_1512);
    }
    float _1514 = _1496;
    bool _1516 = !_1430;
    bool _1518 = _1516 && _1454;
    float _1520 = _1514;
    float _1522 = _1514;
    if (!_1518)
    {
        float _1524 = abs(_1406);
        bool _1526 = _1524 != as_type<float>(0x7f800000u /* inf */);
        bool _1528 = isnan(_1524);
        bool _1530 = _1526 || _1528;
        bool _1532 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1534 = _1530 || _1532;
        float _1536 = abs(_1388);
        bool _1538 = _1536 == as_type<float>(0x7f800000u /* inf */);
        float _1540 = abs(_1388);
        bool _1542 = _1540 == as_type<float>(0x7f800000u /* inf */);
        bool _1544 = !_1534;
        bool _1546 = _1542 && _1544;
        if (_1546)
        {
            bool _1548 = as_type<int>(_1388) >= 0;
            _1498 = _1548 ? (-1) : 0;
        }
        int _1550 = _1498;
        if (_1546)
        {
            _1508 = 1075235812;
        }
        int _1552 = _1508;
        int _1554 = _1552;
        if (_1546)
        {
            int _1556 = ~_1550;
            int _1558 = (_1556 != 0) ? _1552 : 1061752795;
            _1554 = _1558;
        }
        int _1560 = _1554;
        if (_1546)
        {
            int _1562 = int(0x80000000) & as_type<int>(_1406);
            int _1564 = _1560 | _1562;
            _1520 = as_type<float>(_1564);
        }
        float _1566 = _1520;
        bool _1568 = !_1534;
        bool _1570 = _1568 && _1538;
        _1522 = _1566;
        if (!_1570)
        {
            float _1572 = abs(_1406);
            float _1574 = abs(_1388);
            float _1576 = precise::max(_1572, _1574);
            float _1578 = abs(_1406);
            float _1580 = abs(_1388);
            float _1582 = precise::min(_1578, _1580);
            float _1584 = 1.0 / _1576;
            float _1586 = abs(_1406);
            float _1588 = abs(_1388);
            bool _1590 = _1586 > _1588;
            bool _1592 = as_type<int>(_1388) >= 0;
            float _1594 = _1582 * _1584;
            float _1596 = abs(_1406);
            float _1598 = abs(_1388);
            float _1600 = _1596 + _1598;
            int _1602 = as_type<int>(_1406) & int(0x80000000);
            float _1604 = _1594 * _1594;
            bool _1606 = _1600 > as_type<float>(0x7f800000u /* inf */);
            bool _1608 = isnan(_1600);
            bool _1610 = _1606 || _1608;
            bool _1612 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1614 = _1610 || _1612;
            float _1616 = _1604 + 11.33538818359375;
            float _1618 = fma(_1604, _1616, 28.84246826171875);
            float _1620 = fma(_1604, _1618, 19.6966705322265625);
            float _1622 = fma(_1604, -0.82336294651031494140625, -5.674867153167724609375);
            float _1624 = fma(_1604, _1622, -6.565555095672607421875);
            float _1626 = 1.0 / _1620;
            float _1628 = _1604 * _1624;
            float _1630 = _1594 * _1628;
            float _1632 = fma(_1630, _1626, _1594);
            float _1634 = _1632;
            _1522 = _1600;
            if (_1590)
            {
                float _1636 = -_1632;
                float _1638 = _1636 + 1.57079637050628662109375;
                _1634 = _1638;
            }
            float _1640 = _1634;
            int _1642 = as_type<int>(_1640);
            if (!_1592)
            {
                float _1644 = -_1640;
                float _1646 = _1644 + 3.1415927410125732421875;
                _1642 = as_type<int>(_1646);
            }
            int _1648 = _1642;
            if (!_1614)
            {
                int _1650 = _1602 | _1648;
                _1522 = as_type<float>(_1650);
            }
        }
    }
    float _1652 = _1522;
    float _1654 = in.m_63.x;
    float _1656 = in.m_63.y;
    float _1658 = in.m_63.z;
    float _1660 = -_1652;
    float _1662 = _1506 + _1660;
    float _1664 = _472 * _168;
    float _1666 = _1504 * 0.15915493667125701904296875;
    float _1668 = _1662 * 0.15915493667125701904296875;
    float _1670 = fma(_470, _166, _1664);
    float _1672 = _1666 * 6.283185482025146484375;
    float _1674 = cos(_1672);
    float _1676 = in.m_65.y;
    float _1678 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1680 = fma(_476, _170, _1670);
    float _1682 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1684 = in.m_51.w;
    float _1686 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1688 = _1668 * 6.283185482025146484375;
    float _1690 = sin(_1688);
    bool _1692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1694 = isnan(0.5);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1700 = _1696 || _1698;
    bool _1702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1704 = isnan(0.5);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1710 = _1706 || _1708;
    float _1712 = _1668 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1656);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1658);
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1654);
    float _1722 = _1466 * _1674;
    float _1724 = _1716 * _1678;
    float _1726 = _1718 * _1682;
    float _1728 = _1720 * _1686;
    float _1730 = _1666 * 6.283185482025146484375;
    float _1732 = sin(_1730);
    float _1734 = _1488 * _1690;
    float _1736 = _1466 * _1690;
    float _1738 = _1722 * _1724;
    float _1740 = _1690 * _1674;
    float _1742 = -_1676;
    float _1744 = _1742 + 1.0;
    float _1746 = _1680 + _1684;
    float _1748 = _1466 * _1714;
    float _1750 = _1488 * _1714;
    float _1752 = _1714 * _1674;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1756 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _474);
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1760 = _1488 * _1674;
    float _1762 = -_1734;
    float _1764 = fma(_1732, _1748, _1762);
    float _1766 = -_1724;
    float _1768 = _1732 * _1766;
    float _1770 = fma(_1732, _1736, _1750);
    float _1772 = fma(_1732, _1750, _1736);
    float _1774 = fma(_1764, _1728, _1738);
    float _1776 = fma(_1752, _1728, _1768);
    float _1778 = _1760 * _1724;
    float _1780 = -_1748;
    float _1782 = fma(_1732, _1734, _1780);
    float _1784 = fma(_1770, _1726, _1774);
    float _1786 = fma(_1740, _1726, _1776);
    float _1788 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1758);
    float _1790 = fma(_1772, _1728, _1778);
    float _1792 = _1110 + _1784;
    float _1794 = _1128 + _1786;
    float _1796 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1788);
    float _1798 = fma(_1782, _1726, _1790);
    float _1800 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1802 = _1792 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1806 = _1794 + _1804;
    float _1808 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1810 = _1802 * _1754;
    float _1812 = _1806 * _1754;
    float _1814 = 1.0 / _1808;
    float _1816 = fma(_1810, _1756, _1792);
    float _1818 = fma(_1812, _1756, _1794);
    float _1820 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1822 = _1746 + _1798;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1826 = _1816 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1830 = _1818 + _1828;
    float _1832 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1820);
    float _1834 = _1826 * _1826;
    float _1836 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1832);
    float _1838 = fma(_1830, _1830, _1834);
    float _1840 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1842 = sqrt(_1838);
    float _1844 = _1840 + _1808;
    float _1846 = _1844 * _1814;
    float _1848 = _1846 * 0.5;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1852 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1850);
    float _1854 = 1.0 / _1852;
    bool _1856 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1858 = _1750;
    float _1860 = _1790;
    float _1862 = _1674;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1866 = _1826;
    float _1868 = _1852;
    float _1870 = _1676;
    if (!_1856)
    {
        _1858 = _1818;
    }
    float _1872 = _1858;
    float _1874 = _1872;
    if (!_1856)
    {
        _1860 = _1816;
    }
    float _1876 = _1860;
    float _1878 = _1876;
    if (!_1856)
    {
        _1862 = _1822;
    }
    float _1880 = _1862;
    bool _1882 = !_1856;
    float _1884 = _1880;
    if (!_1882)
    {
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1890 = _1842 + _1888;
        float _1892 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = rsqrt(_1838);
        float _1896 = _1890 * _1886;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = _1898 * 6.283185482025146484375;
        float _1902 = cos(_1900);
        float _1904 = _1898 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        float _1908 = _1902 + (-1.0);
        float _1910 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1912 = fma(_1906, _1892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1914 = fma(_1822, _1902, _1910);
        float _1916 = _1894 * _1912;
        float _1918 = fma(_1830, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1920 = fma(_1826, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1874 = _1918;
        _1884 = _1914;
        _1878 = _1920;
    }
    float _1922 = _1874;
    float _1924 = _1884;
    float _1926 = _1878;
    float _1928 = _1924;
    float _1930 = _1922;
    float _1932 = _1926;
    if (_1710)
    {
        _1864 = 1.0;
    }
    float _1934 = _1864;
    float _1936 = _1934;
    if (!_1700)
    {
        float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1940 = _1746 + _1938;
        float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1944 = -_1128;
        float _1946 = _1944 + _1922;
        float _1948 = -_1746;
        float _1950 = _1948 + _1924;
        float _1952 = _1940 * _1940;
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1956 = _1110 + _1954;
        float _1958 = fma(_1162, _1162, _1952);
        float _1960 = fma(_1956, _1956, _1958);
        float _1962 = sqrt(_1960);
        float _1964 = precise::min(_1962, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1966 = _1964 * _1942;
        float _1968 = -_1110;
        float _1970 = _1968 + _1926;
        float _1972 = fma(_1946, _1966, _1128);
        float _1974 = fma(_1950, _1966, _1746);
        float _1976 = fma(_1970, _1966, _1110);
        _1928 = _1974;
        _1930 = _1972;
        _1932 = _1976;
        _1866 = _1962;
    }
    float _1978 = _1928;
    float _1980 = _1930;
    float _1982 = _1932;
    float _1984 = _1866;
    float _1986 = _1984;
    if (_1710)
    {
        _1868 = 1.0;
    }
    float _1988 = _1868;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1992 = _1854 * _1990;
    float _1994 = _1988;
    if (!_1710)
    {
        float _1996 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2002 = _1998 * 6.283185482025146484375;
        float _2004 = cos(_2002);
        float _2006 = _2000 * 0.15915493667125701904296875;
        float _2008 = _1998 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = 1.0 / _2004;
        float _2014 = _2006 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = _2006 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = 1.0 / _2024;
        float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2030 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2028;
        float _2032 = 1.0 / _2030;
        float _2034 = _2022 * _2026;
        float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2038 = fma(_1992, _2034, _2036);
        float _2040 = _2038 * _2032;
        float _2042 = precise::clamp(_2040, 0.0, 1.0);
        _1986 = _1998;
        _1936 = _2042;
    }
    float _2044 = _1986;
    float _2046 = _1936;
    float _2048 = _2044;
    if (!_1710)
    {
        float _2050 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        float _2060 = _2054 * 0.15915493667125701904296875;
        float _2062 = _2052 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2058;
        float _2068 = _2060 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2060 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2082;
        float _2086 = 1.0 / _2084;
        float _2088 = _2076 * _2080;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2092 = fma(_1992, _2088, _2090);
        float _2094 = _2092 * _2086;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        float _2098 = -_2096;
        float _2100 = _2098 + 1.0;
        _1994 = _2100;
    }
    float _2102 = _1994;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2106 = _1978 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2110 = _1980 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2114 = _1982 + _2112;
    float _2116 = _2106 * _2106;
    float _2118 = fma(_2110, _2110, _2116);
    float _2120 = fma(_2114, _2114, _2118);
    float _2122 = rsqrt(_2120);
    float _2124 = sqrt(_2120);
    float _2126 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2128 = _2110 * _2126;
    float _2130 = _2114 * _2126;
    float _2132 = _2128 * _2128;
    float _2134 = _2130 * _2130;
    float _2136 = _2132 + _2134;
    float _2138 = sqrt(_2136);
    bool _2140 = _2138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2144 = _2138 + _2142;
    float _2146 = _2114;
    float _2148 = _2136;
    float _2150 = _2144;
    float _2152 = _2126;
    if (_2140)
    {
        float _2154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2146 = _2154;
    }
    float _2156 = _2146;
    if (_2140)
    {
        float _2158 = rsqrt(_2136);
        _2148 = _2158;
    }
    float _2160 = _2148;
    if (_2140)
    {
        float _2162 = _2144 * _2156;
        _2150 = _2162;
    }
    float _2164 = _2150;
    if (_2140)
    {
        float _2166 = _2164 * 0.15915493667125701904296875;
        _2048 = _2166;
    }
    float _2168 = _2048;
    float _2170 = _2116;
    float _2172 = _2168;
    if (_2140)
    {
        float _2174 = _2168 * 6.283185482025146484375;
        float _2176 = sin(_2174);
        _2170 = _2176;
    }
    float _2178 = _2170;
    float _2180 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2182 = precise::max(0.0, _2180);
    float _2184 = _2122;
    float _2186 = _2182;
    float _2188 = _2180;
    if (_2140)
    {
        float _2190 = _2168 * 6.283185482025146484375;
        float _2192 = cos(_2190);
        _2184 = _2192;
    }
    float _2194 = _2184;
    float _2196 = -_2126;
    float _2198 = -_2182;
    float _2200 = fma(_2106, _2196, _2198);
    float _2202 = _2200;
    if (!_2140)
    {
        _2186 = _2128;
    }
    float _2204 = _2186;
    float _2206 = _2204;
    if (_2140)
    {
        float _2208 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2188 = _2208;
    }
    float _2210 = _2188;
    float _2212 = _2178;
    float _2214 = _2210;
    if (_2140)
    {
        float _2216 = fma(_2178, _2210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2212 = _2216;
    }
    float _2218 = _2212;
    float _2220 = _2218;
    float _2222 = _2194;
    if (_2140)
    {
        float _2224 = _2194 + (-1.0);
        _2214 = _2224;
    }
    float _2226 = _2214;
    float _2228 = _2226;
    if (_2140)
    {
        float _2230 = _2160 * _2218;
        _2152 = _2230;
    }
    float _2232 = _2152;
    if (!_2140)
    {
        _2220 = _2132;
    }
    float _2234 = _2220;
    float _2236 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2238 = _2234;
    if (_2140)
    {
        float _2240 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2240;
    }
    float _2242 = _2172;
    if (_2140)
    {
        float _2244 = _2128 * _2232;
        _2206 = _2244;
    }
    float _2246 = _2206;
    if (!_2140)
    {
        _2228 = _2130;
    }
    float _2248 = _2228;
    float _2250 = _2248;
    if (_2140)
    {
        float _2252 = _2130 * _2232;
        _2250 = _2252;
    }
    float _2254 = _2250;
    if (_2140)
    {
        float _2256 = fma(_2200, _2194, _2242);
        _2202 = _2256;
    }
    float _2258 = _2202;
    if (_2140)
    {
        float _2260 = _2246 * _2246;
        _2238 = _2260;
    }
    float _2262 = _2238;
    if (!_2140)
    {
        _2222 = _2134;
    }
    float _2264 = _2222;
    float _2266 = _2264;
    if (_2140)
    {
        float _2268 = _2254 * _2254;
        _2266 = _2268;
    }
    float _2270 = _2266;
    float _2272 = fma(_2258, _2258, _2262);
    float _2274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2276 = _2272 + _2270;
    float _2278 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2236);
    float _2280 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2284 = fma(_2124, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2282);
    float _2286 = precise::clamp(_2284, 0.0, 1.0);
    float _2288 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2290 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2278);
    float _2292 = rsqrt(_2276);
    float _2294 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2296 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2280);
    float _2298 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2300 = -_2286;
    float _2302 = _2300 + 1.0;
    float _2304 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2294);
    float _2306 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2296);
    float _2308 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2310 = abs(_2302);
    float _2312 = log2(_2310);
    float _2314 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2304);
    float _2316 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2318 = -_2308;
    float _2320 = fma(_2318, _2274, 1.0);
    float _2322 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2288);
    float _2324 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2326 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2328 = _2292 * _2246;
    float _2330 = _2292 * _2258;
    float _2332 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2322);
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2326);
    float _2336 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2338 = _2292 * _2254;
    float _2340 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2342 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2334);
    float _2344 = -_2336;
    float _2346 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2344);
    float _2348 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2350 = log2(_2320);
    float _2352 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2342);
    float _2354 = -_2338;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2346);
    float _2358 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2360 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2362 = fma(_2356, -0.5, 0.5);
    float _2364 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2358);
    float _2366 = 1.0 / _2352;
    float _2368 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2360);
    float _2370 = fma(_2356, 0.5, 0.5);
    float _2372 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2364);
    float _2374 = _2330 + 1.0;
    float _2376 = fma(_2370, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2378 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2372);
    float _2380 = exp2(_2348);
    float _2382 = _2350 * 0.693147182464599609375;
    float _2384 = fma(_2370, _2376, -0.212114393711090087890625);
    float _2386 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2388 = fma(_2370, _2384, 1.570728778839111328125);
    float _2390 = sqrt(_2362);
    float _2392 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2368);
    float _2394 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2392);
    float _2396 = -_2330;
    float _2398 = fma(_2380, _2374, _2396);
    float _2400 = _2378 * _2366;
    float _2402 = _2394 * _2366;
    float _2404 = fma(_2398, 0.5, 0.5);
    float _2406 = fma(_2400, 0.5, 0.5);
    float _2408 = fma(_2402, -0.5, 0.5);
    float _2410 = _2390 * 0.636619746685028076171875;
    float _2412 = -_2388;
    float _2414 = fma(_2410, _2412, 1.0);
    float3 _7029 = float3(_2406, _2408, _2386);
    float _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7029, float3(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7029, float3(0.0), isnan(_7029)), level(0.0)).x;
    float3 _7040 = float3(_2406, _2408, _2386);
    float4 _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7040, float3(0.0), isnan(_7040)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7040, float3(0.0), isnan(_7040)), level(0.0)).xyzw;
    float _2421 = _2419.x;
    float _2423 = _2419.y;
    float _2425 = _2419.z;
    float _2427 = _2419.w;
    float2 _7057 = float2(_2414, _2404);
    float3 _2431 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7057, float2(0.0), isnan(_7057)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7057, float2(0.0), isnan(_7057)), level(0.0)).xyz;
    float _2433 = _2431.x;
    float _2435 = _2431.y;
    float _2437 = _2431.z;
    out.m_67.x = _1018;
    out.m_67.y = _1020;
    out.m_67.z = _1022;
    out.m_67.w = _1024;
    float _2439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2445 = _1050 > 0.5;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2451 = in.m_65.x;
    bool _2453 = _1056 > 0.5;
    float _2455 = 1.0 / _2443;
    int _2457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2459 = _2457 != 0;
    float _2461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2465 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2467 = _1048 + _2465;
    int _2469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2471 = _2469 != 0;
    float _2473 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2475 = 1.0 / _2449;
    int _2477 = _2453 ? as_type<int>(_1744) : as_type<int>(_1676);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2485 = _2483 != 0;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2491 = _2445 ? as_type<int>(_1744) : as_type<int>(_1676);
    float _2493 = in.m_69.w;
    bool _2495 = _1058 > 0.5;
    float _2497 = 1.0 / _2463;
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2501 = _2499 != 0;
    out.m_71.x = _1752;
    out.m_71.y = _1772;
    out.m_71.z = _1764;
    out.m_73.x = _1980;
    out.m_73.y = _1978;
    out.m_73.z = _1982;
    float _2503 = _2485 ? as_type<float>(_2491) : _1676;
    float _2505 = 1.0 / _2489;
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2509 = _2507 != 0;
    float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2517 = _2515 != 0;
    float _2519 = as_type<float>(_2491);
    bool _2521 = _2501;
    bool _2523 = _2495;
    float _2525 = _2467;
    float _2527 = _2439;
    float _2529 = _2451;
    float _2531 = _2352;
    float _2533 = _2394;
    float _2535 = _2378;
    if (_2471)
    {
        float _2537 = in.m_59.z;
        _2519 = _2537;
    }
    float _2539 = _2519;
    float _2541 = _2501 ? as_type<float>(_2477) : _1676;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2543;
    float _2547 = 1.0 / _2481;
    if (_2459)
    {
        bool _2549 = _1072 > 0.5;
        _2521 = _2549;
    }
    bool _2551 = _2521;
    float _2553 = _2545 * _2455;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2555;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2561 = _2559 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2563 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2565 = isnan(_1048);
    bool _2567 = _2563 || _2565;
    bool _2569 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2571 = _2567 || _2569;
    float _2573 = float(_2571);
    float _2575 = 1.0 / _2513;
    float _2577 = _2557 * _2475;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2579;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2589 = _2587 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2591 = _2561 * _2505;
    float _2593 = _2581 * _2497;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2597 = _1048 + _2595;
    float _2599 = 1.0 / _2589;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2517)
    {
        float _2605 = _2495 ? _1744 : _1676;
        _1870 = _2605;
    }
    float _2607 = _1870;
    float _2609 = fma(_2553, _2597, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2613 = _1048 + _2611;
    bool _2615 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2617 = isnan(_1048);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = _2603 * _2547;
    float _2629 = _2585 * _2575;
    float _2631 = fma(_2591, _2613, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2635 = _1048 + _2633;
    bool _2637 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2639 = isnan(_1048);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2645 = _2641 || _2643;
    float _2647 = float(_2645);
    float _2649 = -_2625;
    float _2651 = _2649 + 1.0;
    bool _2653 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2655 = isnan(_1048);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = fma(_2577, _2635, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2667 = _2663;
    int _2669 = as_type<int>(_2609);
    float _2671 = _2607;
    if (_2471)
    {
        bool _2673 = _2539 > 0.5;
        _2523 = _2673;
    }
    bool _2675 = _2523;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2677;
    bool _2681 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2683 = isnan(_1048);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2689 = _2685 || _2687;
    float _2691 = float(_2689);
    float _2693 = _2647 * _2651;
    float _2695 = -_2647;
    float _2697 = _2695 + 1.0;
    float _2699 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2701 = _1048 + _2699;
    float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2705 = _1048 + _2703;
    float _2707 = -_2663;
    float _2709 = _2707 + 1.0;
    float _2711 = _2679 * _2599;
    float _2713 = fma(_2627, _2701, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2715 = fma(_2593, _2705, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2717 = _2691 * _2709;
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2721 = _1048 + _2719;
    bool _2723 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2725 = isnan(_1048);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = -_2691;
    float _2737 = _2735 + 1.0;
    bool _2739 = _1656 != 0.0;
    bool _2741 = isnan(_1656);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan(0.0);
    bool _2747 = _2743 || _2745;
    float _2749 = fma(_2629, _2721, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2751 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2753 = isnan(_1048);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2733 * _2737;
    float _2765 = -_2733;
    float _2767 = _2765 + 1.0;
    bool _2769 = _1654 == 0.0;
    bool _2771 = !_2747;
    bool _2773 = _2769 && _2771;
    float _2775 = in.m_75.x;
    float _2777 = in.m_75.y;
    float _2779 = in.m_75.z;
    float _2781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2783 = -_2761;
    float _2785 = _2783 + 1.0;
    bool _2787 = _1658 == 0.0;
    bool _2789 = _2787 && _2773;
    out.m_77.w = _2493;
    float _2791 = _2663 * _2697;
    if (!_2459)
    {
        _2667 = _2451;
    }
    float _2793 = _2667;
    float _2795 = fma(_2711, _2467, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2797 = _2503 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2799 = exp2(_2473);
    float _2801 = _2573 * _2767;
    bool _2803 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2805 = isnan(_1048);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = _2793;
    if (_2459)
    {
        float _2817 = -_2451;
        float _2819 = _2817 + 1.0;
        _1100 = as_type<int>(_2819);
    }
    int _2821 = _1100;
    float _2823 = -_2573;
    float _2825 = _2823 + 1.0;
    float _2827 = _2781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2829 = _2813 * _2785;
    float _2831 = -_2813;
    float _2833 = _2831 + 1.0;
    int _2835 = _2821;
    if (_2459)
    {
        float _2837 = _2551 ? as_type<float>(_2821) : _2451;
        _2815 = _2837;
    }
    float _2839 = _2815;
    if (_2471)
    {
        float _2841 = -_2451;
        float _2843 = _2841 + 1.0;
        _2835 = as_type<int>(_2843);
    }
    int _2845 = _2835;
    float _2847 = _2609 * _2829;
    float _2849 = _2761 * _2825;
    float _2851 = as_type<float>(_2845);
    if (_2509)
    {
        float _2853 = -_2451;
        float _2855 = _2853 + 1.0;
        _2669 = as_type<int>(_2855);
    }
    int _2857 = _2669;
    float _2859 = _2439 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2861 = _2857;
    float _2863 = _2775;
    int _2865 = as_type<int>(_2777);
    if (_2789)
    {
        _2525 = _2777;
    }
    float _2867 = _2525;
    float _2869 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2847);
    float _2871 = _2867;
    if (!_2471)
    {
        _2527 = _2451;
    }
    float _2873 = _2527;
    float _2875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2877 = _2873;
    if (_2471)
    {
        float _2879 = _2675 ? as_type<float>(_2845) : _2451;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = fma(_2827, _2607, -0.5);
    if (_2509)
    {
        float _2885 = _2445 ? as_type<float>(_2857) : _2451;
        _2529 = _2885;
    }
    float _2887 = _2529;
    float _2889 = fma(_2541, _2859, -0.5);
    if (_2789)
    {
        float _2891 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
        _2861 = as_type<int>(_2891);
    }
    int _2893 = _2861;
    int _2895 = _2893;
    if (_2789)
    {
        _2671 = _2867;
    }
    float _2897 = _2671;
    float _2899 = _2897;
    if (!_2789)
    {
        float _2901 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2775);
        _2863 = _2901;
    }
    float _2903 = _2863;
    float _2905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_2789)
    {
        _2871 = _2777;
    }
    float _2907 = _2871;
    float _2909 = fma(_2631, _2849, _2869);
    if (_2789)
    {
        float _2911 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2779);
        _2865 = as_type<int>(_2911);
    }
    int _2913 = _2865;
    float _2915 = _2839 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2917 = _2913;
    if (!_2789)
    {
        float _2919 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2779);
        _2917 = as_type<int>(_2919);
    }
    int _2921 = _2917;
    if (!_2789)
    {
        float _2923 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2907);
        _2895 = as_type<int>(_2923);
    }
    int _2925 = _2895;
    float _2927 = fma(_2665, _2801, _2909);
    float _2929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2931 = _2875 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2933 = -_1374;
    float _2935 = fma(_1260, _2889, _2933);
    bool _2937 = !_2789;
    float _2939 = _2937 ? as_type<float>(_2925) : _2907;
    float _2941 = fma(_2713, _2763, _2927);
    float _2943 = fma(_2931, _2887, -0.5);
    if (!_2789)
    {
        _2899 = as_type<float>(_2925);
    }
    float _2945 = _2899;
    float _2947 = -_1400;
    float _2949 = fma(_1364, _2883, _2947);
    float _2951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2953 = _2905 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2955 = fma(_1198, _2943, _1370);
    if (_2789)
    {
        _2851 = _2779;
    }
    float _2957 = _2851;
    float _2959 = _2939 * _2939;
    float _2961 = fma(_2953, _2881, -0.5);
    bool _2963 = !_2789;
    float _2965 = _2963 ? as_type<float>(_2921) : _2779;
    float _2967 = -_2799;
    float _2969 = _2967 + 1.0;
    float _2971 = _2915 * _2929;
    float _2973 = _2935 + 0.5;
    float _2975 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2977 = fma(_1296, _2961, _1344);
    float _2979 = _2957;
    if (!_2789)
    {
        _2979 = as_type<float>(_2921);
    }
    float _2981 = _2979;
    float _2983 = fma(_2965, _2965, _2959);
    float _2985 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2975);
    float _2987 = _2977 + 0.5;
    float _2989 = _2797 * _2951;
    float _2991 = _2955 + 0.5;
    float _2993 = _1760 * _2945;
    float _2995 = _2949 + 0.5;
    float _2997 = -_2945;
    float _2999 = _1732 * _2997;
    float _3001 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2985);
    out.m_79.x = _2991;
    out.m_79.y = _2973;
    float _3003 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3005 = fma(_1752, _2903, _2999);
    float _3007 = _2352 * 0.5;
    out.m_81.x = _2971;
    out.m_81.y = _2989;
    out.m_81.z = _2987;
    out.m_81.w = _2995;
    float _3009 = rsqrt(_2983);
    float _3011 = fma(_2715, _2717, _2941);
    float _3013 = fma(_2394, -0.5, _3007);
    float _3015 = fma(_1740, _2981, _3005);
    float _3017 = _2378 + _2352;
    float _3019 = fma(_1772, _2903, _2993);
    float _3021 = _1722 * _2945;
    float _3023 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3001);
    float _3025 = fma(_2749, _2791, _3011);
    float _3027 = _3017 * 0.5;
    float _3029 = _3023 + _2352;
    float _3031 = fma(_2795, _2693, _3025);
    float _3033 = fma(_1764, _2903, _3021);
    float _3035 = fma(_1782, _2981, _3019);
    float _3037 = _3029 * 0.5;
    float _3039 = _2965 * _3009;
    float _3041 = fma(_1770, _2981, _3033);
    float _3043 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3031);
    float _3045 = _2939 * _3009;
    out.m_83.x = _3027;
    out.m_83.y = _3013;
    out.m_83.z = _3037;
    out.m_83.w = _2352;
    bool _3047 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_2124);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = -_3045;
    float _3059 = _1740 * _3057;
    out.m_85.x = _3015;
    out.m_85.y = _3035;
    out.m_85.z = _3041;
    float _3061 = -_3045;
    float _3063 = _1782 * _3061;
    float _3065 = -_1732;
    float _3067 = fma(_3065, _3039, _3059);
    out.m_87.x = _3043;
    float _3069 = fma(_1760, _3039, _3063);
    out.gl_Position.x = _2378;
    out.gl_Position.y = _2394;
    out.gl_Position.z = _3023;
    out.gl_Position.w = _2352;
    float _3071 = -_3045;
    float _3073 = _1770 * _3071;
    float _3075 = fma(_1722, _3039, _3073);
    out.m_89.x = _3067;
    out.m_89.y = _3069;
    out.m_89.z = _3075;
    float _3077 = _3023;
    float _3079 = _3067;
    if (!_3055)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3081 = _2531;
    float _3083 = _3081;
    float _3085 = _3081;
    if (!_3055)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3087 = _3077;
    float _3089 = _3087;
    float _3091 = _3087;
    if (!_3055)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _2533;
    float _3095 = _3093;
    float _3097 = _3093;
    if (!_3055)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3099 = _2535;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3055)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3105 = _3079;
    float _3107 = _3003 * _2416;
    float _3109 = -_3003;
    float _3111 = _3109 + 1.0;
    float _3113 = _2427 * _3107;
    float _3115 = _2437 * _3107;
    float _3117 = _2427 * _3111;
    float _3119 = fma(_2433, _3113, _2421);
    float _3121 = fma(_2435, _3113, _2423);
    float _3123 = fma(_2427, _3115, _2425);
    float _3125 = _2046 * _2102;
    out.m_91.x = _3119;
    out.m_91.y = _3121;
    out.m_91.z = _3123;
    out.m_91.w = _3117;
    float _3127 = _3125 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3129 = _3125;
    float _3131 = _3105;
    float _3133 = _3105;
    if (!_3055)
    {
        _3129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3135 = _3129;
    bool _3137 = !_3055;
    float _3139 = _3135;
    float _3141 = _3135;
    if (!_3137)
    {
        bool _3143 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3145 = isnan(_2124);
        bool _3147 = _3143 || _3145;
        bool _3149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3151 = _3147 || _3149;
        if (!_3151)
        {
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3155 = _2124 + _3153;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3159 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3157;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3165 = 1.0 / _3159;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3183 = _3155 * _3165;
            float _3185 = precise::clamp(_3183, 0.0, 1.0);
            float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3191 = fma(_3185, _3163, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3193 = fma(_3185, _3189, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3195 = fma(_3185, _3169, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3197 = fma(_3185, _3173, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3199 = fma(_3185, _3177, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3201 = fma(_3185, _3181, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3195;
            _3103 = _3199;
            _3133 = _3191;
            _3097 = _3197;
            _3091 = _3193;
            _3141 = _3201;
            _3203 = true;
        }
        else
        {
            bool _3205 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3207 = isnan(_2124);
            bool _3209 = _3205 || _3207;
            bool _3211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3213 = _3209 || _3211;
            if (!_3213)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3215 = _3131;
            _3133 = _3215;
            if (!_3213)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3217 = _3083;
            _3085 = _3217;
            if (!_3213)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3219 = _3089;
            _3091 = _3219;
            if (!_3213)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3221 = _3095;
            _3097 = _3221;
            if (!_3213)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3223 = _3101;
            _3103 = _3223;
            if (!_3213)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3225 = _3139;
            bool _3227 = !_3213;
            _3141 = _3225;
            if (!_3227)
            {
                bool _3229 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3231 = isnan(_2124);
                bool _3233 = _3229 || _3231;
                bool _3235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3237 = _3233 || _3235;
                if (!_3237)
                {
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3241 = _2124 + _3239;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3245 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3243;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3251 = 1.0 / _3245;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3269 = _3241 * _3251;
                    float _3271 = precise::clamp(_3269, 0.0, 1.0);
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3277 = fma(_3271, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3279 = fma(_3271, _3275, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3281 = fma(_3271, _3255, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3283 = fma(_3271, _3259, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3285 = fma(_3271, _3263, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3287 = fma(_3271, _3267, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3281;
                    _3103 = _3285;
                    _3133 = _3277;
                    _3097 = _3283;
                    _3091 = _3279;
                    _3141 = _3287;
                    _3203 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3203 = false;
    float _3289 = _3085;
    float _3291 = _3103;
    float _3293 = _3133;
    float _3295 = _3097;
    float _3297 = _3091;
    float _3299 = _3141;
    float _3301 = fma(_3035, -0.5, 0.5);
    float _3303 = precise::clamp(_3301, 0.0, 1.0);
    float _3305 = -_3289;
    float _3307 = _3305 + _3291;
    float _3309 = _3127 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3311 = -_3293;
    float _3313 = _3311 + _3295;
    out.m_93.x = 0.0;
    float _3315 = fma(_3303, _3307, _3289);
    float _3317 = fma(_3303, _3313, _3293);
    out.m_47.x = _3309;
    float _3319 = -_3297;
    float _3321 = _3319 + _3299;
    float _3323 = _3315 * 0.586610972881317138671875;
    bool _3325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3327 = fma(_3303, _3321, _3297);
    float _3329 = fma(_3317, 0.298911988735198974609375, _3323);
    bool _3331 = _2046 > 0.0;
    bool _3333 = isnan(_2046);
    bool _3335 = _3331 || _3333;
    bool _3337 = isnan(0.0);
    bool _3339 = _3335 || _3337;
    float _3341 = fma(_3327, 0.114477999508380889892578125, _3329);
    bool _3343 = _2102 <= 0.0;
    bool _3345 = !_3339;
    bool _3347 = _3343 || _3345;
    float _3349 = -_3341;
    float _3351 = _3317 + _3349;
    float _3353 = -_3341;
    float _3355 = _3315 + _3353;
    float _3357 = -_3341;
    float _3359 = _3327 + _3357;
    float _3361 = fma(_3351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    float _3363 = fma(_3355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    float _3365 = fma(_3359, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    bool _3367 = !_3325;
    if (!_3367)
    {
        float _3369 = -_1978;
        float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3373 = -_1980;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3377 = -_1982;
        float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3381 = _3371 * _3371;
        float _3383 = fma(_3375, _3375, _3381);
        float _3385 = fma(_3379, _3379, _3383);
        float _3387 = sqrt(_3385);
        float _3389 = rsqrt(_3385);
        float _3391 = -_3387;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3395 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3397 = precise::clamp(_3395, 0.0, 1.0);
        float _3399 = _3375 * _3389;
        float _3401 = _3371 * _3389;
        float _3403 = abs(_3397);
        float _3405 = log2(_3403);
        float _3407 = _3379 * _3389;
        float _3409 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3411 = _3035 * _3401;
        float _3413 = -_3401;
        float _3415 = -_3409;
        float _3417 = fma(_3413, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3415);
        float _3419 = fma(_3015, _3399, _3411);
        float _3421 = -_3407;
        float _3423 = fma(_3421, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3417);
        float _3425 = fma(_3041, _3407, _3419);
        float _3427 = precise::clamp(_3425, 0.0, 1.0);
        float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3431 = _3423 + _3429;
        float _3433 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3437 = precise::clamp(_3435, 0.0, 1.0);
        float _3439 = exp2(_3433);
        float _3441 = _3439 * _3437;
        float _3443 = _3427 * _3441;
        float _3445 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3447 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3449 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3445;
        out.m_93.y = _3447;
        out.m_93.z = _3449;
    }
    out.m_95.x = _3361;
    out.m_95.y = _3363;
    out.m_95.z = _3365;
    if (!_3347)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3451 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3451;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3203 = false;
    bool _1046 = false;
    bool _834 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3509 = as_type<float>(_130);
        out.gl_Position.z = _3509;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_49.w;
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
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3573 = as_type<float>(_164);
        out.gl_Position.z = _3573;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_55.x;
    float _192 = in.m_55.y;
    float _194 = in.m_55.z;
    float _196 = in.m_57.w;
    float _198 = in.m_49.x;
    float _200 = in.m_49.y;
    float _202 = in.m_49.z;
    float _204 = _166 * _166;
    float _206 = _168 * _168;
    float _208 = _170 * _170;
    float _210 = fma(_174, _174, _204);
    float _212 = fma(_176, _176, _206);
    float _214 = fma(_178, _178, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = 0.0;
    float _234 = _216;
    float _236 = _218;
    float _238 = _220;
    float _240 = _194;
    float _242 = _190;
    if (_228)
    {
        float _244 = rsqrt(_216);
        _232 = _244;
    }
    float _246 = _232;
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_228)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    bool _256 = _226 > 0.0;
    float _258 = in.m_44.x;
    float _260 = in.m_44.y;
    float _262 = in.m_44.z;
    float _264 = 0.0;
    float _266 = _252;
    float _268 = _254;
    if (!_228)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = 0.0;
    float _274 = 0.0;
    float _276 = _270;
    if (!_230)
    {
        _272 = 0.0;
        _274 = 0.0;
    }
    float _278 = _272;
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    float _286 = _278;
    if (_230)
    {
        float _288 = rsqrt(_218);
        _282 = _288;
    }
    float _290 = _282;
    if (!_188)
    {
        float _292 = _172 * _172;
        float _294 = _292 * 0.5;
        _234 = _294;
    }
    float _296 = _234;
    float _298 = 0.0;
    float _300 = _296;
    if (!_230)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = _302;
    if (!_188)
    {
        float _306 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = 0.0;
    float _312 = _308;
    if (_256)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    if (_228)
    {
        float _318 = _246 * _174;
        _276 = _318;
    }
    float _320 = _276;
    if (_228)
    {
        float _322 = _246 * _166;
        _266 = _322;
    }
    float _324 = _266;
    if (_228)
    {
        float _326 = _246 * _190;
        _268 = _326;
    }
    float _328 = _268;
    if (!_256)
    {
        _236 = 0.0;
    }
    float _330 = _236;
    float _332 = _330;
    if (_230)
    {
        float _334 = _290 * _176;
        _284 = _334;
    }
    float _336 = _284;
    if (_230)
    {
        float _338 = _290 * _168;
        _286 = _338;
    }
    float _340 = _286;
    if (_230)
    {
        float _342 = _290 * _192;
        _304 = _342;
    }
    float _344 = _304;
    bool _346 = !_188;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _172 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _172);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _376;
        _238 = _362;
    }
    float _378 = _312;
    float _380 = _238;
    float _382 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _384 = 1.0 / _136;
    float _386 = _380;
    float _388 = _378;
    if (_256)
    {
        float _390 = _316 * _170;
        _332 = _390;
    }
    float _392 = _332;
    float _394 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _396 = _382 * _324;
    float _398 = _382 * _340;
    float _400 = _392;
    if (!_256)
    {
        _386 = 0.0;
    }
    float _402 = _386;
    float _404 = _382 * _392;
    float _406 = fma(_394, _320, _396);
    float _408 = _402;
    if (_256)
    {
        float _410 = _316 * _178;
        _408 = _410;
    }
    float _412 = _408;
    float _414 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _416 = fma(_394, _336, _398);
    if (!_256)
    {
        _400 = 0.0;
    }
    float _418 = _400;
    float _420 = _418;
    if (_256)
    {
        float _422 = _316 * _194;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = fma(_394, _412, _404);
    float _428 = fma(_414, _328, _406);
    float _430 = fma(_414, _344, _416);
    if (!_188)
    {
        _388 = _172;
    }
    float _432 = _388;
    bool _434 = !_188;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = 1.0 / _444;
        float _448 = _172 * _440;
        float _450 = exp2(_448);
        float _452 = -_450;
        float _454 = _452 + 1.0;
        float _456 = _454 * _446;
        _436 = _456;
    }
    float _458 = _436;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _462 = fma(_414, _424, _426);
    float _464 = fma(_458, _198, _428);
    float _466 = fma(_458, _200, _430);
    float _468 = fma(_458, _202, _462);
    float _470 = fma(_464, _196, _258);
    float _472 = fma(_466, _196, _260);
    float _474 = _140 * _384;
    float _476 = fma(_468, _196, _262);
    bool _478 = !_460;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _474;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _518 = 1.0 / _504;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _520;
    float _524 = 1.0 / _508;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _528 = _500 + _526;
    bool _530 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _532 = isnan(_500);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = 1.0 / _516;
    float _544 = _528 * _518;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _548 = _500 + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _552 = _500 + _550;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _556 = _500 + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _522;
    float _562 = _548 * _524;
    bool _564 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _566 = isnan(_500);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = 1.0 / _512;
    float _578 = _552 * _542;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _580;
    float _584 = fma(_582, _544, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _588 = _500 + _586;
    float _590 = _588 * _560;
    bool _592 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _594 = isnan(_500);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _604;
    float _608 = _556 * _576;
    float _610 = -_574;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = fma(_606, _544, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _624 = _602 * _612;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _630 = fma(_616, _544, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _636 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _638 = isnan(_500);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -_540;
    float _650 = _648 + 1.0;
    float _652 = fma(_622, _562, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _654 = fma(_628, _562, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _656 = fma(_634, _562, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _658 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _660 = isnan(_500);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _646 * _650;
    bool _672 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _674 = isnan(_500);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -_646;
    float _686 = _684 + 1.0;
    float _688 = -_602;
    float _690 = _688 + 1.0;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _692;
    float _696 = _682 * _686;
    float _698 = -_682;
    float _700 = _698 + 1.0;
    float _702 = _540 * _690;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _704;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _708;
    float _712 = _668 * _700;
    float _714 = fma(_694, _608, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _716 = fma(_706, _608, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _718 = fma(_710, _608, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _720 = _630 * _712;
    float _722 = _618 * _712;
    float _724 = -_668;
    float _726 = _724 + 1.0;
    float _728 = _584 * _712;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].x, _720);
    float _744 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].y, _722);
    float _746 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[143].z, _728);
    float _748 = fma(_732, _578, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _750 = fma(_736, _578, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _752 = fma(_740, _578, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _754 = fma(_652, _696, _742);
    float _756 = fma(_654, _696, _744);
    float _758 = in.m_57.x;
    float _760 = in.m_57.y;
    float _762 = in.m_57.z;
    float _764 = fma(_656, _696, _746);
    float _766 = fma(_716, _670, _754);
    float _768 = fma(_714, _670, _756);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _770;
    float _774 = fma(_718, _670, _764);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _776;
    float _780 = fma(_748, _702, _766);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _782;
    float _786 = fma(_772, _590, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _788 = fma(_778, _590, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _790 = fma(_750, _702, _768);
    float _792 = fma(_784, _590, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _794 = fma(_752, _702, _774);
    float _796 = fma(_786, _624, _780);
    float _798 = fma(_788, _624, _790);
    float _800 = fma(_792, _624, _794);
    float _802 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].x, _796);
    float _804 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].y, _798);
    float _806 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[148].z, _800);
    float _808 = _802 * _758;
    float _810 = _804 * _760;
    float _812 = _806 * _762;
    bool _814 = !_558;
    float _832;
    if (!_814)
    {
        float _816 = in.m_59.x;
        float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _820 = _816 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _824 = _822 * _818;
        float _826 = floor(_824);
        float _828 = -_826;
        float _830 = _824 + _828;
        _832 = _830;
        _834 = true;
    }
    else
    {
        _832 = _474;
    }
    _834 = false;
    float _836 = _832;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _836 + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _854 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _856 = isnan(_836);
    bool _858 = _854 || _856;
    bool _860 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _862 = _858 || _860;
    float _864 = float(_862);
    float _866 = 1.0 / _844;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _872 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _874 = isnan(_836);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    bool _884 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _886 = 1.0 / _852;
    float _888 = _848 * _866;
    bool _890 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _892 = isnan(_836);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = 1.0 / _870;
    float _904 = -_864;
    float _906 = _904 + 1.0;
    float _908 = fma(_888, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _914 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _916 = isnan(_836);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -_900;
    float _928 = _926 + 1.0;
    float _930 = _900 * _906;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _936 = 1.0 / _912;
    float _938 = -_924;
    float _940 = _938 + 1.0;
    float _942 = _882 * _928;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _944;
    float _948 = _934 * _886;
    float _950 = _864 * _940;
    float _952 = _908 * _942;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _956 = _836 + _954;
    float _958 = -_882;
    float _960 = _958 + 1.0;
    bool _962 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _964 = isnan(_836);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _946 * _902;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _982 = _836 + _980;
    float _984 = fma(_948, _956, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _986 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[115].x, _952);
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _978 * _936;
    float _994 = fma(_974, _982, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _998 = _836 + _996;
    float _1000 = fma(_984, _930, _986);
    float _1002 = _924 * _990;
    float _1004 = fma(_992, _998, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1006 = fma(_994, _950, _1000);
    float _1008 = fma(_1004, _1002, _1006);
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1016 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1008);
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1026 = !_884;
    float _1044;
    if (!_1026)
    {
        float _1028 = in.m_59.x;
        float _1030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1032 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _1036 = _1034 * _1030;
        float _1038 = floor(_1036);
        float _1040 = -_1038;
        float _1042 = _1036 + _1040;
        _1044 = _1042;
        _1046 = true;
    }
    else
    {
        _1044 = _474;
    }
    _1046 = false;
    float _1048 = _1044;
    float _1050 = in.m_59.y;
    float _1052 = _472 * _176;
    float _1054 = _472 * _192;
    float _1056 = in.m_59.z;
    float _1058 = in.m_59.w;
    float _1060 = fma(_470, _174, _1052);
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1064 = _1062 != 0;
    float _1066 = in.m_55.w;
    float _1068 = fma(_470, _190, _1054);
    float _1070 = fma(_476, _178, _1060);
    float _1072 = in.m_59.x;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1076 = _1074 != 0;
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1080 = _1078 != 0;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1084 = _1082 != 0;
    float _1086 = fma(_476, _194, _1068);
    float _1088 = in.m_53.w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1096 = _1050 * 2.0;
    float _1098 = _1086;
    int _1100 = as_type<int>(_1048);
    if (!_1064)
    {
        _240 = _1050;
    }
    float _1102 = _240;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1106 = _1056 * 2.0;
    float _1108 = floor(_1096);
    float _1110 = _1086 + _1066;
    float _1112 = _1102;
    if (!_1064)
    {
        _1098 = _1056;
    }
    float _1114 = _1098;
    float _1116 = _1114;
    if (_1064)
    {
        _1116 = _1050;
    }
    float _1118 = _1116;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1064)
    {
        _1112 = _1072;
    }
    float _1122 = _1112;
    float _1124 = floor(_1106);
    if (_1064)
    {
        _242 = _1072;
    }
    float _1126 = _242;
    float _1128 = _1070 + _1088;
    float _1130 = _1126;
    if (!_1064)
    {
        _1130 = _1056;
    }
    float _1132 = _1130;
    float _1134 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1136 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1090);
    float _1138 = -_1110;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1142 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1144 = _1108 >= 0.0;
    bool _1146 = isnan(_1108);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    float _1154 = -_1092;
    float _1156 = fma(_1134, 2.0, _1154);
    bool _1158 = _1108 > 0.0;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1162 = _1128 + _1160;
    int _1164 = _1152 ? 0 : 1;
    float _1166 = -_1094;
    float _1168 = fma(_1142, 2.0, _1166);
    float _1170 = _1132;
    float _1172 = _1140;
    if (!_1064)
    {
        _1170 = _1056;
    }
    float _1174 = _1170;
    float _1176 = _1072 * 2.0;
    bool _1178 = _1124 > 0.0;
    float _1180 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1120);
    bool _1182 = _1124 >= 0.0;
    bool _1184 = isnan(_1124);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(0.0);
    bool _1190 = _1186 || _1188;
    float _1192 = floor(_1176);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1196 = _1190 ? 0 : 1;
    float _1198 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1180);
    float _1200 = _1174;
    if (_1064)
    {
        _1200 = _1050;
    }
    float _1202 = _1200;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1206 = ~_1196;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1194);
    float _1214 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1204);
    int _1216 = ~_1164;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1224 = log2(_1222);
    int _1226 = _1210;
    int _1228 = _1220;
    if (!_1178)
    {
        int _1230 = ~_1196;
        int _1232 = _1230 + 1;
        _1226 = _1232;
    }
    int _1234 = _1226;
    float _1236 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1158)
    {
        int _1238 = ~_1164;
        int _1240 = _1238 + 1;
        _1228 = _1240;
    }
    int _1242 = _1228;
    float _1244 = _1050 + _1072;
    float _1246 = abs(_1162);
    float _1248 = abs(_1140);
    float _1250 = precise::max(_1246, _1248);
    float _1252 = fma(_1236, -2.0, _1104);
    float _1254 = _1056 + _1072;
    float _1256 = _1244 + (-1.0);
    bool _1258 = _1250 >= 16.0;
    float _1260 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1212);
    bool _1262 = !_1076;
    int _1264 = _1262 ? 0 : 1;
    float _1266 = _1254 + (-1.0);
    float _1268 = _1244;
    if (_1064)
    {
        _1268 = _1050;
    }
    float _1270 = _1268;
    float _1272 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1274 = _1270;
    if (!_1064)
    {
        _1274 = _1072;
    }
    float _1276 = _1274;
    float _1278 = _1224 * _140;
    int _1280 = abs(_1264);
    float _1282 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1286 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1288 = float(_1280);
    float _1290 = exp2(_1278);
    float _1292 = float(_1234);
    float _1294 = fma(_1286, -2.0, _1284);
    float _1296 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1214);
    bool _1298 = _1192 > 0.0;
    float _1300 = _1288 * _1292;
    bool _1302 = _1192 >= 0.0;
    bool _1304 = isnan(_1192);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = in.m_61.x;
    float _1314 = in.m_61.y;
    float _1316 = in.m_61.z;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1320 = 1.0 + _1318;
    bool _1322 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1324 = isnan(1.0);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1330 = _1326 || _1328;
    float _1332 = _1300 * (-2.0);
    bool _1334 = !_1084;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = 1.0 / _1320;
    int _1340 = _1310 ? 0 : 1;
    float _1342 = -_140;
    float _1344 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1156);
    bool _1346 = !_1080;
    int _1348 = _1346 ? 0 : 1;
    float _1350 = -_1290;
    float _1352 = _1350 + 1.0;
    bool _1354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1356 = isnan(0.0);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1362 = _1358 || _1360;
    float _1364 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1136);
    int _1366 = abs(_1348);
    float _1368 = -_140;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1168);
    int _1372 = abs(_1336);
    float _1374 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1294);
    int _1376 = ~_1340;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    int _1382 = _1380;
    bool _1384 = _1362;
    if (_1258)
    {
        float _1386 = _1140 * 0.0625;
        _1172 = _1386;
    }
    float _1388 = _1172;
    if (!_1298)
    {
        int _1390 = ~_1340;
        int _1392 = _1390 + 1;
        _1382 = _1392;
    }
    int _1394 = _1382;
    float _1396 = _1162 * 0.0625;
    float _1398 = _1362 ? _1352 : 0.0;
    float _1400 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1252);
    float _1402 = float(_1242);
    float _1404 = fma(_1272, _1332, _1272);
    float _1406 = _1258 ? _1396 : _1162;
    if (_1330)
    {
        float _1408 = _1398 * _1338;
        _158 = _1408;
    }
    float _1410 = _158;
    float _1412 = _1072 + (-0.5);
    float _1414 = fma(_1332, _1312, _1312);
    float _1416 = float(_1372);
    float _1418 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1414);
    float _1420 = abs(_1406);
    bool _1422 = _1420 != 0.0;
    bool _1424 = isnan(_1420);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan(0.0);
    bool _1430 = _1426 || _1428;
    float _1432 = _1050 + _1056;
    float _1434 = float(_1366);
    float _1436 = _1416 * _1402;
    float _1438 = float(_1394);
    float _1440 = fma(_1404, _1410, _1418);
    float _1442 = abs(_1388);
    bool _1444 = _1442 == 0.0;
    bool _1446 = !_1430;
    bool _1448 = _1444 && _1446;
    float _1450 = _1436 * (-2.0);
    float _1452 = abs(_1388);
    bool _1454 = _1452 == 0.0;
    float _1456 = _1434 * _1438;
    float _1458 = _1440 * 0.15915493667125701904296875;
    float _1460 = _1432 + (-1.0);
    float _1462 = _1456 * (-2.0);
    float _1464 = _1458 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    float _1468 = fma(_1282, _1450, _1282);
    float _1470 = fma(_1450, _1316, _1316);
    float _1472 = fma(_1462, _1314, _1314);
    float _1474 = _1056 + (-0.5);
    float _1476 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1478 = _1050 + (-0.5);
    int _1480 = as_type<int>(_1474);
    if (_1448)
    {
        bool _1482 = as_type<int>(_1388) >= 0;
        _1384 = _1482;
    }
    bool _1484 = _1384;
    float _1486 = _1458 * 6.283185482025146484375;
    float _1488 = cos(_1486);
    float _1490 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1470);
    float _1492 = fma(_1476, _1462, _1476);
    float _1494 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1472);
    float _1496 = _1494;
    int _1498 = _1484 ? (-1) : 0;
    if (_1448)
    {
        int _1500 = _1484 ? 0 : 1078530011;
        _1480 = _1500;
    }
    int _1502 = _1480;
    float _1504 = fma(_1468, _1410, _1490);
    float _1506 = fma(_1492, _1410, _1494);
    int _1508 = _1502;
    if (_1448)
    {
        int _1510 = int(0x80000000) & as_type<int>(_1406);
        int _1512 = _1502 | _1510;
        _1496 = as_type<float>(_1512);
    }
    float _1514 = _1496;
    bool _1516 = !_1430;
    bool _1518 = _1516 && _1454;
    float _1520 = _1514;
    float _1522 = _1514;
    if (!_1518)
    {
        float _1524 = abs(_1406);
        bool _1526 = _1524 != as_type<float>(0x7f800000u /* inf */);
        bool _1528 = isnan(_1524);
        bool _1530 = _1526 || _1528;
        bool _1532 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1534 = _1530 || _1532;
        float _1536 = abs(_1388);
        bool _1538 = _1536 == as_type<float>(0x7f800000u /* inf */);
        float _1540 = abs(_1388);
        bool _1542 = _1540 == as_type<float>(0x7f800000u /* inf */);
        bool _1544 = !_1534;
        bool _1546 = _1542 && _1544;
        if (_1546)
        {
            bool _1548 = as_type<int>(_1388) >= 0;
            _1498 = _1548 ? (-1) : 0;
        }
        int _1550 = _1498;
        if (_1546)
        {
            _1508 = 1075235812;
        }
        int _1552 = _1508;
        int _1554 = _1552;
        if (_1546)
        {
            int _1556 = ~_1550;
            int _1558 = (_1556 != 0) ? _1552 : 1061752795;
            _1554 = _1558;
        }
        int _1560 = _1554;
        if (_1546)
        {
            int _1562 = int(0x80000000) & as_type<int>(_1406);
            int _1564 = _1560 | _1562;
            _1520 = as_type<float>(_1564);
        }
        float _1566 = _1520;
        bool _1568 = !_1534;
        bool _1570 = _1568 && _1538;
        _1522 = _1566;
        if (!_1570)
        {
            float _1572 = abs(_1406);
            float _1574 = abs(_1388);
            float _1576 = precise::max(_1572, _1574);
            float _1578 = abs(_1406);
            float _1580 = abs(_1388);
            float _1582 = precise::min(_1578, _1580);
            float _1584 = 1.0 / _1576;
            float _1586 = abs(_1406);
            float _1588 = abs(_1388);
            bool _1590 = _1586 > _1588;
            bool _1592 = as_type<int>(_1388) >= 0;
            float _1594 = _1582 * _1584;
            float _1596 = abs(_1406);
            float _1598 = abs(_1388);
            float _1600 = _1596 + _1598;
            int _1602 = as_type<int>(_1406) & int(0x80000000);
            float _1604 = _1594 * _1594;
            bool _1606 = _1600 > as_type<float>(0x7f800000u /* inf */);
            bool _1608 = isnan(_1600);
            bool _1610 = _1606 || _1608;
            bool _1612 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1614 = _1610 || _1612;
            float _1616 = _1604 + 11.33538818359375;
            float _1618 = fma(_1604, _1616, 28.84246826171875);
            float _1620 = fma(_1604, _1618, 19.6966705322265625);
            float _1622 = fma(_1604, -0.82336294651031494140625, -5.674867153167724609375);
            float _1624 = fma(_1604, _1622, -6.565555095672607421875);
            float _1626 = 1.0 / _1620;
            float _1628 = _1604 * _1624;
            float _1630 = _1594 * _1628;
            float _1632 = fma(_1630, _1626, _1594);
            float _1634 = _1632;
            _1522 = _1600;
            if (_1590)
            {
                float _1636 = -_1632;
                float _1638 = _1636 + 1.57079637050628662109375;
                _1634 = _1638;
            }
            float _1640 = _1634;
            int _1642 = as_type<int>(_1640);
            if (!_1592)
            {
                float _1644 = -_1640;
                float _1646 = _1644 + 3.1415927410125732421875;
                _1642 = as_type<int>(_1646);
            }
            int _1648 = _1642;
            if (!_1614)
            {
                int _1650 = _1602 | _1648;
                _1522 = as_type<float>(_1650);
            }
        }
    }
    float _1652 = _1522;
    float _1654 = in.m_63.x;
    float _1656 = in.m_63.y;
    float _1658 = in.m_63.z;
    float _1660 = -_1652;
    float _1662 = _1506 + _1660;
    float _1664 = _472 * _168;
    float _1666 = _1504 * 0.15915493667125701904296875;
    float _1668 = _1662 * 0.15915493667125701904296875;
    float _1670 = fma(_470, _166, _1664);
    float _1672 = _1666 * 6.283185482025146484375;
    float _1674 = cos(_1672);
    float _1676 = in.m_65.y;
    float _1678 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1680 = fma(_476, _170, _1670);
    float _1682 = _812 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1684 = in.m_51.w;
    float _1686 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1688 = _1668 * 6.283185482025146484375;
    float _1690 = sin(_1688);
    bool _1692 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1694 = isnan(0.5);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1700 = _1696 || _1698;
    bool _1702 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1704 = isnan(0.5);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1710 = _1706 || _1708;
    float _1712 = _1668 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1656);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1658);
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1654);
    float _1722 = _1466 * _1674;
    float _1724 = _1716 * _1678;
    float _1726 = _1718 * _1682;
    float _1728 = _1720 * _1686;
    float _1730 = _1666 * 6.283185482025146484375;
    float _1732 = sin(_1730);
    float _1734 = _1488 * _1690;
    float _1736 = _1466 * _1690;
    float _1738 = _1722 * _1724;
    float _1740 = _1690 * _1674;
    float _1742 = -_1676;
    float _1744 = _1742 + 1.0;
    float _1746 = _1680 + _1684;
    float _1748 = _1466 * _1714;
    float _1750 = _1488 * _1714;
    float _1752 = _1714 * _1674;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1756 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _474);
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1760 = _1488 * _1674;
    float _1762 = -_1734;
    float _1764 = fma(_1732, _1748, _1762);
    float _1766 = -_1724;
    float _1768 = _1732 * _1766;
    float _1770 = fma(_1732, _1736, _1750);
    float _1772 = fma(_1732, _1750, _1736);
    float _1774 = fma(_1764, _1728, _1738);
    float _1776 = fma(_1752, _1728, _1768);
    float _1778 = _1760 * _1724;
    float _1780 = -_1748;
    float _1782 = fma(_1732, _1734, _1780);
    float _1784 = fma(_1770, _1726, _1774);
    float _1786 = fma(_1740, _1726, _1776);
    float _1788 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1758);
    float _1790 = fma(_1772, _1728, _1778);
    float _1792 = _1110 + _1784;
    float _1794 = _1128 + _1786;
    float _1796 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1788);
    float _1798 = fma(_1782, _1726, _1790);
    float _1800 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1802 = _1792 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1806 = _1794 + _1804;
    float _1808 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1810 = _1802 * _1754;
    float _1812 = _1806 * _1754;
    float _1814 = 1.0 / _1808;
    float _1816 = fma(_1810, _1756, _1792);
    float _1818 = fma(_1812, _1756, _1794);
    float _1820 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1822 = _1746 + _1798;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1826 = _1816 + _1824;
    float _1828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1830 = _1818 + _1828;
    float _1832 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1820);
    float _1834 = _1826 * _1826;
    float _1836 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1832);
    float _1838 = fma(_1830, _1830, _1834);
    float _1840 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1842 = sqrt(_1838);
    float _1844 = _1840 + _1808;
    float _1846 = _1844 * _1814;
    float _1848 = _1846 * 0.5;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1852 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1850);
    float _1854 = 1.0 / _1852;
    bool _1856 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1858 = _1750;
    float _1860 = _1790;
    float _1862 = _1674;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1866 = _1826;
    float _1868 = _1852;
    float _1870 = _1676;
    if (!_1856)
    {
        _1858 = _1818;
    }
    float _1872 = _1858;
    float _1874 = _1872;
    if (!_1856)
    {
        _1860 = _1816;
    }
    float _1876 = _1860;
    float _1878 = _1876;
    if (!_1856)
    {
        _1862 = _1822;
    }
    float _1880 = _1862;
    bool _1882 = !_1856;
    float _1884 = _1880;
    if (!_1882)
    {
        float _1886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1890 = _1842 + _1888;
        float _1892 = _1822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1894 = rsqrt(_1838);
        float _1896 = _1890 * _1886;
        float _1898 = _1896 * 0.15915493667125701904296875;
        float _1900 = _1898 * 6.283185482025146484375;
        float _1902 = cos(_1900);
        float _1904 = _1898 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        float _1908 = _1902 + (-1.0);
        float _1910 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1912 = fma(_1906, _1892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1914 = fma(_1822, _1902, _1910);
        float _1916 = _1894 * _1912;
        float _1918 = fma(_1830, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1920 = fma(_1826, _1916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1874 = _1918;
        _1884 = _1914;
        _1878 = _1920;
    }
    float _1922 = _1874;
    float _1924 = _1884;
    float _1926 = _1878;
    float _1928 = _1924;
    float _1930 = _1922;
    float _1932 = _1926;
    if (_1710)
    {
        _1864 = 1.0;
    }
    float _1934 = _1864;
    float _1936 = _1934;
    if (!_1700)
    {
        float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1940 = _1746 + _1938;
        float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1944 = -_1128;
        float _1946 = _1944 + _1922;
        float _1948 = -_1746;
        float _1950 = _1948 + _1924;
        float _1952 = _1940 * _1940;
        float _1954 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1956 = _1110 + _1954;
        float _1958 = fma(_1162, _1162, _1952);
        float _1960 = fma(_1956, _1956, _1958);
        float _1962 = sqrt(_1960);
        float _1964 = precise::min(_1962, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1966 = _1964 * _1942;
        float _1968 = -_1110;
        float _1970 = _1968 + _1926;
        float _1972 = fma(_1946, _1966, _1128);
        float _1974 = fma(_1950, _1966, _1746);
        float _1976 = fma(_1970, _1966, _1110);
        _1928 = _1974;
        _1930 = _1972;
        _1932 = _1976;
        _1866 = _1962;
    }
    float _1978 = _1928;
    float _1980 = _1930;
    float _1982 = _1932;
    float _1984 = _1866;
    float _1986 = _1984;
    if (_1710)
    {
        _1868 = 1.0;
    }
    float _1988 = _1868;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1992 = _1854 * _1990;
    float _1994 = _1988;
    if (!_1710)
    {
        float _1996 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1998 = _1996 * 0.15915493667125701904296875;
        float _2000 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2002 = _1998 * 6.283185482025146484375;
        float _2004 = cos(_2002);
        float _2006 = _2000 * 0.15915493667125701904296875;
        float _2008 = _1998 * 6.283185482025146484375;
        float _2010 = sin(_2008);
        float _2012 = 1.0 / _2004;
        float _2014 = _2006 * 6.283185482025146484375;
        float _2016 = cos(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = _2006 * 6.283185482025146484375;
        float _2022 = sin(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = 1.0 / _2024;
        float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2030 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2028;
        float _2032 = 1.0 / _2030;
        float _2034 = _2022 * _2026;
        float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2038 = fma(_1992, _2034, _2036);
        float _2040 = _2038 * _2032;
        float _2042 = precise::clamp(_2040, 0.0, 1.0);
        _1986 = _1998;
        _1936 = _2042;
    }
    float _2044 = _1986;
    float _2046 = _1936;
    float _2048 = _2044;
    if (!_1710)
    {
        float _2050 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2052 = _2050 * 0.15915493667125701904296875;
        float _2054 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2056 = _2052 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        float _2060 = _2054 * 0.15915493667125701904296875;
        float _2062 = _2052 * 6.283185482025146484375;
        float _2064 = sin(_2062);
        float _2066 = 1.0 / _2058;
        float _2068 = _2060 * 6.283185482025146484375;
        float _2070 = cos(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = _2060 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        float _2078 = _2070 * _2072;
        float _2080 = 1.0 / _2078;
        float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2084 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2082;
        float _2086 = 1.0 / _2084;
        float _2088 = _2076 * _2080;
        float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2092 = fma(_1992, _2088, _2090);
        float _2094 = _2092 * _2086;
        float _2096 = precise::clamp(_2094, 0.0, 1.0);
        float _2098 = -_2096;
        float _2100 = _2098 + 1.0;
        _1994 = _2100;
    }
    float _2102 = _1994;
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2106 = _1978 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2110 = _1980 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2114 = _1982 + _2112;
    float _2116 = _2106 * _2106;
    float _2118 = fma(_2110, _2110, _2116);
    float _2120 = fma(_2114, _2114, _2118);
    float _2122 = rsqrt(_2120);
    float _2124 = sqrt(_2120);
    float _2126 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2128 = _2110 * _2126;
    float _2130 = _2114 * _2126;
    float _2132 = _2128 * _2128;
    float _2134 = _2130 * _2130;
    float _2136 = _2132 + _2134;
    float _2138 = sqrt(_2136);
    bool _2140 = _2138 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2144 = _2138 + _2142;
    float _2146 = _2114;
    float _2148 = _2136;
    float _2150 = _2144;
    float _2152 = _2126;
    if (_2140)
    {
        float _2154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2146 = _2154;
    }
    float _2156 = _2146;
    if (_2140)
    {
        float _2158 = rsqrt(_2136);
        _2148 = _2158;
    }
    float _2160 = _2148;
    if (_2140)
    {
        float _2162 = _2144 * _2156;
        _2150 = _2162;
    }
    float _2164 = _2150;
    if (_2140)
    {
        float _2166 = _2164 * 0.15915493667125701904296875;
        _2048 = _2166;
    }
    float _2168 = _2048;
    float _2170 = _2116;
    float _2172 = _2168;
    if (_2140)
    {
        float _2174 = _2168 * 6.283185482025146484375;
        float _2176 = sin(_2174);
        _2170 = _2176;
    }
    float _2178 = _2170;
    float _2180 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2182 = precise::max(0.0, _2180);
    float _2184 = _2122;
    float _2186 = _2182;
    float _2188 = _2180;
    if (_2140)
    {
        float _2190 = _2168 * 6.283185482025146484375;
        float _2192 = cos(_2190);
        _2184 = _2192;
    }
    float _2194 = _2184;
    float _2196 = -_2126;
    float _2198 = -_2182;
    float _2200 = fma(_2106, _2196, _2198);
    float _2202 = _2200;
    if (!_2140)
    {
        _2186 = _2128;
    }
    float _2204 = _2186;
    float _2206 = _2204;
    if (_2140)
    {
        float _2208 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2188 = _2208;
    }
    float _2210 = _2188;
    float _2212 = _2178;
    float _2214 = _2210;
    if (_2140)
    {
        float _2216 = fma(_2178, _2210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2212 = _2216;
    }
    float _2218 = _2212;
    float _2220 = _2218;
    float _2222 = _2194;
    if (_2140)
    {
        float _2224 = _2194 + (-1.0);
        _2214 = _2224;
    }
    float _2226 = _2214;
    float _2228 = _2226;
    if (_2140)
    {
        float _2230 = _2160 * _2218;
        _2152 = _2230;
    }
    float _2232 = _2152;
    if (!_2140)
    {
        _2220 = _2132;
    }
    float _2234 = _2220;
    float _2236 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2238 = _2234;
    if (_2140)
    {
        float _2240 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2240;
    }
    float _2242 = _2172;
    if (_2140)
    {
        float _2244 = _2128 * _2232;
        _2206 = _2244;
    }
    float _2246 = _2206;
    if (!_2140)
    {
        _2228 = _2130;
    }
    float _2248 = _2228;
    float _2250 = _2248;
    if (_2140)
    {
        float _2252 = _2130 * _2232;
        _2250 = _2252;
    }
    float _2254 = _2250;
    if (_2140)
    {
        float _2256 = fma(_2200, _2194, _2242);
        _2202 = _2256;
    }
    float _2258 = _2202;
    if (_2140)
    {
        float _2260 = _2246 * _2246;
        _2238 = _2260;
    }
    float _2262 = _2238;
    if (!_2140)
    {
        _2222 = _2134;
    }
    float _2264 = _2222;
    float _2266 = _2264;
    if (_2140)
    {
        float _2268 = _2254 * _2254;
        _2266 = _2268;
    }
    float _2270 = _2266;
    float _2272 = fma(_2258, _2258, _2262);
    float _2274 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2276 = _2272 + _2270;
    float _2278 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2236);
    float _2280 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2282 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2284 = fma(_2124, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2282);
    float _2286 = precise::clamp(_2284, 0.0, 1.0);
    float _2288 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2290 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2278);
    float _2292 = rsqrt(_2276);
    float _2294 = _1978 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2296 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2280);
    float _2298 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2300 = -_2286;
    float _2302 = _2300 + 1.0;
    float _2304 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2294);
    float _2306 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2296);
    float _2308 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2310 = abs(_2302);
    float _2312 = log2(_2310);
    float _2314 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2304);
    float _2316 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2318 = -_2308;
    float _2320 = fma(_2318, _2274, 1.0);
    float _2322 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2288);
    float _2324 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2326 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2328 = _2292 * _2246;
    float _2330 = _2292 * _2258;
    float _2332 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2322);
    float _2334 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2326);
    float _2336 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2338 = _2292 * _2254;
    float _2340 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2342 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2334);
    float _2344 = -_2336;
    float _2346 = fma(_2330, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2344);
    float _2348 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2350 = log2(_2320);
    float _2352 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2342);
    float _2354 = -_2338;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2346);
    float _2358 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2360 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2362 = fma(_2356, -0.5, 0.5);
    float _2364 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2358);
    float _2366 = 1.0 / _2352;
    float _2368 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2360);
    float _2370 = fma(_2356, 0.5, 0.5);
    float _2372 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2364);
    float _2374 = _2330 + 1.0;
    float _2376 = fma(_2370, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2378 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2372);
    float _2380 = exp2(_2348);
    float _2382 = _2350 * 0.693147182464599609375;
    float _2384 = fma(_2370, _2376, -0.212114393711090087890625);
    float _2386 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2388 = fma(_2370, _2384, 1.570728778839111328125);
    float _2390 = sqrt(_2362);
    float _2392 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2368);
    float _2394 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2392);
    float _2396 = -_2330;
    float _2398 = fma(_2380, _2374, _2396);
    float _2400 = _2378 * _2366;
    float _2402 = _2394 * _2366;
    float _2404 = fma(_2398, 0.5, 0.5);
    float _2406 = fma(_2400, 0.5, 0.5);
    float _2408 = fma(_2402, -0.5, 0.5);
    float _2410 = _2390 * 0.636619746685028076171875;
    float _2412 = -_2388;
    float _2414 = fma(_2410, _2412, 1.0);
    float3 _7029 = float3(_2406, _2408, _2386);
    float _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7029, float3(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7029, float3(0.0), isnan(_7029)), level(0.0)).x;
    float3 _7040 = float3(_2406, _2408, _2386);
    float4 _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7040, float3(0.0), isnan(_7040)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7040, float3(0.0), isnan(_7040)), level(0.0)).xyzw;
    float _2421 = _2419.x;
    float _2423 = _2419.y;
    float _2425 = _2419.z;
    float _2427 = _2419.w;
    float2 _7057 = float2(_2414, _2404);
    float3 _2431 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7057, float2(0.0), isnan(_7057)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7057, float2(0.0), isnan(_7057)), level(0.0)).xyz;
    float _2433 = _2431.x;
    float _2435 = _2431.y;
    float _2437 = _2431.z;
    out.m_67.x = _1018;
    out.m_67.y = _1020;
    out.m_67.z = _1022;
    out.m_67.w = _1024;
    float _2439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2445 = _1050 > 0.5;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2451 = in.m_65.x;
    bool _2453 = _1056 > 0.5;
    float _2455 = 1.0 / _2443;
    int _2457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2459 = _2457 != 0;
    float _2461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2465 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2467 = _1048 + _2465;
    int _2469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2471 = _2469 != 0;
    float _2473 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2475 = 1.0 / _2449;
    int _2477 = _2453 ? as_type<int>(_1744) : as_type<int>(_1676);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2481 = _2479 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2485 = _2483 != 0;
    float _2487 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2489 = _2487 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2491 = _2445 ? as_type<int>(_1744) : as_type<int>(_1676);
    float _2493 = in.m_69.w;
    bool _2495 = _1058 > 0.5;
    float _2497 = 1.0 / _2463;
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2501 = _2499 != 0;
    out.m_71.x = _1752;
    out.m_71.y = _1772;
    out.m_71.z = _1764;
    out.m_73.x = _1980;
    out.m_73.y = _1978;
    out.m_73.z = _1982;
    float _2503 = _2485 ? as_type<float>(_2491) : _1676;
    float _2505 = 1.0 / _2489;
    int _2507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2509 = _2507 != 0;
    float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2513 = _2511 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2517 = _2515 != 0;
    float _2519 = as_type<float>(_2491);
    bool _2521 = _2501;
    bool _2523 = _2495;
    float _2525 = _2467;
    float _2527 = _2439;
    float _2529 = _2451;
    float _2531 = _2352;
    float _2533 = _2394;
    float _2535 = _2378;
    if (_2471)
    {
        float _2537 = in.m_59.z;
        _2519 = _2537;
    }
    float _2539 = _2519;
    float _2541 = _2501 ? as_type<float>(_2477) : _1676;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2543;
    float _2547 = 1.0 / _2481;
    if (_2459)
    {
        bool _2549 = _1072 > 0.5;
        _2521 = _2549;
    }
    bool _2551 = _2521;
    float _2553 = _2545 * _2455;
    float _2555 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2555;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2561 = _2559 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2563 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2565 = isnan(_1048);
    bool _2567 = _2563 || _2565;
    bool _2569 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2571 = _2567 || _2569;
    float _2573 = float(_2571);
    float _2575 = 1.0 / _2513;
    float _2577 = _2557 * _2475;
    float _2579 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2579;
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2585 = _2583 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2587 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2589 = _2587 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2591 = _2561 * _2505;
    float _2593 = _2581 * _2497;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2597 = _1048 + _2595;
    float _2599 = 1.0 / _2589;
    float _2601 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2603 = _2601 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2517)
    {
        float _2605 = _2495 ? _1744 : _1676;
        _1870 = _2605;
    }
    float _2607 = _1870;
    float _2609 = fma(_2553, _2597, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2613 = _1048 + _2611;
    bool _2615 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2617 = isnan(_1048);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = _2603 * _2547;
    float _2629 = _2585 * _2575;
    float _2631 = fma(_2591, _2613, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2635 = _1048 + _2633;
    bool _2637 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2639 = isnan(_1048);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2645 = _2641 || _2643;
    float _2647 = float(_2645);
    float _2649 = -_2625;
    float _2651 = _2649 + 1.0;
    bool _2653 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2655 = isnan(_1048);
    bool _2657 = _2653 || _2655;
    bool _2659 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2661 = _2657 || _2659;
    float _2663 = float(_2661);
    float _2665 = fma(_2577, _2635, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2667 = _2663;
    int _2669 = as_type<int>(_2609);
    float _2671 = _2607;
    if (_2471)
    {
        bool _2673 = _2539 > 0.5;
        _2523 = _2673;
    }
    bool _2675 = _2523;
    float _2677 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2677;
    bool _2681 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2683 = isnan(_1048);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2689 = _2685 || _2687;
    float _2691 = float(_2689);
    float _2693 = _2647 * _2651;
    float _2695 = -_2647;
    float _2697 = _2695 + 1.0;
    float _2699 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2701 = _1048 + _2699;
    float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2705 = _1048 + _2703;
    float _2707 = -_2663;
    float _2709 = _2707 + 1.0;
    float _2711 = _2679 * _2599;
    float _2713 = fma(_2627, _2701, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2715 = fma(_2593, _2705, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2717 = _2691 * _2709;
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2721 = _1048 + _2719;
    bool _2723 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2725 = isnan(_1048);
    bool _2727 = _2723 || _2725;
    bool _2729 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2731 = _2727 || _2729;
    float _2733 = float(_2731);
    float _2735 = -_2691;
    float _2737 = _2735 + 1.0;
    bool _2739 = _1656 != 0.0;
    bool _2741 = isnan(_1656);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan(0.0);
    bool _2747 = _2743 || _2745;
    float _2749 = fma(_2629, _2721, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2751 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2753 = isnan(_1048);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2733 * _2737;
    float _2765 = -_2733;
    float _2767 = _2765 + 1.0;
    bool _2769 = _1654 == 0.0;
    bool _2771 = !_2747;
    bool _2773 = _2769 && _2771;
    float _2775 = in.m_75.x;
    float _2777 = in.m_75.y;
    float _2779 = in.m_75.z;
    float _2781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2783 = -_2761;
    float _2785 = _2783 + 1.0;
    bool _2787 = _1658 == 0.0;
    bool _2789 = _2787 && _2773;
    out.m_77.w = _2493;
    float _2791 = _2663 * _2697;
    if (!_2459)
    {
        _2667 = _2451;
    }
    float _2793 = _2667;
    float _2795 = fma(_2711, _2467, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2797 = _2503 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2799 = exp2(_2473);
    float _2801 = _2573 * _2767;
    bool _2803 = _1048 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2805 = isnan(_1048);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = _2793;
    if (_2459)
    {
        float _2817 = -_2451;
        float _2819 = _2817 + 1.0;
        _1100 = as_type<int>(_2819);
    }
    int _2821 = _1100;
    float _2823 = -_2573;
    float _2825 = _2823 + 1.0;
    float _2827 = _2781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2829 = _2813 * _2785;
    float _2831 = -_2813;
    float _2833 = _2831 + 1.0;
    int _2835 = _2821;
    if (_2459)
    {
        float _2837 = _2551 ? as_type<float>(_2821) : _2451;
        _2815 = _2837;
    }
    float _2839 = _2815;
    if (_2471)
    {
        float _2841 = -_2451;
        float _2843 = _2841 + 1.0;
        _2835 = as_type<int>(_2843);
    }
    int _2845 = _2835;
    float _2847 = _2609 * _2829;
    float _2849 = _2761 * _2825;
    float _2851 = as_type<float>(_2845);
    if (_2509)
    {
        float _2853 = -_2451;
        float _2855 = _2853 + 1.0;
        _2669 = as_type<int>(_2855);
    }
    int _2857 = _2669;
    float _2859 = _2439 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _2861 = _2857;
    float _2863 = _2775;
    int _2865 = as_type<int>(_2777);
    if (_2789)
    {
        _2525 = _2777;
    }
    float _2867 = _2525;
    float _2869 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2847);
    float _2871 = _2867;
    if (!_2471)
    {
        _2527 = _2451;
    }
    float _2873 = _2527;
    float _2875 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2877 = _2873;
    if (_2471)
    {
        float _2879 = _2675 ? as_type<float>(_2845) : _2451;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = fma(_2827, _2607, -0.5);
    if (_2509)
    {
        float _2885 = _2445 ? as_type<float>(_2857) : _2451;
        _2529 = _2885;
    }
    float _2887 = _2529;
    float _2889 = fma(_2541, _2859, -0.5);
    if (_2789)
    {
        float _2891 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2867);
        _2861 = as_type<int>(_2891);
    }
    int _2893 = _2861;
    int _2895 = _2893;
    if (_2789)
    {
        _2671 = _2867;
    }
    float _2897 = _2671;
    float _2899 = _2897;
    if (!_2789)
    {
        float _2901 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2775);
        _2863 = _2901;
    }
    float _2903 = _2863;
    float _2905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_2789)
    {
        _2871 = _2777;
    }
    float _2907 = _2871;
    float _2909 = fma(_2631, _2849, _2869);
    if (_2789)
    {
        float _2911 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2779);
        _2865 = as_type<int>(_2911);
    }
    int _2913 = _2865;
    float _2915 = _2839 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2917 = _2913;
    if (!_2789)
    {
        float _2919 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2779);
        _2917 = as_type<int>(_2919);
    }
    int _2921 = _2917;
    if (!_2789)
    {
        float _2923 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2907);
        _2895 = as_type<int>(_2923);
    }
    int _2925 = _2895;
    float _2927 = fma(_2665, _2801, _2909);
    float _2929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2931 = _2875 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2933 = -_1374;
    float _2935 = fma(_1260, _2889, _2933);
    bool _2937 = !_2789;
    float _2939 = _2937 ? as_type<float>(_2925) : _2907;
    float _2941 = fma(_2713, _2763, _2927);
    float _2943 = fma(_2931, _2887, -0.5);
    if (!_2789)
    {
        _2899 = as_type<float>(_2925);
    }
    float _2945 = _2899;
    float _2947 = -_1400;
    float _2949 = fma(_1364, _2883, _2947);
    float _2951 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2953 = _2905 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2955 = fma(_1198, _2943, _1370);
    if (_2789)
    {
        _2851 = _2779;
    }
    float _2957 = _2851;
    float _2959 = _2939 * _2939;
    float _2961 = fma(_2953, _2881, -0.5);
    bool _2963 = !_2789;
    float _2965 = _2963 ? as_type<float>(_2921) : _2779;
    float _2967 = -_2799;
    float _2969 = _2967 + 1.0;
    float _2971 = _2915 * _2929;
    float _2973 = _2935 + 0.5;
    float _2975 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2977 = fma(_1296, _2961, _1344);
    float _2979 = _2957;
    if (!_2789)
    {
        _2979 = as_type<float>(_2921);
    }
    float _2981 = _2979;
    float _2983 = fma(_2965, _2965, _2959);
    float _2985 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2975);
    float _2987 = _2977 + 0.5;
    float _2989 = _2797 * _2951;
    float _2991 = _2955 + 0.5;
    float _2993 = _1760 * _2945;
    float _2995 = _2949 + 0.5;
    float _2997 = -_2945;
    float _2999 = _1732 * _2997;
    float _3001 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2985);
    out.m_79.x = _2991;
    out.m_79.y = _2973;
    float _3003 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3005 = fma(_1752, _2903, _2999);
    float _3007 = _2352 * 0.5;
    out.m_81.x = _2971;
    out.m_81.y = _2989;
    out.m_81.z = _2987;
    out.m_81.w = _2995;
    float _3009 = rsqrt(_2983);
    float _3011 = fma(_2715, _2717, _2941);
    float _3013 = fma(_2394, -0.5, _3007);
    float _3015 = fma(_1740, _2981, _3005);
    float _3017 = _2378 + _2352;
    float _3019 = fma(_1772, _2903, _2993);
    float _3021 = _1722 * _2945;
    float _3023 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3001);
    float _3025 = fma(_2749, _2791, _3011);
    float _3027 = _3017 * 0.5;
    float _3029 = _3023 + _2352;
    float _3031 = fma(_2795, _2693, _3025);
    float _3033 = fma(_1764, _2903, _3021);
    float _3035 = fma(_1782, _2981, _3019);
    float _3037 = _3029 * 0.5;
    float _3039 = _2965 * _3009;
    float _3041 = fma(_1770, _2981, _3033);
    float _3043 = fma(_2625, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3031);
    float _3045 = _2939 * _3009;
    out.m_83.x = _3027;
    out.m_83.y = _3013;
    out.m_83.z = _3037;
    out.m_83.w = _2352;
    bool _3047 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_2124);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = -_3045;
    float _3059 = _1740 * _3057;
    out.m_85.x = _3015;
    out.m_85.y = _3035;
    out.m_85.z = _3041;
    float _3061 = -_3045;
    float _3063 = _1782 * _3061;
    float _3065 = -_1732;
    float _3067 = fma(_3065, _3039, _3059);
    out.m_87.x = _3043;
    float _3069 = fma(_1760, _3039, _3063);
    out.gl_Position.x = _2378;
    out.gl_Position.y = _2394;
    out.gl_Position.z = _3023;
    out.gl_Position.w = _2352;
    float _3071 = -_3045;
    float _3073 = _1770 * _3071;
    float _3075 = fma(_1722, _3039, _3073);
    out.m_89.x = _3067;
    out.m_89.y = _3069;
    out.m_89.z = _3075;
    float _3077 = _3023;
    float _3079 = _3067;
    if (!_3055)
    {
        _2531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3081 = _2531;
    float _3083 = _3081;
    float _3085 = _3081;
    if (!_3055)
    {
        _3077 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3087 = _3077;
    float _3089 = _3087;
    float _3091 = _3087;
    if (!_3055)
    {
        _2533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3093 = _2533;
    float _3095 = _3093;
    float _3097 = _3093;
    if (!_3055)
    {
        _2535 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3099 = _2535;
    float _3101 = _3099;
    float _3103 = _3099;
    if (!_3055)
    {
        _3079 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3105 = _3079;
    float _3107 = _3003 * _2416;
    float _3109 = -_3003;
    float _3111 = _3109 + 1.0;
    float _3113 = _2427 * _3107;
    float _3115 = _2437 * _3107;
    float _3117 = _2427 * _3111;
    float _3119 = fma(_2433, _3113, _2421);
    float _3121 = fma(_2435, _3113, _2423);
    float _3123 = fma(_2427, _3115, _2425);
    float _3125 = _2046 * _2102;
    out.m_91.x = _3119;
    out.m_91.y = _3121;
    out.m_91.z = _3123;
    out.m_91.w = _3117;
    float _3127 = _3125 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3129 = _3125;
    float _3131 = _3105;
    float _3133 = _3105;
    if (!_3055)
    {
        _3129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3135 = _3129;
    bool _3137 = !_3055;
    float _3139 = _3135;
    float _3141 = _3135;
    if (!_3137)
    {
        bool _3143 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3145 = isnan(_2124);
        bool _3147 = _3143 || _3145;
        bool _3149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3151 = _3147 || _3149;
        if (!_3151)
        {
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3155 = _2124 + _3153;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3159 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3157;
            float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3165 = 1.0 / _3159;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3181 = _3179 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3183 = _3155 * _3165;
            float _3185 = precise::clamp(_3183, 0.0, 1.0);
            float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3191 = fma(_3185, _3163, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3193 = fma(_3185, _3189, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3195 = fma(_3185, _3169, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3197 = fma(_3185, _3173, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3199 = fma(_3185, _3177, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3201 = fma(_3185, _3181, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3195;
            _3103 = _3199;
            _3133 = _3191;
            _3097 = _3197;
            _3091 = _3193;
            _3141 = _3201;
            _3203 = true;
        }
        else
        {
            bool _3205 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3207 = isnan(_2124);
            bool _3209 = _3205 || _3207;
            bool _3211 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3213 = _3209 || _3211;
            if (!_3213)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3215 = _3131;
            _3133 = _3215;
            if (!_3213)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3217 = _3083;
            _3085 = _3217;
            if (!_3213)
            {
                _3089 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3219 = _3089;
            _3091 = _3219;
            if (!_3213)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3221 = _3095;
            _3097 = _3221;
            if (!_3213)
            {
                _3101 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3223 = _3101;
            _3103 = _3223;
            if (!_3213)
            {
                _3139 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3225 = _3139;
            bool _3227 = !_3213;
            _3141 = _3225;
            if (!_3227)
            {
                bool _3229 = _2124 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3231 = isnan(_2124);
                bool _3233 = _3229 || _3231;
                bool _3235 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3237 = _3233 || _3235;
                if (!_3237)
                {
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3241 = _2124 + _3239;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3245 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3243;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3251 = 1.0 / _3245;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3267 = _3265 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3269 = _3241 * _3251;
                    float _3271 = precise::clamp(_3269, 0.0, 1.0);
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3277 = fma(_3271, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3279 = fma(_3271, _3275, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3281 = fma(_3271, _3255, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3283 = fma(_3271, _3259, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3285 = fma(_3271, _3263, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3287 = fma(_3271, _3267, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3281;
                    _3103 = _3285;
                    _3133 = _3277;
                    _3097 = _3283;
                    _3091 = _3279;
                    _3141 = _3287;
                    _3203 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3103 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3091 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3141 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3203 = false;
    float _3289 = _3085;
    float _3291 = _3103;
    float _3293 = _3133;
    float _3295 = _3097;
    float _3297 = _3091;
    float _3299 = _3141;
    float _3301 = fma(_3035, -0.5, 0.5);
    float _3303 = precise::clamp(_3301, 0.0, 1.0);
    float _3305 = -_3289;
    float _3307 = _3305 + _3291;
    float _3309 = _3127 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3311 = -_3293;
    float _3313 = _3311 + _3295;
    out.m_93.x = 0.0;
    float _3315 = fma(_3303, _3307, _3289);
    float _3317 = fma(_3303, _3313, _3293);
    out.m_47.x = _3309;
    float _3319 = -_3297;
    float _3321 = _3319 + _3299;
    float _3323 = _3315 * 0.586610972881317138671875;
    bool _3325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3327 = fma(_3303, _3321, _3297);
    float _3329 = fma(_3317, 0.298911988735198974609375, _3323);
    bool _3331 = _2046 > 0.0;
    bool _3333 = isnan(_2046);
    bool _3335 = _3331 || _3333;
    bool _3337 = isnan(0.0);
    bool _3339 = _3335 || _3337;
    float _3341 = fma(_3327, 0.114477999508380889892578125, _3329);
    bool _3343 = _2102 <= 0.0;
    bool _3345 = !_3339;
    bool _3347 = _3343 || _3345;
    float _3349 = -_3341;
    float _3351 = _3317 + _3349;
    float _3353 = -_3341;
    float _3355 = _3315 + _3353;
    float _3357 = -_3341;
    float _3359 = _3327 + _3357;
    float _3361 = fma(_3351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    float _3363 = fma(_3355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    float _3365 = fma(_3359, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3341);
    bool _3367 = !_3325;
    if (!_3367)
    {
        float _3369 = -_1978;
        float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3373 = -_1980;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3377 = -_1982;
        float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3381 = _3371 * _3371;
        float _3383 = fma(_3375, _3375, _3381);
        float _3385 = fma(_3379, _3379, _3383);
        float _3387 = sqrt(_3385);
        float _3389 = rsqrt(_3385);
        float _3391 = -_3387;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3395 = _3393 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3397 = precise::clamp(_3395, 0.0, 1.0);
        float _3399 = _3375 * _3389;
        float _3401 = _3371 * _3389;
        float _3403 = abs(_3397);
        float _3405 = log2(_3403);
        float _3407 = _3379 * _3389;
        float _3409 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3411 = _3035 * _3401;
        float _3413 = -_3401;
        float _3415 = -_3409;
        float _3417 = fma(_3413, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3415);
        float _3419 = fma(_3015, _3399, _3411);
        float _3421 = -_3407;
        float _3423 = fma(_3421, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3417);
        float _3425 = fma(_3041, _3407, _3419);
        float _3427 = precise::clamp(_3425, 0.0, 1.0);
        float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3431 = _3423 + _3429;
        float _3433 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3435 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3437 = precise::clamp(_3435, 0.0, 1.0);
        float _3439 = exp2(_3433);
        float _3441 = _3439 * _3437;
        float _3443 = _3427 * _3441;
        float _3445 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3447 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3449 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3445;
        out.m_93.y = _3447;
        out.m_93.z = _3449;
    }
    out.m_95.x = _3361;
    out.m_95.y = _3363;
    out.m_95.z = _3365;
    if (!_3347)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3451 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3451;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

