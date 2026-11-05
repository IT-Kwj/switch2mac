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
    float4 m_55 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1484 = false;
    bool _610 = false;
    bool _456 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1964 = as_type<float>(_106);
        out.gl_Position.z = _1964;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
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
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_144);
        out.gl_Position.z = _2034;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _332;
    float _352 = -_348;
    float _354 = _352 + 1.0;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _358 = _328 * _354;
    float _360 = -_328;
    float _362 = _360 + 1.0;
    float _364 = 1.0 / _336;
    float _366 = _300 * _350;
    float _368 = -_312;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = _348 * _370;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_374, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = _316 * _364;
    float _390 = fma(_380, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _386 * _358;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _400 = _390 * _358;
    float _402 = _392 * _358;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _414 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _416 = fma(_406, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _424 = fma(_416, _376, _412);
    float _426 = fma(_418, _376, _414);
    float _428 = fma(_420, _376, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_356;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_90);
        float _460 = 1.0 / _458;
        float _462 = _124 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _464 + _524;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _530 = _500 * _522;
    float _532 = -_500;
    float _534 = _532 + 1.0;
    float _536 = 1.0 / _488;
    float _538 = _504 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = fma(_538, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = _542 * _536;
    float _548 = -_516;
    float _550 = _548 + 1.0;
    float _552 = _544 * _530;
    float _554 = fma(_546, _526, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _556 = _484 * _550;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = fma(_554, _556, _558);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _566 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _562);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = in.m_51.x;
    float _574 = in.m_51.y;
    float _576 = in.m_51.z;
    float _578 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _566;
    out.m_55.y = _578;
    out.m_55.z = _582;
    out.m_55.w = _580;
    float _584 = _434 * _576;
    float _586 = _432 * _574;
    float _588 = _430 * _572;
    bool _590 = !_528;
    float _608;
    if (!_590)
    {
        float _592 = in.m_53.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_90);
        float _614 = 1.0 / _612;
        float _616 = _124 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_53.z;
    float _622 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _624 = in.m_53.y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _630 = _628 != 0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _638 = _636 != 0;
    float _640 = in.m_53.x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _644 = in.m_53.w;
    bool _646 = !_634;
    int _648 = _646 ? 0 : 1;
    float _650 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _652 = !_638;
    int _654 = _652 ? 0 : 1;
    float _656 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _658 = abs(_648);
    float _660 = in.m_57.x;
    int _662 = abs(_654);
    float _664 = _620 * 2.0;
    float _666 = floor(_664);
    float _668 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _670 = _624 + _620;
    float _672 = _624 * 2.0;
    float _674 = _640 * 2.0;
    float _676 = fma(_668, -2.0, _626);
    float _678 = _670 + (-1.0);
    float _680 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _682 = log2(_680);
    float _684 = _640 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _676);
    bool _690 = _644 > 0.5;
    float _692 = -_642;
    float _694 = fma(_684, 2.0, _692);
    bool _696 = !_630;
    int _698 = _696 ? 0 : 1;
    float _700 = _640 + _624;
    bool _702 = _666 > 0.0;
    float _704 = floor(_674);
    bool _706 = _666 >= 0.0;
    bool _708 = isnan(_666);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _700 + (-1.0);
    int _718 = abs(_698);
    int _720 = _714 ? 0 : 1;
    float _722 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = _682 * _124;
    float _726 = floor(_672);
    int _728 = ~_720;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = float(_718);
    int _736 = _732;
    bool _738 = _690;
    bool _740 = _634;
    if (!_702)
    {
        int _742 = ~_720;
        int _744 = _742 + 1;
        _736 = _744;
    }
    int _746 = _736;
    float _748 = exp2(_724);
    float _750 = float(_746);
    bool _752 = _704 > 0.0;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _756 = _704 >= 0.0;
    bool _758 = isnan(_704);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = _734 * _750;
    float _768 = in.m_59.x;
    float _770 = in.m_59.y;
    float _772 = in.m_59.z;
    int _774 = _764 ? 0 : 1;
    bool _776 = _726 > 0.0;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _780 = 1.0 + _778;
    bool _782 = _726 >= 0.0;
    bool _784 = isnan(_726);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    int _792 = ~_774;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = 1.0 / _780;
    int _800 = _796;
    if (!_752)
    {
        int _802 = ~_774;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[78].z, _754);
    bool _810 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _812 = isnan(1.0);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _818 = _814 || _816;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _834 = -_124;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _838 = -_748;
    float _840 = _838 + 1.0;
    float _842 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    float _844 = float(_806);
    int _846 = _790 ? 0 : 1;
    float _848 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _842);
    float _850 = _830 ? _840 : 0.0;
    int _852 = ~_846;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    int _858 = _856;
    if (_818)
    {
        float _860 = _850 * _798;
        _126 = _860;
    }
    float _862 = _126;
    float _864 = float(_658);
    float _866 = _766 * (-2.0);
    if (!_776)
    {
        int _868 = ~_846;
        int _870 = _868 + 1;
        _858 = _870;
    }
    int _872 = _858;
    float _874 = _864 * _844;
    float _876 = _640 + (-0.5);
    float _878 = fma(_866, _768, _768);
    float _880 = fma(_722, _866, _722);
    float _882 = _874 * (-2.0);
    float _884 = float(_662);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[196].x, _878);
    float _888 = float(_872);
    float _890 = fma(_686, _882, _686);
    float _892 = fma(_882, _770, _770);
    float _894 = fma(_880, _862, _886);
    float _896 = _640 + _620;
    float _898 = _624 + (-0.5);
    float _900 = _884 * _888;
    float _902 = _896 + (-1.0);
    float _904 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _892);
    float _906 = _900 * (-2.0);
    float _908 = in.m_57.y;
    float _910 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _912 = fma(_890, _862, _904);
    float _914 = fma(_906, _772, _772);
    float _916 = _620 + (-0.5);
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    float _924 = fma(_910, _906, _910);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _928 = _926 != 0;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[196].z, _914);
    bool _932 = _624 > 0.5;
    float _934 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _936 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _938 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _940 = _894 * 0.15915493667125701904296875;
    float _942 = _912 * 0.15915493667125701904296875;
    float _944 = fma(_924, _862, _930);
    float _946 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _934);
    float _948 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _936);
    float _950 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _938);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _954 = _952 != 0;
    float _956 = _940 * 6.283185482025146484375;
    float _958 = sin(_956);
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _962 = _960 != 0;
    float _964 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _948);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _968 = _966 != 0;
    float _970 = -_908;
    float _972 = _970 + 1.0;
    float _974 = _944 * 0.15915493667125701904296875;
    float _976 = _964 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _978 = _940 * 6.283185482025146484375;
    float _980 = cos(_978);
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _918);
    int _984 = _690 ? as_type<int>(_972) : as_type<int>(_908);
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    float _988 = _908;
    float _990 = _976;
    float _992 = _972;
    if (_928)
    {
        bool _994 = _620 > 0.5;
        _738 = _994;
    }
    bool _996 = _738;
    float _998 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _946);
    float _1000 = _650 * _982;
    float _1002 = _622 * _986;
    float _1004 = _942 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _922);
    if (_954)
    {
        bool _1010 = _640 > 0.5;
        _740 = _1010;
    }
    bool _1012 = _740;
    float _1014 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _950);
    float _1016 = _656 * _1008;
    float _1018 = _998 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1020 = _942 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _974 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _980 * _1006;
    float _1030 = _974 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = _958 * _1022;
    float _1036 = _980 * _1022;
    float _1038 = -_1028;
    float _1040 = fma(_1026, _1034, _1038);
    float _1042 = -_1034;
    float _1044 = fma(_1026, _1028, _1042);
    float _1046 = _958 * _1006;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1050 = fma(_1026, _1036, _1046);
    float _1052 = fma(_1026, _1046, _1036);
    float _1054 = _1032 * _1002;
    float _1056 = _1006 * _1032;
    float _1058 = _1022 * _1032;
    float _1060 = -_1002;
    float _1062 = _1026 * _1060;
    float _1064 = _980 * _1054;
    float _1066 = _958 * _1054;
    float _1068 = fma(_1058, _1000, _1062);
    float _1070 = fma(_1050, _1000, _1064);
    float _1072 = fma(_1040, _1000, _1066);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = fma(_1044, _1016, _1070);
    float _1084 = fma(_1056, _1016, _1068);
    float _1086 = fma(_1052, _1016, _1072);
    float _1088 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1090 = 1.0 / _1076;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1096 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1098 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1088);
    float _1100 = _1014 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1096);
    bool _1104 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1106 = isnan(_618);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = 1.0 / _1080;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1118;
    float _1122 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1102);
    float _1124 = _1100 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1128 = _618 + _1126;
    float _1130 = 1.0 / _1094;
    float _1132 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1098);
    float _1134 = _1120 * _1090;
    float _1136 = _1018 + _1132;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1136 + _1146;
    float _1150 = _1140 * _1116;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1154 = _1124 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1158 = _618 + _1156;
    float _1160 = _1148 * _1148;
    bool _1162 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1164 = isnan(_618);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = _1154 * _1154;
    float _1176 = fma(_1134, _1158, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1178 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_618);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1192 = _618 + _1190;
    float _1194 = _1160 + _1174;
    float _1196 = _1144 * _1130;
    bool _1198 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1200 = isnan(_618);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = -_1188;
    float _1212 = _1210 + 1.0;
    float _1214 = sqrt(_1194);
    float _1216 = fma(_1150, _1192, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1218 = fma(_1196, _1128, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1220 = _1172 * _1212;
    float _1222 = -_1172;
    float _1224 = _1222 + 1.0;
    float _1226 = -_1208;
    float _1228 = _1226 + 1.0;
    float _1230 = _1128;
    float _1232 = _1082;
    int _1234 = as_type<int>(_1154);
    if (!_954)
    {
        _1230 = _660;
    }
    float _1236 = _1230;
    float _1238 = _1208 * _1224;
    float _1240 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1244 = _1236;
    if (!_954)
    {
        _1232 = _1236;
    }
    float _1246 = _1232;
    float _1248 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1240);
    float _1250 = _1114 * _1228;
    float _1252 = _962 ? as_type<float>(_984) : _908;
    float _1254 = -_1114;
    float _1256 = _1254 + 1.0;
    bool _1258 = _1214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = _1176 * _1250;
    int _1262 = as_type<int>(_1248);
    float _1264 = _1246;
    if (_954)
    {
        _1244 = _660;
    }
    float _1266 = _1244;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1270 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1272 = _1270;
    float _1274 = _1266;
    if (_968)
    {
        float _1276 = _932 ? _972 : _908;
        _988 = _1276;
    }
    float _1278 = _988;
    float _1280 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1260);
    float _1282 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1284 = _1282;
    float _1286 = _1278;
    if (_954)
    {
        float _1288 = -_1266;
        float _1290 = _1288 + 1.0;
        _1262 = as_type<int>(_1290);
    }
    int _1292 = _1262;
    float _1294 = _976 + _1270;
    float _1296 = fma(_1282, _1278, -0.5);
    if (_954)
    {
        float _1298 = _1012 ? as_type<float>(_1292) : _1266;
        _1264 = _1298;
    }
    float _1300 = _1264;
    if (!_1258)
    {
        _1272 = _1174;
    }
    float _1302 = _1272;
    float _1304 = _1302;
    if (!_1258)
    {
        _990 = _1160;
    }
    float _1306 = _990;
    float _1308 = _1306;
    if (!_1258)
    {
        _992 = _1136;
    }
    float _1310 = _992;
    float _1312 = _1310;
    if (!_1258)
    {
        _1284 = _1124;
    }
    float _1314 = _1284;
    float _1316 = _1314;
    if (!_1258)
    {
        _1286 = _1294;
    }
    float _1318 = _1286;
    bool _1320 = !_1258;
    float _1322 = _1318;
    if (!_1320)
    {
        float _1324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1328 = _1214 + _1326;
        float _1330 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = rsqrt(_1194);
        float _1334 = _1328 * _1324;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = _1336 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = fma(_1340, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = _1332 * _1346;
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1148, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1154, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1356 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1360 = _1352 + _1358;
        float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1364 = _1354 + _1362;
        float _1366 = fma(_1294, _1344, _1356);
        float _1368 = _1360 * _1360;
        float _1370 = _1364 * _1364;
        _1322 = _1366;
        _1308 = _1368;
        _1304 = _1370;
        _1312 = _1352;
        _1316 = _1354;
    }
    float _1372 = _1322;
    float _1374 = _1308;
    float _1376 = _1304;
    float _1378 = _1312;
    float _1380 = _1316;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1384 = _1372 + _1382;
    float _1386 = _1372;
    if (_928)
    {
        float _1388 = -_1266;
        float _1390 = _1388 + 1.0;
        _1234 = as_type<int>(_1390);
    }
    int _1392 = _1234;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1396 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1398 = fma(_1384, _1384, _1374);
    float _1400 = fma(_1216, _1238, _1280);
    if (_928)
    {
        float _1402 = _996 ? as_type<float>(_1392) : _1266;
        _1274 = _1402;
    }
    float _1404 = _1274;
    float _1406 = fma(_1396, _1300, -0.5);
    float _1408 = _1398 + _1376;
    float _1410 = fma(_1218, _1220, _1400);
    float _1412 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1414 = -_688;
    float _1416 = fma(_848, _1296, _1414);
    float _1418 = sqrt(_1408);
    float _1420 = fma(_832, _1406, _836);
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1424 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1410);
    float _1426 = _1412 * _1268;
    float _1428 = _1422 * _1394;
    float _1430 = _1416 + 0.5;
    float _1432 = _1420 + 0.5;
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1432;
    out.m_65.y = _1430;
    out.m_65.z = _1428;
    out.m_65.w = _1426;
    bool _1436 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1418);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_67.w = _1434;
    float _1446 = _1408;
    float _1448 = _1430;
    if (!_1444)
    {
        _1446 = 1.0;
    }
    float _1450 = _1446;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1418);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1418 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1418);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1418 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1518 = _1372 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1522 = _1378 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1526 = _1380 + _1524;
    float _1528 = fma(_1518, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1530 = fma(_1522, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1532 = fma(_1526, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1536 = _1528 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1530 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1544 = _1532 + _1542;
    float _1546 = _1536 * _1536;
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = fma(_1544, _1544, _1548);
    float _1552 = rsqrt(_1550);
    float _1554 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1540 * _1554;
    float _1558 = _1544 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 + _1562;
    float _1566 = sqrt(_1564);
    bool _1568 = _1566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1566 + _1570;
    float _1574 = _1544;
    float _1576 = _1552;
    float _1578 = _1572;
    float _1580 = _1554;
    float _1582 = _1556;
    if (_1568)
    {
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1584;
    }
    float _1586 = _1574;
    if (_1568)
    {
        float _1588 = rsqrt(_1564);
        _1576 = _1588;
    }
    float _1590 = _1576;
    float _1592 = _1590;
    if (_1568)
    {
        float _1594 = _1572 * _1586;
        _1578 = _1594;
    }
    float _1596 = _1578;
    if (_1568)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _1386 = _1598;
    }
    float _1600 = _1386;
    float _1602 = _1586;
    if (_1568)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1416;
    float _1616 = _1612;
    if (_1568)
    {
        float _1618 = _1600 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = -_1554;
    float _1626 = -_1612;
    float _1628 = fma(_1536, _1624, _1626);
    float _1630 = _1628;
    if (_1568)
    {
        float _1632 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1632;
    }
    float _1634 = _1616;
    float _1636 = sqrt(_1550);
    float _1638 = _1608;
    float _1640 = _1634;
    if (_1568)
    {
        float _1642 = fma(_1608, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1642;
    }
    float _1644 = _1580;
    float _1646 = _1644;
    if (!_1568)
    {
        _1638 = _1558;
    }
    float _1648 = _1638;
    float _1650 = _1648;
    if (_1568)
    {
        float _1652 = _1622 + (-1.0);
        _1640 = _1652;
    }
    float _1654 = _1640;
    float _1656 = _1654;
    if (_1568)
    {
        float _1658 = _1590 * _1644;
        _1448 = _1658;
    }
    float _1660 = _1448;
    if (!_1568)
    {
        _1592 = _1628;
    }
    float _1662 = _1592;
    float _1664 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1666 = _1662;
    if (_1568)
    {
        float _1668 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1646 = _1668;
    }
    float _1670 = _1646;
    if (_1568)
    {
        float _1672 = _1556 * _1660;
        _1582 = _1672;
    }
    float _1674 = _1582;
    if (!_1568)
    {
        _1656 = _1560;
    }
    float _1676 = _1656;
    float _1678 = _1676;
    if (_1568)
    {
        float _1680 = _1558 * _1660;
        _1650 = _1680;
    }
    float _1682 = _1650;
    if (_1568)
    {
        float _1684 = fma(_1628, _1622, _1670);
        _1666 = _1684;
    }
    float _1686 = _1666;
    if (_1568)
    {
        float _1688 = _1674 * _1674;
        _1678 = _1688;
    }
    float _1690 = _1678;
    if (!_1568)
    {
        _1630 = _1562;
    }
    float _1692 = _1630;
    float _1694 = _1692;
    if (_1568)
    {
        float _1696 = _1682 * _1682;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = fma(_1686, _1686, _1690);
    float _1702 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1664);
    float _1704 = _1700 + _1698;
    float _1706 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1710 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1708);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1716 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1706);
    float _1718 = rsqrt(_1704);
    float _1720 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = -_1712;
    float _1724 = _1722 + 1.0;
    float _1726 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1728 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1730 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1732 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1728);
    float _1736 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1738 = abs(_1724);
    float _1740 = log2(_1738);
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1744 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1734);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = -_1742;
    float _1750 = fma(_1748, _1714, 1.0);
    float _1752 = _1718 * _1674;
    float _1754 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1718 * _1686;
    float _1762 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1764 = _1718 * _1682;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1770 = -_1762;
    float _1772 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1770);
    float _1774 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1776 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1750);
    float _1780 = -_1764;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1772);
    float _1784 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1790 = fma(_1782, -0.5, 0.5);
    float _1792 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1794 = fma(_1782, 0.5, 0.5);
    float _1796 = exp2(_1774);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1788);
    float _1800 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1802 = _1760 + 1.0;
    float _1804 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1800);
    float _1810 = 1.0 / _1786;
    float _1812 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = fma(_1794, _1804, -0.212114393711090087890625);
    float _1816 = _1778 * 0.693147182464599609375;
    float _1818 = fma(_1794, _1814, 1.570728778839111328125);
    float _1820 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = sqrt(_1790);
    float _1824 = -_1760;
    float _1826 = fma(_1796, _1802, _1824);
    float _1828 = fma(_1826, 0.5, 0.5);
    float _1830 = _1808 * _1810;
    float _1832 = _1812 * _1810;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1822 * 0.636619746685028076171875;
    float3 _4733 = float3(_1834, _1836, _1820);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4733, float3(0.0), isnan(_4733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4733, float3(0.0), isnan(_4733)), level(0.0)).x;
    float _1842 = -_1818;
    float _1844 = fma(_1838, _1842, 1.0);
    float3 _4749 = float3(_1834, _1836, _1820);
    float4 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4749, float3(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4749, float3(0.0), isnan(_4749)), level(0.0)).xyzw;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = _1847.w;
    float2 _4766 = float2(_1844, _1828);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4766, float2(0.0), isnan(_4766)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4766, float2(0.0), isnan(_4766)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1869 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1871 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1873 = exp2(_1867);
    float _1875 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1871);
    float _1877 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1875);
    float _1879 = _1877 + _1786;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _1877;
    out.gl_Position.w = _1786;
    float _1881 = _1879 * 0.5;
    float _1883 = -_1873;
    float _1885 = _1883 + 1.0;
    float _1887 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1881;
    out.m_69.w = _1786;
    out.m_47.x = _1887;
    float _1891 = _1889 * _1840;
    float _1893 = -_1889;
    float _1895 = _1893 + 1.0;
    float _1897 = _1855 * _1891;
    float _1899 = _1855 * _1895;
    float _1901 = _1865 * _1891;
    float _1903 = fma(_1861, _1897, _1849);
    float _1905 = fma(_1863, _1897, _1851);
    float _1907 = fma(_1855, _1901, _1853);
    out.m_71.x = _1903;
    out.m_71.y = _1905;
    out.m_71.z = _1907;
    out.m_71.w = _1899;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1484 = false;
    bool _610 = false;
    bool _456 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1964 = as_type<float>(_106);
        out.gl_Position.z = _1964;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
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
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_144);
        out.gl_Position.z = _2034;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _332;
    float _352 = -_348;
    float _354 = _352 + 1.0;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _358 = _328 * _354;
    float _360 = -_328;
    float _362 = _360 + 1.0;
    float _364 = 1.0 / _336;
    float _366 = _300 * _350;
    float _368 = -_312;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = _348 * _370;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_374, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = _316 * _364;
    float _390 = fma(_380, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _386 * _358;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _400 = _390 * _358;
    float _402 = _392 * _358;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _414 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _416 = fma(_406, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _424 = fma(_416, _376, _412);
    float _426 = fma(_418, _376, _414);
    float _428 = fma(_420, _376, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_356;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_90);
        float _460 = 1.0 / _458;
        float _462 = _124 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _464 + _524;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _530 = _500 * _522;
    float _532 = -_500;
    float _534 = _532 + 1.0;
    float _536 = 1.0 / _488;
    float _538 = _504 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = fma(_538, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = _542 * _536;
    float _548 = -_516;
    float _550 = _548 + 1.0;
    float _552 = _544 * _530;
    float _554 = fma(_546, _526, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _556 = _484 * _550;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = fma(_554, _556, _558);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _566 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _562);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = in.m_51.x;
    float _574 = in.m_51.y;
    float _576 = in.m_51.z;
    float _578 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _566;
    out.m_55.y = _578;
    out.m_55.z = _582;
    out.m_55.w = _580;
    float _584 = _434 * _576;
    float _586 = _432 * _574;
    float _588 = _430 * _572;
    bool _590 = !_528;
    float _608;
    if (!_590)
    {
        float _592 = in.m_53.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_90);
        float _614 = 1.0 / _612;
        float _616 = _124 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_53.z;
    float _622 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _624 = in.m_53.y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _630 = _628 != 0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _638 = _636 != 0;
    float _640 = in.m_53.x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _644 = in.m_53.w;
    bool _646 = !_634;
    int _648 = _646 ? 0 : 1;
    float _650 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _652 = !_638;
    int _654 = _652 ? 0 : 1;
    float _656 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _658 = abs(_648);
    float _660 = in.m_57.x;
    int _662 = abs(_654);
    float _664 = _620 * 2.0;
    float _666 = floor(_664);
    float _668 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _670 = _624 + _620;
    float _672 = _624 * 2.0;
    float _674 = _640 * 2.0;
    float _676 = fma(_668, -2.0, _626);
    float _678 = _670 + (-1.0);
    float _680 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _682 = log2(_680);
    float _684 = _640 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _676);
    bool _690 = _644 > 0.5;
    float _692 = -_642;
    float _694 = fma(_684, 2.0, _692);
    bool _696 = !_630;
    int _698 = _696 ? 0 : 1;
    float _700 = _640 + _624;
    bool _702 = _666 > 0.0;
    float _704 = floor(_674);
    bool _706 = _666 >= 0.0;
    bool _708 = isnan(_666);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _700 + (-1.0);
    int _718 = abs(_698);
    int _720 = _714 ? 0 : 1;
    float _722 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = _682 * _124;
    float _726 = floor(_672);
    int _728 = ~_720;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = float(_718);
    int _736 = _732;
    bool _738 = _690;
    bool _740 = _634;
    if (!_702)
    {
        int _742 = ~_720;
        int _744 = _742 + 1;
        _736 = _744;
    }
    int _746 = _736;
    float _748 = exp2(_724);
    float _750 = float(_746);
    bool _752 = _704 > 0.0;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _756 = _704 >= 0.0;
    bool _758 = isnan(_704);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = _734 * _750;
    float _768 = in.m_59.x;
    float _770 = in.m_59.y;
    float _772 = in.m_59.z;
    int _774 = _764 ? 0 : 1;
    bool _776 = _726 > 0.0;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _780 = 1.0 + _778;
    bool _782 = _726 >= 0.0;
    bool _784 = isnan(_726);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    int _792 = ~_774;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = 1.0 / _780;
    int _800 = _796;
    if (!_752)
    {
        int _802 = ~_774;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[78].z, _754);
    bool _810 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _812 = isnan(1.0);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _818 = _814 || _816;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _834 = -_124;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _838 = -_748;
    float _840 = _838 + 1.0;
    float _842 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    float _844 = float(_806);
    int _846 = _790 ? 0 : 1;
    float _848 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _842);
    float _850 = _830 ? _840 : 0.0;
    int _852 = ~_846;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    int _858 = _856;
    if (_818)
    {
        float _860 = _850 * _798;
        _126 = _860;
    }
    float _862 = _126;
    float _864 = float(_658);
    float _866 = _766 * (-2.0);
    if (!_776)
    {
        int _868 = ~_846;
        int _870 = _868 + 1;
        _858 = _870;
    }
    int _872 = _858;
    float _874 = _864 * _844;
    float _876 = _640 + (-0.5);
    float _878 = fma(_866, _768, _768);
    float _880 = fma(_722, _866, _722);
    float _882 = _874 * (-2.0);
    float _884 = float(_662);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[196].x, _878);
    float _888 = float(_872);
    float _890 = fma(_686, _882, _686);
    float _892 = fma(_882, _770, _770);
    float _894 = fma(_880, _862, _886);
    float _896 = _640 + _620;
    float _898 = _624 + (-0.5);
    float _900 = _884 * _888;
    float _902 = _896 + (-1.0);
    float _904 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _892);
    float _906 = _900 * (-2.0);
    float _908 = in.m_57.y;
    float _910 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _912 = fma(_890, _862, _904);
    float _914 = fma(_906, _772, _772);
    float _916 = _620 + (-0.5);
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    float _924 = fma(_910, _906, _910);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _928 = _926 != 0;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[196].z, _914);
    bool _932 = _624 > 0.5;
    float _934 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _936 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _938 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _940 = _894 * 0.15915493667125701904296875;
    float _942 = _912 * 0.15915493667125701904296875;
    float _944 = fma(_924, _862, _930);
    float _946 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _934);
    float _948 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _936);
    float _950 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _938);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _954 = _952 != 0;
    float _956 = _940 * 6.283185482025146484375;
    float _958 = sin(_956);
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _962 = _960 != 0;
    float _964 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _948);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _968 = _966 != 0;
    float _970 = -_908;
    float _972 = _970 + 1.0;
    float _974 = _944 * 0.15915493667125701904296875;
    float _976 = _964 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _978 = _940 * 6.283185482025146484375;
    float _980 = cos(_978);
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _918);
    int _984 = _690 ? as_type<int>(_972) : as_type<int>(_908);
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    float _988 = _908;
    float _990 = _976;
    float _992 = _972;
    if (_928)
    {
        bool _994 = _620 > 0.5;
        _738 = _994;
    }
    bool _996 = _738;
    float _998 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _946);
    float _1000 = _650 * _982;
    float _1002 = _622 * _986;
    float _1004 = _942 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _922);
    if (_954)
    {
        bool _1010 = _640 > 0.5;
        _740 = _1010;
    }
    bool _1012 = _740;
    float _1014 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _950);
    float _1016 = _656 * _1008;
    float _1018 = _998 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1020 = _942 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _974 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _980 * _1006;
    float _1030 = _974 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = _958 * _1022;
    float _1036 = _980 * _1022;
    float _1038 = -_1028;
    float _1040 = fma(_1026, _1034, _1038);
    float _1042 = -_1034;
    float _1044 = fma(_1026, _1028, _1042);
    float _1046 = _958 * _1006;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1050 = fma(_1026, _1036, _1046);
    float _1052 = fma(_1026, _1046, _1036);
    float _1054 = _1032 * _1002;
    float _1056 = _1006 * _1032;
    float _1058 = _1022 * _1032;
    float _1060 = -_1002;
    float _1062 = _1026 * _1060;
    float _1064 = _980 * _1054;
    float _1066 = _958 * _1054;
    float _1068 = fma(_1058, _1000, _1062);
    float _1070 = fma(_1050, _1000, _1064);
    float _1072 = fma(_1040, _1000, _1066);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = fma(_1044, _1016, _1070);
    float _1084 = fma(_1056, _1016, _1068);
    float _1086 = fma(_1052, _1016, _1072);
    float _1088 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1090 = 1.0 / _1076;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1096 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1098 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1088);
    float _1100 = _1014 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1096);
    bool _1104 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1106 = isnan(_618);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = 1.0 / _1080;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1118;
    float _1122 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1102);
    float _1124 = _1100 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1128 = _618 + _1126;
    float _1130 = 1.0 / _1094;
    float _1132 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1098);
    float _1134 = _1120 * _1090;
    float _1136 = _1018 + _1132;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1136 + _1146;
    float _1150 = _1140 * _1116;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1154 = _1124 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1158 = _618 + _1156;
    float _1160 = _1148 * _1148;
    bool _1162 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1164 = isnan(_618);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = _1154 * _1154;
    float _1176 = fma(_1134, _1158, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1178 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_618);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1192 = _618 + _1190;
    float _1194 = _1160 + _1174;
    float _1196 = _1144 * _1130;
    bool _1198 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1200 = isnan(_618);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = -_1188;
    float _1212 = _1210 + 1.0;
    float _1214 = sqrt(_1194);
    float _1216 = fma(_1150, _1192, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1218 = fma(_1196, _1128, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1220 = _1172 * _1212;
    float _1222 = -_1172;
    float _1224 = _1222 + 1.0;
    float _1226 = -_1208;
    float _1228 = _1226 + 1.0;
    float _1230 = _1128;
    float _1232 = _1082;
    int _1234 = as_type<int>(_1154);
    if (!_954)
    {
        _1230 = _660;
    }
    float _1236 = _1230;
    float _1238 = _1208 * _1224;
    float _1240 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1244 = _1236;
    if (!_954)
    {
        _1232 = _1236;
    }
    float _1246 = _1232;
    float _1248 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1240);
    float _1250 = _1114 * _1228;
    float _1252 = _962 ? as_type<float>(_984) : _908;
    float _1254 = -_1114;
    float _1256 = _1254 + 1.0;
    bool _1258 = _1214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = _1176 * _1250;
    int _1262 = as_type<int>(_1248);
    float _1264 = _1246;
    if (_954)
    {
        _1244 = _660;
    }
    float _1266 = _1244;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1270 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1272 = _1270;
    float _1274 = _1266;
    if (_968)
    {
        float _1276 = _932 ? _972 : _908;
        _988 = _1276;
    }
    float _1278 = _988;
    float _1280 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1260);
    float _1282 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1284 = _1282;
    float _1286 = _1278;
    if (_954)
    {
        float _1288 = -_1266;
        float _1290 = _1288 + 1.0;
        _1262 = as_type<int>(_1290);
    }
    int _1292 = _1262;
    float _1294 = _976 + _1270;
    float _1296 = fma(_1282, _1278, -0.5);
    if (_954)
    {
        float _1298 = _1012 ? as_type<float>(_1292) : _1266;
        _1264 = _1298;
    }
    float _1300 = _1264;
    if (!_1258)
    {
        _1272 = _1174;
    }
    float _1302 = _1272;
    float _1304 = _1302;
    if (!_1258)
    {
        _990 = _1160;
    }
    float _1306 = _990;
    float _1308 = _1306;
    if (!_1258)
    {
        _992 = _1136;
    }
    float _1310 = _992;
    float _1312 = _1310;
    if (!_1258)
    {
        _1284 = _1124;
    }
    float _1314 = _1284;
    float _1316 = _1314;
    if (!_1258)
    {
        _1286 = _1294;
    }
    float _1318 = _1286;
    bool _1320 = !_1258;
    float _1322 = _1318;
    if (!_1320)
    {
        float _1324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1328 = _1214 + _1326;
        float _1330 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = rsqrt(_1194);
        float _1334 = _1328 * _1324;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = _1336 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = fma(_1340, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = _1332 * _1346;
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1148, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1154, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1356 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1360 = _1352 + _1358;
        float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1364 = _1354 + _1362;
        float _1366 = fma(_1294, _1344, _1356);
        float _1368 = _1360 * _1360;
        float _1370 = _1364 * _1364;
        _1322 = _1366;
        _1308 = _1368;
        _1304 = _1370;
        _1312 = _1352;
        _1316 = _1354;
    }
    float _1372 = _1322;
    float _1374 = _1308;
    float _1376 = _1304;
    float _1378 = _1312;
    float _1380 = _1316;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1384 = _1372 + _1382;
    float _1386 = _1372;
    if (_928)
    {
        float _1388 = -_1266;
        float _1390 = _1388 + 1.0;
        _1234 = as_type<int>(_1390);
    }
    int _1392 = _1234;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1396 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1398 = fma(_1384, _1384, _1374);
    float _1400 = fma(_1216, _1238, _1280);
    if (_928)
    {
        float _1402 = _996 ? as_type<float>(_1392) : _1266;
        _1274 = _1402;
    }
    float _1404 = _1274;
    float _1406 = fma(_1396, _1300, -0.5);
    float _1408 = _1398 + _1376;
    float _1410 = fma(_1218, _1220, _1400);
    float _1412 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1414 = -_688;
    float _1416 = fma(_848, _1296, _1414);
    float _1418 = sqrt(_1408);
    float _1420 = fma(_832, _1406, _836);
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1424 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1410);
    float _1426 = _1412 * _1268;
    float _1428 = _1422 * _1394;
    float _1430 = _1416 + 0.5;
    float _1432 = _1420 + 0.5;
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1432;
    out.m_65.y = _1430;
    out.m_65.z = _1428;
    out.m_65.w = _1426;
    bool _1436 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1418);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_67.w = _1434;
    float _1446 = _1408;
    float _1448 = _1430;
    if (!_1444)
    {
        _1446 = 1.0;
    }
    float _1450 = _1446;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1418);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1418 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1418);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1418 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1518 = _1372 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1522 = _1378 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1526 = _1380 + _1524;
    float _1528 = fma(_1518, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1530 = fma(_1522, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1532 = fma(_1526, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1536 = _1528 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1530 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1544 = _1532 + _1542;
    float _1546 = _1536 * _1536;
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = fma(_1544, _1544, _1548);
    float _1552 = rsqrt(_1550);
    float _1554 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1540 * _1554;
    float _1558 = _1544 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 + _1562;
    float _1566 = sqrt(_1564);
    bool _1568 = _1566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1566 + _1570;
    float _1574 = _1544;
    float _1576 = _1552;
    float _1578 = _1572;
    float _1580 = _1554;
    float _1582 = _1556;
    if (_1568)
    {
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1584;
    }
    float _1586 = _1574;
    if (_1568)
    {
        float _1588 = rsqrt(_1564);
        _1576 = _1588;
    }
    float _1590 = _1576;
    float _1592 = _1590;
    if (_1568)
    {
        float _1594 = _1572 * _1586;
        _1578 = _1594;
    }
    float _1596 = _1578;
    if (_1568)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _1386 = _1598;
    }
    float _1600 = _1386;
    float _1602 = _1586;
    if (_1568)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1416;
    float _1616 = _1612;
    if (_1568)
    {
        float _1618 = _1600 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = -_1554;
    float _1626 = -_1612;
    float _1628 = fma(_1536, _1624, _1626);
    float _1630 = _1628;
    if (_1568)
    {
        float _1632 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1632;
    }
    float _1634 = _1616;
    float _1636 = sqrt(_1550);
    float _1638 = _1608;
    float _1640 = _1634;
    if (_1568)
    {
        float _1642 = fma(_1608, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1642;
    }
    float _1644 = _1580;
    float _1646 = _1644;
    if (!_1568)
    {
        _1638 = _1558;
    }
    float _1648 = _1638;
    float _1650 = _1648;
    if (_1568)
    {
        float _1652 = _1622 + (-1.0);
        _1640 = _1652;
    }
    float _1654 = _1640;
    float _1656 = _1654;
    if (_1568)
    {
        float _1658 = _1590 * _1644;
        _1448 = _1658;
    }
    float _1660 = _1448;
    if (!_1568)
    {
        _1592 = _1628;
    }
    float _1662 = _1592;
    float _1664 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1666 = _1662;
    if (_1568)
    {
        float _1668 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1646 = _1668;
    }
    float _1670 = _1646;
    if (_1568)
    {
        float _1672 = _1556 * _1660;
        _1582 = _1672;
    }
    float _1674 = _1582;
    if (!_1568)
    {
        _1656 = _1560;
    }
    float _1676 = _1656;
    float _1678 = _1676;
    if (_1568)
    {
        float _1680 = _1558 * _1660;
        _1650 = _1680;
    }
    float _1682 = _1650;
    if (_1568)
    {
        float _1684 = fma(_1628, _1622, _1670);
        _1666 = _1684;
    }
    float _1686 = _1666;
    if (_1568)
    {
        float _1688 = _1674 * _1674;
        _1678 = _1688;
    }
    float _1690 = _1678;
    if (!_1568)
    {
        _1630 = _1562;
    }
    float _1692 = _1630;
    float _1694 = _1692;
    if (_1568)
    {
        float _1696 = _1682 * _1682;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = fma(_1686, _1686, _1690);
    float _1702 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1664);
    float _1704 = _1700 + _1698;
    float _1706 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1710 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1708);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1716 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1706);
    float _1718 = rsqrt(_1704);
    float _1720 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = -_1712;
    float _1724 = _1722 + 1.0;
    float _1726 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1728 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1730 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1732 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1728);
    float _1736 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1738 = abs(_1724);
    float _1740 = log2(_1738);
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1744 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1734);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = -_1742;
    float _1750 = fma(_1748, _1714, 1.0);
    float _1752 = _1718 * _1674;
    float _1754 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1718 * _1686;
    float _1762 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1764 = _1718 * _1682;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1770 = -_1762;
    float _1772 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1770);
    float _1774 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1776 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1750);
    float _1780 = -_1764;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1772);
    float _1784 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1790 = fma(_1782, -0.5, 0.5);
    float _1792 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1794 = fma(_1782, 0.5, 0.5);
    float _1796 = exp2(_1774);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1788);
    float _1800 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1802 = _1760 + 1.0;
    float _1804 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1800);
    float _1810 = 1.0 / _1786;
    float _1812 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = fma(_1794, _1804, -0.212114393711090087890625);
    float _1816 = _1778 * 0.693147182464599609375;
    float _1818 = fma(_1794, _1814, 1.570728778839111328125);
    float _1820 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = sqrt(_1790);
    float _1824 = -_1760;
    float _1826 = fma(_1796, _1802, _1824);
    float _1828 = fma(_1826, 0.5, 0.5);
    float _1830 = _1808 * _1810;
    float _1832 = _1812 * _1810;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1822 * 0.636619746685028076171875;
    float3 _4733 = float3(_1834, _1836, _1820);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4733, float3(0.0), isnan(_4733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4733, float3(0.0), isnan(_4733)), level(0.0)).x;
    float _1842 = -_1818;
    float _1844 = fma(_1838, _1842, 1.0);
    float3 _4749 = float3(_1834, _1836, _1820);
    float4 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4749, float3(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4749, float3(0.0), isnan(_4749)), level(0.0)).xyzw;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = _1847.w;
    float2 _4766 = float2(_1844, _1828);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4766, float2(0.0), isnan(_4766)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4766, float2(0.0), isnan(_4766)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1869 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1871 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1873 = exp2(_1867);
    float _1875 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1871);
    float _1877 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1875);
    float _1879 = _1877 + _1786;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _1877;
    out.gl_Position.w = _1786;
    float _1881 = _1879 * 0.5;
    float _1883 = -_1873;
    float _1885 = _1883 + 1.0;
    float _1887 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1881;
    out.m_69.w = _1786;
    out.m_47.x = _1887;
    float _1891 = _1889 * _1840;
    float _1893 = -_1889;
    float _1895 = _1893 + 1.0;
    float _1897 = _1855 * _1891;
    float _1899 = _1855 * _1895;
    float _1901 = _1865 * _1891;
    float _1903 = fma(_1861, _1897, _1849);
    float _1905 = fma(_1863, _1897, _1851);
    float _1907 = fma(_1855, _1901, _1853);
    out.m_71.x = _1903;
    out.m_71.y = _1905;
    out.m_71.z = _1907;
    out.m_71.w = _1899;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1484 = false;
    bool _610 = false;
    bool _456 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1964 = as_type<float>(_106);
        out.gl_Position.z = _1964;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
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
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_144);
        out.gl_Position.z = _2034;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _332;
    float _352 = -_348;
    float _354 = _352 + 1.0;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _358 = _328 * _354;
    float _360 = -_328;
    float _362 = _360 + 1.0;
    float _364 = 1.0 / _336;
    float _366 = _300 * _350;
    float _368 = -_312;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _372;
    float _376 = _348 * _370;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    float _386 = fma(_374, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _388 = _316 * _364;
    float _390 = fma(_380, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _392 = fma(_384, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _386 * _358;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _400 = _390 * _358;
    float _402 = _392 * _358;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _414 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _416 = fma(_406, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_398, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _424 = fma(_416, _376, _412);
    float _426 = fma(_418, _376, _414);
    float _428 = fma(_420, _376, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_356;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_90);
        float _460 = 1.0 / _458;
        float _462 = _124 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _464 + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _474 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _476 = isnan(_464);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _482 = _478 || _480;
    float _484 = float(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _490 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _492 = isnan(_464);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _502;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = 1.0 / _472;
    float _520 = -_484;
    float _522 = _520 + 1.0;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _464 + _524;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _530 = _500 * _522;
    float _532 = -_500;
    float _534 = _532 + 1.0;
    float _536 = 1.0 / _488;
    float _538 = _504 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = fma(_538, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = _542 * _536;
    float _548 = -_516;
    float _550 = _548 + 1.0;
    float _552 = _544 * _530;
    float _554 = fma(_546, _526, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _556 = _484 * _550;
    float _558 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[115].x, _552);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = fma(_554, _556, _558);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _566 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[117].x, _562);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = in.m_51.x;
    float _574 = in.m_51.y;
    float _576 = in.m_51.z;
    float _578 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _582 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _566;
    out.m_55.y = _578;
    out.m_55.z = _582;
    out.m_55.w = _580;
    float _584 = _434 * _576;
    float _586 = _432 * _574;
    float _588 = _430 * _572;
    bool _590 = !_528;
    float _608;
    if (!_590)
    {
        float _592 = in.m_53.x;
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _596 = _592 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_90);
        float _614 = 1.0 / _612;
        float _616 = _124 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_53.z;
    float _622 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _624 = in.m_53.y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _630 = _628 != 0;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _638 = _636 != 0;
    float _640 = in.m_53.x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _644 = in.m_53.w;
    bool _646 = !_634;
    int _648 = _646 ? 0 : 1;
    float _650 = _588 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _652 = !_638;
    int _654 = _652 ? 0 : 1;
    float _656 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _658 = abs(_648);
    float _660 = in.m_57.x;
    int _662 = abs(_654);
    float _664 = _620 * 2.0;
    float _666 = floor(_664);
    float _668 = _624 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _670 = _624 + _620;
    float _672 = _624 * 2.0;
    float _674 = _640 * 2.0;
    float _676 = fma(_668, -2.0, _626);
    float _678 = _670 + (-1.0);
    float _680 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _682 = log2(_680);
    float _684 = _640 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _686 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _688 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _676);
    bool _690 = _644 > 0.5;
    float _692 = -_642;
    float _694 = fma(_684, 2.0, _692);
    bool _696 = !_630;
    int _698 = _696 ? 0 : 1;
    float _700 = _640 + _624;
    bool _702 = _666 > 0.0;
    float _704 = floor(_674);
    bool _706 = _666 >= 0.0;
    bool _708 = isnan(_666);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = _700 + (-1.0);
    int _718 = abs(_698);
    int _720 = _714 ? 0 : 1;
    float _722 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _724 = _682 * _124;
    float _726 = floor(_672);
    int _728 = ~_720;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = float(_718);
    int _736 = _732;
    bool _738 = _690;
    bool _740 = _634;
    if (!_702)
    {
        int _742 = ~_720;
        int _744 = _742 + 1;
        _736 = _744;
    }
    int _746 = _736;
    float _748 = exp2(_724);
    float _750 = float(_746);
    bool _752 = _704 > 0.0;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _756 = _704 >= 0.0;
    bool _758 = isnan(_704);
    bool _760 = _756 || _758;
    bool _762 = isnan(0.0);
    bool _764 = _760 || _762;
    float _766 = _734 * _750;
    float _768 = in.m_59.x;
    float _770 = in.m_59.y;
    float _772 = in.m_59.z;
    int _774 = _764 ? 0 : 1;
    bool _776 = _726 > 0.0;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _780 = 1.0 + _778;
    bool _782 = _726 >= 0.0;
    bool _784 = isnan(_726);
    bool _786 = _782 || _784;
    bool _788 = isnan(0.0);
    bool _790 = _786 || _788;
    int _792 = ~_774;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = 1.0 / _780;
    int _800 = _796;
    if (!_752)
    {
        int _802 = ~_774;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[78].z, _754);
    bool _810 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _812 = isnan(1.0);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _818 = _814 || _816;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _808);
    float _834 = -_124;
    float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _838 = -_748;
    float _840 = _838 + 1.0;
    float _842 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    float _844 = float(_806);
    int _846 = _790 ? 0 : 1;
    float _848 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _842);
    float _850 = _830 ? _840 : 0.0;
    int _852 = ~_846;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    int _858 = _856;
    if (_818)
    {
        float _860 = _850 * _798;
        _126 = _860;
    }
    float _862 = _126;
    float _864 = float(_658);
    float _866 = _766 * (-2.0);
    if (!_776)
    {
        int _868 = ~_846;
        int _870 = _868 + 1;
        _858 = _870;
    }
    int _872 = _858;
    float _874 = _864 * _844;
    float _876 = _640 + (-0.5);
    float _878 = fma(_866, _768, _768);
    float _880 = fma(_722, _866, _722);
    float _882 = _874 * (-2.0);
    float _884 = float(_662);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[196].x, _878);
    float _888 = float(_872);
    float _890 = fma(_686, _882, _686);
    float _892 = fma(_882, _770, _770);
    float _894 = fma(_880, _862, _886);
    float _896 = _640 + _620;
    float _898 = _624 + (-0.5);
    float _900 = _884 * _888;
    float _902 = _896 + (-1.0);
    float _904 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[196].y, _892);
    float _906 = _900 * (-2.0);
    float _908 = in.m_57.y;
    float _910 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _912 = fma(_890, _862, _904);
    float _914 = fma(_906, _772, _772);
    float _916 = _620 + (-0.5);
    float _918 = in.m_61.x;
    float _920 = in.m_61.y;
    float _922 = in.m_61.z;
    float _924 = fma(_910, _906, _910);
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _928 = _926 != 0;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[196].z, _914);
    bool _932 = _624 > 0.5;
    float _934 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _936 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _938 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _940 = _894 * 0.15915493667125701904296875;
    float _942 = _912 * 0.15915493667125701904296875;
    float _944 = fma(_924, _862, _930);
    float _946 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _934);
    float _948 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _936);
    float _950 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _938);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _954 = _952 != 0;
    float _956 = _940 * 6.283185482025146484375;
    float _958 = sin(_956);
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _962 = _960 != 0;
    float _964 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _948);
    int _966 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _968 = _966 != 0;
    float _970 = -_908;
    float _972 = _970 + 1.0;
    float _974 = _944 * 0.15915493667125701904296875;
    float _976 = _964 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _978 = _940 * 6.283185482025146484375;
    float _980 = cos(_978);
    float _982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _918);
    int _984 = _690 ? as_type<int>(_972) : as_type<int>(_908);
    float _986 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    float _988 = _908;
    float _990 = _976;
    float _992 = _972;
    if (_928)
    {
        bool _994 = _620 > 0.5;
        _738 = _994;
    }
    bool _996 = _738;
    float _998 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _946);
    float _1000 = _650 * _982;
    float _1002 = _622 * _986;
    float _1004 = _942 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _922);
    if (_954)
    {
        bool _1010 = _640 > 0.5;
        _740 = _1010;
    }
    bool _1012 = _740;
    float _1014 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _950);
    float _1016 = _656 * _1008;
    float _1018 = _998 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1020 = _942 * 6.283185482025146484375;
    float _1022 = cos(_1020);
    float _1024 = _974 * 6.283185482025146484375;
    float _1026 = sin(_1024);
    float _1028 = _980 * _1006;
    float _1030 = _974 * 6.283185482025146484375;
    float _1032 = cos(_1030);
    float _1034 = _958 * _1022;
    float _1036 = _980 * _1022;
    float _1038 = -_1028;
    float _1040 = fma(_1026, _1034, _1038);
    float _1042 = -_1034;
    float _1044 = fma(_1026, _1028, _1042);
    float _1046 = _958 * _1006;
    float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1050 = fma(_1026, _1036, _1046);
    float _1052 = fma(_1026, _1046, _1036);
    float _1054 = _1032 * _1002;
    float _1056 = _1006 * _1032;
    float _1058 = _1022 * _1032;
    float _1060 = -_1002;
    float _1062 = _1026 * _1060;
    float _1064 = _980 * _1054;
    float _1066 = _958 * _1054;
    float _1068 = fma(_1058, _1000, _1062);
    float _1070 = fma(_1050, _1000, _1064);
    float _1072 = fma(_1040, _1000, _1066);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1076 = _1074 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1082 = fma(_1044, _1016, _1070);
    float _1084 = fma(_1056, _1016, _1068);
    float _1086 = fma(_1052, _1016, _1072);
    float _1088 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1090 = 1.0 / _1076;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1096 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1098 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1088);
    float _1100 = _1014 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1096);
    bool _1104 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1106 = isnan(_618);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = 1.0 / _1080;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1118;
    float _1122 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1102);
    float _1124 = _1100 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1128 = _618 + _1126;
    float _1130 = 1.0 / _1094;
    float _1132 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1098);
    float _1134 = _1120 * _1090;
    float _1136 = _1018 + _1132;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1140 = _1138 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1142;
    float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1148 = _1136 + _1146;
    float _1150 = _1140 * _1116;
    float _1152 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1154 = _1124 + _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1158 = _618 + _1156;
    float _1160 = _1148 * _1148;
    bool _1162 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1164 = isnan(_618);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    float _1174 = _1154 * _1154;
    float _1176 = fma(_1134, _1158, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1178 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_618);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1192 = _618 + _1190;
    float _1194 = _1160 + _1174;
    float _1196 = _1144 * _1130;
    bool _1198 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1200 = isnan(_618);
    bool _1202 = _1198 || _1200;
    bool _1204 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1206 = _1202 || _1204;
    float _1208 = float(_1206);
    float _1210 = -_1188;
    float _1212 = _1210 + 1.0;
    float _1214 = sqrt(_1194);
    float _1216 = fma(_1150, _1192, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1218 = fma(_1196, _1128, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1220 = _1172 * _1212;
    float _1222 = -_1172;
    float _1224 = _1222 + 1.0;
    float _1226 = -_1208;
    float _1228 = _1226 + 1.0;
    float _1230 = _1128;
    float _1232 = _1082;
    int _1234 = as_type<int>(_1154);
    if (!_954)
    {
        _1230 = _660;
    }
    float _1236 = _1230;
    float _1238 = _1208 * _1224;
    float _1240 = _1082 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1244 = _1236;
    if (!_954)
    {
        _1232 = _1236;
    }
    float _1246 = _1232;
    float _1248 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1240);
    float _1250 = _1114 * _1228;
    float _1252 = _962 ? as_type<float>(_984) : _908;
    float _1254 = -_1114;
    float _1256 = _1254 + 1.0;
    bool _1258 = _1214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = _1176 * _1250;
    int _1262 = as_type<int>(_1248);
    float _1264 = _1246;
    if (_954)
    {
        _1244 = _660;
    }
    float _1266 = _1244;
    float _1268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1270 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1248);
    float _1272 = _1270;
    float _1274 = _1266;
    if (_968)
    {
        float _1276 = _932 ? _972 : _908;
        _988 = _1276;
    }
    float _1278 = _988;
    float _1280 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1260);
    float _1282 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1284 = _1282;
    float _1286 = _1278;
    if (_954)
    {
        float _1288 = -_1266;
        float _1290 = _1288 + 1.0;
        _1262 = as_type<int>(_1290);
    }
    int _1292 = _1262;
    float _1294 = _976 + _1270;
    float _1296 = fma(_1282, _1278, -0.5);
    if (_954)
    {
        float _1298 = _1012 ? as_type<float>(_1292) : _1266;
        _1264 = _1298;
    }
    float _1300 = _1264;
    if (!_1258)
    {
        _1272 = _1174;
    }
    float _1302 = _1272;
    float _1304 = _1302;
    if (!_1258)
    {
        _990 = _1160;
    }
    float _1306 = _990;
    float _1308 = _1306;
    if (!_1258)
    {
        _992 = _1136;
    }
    float _1310 = _992;
    float _1312 = _1310;
    if (!_1258)
    {
        _1284 = _1124;
    }
    float _1314 = _1284;
    float _1316 = _1314;
    if (!_1258)
    {
        _1286 = _1294;
    }
    float _1318 = _1286;
    bool _1320 = !_1258;
    float _1322 = _1318;
    if (!_1320)
    {
        float _1324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1328 = _1214 + _1326;
        float _1330 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = rsqrt(_1194);
        float _1334 = _1328 * _1324;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = _1336 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = fma(_1340, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = _1332 * _1346;
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1148, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1154, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1356 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1360 = _1352 + _1358;
        float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1364 = _1354 + _1362;
        float _1366 = fma(_1294, _1344, _1356);
        float _1368 = _1360 * _1360;
        float _1370 = _1364 * _1364;
        _1322 = _1366;
        _1308 = _1368;
        _1304 = _1370;
        _1312 = _1352;
        _1316 = _1354;
    }
    float _1372 = _1322;
    float _1374 = _1308;
    float _1376 = _1304;
    float _1378 = _1312;
    float _1380 = _1316;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1384 = _1372 + _1382;
    float _1386 = _1372;
    if (_928)
    {
        float _1388 = -_1266;
        float _1390 = _1388 + 1.0;
        _1234 = as_type<int>(_1390);
    }
    int _1392 = _1234;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1396 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1398 = fma(_1384, _1384, _1374);
    float _1400 = fma(_1216, _1238, _1280);
    if (_928)
    {
        float _1402 = _996 ? as_type<float>(_1392) : _1266;
        _1274 = _1402;
    }
    float _1404 = _1274;
    float _1406 = fma(_1396, _1300, -0.5);
    float _1408 = _1398 + _1376;
    float _1410 = fma(_1218, _1220, _1400);
    float _1412 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1414 = -_688;
    float _1416 = fma(_848, _1296, _1414);
    float _1418 = sqrt(_1408);
    float _1420 = fma(_832, _1406, _836);
    float _1422 = _1404 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1424 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1410);
    float _1426 = _1412 * _1268;
    float _1428 = _1422 * _1394;
    float _1430 = _1416 + 0.5;
    float _1432 = _1420 + 0.5;
    float _1434 = _1424 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1432;
    out.m_65.y = _1430;
    out.m_65.z = _1428;
    out.m_65.w = _1426;
    bool _1436 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1438 = isnan(_1418);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1444 = _1440 || _1442;
    out.m_67.w = _1434;
    float _1446 = _1408;
    float _1448 = _1430;
    if (!_1444)
    {
        _1446 = 1.0;
    }
    float _1450 = _1446;
    bool _1452 = !_1444;
    float _1454 = _1450;
    if (!_1452)
    {
        bool _1456 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1458 = isnan(_1418);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1464 = _1460 || _1462;
        if (!_1464)
        {
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = _1418 + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1472 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1470;
            float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1476 = _1474 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1478 = 1.0 / _1472;
            float _1480 = _1468 * _1478;
            float _1482 = fma(_1480, _1476, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1454 = _1482;
            _1484 = true;
        }
        else
        {
            bool _1486 = _1418 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1488 = isnan(_1418);
            bool _1490 = _1486 || _1488;
            bool _1492 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1494 = _1490 || _1492;
            if (!_1494)
            {
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1418 + _1496;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1506 = _1504 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1508 = 1.0 / _1502;
                float _1510 = _1498 * _1508;
                float _1512 = fma(_1510, _1506, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1454 = _1512;
                _1484 = true;
            }
            else
            {
                _1454 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1484 = false;
    float _1514 = _1454;
    float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1518 = _1372 + _1516;
    float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1522 = _1378 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1526 = _1380 + _1524;
    float _1528 = fma(_1518, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1530 = fma(_1522, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1532 = fma(_1526, _1514, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1536 = _1528 + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1530 + _1538;
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1544 = _1532 + _1542;
    float _1546 = _1536 * _1536;
    float _1548 = fma(_1540, _1540, _1546);
    float _1550 = fma(_1544, _1544, _1548);
    float _1552 = rsqrt(_1550);
    float _1554 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1556 = _1540 * _1554;
    float _1558 = _1544 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 * _1558;
    float _1564 = _1560 + _1562;
    float _1566 = sqrt(_1564);
    bool _1568 = _1566 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1566 + _1570;
    float _1574 = _1544;
    float _1576 = _1552;
    float _1578 = _1572;
    float _1580 = _1554;
    float _1582 = _1556;
    if (_1568)
    {
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1584;
    }
    float _1586 = _1574;
    if (_1568)
    {
        float _1588 = rsqrt(_1564);
        _1576 = _1588;
    }
    float _1590 = _1576;
    float _1592 = _1590;
    if (_1568)
    {
        float _1594 = _1572 * _1586;
        _1578 = _1594;
    }
    float _1596 = _1578;
    if (_1568)
    {
        float _1598 = _1596 * 0.15915493667125701904296875;
        _1386 = _1598;
    }
    float _1600 = _1386;
    float _1602 = _1586;
    if (_1568)
    {
        float _1604 = _1600 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        _1602 = _1606;
    }
    float _1608 = _1602;
    float _1610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1612 = precise::max(0.0, _1610);
    float _1614 = _1416;
    float _1616 = _1612;
    if (_1568)
    {
        float _1618 = _1600 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        _1614 = _1620;
    }
    float _1622 = _1614;
    float _1624 = -_1554;
    float _1626 = -_1612;
    float _1628 = fma(_1536, _1624, _1626);
    float _1630 = _1628;
    if (_1568)
    {
        float _1632 = _1628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1616 = _1632;
    }
    float _1634 = _1616;
    float _1636 = sqrt(_1550);
    float _1638 = _1608;
    float _1640 = _1634;
    if (_1568)
    {
        float _1642 = fma(_1608, _1634, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1580 = _1642;
    }
    float _1644 = _1580;
    float _1646 = _1644;
    if (!_1568)
    {
        _1638 = _1558;
    }
    float _1648 = _1638;
    float _1650 = _1648;
    if (_1568)
    {
        float _1652 = _1622 + (-1.0);
        _1640 = _1652;
    }
    float _1654 = _1640;
    float _1656 = _1654;
    if (_1568)
    {
        float _1658 = _1590 * _1644;
        _1448 = _1658;
    }
    float _1660 = _1448;
    if (!_1568)
    {
        _1592 = _1628;
    }
    float _1662 = _1592;
    float _1664 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1666 = _1662;
    if (_1568)
    {
        float _1668 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1646 = _1668;
    }
    float _1670 = _1646;
    if (_1568)
    {
        float _1672 = _1556 * _1660;
        _1582 = _1672;
    }
    float _1674 = _1582;
    if (!_1568)
    {
        _1656 = _1560;
    }
    float _1676 = _1656;
    float _1678 = _1676;
    if (_1568)
    {
        float _1680 = _1558 * _1660;
        _1650 = _1680;
    }
    float _1682 = _1650;
    if (_1568)
    {
        float _1684 = fma(_1628, _1622, _1670);
        _1666 = _1684;
    }
    float _1686 = _1666;
    if (_1568)
    {
        float _1688 = _1674 * _1674;
        _1678 = _1688;
    }
    float _1690 = _1678;
    if (!_1568)
    {
        _1630 = _1562;
    }
    float _1692 = _1630;
    float _1694 = _1692;
    if (_1568)
    {
        float _1696 = _1682 * _1682;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = fma(_1686, _1686, _1690);
    float _1702 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1664);
    float _1704 = _1700 + _1698;
    float _1706 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1708 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1710 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1708);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1716 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1706);
    float _1718 = rsqrt(_1704);
    float _1720 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = -_1712;
    float _1724 = _1722 + 1.0;
    float _1726 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1716);
    float _1728 = _1528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1730 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1732 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1728);
    float _1736 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1738 = abs(_1724);
    float _1740 = log2(_1738);
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1744 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1734);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = -_1742;
    float _1750 = fma(_1748, _1714, 1.0);
    float _1752 = _1718 * _1674;
    float _1754 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1702);
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1718 * _1686;
    float _1762 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1764 = _1718 * _1682;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1770 = -_1762;
    float _1772 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1770);
    float _1774 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1776 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1750);
    float _1780 = -_1764;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1772);
    float _1784 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1790 = fma(_1782, -0.5, 0.5);
    float _1792 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1794 = fma(_1782, 0.5, 0.5);
    float _1796 = exp2(_1774);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1788);
    float _1800 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1792);
    float _1802 = _1760 + 1.0;
    float _1804 = fma(_1794, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1806 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1800);
    float _1810 = 1.0 / _1786;
    float _1812 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = fma(_1794, _1804, -0.212114393711090087890625);
    float _1816 = _1778 * 0.693147182464599609375;
    float _1818 = fma(_1794, _1814, 1.570728778839111328125);
    float _1820 = _1816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1822 = sqrt(_1790);
    float _1824 = -_1760;
    float _1826 = fma(_1796, _1802, _1824);
    float _1828 = fma(_1826, 0.5, 0.5);
    float _1830 = _1808 * _1810;
    float _1832 = _1812 * _1810;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1822 * 0.636619746685028076171875;
    float3 _4733 = float3(_1834, _1836, _1820);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4733, float3(0.0), isnan(_4733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4733, float3(0.0), isnan(_4733)), level(0.0)).x;
    float _1842 = -_1818;
    float _1844 = fma(_1838, _1842, 1.0);
    float3 _4749 = float3(_1834, _1836, _1820);
    float4 _1847 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4749, float3(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4749, float3(0.0), isnan(_4749)), level(0.0)).xyzw;
    float _1849 = _1847.x;
    float _1851 = _1847.y;
    float _1853 = _1847.z;
    float _1855 = _1847.w;
    float2 _4766 = float2(_1844, _1828);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4766, float2(0.0), isnan(_4766)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4766, float2(0.0), isnan(_4766)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1869 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1871 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1869);
    float _1873 = exp2(_1867);
    float _1875 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1871);
    float _1877 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1875);
    float _1879 = _1877 + _1786;
    out.gl_Position.x = _1808;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _1877;
    out.gl_Position.w = _1786;
    float _1881 = _1879 * 0.5;
    float _1883 = -_1873;
    float _1885 = _1883 + 1.0;
    float _1887 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1881;
    out.m_69.w = _1786;
    out.m_47.x = _1887;
    float _1891 = _1889 * _1840;
    float _1893 = -_1889;
    float _1895 = _1893 + 1.0;
    float _1897 = _1855 * _1891;
    float _1899 = _1855 * _1895;
    float _1901 = _1865 * _1891;
    float _1903 = fma(_1861, _1897, _1849);
    float _1905 = fma(_1863, _1897, _1851);
    float _1907 = fma(_1855, _1901, _1853);
    out.m_71.x = _1903;
    out.m_71.y = _1905;
    out.m_71.z = _1907;
    out.m_71.w = _1899;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

