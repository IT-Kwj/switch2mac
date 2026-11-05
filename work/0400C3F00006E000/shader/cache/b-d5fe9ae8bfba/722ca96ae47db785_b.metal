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
    float4 m_65 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1026 = false;
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
        float _1600 = as_type<float>(_108);
        out.gl_Position.z = _1600;
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
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1668 = as_type<float>(_144);
        out.gl_Position.z = _1668;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_336, _268, _292);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_324, _268, _290);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
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
    float _384 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_51.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _400 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _402 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _404 = in.m_53.y;
    float _406 = _398 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _400 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _412 = in.m_55.y;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _406 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _420 = _408 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _424 = _410 + _422;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _428 = _416 * _416;
    float _430 = in.m_53.x;
    float _432 = fma(_420, _420, _428);
    float _434 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _438 = _436 != 0;
    float _440 = in.m_51.z;
    float _442 = fma(_424, _424, _432);
    float _444 = -_426;
    float _446 = fma(_434, 2.0, _444);
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = _126 * (-0.00999999977648258209228515625);
    float _454 = _126 * 0.010999999940395355224609375;
    float _456 = rsqrt(_442);
    float _458 = fma(_390, 6.283185482025146484375, _452);
    float _460 = fma(_146, 6.283185482025146484375, _454);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _466 = _458 + _412;
    float _468 = _460 + _412;
    float _470 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _472 = in.m_53.z;
    float _474 = _466 * 81.6814117431640625;
    float _476 = _468 * 56.54866790771484375;
    float _478 = fma(_470, -2.0, _464);
    bool _480 = _146 > 0.5;
    bool _482 = _480 && _438;
    float _484 = _474 * 0.15915493667125701904296875;
    float _486 = _476 * 0.15915493667125701904296875;
    float _488 = _416 * _456;
    float _490 = _420 * _456;
    float _492 = _424 * _456;
    float _494 = _484 * 6.283185482025146484375;
    float _496 = sin(_494);
    float _498 = -_488;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _502 = -_490;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _420);
    float _506 = -_492;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _424);
    float _510 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _512 = _500 * _500;
    float _514 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _462);
    float _516 = _486 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = fma(_504, _504, _512);
    float _522 = in.m_55.x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = fma(_508, _508, _520);
    float _528 = precise::max(_510, 0.300000011920928955078125);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _496 * 0.02999999932944774627685546875;
    float _536 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    float _538 = precise::min(_528, 0.699999988079071044921875);
    float _540 = sqrt(_526);
    float _542 = in.m_57.x;
    float _544 = in.m_57.y;
    float _546 = in.m_57.z;
    bool _548 = _390 > 0.5;
    float _550 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _552 = fma(_538, -2.5000002384185791015625, 1.75000011920928955078125);
    float _554 = fma(_518, 0.039999999105930328369140625, _534);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _560 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _562 = 1.0 / _532;
    float _564 = _554 * _552;
    float _566 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _568 = _354 * _560;
    float _570 = _564 * _440;
    float _572 = _354 * _566;
    float _574 = -_126;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[76].x, _446);
    float _578 = 1.0 / _558;
    float _580 = -_412;
    float _582 = _580 + 1.0;
    float _584 = _456 * _540;
    float _586 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _588;
    float _592 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _550);
    int _594 = _548 ? as_type<int>(_582) : as_type<int>(_412);
    float _596 = _590 * _562;
    float _598 = _354 * _510;
    float _600 = _450 ? as_type<float>(_594) : _412;
    float _602 = fma(_570, _542, _542);
    float _604 = fma(_570, _546, _546);
    float _606 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _608 = fma(_570, _544, _544);
    float _610 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _602);
    float _614 = _606 * _584;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _608);
    float _618 = _610 * _584;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _604);
    float _622 = _586 * _584;
    float _624 = _614 * _616;
    float _626 = _618 * _612;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _382 + _628;
    float _632 = _622 * _620;
    float _634 = _624 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _624 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = fma(_596, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _646 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[10].x, _636);
    float _648 = _640 * _578;
    bool _650 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _652 = isnan(_382);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].z, _644);
    float _664 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].z, _646);
    float _666 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _514);
    bool _668 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _670 = isnan(_382);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = _408 + _662;
    float _682 = _410 + _664;
    bool _684 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _686 = isnan(_382);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _698 = _382 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _702 = _680 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _706 = _682 + _704;
    float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _710 = -_660;
    float _712 = _710 + 1.0;
    float _714 = _702 * _702;
    float _716 = _706 * _706;
    float _718 = 0.0;
    float _720 = _694;
    float _722 = _608;
    float _724 = _632;
    float _726 = _714;
    float _728 = _680;
    if (_438)
    {
        _718 = _522;
    }
    float _730 = _718;
    float _732 = -_694;
    float _734 = _732 + 1.0;
    float _736 = in.m_59.x;
    float _738 = in.m_59.y;
    float _740 = in.m_59.z;
    float _742 = _714 + _716;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _746 = _694 * _712;
    bool _748 = _608 != 0.0;
    bool _750 = isnan(_608);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = _678 * _734;
    float _760 = _730;
    if (_482)
    {
        float _762 = -_730;
        float _764 = _762 + 1.0;
        _760 = _764;
    }
    float _766 = _760;
    if (!_438)
    {
        _720 = _522;
    }
    float _768 = _720;
    float _770 = -_678;
    float _772 = _770 + 1.0;
    bool _774 = _602 == 0.0;
    bool _776 = !_756;
    bool _778 = _774 && _776;
    float _780 = sqrt(_742);
    float _782 = _642 * _758;
    float _784 = _624 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _786 = _768;
    if (_438)
    {
        _786 = _766;
    }
    float _788 = _786;
    float _790 = _708 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _792 = _604 == 0.0;
    bool _794 = _792 && _778;
    float _796 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].x, _784);
    float _798 = fma(_648, _698, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _800 = fma(_790, _788, -0.5);
    float _802 = _744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _804 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].z, _796);
    float _806 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _808 = fma(_666, _800, _576);
    float _810 = fma(_600, _802, -0.5);
    float _812 = _406 + _804;
    float _814 = fma(_798, _746, _806);
    bool _816 = _780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _818 = -_536;
    float _820 = fma(_592, _810, _818);
    float _822 = _738;
    float _824 = _804;
    float _826 = _736;
    float _828 = _740;
    float _830 = _820;
    if (!_794)
    {
        float _832 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _738);
        _822 = _832;
    }
    float _834 = _822;
    float _836 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[117].x, _814);
    if (!_816)
    {
        _722 = _716;
    }
    float _838 = _722;
    float _840 = _838;
    if (!_816)
    {
        _724 = _682;
    }
    float _842 = _724;
    float _844 = _842;
    if (!_816)
    {
        _824 = _812;
    }
    float _846 = _824;
    bool _848 = !_816;
    float _850 = _846;
    if (!_848)
    {
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _856 = _780 + _854;
        float _858 = rsqrt(_742);
        float _860 = _856 * _852;
        float _862 = _812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _864 = _860 * 0.15915493667125701904296875;
        float _866 = _864 * 6.283185482025146484375;
        float _868 = sin(_866);
        float _870 = _864 * 6.283185482025146484375;
        float _872 = cos(_870);
        float _874 = fma(_868, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _876 = _858 * _874;
        float _878 = _872 + (-1.0);
        float _880 = fma(_702, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _882 = fma(_706, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _884 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _888 = _880 + _886;
        float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _892 = _882 + _890;
        float _894 = fma(_812, _872, _884);
        float _896 = _888 * _888;
        float _898 = _892 * _892;
        _850 = _894;
        _726 = _896;
        _840 = _898;
        _728 = _880;
        _844 = _882;
    }
    float _900 = _850;
    float _902 = _726;
    float _904 = _840;
    float _906 = _728;
    float _908 = _844;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _912 = _900 + _910;
    if (!_794)
    {
        float _914 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _736);
        _826 = _914;
    }
    float _916 = _826;
    float _918 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _920 = _834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _922 = fma(_912, _912, _902);
    float _924 = _834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].x, _918);
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].x, _920);
    float _930 = _922 + _904;
    if (!_794)
    {
        float _932 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _740);
        _828 = _932;
    }
    float _934 = _828;
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _938 = sqrt(_930);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _926);
    float _954 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _928);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _958 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _820 + 0.5;
    float _972 = _808 + 0.5;
    float _974 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _936);
    out.m_61.x = _964;
    out.m_61.y = _966;
    out.m_61.z = _968;
    out.m_61.w = _956;
    bool _978 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _980 = isnan(_938);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _986 = _982 || _984;
    out.m_63.x = _972;
    out.m_63.y = _970;
    out.m_65.x = _958;
    out.m_65.y = _960;
    out.m_65.z = _962;
    out.m_65.w = _974;
    out.m_67.x = _952;
    out.m_67.y = _954;
    out.m_67.z = _976;
    float _988 = _968;
    float _990 = _974;
    if (!_986)
    {
        _830 = 1.0;
    }
    float _992 = _830;
    bool _994 = !_986;
    float _996 = _992;
    if (!_994)
    {
        bool _998 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1000 = isnan(_938);
        bool _1002 = _998 || _1000;
        bool _1004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1006 = _1002 || _1004;
        if (!_1006)
        {
            float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1010 = _938 + _1008;
            float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1014 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1012;
            float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1018 = _1016 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1020 = 1.0 / _1014;
            float _1022 = _1010 * _1020;
            float _1024 = fma(_1022, _1018, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _996 = _1024;
            _1026 = true;
        }
        else
        {
            bool _1028 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1030 = isnan(_938);
            bool _1032 = _1028 || _1030;
            bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1036 = _1032 || _1034;
            if (!_1036)
            {
                float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1040 = _938 + _1038;
                float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1044 = _1042 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1050 = 1.0 / _1044;
                float _1052 = _1040 * _1050;
                float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _996 = _1054;
                _1026 = true;
            }
            else
            {
                _996 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1026 = false;
    float _1056 = _996;
    float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1060 = _906 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1064 = _900 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1068 = _908 + _1066;
    bool _1070 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(0.5);
    bool _1078 = _1074 || _1076;
    float _1080 = fma(_1060, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1082 = fma(_1064, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1084 = fma(_1068, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1086 = -_490;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1090 = -_488;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1094 = -_492;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1098 = _1092;
    float _1100 = _1088;
    float _1102 = _1096;
    float _1104 = _1080;
    if (!_1078)
    {
        float _1106 = -_488;
        float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
        float _1110 = -_490;
        float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
        float _1114 = -_492;
        float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _410);
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1122 = _1108 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1126 = _1112 + _1124;
        float _1128 = -_410;
        float _1130 = _1128 + _1084;
        float _1132 = _1122 * _1122;
        float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1136 = _1116 + _1134;
        float _1138 = 1.0 / _584;
        float _1140 = fma(_1126, _1126, _1132);
        float _1142 = fma(_1136, _1136, _1140);
        float _1144 = sqrt(_1142);
        float _1146 = precise::min(_1144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1118;
        float _1150 = -_408;
        float _1152 = _1150 + _1080;
        float _1154 = _1148 * _1138;
        float _1156 = -_406;
        float _1158 = _1156 + _1082;
        float _1160 = fma(_1152, _1154, _1112);
        float _1162 = fma(_1158, _1154, _1108);
        float _1164 = fma(_1130, _1154, _1116);
        _1098 = _1162;
        _1100 = _1160;
        _1102 = _1164;
        _988 = _1154;
    }
    float _1166 = _1098;
    float _1168 = _1100;
    float _1170 = _1102;
    float _1172 = _988;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1176 = _1166 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1168 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1184 = _1170 + _1182;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = fma(_1184, _1184, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1180 * _1194;
    float _1198 = _1184 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1188;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1194;
    float _1222 = _1196;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (_1208)
    {
        float _1228 = rsqrt(_1204);
        _1216 = _1228;
    }
    float _1230 = _1216;
    if (_1208)
    {
        float _1232 = _1212 * _1226;
        _1218 = _1232;
    }
    float _1234 = _1218;
    if (_1208)
    {
        float _1236 = _1234 * 0.15915493667125701904296875;
        _990 = _1236;
    }
    float _1238 = _990;
    float _1240 = _1226;
    float _1242 = _1238;
    if (_1208)
    {
        float _1244 = _1238 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1240 = _1246;
    }
    float _1248 = _1240;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1172;
    float _1256 = _1252;
    if (_1208)
    {
        float _1258 = _1238 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1194;
    float _1266 = -_1252;
    float _1268 = fma(_1176, _1264, _1266);
    float _1270 = _1268;
    if (_1208)
    {
        float _1272 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1272;
    }
    float _1274 = _1256;
    float _1276 = _1274;
    if (!_1208)
    {
        _1242 = _1198;
    }
    float _1278 = _1242;
    float _1280 = _1248;
    float _1282 = _1278;
    if (_1208)
    {
        float _1284 = fma(_1248, _1274, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1280 = _1284;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (_1208)
    {
        float _1290 = _1262 + (-1.0);
        _1276 = _1290;
    }
    float _1292 = _1276;
    float _1294 = _1292;
    if (_1208)
    {
        float _1296 = _1230 * _1286;
        _1104 = _1296;
    }
    float _1298 = _1104;
    if (!_1208)
    {
        _1288 = _1200;
    }
    float _1300 = _1288;
    float _1302 = sqrt(_1190);
    float _1304 = _1300;
    if (_1208)
    {
        float _1306 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1306;
    }
    float _1308 = _1220;
    if (_1208)
    {
        float _1310 = _1196 * _1298;
        _1222 = _1310;
    }
    float _1312 = _1222;
    if (_1208)
    {
        float _1314 = _1198 * _1298;
        _1282 = _1314;
    }
    float _1316 = _1282;
    if (!_1208)
    {
        _1294 = _1202;
    }
    float _1318 = _1294;
    float _1320 = _1318;
    if (_1208)
    {
        float _1322 = fma(_1268, _1262, _1308);
        _1270 = _1322;
    }
    float _1324 = _1270;
    if (_1208)
    {
        float _1326 = _1312 * _1312;
        _1304 = _1326;
    }
    float _1328 = _1304;
    if (_1208)
    {
        float _1330 = _1316 * _1316;
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = fma(_1324, _1324, _1328);
    float _1338 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1340 = _1336 + _1332;
    float _1342 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1346 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1344);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1352 = rsqrt(_1340);
    float _1354 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1342);
    float _1356 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1348;
    float _1360 = _1358 + 1.0;
    float _1362 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1364 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1366 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1356);
    float _1368 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1362);
    float _1370 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1366);
    float _1374 = abs(_1360);
    float _1376 = log2(_1374);
    float _1378 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1368);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1384 = _1352 * _1312;
    float _1386 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1388 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1390 = -_1380;
    float _1392 = fma(_1390, _1350, 1.0);
    float _1394 = _1352 * _1324;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1338);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1388);
    float _1402 = _1352 * _1316;
    float _1404 = -_1396;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1410 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1400);
    float _1412 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = -_1402;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = log2(_1392);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1424 = fma(_1416, -0.5, 0.5);
    float _1426 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1422);
    float _1430 = fma(_1416, 0.5, 0.5);
    float _1432 = 1.0 / _1420;
    float _1434 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1436 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1428);
    float _1438 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1440 = _1394 + 1.0;
    float _1442 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1444 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1446 = fma(_1430, _1438, -0.212114393711090087890625);
    float _1448 = exp2(_1412);
    float _1450 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1452 = _1418 * 0.693147182464599609375;
    float _1454 = fma(_1430, _1446, 1.570728778839111328125);
    float _1456 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1458 = sqrt(_1424);
    float _1460 = _1444 * _1432;
    float _1462 = _1450 * _1432;
    float _1464 = fma(_1460, 0.5, 0.5);
    float _1466 = fma(_1462, -0.5, 0.5);
    float _1468 = -_1394;
    float _1470 = fma(_1448, _1440, _1468);
    float3 _3847 = float3(_1464, _1466, _1456);
    float _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3847, float3(0.0), isnan(_3847)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3847, float3(0.0), isnan(_3847)), level(0.0)).x;
    float3 _3858 = float3(_1464, _1466, _1456);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float _1485 = fma(_1470, 0.5, 0.5);
    float _1487 = _1458 * 0.636619746685028076171875;
    float _1489 = -_1454;
    float _1491 = fma(_1487, _1489, 1.0);
    float2 _3885 = float2(_1491, _1485);
    float3 _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3885, float2(0.0), isnan(_3885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3885, float2(0.0), isnan(_3885)), level(0.0)).xyz;
    float _1497 = _1495.x;
    float _1499 = _1495.y;
    float _1501 = _1495.z;
    float _1503 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1505 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1180;
    out.m_69.y = _1176;
    out.m_69.z = _1184;
    float _1507 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1505);
    float _1509 = exp2(_1503);
    float _1511 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1507);
    float _1513 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1511);
    float _1515 = _1513 + _1420;
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1450;
    out.gl_Position.z = _1513;
    out.gl_Position.w = _1420;
    float _1517 = _1515 * 0.5;
    float _1519 = -_1509;
    float _1521 = _1519 + 1.0;
    float _1523 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1525 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1517;
    out.m_71.w = _1420;
    out.m_47.x = _1525;
    float _1527 = _1523 * _1472;
    float _1529 = -_1523;
    float _1531 = _1529 + 1.0;
    float _1533 = _1483 * _1527;
    float _1535 = _1483 * _1531;
    float _1537 = _1501 * _1527;
    float _1539 = fma(_1497, _1533, _1477);
    float _1541 = fma(_1499, _1533, _1479);
    float _1543 = fma(_1483, _1537, _1481);
    out.m_73.x = _1539;
    out.m_73.y = _1541;
    out.m_73.z = _1543;
    out.m_73.w = _1535;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad5 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1026 = false;
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
        float _1600 = as_type<float>(_108);
        out.gl_Position.z = _1600;
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
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1668 = as_type<float>(_144);
        out.gl_Position.z = _1668;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_336, _268, _292);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_324, _268, _290);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
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
    float _384 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_51.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _400 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _402 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _404 = in.m_53.y;
    float _406 = _398 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _400 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _412 = in.m_55.y;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _406 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _420 = _408 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _424 = _410 + _422;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _428 = _416 * _416;
    float _430 = in.m_53.x;
    float _432 = fma(_420, _420, _428);
    float _434 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _438 = _436 != 0;
    float _440 = in.m_51.z;
    float _442 = fma(_424, _424, _432);
    float _444 = -_426;
    float _446 = fma(_434, 2.0, _444);
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = _126 * (-0.00999999977648258209228515625);
    float _454 = _126 * 0.010999999940395355224609375;
    float _456 = rsqrt(_442);
    float _458 = fma(_390, 6.283185482025146484375, _452);
    float _460 = fma(_146, 6.283185482025146484375, _454);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _466 = _458 + _412;
    float _468 = _460 + _412;
    float _470 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _472 = in.m_53.z;
    float _474 = _466 * 81.6814117431640625;
    float _476 = _468 * 56.54866790771484375;
    float _478 = fma(_470, -2.0, _464);
    bool _480 = _146 > 0.5;
    bool _482 = _480 && _438;
    float _484 = _474 * 0.15915493667125701904296875;
    float _486 = _476 * 0.15915493667125701904296875;
    float _488 = _416 * _456;
    float _490 = _420 * _456;
    float _492 = _424 * _456;
    float _494 = _484 * 6.283185482025146484375;
    float _496 = sin(_494);
    float _498 = -_488;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _502 = -_490;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _420);
    float _506 = -_492;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _424);
    float _510 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _512 = _500 * _500;
    float _514 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _462);
    float _516 = _486 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = fma(_504, _504, _512);
    float _522 = in.m_55.x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = fma(_508, _508, _520);
    float _528 = precise::max(_510, 0.300000011920928955078125);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _496 * 0.02999999932944774627685546875;
    float _536 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    float _538 = precise::min(_528, 0.699999988079071044921875);
    float _540 = sqrt(_526);
    float _542 = in.m_57.x;
    float _544 = in.m_57.y;
    float _546 = in.m_57.z;
    bool _548 = _390 > 0.5;
    float _550 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _552 = fma(_538, -2.5000002384185791015625, 1.75000011920928955078125);
    float _554 = fma(_518, 0.039999999105930328369140625, _534);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _560 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _562 = 1.0 / _532;
    float _564 = _554 * _552;
    float _566 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _568 = _354 * _560;
    float _570 = _564 * _440;
    float _572 = _354 * _566;
    float _574 = -_126;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[76].x, _446);
    float _578 = 1.0 / _558;
    float _580 = -_412;
    float _582 = _580 + 1.0;
    float _584 = _456 * _540;
    float _586 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _588;
    float _592 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _550);
    int _594 = _548 ? as_type<int>(_582) : as_type<int>(_412);
    float _596 = _590 * _562;
    float _598 = _354 * _510;
    float _600 = _450 ? as_type<float>(_594) : _412;
    float _602 = fma(_570, _542, _542);
    float _604 = fma(_570, _546, _546);
    float _606 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _608 = fma(_570, _544, _544);
    float _610 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _602);
    float _614 = _606 * _584;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _608);
    float _618 = _610 * _584;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _604);
    float _622 = _586 * _584;
    float _624 = _614 * _616;
    float _626 = _618 * _612;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _382 + _628;
    float _632 = _622 * _620;
    float _634 = _624 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _624 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = fma(_596, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _646 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[10].x, _636);
    float _648 = _640 * _578;
    bool _650 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _652 = isnan(_382);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].z, _644);
    float _664 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].z, _646);
    float _666 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _514);
    bool _668 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _670 = isnan(_382);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = _408 + _662;
    float _682 = _410 + _664;
    bool _684 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _686 = isnan(_382);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _698 = _382 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _702 = _680 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _706 = _682 + _704;
    float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _710 = -_660;
    float _712 = _710 + 1.0;
    float _714 = _702 * _702;
    float _716 = _706 * _706;
    float _718 = 0.0;
    float _720 = _694;
    float _722 = _608;
    float _724 = _632;
    float _726 = _714;
    float _728 = _680;
    if (_438)
    {
        _718 = _522;
    }
    float _730 = _718;
    float _732 = -_694;
    float _734 = _732 + 1.0;
    float _736 = in.m_59.x;
    float _738 = in.m_59.y;
    float _740 = in.m_59.z;
    float _742 = _714 + _716;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _746 = _694 * _712;
    bool _748 = _608 != 0.0;
    bool _750 = isnan(_608);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = _678 * _734;
    float _760 = _730;
    if (_482)
    {
        float _762 = -_730;
        float _764 = _762 + 1.0;
        _760 = _764;
    }
    float _766 = _760;
    if (!_438)
    {
        _720 = _522;
    }
    float _768 = _720;
    float _770 = -_678;
    float _772 = _770 + 1.0;
    bool _774 = _602 == 0.0;
    bool _776 = !_756;
    bool _778 = _774 && _776;
    float _780 = sqrt(_742);
    float _782 = _642 * _758;
    float _784 = _624 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _786 = _768;
    if (_438)
    {
        _786 = _766;
    }
    float _788 = _786;
    float _790 = _708 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _792 = _604 == 0.0;
    bool _794 = _792 && _778;
    float _796 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].x, _784);
    float _798 = fma(_648, _698, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _800 = fma(_790, _788, -0.5);
    float _802 = _744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _804 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].z, _796);
    float _806 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _808 = fma(_666, _800, _576);
    float _810 = fma(_600, _802, -0.5);
    float _812 = _406 + _804;
    float _814 = fma(_798, _746, _806);
    bool _816 = _780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _818 = -_536;
    float _820 = fma(_592, _810, _818);
    float _822 = _738;
    float _824 = _804;
    float _826 = _736;
    float _828 = _740;
    float _830 = _820;
    if (!_794)
    {
        float _832 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _738);
        _822 = _832;
    }
    float _834 = _822;
    float _836 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[117].x, _814);
    if (!_816)
    {
        _722 = _716;
    }
    float _838 = _722;
    float _840 = _838;
    if (!_816)
    {
        _724 = _682;
    }
    float _842 = _724;
    float _844 = _842;
    if (!_816)
    {
        _824 = _812;
    }
    float _846 = _824;
    bool _848 = !_816;
    float _850 = _846;
    if (!_848)
    {
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _856 = _780 + _854;
        float _858 = rsqrt(_742);
        float _860 = _856 * _852;
        float _862 = _812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _864 = _860 * 0.15915493667125701904296875;
        float _866 = _864 * 6.283185482025146484375;
        float _868 = sin(_866);
        float _870 = _864 * 6.283185482025146484375;
        float _872 = cos(_870);
        float _874 = fma(_868, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _876 = _858 * _874;
        float _878 = _872 + (-1.0);
        float _880 = fma(_702, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _882 = fma(_706, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _884 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _888 = _880 + _886;
        float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _892 = _882 + _890;
        float _894 = fma(_812, _872, _884);
        float _896 = _888 * _888;
        float _898 = _892 * _892;
        _850 = _894;
        _726 = _896;
        _840 = _898;
        _728 = _880;
        _844 = _882;
    }
    float _900 = _850;
    float _902 = _726;
    float _904 = _840;
    float _906 = _728;
    float _908 = _844;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _912 = _900 + _910;
    if (!_794)
    {
        float _914 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _736);
        _826 = _914;
    }
    float _916 = _826;
    float _918 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _920 = _834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _922 = fma(_912, _912, _902);
    float _924 = _834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].x, _918);
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].x, _920);
    float _930 = _922 + _904;
    if (!_794)
    {
        float _932 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _740);
        _828 = _932;
    }
    float _934 = _828;
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _938 = sqrt(_930);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _926);
    float _954 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _928);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _958 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _820 + 0.5;
    float _972 = _808 + 0.5;
    float _974 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _936);
    out.m_61.x = _964;
    out.m_61.y = _966;
    out.m_61.z = _968;
    out.m_61.w = _956;
    bool _978 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _980 = isnan(_938);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _986 = _982 || _984;
    out.m_63.x = _972;
    out.m_63.y = _970;
    out.m_65.x = _958;
    out.m_65.y = _960;
    out.m_65.z = _962;
    out.m_65.w = _974;
    out.m_67.x = _952;
    out.m_67.y = _954;
    out.m_67.z = _976;
    float _988 = _968;
    float _990 = _974;
    if (!_986)
    {
        _830 = 1.0;
    }
    float _992 = _830;
    bool _994 = !_986;
    float _996 = _992;
    if (!_994)
    {
        bool _998 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1000 = isnan(_938);
        bool _1002 = _998 || _1000;
        bool _1004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1006 = _1002 || _1004;
        if (!_1006)
        {
            float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1010 = _938 + _1008;
            float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1014 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1012;
            float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1018 = _1016 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1020 = 1.0 / _1014;
            float _1022 = _1010 * _1020;
            float _1024 = fma(_1022, _1018, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _996 = _1024;
            _1026 = true;
        }
        else
        {
            bool _1028 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1030 = isnan(_938);
            bool _1032 = _1028 || _1030;
            bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1036 = _1032 || _1034;
            if (!_1036)
            {
                float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1040 = _938 + _1038;
                float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1044 = _1042 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1050 = 1.0 / _1044;
                float _1052 = _1040 * _1050;
                float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _996 = _1054;
                _1026 = true;
            }
            else
            {
                _996 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1026 = false;
    float _1056 = _996;
    float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1060 = _906 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1064 = _900 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1068 = _908 + _1066;
    bool _1070 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(0.5);
    bool _1078 = _1074 || _1076;
    float _1080 = fma(_1060, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1082 = fma(_1064, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1084 = fma(_1068, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1086 = -_490;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1090 = -_488;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1094 = -_492;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1098 = _1092;
    float _1100 = _1088;
    float _1102 = _1096;
    float _1104 = _1080;
    if (!_1078)
    {
        float _1106 = -_488;
        float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
        float _1110 = -_490;
        float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
        float _1114 = -_492;
        float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _410);
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1122 = _1108 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1126 = _1112 + _1124;
        float _1128 = -_410;
        float _1130 = _1128 + _1084;
        float _1132 = _1122 * _1122;
        float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1136 = _1116 + _1134;
        float _1138 = 1.0 / _584;
        float _1140 = fma(_1126, _1126, _1132);
        float _1142 = fma(_1136, _1136, _1140);
        float _1144 = sqrt(_1142);
        float _1146 = precise::min(_1144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1118;
        float _1150 = -_408;
        float _1152 = _1150 + _1080;
        float _1154 = _1148 * _1138;
        float _1156 = -_406;
        float _1158 = _1156 + _1082;
        float _1160 = fma(_1152, _1154, _1112);
        float _1162 = fma(_1158, _1154, _1108);
        float _1164 = fma(_1130, _1154, _1116);
        _1098 = _1162;
        _1100 = _1160;
        _1102 = _1164;
        _988 = _1154;
    }
    float _1166 = _1098;
    float _1168 = _1100;
    float _1170 = _1102;
    float _1172 = _988;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1176 = _1166 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1168 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1184 = _1170 + _1182;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = fma(_1184, _1184, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1180 * _1194;
    float _1198 = _1184 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1188;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1194;
    float _1222 = _1196;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (_1208)
    {
        float _1228 = rsqrt(_1204);
        _1216 = _1228;
    }
    float _1230 = _1216;
    if (_1208)
    {
        float _1232 = _1212 * _1226;
        _1218 = _1232;
    }
    float _1234 = _1218;
    if (_1208)
    {
        float _1236 = _1234 * 0.15915493667125701904296875;
        _990 = _1236;
    }
    float _1238 = _990;
    float _1240 = _1226;
    float _1242 = _1238;
    if (_1208)
    {
        float _1244 = _1238 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1240 = _1246;
    }
    float _1248 = _1240;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1172;
    float _1256 = _1252;
    if (_1208)
    {
        float _1258 = _1238 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1194;
    float _1266 = -_1252;
    float _1268 = fma(_1176, _1264, _1266);
    float _1270 = _1268;
    if (_1208)
    {
        float _1272 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1272;
    }
    float _1274 = _1256;
    float _1276 = _1274;
    if (!_1208)
    {
        _1242 = _1198;
    }
    float _1278 = _1242;
    float _1280 = _1248;
    float _1282 = _1278;
    if (_1208)
    {
        float _1284 = fma(_1248, _1274, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1280 = _1284;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (_1208)
    {
        float _1290 = _1262 + (-1.0);
        _1276 = _1290;
    }
    float _1292 = _1276;
    float _1294 = _1292;
    if (_1208)
    {
        float _1296 = _1230 * _1286;
        _1104 = _1296;
    }
    float _1298 = _1104;
    if (!_1208)
    {
        _1288 = _1200;
    }
    float _1300 = _1288;
    float _1302 = sqrt(_1190);
    float _1304 = _1300;
    if (_1208)
    {
        float _1306 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1306;
    }
    float _1308 = _1220;
    if (_1208)
    {
        float _1310 = _1196 * _1298;
        _1222 = _1310;
    }
    float _1312 = _1222;
    if (_1208)
    {
        float _1314 = _1198 * _1298;
        _1282 = _1314;
    }
    float _1316 = _1282;
    if (!_1208)
    {
        _1294 = _1202;
    }
    float _1318 = _1294;
    float _1320 = _1318;
    if (_1208)
    {
        float _1322 = fma(_1268, _1262, _1308);
        _1270 = _1322;
    }
    float _1324 = _1270;
    if (_1208)
    {
        float _1326 = _1312 * _1312;
        _1304 = _1326;
    }
    float _1328 = _1304;
    if (_1208)
    {
        float _1330 = _1316 * _1316;
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = fma(_1324, _1324, _1328);
    float _1338 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1340 = _1336 + _1332;
    float _1342 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1346 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1344);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1352 = rsqrt(_1340);
    float _1354 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1342);
    float _1356 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1348;
    float _1360 = _1358 + 1.0;
    float _1362 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1364 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1366 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1356);
    float _1368 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1362);
    float _1370 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1366);
    float _1374 = abs(_1360);
    float _1376 = log2(_1374);
    float _1378 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1368);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1384 = _1352 * _1312;
    float _1386 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1388 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1390 = -_1380;
    float _1392 = fma(_1390, _1350, 1.0);
    float _1394 = _1352 * _1324;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1338);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1388);
    float _1402 = _1352 * _1316;
    float _1404 = -_1396;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1410 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1400);
    float _1412 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = -_1402;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = log2(_1392);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1424 = fma(_1416, -0.5, 0.5);
    float _1426 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1422);
    float _1430 = fma(_1416, 0.5, 0.5);
    float _1432 = 1.0 / _1420;
    float _1434 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1436 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1428);
    float _1438 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1440 = _1394 + 1.0;
    float _1442 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1444 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1446 = fma(_1430, _1438, -0.212114393711090087890625);
    float _1448 = exp2(_1412);
    float _1450 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1452 = _1418 * 0.693147182464599609375;
    float _1454 = fma(_1430, _1446, 1.570728778839111328125);
    float _1456 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1458 = sqrt(_1424);
    float _1460 = _1444 * _1432;
    float _1462 = _1450 * _1432;
    float _1464 = fma(_1460, 0.5, 0.5);
    float _1466 = fma(_1462, -0.5, 0.5);
    float _1468 = -_1394;
    float _1470 = fma(_1448, _1440, _1468);
    float3 _3847 = float3(_1464, _1466, _1456);
    float _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3847, float3(0.0), isnan(_3847)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3847, float3(0.0), isnan(_3847)), level(0.0)).x;
    float3 _3858 = float3(_1464, _1466, _1456);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float _1485 = fma(_1470, 0.5, 0.5);
    float _1487 = _1458 * 0.636619746685028076171875;
    float _1489 = -_1454;
    float _1491 = fma(_1487, _1489, 1.0);
    float2 _3885 = float2(_1491, _1485);
    float3 _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3885, float2(0.0), isnan(_3885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3885, float2(0.0), isnan(_3885)), level(0.0)).xyz;
    float _1497 = _1495.x;
    float _1499 = _1495.y;
    float _1501 = _1495.z;
    float _1503 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1505 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1180;
    out.m_69.y = _1176;
    out.m_69.z = _1184;
    float _1507 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1505);
    float _1509 = exp2(_1503);
    float _1511 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1507);
    float _1513 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1511);
    float _1515 = _1513 + _1420;
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1450;
    out.gl_Position.z = _1513;
    out.gl_Position.w = _1420;
    float _1517 = _1515 * 0.5;
    float _1519 = -_1509;
    float _1521 = _1519 + 1.0;
    float _1523 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1525 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1517;
    out.m_71.w = _1420;
    out.m_47.x = _1525;
    float _1527 = _1523 * _1472;
    float _1529 = -_1523;
    float _1531 = _1529 + 1.0;
    float _1533 = _1483 * _1527;
    float _1535 = _1483 * _1531;
    float _1537 = _1501 * _1527;
    float _1539 = fma(_1497, _1533, _1477);
    float _1541 = fma(_1499, _1533, _1479);
    float _1543 = fma(_1483, _1537, _1481);
    out.m_73.x = _1539;
    out.m_73.y = _1541;
    out.m_73.z = _1543;
    out.m_73.w = _1535;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1026 = false;
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
        float _1600 = as_type<float>(_108);
        out.gl_Position.z = _1600;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1668 = as_type<float>(_144);
        out.gl_Position.z = _1668;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _150 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    int _162 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _164 = _162 != 0;
    float _166 = _150 * _148;
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[20].x, _166);
    float _170 = in.m_49.x;
    float _172 = in.m_49.y;
    float _174 = in.m_49.z;
    float _176 = _168 * 6.283185482025146484375;
    float _178 = floor(_168);
    float _180 = _176 * 0.15915493667125701904296875;
    float _182 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _184 = 0.0;
    float _186 = _182;
    if (!_160)
    {
        float _188 = _182 * _182;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _180 * 6.283185482025146484375;
    float _196 = cos(_194);
    float _198 = _192;
    if (!_160)
    {
        float _200 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    float _204 = -_178;
    float _206 = _168 + _204;
    bool _208 = !_160;
    float _210 = _202;
    if (!_208)
    {
        float _212 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = log2(_212);
        float _216 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _218 = _216 + 1.0;
        float _220 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = _182 * _214;
        float _224 = 1.0 / _218;
        float _226 = _220 * 0.693147182464599609375;
        float _228 = exp2(_222);
        float _230 = 1.0 / _226;
        float _232 = _228 + (-1.0);
        float _234 = -_232;
        float _236 = fma(_234, _230, _182);
        float _238 = _236 * _224;
        float _240 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _240;
    }
    float _242 = _210;
    bool _244 = !_160;
    if (!_244)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _182 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _186 = _264;
    }
    float _266 = _186;
    float _268 = in.m_53.w;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _276 = _274 != 0;
    float _278 = -_206;
    float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _282 = _206 < 0.5;
    float _284 = float(_282);
    float _286 = fma(_196, 0.5, 0.5);
    float _288 = in.m_44.x;
    float _290 = in.m_44.y;
    float _292 = in.m_44.z;
    bool _294 = !_272;
    int _296 = _294 ? 0 : 1;
    float _298 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _300 = -_284;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _304 = !_164;
    int _306 = _304 ? 0 : 1;
    float _308 = -_286;
    float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _312 = abs(_296);
    float _314 = fma(_266, _170, _298);
    int _316 = abs(_306);
    float _318 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _320 = !_276;
    int _322 = _320 ? 0 : 1;
    float _324 = fma(_266, _172, _318);
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_322);
    float _330 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _332 = float(_312);
    float _334 = float(_316);
    float _336 = fma(_266, _174, _330);
    float _338 = abs(_280);
    float _340 = _332 * _338;
    float _342 = fma(_314, _268, _288);
    float _344 = fma(_336, _268, _292);
    float _346 = float(_328);
    float _348 = fma(_334, _310, _340);
    float _350 = fma(_324, _268, _290);
    float _352 = abs(_302);
    float _354 = fma(_346, _352, _348);
    bool _356 = !_326;
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
    float _384 = _350 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _386 = _350 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _350 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _390 = in.m_51.y;
    float _392 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _384);
    float _394 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _388);
    float _398 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _392);
    float _400 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    float _402 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _396);
    float _404 = in.m_53.y;
    float _406 = _398 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _408 = _400 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _410 = _402 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _412 = in.m_55.y;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _406 + _414;
    float _418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _420 = _408 + _418;
    float _422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _424 = _410 + _422;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _428 = _416 * _416;
    float _430 = in.m_53.x;
    float _432 = fma(_420, _420, _428);
    float _434 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _438 = _436 != 0;
    float _440 = in.m_51.z;
    float _442 = fma(_424, _424, _432);
    float _444 = -_426;
    float _446 = fma(_434, 2.0, _444);
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = _126 * (-0.00999999977648258209228515625);
    float _454 = _126 * 0.010999999940395355224609375;
    float _456 = rsqrt(_442);
    float _458 = fma(_390, 6.283185482025146484375, _452);
    float _460 = fma(_146, 6.283185482025146484375, _454);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _466 = _458 + _412;
    float _468 = _460 + _412;
    float _470 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _472 = in.m_53.z;
    float _474 = _466 * 81.6814117431640625;
    float _476 = _468 * 56.54866790771484375;
    float _478 = fma(_470, -2.0, _464);
    bool _480 = _146 > 0.5;
    bool _482 = _480 && _438;
    float _484 = _474 * 0.15915493667125701904296875;
    float _486 = _476 * 0.15915493667125701904296875;
    float _488 = _416 * _456;
    float _490 = _420 * _456;
    float _492 = _424 * _456;
    float _494 = _484 * 6.283185482025146484375;
    float _496 = sin(_494);
    float _498 = -_488;
    float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _502 = -_490;
    float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _420);
    float _506 = -_492;
    float _508 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _424);
    float _510 = _404 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _512 = _500 * _500;
    float _514 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _462);
    float _516 = _486 * 6.283185482025146484375;
    float _518 = sin(_516);
    float _520 = fma(_504, _504, _512);
    float _522 = in.m_55.x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _526 = fma(_508, _508, _520);
    float _528 = precise::max(_510, 0.300000011920928955078125);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = _496 * 0.02999999932944774627685546875;
    float _536 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _478);
    float _538 = precise::min(_528, 0.699999988079071044921875);
    float _540 = sqrt(_526);
    float _542 = in.m_57.x;
    float _544 = in.m_57.y;
    float _546 = in.m_57.z;
    bool _548 = _390 > 0.5;
    float _550 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _524);
    float _552 = fma(_538, -2.5000002384185791015625, 1.75000011920928955078125);
    float _554 = fma(_518, 0.039999999105930328369140625, _534);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _560 = _430 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _562 = 1.0 / _532;
    float _564 = _554 * _552;
    float _566 = _472 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _568 = _354 * _560;
    float _570 = _564 * _440;
    float _572 = _354 * _566;
    float _574 = -_126;
    float _576 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[76].x, _446);
    float _578 = 1.0 / _558;
    float _580 = -_412;
    float _582 = _580 + 1.0;
    float _584 = _456 * _540;
    float _586 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _588;
    float _592 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _550);
    int _594 = _548 ? as_type<int>(_582) : as_type<int>(_412);
    float _596 = _590 * _562;
    float _598 = _354 * _510;
    float _600 = _450 ? as_type<float>(_594) : _412;
    float _602 = fma(_570, _542, _542);
    float _604 = fma(_570, _546, _546);
    float _606 = _598 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _608 = fma(_570, _544, _544);
    float _610 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _612 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _602);
    float _614 = _606 * _584;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _608);
    float _618 = _610 * _584;
    float _620 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _604);
    float _622 = _586 * _584;
    float _624 = _614 * _616;
    float _626 = _618 * _612;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _630 = _382 + _628;
    float _632 = _622 * _620;
    float _634 = _624 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _636 = _624 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = fma(_596, _630, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[8].x, _634);
    float _646 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[10].x, _636);
    float _648 = _640 * _578;
    bool _650 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _652 = isnan(_382);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].z, _644);
    float _664 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[10].z, _646);
    float _666 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _514);
    bool _668 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _670 = isnan(_382);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = _408 + _662;
    float _682 = _410 + _664;
    bool _684 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _686 = isnan(_382);
    bool _688 = _684 || _686;
    bool _690 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _692 = _688 || _690;
    float _694 = float(_692);
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _698 = _382 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _702 = _680 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _706 = _682 + _704;
    float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _710 = -_660;
    float _712 = _710 + 1.0;
    float _714 = _702 * _702;
    float _716 = _706 * _706;
    float _718 = 0.0;
    float _720 = _694;
    float _722 = _608;
    float _724 = _632;
    float _726 = _714;
    float _728 = _680;
    if (_438)
    {
        _718 = _522;
    }
    float _730 = _718;
    float _732 = -_694;
    float _734 = _732 + 1.0;
    float _736 = in.m_59.x;
    float _738 = in.m_59.y;
    float _740 = in.m_59.z;
    float _742 = _714 + _716;
    float _744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _746 = _694 * _712;
    bool _748 = _608 != 0.0;
    bool _750 = isnan(_608);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = _678 * _734;
    float _760 = _730;
    if (_482)
    {
        float _762 = -_730;
        float _764 = _762 + 1.0;
        _760 = _764;
    }
    float _766 = _760;
    if (!_438)
    {
        _720 = _522;
    }
    float _768 = _720;
    float _770 = -_678;
    float _772 = _770 + 1.0;
    bool _774 = _602 == 0.0;
    bool _776 = !_756;
    bool _778 = _774 && _776;
    float _780 = sqrt(_742);
    float _782 = _642 * _758;
    float _784 = _624 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _786 = _768;
    if (_438)
    {
        _786 = _766;
    }
    float _788 = _786;
    float _790 = _708 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _792 = _604 == 0.0;
    bool _794 = _792 && _778;
    float _796 = fma(_626, (*spvDescriptorSet0.vp_c10)._m0[9].x, _784);
    float _798 = fma(_648, _698, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _800 = fma(_790, _788, -0.5);
    float _802 = _744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _804 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[9].z, _796);
    float _806 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[115].x, _782);
    float _808 = fma(_666, _800, _576);
    float _810 = fma(_600, _802, -0.5);
    float _812 = _406 + _804;
    float _814 = fma(_798, _746, _806);
    bool _816 = _780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _818 = -_536;
    float _820 = fma(_592, _810, _818);
    float _822 = _738;
    float _824 = _804;
    float _826 = _736;
    float _828 = _740;
    float _830 = _820;
    if (!_794)
    {
        float _832 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _738);
        _822 = _832;
    }
    float _834 = _822;
    float _836 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[117].x, _814);
    if (!_816)
    {
        _722 = _716;
    }
    float _838 = _722;
    float _840 = _838;
    if (!_816)
    {
        _724 = _682;
    }
    float _842 = _724;
    float _844 = _842;
    if (!_816)
    {
        _824 = _812;
    }
    float _846 = _824;
    bool _848 = !_816;
    float _850 = _846;
    if (!_848)
    {
        float _852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _854 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _856 = _780 + _854;
        float _858 = rsqrt(_742);
        float _860 = _856 * _852;
        float _862 = _812 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _864 = _860 * 0.15915493667125701904296875;
        float _866 = _864 * 6.283185482025146484375;
        float _868 = sin(_866);
        float _870 = _864 * 6.283185482025146484375;
        float _872 = cos(_870);
        float _874 = fma(_868, _862, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _876 = _858 * _874;
        float _878 = _872 + (-1.0);
        float _880 = fma(_702, _876, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _882 = fma(_706, _876, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _884 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _888 = _880 + _886;
        float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _892 = _882 + _890;
        float _894 = fma(_812, _872, _884);
        float _896 = _888 * _888;
        float _898 = _892 * _892;
        _850 = _894;
        _726 = _896;
        _840 = _898;
        _728 = _880;
        _844 = _882;
    }
    float _900 = _850;
    float _902 = _726;
    float _904 = _840;
    float _906 = _728;
    float _908 = _844;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _912 = _900 + _910;
    if (!_794)
    {
        float _914 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _736);
        _826 = _914;
    }
    float _916 = _826;
    float _918 = _834 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _920 = _834 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _922 = fma(_912, _912, _902);
    float _924 = _834 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[8].x, _918);
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[9].x, _920);
    float _930 = _922 + _904;
    if (!_794)
    {
        float _932 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _740);
        _828 = _932;
    }
    float _934 = _828;
    float _936 = fma(_916, (*spvDescriptorSet0.vp_c10)._m0[10].x, _924);
    float _938 = sqrt(_930);
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _952 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _926);
    float _954 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _928);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _958 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _964 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _820 + 0.5;
    float _972 = _808 + 0.5;
    float _974 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _976 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _936);
    out.m_61.x = _964;
    out.m_61.y = _966;
    out.m_61.z = _968;
    out.m_61.w = _956;
    bool _978 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _980 = isnan(_938);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _986 = _982 || _984;
    out.m_63.x = _972;
    out.m_63.y = _970;
    out.m_65.x = _958;
    out.m_65.y = _960;
    out.m_65.z = _962;
    out.m_65.w = _974;
    out.m_67.x = _952;
    out.m_67.y = _954;
    out.m_67.z = _976;
    float _988 = _968;
    float _990 = _974;
    if (!_986)
    {
        _830 = 1.0;
    }
    float _992 = _830;
    bool _994 = !_986;
    float _996 = _992;
    if (!_994)
    {
        bool _998 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1000 = isnan(_938);
        bool _1002 = _998 || _1000;
        bool _1004 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1006 = _1002 || _1004;
        if (!_1006)
        {
            float _1008 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1010 = _938 + _1008;
            float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1014 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1012;
            float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1018 = _1016 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1020 = 1.0 / _1014;
            float _1022 = _1010 * _1020;
            float _1024 = fma(_1022, _1018, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _996 = _1024;
            _1026 = true;
        }
        else
        {
            bool _1028 = _938 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1030 = isnan(_938);
            bool _1032 = _1028 || _1030;
            bool _1034 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1036 = _1032 || _1034;
            if (!_1036)
            {
                float _1038 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1040 = _938 + _1038;
                float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1044 = _1042 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1050 = 1.0 / _1044;
                float _1052 = _1040 * _1050;
                float _1054 = fma(_1052, _1048, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _996 = _1054;
                _1026 = true;
            }
            else
            {
                _996 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1026 = false;
    float _1056 = _996;
    float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1060 = _906 + _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1064 = _900 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1068 = _908 + _1066;
    bool _1070 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1074 = _1070 || _1072;
    bool _1076 = isnan(0.5);
    bool _1078 = _1074 || _1076;
    float _1080 = fma(_1060, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1082 = fma(_1064, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1084 = fma(_1068, _1056, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1086 = -_490;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1090 = -_488;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1094 = -_492;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1098 = _1092;
    float _1100 = _1088;
    float _1102 = _1096;
    float _1104 = _1080;
    if (!_1078)
    {
        float _1106 = -_488;
        float _1108 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _406);
        float _1110 = -_490;
        float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _408);
        float _1114 = -_492;
        float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _410);
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1120 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1122 = _1108 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1126 = _1112 + _1124;
        float _1128 = -_410;
        float _1130 = _1128 + _1084;
        float _1132 = _1122 * _1122;
        float _1134 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1136 = _1116 + _1134;
        float _1138 = 1.0 / _584;
        float _1140 = fma(_1126, _1126, _1132);
        float _1142 = fma(_1136, _1136, _1140);
        float _1144 = sqrt(_1142);
        float _1146 = precise::min(_1144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1118;
        float _1150 = -_408;
        float _1152 = _1150 + _1080;
        float _1154 = _1148 * _1138;
        float _1156 = -_406;
        float _1158 = _1156 + _1082;
        float _1160 = fma(_1152, _1154, _1112);
        float _1162 = fma(_1158, _1154, _1108);
        float _1164 = fma(_1130, _1154, _1116);
        _1098 = _1162;
        _1100 = _1160;
        _1102 = _1164;
        _988 = _1154;
    }
    float _1166 = _1098;
    float _1168 = _1100;
    float _1170 = _1102;
    float _1172 = _988;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1176 = _1166 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1168 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1184 = _1170 + _1182;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = fma(_1184, _1184, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1180 * _1194;
    float _1198 = _1184 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1188;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1194;
    float _1222 = _1196;
    if (_1208)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1224;
    }
    float _1226 = _1214;
    if (_1208)
    {
        float _1228 = rsqrt(_1204);
        _1216 = _1228;
    }
    float _1230 = _1216;
    if (_1208)
    {
        float _1232 = _1212 * _1226;
        _1218 = _1232;
    }
    float _1234 = _1218;
    if (_1208)
    {
        float _1236 = _1234 * 0.15915493667125701904296875;
        _990 = _1236;
    }
    float _1238 = _990;
    float _1240 = _1226;
    float _1242 = _1238;
    if (_1208)
    {
        float _1244 = _1238 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1240 = _1246;
    }
    float _1248 = _1240;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _1172;
    float _1256 = _1252;
    if (_1208)
    {
        float _1258 = _1238 * 6.283185482025146484375;
        float _1260 = cos(_1258);
        _1254 = _1260;
    }
    float _1262 = _1254;
    float _1264 = -_1194;
    float _1266 = -_1252;
    float _1268 = fma(_1176, _1264, _1266);
    float _1270 = _1268;
    if (_1208)
    {
        float _1272 = _1268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1272;
    }
    float _1274 = _1256;
    float _1276 = _1274;
    if (!_1208)
    {
        _1242 = _1198;
    }
    float _1278 = _1242;
    float _1280 = _1248;
    float _1282 = _1278;
    if (_1208)
    {
        float _1284 = fma(_1248, _1274, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1280 = _1284;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (_1208)
    {
        float _1290 = _1262 + (-1.0);
        _1276 = _1290;
    }
    float _1292 = _1276;
    float _1294 = _1292;
    if (_1208)
    {
        float _1296 = _1230 * _1286;
        _1104 = _1296;
    }
    float _1298 = _1104;
    if (!_1208)
    {
        _1288 = _1200;
    }
    float _1300 = _1288;
    float _1302 = sqrt(_1190);
    float _1304 = _1300;
    if (_1208)
    {
        float _1306 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1306;
    }
    float _1308 = _1220;
    if (_1208)
    {
        float _1310 = _1196 * _1298;
        _1222 = _1310;
    }
    float _1312 = _1222;
    if (_1208)
    {
        float _1314 = _1198 * _1298;
        _1282 = _1314;
    }
    float _1316 = _1282;
    if (!_1208)
    {
        _1294 = _1202;
    }
    float _1318 = _1294;
    float _1320 = _1318;
    if (_1208)
    {
        float _1322 = fma(_1268, _1262, _1308);
        _1270 = _1322;
    }
    float _1324 = _1270;
    if (_1208)
    {
        float _1326 = _1312 * _1312;
        _1304 = _1326;
    }
    float _1328 = _1304;
    if (_1208)
    {
        float _1330 = _1316 * _1316;
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = fma(_1324, _1324, _1328);
    float _1338 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1340 = _1336 + _1332;
    float _1342 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1346 = fma(_1302, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1344);
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    float _1350 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1352 = rsqrt(_1340);
    float _1354 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1342);
    float _1356 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1358 = -_1348;
    float _1360 = _1358 + 1.0;
    float _1362 = _1166 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1364 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1366 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1356);
    float _1368 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1362);
    float _1370 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1372 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1366);
    float _1374 = abs(_1360);
    float _1376 = log2(_1374);
    float _1378 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1368);
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1384 = _1352 * _1312;
    float _1386 = _1378 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1388 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1390 = -_1380;
    float _1392 = fma(_1390, _1350, 1.0);
    float _1394 = _1352 * _1324;
    float _1396 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1338);
    float _1400 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1388);
    float _1402 = _1352 * _1316;
    float _1404 = -_1396;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1410 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1400);
    float _1412 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1414 = -_1402;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = log2(_1392);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1424 = fma(_1416, -0.5, 0.5);
    float _1426 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1428 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1422);
    float _1430 = fma(_1416, 0.5, 0.5);
    float _1432 = 1.0 / _1420;
    float _1434 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1426);
    float _1436 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1428);
    float _1438 = fma(_1430, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1440 = _1394 + 1.0;
    float _1442 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1434);
    float _1444 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1446 = fma(_1430, _1438, -0.212114393711090087890625);
    float _1448 = exp2(_1412);
    float _1450 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1442);
    float _1452 = _1418 * 0.693147182464599609375;
    float _1454 = fma(_1430, _1446, 1.570728778839111328125);
    float _1456 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1458 = sqrt(_1424);
    float _1460 = _1444 * _1432;
    float _1462 = _1450 * _1432;
    float _1464 = fma(_1460, 0.5, 0.5);
    float _1466 = fma(_1462, -0.5, 0.5);
    float _1468 = -_1394;
    float _1470 = fma(_1448, _1440, _1468);
    float3 _3847 = float3(_1464, _1466, _1456);
    float _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3847, float3(0.0), isnan(_3847)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3847, float3(0.0), isnan(_3847)), level(0.0)).x;
    float3 _3858 = float3(_1464, _1466, _1456);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3858, float3(0.0), isnan(_3858)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3858, float3(0.0), isnan(_3858)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float _1485 = fma(_1470, 0.5, 0.5);
    float _1487 = _1458 * 0.636619746685028076171875;
    float _1489 = -_1454;
    float _1491 = fma(_1487, _1489, 1.0);
    float2 _3885 = float2(_1491, _1485);
    float3 _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3885, float2(0.0), isnan(_3885)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3885, float2(0.0), isnan(_3885)), level(0.0)).xyz;
    float _1497 = _1495.x;
    float _1499 = _1495.y;
    float _1501 = _1495.z;
    float _1503 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1505 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _1180;
    out.m_69.y = _1176;
    out.m_69.z = _1184;
    float _1507 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1505);
    float _1509 = exp2(_1503);
    float _1511 = fma(_1370, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1507);
    float _1513 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1511);
    float _1515 = _1513 + _1420;
    out.gl_Position.x = _1444;
    out.gl_Position.y = _1450;
    out.gl_Position.z = _1513;
    out.gl_Position.w = _1420;
    float _1517 = _1515 * 0.5;
    float _1519 = -_1509;
    float _1521 = _1519 + 1.0;
    float _1523 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1525 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.z = _1517;
    out.m_71.w = _1420;
    out.m_47.x = _1525;
    float _1527 = _1523 * _1472;
    float _1529 = -_1523;
    float _1531 = _1529 + 1.0;
    float _1533 = _1483 * _1527;
    float _1535 = _1483 * _1531;
    float _1537 = _1501 * _1527;
    float _1539 = fma(_1497, _1533, _1477);
    float _1541 = fma(_1499, _1533, _1479);
    float _1543 = fma(_1483, _1537, _1481);
    out.m_73.x = _1539;
    out.m_73.y = _1541;
    out.m_73.z = _1543;
    out.m_73.w = _1535;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.dm_pad5.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.dm_pad5.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.dm_pad5.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.dm_pad5.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

