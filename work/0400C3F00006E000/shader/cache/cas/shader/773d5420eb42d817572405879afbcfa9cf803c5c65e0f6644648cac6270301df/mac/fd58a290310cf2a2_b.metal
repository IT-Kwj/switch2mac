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
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_63 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad5 [[user(locn5)]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _982 = false;
    bool _374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1560 = as_type<float>(_108);
        out.gl_Position.z = _1560;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1629 = as_type<float>(_144);
        out.gl_Position.z = _1629;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    int _164 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _166 = _164 != 0;
    float _168 = _150 * _148;
    float _170 = 0.0;
    float _172 = _152;
    if (!_162)
    {
        float _174 = _152 * _152;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _182 = _178;
    if (!_162)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = -_196;
    float _206 = _180 + _204;
    bool _208 = !_162;
    float _210 = _186;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _152 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _152);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_162;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _152 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _172 = _264;
    }
    float _266 = _172;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _274 = _272 != 0;
    float _276 = in.m_53.w;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = _206 < 0.5;
    float _286 = float(_284);
    float _288 = -_206;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _292 = !_270;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_202, 0.5, 0.5);
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_286;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_166;
    int _306 = _304 ? 0 : 1;
    float _308 = -_296;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_294);
    float _314 = fma(_266, _188, _298);
    bool _316 = !_274;
    int _318 = _316 ? 0 : 1;
    float _320 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _326 = abs(_306);
    float _328 = fma(_266, _190, _320);
    int _330 = abs(_318);
    float _332 = fma(_266, _192, _324);
    float _334 = float(_312);
    float _336 = float(_326);
    float _338 = abs(_290);
    float _340 = _334 * _338;
    float _342 = fma(_314, _276, _278);
    float _344 = fma(_328, _276, _280);
    float _346 = float(_330);
    float _348 = fma(_336, _310, _340);
    float _350 = fma(_332, _276, _282);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_322;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_92);
        float _378 = 1.0 / _376;
        float _380 = _126 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_51.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = in.m_55.y;
    float _400 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _402 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _418 = _406 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _422 = _408 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _426 = _410 + _424;
    float _428 = _418 * _418;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _432 = _430 != 0;
    float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _436 = fma(_422, _422, _428);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _440 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _442 = fma(_426, _426, _436);
    bool _444 = _390 > 0.5;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _454 = rsqrt(_442);
    float _456 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    float _458 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _456);
    float _460 = _418 * _454;
    float _462 = _422 * _454;
    float _464 = _426 * _454;
    float _466 = -_460;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _470 = -_462;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _422);
    float _474 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _476 = -_398;
    float _478 = _476 + 1.0;
    float _480 = _468 * _468;
    float _482 = -_464;
    float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _426);
    float _486 = _448 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = _450 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = fma(_472, _472, _480);
    float _492 = _398;
    float _494 = _408;
    if (_414)
    {
        float _496 = _444 ? _478 : _398;
        _492 = _496;
    }
    float _498 = _492;
    float _500 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _502 = in.m_57.x;
    float _504 = in.m_57.y;
    float _506 = in.m_57.z;
    float _508 = fma(_484, _484, _490);
    float _510 = _354 * _486;
    float _512 = -_438;
    float _514 = fma(_500, 2.0, _512);
    float _516 = sqrt(_508);
    float _518 = _354 * _474;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _522 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = fma(_440, -2.0, _520);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _532 = _354 * _488;
    float _534 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _536 = 1.0 / _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _544 = _146 > 0.5;
    bool _546 = _544 && _432;
    float _548 = _454 * _516;
    float _550 = -_126;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _504);
    float _556 = _548 * _522;
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _560 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _530);
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _502);
    float _564 = _548 * _534;
    float _566 = _554 * _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _568;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _506);
    float _574 = _548 * _542;
    float _576 = 1.0 / _540;
    float _578 = _562 * _564;
    float _580 = _566 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _582 = _572 * _574;
    float _584 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _560);
    float _586 = in.m_55.x;
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _580);
    bool _590 = _504 != 0.0;
    bool _592 = isnan(_504);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = _566 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _608 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _610 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _528);
    float _612 = fma(_600, _498, -0.5);
    float _614 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _606);
    float _616 = _410 + _608;
    bool _618 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = isnan(_382);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -_610;
    float _632 = fma(_458, _612, _630);
    float _634 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[8].z, _614);
    float _636 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _638 = _616 + _636;
    float _640 = in.m_59.x;
    float _642 = in.m_59.y;
    float _644 = in.m_59.z;
    bool _646 = _502 == 0.0;
    bool _648 = !_598;
    bool _650 = _646 && _648;
    float _652 = _408 + _634;
    float _654 = _638 * _638;
    float _656 = _570 * _536;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _382 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _664 = _652 + _662;
    float _666 = _604 * _576;
    bool _668 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _670 = isnan(_382);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_628;
    float _682 = _680 + 1.0;
    float _684 = _664 * _664;
    float _686 = 0.0;
    float _688 = _586;
    float _690 = _504;
    float _692 = _502;
    float _694 = _652;
    if (_432)
    {
        _686 = _586;
    }
    float _696 = _686;
    float _698 = _566 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _700 = _506 == 0.0;
    bool _702 = _700 && _650;
    float _704 = _684 + _654;
    float _706 = fma(_656, _660, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _708 = _696;
    if (_546)
    {
        float _710 = -_696;
        float _712 = _710 + 1.0;
        _708 = _712;
    }
    float _714 = _708;
    bool _716 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _718 = isnan(_382);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = sqrt(_704);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _382 + _730;
    float _734 = _434 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_432)
    {
        _688 = _714;
    }
    float _736 = _688;
    float _738 = _678 * _682;
    float _740 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _698);
    float _742 = -_678;
    float _744 = _742 + 1.0;
    float _746 = fma(_666, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_734, _736, -0.5);
    float _750 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[9].z, _740);
    float _752 = _726 * _744;
    float _754 = _642;
    float _756 = _640;
    float _758 = _644;
    float _760 = _740;
    float _762 = _750;
    if (!_702)
    {
        float _764 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _754 = _764;
    }
    float _766 = _754;
    float _768 = fma(_584, _748, _552);
    float _770 = _406 + _750;
    float _772 = _706 * _752;
    float _774 = -_726;
    float _776 = _774 + 1.0;
    bool _778 = _728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = _768;
    if (!_702)
    {
        float _782 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _756 = _782;
    }
    float _784 = _756;
    if (!_702)
    {
        float _786 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _644);
        _758 = _786;
    }
    float _788 = _758;
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _792 = _766 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_778)
    {
        _760 = _652;
    }
    float _794 = _760;
    float _796 = _794;
    if (!_778)
    {
        _690 = _654;
    }
    float _798 = _690;
    float _800 = _798;
    if (!_778)
    {
        _692 = _684;
    }
    float _802 = _692;
    float _804 = _802;
    if (!_778)
    {
        _762 = _616;
    }
    float _806 = _762;
    float _808 = _806;
    if (!_778)
    {
        _694 = _770;
    }
    float _810 = _694;
    bool _812 = !_778;
    float _814 = _810;
    if (!_812)
    {
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _820 = _728 + _818;
        float _822 = _770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = rsqrt(_704);
        float _826 = _820 * _816;
        float _828 = _826 * 0.15915493667125701904296875;
        float _830 = _828 * 6.283185482025146484375;
        float _832 = sin(_830);
        float _834 = _828 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = fma(_832, _822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _840 = _824 * _838;
        float _842 = _836 + (-1.0);
        float _844 = fma(_664, _840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _846 = fma(_638, _840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _848 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _852 = _844 + _850;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _856 = _846 + _854;
        float _858 = fma(_770, _836, _848);
        float _860 = _852 * _852;
        float _862 = _856 * _856;
        _814 = _858;
        _804 = _860;
        _800 = _862;
        _796 = _844;
        _808 = _846;
    }
    float _864 = _814;
    float _866 = _804;
    float _868 = _800;
    float _870 = _796;
    float _872 = _808;
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _876 = _864 + _874;
    float _878 = _766 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _880 = _766 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = fma(_746, _738, _790);
    float _884 = fma(_876, _876, _866);
    float _886 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _878);
    float _888 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[117].x, _882);
    float _890 = _884 + _868;
    float _892 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _894 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _896 = sqrt(_890);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _910 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _892);
    float _912 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _886);
    float _914 = _632 + 0.5;
    float _916 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _894);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _920 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _768 + 0.5;
    float _934 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _910;
    out.m_61.y = _912;
    out.m_61.z = _916;
    bool _936 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _938 = isnan(_896);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _944 = _940 || _942;
    out.m_63.x = _926;
    out.m_63.y = _928;
    out.m_63.z = _930;
    out.m_63.w = _918;
    out.m_65.x = _932;
    out.m_65.y = _914;
    out.m_67.x = _920;
    out.m_67.y = _922;
    out.m_67.z = _924;
    out.m_67.w = _934;
    float _946 = _934;
    if (!_944)
    {
        _780 = 1.0;
    }
    float _948 = _780;
    bool _950 = !_944;
    float _952 = _948;
    if (!_950)
    {
        bool _954 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _956 = isnan(_896);
        bool _958 = _954 || _956;
        bool _960 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _962 = _958 || _960;
        if (!_962)
        {
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _966 = _896 + _964;
            float _968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _970 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _968;
            float _972 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _974 = _972 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _976 = 1.0 / _970;
            float _978 = _966 * _976;
            float _980 = fma(_978, _974, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _952 = _980;
            _982 = true;
        }
        else
        {
            bool _984 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _986 = isnan(_896);
            bool _988 = _984 || _986;
            bool _990 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _992 = _988 || _990;
            if (!_992)
            {
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _996 = _896 + _994;
                float _998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1000 = _998 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1002 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1004 = _1002 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1006 = 1.0 / _1000;
                float _1008 = _996 * _1006;
                float _1010 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _952 = _1010;
                _982 = true;
            }
            else
            {
                _952 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _982 = false;
    float _1012 = _952;
    float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1016 = _870 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1020 = _864 + _1018;
    bool _1022 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.5);
    bool _1030 = _1026 || _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1034 = _872 + _1032;
    float _1036 = fma(_1016, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1038 = fma(_1020, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1040 = fma(_1034, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -_462;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1046 = -_460;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _1050 = -_464;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1054 = _1048;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _1036;
    if (!_1030)
    {
        float _1062 = -_460;
        float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
        float _1066 = -_462;
        float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
        float _1070 = -_464;
        float _1072 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _410);
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1078 = _1064 + _1076;
        float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1082 = _1068 + _1080;
        float _1084 = _1078 * _1078;
        float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1088 = _1072 + _1086;
        float _1090 = 1.0 / _548;
        float _1092 = fma(_1082, _1082, _1084);
        float _1094 = -_410;
        float _1096 = _1094 + _1040;
        float _1098 = fma(_1088, _1088, _1092);
        float _1100 = sqrt(_1098);
        float _1102 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1104 = _1102 * _1074;
        float _1106 = -_408;
        float _1108 = _1106 + _1036;
        float _1110 = _1104 * _1090;
        float _1112 = -_406;
        float _1114 = _1112 + _1038;
        float _1116 = fma(_1108, _1110, _1068);
        float _1118 = fma(_1114, _1110, _1064);
        float _1120 = fma(_1096, _1110, _1072);
        _1054 = _1118;
        _1056 = _1116;
        _1058 = _1120;
        _1060 = _1110;
    }
    float _1122 = _1054;
    float _1124 = _1056;
    float _1126 = _1058;
    float _1128 = _1060;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1132 = _1122 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1136 = _1124 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1140 = _1126 + _1138;
    float _1142 = _1132 * _1132;
    float _1144 = fma(_1136, _1136, _1142);
    float _1146 = fma(_1140, _1140, _1144);
    float _1148 = rsqrt(_1146);
    float _1150 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1152 = _1136 * _1150;
    float _1154 = _1140 * _1150;
    float _1156 = _1152 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 + _1158;
    float _1162 = sqrt(_1160);
    bool _1164 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1162 + _1166;
    float _1170 = _1040;
    float _1172 = _1168;
    float _1174 = _1150;
    float _1176 = _1152;
    if (_1164)
    {
        float _1178 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1170 = _1178;
    }
    float _1180 = _1170;
    if (_1164)
    {
        float _1182 = rsqrt(_1160);
        _946 = _1182;
    }
    float _1184 = _946;
    float _1186 = _1184;
    if (_1164)
    {
        float _1188 = _1168 * _1180;
        _1172 = _1188;
    }
    float _1190 = _1172;
    if (_1164)
    {
        float _1192 = _1190 * 0.15915493667125701904296875;
        _494 = _1192;
    }
    float _1194 = _494;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1198 = _1128;
    if (_1164)
    {
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1208 = precise::max(0.0, _1206);
    float _1210 = _924;
    float _1212 = _1208;
    float _1214 = _1206;
    if (_1164)
    {
        float _1216 = _1194 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1210 = _1218;
    }
    float _1220 = _1210;
    float _1222 = -_1150;
    float _1224 = -_1208;
    float _1226 = fma(_1132, _1222, _1224);
    if (_1164)
    {
        float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1228;
    }
    float _1230 = _1212;
    float _1232 = sqrt(_1146);
    float _1234 = _1230;
    float _1236 = _1204;
    if (_1164)
    {
        float _1238 = fma(_1204, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1238;
    }
    float _1240 = _1234;
    float _1242 = _1240;
    if (!_1164)
    {
        _1236 = _1154;
    }
    float _1244 = _1236;
    float _1246 = _1244;
    if (_1164)
    {
        float _1248 = _1220 + (-1.0);
        _1214 = _1248;
    }
    float _1250 = _1214;
    float _1252 = _1250;
    if (_1164)
    {
        float _1254 = _1184 * _1240;
        _1174 = _1254;
    }
    float _1256 = _1174;
    if (!_1164)
    {
        _1186 = _1226;
    }
    float _1258 = _1186;
    float _1260 = _1258;
    if (_1164)
    {
        float _1262 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1262;
    }
    float _1264 = _1252;
    float _1266 = _1264;
    if (_1164)
    {
        float _1268 = _1152 * _1256;
        _1176 = _1268;
    }
    float _1270 = _1176;
    if (!_1164)
    {
        _1242 = _1156;
    }
    float _1272 = _1242;
    float _1274 = _1272;
    if (_1164)
    {
        float _1276 = _1154 * _1256;
        _1246 = _1276;
    }
    float _1278 = _1246;
    if (_1164)
    {
        float _1280 = fma(_1226, _1220, _1264);
        _1260 = _1280;
    }
    float _1282 = _1260;
    if (_1164)
    {
        float _1284 = _1270 * _1270;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (!_1164)
    {
        _1266 = _1158;
    }
    float _1288 = _1266;
    float _1290 = _1288;
    if (_1164)
    {
        float _1292 = _1278 * _1278;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(_1282, _1282, _1286);
    float _1298 = _1296 + _1294;
    float _1300 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1232, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1310 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1312 = rsqrt(_1298);
    float _1314 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1316 = -_1306;
    float _1318 = _1316 + 1.0;
    float _1320 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1310);
    float _1322 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1324 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1314);
    float _1326 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1308);
    float _1328 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = abs(_1318);
    float _1332 = log2(_1330);
    float _1334 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1324);
    float _1336 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1322);
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1340 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1326);
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = -_1338;
    float _1346 = fma(_1344, _1196, 1.0);
    float _1348 = _1312 * _1270;
    float _1350 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1352 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1354 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1356 = _1312 * _1282;
    float _1358 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1360 = _1312 * _1278;
    float _1362 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1354);
    float _1364 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1366 = -_1358;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1366);
    float _1370 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1372 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1362);
    float _1374 = log2(_1346);
    float _1376 = -_1360;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1368);
    float _1380 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1384 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1386 = fma(_1378, -0.5, 0.5);
    float _1388 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1390 = fma(_1378, 0.5, 0.5);
    float _1392 = exp2(_1370);
    float _1394 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1384);
    float _1396 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1388);
    float _1398 = _1356 + 1.0;
    float _1400 = fma(_1390, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1394);
    float _1404 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1396);
    float _1406 = 1.0 / _1382;
    float _1408 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1402);
    float _1410 = fma(_1390, _1400, -0.212114393711090087890625);
    float _1412 = _1374 * 0.693147182464599609375;
    float _1414 = fma(_1390, _1410, 1.570728778839111328125);
    float _1416 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1418 = sqrt(_1386);
    float _1420 = -_1356;
    float _1422 = fma(_1392, _1398, _1420);
    float _1424 = fma(_1422, 0.5, 0.5);
    float _1426 = _1404 * _1406;
    float _1428 = _1408 * _1406;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1418 * 0.636619746685028076171875;
    float3 _3753 = float3(_1430, _1432, _1416);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3753, float3(0.0), isnan(_3753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3753, float3(0.0), isnan(_3753)), level(0.0)).x;
    float3 _3764 = float3(_1430, _1432, _1416);
    float4 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3764, float3(0.0), isnan(_3764)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3764, float3(0.0), isnan(_3764)), level(0.0)).xyzw;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = _1439.w;
    float _1449 = -_1414;
    float _1451 = fma(_1434, _1449, 1.0);
    float2 _3786 = float2(_1451, _1424);
    float3 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3786, float2(0.0), isnan(_3786)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3786, float2(0.0), isnan(_3786)), level(0.0)).xyz;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1465 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1136;
    out.m_69.y = _1132;
    out.m_69.z = _1140;
    float _1467 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1465);
    float _1469 = exp2(_1463);
    float _1471 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1467);
    float _1473 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    float _1475 = _1473 + _1382;
    out.gl_Position.x = _1404;
    out.gl_Position.y = _1408;
    out.gl_Position.z = _1473;
    out.gl_Position.w = _1382;
    float _1477 = _1475 * 0.5;
    float _1479 = -_1469;
    float _1481 = _1479 + 1.0;
    float _1483 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1485 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1477;
    out.m_71.w = _1382;
    out.m_47.x = _1485;
    float _1487 = _1483 * _1436;
    float _1489 = -_1483;
    float _1491 = _1489 + 1.0;
    float _1493 = _1447 * _1487;
    float _1495 = _1461 * _1487;
    float _1497 = fma(_1457, _1493, _1441);
    float _1499 = fma(_1459, _1493, _1443);
    float _1501 = _1447 * _1491;
    float _1503 = fma(_1447, _1495, _1445);
    out.m_73.x = _1497;
    out.m_73.y = _1499;
    out.m_73.z = _1503;
    out.m_73.w = _1501;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _982 = false;
    bool _374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1560 = as_type<float>(_108);
        out.gl_Position.z = _1560;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1629 = as_type<float>(_144);
        out.gl_Position.z = _1629;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    int _164 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _166 = _164 != 0;
    float _168 = _150 * _148;
    float _170 = 0.0;
    float _172 = _152;
    if (!_162)
    {
        float _174 = _152 * _152;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _182 = _178;
    if (!_162)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = -_196;
    float _206 = _180 + _204;
    bool _208 = !_162;
    float _210 = _186;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _152 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _152);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_162;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _152 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _172 = _264;
    }
    float _266 = _172;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _274 = _272 != 0;
    float _276 = in.m_53.w;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = _206 < 0.5;
    float _286 = float(_284);
    float _288 = -_206;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _292 = !_270;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_202, 0.5, 0.5);
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_286;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_166;
    int _306 = _304 ? 0 : 1;
    float _308 = -_296;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_294);
    float _314 = fma(_266, _188, _298);
    bool _316 = !_274;
    int _318 = _316 ? 0 : 1;
    float _320 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _326 = abs(_306);
    float _328 = fma(_266, _190, _320);
    int _330 = abs(_318);
    float _332 = fma(_266, _192, _324);
    float _334 = float(_312);
    float _336 = float(_326);
    float _338 = abs(_290);
    float _340 = _334 * _338;
    float _342 = fma(_314, _276, _278);
    float _344 = fma(_328, _276, _280);
    float _346 = float(_330);
    float _348 = fma(_336, _310, _340);
    float _350 = fma(_332, _276, _282);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_322;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_92);
        float _378 = 1.0 / _376;
        float _380 = _126 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_51.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = in.m_55.y;
    float _400 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _402 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _418 = _406 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _422 = _408 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _426 = _410 + _424;
    float _428 = _418 * _418;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _432 = _430 != 0;
    float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _436 = fma(_422, _422, _428);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _440 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _442 = fma(_426, _426, _436);
    bool _444 = _390 > 0.5;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _454 = rsqrt(_442);
    float _456 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    float _458 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _456);
    float _460 = _418 * _454;
    float _462 = _422 * _454;
    float _464 = _426 * _454;
    float _466 = -_460;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _470 = -_462;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _422);
    float _474 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _476 = -_398;
    float _478 = _476 + 1.0;
    float _480 = _468 * _468;
    float _482 = -_464;
    float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _426);
    float _486 = _448 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = _450 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = fma(_472, _472, _480);
    float _492 = _398;
    float _494 = _408;
    if (_414)
    {
        float _496 = _444 ? _478 : _398;
        _492 = _496;
    }
    float _498 = _492;
    float _500 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _502 = in.m_57.x;
    float _504 = in.m_57.y;
    float _506 = in.m_57.z;
    float _508 = fma(_484, _484, _490);
    float _510 = _354 * _486;
    float _512 = -_438;
    float _514 = fma(_500, 2.0, _512);
    float _516 = sqrt(_508);
    float _518 = _354 * _474;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _522 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = fma(_440, -2.0, _520);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _532 = _354 * _488;
    float _534 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _536 = 1.0 / _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _544 = _146 > 0.5;
    bool _546 = _544 && _432;
    float _548 = _454 * _516;
    float _550 = -_126;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _504);
    float _556 = _548 * _522;
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _560 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _530);
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _502);
    float _564 = _548 * _534;
    float _566 = _554 * _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _568;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _506);
    float _574 = _548 * _542;
    float _576 = 1.0 / _540;
    float _578 = _562 * _564;
    float _580 = _566 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _582 = _572 * _574;
    float _584 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _560);
    float _586 = in.m_55.x;
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _580);
    bool _590 = _504 != 0.0;
    bool _592 = isnan(_504);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = _566 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _608 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _610 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _528);
    float _612 = fma(_600, _498, -0.5);
    float _614 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _606);
    float _616 = _410 + _608;
    bool _618 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = isnan(_382);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -_610;
    float _632 = fma(_458, _612, _630);
    float _634 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[8].z, _614);
    float _636 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _638 = _616 + _636;
    float _640 = in.m_59.x;
    float _642 = in.m_59.y;
    float _644 = in.m_59.z;
    bool _646 = _502 == 0.0;
    bool _648 = !_598;
    bool _650 = _646 && _648;
    float _652 = _408 + _634;
    float _654 = _638 * _638;
    float _656 = _570 * _536;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _382 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _664 = _652 + _662;
    float _666 = _604 * _576;
    bool _668 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _670 = isnan(_382);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_628;
    float _682 = _680 + 1.0;
    float _684 = _664 * _664;
    float _686 = 0.0;
    float _688 = _586;
    float _690 = _504;
    float _692 = _502;
    float _694 = _652;
    if (_432)
    {
        _686 = _586;
    }
    float _696 = _686;
    float _698 = _566 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _700 = _506 == 0.0;
    bool _702 = _700 && _650;
    float _704 = _684 + _654;
    float _706 = fma(_656, _660, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _708 = _696;
    if (_546)
    {
        float _710 = -_696;
        float _712 = _710 + 1.0;
        _708 = _712;
    }
    float _714 = _708;
    bool _716 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _718 = isnan(_382);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = sqrt(_704);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _382 + _730;
    float _734 = _434 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_432)
    {
        _688 = _714;
    }
    float _736 = _688;
    float _738 = _678 * _682;
    float _740 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _698);
    float _742 = -_678;
    float _744 = _742 + 1.0;
    float _746 = fma(_666, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_734, _736, -0.5);
    float _750 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[9].z, _740);
    float _752 = _726 * _744;
    float _754 = _642;
    float _756 = _640;
    float _758 = _644;
    float _760 = _740;
    float _762 = _750;
    if (!_702)
    {
        float _764 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _754 = _764;
    }
    float _766 = _754;
    float _768 = fma(_584, _748, _552);
    float _770 = _406 + _750;
    float _772 = _706 * _752;
    float _774 = -_726;
    float _776 = _774 + 1.0;
    bool _778 = _728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = _768;
    if (!_702)
    {
        float _782 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _756 = _782;
    }
    float _784 = _756;
    if (!_702)
    {
        float _786 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _644);
        _758 = _786;
    }
    float _788 = _758;
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _792 = _766 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_778)
    {
        _760 = _652;
    }
    float _794 = _760;
    float _796 = _794;
    if (!_778)
    {
        _690 = _654;
    }
    float _798 = _690;
    float _800 = _798;
    if (!_778)
    {
        _692 = _684;
    }
    float _802 = _692;
    float _804 = _802;
    if (!_778)
    {
        _762 = _616;
    }
    float _806 = _762;
    float _808 = _806;
    if (!_778)
    {
        _694 = _770;
    }
    float _810 = _694;
    bool _812 = !_778;
    float _814 = _810;
    if (!_812)
    {
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _820 = _728 + _818;
        float _822 = _770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = rsqrt(_704);
        float _826 = _820 * _816;
        float _828 = _826 * 0.15915493667125701904296875;
        float _830 = _828 * 6.283185482025146484375;
        float _832 = sin(_830);
        float _834 = _828 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = fma(_832, _822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _840 = _824 * _838;
        float _842 = _836 + (-1.0);
        float _844 = fma(_664, _840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _846 = fma(_638, _840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _848 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _852 = _844 + _850;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _856 = _846 + _854;
        float _858 = fma(_770, _836, _848);
        float _860 = _852 * _852;
        float _862 = _856 * _856;
        _814 = _858;
        _804 = _860;
        _800 = _862;
        _796 = _844;
        _808 = _846;
    }
    float _864 = _814;
    float _866 = _804;
    float _868 = _800;
    float _870 = _796;
    float _872 = _808;
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _876 = _864 + _874;
    float _878 = _766 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _880 = _766 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = fma(_746, _738, _790);
    float _884 = fma(_876, _876, _866);
    float _886 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _878);
    float _888 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[117].x, _882);
    float _890 = _884 + _868;
    float _892 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _894 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _896 = sqrt(_890);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _910 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _892);
    float _912 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _886);
    float _914 = _632 + 0.5;
    float _916 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _894);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _920 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _768 + 0.5;
    float _934 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _910;
    out.m_61.y = _912;
    out.m_61.z = _916;
    bool _936 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _938 = isnan(_896);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _944 = _940 || _942;
    out.m_63.x = _926;
    out.m_63.y = _928;
    out.m_63.z = _930;
    out.m_63.w = _918;
    out.m_65.x = _932;
    out.m_65.y = _914;
    out.m_67.x = _920;
    out.m_67.y = _922;
    out.m_67.z = _924;
    out.m_67.w = _934;
    float _946 = _934;
    if (!_944)
    {
        _780 = 1.0;
    }
    float _948 = _780;
    bool _950 = !_944;
    float _952 = _948;
    if (!_950)
    {
        bool _954 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _956 = isnan(_896);
        bool _958 = _954 || _956;
        bool _960 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _962 = _958 || _960;
        if (!_962)
        {
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _966 = _896 + _964;
            float _968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _970 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _968;
            float _972 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _974 = _972 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _976 = 1.0 / _970;
            float _978 = _966 * _976;
            float _980 = fma(_978, _974, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _952 = _980;
            _982 = true;
        }
        else
        {
            bool _984 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _986 = isnan(_896);
            bool _988 = _984 || _986;
            bool _990 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _992 = _988 || _990;
            if (!_992)
            {
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _996 = _896 + _994;
                float _998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1000 = _998 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1002 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1004 = _1002 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1006 = 1.0 / _1000;
                float _1008 = _996 * _1006;
                float _1010 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _952 = _1010;
                _982 = true;
            }
            else
            {
                _952 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _982 = false;
    float _1012 = _952;
    float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1016 = _870 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1020 = _864 + _1018;
    bool _1022 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.5);
    bool _1030 = _1026 || _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1034 = _872 + _1032;
    float _1036 = fma(_1016, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1038 = fma(_1020, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1040 = fma(_1034, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -_462;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1046 = -_460;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _1050 = -_464;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1054 = _1048;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _1036;
    if (!_1030)
    {
        float _1062 = -_460;
        float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
        float _1066 = -_462;
        float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
        float _1070 = -_464;
        float _1072 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _410);
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1078 = _1064 + _1076;
        float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1082 = _1068 + _1080;
        float _1084 = _1078 * _1078;
        float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1088 = _1072 + _1086;
        float _1090 = 1.0 / _548;
        float _1092 = fma(_1082, _1082, _1084);
        float _1094 = -_410;
        float _1096 = _1094 + _1040;
        float _1098 = fma(_1088, _1088, _1092);
        float _1100 = sqrt(_1098);
        float _1102 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1104 = _1102 * _1074;
        float _1106 = -_408;
        float _1108 = _1106 + _1036;
        float _1110 = _1104 * _1090;
        float _1112 = -_406;
        float _1114 = _1112 + _1038;
        float _1116 = fma(_1108, _1110, _1068);
        float _1118 = fma(_1114, _1110, _1064);
        float _1120 = fma(_1096, _1110, _1072);
        _1054 = _1118;
        _1056 = _1116;
        _1058 = _1120;
        _1060 = _1110;
    }
    float _1122 = _1054;
    float _1124 = _1056;
    float _1126 = _1058;
    float _1128 = _1060;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1132 = _1122 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1136 = _1124 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1140 = _1126 + _1138;
    float _1142 = _1132 * _1132;
    float _1144 = fma(_1136, _1136, _1142);
    float _1146 = fma(_1140, _1140, _1144);
    float _1148 = rsqrt(_1146);
    float _1150 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1152 = _1136 * _1150;
    float _1154 = _1140 * _1150;
    float _1156 = _1152 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 + _1158;
    float _1162 = sqrt(_1160);
    bool _1164 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1162 + _1166;
    float _1170 = _1040;
    float _1172 = _1168;
    float _1174 = _1150;
    float _1176 = _1152;
    if (_1164)
    {
        float _1178 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1170 = _1178;
    }
    float _1180 = _1170;
    if (_1164)
    {
        float _1182 = rsqrt(_1160);
        _946 = _1182;
    }
    float _1184 = _946;
    float _1186 = _1184;
    if (_1164)
    {
        float _1188 = _1168 * _1180;
        _1172 = _1188;
    }
    float _1190 = _1172;
    if (_1164)
    {
        float _1192 = _1190 * 0.15915493667125701904296875;
        _494 = _1192;
    }
    float _1194 = _494;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1198 = _1128;
    if (_1164)
    {
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1208 = precise::max(0.0, _1206);
    float _1210 = _924;
    float _1212 = _1208;
    float _1214 = _1206;
    if (_1164)
    {
        float _1216 = _1194 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1210 = _1218;
    }
    float _1220 = _1210;
    float _1222 = -_1150;
    float _1224 = -_1208;
    float _1226 = fma(_1132, _1222, _1224);
    if (_1164)
    {
        float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1228;
    }
    float _1230 = _1212;
    float _1232 = sqrt(_1146);
    float _1234 = _1230;
    float _1236 = _1204;
    if (_1164)
    {
        float _1238 = fma(_1204, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1238;
    }
    float _1240 = _1234;
    float _1242 = _1240;
    if (!_1164)
    {
        _1236 = _1154;
    }
    float _1244 = _1236;
    float _1246 = _1244;
    if (_1164)
    {
        float _1248 = _1220 + (-1.0);
        _1214 = _1248;
    }
    float _1250 = _1214;
    float _1252 = _1250;
    if (_1164)
    {
        float _1254 = _1184 * _1240;
        _1174 = _1254;
    }
    float _1256 = _1174;
    if (!_1164)
    {
        _1186 = _1226;
    }
    float _1258 = _1186;
    float _1260 = _1258;
    if (_1164)
    {
        float _1262 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1262;
    }
    float _1264 = _1252;
    float _1266 = _1264;
    if (_1164)
    {
        float _1268 = _1152 * _1256;
        _1176 = _1268;
    }
    float _1270 = _1176;
    if (!_1164)
    {
        _1242 = _1156;
    }
    float _1272 = _1242;
    float _1274 = _1272;
    if (_1164)
    {
        float _1276 = _1154 * _1256;
        _1246 = _1276;
    }
    float _1278 = _1246;
    if (_1164)
    {
        float _1280 = fma(_1226, _1220, _1264);
        _1260 = _1280;
    }
    float _1282 = _1260;
    if (_1164)
    {
        float _1284 = _1270 * _1270;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (!_1164)
    {
        _1266 = _1158;
    }
    float _1288 = _1266;
    float _1290 = _1288;
    if (_1164)
    {
        float _1292 = _1278 * _1278;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(_1282, _1282, _1286);
    float _1298 = _1296 + _1294;
    float _1300 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1232, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1310 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1312 = rsqrt(_1298);
    float _1314 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1316 = -_1306;
    float _1318 = _1316 + 1.0;
    float _1320 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1310);
    float _1322 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1324 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1314);
    float _1326 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1308);
    float _1328 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = abs(_1318);
    float _1332 = log2(_1330);
    float _1334 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1324);
    float _1336 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1322);
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1340 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1326);
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = -_1338;
    float _1346 = fma(_1344, _1196, 1.0);
    float _1348 = _1312 * _1270;
    float _1350 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1352 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1354 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1356 = _1312 * _1282;
    float _1358 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1360 = _1312 * _1278;
    float _1362 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1354);
    float _1364 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1366 = -_1358;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1366);
    float _1370 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1372 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1362);
    float _1374 = log2(_1346);
    float _1376 = -_1360;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1368);
    float _1380 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1384 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1386 = fma(_1378, -0.5, 0.5);
    float _1388 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1390 = fma(_1378, 0.5, 0.5);
    float _1392 = exp2(_1370);
    float _1394 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1384);
    float _1396 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1388);
    float _1398 = _1356 + 1.0;
    float _1400 = fma(_1390, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1394);
    float _1404 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1396);
    float _1406 = 1.0 / _1382;
    float _1408 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1402);
    float _1410 = fma(_1390, _1400, -0.212114393711090087890625);
    float _1412 = _1374 * 0.693147182464599609375;
    float _1414 = fma(_1390, _1410, 1.570728778839111328125);
    float _1416 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1418 = sqrt(_1386);
    float _1420 = -_1356;
    float _1422 = fma(_1392, _1398, _1420);
    float _1424 = fma(_1422, 0.5, 0.5);
    float _1426 = _1404 * _1406;
    float _1428 = _1408 * _1406;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1418 * 0.636619746685028076171875;
    float3 _3753 = float3(_1430, _1432, _1416);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3753, float3(0.0), isnan(_3753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3753, float3(0.0), isnan(_3753)), level(0.0)).x;
    float3 _3764 = float3(_1430, _1432, _1416);
    float4 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3764, float3(0.0), isnan(_3764)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3764, float3(0.0), isnan(_3764)), level(0.0)).xyzw;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = _1439.w;
    float _1449 = -_1414;
    float _1451 = fma(_1434, _1449, 1.0);
    float2 _3786 = float2(_1451, _1424);
    float3 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3786, float2(0.0), isnan(_3786)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3786, float2(0.0), isnan(_3786)), level(0.0)).xyz;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1465 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1136;
    out.m_69.y = _1132;
    out.m_69.z = _1140;
    float _1467 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1465);
    float _1469 = exp2(_1463);
    float _1471 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1467);
    float _1473 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    float _1475 = _1473 + _1382;
    out.gl_Position.x = _1404;
    out.gl_Position.y = _1408;
    out.gl_Position.z = _1473;
    out.gl_Position.w = _1382;
    float _1477 = _1475 * 0.5;
    float _1479 = -_1469;
    float _1481 = _1479 + 1.0;
    float _1483 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1485 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1477;
    out.m_71.w = _1382;
    out.m_47.x = _1485;
    float _1487 = _1483 * _1436;
    float _1489 = -_1483;
    float _1491 = _1489 + 1.0;
    float _1493 = _1447 * _1487;
    float _1495 = _1461 * _1487;
    float _1497 = fma(_1457, _1493, _1441);
    float _1499 = fma(_1459, _1493, _1443);
    float _1501 = _1447 * _1491;
    float _1503 = fma(_1447, _1495, _1445);
    out.m_73.x = _1497;
    out.m_73.y = _1499;
    out.m_73.z = _1503;
    out.m_73.w = _1501;
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
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _982 = false;
    bool _374 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1560 = as_type<float>(_108);
        out.gl_Position.z = _1560;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_122)
    {
        float _128 = float(_92);
        _102 = _128;
    }
    float _130 = _102;
    bool _132 = _126 >= _130;
    bool _134 = !_122;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1629 = as_type<float>(_144);
        out.gl_Position.z = _1629;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    int _164 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _166 = _164 != 0;
    float _168 = _150 * _148;
    float _170 = 0.0;
    float _172 = _152;
    if (!_162)
    {
        float _174 = _152 * _152;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _182 = _178;
    if (!_162)
    {
        float _184 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = floor(_180);
    float _198 = _194 * 0.15915493667125701904296875;
    float _200 = _198 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = -_196;
    float _206 = _180 + _204;
    bool _208 = !_162;
    float _210 = _186;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _152 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _152);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_162;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _152 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _172 = _264;
    }
    float _266 = _172;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _270 = _268 != 0;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _274 = _272 != 0;
    float _276 = in.m_53.w;
    float _278 = in.m_44.x;
    float _280 = in.m_44.y;
    float _282 = in.m_44.z;
    bool _284 = _206 < 0.5;
    float _286 = float(_284);
    float _288 = -_206;
    float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _292 = !_270;
    int _294 = _292 ? 0 : 1;
    float _296 = fma(_202, 0.5, 0.5);
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_286;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_166;
    int _306 = _304 ? 0 : 1;
    float _308 = -_296;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_294);
    float _314 = fma(_266, _188, _298);
    bool _316 = !_274;
    int _318 = _316 ? 0 : 1;
    float _320 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _326 = abs(_306);
    float _328 = fma(_266, _190, _320);
    int _330 = abs(_318);
    float _332 = fma(_266, _192, _324);
    float _334 = float(_312);
    float _336 = float(_326);
    float _338 = abs(_290);
    float _340 = _334 * _338;
    float _342 = fma(_314, _276, _278);
    float _344 = fma(_328, _276, _280);
    float _346 = float(_330);
    float _348 = fma(_336, _310, _340);
    float _350 = fma(_332, _276, _282);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_322;
    float _372;
    if (!_356)
    {
        float _358 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _360 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _364 = _362 * _358;
        float _366 = floor(_364);
        float _368 = -_366;
        float _370 = _364 + _368;
        _372 = _370;
        _374 = true;
    }
    else
    {
        float _376 = float(_92);
        float _378 = 1.0 / _376;
        float _380 = _126 * _378;
        _372 = _380;
    }
    _374 = false;
    float _382 = _372;
    float _384 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_51.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = in.m_55.y;
    float _400 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _402 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _404 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _406 = _400 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _402 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _404 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _414 = _412 != 0;
    float _416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _418 = _406 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _422 = _408 + _420;
    float _424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _426 = _410 + _424;
    float _428 = _418 * _418;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _432 = _430 != 0;
    float _434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _436 = fma(_422, _422, _428);
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _440 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _442 = fma(_426, _426, _436);
    bool _444 = _390 > 0.5;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _454 = rsqrt(_442);
    float _456 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _452);
    float _458 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _456);
    float _460 = _418 * _454;
    float _462 = _422 * _454;
    float _464 = _426 * _454;
    float _466 = -_460;
    float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _418);
    float _470 = -_462;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _422);
    float _474 = _446 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _476 = -_398;
    float _478 = _476 + 1.0;
    float _480 = _468 * _468;
    float _482 = -_464;
    float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[18].w, _426);
    float _486 = _448 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = _450 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = fma(_472, _472, _480);
    float _492 = _398;
    float _494 = _408;
    if (_414)
    {
        float _496 = _444 ? _478 : _398;
        _492 = _496;
    }
    float _498 = _492;
    float _500 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _502 = in.m_57.x;
    float _504 = in.m_57.y;
    float _506 = in.m_57.z;
    float _508 = fma(_484, _484, _490);
    float _510 = _354 * _486;
    float _512 = -_438;
    float _514 = fma(_500, 2.0, _512);
    float _516 = sqrt(_508);
    float _518 = _354 * _474;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _522 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = fma(_440, -2.0, _520);
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _532 = _354 * _488;
    float _534 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _536 = 1.0 / _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _542 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _544 = _146 > 0.5;
    bool _546 = _544 && _432;
    float _548 = _454 * _516;
    float _550 = -_126;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _514);
    float _554 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _504);
    float _556 = _548 * _522;
    float _558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _560 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _530);
    float _562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _502);
    float _564 = _548 * _534;
    float _566 = _554 * _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _568;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _506);
    float _574 = _548 * _542;
    float _576 = 1.0 / _540;
    float _578 = _562 * _564;
    float _580 = _566 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _582 = _572 * _574;
    float _584 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _560);
    float _586 = in.m_55.x;
    float _588 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[10].x, _580);
    bool _590 = _504 != 0.0;
    bool _592 = isnan(_504);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _558 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = _566 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _608 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[10].z, _588);
    float _610 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _528);
    float _612 = fma(_600, _498, -0.5);
    float _614 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[8].x, _606);
    float _616 = _410 + _608;
    bool _618 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = isnan(_382);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = -_610;
    float _632 = fma(_458, _612, _630);
    float _634 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[8].z, _614);
    float _636 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _638 = _616 + _636;
    float _640 = in.m_59.x;
    float _642 = in.m_59.y;
    float _644 = in.m_59.z;
    bool _646 = _502 == 0.0;
    bool _648 = !_598;
    bool _650 = _646 && _648;
    float _652 = _408 + _634;
    float _654 = _638 * _638;
    float _656 = _570 * _536;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _382 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _664 = _652 + _662;
    float _666 = _604 * _576;
    bool _668 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _670 = isnan(_382);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -_628;
    float _682 = _680 + 1.0;
    float _684 = _664 * _664;
    float _686 = 0.0;
    float _688 = _586;
    float _690 = _504;
    float _692 = _502;
    float _694 = _652;
    if (_432)
    {
        _686 = _586;
    }
    float _696 = _686;
    float _698 = _566 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _700 = _506 == 0.0;
    bool _702 = _700 && _650;
    float _704 = _684 + _654;
    float _706 = fma(_656, _660, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _708 = _696;
    if (_546)
    {
        float _710 = -_696;
        float _712 = _710 + 1.0;
        _708 = _712;
    }
    float _714 = _708;
    bool _716 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _718 = isnan(_382);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = sqrt(_704);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _732 = _382 + _730;
    float _734 = _434 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_432)
    {
        _688 = _714;
    }
    float _736 = _688;
    float _738 = _678 * _682;
    float _740 = fma(_578, (*spvDescriptorSet0.vp_c10)._m0[9].x, _698);
    float _742 = -_678;
    float _744 = _742 + 1.0;
    float _746 = fma(_666, _732, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _748 = fma(_734, _736, -0.5);
    float _750 = fma(_582, (*spvDescriptorSet0.vp_c10)._m0[9].z, _740);
    float _752 = _726 * _744;
    float _754 = _642;
    float _756 = _640;
    float _758 = _644;
    float _760 = _740;
    float _762 = _750;
    if (!_702)
    {
        float _764 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[17].y, _642);
        _754 = _764;
    }
    float _766 = _754;
    float _768 = fma(_584, _748, _552);
    float _770 = _406 + _750;
    float _772 = _706 * _752;
    float _774 = -_726;
    float _776 = _774 + 1.0;
    bool _778 = _728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _780 = _768;
    if (!_702)
    {
        float _782 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _640);
        _756 = _782;
    }
    float _784 = _756;
    if (!_702)
    {
        float _786 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[17].y, _644);
        _758 = _786;
    }
    float _788 = _758;
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[115].x, _772);
    float _792 = _766 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (!_778)
    {
        _760 = _652;
    }
    float _794 = _760;
    float _796 = _794;
    if (!_778)
    {
        _690 = _654;
    }
    float _798 = _690;
    float _800 = _798;
    if (!_778)
    {
        _692 = _684;
    }
    float _802 = _692;
    float _804 = _802;
    if (!_778)
    {
        _762 = _616;
    }
    float _806 = _762;
    float _808 = _806;
    if (!_778)
    {
        _694 = _770;
    }
    float _810 = _694;
    bool _812 = !_778;
    float _814 = _810;
    if (!_812)
    {
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _820 = _728 + _818;
        float _822 = _770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = rsqrt(_704);
        float _826 = _820 * _816;
        float _828 = _826 * 0.15915493667125701904296875;
        float _830 = _828 * 6.283185482025146484375;
        float _832 = sin(_830);
        float _834 = _828 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = fma(_832, _822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _840 = _824 * _838;
        float _842 = _836 + (-1.0);
        float _844 = fma(_664, _840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _846 = fma(_638, _840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _848 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _852 = _844 + _850;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _856 = _846 + _854;
        float _858 = fma(_770, _836, _848);
        float _860 = _852 * _852;
        float _862 = _856 * _856;
        _814 = _858;
        _804 = _860;
        _800 = _862;
        _796 = _844;
        _808 = _846;
    }
    float _864 = _814;
    float _866 = _804;
    float _868 = _800;
    float _870 = _796;
    float _872 = _808;
    float _874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _876 = _864 + _874;
    float _878 = _766 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _880 = _766 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _882 = fma(_746, _738, _790);
    float _884 = fma(_876, _876, _866);
    float _886 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[9].x, _878);
    float _888 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[117].x, _882);
    float _890 = _884 + _868;
    float _892 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _894 = fma(_784, (*spvDescriptorSet0.vp_c10)._m0[10].x, _880);
    float _896 = sqrt(_890);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _910 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[8].z, _892);
    float _912 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[9].z, _886);
    float _914 = _632 + 0.5;
    float _916 = fma(_788, (*spvDescriptorSet0.vp_c10)._m0[10].z, _894);
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _920 = _898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _768 + 0.5;
    float _934 = _888 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _910;
    out.m_61.y = _912;
    out.m_61.z = _916;
    bool _936 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _938 = isnan(_896);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _944 = _940 || _942;
    out.m_63.x = _926;
    out.m_63.y = _928;
    out.m_63.z = _930;
    out.m_63.w = _918;
    out.m_65.x = _932;
    out.m_65.y = _914;
    out.m_67.x = _920;
    out.m_67.y = _922;
    out.m_67.z = _924;
    out.m_67.w = _934;
    float _946 = _934;
    if (!_944)
    {
        _780 = 1.0;
    }
    float _948 = _780;
    bool _950 = !_944;
    float _952 = _948;
    if (!_950)
    {
        bool _954 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _956 = isnan(_896);
        bool _958 = _954 || _956;
        bool _960 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _962 = _958 || _960;
        if (!_962)
        {
            float _964 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _966 = _896 + _964;
            float _968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _970 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _968;
            float _972 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _974 = _972 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _976 = 1.0 / _970;
            float _978 = _966 * _976;
            float _980 = fma(_978, _974, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _952 = _980;
            _982 = true;
        }
        else
        {
            bool _984 = _896 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _986 = isnan(_896);
            bool _988 = _984 || _986;
            bool _990 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _992 = _988 || _990;
            if (!_992)
            {
                float _994 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _996 = _896 + _994;
                float _998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1000 = _998 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1002 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1004 = _1002 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1006 = 1.0 / _1000;
                float _1008 = _996 * _1006;
                float _1010 = fma(_1008, _1004, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _952 = _1010;
                _982 = true;
            }
            else
            {
                _952 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _982 = false;
    float _1012 = _952;
    float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1016 = _870 + _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1020 = _864 + _1018;
    bool _1022 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.5);
    bool _1030 = _1026 || _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1034 = _872 + _1032;
    float _1036 = fma(_1016, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1038 = fma(_1020, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1040 = fma(_1034, _1012, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1042 = -_462;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1046 = -_460;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1038);
    float _1050 = -_464;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1054 = _1048;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _1036;
    if (!_1030)
    {
        float _1062 = -_460;
        float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
        float _1066 = -_462;
        float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
        float _1070 = -_464;
        float _1072 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _410);
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1078 = _1064 + _1076;
        float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1082 = _1068 + _1080;
        float _1084 = _1078 * _1078;
        float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1088 = _1072 + _1086;
        float _1090 = 1.0 / _548;
        float _1092 = fma(_1082, _1082, _1084);
        float _1094 = -_410;
        float _1096 = _1094 + _1040;
        float _1098 = fma(_1088, _1088, _1092);
        float _1100 = sqrt(_1098);
        float _1102 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1104 = _1102 * _1074;
        float _1106 = -_408;
        float _1108 = _1106 + _1036;
        float _1110 = _1104 * _1090;
        float _1112 = -_406;
        float _1114 = _1112 + _1038;
        float _1116 = fma(_1108, _1110, _1068);
        float _1118 = fma(_1114, _1110, _1064);
        float _1120 = fma(_1096, _1110, _1072);
        _1054 = _1118;
        _1056 = _1116;
        _1058 = _1120;
        _1060 = _1110;
    }
    float _1122 = _1054;
    float _1124 = _1056;
    float _1126 = _1058;
    float _1128 = _1060;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1132 = _1122 + _1130;
    float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1136 = _1124 + _1134;
    float _1138 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1140 = _1126 + _1138;
    float _1142 = _1132 * _1132;
    float _1144 = fma(_1136, _1136, _1142);
    float _1146 = fma(_1140, _1140, _1144);
    float _1148 = rsqrt(_1146);
    float _1150 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1152 = _1136 * _1150;
    float _1154 = _1140 * _1150;
    float _1156 = _1152 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 + _1158;
    float _1162 = sqrt(_1160);
    bool _1164 = _1162 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = _1162 + _1166;
    float _1170 = _1040;
    float _1172 = _1168;
    float _1174 = _1150;
    float _1176 = _1152;
    if (_1164)
    {
        float _1178 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1170 = _1178;
    }
    float _1180 = _1170;
    if (_1164)
    {
        float _1182 = rsqrt(_1160);
        _946 = _1182;
    }
    float _1184 = _946;
    float _1186 = _1184;
    if (_1164)
    {
        float _1188 = _1168 * _1180;
        _1172 = _1188;
    }
    float _1190 = _1172;
    if (_1164)
    {
        float _1192 = _1190 * 0.15915493667125701904296875;
        _494 = _1192;
    }
    float _1194 = _494;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1198 = _1128;
    if (_1164)
    {
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1208 = precise::max(0.0, _1206);
    float _1210 = _924;
    float _1212 = _1208;
    float _1214 = _1206;
    if (_1164)
    {
        float _1216 = _1194 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1210 = _1218;
    }
    float _1220 = _1210;
    float _1222 = -_1150;
    float _1224 = -_1208;
    float _1226 = fma(_1132, _1222, _1224);
    if (_1164)
    {
        float _1228 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1212 = _1228;
    }
    float _1230 = _1212;
    float _1232 = sqrt(_1146);
    float _1234 = _1230;
    float _1236 = _1204;
    if (_1164)
    {
        float _1238 = fma(_1204, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1238;
    }
    float _1240 = _1234;
    float _1242 = _1240;
    if (!_1164)
    {
        _1236 = _1154;
    }
    float _1244 = _1236;
    float _1246 = _1244;
    if (_1164)
    {
        float _1248 = _1220 + (-1.0);
        _1214 = _1248;
    }
    float _1250 = _1214;
    float _1252 = _1250;
    if (_1164)
    {
        float _1254 = _1184 * _1240;
        _1174 = _1254;
    }
    float _1256 = _1174;
    if (!_1164)
    {
        _1186 = _1226;
    }
    float _1258 = _1186;
    float _1260 = _1258;
    if (_1164)
    {
        float _1262 = _1250 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1262;
    }
    float _1264 = _1252;
    float _1266 = _1264;
    if (_1164)
    {
        float _1268 = _1152 * _1256;
        _1176 = _1268;
    }
    float _1270 = _1176;
    if (!_1164)
    {
        _1242 = _1156;
    }
    float _1272 = _1242;
    float _1274 = _1272;
    if (_1164)
    {
        float _1276 = _1154 * _1256;
        _1246 = _1276;
    }
    float _1278 = _1246;
    if (_1164)
    {
        float _1280 = fma(_1226, _1220, _1264);
        _1260 = _1280;
    }
    float _1282 = _1260;
    if (_1164)
    {
        float _1284 = _1270 * _1270;
        _1274 = _1284;
    }
    float _1286 = _1274;
    if (!_1164)
    {
        _1266 = _1158;
    }
    float _1288 = _1266;
    float _1290 = _1288;
    if (_1164)
    {
        float _1292 = _1278 * _1278;
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = fma(_1282, _1282, _1286);
    float _1298 = _1296 + _1294;
    float _1300 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1304 = fma(_1232, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1302);
    float _1306 = precise::clamp(_1304, 0.0, 1.0);
    float _1308 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1310 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1300);
    float _1312 = rsqrt(_1298);
    float _1314 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1316 = -_1306;
    float _1318 = _1316 + 1.0;
    float _1320 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1310);
    float _1322 = _1122 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1324 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1314);
    float _1326 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1308);
    float _1328 = _1320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1330 = abs(_1318);
    float _1332 = log2(_1330);
    float _1334 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1324);
    float _1336 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1322);
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1340 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1326);
    float _1342 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1344 = -_1338;
    float _1346 = fma(_1344, _1196, 1.0);
    float _1348 = _1312 * _1270;
    float _1350 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1336);
    float _1352 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1354 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1356 = _1312 * _1282;
    float _1358 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1360 = _1312 * _1278;
    float _1362 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1354);
    float _1364 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1366 = -_1358;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1366);
    float _1370 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1372 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1362);
    float _1374 = log2(_1346);
    float _1376 = -_1360;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1368);
    float _1380 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1372);
    float _1384 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1386 = fma(_1378, -0.5, 0.5);
    float _1388 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1390 = fma(_1378, 0.5, 0.5);
    float _1392 = exp2(_1370);
    float _1394 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1384);
    float _1396 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1388);
    float _1398 = _1356 + 1.0;
    float _1400 = fma(_1390, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1394);
    float _1404 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1396);
    float _1406 = 1.0 / _1382;
    float _1408 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1402);
    float _1410 = fma(_1390, _1400, -0.212114393711090087890625);
    float _1412 = _1374 * 0.693147182464599609375;
    float _1414 = fma(_1390, _1410, 1.570728778839111328125);
    float _1416 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1418 = sqrt(_1386);
    float _1420 = -_1356;
    float _1422 = fma(_1392, _1398, _1420);
    float _1424 = fma(_1422, 0.5, 0.5);
    float _1426 = _1404 * _1406;
    float _1428 = _1408 * _1406;
    float _1430 = fma(_1426, 0.5, 0.5);
    float _1432 = fma(_1428, -0.5, 0.5);
    float _1434 = _1418 * 0.636619746685028076171875;
    float3 _3753 = float3(_1430, _1432, _1416);
    float _1436 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3753, float3(0.0), isnan(_3753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3753, float3(0.0), isnan(_3753)), level(0.0)).x;
    float3 _3764 = float3(_1430, _1432, _1416);
    float4 _1439 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3764, float3(0.0), isnan(_3764)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3764, float3(0.0), isnan(_3764)), level(0.0)).xyzw;
    float _1441 = _1439.x;
    float _1443 = _1439.y;
    float _1445 = _1439.z;
    float _1447 = _1439.w;
    float _1449 = -_1414;
    float _1451 = fma(_1434, _1449, 1.0);
    float2 _3786 = float2(_1451, _1424);
    float3 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3786, float2(0.0), isnan(_3786)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3786, float2(0.0), isnan(_3786)), level(0.0)).xyz;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1465 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1136;
    out.m_69.y = _1132;
    out.m_69.z = _1140;
    float _1467 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1465);
    float _1469 = exp2(_1463);
    float _1471 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1467);
    float _1473 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    float _1475 = _1473 + _1382;
    out.gl_Position.x = _1404;
    out.gl_Position.y = _1408;
    out.gl_Position.z = _1473;
    out.gl_Position.w = _1382;
    float _1477 = _1475 * 0.5;
    float _1479 = -_1469;
    float _1481 = _1479 + 1.0;
    float _1483 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1485 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1477;
    out.m_71.w = _1382;
    out.m_47.x = _1485;
    float _1487 = _1483 * _1436;
    float _1489 = -_1483;
    float _1491 = _1489 + 1.0;
    float _1493 = _1447 * _1487;
    float _1495 = _1461 * _1487;
    float _1497 = fma(_1457, _1493, _1441);
    float _1499 = fma(_1459, _1493, _1443);
    float _1501 = _1447 * _1491;
    float _1503 = fma(_1447, _1495, _1445);
    out.m_73.x = _1497;
    out.m_73.y = _1499;
    out.m_73.z = _1503;
    out.m_73.w = _1501;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

