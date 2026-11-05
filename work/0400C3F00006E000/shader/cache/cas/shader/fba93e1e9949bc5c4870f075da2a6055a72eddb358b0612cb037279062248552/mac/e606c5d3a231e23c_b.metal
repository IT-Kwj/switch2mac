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
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1652 = false;
    bool _432 = false;
    bool _288 = false;
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
        float _2138 = as_type<float>(_108);
        out.gl_Position.z = _2138;
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
        float _2207 = as_type<float>(_144);
        out.gl_Position.z = _2207;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_92);
        float _292 = 1.0 / _290;
        float _294 = _126 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _306 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_296);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = 1.0 / _300;
    float _320 = _302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = _296 + _324;
    float _328 = _304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _332 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = -_316;
    float _336 = _334 + 1.0;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _354;
    out.m_55.x = _320;
    out.m_55.y = _332;
    out.m_55.z = _328;
    out.m_55.w = _330;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = _326 * _318;
    float _364 = _348 * _336;
    float _366 = in.m_51.x;
    float _368 = in.m_51.y;
    float _370 = in.m_51.z;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _374 = fma(_352, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_356, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _374 * _364;
    float _386 = _376 * _364;
    float _388 = _378 * _364;
    float _390 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _384);
    float _392 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _386);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _388);
    float _396 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].x, _390);
    float _398 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].y, _392);
    float _400 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].z, _394);
    float _402 = _396 * _366;
    float _404 = _398 * _368;
    float _406 = _400 * _370;
    bool _408 = !_372;
    int _410 = as_type<int>(_390);
    bool _412 = _372;
    float _430;
    if (!_408)
    {
        float _414 = in.m_53.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_92);
        float _436 = 1.0 / _434;
        float _438 = _126 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_57.x;
    float _444 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _448 = _446 != 0;
    float _450 = in.m_57.y;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _454 = _452 != 0;
    float _456 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _458 = in.m_53.w;
    float _460 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
    float _462 = in.m_53.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _472 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
    float _474 = _396;
    if (_448)
    {
        float _476 = in.m_53.x;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _482 = 1.0 / _466;
    float _484 = in.m_53.y;
    float _486 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _488 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _490;
    float _494 = _442;
    if (_448)
    {
        float _496 = -_442;
        float _498 = _496 + 1.0;
        _410 = as_type<int>(_498);
    }
    int _500 = _410;
    float _502 = 0.0;
    if (!_448)
    {
        _502 = _442;
    }
    float _504 = _502;
    float _506 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _460);
    float _508 = 1.0 / _470;
    float _510 = -_450;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _518 = _458 > 0.5;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _522 = _518 ? as_type<int>(_512) : as_type<int>(_450);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _532 = _504;
    if (_448)
    {
        bool _534 = _478 > 0.5;
        _412 = _534;
    }
    bool _536 = _412;
    if (_448)
    {
        float _538 = _536 ? as_type<float>(_500) : _442;
        _532 = _538;
    }
    float _540 = _532;
    float _542 = in.m_59.x;
    float _544 = in.m_59.y;
    float _546 = in.m_59.z;
    bool _548 = _462 > 0.5;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _552 = _550 != 0;
    bool _554 = _484 > 0.5;
    float _556 = _520 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _558 = _548 ? as_type<int>(_512) : as_type<int>(_450);
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _570 = _568 != 0;
    int _572 = _554 ? as_type<int>(_512) : as_type<int>(_450);
    float _574 = _454 ? as_type<float>(_558) : _450;
    float _576 = _566 ? as_type<float>(_522) : _450;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _584 = _582 != 0;
    float _586 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _562 ? as_type<float>(_572) : _450;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _600 = _598 != 0;
    float _602 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _604 = 1.0 / _592;
    float _606 = _484 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _610 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _602);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _614 = _440 + _612;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _618;
    float _622 = 1.0 / _596;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _630 = fma(_606, -2.0, _608);
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _634 = _486 * _616;
    float _636 = _488 * _624;
    float _638 = 1.0 / _620;
    float _640 = _480 * _632;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _644 = _440 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _648 = _440 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _652 = _440 + _650;
    float _654 = _644 * _482;
    float _656 = _648 * _508;
    float _658 = 1.0 / _628;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _662 = _440 + _660;
    float _664 = _614 * _622;
    float _666 = fma(_492, _654, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _668 = _662 * _604;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _672 = _440 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _674;
    float _678 = _570 ? as_type<float>(_558) : _450;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _684;
    float _688 = fma(_676, _654, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _690;
    float _694 = fma(_686, _654, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _698;
    float _702 = _672 * _658;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _708 = _652 * _638;
    float _710 = fma(_700, _668, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _712 = fma(_682, _668, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _714 = fma(_692, _668, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _722 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _472);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _740;
    float _744 = fma(_706, _664, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _746 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _748 = isnan(_440);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    bool _766 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _768 = isnan(_440);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_720, _664, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _780 = fma(_726, _656, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _782 = fma(_516, _656, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _784 = fma(_730, _656, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _786 = fma(_734, _664, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _788 = fma(_738, _708, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _790 = fma(_760, _702, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _792 = fma(_764, _702, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _794 = -_756;
    float _796 = _794 + 1.0;
    float _798 = fma(_530, _702, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _800 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _802 = isnan(_440);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_776;
    float _814 = _812 + 1.0;
    float _816 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _818 = _776 * _796;
    bool _820 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _822 = isnan(_440);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _810 * _814;
    float _834 = -_810;
    float _836 = _834 + 1.0;
    float _838 = fma(_588, _816, -0.5);
    float _840 = _716 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _842 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _844 = isnan(_440);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -_830;
    float _856 = _854 + 1.0;
    float _858 = _830 * _836;
    bool _860 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _862 = isnan(_440);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = fma(_742, _708, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _874 = fma(_576, _840, -0.5);
    float _876 = _852 * _856;
    float _878 = -_852;
    float _880 = _878 + 1.0;
    float _882 = fma(_574, _556, -0.5);
    float _884 = fma(_526, _708, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _886 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _888 = isnan(_440);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _900 = -_870;
    float _902 = _900 + 1.0;
    float _904 = _870 * _880;
    float _906 = _640 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _908 = _640 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _910 = _896 * _902;
    float _912 = _640 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _914 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _906);
    float _916 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[25].x, _908);
    float _918 = _694 * _910;
    float _920 = _666 * _910;
    float _922 = _688 * _910;
    float _924 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[24].z, _914);
    float _926 = _910;
    int _928 = as_type<int>(_694);
    int _930 = as_type<int>(_914);
    float _932 = _688;
    float _934 = _634;
    int _936 = as_type<int>(_920);
    int _938 = as_type<int>(_918);
    float _940 = _832;
    if (_600)
    {
        float _942 = in.m_53.x;
        _926 = _942;
    }
    float _944 = _926;
    float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_552)
    {
        float _948 = -_442;
        float _950 = _948 + 1.0;
        _928 = as_type<int>(_950);
    }
    int _952 = _928;
    float _954 = _898 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_580)
    {
        float _956 = -_442;
        float _958 = _956 + 1.0;
        _930 = as_type<int>(_958);
    }
    int _960 = _930;
    float _962 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[26].x, _912);
    int _964 = _960;
    if (!_552)
    {
        _932 = _442;
    }
    float _966 = _932;
    float _968 = fma(_678, _954, -0.5);
    float _970 = _966;
    if (!_580)
    {
        _934 = _442;
    }
    float _972 = _934;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _976 = _972;
    if (_552)
    {
        float _978 = _548 ? as_type<float>(_952) : _442;
        _970 = _978;
    }
    float _980 = _970;
    float _982 = -_896;
    float _984 = _982 + 1.0;
    float _986 = _984;
    if (_580)
    {
        float _988 = _554 ? as_type<float>(_960) : _442;
        _976 = _988;
    }
    float _990 = _976;
    if (_584)
    {
        float _992 = -_442;
        float _994 = _992 + 1.0;
        _964 = as_type<int>(_994);
    }
    int _996 = _964;
    float _998 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[25].z, _916);
    float _1000 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[26].z, _962);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].z, _922);
    float _1004 = as_type<float>(_996);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[94].z;
    if (_584)
    {
        float _1008 = _554 ? as_type<float>(_996) : _442;
        _494 = _1008;
    }
    float _1010 = _494;
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].x, _918);
    float _1014 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].y, _920);
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    if (_600)
    {
        _936 = 0;
    }
    int _1018 = _936;
    int _1020 = _1018;
    if (_600)
    {
        _938 = 0;
    }
    int _1022 = _938;
    int _1024 = _1022;
    if (_600)
    {
        _1004 = _484;
    }
    float _1026 = _1004;
    float _1028 = _1026;
    if (_600)
    {
        _986 = _462;
    }
    float _1030 = _986;
    float _1032 = _1030;
    float _1034 = _944;
    if (_600)
    {
        _1006 = _944;
    }
    float _1036 = _1006;
    float _1038 = _1036;
    if (!_600)
    {
        float _1040 = in.m_53.x;
        float _1042 = _484 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _462 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = _1040 * 3.1415927410125732421875;
        float _1060 = _1058 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        _1024 = 2;
        _1020 = 1;
        _1032 = _1056;
        _1034 = _1040;
        _1038 = _1064;
        _1028 = _1052;
    }
    int _1066 = _1024;
    int _1068 = _1020;
    float _1070 = _1032;
    float _1072 = _1034;
    float _1074 = _1038;
    float _1076 = _1028;
    bool _1078 = _1066 != 2;
    float _1080 = fma(_780, _904, _1012);
    float _1082 = _946 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1084 = _1068 != 1;
    float _1086 = fma(_782, _904, _1014);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1092 = fma(_784, _904, _1002);
    float _1094 = fma(_1082, _540, -0.5);
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1098 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[94].z, _1016);
    float _1100 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1102 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1096);
    float _1104 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1106 = -_1090;
    float _1108 = fma(_1100, 2.0, _1106);
    float _1110 = fma(_710, _876, _1080);
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1114 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1102);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1120 = _1114 * (-0.15915493667125701904296875);
    float _1122 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1116);
    float _1124 = fma(_712, _876, _1086);
    float _1126 = fma(_1118, _1010, -0.5);
    float _1128 = _1120 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _610 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1134 = fma(_714, _876, _1092);
    float _1136 = fma(_744, _858, _1110);
    float _1138 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[94].x, _1098);
    float _1140 = fma(_778, _858, _1124);
    float _1142 = fma(_786, _858, _1134);
    float _1144 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1146 = _1120 * 6.283185482025146484375;
    float _1148 = cos(_1146);
    float _1150 = _1138 * (-0.15915493667125701904296875);
    float _1152 = -_126;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1108);
    float _1156 = fma(_1144, _990, -0.5);
    float _1158 = fma(_788, _832, _1136);
    float _1160 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1162 = _1130 * _838;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1166 = _1150 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1172 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1164);
    float _1174 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _630);
    float _1176 = _1148 * _838;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1180 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1172);
    float _1182 = -_1162;
    float _1184 = fma(_1148, _1094, _1182);
    float _1186 = fma(_1130, _1094, _1176);
    float _1188 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1178);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1192 = fma(_1104, _980, -0.5);
    float _1194 = -_1174;
    float _1196 = fma(_1180, _1186, _1194);
    float _1198 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1188);
    float _1200 = _1150 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = fma(_872, _832, _1140);
    float _1206 = -_1190;
    float _1208 = fma(_1160, 2.0, _1206);
    float _1210 = fma(_1198, _1184, _1154);
    float _1212 = _998 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1214 = _1198;
    float _1216 = _1188;
    float _1218 = _1180;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1084)
    {
        _1214 = _462;
    }
    float _1224 = _1214;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1230 = _1224;
    if (!_1084)
    {
        _1216 = _1224;
    }
    float _1232 = _1216;
    float _1234 = _722 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1236 = _1232;
    if (_1084)
    {
        _1230 = _462;
    }
    float _1238 = _1230;
    float _1240 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1170);
    float _1242 = fma(_884, _832, _1142);
    float _1244 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1228);
    float _1246 = fma(_790, _818, _1158);
    float _1248 = _924 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1252 = fma(_798, _818, _1242);
    float _1254 = _1242;
    if (!_1084)
    {
        _1218 = _1072;
    }
    float _1256 = _1218;
    float _1258 = fma(_792, _818, _1204);
    float _1260 = _1168 * _882;
    float _1262 = _1256;
    if (!_1084)
    {
        _940 = _484;
    }
    float _1264 = _940;
    float _1266 = _1202 * _882;
    float _1268 = _1202;
    float _1270 = _1264;
    if (_1084)
    {
        _1262 = _1238;
    }
    float _1272 = _1262;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1276 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1226);
    float _1278 = _1132 + _1248;
    float _1280 = _1234 + _1250;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1284 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1286 = -_1260;
    float _1288 = fma(_1202, _1126, _1286);
    float _1290 = _1272;
    float _1292 = _1278;
    float _1294 = _1280;
    if (!_1084)
    {
        _1268 = _1264;
    }
    float _1296 = _1268;
    float _1298 = fma(_1168, _1126, _1266);
    float _1300 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1274);
    float _1302 = _1296;
    if (_1084)
    {
        _1270 = _1072;
    }
    float _1304 = _1270;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1310 = _1278 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1314 = _1280 + _1312;
    float _1316 = fma(_1284, -2.0, _1282);
    if (!_1084)
    {
        _1254 = _1232;
    }
    float _1318 = _1254;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1322 = _1318;
    if (_1078)
    {
        _1290 = _484;
    }
    float _1324 = _1290;
    float _1326 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1306);
    float _1328 = _1324;
    if (_1084)
    {
        _1236 = _484;
    }
    float _1330 = _1236;
    float _1332 = _1314 * _1314;
    float _1334 = _1332;
    if (_1084)
    {
        _1302 = _1072;
    }
    float _1336 = _1302;
    float _1338 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1276);
    if (!_1078)
    {
        _1328 = _1072;
    }
    float _1340 = _1328;
    float _1342 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1316);
    if (_1078)
    {
        _1220 = _1072;
    }
    float _1344 = _1220;
    float _1346 = _1310 * _1310;
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1320);
    float _1350 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1122);
    float _1352 = -_126;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1208);
    float _1356 = _1346 + _1332;
    float _1358 = _1344;
    float _1360 = _1346;
    if (!_1078)
    {
        _1358 = _1238;
    }
    float _1362 = _1358;
    float _1364 = -_1342;
    float _1366 = fma(_1338, _1298, _1364);
    float _1368 = _1366;
    if (_1078)
    {
        _1222 = _1238;
    }
    float _1370 = _1222;
    float _1372 = sqrt(_1356);
    float _1374 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1300);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1378 = _1370;
    if (_1084)
    {
        _1322 = _484;
    }
    float _1380 = _1322;
    float _1382 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1078)
    {
        _1378 = _484;
    }
    float _1384 = _1378;
    float _1386 = fma(_1350, _1288, _1354);
    float _1388 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1246);
    float _1390 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1258);
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1396 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1252);
    float _1398 = _1374 * (-0.15915493667125701904296875);
    float _1400 = -_1392;
    float _1402 = fma(_1376, 2.0, _1400);
    float _1404 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1394);
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1408 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1410 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1404);
    float _1412 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1414 = fma(_1408, -2.0, _1406);
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1418 = _1398 * 6.283185482025146484375;
    float _1420 = sin(_1418);
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1424 = _1410 * (-0.15915493667125701904296875);
    bool _1426 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = -_1416;
    float _1430 = fma(_1382, 2.0, _1428);
    float _1432 = fma(_1412, -2.0, _1422);
    float _1434 = _506 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1436 = _1398 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1244);
    float _1442 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1240);
    float _1444 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1326);
    float _1446 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1348);
    float _1448 = -_126;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1402);
    float _1452 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1414);
    float _1454 = -_126;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1430);
    float _1458 = _1424 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1420 * _874;
    float _1464 = _1434 + _1212;
    float _1466 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1432);
    float _1468 = _1424 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = _1438 * _874;
    bool _1474 = !_1426;
    float _1476 = _1464;
    float _1478 = _1386;
    if (!_1474)
    {
        float _1480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1484 = _1372 + _1482;
        float _1486 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1488 = rsqrt(_1356);
        float _1490 = _1484 * _1480;
        float _1492 = _1490 * 0.15915493667125701904296875;
        float _1494 = _1492 * 6.283185482025146484375;
        float _1496 = sin(_1494);
        float _1498 = _1492 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = fma(_1496, _1486, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1504 = _1488 * _1502;
        float _1506 = _1500 + (-1.0);
        float _1508 = fma(_1310, _1504, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1510 = fma(_1314, _1504, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1512 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1516 = _1508 + _1514;
        float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1520 = _1510 + _1518;
        float _1522 = fma(_1464, _1500, _1512);
        float _1524 = _1516 * _1516;
        float _1526 = _1520 * _1520;
        _1476 = _1522;
        _1360 = _1524;
        _1334 = _1526;
        _1292 = _1508;
        _1294 = _1510;
    }
    float _1528 = _1476;
    float _1530 = _1360;
    float _1532 = _1334;
    float _1534 = _1292;
    float _1536 = _1294;
    float _1538 = _1460 * _968;
    float _1540 = _1470 * _968;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1544 = _1528 + _1542;
    float _1546 = -_1462;
    float _1548 = fma(_1438, _1192, _1546);
    float _1550 = fma(_1420, _1192, _1472);
    float _1552 = -_1538;
    float _1554 = fma(_1470, _1156, _1552);
    float _1556 = fma(_1544, _1544, _1530);
    float _1558 = fma(_1460, _1156, _1540);
    float _1560 = fma(_1444, _1548, _1450);
    float _1562 = -_1452;
    float _1564 = fma(_1446, _1550, _1562);
    float _1566 = _1556 + _1532;
    float _1568 = fma(_1442, _1554, _1456);
    float _1570 = -_1466;
    float _1572 = fma(_1440, _1558, _1570);
    float _1574 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1576 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1578 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1580 = sqrt(_1566);
    float _1582 = _1210 + 0.5;
    float _1584 = _1196 + 0.5;
    float _1586 = _1386 + 0.5;
    float _1588 = _1366 + 0.5;
    float _1590 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1596 = _1560 + 0.5;
    float _1598 = _1564 + 0.5;
    float _1600 = _1568 + 0.5;
    float _1602 = _1572 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1604 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1606 = isnan(_1580);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1612 = _1608 || _1610;
    out.m_63.x = _1586;
    out.m_63.y = _1588;
    out.m_65.x = _1590;
    out.m_65.y = _1592;
    out.m_65.z = _1594;
    out.m_67.x = _1582;
    out.m_67.y = _1584;
    out.m_67.z = _1596;
    out.m_67.w = _1598;
    float _1614 = _1592;
    float _1616 = _1582;
    if (!_1612)
    {
        _1478 = 1.0;
    }
    float _1618 = _1478;
    out.m_69.x = _1600;
    out.m_69.y = _1602;
    bool _1620 = !_1612;
    float _1622 = _1618;
    if (!_1620)
    {
        bool _1624 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1626 = isnan(_1580);
        bool _1628 = _1624 || _1626;
        bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1632 = _1628 || _1630;
        if (!_1632)
        {
            float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1636 = _1580 + _1634;
            float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1640 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1638;
            float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1646 = 1.0 / _1640;
            float _1648 = _1636 * _1646;
            float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1622 = _1650;
            _1652 = true;
        }
        else
        {
            bool _1654 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1656 = isnan(_1580);
            bool _1658 = _1654 || _1656;
            bool _1660 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1662 = _1658 || _1660;
            if (!_1662)
            {
                float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1666 = _1580 + _1664;
                float _1668 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1670 = _1668 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1674 = _1672 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1676 = 1.0 / _1670;
                float _1678 = _1666 * _1676;
                float _1680 = fma(_1678, _1674, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1622 = _1680;
                _1652 = true;
            }
            else
            {
                _1622 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1652 = false;
    float _1682 = _1622;
    float _1684 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1686 = _1528 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1690 = _1534 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1694 = _1536 + _1692;
    float _1696 = fma(_1686, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1698 = fma(_1690, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1700 = fma(_1694, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1696 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1698 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1700 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = fma(_1708, _1708, _1714);
    float _1718 = fma(_1712, _1712, _1716);
    float _1720 = rsqrt(_1718);
    float _1722 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1724 = _1708 * _1722;
    float _1726 = _1712 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 + _1730;
    float _1734 = sqrt(_1732);
    bool _1736 = _1734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = _1734 + _1738;
    float _1742 = _1712;
    float _1744 = _1740;
    float _1746 = _1704;
    float _1748 = _1724;
    if (_1736)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1742 = _1750;
    }
    float _1752 = _1742;
    if (_1736)
    {
        float _1754 = rsqrt(_1732);
        _1368 = _1754;
    }
    float _1756 = _1368;
    float _1758 = _1756;
    if (_1736)
    {
        float _1760 = _1740 * _1752;
        _1744 = _1760;
    }
    float _1762 = _1744;
    if (_1736)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1614 = _1764;
    }
    float _1766 = _1614;
    float _1768 = _1720;
    if (_1736)
    {
        float _1770 = _1766 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1716;
    float _1782 = _1776;
    float _1784 = _1778;
    if (_1736)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = -_1722;
    float _1794 = -_1778;
    float _1796 = fma(_1704, _1792, _1794);
    if (_1736)
    {
        float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1798;
    }
    float _1800 = _1782;
    float _1802 = sqrt(_1718);
    float _1804 = _1774;
    float _1806 = _1800;
    if (_1736)
    {
        float _1808 = fma(_1774, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1746 = _1808;
    }
    float _1810 = _1746;
    float _1812 = _1810;
    if (!_1736)
    {
        _1804 = _1726;
    }
    float _1814 = _1804;
    float _1816 = _1814;
    if (_1736)
    {
        float _1818 = _1790 + (-1.0);
        _1806 = _1818;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1736)
    {
        float _1824 = _1756 * _1810;
        _1616 = _1824;
    }
    float _1826 = _1616;
    if (!_1736)
    {
        _1758 = _1796;
    }
    float _1828 = _1758;
    float _1830 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1832 = _1828;
    if (_1736)
    {
        float _1834 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1834;
    }
    float _1836 = _1784;
    if (_1736)
    {
        float _1838 = _1724 * _1826;
        _1748 = _1838;
    }
    float _1840 = _1748;
    if (!_1736)
    {
        _1822 = _1728;
    }
    float _1842 = _1822;
    float _1844 = _1842;
    if (_1736)
    {
        float _1846 = _1726 * _1826;
        _1816 = _1846;
    }
    float _1848 = _1816;
    if (_1736)
    {
        float _1850 = fma(_1796, _1790, _1836);
        _1832 = _1850;
    }
    float _1852 = _1832;
    if (_1736)
    {
        float _1854 = _1840 * _1840;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (!_1736)
    {
        _1812 = _1730;
    }
    float _1858 = _1812;
    float _1860 = _1858;
    if (_1736)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1852, _1852, _1856);
    float _1868 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1870 = _1866 + _1864;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1874 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1872);
    float _1876 = precise::clamp(_1874, 0.0, 1.0);
    float _1878 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1868);
    float _1880 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1882 = rsqrt(_1870);
    float _1884 = -_1876;
    float _1886 = _1884 + 1.0;
    float _1888 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _1890 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1880);
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1900 = abs(_1886);
    float _1902 = log2(_1900);
    float _1904 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1906 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1908 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1910 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1830);
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1914 = -_1906;
    float _1916 = fma(_1914, _1894, 1.0);
    float _1918 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1920 = _1882 * _1840;
    float _1922 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1910);
    float _1924 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1882 * _1852;
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1882 * _1848;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1936 = -_1928;
    float _1938 = fma(_1926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1944 = log2(_1916);
    float _1946 = -_1930;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1950 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1952 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1954 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1956 = fma(_1948, -0.5, 0.5);
    float _1958 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1950);
    float _1960 = exp2(_1940);
    float _1962 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1954);
    float _1964 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1966 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1962);
    float _1968 = 1.0 / _1952;
    float _1970 = fma(_1948, 0.5, 0.5);
    float _1972 = _1926 + 1.0;
    float _1974 = _1944 * 0.693147182464599609375;
    float _1976 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1978 = sqrt(_1956);
    float _1980 = -_1926;
    float _1982 = fma(_1960, _1972, _1980);
    float _1984 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1964);
    float _1986 = fma(_1970, _1976, -0.212114393711090087890625);
    float _1988 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1966);
    float _1990 = fma(_1982, 0.5, 0.5);
    float _1992 = fma(_1970, _1986, 1.570728778839111328125);
    float _1994 = _1984 * _1968;
    float _1996 = _1988 * _1968;
    float _1998 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_1996, -0.5, 0.5);
    float _2004 = _1978 * 0.636619746685028076171875;
    float3 _5353 = float3(_2000, _2002, _1998);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).x;
    float3 _5364 = float3(_2000, _2002, _1998);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5364, float3(0.0), isnan(_5364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5364, float3(0.0), isnan(_5364)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float _2019 = -_1992;
    float _2021 = fma(_2004, _2019, 1.0);
    float2 _5386 = float2(_2021, _1990);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5386, float2(0.0), isnan(_5386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5386, float2(0.0), isnan(_5386)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2035 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2037 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2035);
    float _2039 = exp2(_2033);
    float _2041 = _1952 * 0.5;
    float _2043 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    float _2045 = fma(_1988, -0.5, _2041);
    float _2047 = _1984 + _1952;
    float _2049 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2043);
    float _2051 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2053 = _2047 * 0.5;
    float _2055 = _2049 + _1952;
    out.gl_Position.x = _1984;
    out.gl_Position.y = _1988;
    out.gl_Position.z = _2049;
    out.gl_Position.w = _1952;
    float _2057 = _2055 * 0.5;
    float _2059 = -_2039;
    float _2061 = _2059 + 1.0;
    out.m_47.x = _2051;
    float _2063 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2053;
    out.m_71.y = _2045;
    out.m_71.z = _2057;
    out.m_71.w = _1952;
    float _2065 = -_2063;
    float _2067 = _2065 + 1.0;
    float _2069 = _2063 * _2006;
    float _2071 = _2017 * _2069;
    float _2073 = _2031 * _2069;
    float _2075 = fma(_2027, _2071, _2011);
    float _2077 = fma(_2029, _2071, _2013);
    float _2079 = _2017 * _2067;
    float _2081 = fma(_2017, _2073, _2015);
    out.m_73.x = _2075;
    out.m_73.y = _2077;
    out.m_73.z = _2081;
    out.m_73.w = _2079;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1652 = false;
    bool _432 = false;
    bool _288 = false;
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
        float _2138 = as_type<float>(_108);
        out.gl_Position.z = _2138;
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
        float _2207 = as_type<float>(_144);
        out.gl_Position.z = _2207;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_92);
        float _292 = 1.0 / _290;
        float _294 = _126 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _306 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_296);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = 1.0 / _300;
    float _320 = _302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = _296 + _324;
    float _328 = _304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _332 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = -_316;
    float _336 = _334 + 1.0;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _354;
    out.m_55.x = _320;
    out.m_55.y = _332;
    out.m_55.z = _328;
    out.m_55.w = _330;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = _326 * _318;
    float _364 = _348 * _336;
    float _366 = in.m_51.x;
    float _368 = in.m_51.y;
    float _370 = in.m_51.z;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _374 = fma(_352, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_356, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _374 * _364;
    float _386 = _376 * _364;
    float _388 = _378 * _364;
    float _390 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _384);
    float _392 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _386);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _388);
    float _396 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].x, _390);
    float _398 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].y, _392);
    float _400 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].z, _394);
    float _402 = _396 * _366;
    float _404 = _398 * _368;
    float _406 = _400 * _370;
    bool _408 = !_372;
    int _410 = as_type<int>(_390);
    bool _412 = _372;
    float _430;
    if (!_408)
    {
        float _414 = in.m_53.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_92);
        float _436 = 1.0 / _434;
        float _438 = _126 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_57.x;
    float _444 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _448 = _446 != 0;
    float _450 = in.m_57.y;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _454 = _452 != 0;
    float _456 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _458 = in.m_53.w;
    float _460 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
    float _462 = in.m_53.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _472 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
    float _474 = _396;
    if (_448)
    {
        float _476 = in.m_53.x;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _482 = 1.0 / _466;
    float _484 = in.m_53.y;
    float _486 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _488 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _490;
    float _494 = _442;
    if (_448)
    {
        float _496 = -_442;
        float _498 = _496 + 1.0;
        _410 = as_type<int>(_498);
    }
    int _500 = _410;
    float _502 = 0.0;
    if (!_448)
    {
        _502 = _442;
    }
    float _504 = _502;
    float _506 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _460);
    float _508 = 1.0 / _470;
    float _510 = -_450;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _518 = _458 > 0.5;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _522 = _518 ? as_type<int>(_512) : as_type<int>(_450);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _532 = _504;
    if (_448)
    {
        bool _534 = _478 > 0.5;
        _412 = _534;
    }
    bool _536 = _412;
    if (_448)
    {
        float _538 = _536 ? as_type<float>(_500) : _442;
        _532 = _538;
    }
    float _540 = _532;
    float _542 = in.m_59.x;
    float _544 = in.m_59.y;
    float _546 = in.m_59.z;
    bool _548 = _462 > 0.5;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _552 = _550 != 0;
    bool _554 = _484 > 0.5;
    float _556 = _520 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _558 = _548 ? as_type<int>(_512) : as_type<int>(_450);
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _570 = _568 != 0;
    int _572 = _554 ? as_type<int>(_512) : as_type<int>(_450);
    float _574 = _454 ? as_type<float>(_558) : _450;
    float _576 = _566 ? as_type<float>(_522) : _450;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _584 = _582 != 0;
    float _586 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _562 ? as_type<float>(_572) : _450;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _600 = _598 != 0;
    float _602 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _604 = 1.0 / _592;
    float _606 = _484 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _610 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _602);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _614 = _440 + _612;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _618;
    float _622 = 1.0 / _596;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _630 = fma(_606, -2.0, _608);
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _634 = _486 * _616;
    float _636 = _488 * _624;
    float _638 = 1.0 / _620;
    float _640 = _480 * _632;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _644 = _440 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _648 = _440 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _652 = _440 + _650;
    float _654 = _644 * _482;
    float _656 = _648 * _508;
    float _658 = 1.0 / _628;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _662 = _440 + _660;
    float _664 = _614 * _622;
    float _666 = fma(_492, _654, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _668 = _662 * _604;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _672 = _440 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _674;
    float _678 = _570 ? as_type<float>(_558) : _450;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _684;
    float _688 = fma(_676, _654, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _690;
    float _694 = fma(_686, _654, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _698;
    float _702 = _672 * _658;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _708 = _652 * _638;
    float _710 = fma(_700, _668, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _712 = fma(_682, _668, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _714 = fma(_692, _668, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _722 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _472);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _740;
    float _744 = fma(_706, _664, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _746 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _748 = isnan(_440);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    bool _766 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _768 = isnan(_440);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_720, _664, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _780 = fma(_726, _656, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _782 = fma(_516, _656, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _784 = fma(_730, _656, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _786 = fma(_734, _664, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _788 = fma(_738, _708, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _790 = fma(_760, _702, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _792 = fma(_764, _702, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _794 = -_756;
    float _796 = _794 + 1.0;
    float _798 = fma(_530, _702, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _800 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _802 = isnan(_440);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_776;
    float _814 = _812 + 1.0;
    float _816 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _818 = _776 * _796;
    bool _820 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _822 = isnan(_440);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _810 * _814;
    float _834 = -_810;
    float _836 = _834 + 1.0;
    float _838 = fma(_588, _816, -0.5);
    float _840 = _716 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _842 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _844 = isnan(_440);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -_830;
    float _856 = _854 + 1.0;
    float _858 = _830 * _836;
    bool _860 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _862 = isnan(_440);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = fma(_742, _708, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _874 = fma(_576, _840, -0.5);
    float _876 = _852 * _856;
    float _878 = -_852;
    float _880 = _878 + 1.0;
    float _882 = fma(_574, _556, -0.5);
    float _884 = fma(_526, _708, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _886 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _888 = isnan(_440);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _900 = -_870;
    float _902 = _900 + 1.0;
    float _904 = _870 * _880;
    float _906 = _640 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _908 = _640 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _910 = _896 * _902;
    float _912 = _640 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _914 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _906);
    float _916 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[25].x, _908);
    float _918 = _694 * _910;
    float _920 = _666 * _910;
    float _922 = _688 * _910;
    float _924 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[24].z, _914);
    float _926 = _910;
    int _928 = as_type<int>(_694);
    int _930 = as_type<int>(_914);
    float _932 = _688;
    float _934 = _634;
    int _936 = as_type<int>(_920);
    int _938 = as_type<int>(_918);
    float _940 = _832;
    if (_600)
    {
        float _942 = in.m_53.x;
        _926 = _942;
    }
    float _944 = _926;
    float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_552)
    {
        float _948 = -_442;
        float _950 = _948 + 1.0;
        _928 = as_type<int>(_950);
    }
    int _952 = _928;
    float _954 = _898 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_580)
    {
        float _956 = -_442;
        float _958 = _956 + 1.0;
        _930 = as_type<int>(_958);
    }
    int _960 = _930;
    float _962 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[26].x, _912);
    int _964 = _960;
    if (!_552)
    {
        _932 = _442;
    }
    float _966 = _932;
    float _968 = fma(_678, _954, -0.5);
    float _970 = _966;
    if (!_580)
    {
        _934 = _442;
    }
    float _972 = _934;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _976 = _972;
    if (_552)
    {
        float _978 = _548 ? as_type<float>(_952) : _442;
        _970 = _978;
    }
    float _980 = _970;
    float _982 = -_896;
    float _984 = _982 + 1.0;
    float _986 = _984;
    if (_580)
    {
        float _988 = _554 ? as_type<float>(_960) : _442;
        _976 = _988;
    }
    float _990 = _976;
    if (_584)
    {
        float _992 = -_442;
        float _994 = _992 + 1.0;
        _964 = as_type<int>(_994);
    }
    int _996 = _964;
    float _998 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[25].z, _916);
    float _1000 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[26].z, _962);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].z, _922);
    float _1004 = as_type<float>(_996);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[94].z;
    if (_584)
    {
        float _1008 = _554 ? as_type<float>(_996) : _442;
        _494 = _1008;
    }
    float _1010 = _494;
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].x, _918);
    float _1014 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].y, _920);
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    if (_600)
    {
        _936 = 0;
    }
    int _1018 = _936;
    int _1020 = _1018;
    if (_600)
    {
        _938 = 0;
    }
    int _1022 = _938;
    int _1024 = _1022;
    if (_600)
    {
        _1004 = _484;
    }
    float _1026 = _1004;
    float _1028 = _1026;
    if (_600)
    {
        _986 = _462;
    }
    float _1030 = _986;
    float _1032 = _1030;
    float _1034 = _944;
    if (_600)
    {
        _1006 = _944;
    }
    float _1036 = _1006;
    float _1038 = _1036;
    if (!_600)
    {
        float _1040 = in.m_53.x;
        float _1042 = _484 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _462 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = _1040 * 3.1415927410125732421875;
        float _1060 = _1058 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        _1024 = 2;
        _1020 = 1;
        _1032 = _1056;
        _1034 = _1040;
        _1038 = _1064;
        _1028 = _1052;
    }
    int _1066 = _1024;
    int _1068 = _1020;
    float _1070 = _1032;
    float _1072 = _1034;
    float _1074 = _1038;
    float _1076 = _1028;
    bool _1078 = _1066 != 2;
    float _1080 = fma(_780, _904, _1012);
    float _1082 = _946 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1084 = _1068 != 1;
    float _1086 = fma(_782, _904, _1014);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1092 = fma(_784, _904, _1002);
    float _1094 = fma(_1082, _540, -0.5);
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1098 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[94].z, _1016);
    float _1100 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1102 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1096);
    float _1104 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1106 = -_1090;
    float _1108 = fma(_1100, 2.0, _1106);
    float _1110 = fma(_710, _876, _1080);
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1114 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1102);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1120 = _1114 * (-0.15915493667125701904296875);
    float _1122 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1116);
    float _1124 = fma(_712, _876, _1086);
    float _1126 = fma(_1118, _1010, -0.5);
    float _1128 = _1120 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _610 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1134 = fma(_714, _876, _1092);
    float _1136 = fma(_744, _858, _1110);
    float _1138 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[94].x, _1098);
    float _1140 = fma(_778, _858, _1124);
    float _1142 = fma(_786, _858, _1134);
    float _1144 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1146 = _1120 * 6.283185482025146484375;
    float _1148 = cos(_1146);
    float _1150 = _1138 * (-0.15915493667125701904296875);
    float _1152 = -_126;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1108);
    float _1156 = fma(_1144, _990, -0.5);
    float _1158 = fma(_788, _832, _1136);
    float _1160 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1162 = _1130 * _838;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1166 = _1150 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1172 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1164);
    float _1174 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _630);
    float _1176 = _1148 * _838;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1180 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1172);
    float _1182 = -_1162;
    float _1184 = fma(_1148, _1094, _1182);
    float _1186 = fma(_1130, _1094, _1176);
    float _1188 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1178);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1192 = fma(_1104, _980, -0.5);
    float _1194 = -_1174;
    float _1196 = fma(_1180, _1186, _1194);
    float _1198 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1188);
    float _1200 = _1150 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = fma(_872, _832, _1140);
    float _1206 = -_1190;
    float _1208 = fma(_1160, 2.0, _1206);
    float _1210 = fma(_1198, _1184, _1154);
    float _1212 = _998 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1214 = _1198;
    float _1216 = _1188;
    float _1218 = _1180;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1084)
    {
        _1214 = _462;
    }
    float _1224 = _1214;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1230 = _1224;
    if (!_1084)
    {
        _1216 = _1224;
    }
    float _1232 = _1216;
    float _1234 = _722 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1236 = _1232;
    if (_1084)
    {
        _1230 = _462;
    }
    float _1238 = _1230;
    float _1240 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1170);
    float _1242 = fma(_884, _832, _1142);
    float _1244 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1228);
    float _1246 = fma(_790, _818, _1158);
    float _1248 = _924 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1252 = fma(_798, _818, _1242);
    float _1254 = _1242;
    if (!_1084)
    {
        _1218 = _1072;
    }
    float _1256 = _1218;
    float _1258 = fma(_792, _818, _1204);
    float _1260 = _1168 * _882;
    float _1262 = _1256;
    if (!_1084)
    {
        _940 = _484;
    }
    float _1264 = _940;
    float _1266 = _1202 * _882;
    float _1268 = _1202;
    float _1270 = _1264;
    if (_1084)
    {
        _1262 = _1238;
    }
    float _1272 = _1262;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1276 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1226);
    float _1278 = _1132 + _1248;
    float _1280 = _1234 + _1250;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1284 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1286 = -_1260;
    float _1288 = fma(_1202, _1126, _1286);
    float _1290 = _1272;
    float _1292 = _1278;
    float _1294 = _1280;
    if (!_1084)
    {
        _1268 = _1264;
    }
    float _1296 = _1268;
    float _1298 = fma(_1168, _1126, _1266);
    float _1300 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1274);
    float _1302 = _1296;
    if (_1084)
    {
        _1270 = _1072;
    }
    float _1304 = _1270;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1310 = _1278 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1314 = _1280 + _1312;
    float _1316 = fma(_1284, -2.0, _1282);
    if (!_1084)
    {
        _1254 = _1232;
    }
    float _1318 = _1254;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1322 = _1318;
    if (_1078)
    {
        _1290 = _484;
    }
    float _1324 = _1290;
    float _1326 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1306);
    float _1328 = _1324;
    if (_1084)
    {
        _1236 = _484;
    }
    float _1330 = _1236;
    float _1332 = _1314 * _1314;
    float _1334 = _1332;
    if (_1084)
    {
        _1302 = _1072;
    }
    float _1336 = _1302;
    float _1338 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1276);
    if (!_1078)
    {
        _1328 = _1072;
    }
    float _1340 = _1328;
    float _1342 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1316);
    if (_1078)
    {
        _1220 = _1072;
    }
    float _1344 = _1220;
    float _1346 = _1310 * _1310;
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1320);
    float _1350 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1122);
    float _1352 = -_126;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1208);
    float _1356 = _1346 + _1332;
    float _1358 = _1344;
    float _1360 = _1346;
    if (!_1078)
    {
        _1358 = _1238;
    }
    float _1362 = _1358;
    float _1364 = -_1342;
    float _1366 = fma(_1338, _1298, _1364);
    float _1368 = _1366;
    if (_1078)
    {
        _1222 = _1238;
    }
    float _1370 = _1222;
    float _1372 = sqrt(_1356);
    float _1374 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1300);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1378 = _1370;
    if (_1084)
    {
        _1322 = _484;
    }
    float _1380 = _1322;
    float _1382 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1078)
    {
        _1378 = _484;
    }
    float _1384 = _1378;
    float _1386 = fma(_1350, _1288, _1354);
    float _1388 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1246);
    float _1390 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1258);
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1396 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1252);
    float _1398 = _1374 * (-0.15915493667125701904296875);
    float _1400 = -_1392;
    float _1402 = fma(_1376, 2.0, _1400);
    float _1404 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1394);
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1408 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1410 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1404);
    float _1412 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1414 = fma(_1408, -2.0, _1406);
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1418 = _1398 * 6.283185482025146484375;
    float _1420 = sin(_1418);
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1424 = _1410 * (-0.15915493667125701904296875);
    bool _1426 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = -_1416;
    float _1430 = fma(_1382, 2.0, _1428);
    float _1432 = fma(_1412, -2.0, _1422);
    float _1434 = _506 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1436 = _1398 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1244);
    float _1442 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1240);
    float _1444 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1326);
    float _1446 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1348);
    float _1448 = -_126;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1402);
    float _1452 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1414);
    float _1454 = -_126;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1430);
    float _1458 = _1424 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1420 * _874;
    float _1464 = _1434 + _1212;
    float _1466 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1432);
    float _1468 = _1424 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = _1438 * _874;
    bool _1474 = !_1426;
    float _1476 = _1464;
    float _1478 = _1386;
    if (!_1474)
    {
        float _1480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1484 = _1372 + _1482;
        float _1486 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1488 = rsqrt(_1356);
        float _1490 = _1484 * _1480;
        float _1492 = _1490 * 0.15915493667125701904296875;
        float _1494 = _1492 * 6.283185482025146484375;
        float _1496 = sin(_1494);
        float _1498 = _1492 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = fma(_1496, _1486, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1504 = _1488 * _1502;
        float _1506 = _1500 + (-1.0);
        float _1508 = fma(_1310, _1504, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1510 = fma(_1314, _1504, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1512 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1516 = _1508 + _1514;
        float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1520 = _1510 + _1518;
        float _1522 = fma(_1464, _1500, _1512);
        float _1524 = _1516 * _1516;
        float _1526 = _1520 * _1520;
        _1476 = _1522;
        _1360 = _1524;
        _1334 = _1526;
        _1292 = _1508;
        _1294 = _1510;
    }
    float _1528 = _1476;
    float _1530 = _1360;
    float _1532 = _1334;
    float _1534 = _1292;
    float _1536 = _1294;
    float _1538 = _1460 * _968;
    float _1540 = _1470 * _968;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1544 = _1528 + _1542;
    float _1546 = -_1462;
    float _1548 = fma(_1438, _1192, _1546);
    float _1550 = fma(_1420, _1192, _1472);
    float _1552 = -_1538;
    float _1554 = fma(_1470, _1156, _1552);
    float _1556 = fma(_1544, _1544, _1530);
    float _1558 = fma(_1460, _1156, _1540);
    float _1560 = fma(_1444, _1548, _1450);
    float _1562 = -_1452;
    float _1564 = fma(_1446, _1550, _1562);
    float _1566 = _1556 + _1532;
    float _1568 = fma(_1442, _1554, _1456);
    float _1570 = -_1466;
    float _1572 = fma(_1440, _1558, _1570);
    float _1574 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1576 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1578 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1580 = sqrt(_1566);
    float _1582 = _1210 + 0.5;
    float _1584 = _1196 + 0.5;
    float _1586 = _1386 + 0.5;
    float _1588 = _1366 + 0.5;
    float _1590 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1596 = _1560 + 0.5;
    float _1598 = _1564 + 0.5;
    float _1600 = _1568 + 0.5;
    float _1602 = _1572 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1604 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1606 = isnan(_1580);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1612 = _1608 || _1610;
    out.m_63.x = _1586;
    out.m_63.y = _1588;
    out.m_65.x = _1590;
    out.m_65.y = _1592;
    out.m_65.z = _1594;
    out.m_67.x = _1582;
    out.m_67.y = _1584;
    out.m_67.z = _1596;
    out.m_67.w = _1598;
    float _1614 = _1592;
    float _1616 = _1582;
    if (!_1612)
    {
        _1478 = 1.0;
    }
    float _1618 = _1478;
    out.m_69.x = _1600;
    out.m_69.y = _1602;
    bool _1620 = !_1612;
    float _1622 = _1618;
    if (!_1620)
    {
        bool _1624 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1626 = isnan(_1580);
        bool _1628 = _1624 || _1626;
        bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1632 = _1628 || _1630;
        if (!_1632)
        {
            float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1636 = _1580 + _1634;
            float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1640 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1638;
            float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1646 = 1.0 / _1640;
            float _1648 = _1636 * _1646;
            float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1622 = _1650;
            _1652 = true;
        }
        else
        {
            bool _1654 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1656 = isnan(_1580);
            bool _1658 = _1654 || _1656;
            bool _1660 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1662 = _1658 || _1660;
            if (!_1662)
            {
                float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1666 = _1580 + _1664;
                float _1668 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1670 = _1668 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1674 = _1672 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1676 = 1.0 / _1670;
                float _1678 = _1666 * _1676;
                float _1680 = fma(_1678, _1674, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1622 = _1680;
                _1652 = true;
            }
            else
            {
                _1622 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1652 = false;
    float _1682 = _1622;
    float _1684 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1686 = _1528 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1690 = _1534 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1694 = _1536 + _1692;
    float _1696 = fma(_1686, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1698 = fma(_1690, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1700 = fma(_1694, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1696 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1698 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1700 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = fma(_1708, _1708, _1714);
    float _1718 = fma(_1712, _1712, _1716);
    float _1720 = rsqrt(_1718);
    float _1722 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1724 = _1708 * _1722;
    float _1726 = _1712 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 + _1730;
    float _1734 = sqrt(_1732);
    bool _1736 = _1734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = _1734 + _1738;
    float _1742 = _1712;
    float _1744 = _1740;
    float _1746 = _1704;
    float _1748 = _1724;
    if (_1736)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1742 = _1750;
    }
    float _1752 = _1742;
    if (_1736)
    {
        float _1754 = rsqrt(_1732);
        _1368 = _1754;
    }
    float _1756 = _1368;
    float _1758 = _1756;
    if (_1736)
    {
        float _1760 = _1740 * _1752;
        _1744 = _1760;
    }
    float _1762 = _1744;
    if (_1736)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1614 = _1764;
    }
    float _1766 = _1614;
    float _1768 = _1720;
    if (_1736)
    {
        float _1770 = _1766 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1716;
    float _1782 = _1776;
    float _1784 = _1778;
    if (_1736)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = -_1722;
    float _1794 = -_1778;
    float _1796 = fma(_1704, _1792, _1794);
    if (_1736)
    {
        float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1798;
    }
    float _1800 = _1782;
    float _1802 = sqrt(_1718);
    float _1804 = _1774;
    float _1806 = _1800;
    if (_1736)
    {
        float _1808 = fma(_1774, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1746 = _1808;
    }
    float _1810 = _1746;
    float _1812 = _1810;
    if (!_1736)
    {
        _1804 = _1726;
    }
    float _1814 = _1804;
    float _1816 = _1814;
    if (_1736)
    {
        float _1818 = _1790 + (-1.0);
        _1806 = _1818;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1736)
    {
        float _1824 = _1756 * _1810;
        _1616 = _1824;
    }
    float _1826 = _1616;
    if (!_1736)
    {
        _1758 = _1796;
    }
    float _1828 = _1758;
    float _1830 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1832 = _1828;
    if (_1736)
    {
        float _1834 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1834;
    }
    float _1836 = _1784;
    if (_1736)
    {
        float _1838 = _1724 * _1826;
        _1748 = _1838;
    }
    float _1840 = _1748;
    if (!_1736)
    {
        _1822 = _1728;
    }
    float _1842 = _1822;
    float _1844 = _1842;
    if (_1736)
    {
        float _1846 = _1726 * _1826;
        _1816 = _1846;
    }
    float _1848 = _1816;
    if (_1736)
    {
        float _1850 = fma(_1796, _1790, _1836);
        _1832 = _1850;
    }
    float _1852 = _1832;
    if (_1736)
    {
        float _1854 = _1840 * _1840;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (!_1736)
    {
        _1812 = _1730;
    }
    float _1858 = _1812;
    float _1860 = _1858;
    if (_1736)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1852, _1852, _1856);
    float _1868 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1870 = _1866 + _1864;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1874 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1872);
    float _1876 = precise::clamp(_1874, 0.0, 1.0);
    float _1878 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1868);
    float _1880 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1882 = rsqrt(_1870);
    float _1884 = -_1876;
    float _1886 = _1884 + 1.0;
    float _1888 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _1890 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1880);
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1900 = abs(_1886);
    float _1902 = log2(_1900);
    float _1904 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1906 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1908 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1910 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1830);
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1914 = -_1906;
    float _1916 = fma(_1914, _1894, 1.0);
    float _1918 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1920 = _1882 * _1840;
    float _1922 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1910);
    float _1924 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1882 * _1852;
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1882 * _1848;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1936 = -_1928;
    float _1938 = fma(_1926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1944 = log2(_1916);
    float _1946 = -_1930;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1950 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1952 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1954 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1956 = fma(_1948, -0.5, 0.5);
    float _1958 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1950);
    float _1960 = exp2(_1940);
    float _1962 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1954);
    float _1964 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1966 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1962);
    float _1968 = 1.0 / _1952;
    float _1970 = fma(_1948, 0.5, 0.5);
    float _1972 = _1926 + 1.0;
    float _1974 = _1944 * 0.693147182464599609375;
    float _1976 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1978 = sqrt(_1956);
    float _1980 = -_1926;
    float _1982 = fma(_1960, _1972, _1980);
    float _1984 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1964);
    float _1986 = fma(_1970, _1976, -0.212114393711090087890625);
    float _1988 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1966);
    float _1990 = fma(_1982, 0.5, 0.5);
    float _1992 = fma(_1970, _1986, 1.570728778839111328125);
    float _1994 = _1984 * _1968;
    float _1996 = _1988 * _1968;
    float _1998 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_1996, -0.5, 0.5);
    float _2004 = _1978 * 0.636619746685028076171875;
    float3 _5353 = float3(_2000, _2002, _1998);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).x;
    float3 _5364 = float3(_2000, _2002, _1998);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5364, float3(0.0), isnan(_5364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5364, float3(0.0), isnan(_5364)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float _2019 = -_1992;
    float _2021 = fma(_2004, _2019, 1.0);
    float2 _5386 = float2(_2021, _1990);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5386, float2(0.0), isnan(_5386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5386, float2(0.0), isnan(_5386)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2035 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2037 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2035);
    float _2039 = exp2(_2033);
    float _2041 = _1952 * 0.5;
    float _2043 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    float _2045 = fma(_1988, -0.5, _2041);
    float _2047 = _1984 + _1952;
    float _2049 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2043);
    float _2051 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2053 = _2047 * 0.5;
    float _2055 = _2049 + _1952;
    out.gl_Position.x = _1984;
    out.gl_Position.y = _1988;
    out.gl_Position.z = _2049;
    out.gl_Position.w = _1952;
    float _2057 = _2055 * 0.5;
    float _2059 = -_2039;
    float _2061 = _2059 + 1.0;
    out.m_47.x = _2051;
    float _2063 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2053;
    out.m_71.y = _2045;
    out.m_71.z = _2057;
    out.m_71.w = _1952;
    float _2065 = -_2063;
    float _2067 = _2065 + 1.0;
    float _2069 = _2063 * _2006;
    float _2071 = _2017 * _2069;
    float _2073 = _2031 * _2069;
    float _2075 = fma(_2027, _2071, _2011);
    float _2077 = fma(_2029, _2071, _2013);
    float _2079 = _2017 * _2067;
    float _2081 = fma(_2017, _2073, _2015);
    out.m_73.x = _2075;
    out.m_73.y = _2077;
    out.m_73.z = _2081;
    out.m_73.w = _2079;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1652 = false;
    bool _432 = false;
    bool _288 = false;
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
        float _2138 = as_type<float>(_108);
        out.gl_Position.z = _2138;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2207 = as_type<float>(_144);
        out.gl_Position.z = _2207;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_92);
        float _292 = 1.0 / _290;
        float _294 = _126 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _298;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _306 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_296);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = 1.0 / _300;
    float _320 = _302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = _296 + _324;
    float _328 = _304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _332 = _322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _334 = -_316;
    float _336 = _334 + 1.0;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _354;
    out.m_55.x = _320;
    out.m_55.y = _332;
    out.m_55.z = _328;
    out.m_55.w = _330;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _358;
    float _362 = _326 * _318;
    float _364 = _348 * _336;
    float _366 = in.m_51.x;
    float _368 = in.m_51.y;
    float _370 = in.m_51.z;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _374 = fma(_352, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = fma(_356, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = fma(_360, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _380 = -_348;
    float _382 = _380 + 1.0;
    float _384 = _374 * _364;
    float _386 = _376 * _364;
    float _388 = _378 * _364;
    float _390 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _384);
    float _392 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _386);
    float _394 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _388);
    float _396 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].x, _390);
    float _398 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].y, _392);
    float _400 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[144].z, _394);
    float _402 = _396 * _366;
    float _404 = _398 * _368;
    float _406 = _400 * _370;
    bool _408 = !_372;
    int _410 = as_type<int>(_390);
    bool _412 = _372;
    float _430;
    if (!_408)
    {
        float _414 = in.m_53.x;
        float _416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _418 = _414 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _422 = _420 * _416;
        float _424 = floor(_422);
        float _426 = -_424;
        float _428 = _422 + _426;
        _430 = _428;
        _432 = true;
    }
    else
    {
        float _434 = float(_92);
        float _436 = 1.0 / _434;
        float _438 = _126 * _436;
        _430 = _438;
    }
    _432 = false;
    float _440 = _430;
    float _442 = in.m_57.x;
    float _444 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _448 = _446 != 0;
    float _450 = in.m_57.y;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _454 = _452 != 0;
    float _456 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _458 = in.m_53.w;
    float _460 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _444);
    float _462 = in.m_53.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _472 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _456);
    float _474 = _396;
    if (_448)
    {
        float _476 = in.m_53.x;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _482 = 1.0 / _466;
    float _484 = in.m_53.y;
    float _486 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _488 = _406 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _490;
    float _494 = _442;
    if (_448)
    {
        float _496 = -_442;
        float _498 = _496 + 1.0;
        _410 = as_type<int>(_498);
    }
    int _500 = _410;
    float _502 = 0.0;
    if (!_448)
    {
        _502 = _442;
    }
    float _504 = _502;
    float _506 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _460);
    float _508 = 1.0 / _470;
    float _510 = -_450;
    float _512 = _510 + 1.0;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _518 = _458 > 0.5;
    float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _522 = _518 ? as_type<int>(_512) : as_type<int>(_450);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _532 = _504;
    if (_448)
    {
        bool _534 = _478 > 0.5;
        _412 = _534;
    }
    bool _536 = _412;
    if (_448)
    {
        float _538 = _536 ? as_type<float>(_500) : _442;
        _532 = _538;
    }
    float _540 = _532;
    float _542 = in.m_59.x;
    float _544 = in.m_59.y;
    float _546 = in.m_59.z;
    bool _548 = _462 > 0.5;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _552 = _550 != 0;
    bool _554 = _484 > 0.5;
    float _556 = _520 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _558 = _548 ? as_type<int>(_512) : as_type<int>(_450);
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _570 = _568 != 0;
    int _572 = _554 ? as_type<int>(_512) : as_type<int>(_450);
    float _574 = _454 ? as_type<float>(_558) : _450;
    float _576 = _566 ? as_type<float>(_522) : _450;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _584 = _582 != 0;
    float _586 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _588 = _562 ? as_type<float>(_572) : _450;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _600 = _598 != 0;
    float _602 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _586);
    float _604 = 1.0 / _592;
    float _606 = _484 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _610 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _602);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _614 = _440 + _612;
    float _616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _542);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _618;
    float _622 = 1.0 / _596;
    float _624 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _546);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _630 = fma(_606, -2.0, _608);
    float _632 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _544);
    float _634 = _486 * _616;
    float _636 = _488 * _624;
    float _638 = 1.0 / _620;
    float _640 = _480 * _632;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _644 = _440 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _648 = _440 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _652 = _440 + _650;
    float _654 = _644 * _482;
    float _656 = _648 * _508;
    float _658 = 1.0 / _628;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _662 = _440 + _660;
    float _664 = _614 * _622;
    float _666 = fma(_492, _654, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _668 = _662 * _604;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _672 = _440 + _670;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _674;
    float _678 = _570 ? as_type<float>(_558) : _450;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _680;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _684;
    float _688 = fma(_676, _654, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _690;
    float _694 = fma(_686, _654, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _698;
    float _702 = _672 * _658;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _708 = _652 * _638;
    float _710 = fma(_700, _668, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _712 = fma(_682, _668, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _714 = fma(_692, _668, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _722 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _472);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _734 = _732 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _740;
    float _744 = fma(_706, _664, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _746 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _748 = isnan(_440);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    bool _766 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _768 = isnan(_440);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = fma(_720, _664, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _780 = fma(_726, _656, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _782 = fma(_516, _656, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _784 = fma(_730, _656, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _786 = fma(_734, _664, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _788 = fma(_738, _708, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _790 = fma(_760, _702, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _792 = fma(_764, _702, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _794 = -_756;
    float _796 = _794 + 1.0;
    float _798 = fma(_530, _702, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _800 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _802 = isnan(_440);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_776;
    float _814 = _812 + 1.0;
    float _816 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _818 = _776 * _796;
    bool _820 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _822 = isnan(_440);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = _810 * _814;
    float _834 = -_810;
    float _836 = _834 + 1.0;
    float _838 = fma(_588, _816, -0.5);
    float _840 = _716 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _842 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _844 = isnan(_440);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -_830;
    float _856 = _854 + 1.0;
    float _858 = _830 * _836;
    bool _860 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _862 = isnan(_440);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = fma(_742, _708, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _874 = fma(_576, _840, -0.5);
    float _876 = _852 * _856;
    float _878 = -_852;
    float _880 = _878 + 1.0;
    float _882 = fma(_574, _556, -0.5);
    float _884 = fma(_526, _708, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _886 = _440 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _888 = isnan(_440);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _900 = -_870;
    float _902 = _900 + 1.0;
    float _904 = _870 * _880;
    float _906 = _640 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _908 = _640 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _910 = _896 * _902;
    float _912 = _640 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _914 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _906);
    float _916 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[25].x, _908);
    float _918 = _694 * _910;
    float _920 = _666 * _910;
    float _922 = _688 * _910;
    float _924 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[24].z, _914);
    float _926 = _910;
    int _928 = as_type<int>(_694);
    int _930 = as_type<int>(_914);
    float _932 = _688;
    float _934 = _634;
    int _936 = as_type<int>(_920);
    int _938 = as_type<int>(_918);
    float _940 = _832;
    if (_600)
    {
        float _942 = in.m_53.x;
        _926 = _942;
    }
    float _944 = _926;
    float _946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_552)
    {
        float _948 = -_442;
        float _950 = _948 + 1.0;
        _928 = as_type<int>(_950);
    }
    int _952 = _928;
    float _954 = _898 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_580)
    {
        float _956 = -_442;
        float _958 = _956 + 1.0;
        _930 = as_type<int>(_958);
    }
    int _960 = _930;
    float _962 = fma(_634, (*spvDescriptorSet0.vp_c8)._m0[26].x, _912);
    int _964 = _960;
    if (!_552)
    {
        _932 = _442;
    }
    float _966 = _932;
    float _968 = fma(_678, _954, -0.5);
    float _970 = _966;
    if (!_580)
    {
        _934 = _442;
    }
    float _972 = _934;
    float _974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _976 = _972;
    if (_552)
    {
        float _978 = _548 ? as_type<float>(_952) : _442;
        _970 = _978;
    }
    float _980 = _970;
    float _982 = -_896;
    float _984 = _982 + 1.0;
    float _986 = _984;
    if (_580)
    {
        float _988 = _554 ? as_type<float>(_960) : _442;
        _976 = _988;
    }
    float _990 = _976;
    if (_584)
    {
        float _992 = -_442;
        float _994 = _992 + 1.0;
        _964 = as_type<int>(_994);
    }
    int _996 = _964;
    float _998 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[25].z, _916);
    float _1000 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[26].z, _962);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].z, _922);
    float _1004 = as_type<float>(_996);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[94].z;
    if (_584)
    {
        float _1008 = _554 ? as_type<float>(_996) : _442;
        _494 = _1008;
    }
    float _1010 = _494;
    float _1012 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].x, _918);
    float _1014 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[123].y, _920);
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    if (_600)
    {
        _936 = 0;
    }
    int _1018 = _936;
    int _1020 = _1018;
    if (_600)
    {
        _938 = 0;
    }
    int _1022 = _938;
    int _1024 = _1022;
    if (_600)
    {
        _1004 = _484;
    }
    float _1026 = _1004;
    float _1028 = _1026;
    if (_600)
    {
        _986 = _462;
    }
    float _1030 = _986;
    float _1032 = _1030;
    float _1034 = _944;
    if (_600)
    {
        _1006 = _944;
    }
    float _1036 = _1006;
    float _1038 = _1036;
    if (!_600)
    {
        float _1040 = in.m_53.x;
        float _1042 = _484 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _462 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        float _1058 = _1040 * 3.1415927410125732421875;
        float _1060 = _1058 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        _1024 = 2;
        _1020 = 1;
        _1032 = _1056;
        _1034 = _1040;
        _1038 = _1064;
        _1028 = _1052;
    }
    int _1066 = _1024;
    int _1068 = _1020;
    float _1070 = _1032;
    float _1072 = _1034;
    float _1074 = _1038;
    float _1076 = _1028;
    bool _1078 = _1066 != 2;
    float _1080 = fma(_780, _904, _1012);
    float _1082 = _946 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1084 = _1068 != 1;
    float _1086 = fma(_782, _904, _1014);
    float _1088 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1092 = fma(_784, _904, _1002);
    float _1094 = fma(_1082, _540, -0.5);
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1098 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[94].z, _1016);
    float _1100 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1102 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1096);
    float _1104 = _974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1106 = -_1090;
    float _1108 = fma(_1100, 2.0, _1106);
    float _1110 = fma(_710, _876, _1080);
    float _1112 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1114 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1102);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1118 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1120 = _1114 * (-0.15915493667125701904296875);
    float _1122 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1116);
    float _1124 = fma(_712, _876, _1086);
    float _1126 = fma(_1118, _1010, -0.5);
    float _1128 = _1120 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _610 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1134 = fma(_714, _876, _1092);
    float _1136 = fma(_744, _858, _1110);
    float _1138 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[94].x, _1098);
    float _1140 = fma(_778, _858, _1124);
    float _1142 = fma(_786, _858, _1134);
    float _1144 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1146 = _1120 * 6.283185482025146484375;
    float _1148 = cos(_1146);
    float _1150 = _1138 * (-0.15915493667125701904296875);
    float _1152 = -_126;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1108);
    float _1156 = fma(_1144, _990, -0.5);
    float _1158 = fma(_788, _832, _1136);
    float _1160 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1162 = _1130 * _838;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1166 = _1150 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1172 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1164);
    float _1174 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _630);
    float _1176 = _1148 * _838;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1180 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1172);
    float _1182 = -_1162;
    float _1184 = fma(_1148, _1094, _1182);
    float _1186 = fma(_1130, _1094, _1176);
    float _1188 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1178);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1192 = fma(_1104, _980, -0.5);
    float _1194 = -_1174;
    float _1196 = fma(_1180, _1186, _1194);
    float _1198 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1188);
    float _1200 = _1150 * 6.283185482025146484375;
    float _1202 = cos(_1200);
    float _1204 = fma(_872, _832, _1140);
    float _1206 = -_1190;
    float _1208 = fma(_1160, 2.0, _1206);
    float _1210 = fma(_1198, _1184, _1154);
    float _1212 = _998 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1214 = _1198;
    float _1216 = _1188;
    float _1218 = _1180;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    if (!_1084)
    {
        _1214 = _462;
    }
    float _1224 = _1214;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1228 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1230 = _1224;
    if (!_1084)
    {
        _1216 = _1224;
    }
    float _1232 = _1216;
    float _1234 = _722 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1236 = _1232;
    if (_1084)
    {
        _1230 = _462;
    }
    float _1238 = _1230;
    float _1240 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1170);
    float _1242 = fma(_884, _832, _1142);
    float _1244 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1228);
    float _1246 = fma(_790, _818, _1158);
    float _1248 = _924 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1250 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1252 = fma(_798, _818, _1242);
    float _1254 = _1242;
    if (!_1084)
    {
        _1218 = _1072;
    }
    float _1256 = _1218;
    float _1258 = fma(_792, _818, _1204);
    float _1260 = _1168 * _882;
    float _1262 = _1256;
    if (!_1084)
    {
        _940 = _484;
    }
    float _1264 = _940;
    float _1266 = _1202 * _882;
    float _1268 = _1202;
    float _1270 = _1264;
    if (_1084)
    {
        _1262 = _1238;
    }
    float _1272 = _1262;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1276 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1226);
    float _1278 = _1132 + _1248;
    float _1280 = _1234 + _1250;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1284 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1286 = -_1260;
    float _1288 = fma(_1202, _1126, _1286);
    float _1290 = _1272;
    float _1292 = _1278;
    float _1294 = _1280;
    if (!_1084)
    {
        _1268 = _1264;
    }
    float _1296 = _1268;
    float _1298 = fma(_1168, _1126, _1266);
    float _1300 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1274);
    float _1302 = _1296;
    if (_1084)
    {
        _1270 = _1072;
    }
    float _1304 = _1270;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1310 = _1278 + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1314 = _1280 + _1312;
    float _1316 = fma(_1284, -2.0, _1282);
    if (!_1084)
    {
        _1254 = _1232;
    }
    float _1318 = _1254;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1322 = _1318;
    if (_1078)
    {
        _1290 = _484;
    }
    float _1324 = _1290;
    float _1326 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1306);
    float _1328 = _1324;
    if (_1084)
    {
        _1236 = _484;
    }
    float _1330 = _1236;
    float _1332 = _1314 * _1314;
    float _1334 = _1332;
    if (_1084)
    {
        _1302 = _1072;
    }
    float _1336 = _1302;
    float _1338 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1276);
    if (!_1078)
    {
        _1328 = _1072;
    }
    float _1340 = _1328;
    float _1342 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1316);
    if (_1078)
    {
        _1220 = _1072;
    }
    float _1344 = _1220;
    float _1346 = _1310 * _1310;
    float _1348 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1320);
    float _1350 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1122);
    float _1352 = -_126;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1208);
    float _1356 = _1346 + _1332;
    float _1358 = _1344;
    float _1360 = _1346;
    if (!_1078)
    {
        _1358 = _1238;
    }
    float _1362 = _1358;
    float _1364 = -_1342;
    float _1366 = fma(_1338, _1298, _1364);
    float _1368 = _1366;
    if (_1078)
    {
        _1222 = _1238;
    }
    float _1370 = _1222;
    float _1372 = sqrt(_1356);
    float _1374 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1300);
    float _1376 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1378 = _1370;
    if (_1084)
    {
        _1322 = _484;
    }
    float _1380 = _1322;
    float _1382 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_1078)
    {
        _1378 = _484;
    }
    float _1384 = _1378;
    float _1386 = fma(_1350, _1288, _1354);
    float _1388 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1246);
    float _1390 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1258);
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1396 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1252);
    float _1398 = _1374 * (-0.15915493667125701904296875);
    float _1400 = -_1392;
    float _1402 = fma(_1376, 2.0, _1400);
    float _1404 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1394);
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1408 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1410 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1404);
    float _1412 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1414 = fma(_1408, -2.0, _1406);
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1418 = _1398 * 6.283185482025146484375;
    float _1420 = sin(_1418);
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1424 = _1410 * (-0.15915493667125701904296875);
    bool _1426 = _1372 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1428 = -_1416;
    float _1430 = fma(_1382, 2.0, _1428);
    float _1432 = fma(_1412, -2.0, _1422);
    float _1434 = _506 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1436 = _1398 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1244);
    float _1442 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1240);
    float _1444 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1326);
    float _1446 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1348);
    float _1448 = -_126;
    float _1450 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1402);
    float _1452 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1414);
    float _1454 = -_126;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1430);
    float _1458 = _1424 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1420 * _874;
    float _1464 = _1434 + _1212;
    float _1466 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1432);
    float _1468 = _1424 * 6.283185482025146484375;
    float _1470 = cos(_1468);
    float _1472 = _1438 * _874;
    bool _1474 = !_1426;
    float _1476 = _1464;
    float _1478 = _1386;
    if (!_1474)
    {
        float _1480 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1484 = _1372 + _1482;
        float _1486 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1488 = rsqrt(_1356);
        float _1490 = _1484 * _1480;
        float _1492 = _1490 * 0.15915493667125701904296875;
        float _1494 = _1492 * 6.283185482025146484375;
        float _1496 = sin(_1494);
        float _1498 = _1492 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = fma(_1496, _1486, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1504 = _1488 * _1502;
        float _1506 = _1500 + (-1.0);
        float _1508 = fma(_1310, _1504, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1510 = fma(_1314, _1504, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1512 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1516 = _1508 + _1514;
        float _1518 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1520 = _1510 + _1518;
        float _1522 = fma(_1464, _1500, _1512);
        float _1524 = _1516 * _1516;
        float _1526 = _1520 * _1520;
        _1476 = _1522;
        _1360 = _1524;
        _1334 = _1526;
        _1292 = _1508;
        _1294 = _1510;
    }
    float _1528 = _1476;
    float _1530 = _1360;
    float _1532 = _1334;
    float _1534 = _1292;
    float _1536 = _1294;
    float _1538 = _1460 * _968;
    float _1540 = _1470 * _968;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1544 = _1528 + _1542;
    float _1546 = -_1462;
    float _1548 = fma(_1438, _1192, _1546);
    float _1550 = fma(_1420, _1192, _1472);
    float _1552 = -_1538;
    float _1554 = fma(_1470, _1156, _1552);
    float _1556 = fma(_1544, _1544, _1530);
    float _1558 = fma(_1460, _1156, _1540);
    float _1560 = fma(_1444, _1548, _1450);
    float _1562 = -_1452;
    float _1564 = fma(_1446, _1550, _1562);
    float _1566 = _1556 + _1532;
    float _1568 = fma(_1442, _1554, _1456);
    float _1570 = -_1466;
    float _1572 = fma(_1440, _1558, _1570);
    float _1574 = _1388 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1576 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1578 = _1396 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1580 = sqrt(_1566);
    float _1582 = _1210 + 0.5;
    float _1584 = _1196 + 0.5;
    float _1586 = _1386 + 0.5;
    float _1588 = _1366 + 0.5;
    float _1590 = _1574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1592 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1594 = _1578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1596 = _1560 + 0.5;
    float _1598 = _1564 + 0.5;
    float _1600 = _1568 + 0.5;
    float _1602 = _1572 + 0.5;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    bool _1604 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1606 = isnan(_1580);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1612 = _1608 || _1610;
    out.m_63.x = _1586;
    out.m_63.y = _1588;
    out.m_65.x = _1590;
    out.m_65.y = _1592;
    out.m_65.z = _1594;
    out.m_67.x = _1582;
    out.m_67.y = _1584;
    out.m_67.z = _1596;
    out.m_67.w = _1598;
    float _1614 = _1592;
    float _1616 = _1582;
    if (!_1612)
    {
        _1478 = 1.0;
    }
    float _1618 = _1478;
    out.m_69.x = _1600;
    out.m_69.y = _1602;
    bool _1620 = !_1612;
    float _1622 = _1618;
    if (!_1620)
    {
        bool _1624 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1626 = isnan(_1580);
        bool _1628 = _1624 || _1626;
        bool _1630 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1632 = _1628 || _1630;
        if (!_1632)
        {
            float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1636 = _1580 + _1634;
            float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1640 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1638;
            float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1644 = _1642 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1646 = 1.0 / _1640;
            float _1648 = _1636 * _1646;
            float _1650 = fma(_1648, _1644, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1622 = _1650;
            _1652 = true;
        }
        else
        {
            bool _1654 = _1580 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1656 = isnan(_1580);
            bool _1658 = _1654 || _1656;
            bool _1660 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1662 = _1658 || _1660;
            if (!_1662)
            {
                float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1666 = _1580 + _1664;
                float _1668 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1670 = _1668 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1672 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1674 = _1672 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1676 = 1.0 / _1670;
                float _1678 = _1666 * _1676;
                float _1680 = fma(_1678, _1674, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1622 = _1680;
                _1652 = true;
            }
            else
            {
                _1622 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1652 = false;
    float _1682 = _1622;
    float _1684 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1686 = _1528 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1690 = _1534 + _1688;
    float _1692 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1694 = _1536 + _1692;
    float _1696 = fma(_1686, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1698 = fma(_1690, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1700 = fma(_1694, _1682, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1696 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1698 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1700 + _1710;
    float _1714 = _1704 * _1704;
    float _1716 = fma(_1708, _1708, _1714);
    float _1718 = fma(_1712, _1712, _1716);
    float _1720 = rsqrt(_1718);
    float _1722 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1724 = _1708 * _1722;
    float _1726 = _1712 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 * _1726;
    float _1732 = _1728 + _1730;
    float _1734 = sqrt(_1732);
    bool _1736 = _1734 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1740 = _1734 + _1738;
    float _1742 = _1712;
    float _1744 = _1740;
    float _1746 = _1704;
    float _1748 = _1724;
    if (_1736)
    {
        float _1750 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1742 = _1750;
    }
    float _1752 = _1742;
    if (_1736)
    {
        float _1754 = rsqrt(_1732);
        _1368 = _1754;
    }
    float _1756 = _1368;
    float _1758 = _1756;
    if (_1736)
    {
        float _1760 = _1740 * _1752;
        _1744 = _1760;
    }
    float _1762 = _1744;
    if (_1736)
    {
        float _1764 = _1762 * 0.15915493667125701904296875;
        _1614 = _1764;
    }
    float _1766 = _1614;
    float _1768 = _1720;
    if (_1736)
    {
        float _1770 = _1766 * 6.283185482025146484375;
        float _1772 = sin(_1770);
        _1768 = _1772;
    }
    float _1774 = _1768;
    float _1776 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1778 = precise::max(0.0, _1776);
    float _1780 = _1716;
    float _1782 = _1776;
    float _1784 = _1778;
    if (_1736)
    {
        float _1786 = _1766 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        _1780 = _1788;
    }
    float _1790 = _1780;
    float _1792 = -_1722;
    float _1794 = -_1778;
    float _1796 = fma(_1704, _1792, _1794);
    if (_1736)
    {
        float _1798 = _1796 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1798;
    }
    float _1800 = _1782;
    float _1802 = sqrt(_1718);
    float _1804 = _1774;
    float _1806 = _1800;
    if (_1736)
    {
        float _1808 = fma(_1774, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1746 = _1808;
    }
    float _1810 = _1746;
    float _1812 = _1810;
    if (!_1736)
    {
        _1804 = _1726;
    }
    float _1814 = _1804;
    float _1816 = _1814;
    if (_1736)
    {
        float _1818 = _1790 + (-1.0);
        _1806 = _1818;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1736)
    {
        float _1824 = _1756 * _1810;
        _1616 = _1824;
    }
    float _1826 = _1616;
    if (!_1736)
    {
        _1758 = _1796;
    }
    float _1828 = _1758;
    float _1830 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1832 = _1828;
    if (_1736)
    {
        float _1834 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1784 = _1834;
    }
    float _1836 = _1784;
    if (_1736)
    {
        float _1838 = _1724 * _1826;
        _1748 = _1838;
    }
    float _1840 = _1748;
    if (!_1736)
    {
        _1822 = _1728;
    }
    float _1842 = _1822;
    float _1844 = _1842;
    if (_1736)
    {
        float _1846 = _1726 * _1826;
        _1816 = _1846;
    }
    float _1848 = _1816;
    if (_1736)
    {
        float _1850 = fma(_1796, _1790, _1836);
        _1832 = _1850;
    }
    float _1852 = _1832;
    if (_1736)
    {
        float _1854 = _1840 * _1840;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (!_1736)
    {
        _1812 = _1730;
    }
    float _1858 = _1812;
    float _1860 = _1858;
    if (_1736)
    {
        float _1862 = _1848 * _1848;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1852, _1852, _1856);
    float _1868 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1870 = _1866 + _1864;
    float _1872 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1874 = fma(_1802, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1872);
    float _1876 = precise::clamp(_1874, 0.0, 1.0);
    float _1878 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1868);
    float _1880 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1882 = rsqrt(_1870);
    float _1884 = -_1876;
    float _1886 = _1884 + 1.0;
    float _1888 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1878);
    float _1890 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1880);
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1896 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1898 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1900 = abs(_1886);
    float _1902 = log2(_1900);
    float _1904 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1906 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1908 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1898);
    float _1910 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1830);
    float _1912 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1914 = -_1906;
    float _1916 = fma(_1914, _1894, 1.0);
    float _1918 = _1908 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1920 = _1882 * _1840;
    float _1922 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1910);
    float _1924 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1882 * _1852;
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1882 * _1848;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1922 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1936 = -_1928;
    float _1938 = fma(_1926, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1936);
    float _1940 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1942 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1944 = log2(_1916);
    float _1946 = -_1930;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1938);
    float _1950 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1952 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1942);
    float _1954 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1956 = fma(_1948, -0.5, 0.5);
    float _1958 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1950);
    float _1960 = exp2(_1940);
    float _1962 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1954);
    float _1964 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1966 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1962);
    float _1968 = 1.0 / _1952;
    float _1970 = fma(_1948, 0.5, 0.5);
    float _1972 = _1926 + 1.0;
    float _1974 = _1944 * 0.693147182464599609375;
    float _1976 = fma(_1970, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1978 = sqrt(_1956);
    float _1980 = -_1926;
    float _1982 = fma(_1960, _1972, _1980);
    float _1984 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1964);
    float _1986 = fma(_1970, _1976, -0.212114393711090087890625);
    float _1988 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1966);
    float _1990 = fma(_1982, 0.5, 0.5);
    float _1992 = fma(_1970, _1986, 1.570728778839111328125);
    float _1994 = _1984 * _1968;
    float _1996 = _1988 * _1968;
    float _1998 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_1996, -0.5, 0.5);
    float _2004 = _1978 * 0.636619746685028076171875;
    float3 _5353 = float3(_2000, _2002, _1998);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).x;
    float3 _5364 = float3(_2000, _2002, _1998);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5364, float3(0.0), isnan(_5364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5364, float3(0.0), isnan(_5364)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float _2019 = -_1992;
    float _2021 = fma(_2004, _2019, 1.0);
    float2 _5386 = float2(_2021, _1990);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5386, float2(0.0), isnan(_5386)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5386, float2(0.0), isnan(_5386)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2035 = _1912 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2037 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2035);
    float _2039 = exp2(_2033);
    float _2041 = _1952 * 0.5;
    float _2043 = fma(_1896, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    float _2045 = fma(_1988, -0.5, _2041);
    float _2047 = _1984 + _1952;
    float _2049 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2043);
    float _2051 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2053 = _2047 * 0.5;
    float _2055 = _2049 + _1952;
    out.gl_Position.x = _1984;
    out.gl_Position.y = _1988;
    out.gl_Position.z = _2049;
    out.gl_Position.w = _1952;
    float _2057 = _2055 * 0.5;
    float _2059 = -_2039;
    float _2061 = _2059 + 1.0;
    out.m_47.x = _2051;
    float _2063 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.x = _2053;
    out.m_71.y = _2045;
    out.m_71.z = _2057;
    out.m_71.w = _1952;
    float _2065 = -_2063;
    float _2067 = _2065 + 1.0;
    float _2069 = _2063 * _2006;
    float _2071 = _2017 * _2069;
    float _2073 = _2031 * _2069;
    float _2075 = fma(_2027, _2071, _2011);
    float _2077 = fma(_2029, _2071, _2013);
    float _2079 = _2017 * _2067;
    float _2081 = fma(_2017, _2073, _2015);
    out.m_73.x = _2075;
    out.m_73.y = _2077;
    out.m_73.z = _2081;
    out.m_73.w = _2079;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

