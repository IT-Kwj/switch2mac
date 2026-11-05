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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2218 = as_type<float>(_106);
        out.gl_Position.z = _2218;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2288 = as_type<float>(_144);
        out.gl_Position.z = _2288;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
    float _292;
    float _294;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = float(_90);
        float _276 = 1.0 / _274;
        float _278 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = _124 * _276;
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _272;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = _280;
        _296 = true;
    }
    else
    {
        float _298 = float(_90);
        float _300 = 1.0 / _298;
        float _302 = _124 * _300;
        _292 = _302;
        _294 = _302;
    }
    _296 = false;
    float _304 = _292;
    float _306 = _294;
    float _308 = in.m_53.x;
    float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _314 = _312 != 0;
    float _316 = in.m_51.x;
    float _318 = in.m_51.y;
    float _320 = in.m_51.z;
    float _322 = in.m_51.w;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _326 = _324 != 0;
    float _328 = in.m_53.y;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _332 = _330 != 0;
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _336 = _334 != 0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _338;
    float _342 = _260;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _346 = _328;
    if (_314)
    {
        float _348 = in.m_51.x;
        _342 = _348;
    }
    float _350 = _342;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _356 = _256;
    if (_326)
    {
        float _358 = in.m_51.z;
        _356 = _358;
    }
    float _360 = _356;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _364 = _362 != 0;
    float _366 = _308;
    if (_314)
    {
        float _368 = -_308;
        float _370 = _368 + 1.0;
        _344 = as_type<int>(_370);
    }
    int _372 = _344;
    float _374 = 0.0;
    int _376 = _372;
    if (!_314)
    {
        _374 = _308;
    }
    float _378 = _374;
    float _380 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _382 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _384 = _322 > 0.5;
    float _386 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _380);
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _392 = _318 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _398 = 1.0 / _354;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _404 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _406 = fma(_392, -2.0, _390);
    float _408 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _388);
    float _410 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _412 = false;
    float _414 = _378;
    if (_314)
    {
        bool _416 = _350 > 0.5;
        _412 = _416;
    }
    bool _418 = _412;
    float _420 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _422 = 1.0 / _396;
    bool _424 = _418;
    if (_314)
    {
        float _426 = _418 ? as_type<float>(_372) : _308;
        _414 = _426;
    }
    float _428 = _414;
    if (_326)
    {
        float _430 = -_308;
        float _432 = _430 + 1.0;
        _376 = as_type<int>(_432);
    }
    int _434 = _376;
    if (_326)
    {
        bool _436 = _360 > 0.5;
        _424 = _436;
    }
    bool _438 = _424;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    if (_326)
    {
        float _446 = _438 ? as_type<float>(_434) : _308;
        _366 = _446;
    }
    float _448 = _366;
    float _450 = 1.0 / _402;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _462 = _460 != 0;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _466 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _480 = 1.0 / _340;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _484 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _490 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    float _492 = 1.0 / _478;
    float _494 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_57.x = _484;
    out.m_57.y = _466;
    out.m_57.z = _468;
    out.m_57.w = _482;
    float _498 = _320 * 2.0;
    float _500 = _316 * 2.0;
    float _502 = -_496;
    float _504 = fma(_410, 2.0, _502);
    float _506 = 1.0 / _444;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _510 = _304 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _304 + _516;
    float _520 = _318 * 2.0;
    float _522 = _510 * _398;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _524;
    float _528 = _518 * _480;
    float _530 = 1.0 / _474;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _540 = -_328;
    float _542 = _540 + 1.0;
    float _544 = 0.0;
    if (!_364)
    {
        _544 = _316;
    }
    float _546 = _544;
    float _548 = _538 * _422;
    float _550 = _526 * _450;
    float _552 = 1.0 / _488;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _560 = _534 * _506;
    float _562 = _318 + _320;
    float _564 = _316 + _320;
    float _566 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[79].z, _558);
    float _568 = floor(_498);
    float _570 = _556 * _530;
    float _572 = _320 + (-0.5);
    float _574 = 0.0;
    float _576 = _546;
    if (!_364)
    {
        _574 = _320;
    }
    float _578 = _574;
    float _580 = _562 + (-1.0);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _590 = floor(_500);
    float _592 = _578;
    if (_364)
    {
        _576 = _320;
    }
    float _594 = _576;
    float _596 = _584 * _492;
    float _598 = _318 + _316;
    float _600 = _588 * _552;
    float _602 = 0.0;
    if (!_364)
    {
        _602 = _320;
    }
    float _604 = _602;
    float _606 = 1.0 / _514;
    int _608 = _384 ? as_type<int>(_542) : as_type<int>(_328);
    float _610 = _598 + (-1.0);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _614 = _318 > 0.5;
    float _616 = floor(_520);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _618;
    float _622 = _332 ? as_type<float>(_608) : _328;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _626 = _604;
    if (_336)
    {
        float _628 = _614 ? _542 : _328;
        _346 = _628;
    }
    float _630 = _346;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _634 = _568 >= 0.0;
    bool _636 = isnan(_568);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].z, _612);
    float _646 = _620 * _606;
    float _648 = _316 + (-0.5);
    bool _650 = _590 >= 0.0;
    bool _652 = isnan(_590);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _318 + (-0.5);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _662;
    float _666 = 0.0;
    if (!_364)
    {
        _666 = _318;
    }
    float _668 = _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = 0.0;
    float _676 = _668;
    if (!_364)
    {
        _674 = _318;
    }
    float _678 = _674;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _680;
    float _684 = fma(_664, _528, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _686 = _678;
    if (_364)
    {
        _676 = _316;
    }
    float _688 = _676;
    float _690 = fma(_672, _522, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    if (_364)
    {
        _686 = _316;
    }
    float _692 = _686;
    float _694 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[78].w, _632);
    if (_364)
    {
        _592 = _318;
    }
    float _696 = _592;
    float _698 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_364)
    {
        _626 = _318;
    }
    float _700 = _626;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _702;
    int _706 = _642 ? 0 : 1;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _710 = _306 + _708;
    int _712 = _658 ? 0 : 1;
    float _714 = fma(_704, _528, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _716 = _616 > 0.0;
    float _718 = fma(_682, _528, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _720 = _616 >= 0.0;
    bool _722 = isnan(_616);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _732 = _306 + _730;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _736 = _568 > 0.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _740 = _306 + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _744 = _306 + _742;
    float _746 = fma(_560, _732, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _752 = fma(_548, _740, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _754 = fma(_600, _744, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _758 = _306 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _762 = _306 + _760;
    bool _764 = _590 > 0.0;
    float _766 = fma(_550, _710, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _768 = fma(_570, _758, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _770 = fma(_750, _522, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _772 = fma(_596, _762, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _776 = _306 + _774;
    bool _778 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _780 = isnan(_306);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = _734 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _798 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _800 = isnan(_306);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = fma(_646, _776, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _812 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[84].z, _790);
    float _814 = fma(_794, _522, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _816 = -_788;
    float _818 = _816 + 1.0;
    bool _820 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _822 = isnan(_306);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -_808;
    float _834 = _832 + 1.0;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _838 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _840 = isnan(_306);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = _808 * _818;
    float _852 = _830 * _834;
    float _854 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    float _856 = -_830;
    float _858 = _856 + 1.0;
    float _860 = fma(_622, _796, -0.5);
    bool _862 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _864 = isnan(_306);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_848;
    float _876 = _874 + 1.0;
    bool _878 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _880 = isnan(_304);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = _848 * _858;
    bool _892 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _894 = isnan(_304);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _696 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _906 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _908 = isnan(_304);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = _688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _920 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _922 = isnan(_306);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_902;
    float _934 = _932 + 1.0;
    bool _936 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _938 = isnan(_306);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -_916;
    float _950 = _948 + 1.0;
    bool _952 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _954 = isnan(_306);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _872 * _876;
    float _966 = -_872;
    float _968 = _966 + 1.0;
    float _970 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _972 = log2(_970);
    float _974 = -_962;
    float _976 = _974 + 1.0;
    float _978 = _962 * _968;
    float _980 = _902 * _950;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _984 = -_946;
    float _986 = _984 + 1.0;
    float _988 = _888 * _934;
    float _990 = _946 * _976;
    float _992 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].w, _982);
    float _994 = _930 * _986;
    float _996 = _684 * _988;
    float _998 = _714 * _988;
    float _1000 = _718 * _988;
    float _1002 = _310 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1006 = fma(_1002, _630, -0.5);
    float _1008 = _972 * _124;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1012 = _746 * _994;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1016 = -_888;
    float _1018 = _1016 + 1.0;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1022 = -_930;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_904, -2.0, _1014);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].x, _996);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    float _1034 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[79].x, _566);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].y, _998);
    float _1038 = -_1010;
    float _1040 = fma(_918, 2.0, _1038);
    float _1042 = exp2(_1008);
    float _1044 = _1034 * (-0.15915493667125701904296875);
    float _1046 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1000);
    int _1048 = _728 ? 0 : 1;
    float _1050 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1012);
    int _1052 = ~_706;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = fma(_690, _980, _1028);
    int _1060 = _1056;
    float _1062 = _850;
    if (!_736)
    {
        int _1064 = ~_706;
        int _1066 = _1064 + 1;
        _1060 = _1066;
    }
    int _1068 = _1060;
    float _1070 = 1.0 / _1032;
    bool _1072 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1074 = isnan(1.0);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1080 = _1076 || _1078;
    float _1082 = fma(_752, _990, _1050);
    int _1084 = ~_1048;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = fma(_770, _980, _1036);
    int _1092 = ~_712;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    float _1098 = fma(_814, _980, _1046);
    int _1100 = _1088;
    int _1102 = _1096;
    if (!_716)
    {
        int _1104 = ~_1048;
        int _1106 = _1104 + 1;
        _1100 = _1106;
    }
    int _1108 = _1100;
    float _1110 = _1044 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    if (!_764)
    {
        int _1114 = ~_712;
        int _1116 = _1114 + 1;
        _1102 = _1116;
    }
    int _1118 = _1102;
    float _1120 = -_1042;
    float _1122 = _1120 + 1.0;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1136 = -_124;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[76].x, _504);
    float _1140 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _1142 = _1132 ? _1122 : 0.0;
    float _1144 = _1044 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1150 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _406);
    float _1152 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _644);
    float _1154 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[84].x, _812);
    float _1156 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _854);
    float _1158 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _992);
    float _1160 = -_124;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1040);
    float _1164 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1026);
    if (_1080)
    {
        float _1166 = _1142 * _1070;
        _126 = _1166;
    }
    float _1168 = _126;
    float _1170 = fma(_1148, _448, -0.5);
    float _1172 = fma(_1134, _428, -0.5);
    float _1174 = fma(_766, _978, _1082);
    float _1176 = _1112 * _1006;
    bool _1178 = !_454;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _1154 * (-0.15915493667125701904296875);
    float _1184 = _408 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1186 = _1146 * _1006;
    float _1188 = -_1176;
    float _1190 = fma(_1146, _1172, _1188);
    float _1192 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1194 = abs(_1180);
    float _1196 = _1182 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    bool _1200 = !_458;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = in.m_59.x;
    float _1208 = in.m_59.y;
    float _1210 = in.m_59.z;
    float _1212 = fma(_1112, _1172, _1186);
    int _1214 = abs(_1202);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1192 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1184 + _1220;
    float _1224 = _1182 * 6.283185482025146484375;
    float _1226 = cos(_1224);
    float _1228 = float(_1194);
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = float(_1118);
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1204 + _1234;
    float _1238 = fma(_768, _964, _1174);
    float _1240 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1230);
    float _1242 = float(_1214);
    float _1244 = fma(_1152, _1190, _1138);
    float _1246 = float(_1068);
    float _1248 = _1198 * _860;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1240);
    float _1252 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1058);
    float _1254 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1090);
    float _1256 = _1228 * _1246;
    float _1258 = _1242 * _1232;
    float _1260 = _1226 * _860;
    float _1262 = -_1248;
    float _1264 = fma(_1226, _1170, _1262);
    float _1266 = _1256 * (-2.0);
    float _1268 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1098);
    float _1270 = fma(_1198, _1170, _1260);
    float _1272 = _1218 * _1218;
    float _1274 = fma(_1156, _1264, _1162);
    float _1276 = _1258 * (-2.0);
    bool _1278 = _1250 >= 0.0;
    float _1280 = fma(_1222, _1222, _1272);
    float _1282 = fma(_772, _890, _1238);
    float _1284 = fma(_1266, _1206, _1206);
    float _1286 = fma(_698, _1276, _698);
    float _1288 = fma(_1236, _1236, _1280);
    float _1290 = fma(_754, _852, _1282);
    float _1292 = fma(_624, _1266, _624);
    float _1294 = -_1150;
    float _1296 = fma(_1140, _1212, _1294);
    float _1298 = -_1164;
    float _1300 = fma(_1158, _1270, _1298);
    float _1302 = rsqrt(_1288);
    float _1304 = fma(_810, _850, _1290);
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1308 = _1210;
    if (_1278)
    {
        _1062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1310 = _1062;
    float _1312 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1314 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1316 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1318 = fma(_1276, _1208, _1208);
    float _1320 = _1296 + 0.5;
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1244 + 0.5;
    int _1330 = as_type<int>(_1310);
    if (_1278)
    {
        float _1332 = _1310 * 5.0;
        _1330 = as_type<int>(_1332);
    }
    int _1334 = _1330;
    float _1336 = _1274 + 0.5;
    float _1338 = _1300 + 0.5;
    float _1340 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1304);
    bool _1342 = !_462;
    int _1344 = _1342 ? 0 : 1;
    out.m_61.x = _1322;
    out.m_61.y = _1324;
    out.m_61.z = _1326;
    out.m_61.w = _1306;
    float _1346 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    float _1348 = _1218 * _1302;
    int _1350 = abs(_1344);
    if (_1278)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4218 = as_type<float>(_1334);
        out.gl_Position.z = _4218;
    }
    out.m_63.x = _1328;
    out.m_63.y = _1320;
    out.m_63.z = _1336;
    out.m_63.w = _1338;
    out.m_65.x = _1340;
    float _1352 = _1222 * _1302;
    if (_1278)
    {
        out.m_45.x = 0.0;
    }
    if (_1278)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1354 = -_1348;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1192);
    float _1358 = -_1352;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1362 = _1236 * _1302;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1356 + _1364;
    float _1368 = float(_1350);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1360 + _1370;
    float _1374 = -_1362;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1380 = float(_1108);
    float _1382 = -_1348;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1378);
    float _1392 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1318);
    float _1394 = _1368 * _1380;
    float _1396 = fma(_1292, _1168, _1346);
    float _1398 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1390);
    float _1400 = fma(_1286, _1168, _1392);
    float _1402 = _564 + (-1.0);
    float _1404 = _1394 * (-2.0);
    bool _1406 = _1398 >= 0.0;
    float _1408 = -_1352;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1412 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1414 = fma(_1404, _1210, _1210);
    float _1416 = _1396 * 0.15915493667125701904296875;
    float _1418 = _1400 * 0.15915493667125701904296875;
    float _1420 = fma(_1412, _1404, _1412);
    float _1422 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1414);
    float _1424 = _1416 * 6.283185482025146484375;
    float _1426 = sin(_1424);
    float _1428 = -_1362;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1236);
    float _1432 = fma(_1420, _1168, _1422);
    float _1434 = _1384 * _1384;
    if (_1406)
    {
        _1308 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1308;
    float _1438 = _1432 * 0.15915493667125701904296875;
    float _1440 = fma(_1410, _1410, _1434);
    float _1442 = _1416 * 6.283185482025146484375;
    float _1444 = cos(_1442);
    int _1446 = as_type<int>(_1436);
    if (_1406)
    {
        float _1448 = _1436 * 5.0;
        _1446 = as_type<int>(_1448);
    }
    int _1450 = _1446;
    if (_1406)
    {
        out.m_45.x = 0.0;
    }
    if (_1406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4415 = as_type<float>(_1450);
        out.gl_Position.z = _4415;
    }
    float _1452 = _1418 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1418 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = _1438 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    if (_1406)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1464 = -_1192;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = -_1184;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = -_1204;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = fma(_1430, _1430, _1440);
    float _1478 = _1466 * _1466;
    float _1480 = _1426 * _1454;
    float _1482 = _1444 * _1458;
    float _1484 = fma(_1470, _1470, _1478);
    float _1486 = sqrt(_1476);
    float _1488 = in.m_49.x;
    float _1490 = in.m_49.y;
    float _1492 = in.m_49.z;
    float _1494 = fma(_1462, _1482, _1480);
    float _1496 = fma(_1474, _1474, _1484);
    float _1498 = fma(_1462, _1480, _1482);
    float _1500 = rsqrt(_1496);
    float _1502 = _1302 * _1486;
    float _1504 = in.m_67.x;
    float _1506 = in.m_67.y;
    float _1508 = in.m_67.z;
    float _1510 = _1470 * _1500;
    float _1512 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1514 = _1474 * _1500;
    float _1516 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1520 = _1510 * _1518;
    float _1522 = _1466 * _1500;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1526 = _1514 * _1524;
    float _1528 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1532 = -_1520;
    float _1534 = fma(_1514, _1530, _1532);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1538 = _1522 * _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1542 = -_1526;
    float _1544 = fma(_1522, _1540, _1542);
    float _1546 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1548 = _1534 * _1534;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = -_1538;
    float _1554 = fma(_1510, _1550, _1552);
    float _1556 = _1438 * 6.283185482025146484375;
    float _1558 = cos(_1556);
    float _1560 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1562 = fma(_1544, _1544, _1548);
    float _1564 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1566 = _1560 * _1502;
    float _1568 = fma(_1554, _1554, _1562);
    float _1570 = _1546 * _1502;
    float _1572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1506);
    float _1574 = _1444 * _1454;
    float _1576 = _1426 * _1458;
    float _1578 = _1564 * _1502;
    float _1580 = rsqrt(_1568);
    float _1582 = _1566 * _1572;
    float _1584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1504);
    float _1586 = -_1574;
    float _1588 = fma(_1462, _1576, _1586);
    float _1590 = -_1576;
    float _1592 = fma(_1462, _1574, _1590);
    float _1594 = -_1582;
    float _1596 = _1462 * _1594;
    float _1598 = _1578 * _1584;
    float _1600 = _1458 * _1558;
    float _1602 = _1558 * _1582;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1606 = _1454 * _1558;
    float _1608 = fma(_1600, _1598, _1596);
    float _1610 = _1444 * _1602;
    float _1612 = _1570 * _1604;
    float _1614 = _1544 * _1580;
    float _1616 = fma(_1494, _1598, _1610);
    float _1618 = _1534 * _1580;
    float _1620 = _1426 * _1602;
    float _1622 = _1522 * _1614;
    float _1624 = fma(_1592, _1612, _1616);
    float _1626 = _1554 * _1580;
    float _1628 = _1514 * _1618;
    float _1630 = -_1622;
    float _1632 = fma(_1510, _1618, _1630);
    float _1634 = fma(_1588, _1598, _1620);
    float _1636 = fma(_1606, _1612, _1608);
    float _1638 = -_1628;
    float _1640 = fma(_1522, _1626, _1638);
    float _1642 = _1632 * _1624;
    float _1644 = fma(_1498, _1612, _1634);
    float _1646 = _1640 * _1624;
    float _1648 = fma(_1626, _1636, _1642);
    float _1650 = fma(_1614, _1636, _1646);
    float _1652 = fma(_1514, _1644, _1648);
    float _1654 = fma(_1510, _1644, _1650);
    float _1656 = _1204 + _1652;
    float _1658 = _1510 * _1626;
    float _1660 = _1184 + _1654;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1664 = _1656 + _1662;
    float _1666 = -_1658;
    float _1668 = fma(_1514, _1614, _1666);
    float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1672 = _1660 + _1670;
    float _1674 = _1664 * _1664;
    float _1676 = _1668 * _1624;
    float _1678 = fma(_1672, _1672, _1674);
    float _1680 = fma(_1618, _1636, _1676);
    float _1682 = sqrt(_1678);
    float _1684 = fma(_1522, _1644, _1680);
    float _1686 = _1192 + _1684;
    bool _1688 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1690 = _1514;
    float _1692 = _1674;
    float _1694 = _1636;
    float _1696 = _1682;
    float _1698 = _1522;
    float _1700 = _1598;
    if (!_1688)
    {
        _1690 = _1660;
    }
    float _1702 = _1690;
    float _1704 = _1702;
    if (!_1688)
    {
        _1692 = _1656;
    }
    float _1706 = _1692;
    float _1708 = _1706;
    if (!_1688)
    {
        _1694 = _1686;
    }
    float _1710 = _1694;
    bool _1712 = !_1688;
    float _1714 = _1710;
    if (!_1712)
    {
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1720 = _1682 + _1718;
        float _1722 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = rsqrt(_1678);
        float _1726 = _1720 * _1716;
        float _1728 = _1726 * 0.15915493667125701904296875;
        float _1730 = _1728 * 6.283185482025146484375;
        float _1732 = sin(_1730);
        float _1734 = _1728 * 6.283185482025146484375;
        float _1736 = cos(_1734);
        float _1738 = fma(_1732, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1740 = _1724 * _1738;
        float _1742 = _1736 + (-1.0);
        float _1744 = fma(_1672, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1746 = fma(_1664, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1748 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = fma(_1686, _1736, _1748);
        _1714 = _1750;
        _1704 = _1744;
        _1708 = _1746;
        _1696 = _1728;
        _1698 = _1724;
    }
    float _1752 = _1714;
    float _1754 = _1704;
    float _1756 = _1708;
    float _1758 = _1696;
    float _1760 = _1698;
    float _1762 = -_1348;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _1766 = -_1352;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1754);
    float _1770 = -_1362;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1776 = _1764 + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1780 = _1768 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1784 = _1772 + _1782;
    float _1786 = _1776 * _1776;
    float _1788 = fma(_1780, _1780, _1786);
    float _1790 = fma(_1784, _1784, _1788);
    float _1792 = rsqrt(_1790);
    float _1794 = sqrt(_1790);
    float _1796 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1798 = _1780 * _1796;
    float _1800 = _1784 * _1796;
    float _1802 = _1798 * _1798;
    float _1804 = _1800 * _1800;
    float _1806 = _1802 + _1804;
    float _1808 = sqrt(_1806);
    bool _1810 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1814 = _1808 + _1812;
    float _1816 = _1792;
    float _1818 = _1760;
    float _1820 = _1814;
    float _1822 = _1758;
    float _1824 = _1776;
    if (_1810)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1826;
    }
    float _1828 = _1816;
    if (_1810)
    {
        float _1830 = rsqrt(_1806);
        _1818 = _1830;
    }
    float _1832 = _1818;
    float _1834 = _1832;
    if (_1810)
    {
        float _1836 = _1814 * _1828;
        _1820 = _1836;
    }
    float _1838 = _1820;
    if (_1810)
    {
        float _1840 = _1838 * 0.15915493667125701904296875;
        _1822 = _1840;
    }
    float _1842 = _1822;
    float _1844 = _1784;
    float _1846 = _1842;
    if (_1810)
    {
        float _1848 = _1842 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        _1844 = _1850;
    }
    float _1852 = _1844;
    float _1854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1856 = precise::max(0.0, _1854);
    float _1858 = _1828;
    float _1860 = _1856;
    if (_1810)
    {
        float _1862 = _1842 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        _1858 = _1864;
    }
    float _1866 = _1858;
    float _1868 = -_1796;
    float _1870 = -_1856;
    float _1872 = fma(_1776, _1868, _1870);
    if (_1810)
    {
        float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1874;
    }
    float _1876 = _1824;
    float _1878 = _1852;
    float _1880 = _1876;
    if (_1810)
    {
        float _1882 = fma(_1852, _1876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1878 = _1882;
    }
    float _1884 = _1878;
    float _1886 = _1884;
    if (!_1810)
    {
        _1880 = _1802;
    }
    float _1888 = _1880;
    float _1890 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1892 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1894 = _1888;
    float _1896 = _1866;
    if (_1810)
    {
        float _1898 = _1866 + (-1.0);
        _1860 = _1898;
    }
    float _1900 = _1860;
    float _1902 = _1900;
    if (_1810)
    {
        float _1904 = _1832 * _1884;
        _1700 = _1904;
    }
    float _1906 = _1700;
    if (!_1810)
    {
        _1834 = _1798;
    }
    float _1908 = _1834;
    float _1910 = _1908;
    if (_1810)
    {
        float _1912 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1912;
    }
    float _1914 = _1846;
    if (_1810)
    {
        float _1916 = _1798 * _1906;
        _1910 = _1916;
    }
    float _1918 = _1910;
    if (!_1810)
    {
        _1886 = _1872;
    }
    float _1920 = _1886;
    float _1922 = _1920;
    if (!_1810)
    {
        _1902 = _1800;
    }
    float _1924 = _1902;
    float _1926 = _1924;
    if (_1810)
    {
        float _1928 = fma(_1872, _1866, _1914);
        _1922 = _1928;
    }
    float _1930 = _1922;
    if (_1810)
    {
        float _1932 = _1800 * _1906;
        _1926 = _1932;
    }
    float _1934 = _1926;
    if (_1810)
    {
        float _1936 = _1918 * _1918;
        _1894 = _1936;
    }
    float _1938 = _1894;
    if (!_1810)
    {
        _1896 = _1804;
    }
    float _1940 = _1896;
    float _1942 = _1940;
    if (_1810)
    {
        float _1944 = _1934 * _1934;
        _1942 = _1944;
    }
    float _1946 = _1942;
    float _1948 = fma(_1930, _1930, _1938);
    float _1950 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1952 = _1948 + _1946;
    float _1954 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1950);
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1958 = fma(_1794, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1956);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = rsqrt(_1952);
    float _1964 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1954);
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1974 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1978 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1892);
    float _1980 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1972);
    float _1982 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1974);
    float _1984 = abs(_1970);
    float _1986 = log2(_1984);
    float _1988 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1978);
    float _1990 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1980);
    float _1992 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1994 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1996 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1998 = _1962 * _1918;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2002 = _1962 * _1930;
    float _2004 = _1962 * _1934;
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2000);
    float _2010 = -_1994;
    float _2012 = fma(_2010, _1890, 1.0);
    float _2014 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = -_2006;
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2016);
    float _2020 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2022 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2024 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2026 = -_2004;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2018);
    float _2030 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2020);
    float _2032 = log2(_2012);
    float _2034 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2036 = fma(_2028, -0.5, 0.5);
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2024);
    float _2040 = fma(_2028, 0.5, 0.5);
    float _2042 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2034);
    float _2044 = _2002 + 1.0;
    float _2046 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2048 = exp2(_2022);
    float _2050 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2042);
    float _2052 = fma(_2040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2054 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2046);
    float _2056 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2050);
    float _2058 = fma(_2040, _2052, -0.212114393711090087890625);
    float _2060 = 1.0 / _2030;
    float _2062 = _2032 * 0.693147182464599609375;
    float _2064 = fma(_2040, _2058, 1.570728778839111328125);
    float _2066 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2068 = sqrt(_2036);
    float _2070 = -_2002;
    float _2072 = fma(_2048, _2044, _2070);
    float _2074 = fma(_2072, 0.5, 0.5);
    float _2076 = _2056 * _2060;
    float _2078 = _2054 * _2060;
    float _2080 = fma(_2076, 0.5, 0.5);
    float _2082 = fma(_2078, -0.5, 0.5);
    float _2084 = _2068 * 0.636619746685028076171875;
    float3 _5430 = float3(_2080, _2082, _2066);
    float _2086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5430, float3(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5430, float3(0.0), isnan(_5430)), level(0.0)).x;
    float3 _5441 = float3(_2080, _2082, _2066);
    float4 _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5441, float3(0.0), isnan(_5441)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5441, float3(0.0), isnan(_5441)), level(0.0)).xyzw;
    float _2091 = _2089.x;
    float _2093 = _2089.y;
    float _2095 = _2089.z;
    float _2097 = _2089.w;
    float _2099 = -_2064;
    float _2101 = fma(_2084, _2099, 1.0);
    float2 _5463 = float2(_2101, _2074);
    float3 _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5463, float2(0.0), isnan(_5463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5463, float2(0.0), isnan(_5463)), level(0.0)).xyz;
    float _2107 = _2105.x;
    float _2109 = _2105.y;
    float _2111 = _2105.z;
    float _2113 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2115 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2117 = _2056 + _2030;
    float _2119 = _2030 * 0.5;
    float _2121 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2115);
    float _2123 = exp2(_2113);
    float _2125 = _2117 * 0.5;
    float _2127 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2121);
    float _2129 = fma(_2054, -0.5, _2119);
    float _2131 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2133 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = _2131 + _2030;
    out.gl_Position.x = _2056;
    out.gl_Position.y = _2054;
    out.gl_Position.z = _2131;
    out.gl_Position.w = _2030;
    float _2137 = _2135 * 0.5;
    float _2139 = -_2123;
    float _2141 = _2139 + 1.0;
    out.m_45.x = _2133;
    float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _2125;
    out.m_69.y = _2129;
    out.m_69.z = _2137;
    out.m_69.w = _2030;
    float _2145 = _2143 * _2086;
    float _2147 = -_2143;
    float _2149 = _2147 + 1.0;
    float _2151 = _2097 * _2145;
    float _2153 = _2097 * _2149;
    float _2155 = _2111 * _2145;
    float _2157 = fma(_2107, _2151, _2091);
    float _2159 = fma(_2109, _2151, _2093);
    float _2161 = fma(_2097, _2155, _2095);
    out.m_71.x = _2157;
    out.m_71.y = _2159;
    out.m_71.z = _2161;
    out.m_71.w = _2153;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2218 = as_type<float>(_106);
        out.gl_Position.z = _2218;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2288 = as_type<float>(_144);
        out.gl_Position.z = _2288;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
    float _292;
    float _294;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = float(_90);
        float _276 = 1.0 / _274;
        float _278 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = _124 * _276;
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _272;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = _280;
        _296 = true;
    }
    else
    {
        float _298 = float(_90);
        float _300 = 1.0 / _298;
        float _302 = _124 * _300;
        _292 = _302;
        _294 = _302;
    }
    _296 = false;
    float _304 = _292;
    float _306 = _294;
    float _308 = in.m_53.x;
    float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _314 = _312 != 0;
    float _316 = in.m_51.x;
    float _318 = in.m_51.y;
    float _320 = in.m_51.z;
    float _322 = in.m_51.w;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _326 = _324 != 0;
    float _328 = in.m_53.y;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _332 = _330 != 0;
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _336 = _334 != 0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _338;
    float _342 = _260;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _346 = _328;
    if (_314)
    {
        float _348 = in.m_51.x;
        _342 = _348;
    }
    float _350 = _342;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _356 = _256;
    if (_326)
    {
        float _358 = in.m_51.z;
        _356 = _358;
    }
    float _360 = _356;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _364 = _362 != 0;
    float _366 = _308;
    if (_314)
    {
        float _368 = -_308;
        float _370 = _368 + 1.0;
        _344 = as_type<int>(_370);
    }
    int _372 = _344;
    float _374 = 0.0;
    int _376 = _372;
    if (!_314)
    {
        _374 = _308;
    }
    float _378 = _374;
    float _380 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _382 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _384 = _322 > 0.5;
    float _386 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _380);
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _392 = _318 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _398 = 1.0 / _354;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _404 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _406 = fma(_392, -2.0, _390);
    float _408 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _388);
    float _410 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _412 = false;
    float _414 = _378;
    if (_314)
    {
        bool _416 = _350 > 0.5;
        _412 = _416;
    }
    bool _418 = _412;
    float _420 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _422 = 1.0 / _396;
    bool _424 = _418;
    if (_314)
    {
        float _426 = _418 ? as_type<float>(_372) : _308;
        _414 = _426;
    }
    float _428 = _414;
    if (_326)
    {
        float _430 = -_308;
        float _432 = _430 + 1.0;
        _376 = as_type<int>(_432);
    }
    int _434 = _376;
    if (_326)
    {
        bool _436 = _360 > 0.5;
        _424 = _436;
    }
    bool _438 = _424;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    if (_326)
    {
        float _446 = _438 ? as_type<float>(_434) : _308;
        _366 = _446;
    }
    float _448 = _366;
    float _450 = 1.0 / _402;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _462 = _460 != 0;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _466 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _480 = 1.0 / _340;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _484 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _490 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    float _492 = 1.0 / _478;
    float _494 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_57.x = _484;
    out.m_57.y = _466;
    out.m_57.z = _468;
    out.m_57.w = _482;
    float _498 = _320 * 2.0;
    float _500 = _316 * 2.0;
    float _502 = -_496;
    float _504 = fma(_410, 2.0, _502);
    float _506 = 1.0 / _444;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _510 = _304 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _304 + _516;
    float _520 = _318 * 2.0;
    float _522 = _510 * _398;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _524;
    float _528 = _518 * _480;
    float _530 = 1.0 / _474;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _540 = -_328;
    float _542 = _540 + 1.0;
    float _544 = 0.0;
    if (!_364)
    {
        _544 = _316;
    }
    float _546 = _544;
    float _548 = _538 * _422;
    float _550 = _526 * _450;
    float _552 = 1.0 / _488;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _560 = _534 * _506;
    float _562 = _318 + _320;
    float _564 = _316 + _320;
    float _566 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[79].z, _558);
    float _568 = floor(_498);
    float _570 = _556 * _530;
    float _572 = _320 + (-0.5);
    float _574 = 0.0;
    float _576 = _546;
    if (!_364)
    {
        _574 = _320;
    }
    float _578 = _574;
    float _580 = _562 + (-1.0);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _590 = floor(_500);
    float _592 = _578;
    if (_364)
    {
        _576 = _320;
    }
    float _594 = _576;
    float _596 = _584 * _492;
    float _598 = _318 + _316;
    float _600 = _588 * _552;
    float _602 = 0.0;
    if (!_364)
    {
        _602 = _320;
    }
    float _604 = _602;
    float _606 = 1.0 / _514;
    int _608 = _384 ? as_type<int>(_542) : as_type<int>(_328);
    float _610 = _598 + (-1.0);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _614 = _318 > 0.5;
    float _616 = floor(_520);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _618;
    float _622 = _332 ? as_type<float>(_608) : _328;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _626 = _604;
    if (_336)
    {
        float _628 = _614 ? _542 : _328;
        _346 = _628;
    }
    float _630 = _346;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _634 = _568 >= 0.0;
    bool _636 = isnan(_568);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].z, _612);
    float _646 = _620 * _606;
    float _648 = _316 + (-0.5);
    bool _650 = _590 >= 0.0;
    bool _652 = isnan(_590);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _318 + (-0.5);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _662;
    float _666 = 0.0;
    if (!_364)
    {
        _666 = _318;
    }
    float _668 = _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = 0.0;
    float _676 = _668;
    if (!_364)
    {
        _674 = _318;
    }
    float _678 = _674;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _680;
    float _684 = fma(_664, _528, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _686 = _678;
    if (_364)
    {
        _676 = _316;
    }
    float _688 = _676;
    float _690 = fma(_672, _522, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    if (_364)
    {
        _686 = _316;
    }
    float _692 = _686;
    float _694 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[78].w, _632);
    if (_364)
    {
        _592 = _318;
    }
    float _696 = _592;
    float _698 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_364)
    {
        _626 = _318;
    }
    float _700 = _626;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _702;
    int _706 = _642 ? 0 : 1;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _710 = _306 + _708;
    int _712 = _658 ? 0 : 1;
    float _714 = fma(_704, _528, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _716 = _616 > 0.0;
    float _718 = fma(_682, _528, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _720 = _616 >= 0.0;
    bool _722 = isnan(_616);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _732 = _306 + _730;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _736 = _568 > 0.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _740 = _306 + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _744 = _306 + _742;
    float _746 = fma(_560, _732, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _752 = fma(_548, _740, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _754 = fma(_600, _744, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _758 = _306 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _762 = _306 + _760;
    bool _764 = _590 > 0.0;
    float _766 = fma(_550, _710, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _768 = fma(_570, _758, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _770 = fma(_750, _522, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _772 = fma(_596, _762, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _776 = _306 + _774;
    bool _778 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _780 = isnan(_306);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = _734 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _798 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _800 = isnan(_306);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = fma(_646, _776, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _812 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[84].z, _790);
    float _814 = fma(_794, _522, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _816 = -_788;
    float _818 = _816 + 1.0;
    bool _820 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _822 = isnan(_306);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -_808;
    float _834 = _832 + 1.0;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _838 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _840 = isnan(_306);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = _808 * _818;
    float _852 = _830 * _834;
    float _854 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    float _856 = -_830;
    float _858 = _856 + 1.0;
    float _860 = fma(_622, _796, -0.5);
    bool _862 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _864 = isnan(_306);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_848;
    float _876 = _874 + 1.0;
    bool _878 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _880 = isnan(_304);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = _848 * _858;
    bool _892 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _894 = isnan(_304);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _696 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _906 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _908 = isnan(_304);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = _688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _920 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _922 = isnan(_306);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_902;
    float _934 = _932 + 1.0;
    bool _936 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _938 = isnan(_306);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -_916;
    float _950 = _948 + 1.0;
    bool _952 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _954 = isnan(_306);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _872 * _876;
    float _966 = -_872;
    float _968 = _966 + 1.0;
    float _970 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _972 = log2(_970);
    float _974 = -_962;
    float _976 = _974 + 1.0;
    float _978 = _962 * _968;
    float _980 = _902 * _950;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _984 = -_946;
    float _986 = _984 + 1.0;
    float _988 = _888 * _934;
    float _990 = _946 * _976;
    float _992 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].w, _982);
    float _994 = _930 * _986;
    float _996 = _684 * _988;
    float _998 = _714 * _988;
    float _1000 = _718 * _988;
    float _1002 = _310 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1006 = fma(_1002, _630, -0.5);
    float _1008 = _972 * _124;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1012 = _746 * _994;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1016 = -_888;
    float _1018 = _1016 + 1.0;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1022 = -_930;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_904, -2.0, _1014);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].x, _996);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    float _1034 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[79].x, _566);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].y, _998);
    float _1038 = -_1010;
    float _1040 = fma(_918, 2.0, _1038);
    float _1042 = exp2(_1008);
    float _1044 = _1034 * (-0.15915493667125701904296875);
    float _1046 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1000);
    int _1048 = _728 ? 0 : 1;
    float _1050 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1012);
    int _1052 = ~_706;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = fma(_690, _980, _1028);
    int _1060 = _1056;
    float _1062 = _850;
    if (!_736)
    {
        int _1064 = ~_706;
        int _1066 = _1064 + 1;
        _1060 = _1066;
    }
    int _1068 = _1060;
    float _1070 = 1.0 / _1032;
    bool _1072 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1074 = isnan(1.0);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1080 = _1076 || _1078;
    float _1082 = fma(_752, _990, _1050);
    int _1084 = ~_1048;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = fma(_770, _980, _1036);
    int _1092 = ~_712;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    float _1098 = fma(_814, _980, _1046);
    int _1100 = _1088;
    int _1102 = _1096;
    if (!_716)
    {
        int _1104 = ~_1048;
        int _1106 = _1104 + 1;
        _1100 = _1106;
    }
    int _1108 = _1100;
    float _1110 = _1044 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    if (!_764)
    {
        int _1114 = ~_712;
        int _1116 = _1114 + 1;
        _1102 = _1116;
    }
    int _1118 = _1102;
    float _1120 = -_1042;
    float _1122 = _1120 + 1.0;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1136 = -_124;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[76].x, _504);
    float _1140 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _1142 = _1132 ? _1122 : 0.0;
    float _1144 = _1044 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1150 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _406);
    float _1152 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _644);
    float _1154 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[84].x, _812);
    float _1156 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _854);
    float _1158 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _992);
    float _1160 = -_124;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1040);
    float _1164 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1026);
    if (_1080)
    {
        float _1166 = _1142 * _1070;
        _126 = _1166;
    }
    float _1168 = _126;
    float _1170 = fma(_1148, _448, -0.5);
    float _1172 = fma(_1134, _428, -0.5);
    float _1174 = fma(_766, _978, _1082);
    float _1176 = _1112 * _1006;
    bool _1178 = !_454;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _1154 * (-0.15915493667125701904296875);
    float _1184 = _408 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1186 = _1146 * _1006;
    float _1188 = -_1176;
    float _1190 = fma(_1146, _1172, _1188);
    float _1192 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1194 = abs(_1180);
    float _1196 = _1182 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    bool _1200 = !_458;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = in.m_59.x;
    float _1208 = in.m_59.y;
    float _1210 = in.m_59.z;
    float _1212 = fma(_1112, _1172, _1186);
    int _1214 = abs(_1202);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1192 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1184 + _1220;
    float _1224 = _1182 * 6.283185482025146484375;
    float _1226 = cos(_1224);
    float _1228 = float(_1194);
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = float(_1118);
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1204 + _1234;
    float _1238 = fma(_768, _964, _1174);
    float _1240 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1230);
    float _1242 = float(_1214);
    float _1244 = fma(_1152, _1190, _1138);
    float _1246 = float(_1068);
    float _1248 = _1198 * _860;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1240);
    float _1252 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1058);
    float _1254 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1090);
    float _1256 = _1228 * _1246;
    float _1258 = _1242 * _1232;
    float _1260 = _1226 * _860;
    float _1262 = -_1248;
    float _1264 = fma(_1226, _1170, _1262);
    float _1266 = _1256 * (-2.0);
    float _1268 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1098);
    float _1270 = fma(_1198, _1170, _1260);
    float _1272 = _1218 * _1218;
    float _1274 = fma(_1156, _1264, _1162);
    float _1276 = _1258 * (-2.0);
    bool _1278 = _1250 >= 0.0;
    float _1280 = fma(_1222, _1222, _1272);
    float _1282 = fma(_772, _890, _1238);
    float _1284 = fma(_1266, _1206, _1206);
    float _1286 = fma(_698, _1276, _698);
    float _1288 = fma(_1236, _1236, _1280);
    float _1290 = fma(_754, _852, _1282);
    float _1292 = fma(_624, _1266, _624);
    float _1294 = -_1150;
    float _1296 = fma(_1140, _1212, _1294);
    float _1298 = -_1164;
    float _1300 = fma(_1158, _1270, _1298);
    float _1302 = rsqrt(_1288);
    float _1304 = fma(_810, _850, _1290);
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1308 = _1210;
    if (_1278)
    {
        _1062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1310 = _1062;
    float _1312 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1314 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1316 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1318 = fma(_1276, _1208, _1208);
    float _1320 = _1296 + 0.5;
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1244 + 0.5;
    int _1330 = as_type<int>(_1310);
    if (_1278)
    {
        float _1332 = _1310 * 5.0;
        _1330 = as_type<int>(_1332);
    }
    int _1334 = _1330;
    float _1336 = _1274 + 0.5;
    float _1338 = _1300 + 0.5;
    float _1340 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1304);
    bool _1342 = !_462;
    int _1344 = _1342 ? 0 : 1;
    out.m_61.x = _1322;
    out.m_61.y = _1324;
    out.m_61.z = _1326;
    out.m_61.w = _1306;
    float _1346 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    float _1348 = _1218 * _1302;
    int _1350 = abs(_1344);
    if (_1278)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4218 = as_type<float>(_1334);
        out.gl_Position.z = _4218;
    }
    out.m_63.x = _1328;
    out.m_63.y = _1320;
    out.m_63.z = _1336;
    out.m_63.w = _1338;
    out.m_65.x = _1340;
    float _1352 = _1222 * _1302;
    if (_1278)
    {
        out.m_45.x = 0.0;
    }
    if (_1278)
    {
        return out;
    }
    float _1354 = -_1348;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1192);
    float _1358 = -_1352;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1362 = _1236 * _1302;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1356 + _1364;
    float _1368 = float(_1350);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1360 + _1370;
    float _1374 = -_1362;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1380 = float(_1108);
    float _1382 = -_1348;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1378);
    float _1392 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1318);
    float _1394 = _1368 * _1380;
    float _1396 = fma(_1292, _1168, _1346);
    float _1398 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1390);
    float _1400 = fma(_1286, _1168, _1392);
    float _1402 = _564 + (-1.0);
    float _1404 = _1394 * (-2.0);
    bool _1406 = _1398 >= 0.0;
    float _1408 = -_1352;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1412 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1414 = fma(_1404, _1210, _1210);
    float _1416 = _1396 * 0.15915493667125701904296875;
    float _1418 = _1400 * 0.15915493667125701904296875;
    float _1420 = fma(_1412, _1404, _1412);
    float _1422 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1414);
    float _1424 = _1416 * 6.283185482025146484375;
    float _1426 = sin(_1424);
    float _1428 = -_1362;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1236);
    float _1432 = fma(_1420, _1168, _1422);
    float _1434 = _1384 * _1384;
    if (_1406)
    {
        _1308 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1308;
    float _1438 = _1432 * 0.15915493667125701904296875;
    float _1440 = fma(_1410, _1410, _1434);
    float _1442 = _1416 * 6.283185482025146484375;
    float _1444 = cos(_1442);
    int _1446 = as_type<int>(_1436);
    if (_1406)
    {
        float _1448 = _1436 * 5.0;
        _1446 = as_type<int>(_1448);
    }
    int _1450 = _1446;
    if (_1406)
    {
        out.m_45.x = 0.0;
    }
    if (_1406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4415 = as_type<float>(_1450);
        out.gl_Position.z = _4415;
    }
    float _1452 = _1418 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1418 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = _1438 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    if (_1406)
    {
        return out;
    }
    float _1464 = -_1192;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = -_1184;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = -_1204;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = fma(_1430, _1430, _1440);
    float _1478 = _1466 * _1466;
    float _1480 = _1426 * _1454;
    float _1482 = _1444 * _1458;
    float _1484 = fma(_1470, _1470, _1478);
    float _1486 = sqrt(_1476);
    float _1488 = in.m_49.x;
    float _1490 = in.m_49.y;
    float _1492 = in.m_49.z;
    float _1494 = fma(_1462, _1482, _1480);
    float _1496 = fma(_1474, _1474, _1484);
    float _1498 = fma(_1462, _1480, _1482);
    float _1500 = rsqrt(_1496);
    float _1502 = _1302 * _1486;
    float _1504 = in.m_67.x;
    float _1506 = in.m_67.y;
    float _1508 = in.m_67.z;
    float _1510 = _1470 * _1500;
    float _1512 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1514 = _1474 * _1500;
    float _1516 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1520 = _1510 * _1518;
    float _1522 = _1466 * _1500;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1526 = _1514 * _1524;
    float _1528 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1532 = -_1520;
    float _1534 = fma(_1514, _1530, _1532);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1538 = _1522 * _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1542 = -_1526;
    float _1544 = fma(_1522, _1540, _1542);
    float _1546 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1548 = _1534 * _1534;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = -_1538;
    float _1554 = fma(_1510, _1550, _1552);
    float _1556 = _1438 * 6.283185482025146484375;
    float _1558 = cos(_1556);
    float _1560 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1562 = fma(_1544, _1544, _1548);
    float _1564 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1566 = _1560 * _1502;
    float _1568 = fma(_1554, _1554, _1562);
    float _1570 = _1546 * _1502;
    float _1572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1506);
    float _1574 = _1444 * _1454;
    float _1576 = _1426 * _1458;
    float _1578 = _1564 * _1502;
    float _1580 = rsqrt(_1568);
    float _1582 = _1566 * _1572;
    float _1584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1504);
    float _1586 = -_1574;
    float _1588 = fma(_1462, _1576, _1586);
    float _1590 = -_1576;
    float _1592 = fma(_1462, _1574, _1590);
    float _1594 = -_1582;
    float _1596 = _1462 * _1594;
    float _1598 = _1578 * _1584;
    float _1600 = _1458 * _1558;
    float _1602 = _1558 * _1582;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1606 = _1454 * _1558;
    float _1608 = fma(_1600, _1598, _1596);
    float _1610 = _1444 * _1602;
    float _1612 = _1570 * _1604;
    float _1614 = _1544 * _1580;
    float _1616 = fma(_1494, _1598, _1610);
    float _1618 = _1534 * _1580;
    float _1620 = _1426 * _1602;
    float _1622 = _1522 * _1614;
    float _1624 = fma(_1592, _1612, _1616);
    float _1626 = _1554 * _1580;
    float _1628 = _1514 * _1618;
    float _1630 = -_1622;
    float _1632 = fma(_1510, _1618, _1630);
    float _1634 = fma(_1588, _1598, _1620);
    float _1636 = fma(_1606, _1612, _1608);
    float _1638 = -_1628;
    float _1640 = fma(_1522, _1626, _1638);
    float _1642 = _1632 * _1624;
    float _1644 = fma(_1498, _1612, _1634);
    float _1646 = _1640 * _1624;
    float _1648 = fma(_1626, _1636, _1642);
    float _1650 = fma(_1614, _1636, _1646);
    float _1652 = fma(_1514, _1644, _1648);
    float _1654 = fma(_1510, _1644, _1650);
    float _1656 = _1204 + _1652;
    float _1658 = _1510 * _1626;
    float _1660 = _1184 + _1654;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1664 = _1656 + _1662;
    float _1666 = -_1658;
    float _1668 = fma(_1514, _1614, _1666);
    float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1672 = _1660 + _1670;
    float _1674 = _1664 * _1664;
    float _1676 = _1668 * _1624;
    float _1678 = fma(_1672, _1672, _1674);
    float _1680 = fma(_1618, _1636, _1676);
    float _1682 = sqrt(_1678);
    float _1684 = fma(_1522, _1644, _1680);
    float _1686 = _1192 + _1684;
    bool _1688 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1690 = _1514;
    float _1692 = _1674;
    float _1694 = _1636;
    float _1696 = _1682;
    float _1698 = _1522;
    float _1700 = _1598;
    if (!_1688)
    {
        _1690 = _1660;
    }
    float _1702 = _1690;
    float _1704 = _1702;
    if (!_1688)
    {
        _1692 = _1656;
    }
    float _1706 = _1692;
    float _1708 = _1706;
    if (!_1688)
    {
        _1694 = _1686;
    }
    float _1710 = _1694;
    bool _1712 = !_1688;
    float _1714 = _1710;
    if (!_1712)
    {
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1720 = _1682 + _1718;
        float _1722 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = rsqrt(_1678);
        float _1726 = _1720 * _1716;
        float _1728 = _1726 * 0.15915493667125701904296875;
        float _1730 = _1728 * 6.283185482025146484375;
        float _1732 = sin(_1730);
        float _1734 = _1728 * 6.283185482025146484375;
        float _1736 = cos(_1734);
        float _1738 = fma(_1732, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1740 = _1724 * _1738;
        float _1742 = _1736 + (-1.0);
        float _1744 = fma(_1672, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1746 = fma(_1664, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1748 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = fma(_1686, _1736, _1748);
        _1714 = _1750;
        _1704 = _1744;
        _1708 = _1746;
        _1696 = _1728;
        _1698 = _1724;
    }
    float _1752 = _1714;
    float _1754 = _1704;
    float _1756 = _1708;
    float _1758 = _1696;
    float _1760 = _1698;
    float _1762 = -_1348;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _1766 = -_1352;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1754);
    float _1770 = -_1362;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1776 = _1764 + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1780 = _1768 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1784 = _1772 + _1782;
    float _1786 = _1776 * _1776;
    float _1788 = fma(_1780, _1780, _1786);
    float _1790 = fma(_1784, _1784, _1788);
    float _1792 = rsqrt(_1790);
    float _1794 = sqrt(_1790);
    float _1796 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1798 = _1780 * _1796;
    float _1800 = _1784 * _1796;
    float _1802 = _1798 * _1798;
    float _1804 = _1800 * _1800;
    float _1806 = _1802 + _1804;
    float _1808 = sqrt(_1806);
    bool _1810 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1814 = _1808 + _1812;
    float _1816 = _1792;
    float _1818 = _1760;
    float _1820 = _1814;
    float _1822 = _1758;
    float _1824 = _1776;
    if (_1810)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1826;
    }
    float _1828 = _1816;
    if (_1810)
    {
        float _1830 = rsqrt(_1806);
        _1818 = _1830;
    }
    float _1832 = _1818;
    float _1834 = _1832;
    if (_1810)
    {
        float _1836 = _1814 * _1828;
        _1820 = _1836;
    }
    float _1838 = _1820;
    if (_1810)
    {
        float _1840 = _1838 * 0.15915493667125701904296875;
        _1822 = _1840;
    }
    float _1842 = _1822;
    float _1844 = _1784;
    float _1846 = _1842;
    if (_1810)
    {
        float _1848 = _1842 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        _1844 = _1850;
    }
    float _1852 = _1844;
    float _1854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1856 = precise::max(0.0, _1854);
    float _1858 = _1828;
    float _1860 = _1856;
    if (_1810)
    {
        float _1862 = _1842 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        _1858 = _1864;
    }
    float _1866 = _1858;
    float _1868 = -_1796;
    float _1870 = -_1856;
    float _1872 = fma(_1776, _1868, _1870);
    if (_1810)
    {
        float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1874;
    }
    float _1876 = _1824;
    float _1878 = _1852;
    float _1880 = _1876;
    if (_1810)
    {
        float _1882 = fma(_1852, _1876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1878 = _1882;
    }
    float _1884 = _1878;
    float _1886 = _1884;
    if (!_1810)
    {
        _1880 = _1802;
    }
    float _1888 = _1880;
    float _1890 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1892 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1894 = _1888;
    float _1896 = _1866;
    if (_1810)
    {
        float _1898 = _1866 + (-1.0);
        _1860 = _1898;
    }
    float _1900 = _1860;
    float _1902 = _1900;
    if (_1810)
    {
        float _1904 = _1832 * _1884;
        _1700 = _1904;
    }
    float _1906 = _1700;
    if (!_1810)
    {
        _1834 = _1798;
    }
    float _1908 = _1834;
    float _1910 = _1908;
    if (_1810)
    {
        float _1912 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1912;
    }
    float _1914 = _1846;
    if (_1810)
    {
        float _1916 = _1798 * _1906;
        _1910 = _1916;
    }
    float _1918 = _1910;
    if (!_1810)
    {
        _1886 = _1872;
    }
    float _1920 = _1886;
    float _1922 = _1920;
    if (!_1810)
    {
        _1902 = _1800;
    }
    float _1924 = _1902;
    float _1926 = _1924;
    if (_1810)
    {
        float _1928 = fma(_1872, _1866, _1914);
        _1922 = _1928;
    }
    float _1930 = _1922;
    if (_1810)
    {
        float _1932 = _1800 * _1906;
        _1926 = _1932;
    }
    float _1934 = _1926;
    if (_1810)
    {
        float _1936 = _1918 * _1918;
        _1894 = _1936;
    }
    float _1938 = _1894;
    if (!_1810)
    {
        _1896 = _1804;
    }
    float _1940 = _1896;
    float _1942 = _1940;
    if (_1810)
    {
        float _1944 = _1934 * _1934;
        _1942 = _1944;
    }
    float _1946 = _1942;
    float _1948 = fma(_1930, _1930, _1938);
    float _1950 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1952 = _1948 + _1946;
    float _1954 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1950);
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1958 = fma(_1794, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1956);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = rsqrt(_1952);
    float _1964 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1954);
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1974 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1978 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1892);
    float _1980 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1972);
    float _1982 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1974);
    float _1984 = abs(_1970);
    float _1986 = log2(_1984);
    float _1988 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1978);
    float _1990 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1980);
    float _1992 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1994 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1996 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1998 = _1962 * _1918;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2002 = _1962 * _1930;
    float _2004 = _1962 * _1934;
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2000);
    float _2010 = -_1994;
    float _2012 = fma(_2010, _1890, 1.0);
    float _2014 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = -_2006;
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2016);
    float _2020 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2022 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2024 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2026 = -_2004;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2018);
    float _2030 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2020);
    float _2032 = log2(_2012);
    float _2034 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2036 = fma(_2028, -0.5, 0.5);
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2024);
    float _2040 = fma(_2028, 0.5, 0.5);
    float _2042 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2034);
    float _2044 = _2002 + 1.0;
    float _2046 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2048 = exp2(_2022);
    float _2050 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2042);
    float _2052 = fma(_2040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2054 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2046);
    float _2056 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2050);
    float _2058 = fma(_2040, _2052, -0.212114393711090087890625);
    float _2060 = 1.0 / _2030;
    float _2062 = _2032 * 0.693147182464599609375;
    float _2064 = fma(_2040, _2058, 1.570728778839111328125);
    float _2066 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2068 = sqrt(_2036);
    float _2070 = -_2002;
    float _2072 = fma(_2048, _2044, _2070);
    float _2074 = fma(_2072, 0.5, 0.5);
    float _2076 = _2056 * _2060;
    float _2078 = _2054 * _2060;
    float _2080 = fma(_2076, 0.5, 0.5);
    float _2082 = fma(_2078, -0.5, 0.5);
    float _2084 = _2068 * 0.636619746685028076171875;
    float3 _5430 = float3(_2080, _2082, _2066);
    float _2086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5430, float3(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5430, float3(0.0), isnan(_5430)), level(0.0)).x;
    float3 _5441 = float3(_2080, _2082, _2066);
    float4 _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5441, float3(0.0), isnan(_5441)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5441, float3(0.0), isnan(_5441)), level(0.0)).xyzw;
    float _2091 = _2089.x;
    float _2093 = _2089.y;
    float _2095 = _2089.z;
    float _2097 = _2089.w;
    float _2099 = -_2064;
    float _2101 = fma(_2084, _2099, 1.0);
    float2 _5463 = float2(_2101, _2074);
    float3 _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5463, float2(0.0), isnan(_5463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5463, float2(0.0), isnan(_5463)), level(0.0)).xyz;
    float _2107 = _2105.x;
    float _2109 = _2105.y;
    float _2111 = _2105.z;
    float _2113 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2115 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2117 = _2056 + _2030;
    float _2119 = _2030 * 0.5;
    float _2121 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2115);
    float _2123 = exp2(_2113);
    float _2125 = _2117 * 0.5;
    float _2127 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2121);
    float _2129 = fma(_2054, -0.5, _2119);
    float _2131 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2133 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = _2131 + _2030;
    out.gl_Position.x = _2056;
    out.gl_Position.y = _2054;
    out.gl_Position.z = _2131;
    out.gl_Position.w = _2030;
    float _2137 = _2135 * 0.5;
    float _2139 = -_2123;
    float _2141 = _2139 + 1.0;
    out.m_45.x = _2133;
    float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _2125;
    out.m_69.y = _2129;
    out.m_69.z = _2137;
    out.m_69.w = _2030;
    float _2145 = _2143 * _2086;
    float _2147 = -_2143;
    float _2149 = _2147 + 1.0;
    float _2151 = _2097 * _2145;
    float _2153 = _2097 * _2149;
    float _2155 = _2111 * _2145;
    float _2157 = fma(_2107, _2151, _2091);
    float _2159 = fma(_2109, _2151, _2093);
    float _2161 = fma(_2097, _2155, _2095);
    out.m_71.x = _2157;
    out.m_71.y = _2159;
    out.m_71.z = _2161;
    out.m_71.w = _2153;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2218 = as_type<float>(_106);
        out.gl_Position.z = _2218;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2288 = as_type<float>(_144);
        out.gl_Position.z = _2288;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
    float _292;
    float _294;
    if (!_268)
    {
        float _270 = in.m_51.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _274 = float(_90);
        float _276 = 1.0 / _274;
        float _278 = _270 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = _124 * _276;
        float _282 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _284 = _282 * _272;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = _280;
        _296 = true;
    }
    else
    {
        float _298 = float(_90);
        float _300 = 1.0 / _298;
        float _302 = _124 * _300;
        _292 = _302;
        _294 = _302;
    }
    _296 = false;
    float _304 = _292;
    float _306 = _294;
    float _308 = in.m_53.x;
    float _310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _314 = _312 != 0;
    float _316 = in.m_51.x;
    float _318 = in.m_51.y;
    float _320 = in.m_51.z;
    float _322 = in.m_51.w;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _326 = _324 != 0;
    float _328 = in.m_53.y;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _332 = _330 != 0;
    out.m_55.x = 1.0;
    out.m_55.y = 1.0;
    out.m_55.z = 1.0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _336 = _334 != 0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _338;
    float _342 = _260;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _346 = _328;
    if (_314)
    {
        float _348 = in.m_51.x;
        _342 = _348;
    }
    float _350 = _342;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _356 = _256;
    if (_326)
    {
        float _358 = in.m_51.z;
        _356 = _358;
    }
    float _360 = _356;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _364 = _362 != 0;
    float _366 = _308;
    if (_314)
    {
        float _368 = -_308;
        float _370 = _368 + 1.0;
        _344 = as_type<int>(_370);
    }
    int _372 = _344;
    float _374 = 0.0;
    int _376 = _372;
    if (!_314)
    {
        _374 = _308;
    }
    float _378 = _374;
    float _380 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _382 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _384 = _322 > 0.5;
    float _386 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _388 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _380);
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _392 = _318 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _398 = 1.0 / _354;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _404 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _386);
    float _406 = fma(_392, -2.0, _390);
    float _408 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _388);
    float _410 = _316 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _412 = false;
    float _414 = _378;
    if (_314)
    {
        bool _416 = _350 > 0.5;
        _412 = _416;
    }
    bool _418 = _412;
    float _420 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _422 = 1.0 / _396;
    bool _424 = _418;
    if (_314)
    {
        float _426 = _418 ? as_type<float>(_372) : _308;
        _414 = _426;
    }
    float _428 = _414;
    if (_326)
    {
        float _430 = -_308;
        float _432 = _430 + 1.0;
        _376 = as_type<int>(_432);
    }
    int _434 = _376;
    if (_326)
    {
        bool _436 = _360 > 0.5;
        _424 = _436;
    }
    bool _438 = _424;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    if (_326)
    {
        float _446 = _438 ? as_type<float>(_434) : _308;
        _366 = _446;
    }
    float _448 = _366;
    float _450 = 1.0 / _402;
    int _452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _454 = _452 != 0;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _462 = _460 != 0;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _466 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _468 = _464 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _480 = 1.0 / _340;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _484 = _470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _490 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _420);
    float _492 = 1.0 / _478;
    float _494 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_57.x = _484;
    out.m_57.y = _466;
    out.m_57.z = _468;
    out.m_57.w = _482;
    float _498 = _320 * 2.0;
    float _500 = _316 * 2.0;
    float _502 = -_496;
    float _504 = fma(_410, 2.0, _502);
    float _506 = 1.0 / _444;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _510 = _304 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _304 + _516;
    float _520 = _318 * 2.0;
    float _522 = _510 * _398;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _524;
    float _528 = _518 * _480;
    float _530 = 1.0 / _474;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _540 = -_328;
    float _542 = _540 + 1.0;
    float _544 = 0.0;
    if (!_364)
    {
        _544 = _316;
    }
    float _546 = _544;
    float _548 = _538 * _422;
    float _550 = _526 * _450;
    float _552 = 1.0 / _488;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _560 = _534 * _506;
    float _562 = _318 + _320;
    float _564 = _316 + _320;
    float _566 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[79].z, _558);
    float _568 = floor(_498);
    float _570 = _556 * _530;
    float _572 = _320 + (-0.5);
    float _574 = 0.0;
    float _576 = _546;
    if (!_364)
    {
        _574 = _320;
    }
    float _578 = _574;
    float _580 = _562 + (-1.0);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _590 = floor(_500);
    float _592 = _578;
    if (_364)
    {
        _576 = _320;
    }
    float _594 = _576;
    float _596 = _584 * _492;
    float _598 = _318 + _316;
    float _600 = _588 * _552;
    float _602 = 0.0;
    if (!_364)
    {
        _602 = _320;
    }
    float _604 = _602;
    float _606 = 1.0 / _514;
    int _608 = _384 ? as_type<int>(_542) : as_type<int>(_328);
    float _610 = _598 + (-1.0);
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _614 = _318 > 0.5;
    float _616 = floor(_520);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _618;
    float _622 = _332 ? as_type<float>(_608) : _328;
    float _624 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _626 = _604;
    if (_336)
    {
        float _628 = _614 ? _542 : _328;
        _346 = _628;
    }
    float _630 = _346;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _634 = _568 >= 0.0;
    bool _636 = isnan(_568);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[78].z, _612);
    float _646 = _620 * _606;
    float _648 = _316 + (-0.5);
    bool _650 = _590 >= 0.0;
    bool _652 = isnan(_590);
    bool _654 = _650 || _652;
    bool _656 = isnan(0.0);
    bool _658 = _654 || _656;
    float _660 = _318 + (-0.5);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _662;
    float _666 = 0.0;
    if (!_364)
    {
        _666 = _318;
    }
    float _668 = _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = 0.0;
    float _676 = _668;
    if (!_364)
    {
        _674 = _318;
    }
    float _678 = _674;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _680;
    float _684 = fma(_664, _528, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _686 = _678;
    if (_364)
    {
        _676 = _316;
    }
    float _688 = _676;
    float _690 = fma(_672, _522, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    if (_364)
    {
        _686 = _316;
    }
    float _692 = _686;
    float _694 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[78].w, _632);
    if (_364)
    {
        _592 = _318;
    }
    float _696 = _592;
    float _698 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_364)
    {
        _626 = _318;
    }
    float _700 = _626;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _702;
    int _706 = _642 ? 0 : 1;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _710 = _306 + _708;
    int _712 = _658 ? 0 : 1;
    float _714 = fma(_704, _528, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _716 = _616 > 0.0;
    float _718 = fma(_682, _528, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _720 = _616 >= 0.0;
    bool _722 = isnan(_616);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _732 = _306 + _730;
    float _734 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _736 = _568 > 0.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _740 = _306 + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _744 = _306 + _742;
    float _746 = fma(_560, _732, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _752 = fma(_548, _740, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _754 = fma(_600, _744, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _758 = _306 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _762 = _306 + _760;
    bool _764 = _590 > 0.0;
    float _766 = fma(_550, _710, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _768 = fma(_570, _758, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _770 = fma(_750, _522, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _772 = fma(_596, _762, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _776 = _306 + _774;
    bool _778 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _780 = isnan(_306);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = _734 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _798 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _800 = isnan(_306);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = fma(_646, _776, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _812 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[84].z, _790);
    float _814 = fma(_794, _522, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _816 = -_788;
    float _818 = _816 + 1.0;
    bool _820 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _822 = isnan(_306);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -_808;
    float _834 = _832 + 1.0;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _838 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _840 = isnan(_306);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = _808 * _818;
    float _852 = _830 * _834;
    float _854 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[83].z, _836);
    float _856 = -_830;
    float _858 = _856 + 1.0;
    float _860 = fma(_622, _796, -0.5);
    bool _862 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _864 = isnan(_306);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_848;
    float _876 = _874 + 1.0;
    bool _878 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _880 = isnan(_304);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = _848 * _858;
    bool _892 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _894 = isnan(_304);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = _696 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _906 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _908 = isnan(_304);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = _688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _920 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _922 = isnan(_306);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_902;
    float _934 = _932 + 1.0;
    bool _936 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _938 = isnan(_306);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -_916;
    float _950 = _948 + 1.0;
    bool _952 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _954 = isnan(_306);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _872 * _876;
    float _966 = -_872;
    float _968 = _966 + 1.0;
    float _970 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _972 = log2(_970);
    float _974 = -_962;
    float _976 = _974 + 1.0;
    float _978 = _962 * _968;
    float _980 = _902 * _950;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _984 = -_946;
    float _986 = _984 + 1.0;
    float _988 = _888 * _934;
    float _990 = _946 * _976;
    float _992 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].w, _982);
    float _994 = _930 * _986;
    float _996 = _684 * _988;
    float _998 = _714 * _988;
    float _1000 = _718 * _988;
    float _1002 = _310 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1006 = fma(_1002, _630, -0.5);
    float _1008 = _972 * _124;
    float _1010 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1012 = _746 * _994;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1016 = -_888;
    float _1018 = _1016 + 1.0;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1022 = -_930;
    float _1024 = _1022 + 1.0;
    float _1026 = fma(_904, -2.0, _1014);
    float _1028 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].x, _996);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    float _1034 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[79].x, _566);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].y, _998);
    float _1038 = -_1010;
    float _1040 = fma(_918, 2.0, _1038);
    float _1042 = exp2(_1008);
    float _1044 = _1034 * (-0.15915493667125701904296875);
    float _1046 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1000);
    int _1048 = _728 ? 0 : 1;
    float _1050 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1012);
    int _1052 = ~_706;
    int _1054 = _1052 + 1;
    int _1056 = _1054 + 1;
    float _1058 = fma(_690, _980, _1028);
    int _1060 = _1056;
    float _1062 = _850;
    if (!_736)
    {
        int _1064 = ~_706;
        int _1066 = _1064 + 1;
        _1060 = _1066;
    }
    int _1068 = _1060;
    float _1070 = 1.0 / _1032;
    bool _1072 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1074 = isnan(1.0);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1080 = _1076 || _1078;
    float _1082 = fma(_752, _990, _1050);
    int _1084 = ~_1048;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = fma(_770, _980, _1036);
    int _1092 = ~_712;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    float _1098 = fma(_814, _980, _1046);
    int _1100 = _1088;
    int _1102 = _1096;
    if (!_716)
    {
        int _1104 = ~_1048;
        int _1106 = _1104 + 1;
        _1100 = _1106;
    }
    int _1108 = _1100;
    float _1110 = _1044 * 6.283185482025146484375;
    float _1112 = sin(_1110);
    if (!_764)
    {
        int _1114 = ~_712;
        int _1116 = _1114 + 1;
        _1102 = _1116;
    }
    int _1118 = _1102;
    float _1120 = -_1042;
    float _1122 = _1120 + 1.0;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1136 = -_124;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[76].x, _504);
    float _1140 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _1142 = _1132 ? _1122 : 0.0;
    float _1144 = _1044 * 6.283185482025146484375;
    float _1146 = cos(_1144);
    float _1148 = _1020 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1150 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _406);
    float _1152 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _644);
    float _1154 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[84].x, _812);
    float _1156 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _854);
    float _1158 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _992);
    float _1160 = -_124;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1040);
    float _1164 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1026);
    if (_1080)
    {
        float _1166 = _1142 * _1070;
        _126 = _1166;
    }
    float _1168 = _126;
    float _1170 = fma(_1148, _448, -0.5);
    float _1172 = fma(_1134, _428, -0.5);
    float _1174 = fma(_766, _978, _1082);
    float _1176 = _1112 * _1006;
    bool _1178 = !_454;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _1154 * (-0.15915493667125701904296875);
    float _1184 = _408 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1186 = _1146 * _1006;
    float _1188 = -_1176;
    float _1190 = fma(_1146, _1172, _1188);
    float _1192 = _490 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1194 = abs(_1180);
    float _1196 = _1182 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    bool _1200 = !_458;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = _494 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1206 = in.m_59.x;
    float _1208 = in.m_59.y;
    float _1210 = in.m_59.z;
    float _1212 = fma(_1112, _1172, _1186);
    int _1214 = abs(_1202);
    float _1216 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1218 = _1192 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1184 + _1220;
    float _1224 = _1182 * 6.283185482025146484375;
    float _1226 = cos(_1224);
    float _1228 = float(_1194);
    float _1230 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1232 = float(_1118);
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1236 = _1204 + _1234;
    float _1238 = fma(_768, _964, _1174);
    float _1240 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1230);
    float _1242 = float(_1214);
    float _1244 = fma(_1152, _1190, _1138);
    float _1246 = float(_1068);
    float _1248 = _1198 * _860;
    float _1250 = fma(_1236, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1240);
    float _1252 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1058);
    float _1254 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1090);
    float _1256 = _1228 * _1246;
    float _1258 = _1242 * _1232;
    float _1260 = _1226 * _860;
    float _1262 = -_1248;
    float _1264 = fma(_1226, _1170, _1262);
    float _1266 = _1256 * (-2.0);
    float _1268 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1098);
    float _1270 = fma(_1198, _1170, _1260);
    float _1272 = _1218 * _1218;
    float _1274 = fma(_1156, _1264, _1162);
    float _1276 = _1258 * (-2.0);
    bool _1278 = _1250 >= 0.0;
    float _1280 = fma(_1222, _1222, _1272);
    float _1282 = fma(_772, _890, _1238);
    float _1284 = fma(_1266, _1206, _1206);
    float _1286 = fma(_698, _1276, _698);
    float _1288 = fma(_1236, _1236, _1280);
    float _1290 = fma(_754, _852, _1282);
    float _1292 = fma(_624, _1266, _624);
    float _1294 = -_1150;
    float _1296 = fma(_1140, _1212, _1294);
    float _1298 = -_1164;
    float _1300 = fma(_1158, _1270, _1298);
    float _1302 = rsqrt(_1288);
    float _1304 = fma(_810, _850, _1290);
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1308 = _1210;
    if (_1278)
    {
        _1062 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1310 = _1062;
    float _1312 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1314 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1316 = _1268 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1318 = fma(_1276, _1208, _1208);
    float _1320 = _1296 + 0.5;
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1244 + 0.5;
    int _1330 = as_type<int>(_1310);
    if (_1278)
    {
        float _1332 = _1310 * 5.0;
        _1330 = as_type<int>(_1332);
    }
    int _1334 = _1330;
    float _1336 = _1274 + 0.5;
    float _1338 = _1300 + 0.5;
    float _1340 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1304);
    bool _1342 = !_462;
    int _1344 = _1342 ? 0 : 1;
    out.m_61.x = _1322;
    out.m_61.y = _1324;
    out.m_61.z = _1326;
    out.m_61.w = _1306;
    float _1346 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    float _1348 = _1218 * _1302;
    int _1350 = abs(_1344);
    if (_1278)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4218 = as_type<float>(_1334);
        out.gl_Position.z = _4218;
    }
    out.m_63.x = _1328;
    out.m_63.y = _1320;
    out.m_63.z = _1336;
    out.m_63.w = _1338;
    out.m_65.x = _1340;
    float _1352 = _1222 * _1302;
    if (_1278)
    {
        out.m_45.x = 0.0;
    }
    if (_1278)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1354 = -_1348;
    float _1356 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1192);
    float _1358 = -_1352;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1362 = _1236 * _1302;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1366 = _1356 + _1364;
    float _1368 = float(_1350);
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1372 = _1360 + _1370;
    float _1374 = -_1362;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1380 = float(_1108);
    float _1382 = -_1348;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1388 = _1376 + _1386;
    float _1390 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1378);
    float _1392 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1318);
    float _1394 = _1368 * _1380;
    float _1396 = fma(_1292, _1168, _1346);
    float _1398 = fma(_1388, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1390);
    float _1400 = fma(_1286, _1168, _1392);
    float _1402 = _564 + (-1.0);
    float _1404 = _1394 * (-2.0);
    bool _1406 = _1398 >= 0.0;
    float _1408 = -_1352;
    float _1410 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1412 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1414 = fma(_1404, _1210, _1210);
    float _1416 = _1396 * 0.15915493667125701904296875;
    float _1418 = _1400 * 0.15915493667125701904296875;
    float _1420 = fma(_1412, _1404, _1412);
    float _1422 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1414);
    float _1424 = _1416 * 6.283185482025146484375;
    float _1426 = sin(_1424);
    float _1428 = -_1362;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1236);
    float _1432 = fma(_1420, _1168, _1422);
    float _1434 = _1384 * _1384;
    if (_1406)
    {
        _1308 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1308;
    float _1438 = _1432 * 0.15915493667125701904296875;
    float _1440 = fma(_1410, _1410, _1434);
    float _1442 = _1416 * 6.283185482025146484375;
    float _1444 = cos(_1442);
    int _1446 = as_type<int>(_1436);
    if (_1406)
    {
        float _1448 = _1436 * 5.0;
        _1446 = as_type<int>(_1448);
    }
    int _1450 = _1446;
    if (_1406)
    {
        out.m_45.x = 0.0;
    }
    if (_1406)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4415 = as_type<float>(_1450);
        out.gl_Position.z = _4415;
    }
    float _1452 = _1418 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1418 * 6.283185482025146484375;
    float _1458 = cos(_1456);
    float _1460 = _1438 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    if (_1406)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1464 = -_1192;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1468 = -_1184;
    float _1470 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1472 = -_1204;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = fma(_1430, _1430, _1440);
    float _1478 = _1466 * _1466;
    float _1480 = _1426 * _1454;
    float _1482 = _1444 * _1458;
    float _1484 = fma(_1470, _1470, _1478);
    float _1486 = sqrt(_1476);
    float _1488 = in.m_49.x;
    float _1490 = in.m_49.y;
    float _1492 = in.m_49.z;
    float _1494 = fma(_1462, _1482, _1480);
    float _1496 = fma(_1474, _1474, _1484);
    float _1498 = fma(_1462, _1480, _1482);
    float _1500 = rsqrt(_1496);
    float _1502 = _1302 * _1486;
    float _1504 = in.m_67.x;
    float _1506 = in.m_67.y;
    float _1508 = in.m_67.z;
    float _1510 = _1470 * _1500;
    float _1512 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1514 = _1474 * _1500;
    float _1516 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1520 = _1510 * _1518;
    float _1522 = _1466 * _1500;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1526 = _1514 * _1524;
    float _1528 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1532 = -_1520;
    float _1534 = fma(_1514, _1530, _1532);
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1538 = _1522 * _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1542 = -_1526;
    float _1544 = fma(_1522, _1540, _1542);
    float _1546 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1548 = _1534 * _1534;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1552 = -_1538;
    float _1554 = fma(_1510, _1550, _1552);
    float _1556 = _1438 * 6.283185482025146484375;
    float _1558 = cos(_1556);
    float _1560 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1562 = fma(_1544, _1544, _1548);
    float _1564 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1566 = _1560 * _1502;
    float _1568 = fma(_1554, _1554, _1562);
    float _1570 = _1546 * _1502;
    float _1572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1506);
    float _1574 = _1444 * _1454;
    float _1576 = _1426 * _1458;
    float _1578 = _1564 * _1502;
    float _1580 = rsqrt(_1568);
    float _1582 = _1566 * _1572;
    float _1584 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1504);
    float _1586 = -_1574;
    float _1588 = fma(_1462, _1576, _1586);
    float _1590 = -_1576;
    float _1592 = fma(_1462, _1574, _1590);
    float _1594 = -_1582;
    float _1596 = _1462 * _1594;
    float _1598 = _1578 * _1584;
    float _1600 = _1458 * _1558;
    float _1602 = _1558 * _1582;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1508);
    float _1606 = _1454 * _1558;
    float _1608 = fma(_1600, _1598, _1596);
    float _1610 = _1444 * _1602;
    float _1612 = _1570 * _1604;
    float _1614 = _1544 * _1580;
    float _1616 = fma(_1494, _1598, _1610);
    float _1618 = _1534 * _1580;
    float _1620 = _1426 * _1602;
    float _1622 = _1522 * _1614;
    float _1624 = fma(_1592, _1612, _1616);
    float _1626 = _1554 * _1580;
    float _1628 = _1514 * _1618;
    float _1630 = -_1622;
    float _1632 = fma(_1510, _1618, _1630);
    float _1634 = fma(_1588, _1598, _1620);
    float _1636 = fma(_1606, _1612, _1608);
    float _1638 = -_1628;
    float _1640 = fma(_1522, _1626, _1638);
    float _1642 = _1632 * _1624;
    float _1644 = fma(_1498, _1612, _1634);
    float _1646 = _1640 * _1624;
    float _1648 = fma(_1626, _1636, _1642);
    float _1650 = fma(_1614, _1636, _1646);
    float _1652 = fma(_1514, _1644, _1648);
    float _1654 = fma(_1510, _1644, _1650);
    float _1656 = _1204 + _1652;
    float _1658 = _1510 * _1626;
    float _1660 = _1184 + _1654;
    float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1664 = _1656 + _1662;
    float _1666 = -_1658;
    float _1668 = fma(_1514, _1614, _1666);
    float _1670 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1672 = _1660 + _1670;
    float _1674 = _1664 * _1664;
    float _1676 = _1668 * _1624;
    float _1678 = fma(_1672, _1672, _1674);
    float _1680 = fma(_1618, _1636, _1676);
    float _1682 = sqrt(_1678);
    float _1684 = fma(_1522, _1644, _1680);
    float _1686 = _1192 + _1684;
    bool _1688 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1690 = _1514;
    float _1692 = _1674;
    float _1694 = _1636;
    float _1696 = _1682;
    float _1698 = _1522;
    float _1700 = _1598;
    if (!_1688)
    {
        _1690 = _1660;
    }
    float _1702 = _1690;
    float _1704 = _1702;
    if (!_1688)
    {
        _1692 = _1656;
    }
    float _1706 = _1692;
    float _1708 = _1706;
    if (!_1688)
    {
        _1694 = _1686;
    }
    float _1710 = _1694;
    bool _1712 = !_1688;
    float _1714 = _1710;
    if (!_1712)
    {
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1720 = _1682 + _1718;
        float _1722 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = rsqrt(_1678);
        float _1726 = _1720 * _1716;
        float _1728 = _1726 * 0.15915493667125701904296875;
        float _1730 = _1728 * 6.283185482025146484375;
        float _1732 = sin(_1730);
        float _1734 = _1728 * 6.283185482025146484375;
        float _1736 = cos(_1734);
        float _1738 = fma(_1732, _1722, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1740 = _1724 * _1738;
        float _1742 = _1736 + (-1.0);
        float _1744 = fma(_1672, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1746 = fma(_1664, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1748 = _1742 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1750 = fma(_1686, _1736, _1748);
        _1714 = _1750;
        _1704 = _1744;
        _1708 = _1746;
        _1696 = _1728;
        _1698 = _1724;
    }
    float _1752 = _1714;
    float _1754 = _1704;
    float _1756 = _1708;
    float _1758 = _1696;
    float _1760 = _1698;
    float _1762 = -_1348;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1752);
    float _1766 = -_1352;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1754);
    float _1770 = -_1362;
    float _1772 = fma(_1770, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1756);
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1776 = _1764 + _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1780 = _1768 + _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1784 = _1772 + _1782;
    float _1786 = _1776 * _1776;
    float _1788 = fma(_1780, _1780, _1786);
    float _1790 = fma(_1784, _1784, _1788);
    float _1792 = rsqrt(_1790);
    float _1794 = sqrt(_1790);
    float _1796 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1798 = _1780 * _1796;
    float _1800 = _1784 * _1796;
    float _1802 = _1798 * _1798;
    float _1804 = _1800 * _1800;
    float _1806 = _1802 + _1804;
    float _1808 = sqrt(_1806);
    bool _1810 = _1808 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1812 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1814 = _1808 + _1812;
    float _1816 = _1792;
    float _1818 = _1760;
    float _1820 = _1814;
    float _1822 = _1758;
    float _1824 = _1776;
    if (_1810)
    {
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1816 = _1826;
    }
    float _1828 = _1816;
    if (_1810)
    {
        float _1830 = rsqrt(_1806);
        _1818 = _1830;
    }
    float _1832 = _1818;
    float _1834 = _1832;
    if (_1810)
    {
        float _1836 = _1814 * _1828;
        _1820 = _1836;
    }
    float _1838 = _1820;
    if (_1810)
    {
        float _1840 = _1838 * 0.15915493667125701904296875;
        _1822 = _1840;
    }
    float _1842 = _1822;
    float _1844 = _1784;
    float _1846 = _1842;
    if (_1810)
    {
        float _1848 = _1842 * 6.283185482025146484375;
        float _1850 = sin(_1848);
        _1844 = _1850;
    }
    float _1852 = _1844;
    float _1854 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1856 = precise::max(0.0, _1854);
    float _1858 = _1828;
    float _1860 = _1856;
    if (_1810)
    {
        float _1862 = _1842 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        _1858 = _1864;
    }
    float _1866 = _1858;
    float _1868 = -_1796;
    float _1870 = -_1856;
    float _1872 = fma(_1776, _1868, _1870);
    if (_1810)
    {
        float _1874 = _1872 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1874;
    }
    float _1876 = _1824;
    float _1878 = _1852;
    float _1880 = _1876;
    if (_1810)
    {
        float _1882 = fma(_1852, _1876, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1878 = _1882;
    }
    float _1884 = _1878;
    float _1886 = _1884;
    if (!_1810)
    {
        _1880 = _1802;
    }
    float _1888 = _1880;
    float _1890 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1892 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1894 = _1888;
    float _1896 = _1866;
    if (_1810)
    {
        float _1898 = _1866 + (-1.0);
        _1860 = _1898;
    }
    float _1900 = _1860;
    float _1902 = _1900;
    if (_1810)
    {
        float _1904 = _1832 * _1884;
        _1700 = _1904;
    }
    float _1906 = _1700;
    if (!_1810)
    {
        _1834 = _1798;
    }
    float _1908 = _1834;
    float _1910 = _1908;
    if (_1810)
    {
        float _1912 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1912;
    }
    float _1914 = _1846;
    if (_1810)
    {
        float _1916 = _1798 * _1906;
        _1910 = _1916;
    }
    float _1918 = _1910;
    if (!_1810)
    {
        _1886 = _1872;
    }
    float _1920 = _1886;
    float _1922 = _1920;
    if (!_1810)
    {
        _1902 = _1800;
    }
    float _1924 = _1902;
    float _1926 = _1924;
    if (_1810)
    {
        float _1928 = fma(_1872, _1866, _1914);
        _1922 = _1928;
    }
    float _1930 = _1922;
    if (_1810)
    {
        float _1932 = _1800 * _1906;
        _1926 = _1932;
    }
    float _1934 = _1926;
    if (_1810)
    {
        float _1936 = _1918 * _1918;
        _1894 = _1936;
    }
    float _1938 = _1894;
    if (!_1810)
    {
        _1896 = _1804;
    }
    float _1940 = _1896;
    float _1942 = _1940;
    if (_1810)
    {
        float _1944 = _1934 * _1934;
        _1942 = _1944;
    }
    float _1946 = _1942;
    float _1948 = fma(_1930, _1930, _1938);
    float _1950 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1952 = _1948 + _1946;
    float _1954 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1950);
    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1958 = fma(_1794, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1956);
    float _1960 = precise::clamp(_1958, 0.0, 1.0);
    float _1962 = rsqrt(_1952);
    float _1964 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1966 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1954);
    float _1968 = -_1960;
    float _1970 = _1968 + 1.0;
    float _1972 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1974 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1964);
    float _1976 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1978 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1892);
    float _1980 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1972);
    float _1982 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1974);
    float _1984 = abs(_1970);
    float _1986 = log2(_1984);
    float _1988 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1978);
    float _1990 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1980);
    float _1992 = _1982 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1994 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1996 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1998 = _1962 * _1918;
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2002 = _1962 * _1930;
    float _2004 = _1962 * _1934;
    float _2006 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2008 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2000);
    float _2010 = -_1994;
    float _2012 = fma(_2010, _1890, 1.0);
    float _2014 = _1990 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2016 = -_2006;
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2016);
    float _2020 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2008);
    float _2022 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2024 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2026 = -_2004;
    float _2028 = fma(_2026, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2018);
    float _2030 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2020);
    float _2032 = log2(_2012);
    float _2034 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2036 = fma(_2028, -0.5, 0.5);
    float _2038 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2024);
    float _2040 = fma(_2028, 0.5, 0.5);
    float _2042 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2034);
    float _2044 = _2002 + 1.0;
    float _2046 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2038);
    float _2048 = exp2(_2022);
    float _2050 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2042);
    float _2052 = fma(_2040, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2054 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2046);
    float _2056 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2050);
    float _2058 = fma(_2040, _2052, -0.212114393711090087890625);
    float _2060 = 1.0 / _2030;
    float _2062 = _2032 * 0.693147182464599609375;
    float _2064 = fma(_2040, _2058, 1.570728778839111328125);
    float _2066 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2068 = sqrt(_2036);
    float _2070 = -_2002;
    float _2072 = fma(_2048, _2044, _2070);
    float _2074 = fma(_2072, 0.5, 0.5);
    float _2076 = _2056 * _2060;
    float _2078 = _2054 * _2060;
    float _2080 = fma(_2076, 0.5, 0.5);
    float _2082 = fma(_2078, -0.5, 0.5);
    float _2084 = _2068 * 0.636619746685028076171875;
    float3 _5430 = float3(_2080, _2082, _2066);
    float _2086 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5430, float3(0.0), isnan(_5430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5430, float3(0.0), isnan(_5430)), level(0.0)).x;
    float3 _5441 = float3(_2080, _2082, _2066);
    float4 _2089 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5441, float3(0.0), isnan(_5441)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5441, float3(0.0), isnan(_5441)), level(0.0)).xyzw;
    float _2091 = _2089.x;
    float _2093 = _2089.y;
    float _2095 = _2089.z;
    float _2097 = _2089.w;
    float _2099 = -_2064;
    float _2101 = fma(_2084, _2099, 1.0);
    float2 _5463 = float2(_2101, _2074);
    float3 _2105 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5463, float2(0.0), isnan(_5463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5463, float2(0.0), isnan(_5463)), level(0.0)).xyz;
    float _2107 = _2105.x;
    float _2109 = _2105.y;
    float _2111 = _2105.z;
    float _2113 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2115 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2117 = _2056 + _2030;
    float _2119 = _2030 * 0.5;
    float _2121 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2115);
    float _2123 = exp2(_2113);
    float _2125 = _2117 * 0.5;
    float _2127 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2121);
    float _2129 = fma(_2054, -0.5, _2119);
    float _2131 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2127);
    float _2133 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = _2131 + _2030;
    out.gl_Position.x = _2056;
    out.gl_Position.y = _2054;
    out.gl_Position.z = _2131;
    out.gl_Position.w = _2030;
    float _2137 = _2135 * 0.5;
    float _2139 = -_2123;
    float _2141 = _2139 + 1.0;
    out.m_45.x = _2133;
    float _2143 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _2125;
    out.m_69.y = _2129;
    out.m_69.z = _2137;
    out.m_69.w = _2030;
    float _2145 = _2143 * _2086;
    float _2147 = -_2143;
    float _2149 = _2147 + 1.0;
    float _2151 = _2097 * _2145;
    float _2153 = _2097 * _2149;
    float _2155 = _2111 * _2145;
    float _2157 = fma(_2107, _2151, _2091);
    float _2159 = fma(_2109, _2151, _2093);
    float _2161 = fma(_2097, _2155, _2095);
    out.m_71.x = _2157;
    out.m_71.y = _2159;
    out.m_71.z = _2161;
    out.m_71.w = _2153;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

