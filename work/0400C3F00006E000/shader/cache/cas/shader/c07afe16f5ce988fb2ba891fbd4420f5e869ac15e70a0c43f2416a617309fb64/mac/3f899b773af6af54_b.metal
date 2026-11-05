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
    float4 m_63 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2312 = false;
    bool _704 = false;
    bool _402 = false;
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
        float _3000 = as_type<float>(_106);
        out.gl_Position.z = _3000;
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
        float _3070 = as_type<float>(_144);
        out.gl_Position.z = _3070;
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
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _370 = _364 * _342;
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _374 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _368);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _376);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _372);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _410 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _418 = _410 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = _410 + _436;
    float _440 = 1.0 / _426;
    float _442 = 1.0 / _434;
    bool _444 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _446 = isnan(_410);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _458 = -_454;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _430;
    float _464 = 1.0 / _422;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _468 = _410 + _466;
    float _470 = _414 * _442;
    bool _472 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _474 = isnan(_410);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _484;
    float _488 = _468 * _440;
    bool _490 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _492 = isnan(_410);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _418 * _462;
    bool _504 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _506 = isnan(_410);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -_500;
    float _518 = _516 + 1.0;
    float _520 = fma(_486, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _522 = _482 * _518;
    bool _524 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _526 = isnan(_410);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = -_482;
    float _542 = _540 + 1.0;
    float _544 = _514 * _460;
    float _546 = _438 * _464;
    float _548 = -_514;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _556;
    float _560 = _454 * _542;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = _534 * _550;
    float _572 = fma(_554, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _574 = fma(_558, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = fma(_538, _470, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _578 = fma(_564, _470, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _580 = fma(_568, _470, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _582 = _520 * _570;
    float _584 = -_534;
    float _586 = _584 + 1.0;
    float _588 = _572 * _570;
    float _590 = _574 * _570;
    float _592 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].x, _582);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _594;
    float _598 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].y, _588);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _604;
    float _608 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _610 = fma(_576, _544, _592);
    float _612 = fma(_578, _544, _598);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _622 = fma(_602, _546, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _624 = fma(_596, _546, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _626 = fma(_606, _546, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _632 = fma(_580, _544, _608);
    float _634 = fma(_616, _488, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _636 = fma(_620, _488, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _638 = fma(_630, _488, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _640 = fma(_622, _560, _610);
    float _642 = fma(_624, _560, _612);
    float _644 = fma(_626, _560, _632);
    float _646 = fma(_634, _522, _640);
    float _648 = fma(_636, _522, _642);
    float _650 = fma(_638, _522, _644);
    float _652 = in.m_51.x;
    float _654 = in.m_51.y;
    float _656 = in.m_51.z;
    float _658 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].x, _646);
    float _660 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].y, _648);
    float _662 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].z, _650);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _670 = _662 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _672;
    out.m_55.y = _674;
    out.m_55.z = _676;
    out.m_55.w = _664;
    float _678 = _380 * _656;
    float _680 = _378 * _654;
    float _682 = _374 * _652;
    bool _684 = !_456;
    float _702;
    if (!_684)
    {
        float _686 = in.m_53.x;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_90);
        float _708 = 1.0 / _706;
        float _710 = _124 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = in.m_57.y;
    float _716 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _718 = in.m_53.y;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _722 = _720 != 0;
    float _724 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _716);
    float _726 = abs(_262);
    float _728 = abs(_266);
    float _730 = precise::max(_726, _728);
    float _732 = in.m_59.w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _740 = _738 != 0;
    float _742 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _744 = log2(_742);
    bool _746 = _730 >= 16.0;
    float _748 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _750 = in.m_57.x;
    float _752 = 1.0 / _736;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _758 = -_714;
    float _760 = _758 + 1.0;
    float _762 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _748);
    float _764 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _766 = 1.0 / _756;
    bool _768 = _718 > 0.5;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    out.m_61.w = _732;
    float _774 = _714;
    bool _776 = _746;
    if (_722)
    {
        float _778 = _768 ? _760 : _714;
        _774 = _778;
    }
    float _780 = _774;
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _262 * 0.0625;
    float _786 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _796 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _798 = _266 * 0.0625;
    float _800 = _746 ? _784 : _262;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _802;
    float _806 = 1.0 / _772;
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _786);
    float _810 = in.m_53.x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _816 = _744 * _124;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _818;
    float _822 = 1.0 / _790;
    float _824 = _746 ? _798 : _266;
    float _826 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_740)
    {
        float _834 = in.m_53.x;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _838;
    float _842 = _814 * _766;
    float _844 = 1.0 / _794;
    float _846 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _724);
    float _848 = _804 * _752;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _850;
    float _854 = abs(_800);
    bool _856 = _854 != 0.0;
    bool _858 = isnan(_854);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _874 = 1.0 / _830;
    float _876 = _852 * _806;
    float _878 = abs(_824);
    bool _880 = _878 == 0.0;
    bool _882 = !_864;
    bool _884 = _880 && _882;
    float _886 = _868 * _822;
    bool _888 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _890 = isnan(1.0);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _896 = _892 || _894;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _900 = 1.0 + _898;
    float _902 = _840 * _844;
    float _904 = 1.0 / _872;
    float _906 = in.m_53.z;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _912 = _836 > 0.5;
    bool _914 = _912 && _740;
    float _916 = _718 * 2.0;
    float _918 = 0.0;
    int _920 = _884 ? (-1) : 0;
    if (_740)
    {
        _918 = _750;
    }
    float _922 = _918;
    float _924 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _762);
    float _926 = exp2(_816);
    bool _928 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _936 = _932 || _934;
    float _938 = _910 * _874;
    float _940 = _922;
    if (_884)
    {
        bool _942 = as_type<int>(_824) >= 0;
        _776 = _942;
    }
    bool _944 = _776;
    float _946 = _820 * _904;
    float _948 = _810 + _718;
    float _950 = _810 * 2.0;
    float _952 = 1.0 / _900;
    if (_914)
    {
        float _954 = -_922;
        float _956 = _954 + 1.0;
        _940 = _956;
    }
    float _958 = _940;
    float _960 = _948 + (-1.0);
    float _962 = abs(_824);
    bool _964 = _962 == 0.0;
    float _966 = -_926;
    float _968 = _966 + 1.0;
    float _970 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _972 = _906 * 2.0;
    float _974 = floor(_950);
    float _976 = _810 + _906;
    float _978 = _718 + _906;
    float _980 = _936 ? _968 : 0.0;
    int _982 = 0;
    float _984 = _978;
    if (_884)
    {
        int _986 = _944 ? 0 : 1078530011;
        _982 = _986;
    }
    int _988 = _982;
    float _990 = _978 + (-1.0);
    int _992 = _988;
    if (!_740)
    {
        _984 = _750;
    }
    float _994 = _984;
    float _996 = floor(_916);
    float _998 = _976 + (-1.0);
    float _1000 = _994;
    if (_740)
    {
        _1000 = _958;
    }
    float _1002 = _1000;
    float _1004 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_896)
    {
        float _1006 = _980 * _952;
        _126 = _1006;
    }
    float _1008 = _126;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1012 = floor(_972);
    bool _1014 = _974 > 0.0;
    bool _1016 = _974 >= 0.0;
    bool _1018 = isnan(_974);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(0.0);
    bool _1024 = _1020 || _1022;
    if (_884)
    {
        int _1026 = int(0x80000000) & as_type<int>(_800);
        int _1028 = _988 | _1026;
        _992 = _1028;
    }
    int _1030 = _992;
    bool _1032 = !_864;
    bool _1034 = _1032 && _964;
    int _1036 = _1030;
    float _1038 = as_type<float>(_1030);
    if (!_1034)
    {
        float _1040 = abs(_800);
        bool _1042 = _1040 != as_type<float>(0x7f800000u /* inf */);
        bool _1044 = isnan(_1040);
        bool _1046 = _1042 || _1044;
        bool _1048 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1050 = _1046 || _1048;
        float _1052 = abs(_824);
        bool _1054 = _1052 == as_type<float>(0x7f800000u /* inf */);
        float _1056 = abs(_824);
        bool _1058 = _1056 == as_type<float>(0x7f800000u /* inf */);
        bool _1060 = !_1050;
        bool _1062 = _1058 && _1060;
        if (_1062)
        {
            bool _1064 = as_type<int>(_824) >= 0;
            _920 = _1064 ? (-1) : 0;
        }
        int _1066 = _920;
        if (_1062)
        {
            _1036 = 1075235812;
        }
        int _1068 = _1036;
        int _1070 = _1068;
        if (_1062)
        {
            int _1072 = ~_1066;
            int _1074 = (_1072 != 0) ? _1068 : 1061752795;
            _1070 = _1074;
        }
        int _1076 = _1070;
        float _1078 = as_type<float>(_1076);
        if (_1062)
        {
            int _1080 = int(0x80000000) & as_type<int>(_800);
            int _1082 = _1076 | _1080;
            _1078 = as_type<float>(_1082);
        }
        float _1084 = _1078;
        bool _1086 = !_1050;
        bool _1088 = _1086 && _1054;
        _1038 = _1084;
        if (!_1088)
        {
            float _1090 = abs(_800);
            float _1092 = abs(_824);
            float _1094 = precise::max(_1090, _1092);
            float _1096 = abs(_800);
            float _1098 = abs(_824);
            float _1100 = _1096 + _1098;
            float _1102 = abs(_800);
            float _1104 = abs(_824);
            float _1106 = precise::min(_1102, _1104);
            float _1108 = 1.0 / _1094;
            float _1110 = abs(_800);
            float _1112 = abs(_824);
            bool _1114 = _1110 > _1112;
            bool _1116 = as_type<int>(_824) >= 0;
            bool _1118 = _1100 > as_type<float>(0x7f800000u /* inf */);
            bool _1120 = isnan(_1100);
            bool _1122 = _1118 || _1120;
            bool _1124 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1126 = _1122 || _1124;
            int _1128 = as_type<int>(_800) & int(0x80000000);
            float _1130 = _1106 * _1108;
            float _1132 = _1130 * _1130;
            float _1134 = _1132 + 11.33538818359375;
            float _1136 = fma(_1132, _1134, 28.84246826171875);
            float _1138 = fma(_1132, _1136, 19.6966705322265625);
            float _1140 = fma(_1132, -0.82336294651031494140625, -5.674867153167724609375);
            float _1142 = fma(_1132, _1140, -6.565555095672607421875);
            float _1144 = 1.0 / _1138;
            float _1146 = _1132 * _1142;
            float _1148 = _1130 * _1146;
            float _1150 = fma(_1148, _1144, _1130);
            float _1152 = _1150;
            _1038 = _1100;
            if (_1114)
            {
                float _1154 = -_1150;
                float _1156 = _1154 + 1.57079637050628662109375;
                _1152 = _1156;
            }
            float _1158 = _1152;
            int _1160 = as_type<int>(_1158);
            if (!_1116)
            {
                float _1162 = -_1158;
                float _1164 = _1162 + 3.1415927410125732421875;
                _1160 = as_type<int>(_1164);
            }
            int _1166 = _1160;
            if (!_1126)
            {
                int _1168 = _1128 | _1166;
                _1038 = as_type<float>(_1168);
            }
        }
    }
    float _1170 = _1038;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1182 = _1180 != 0;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1186 = _712 + _1184;
    bool _1188 = _996 > 0.0;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1192 = _712 + _1190;
    bool _1194 = _996 >= 0.0;
    bool _1196 = isnan(_996);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_848, _1186, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1206 = _1024 ? 0 : 1;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1210 = _712 + _1208;
    bool _1212 = !_1178;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1218 = _1012 > 0.0;
    float _1220 = fma(_842, _1192, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1222 = _1012 >= 0.0;
    bool _1224 = isnan(_1012);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan(0.0);
    bool _1230 = _1226 || _1228;
    float _1232 = fma(_876, _1210, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1234 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1236 = isnan(_712);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1248 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1250 = isnan(_712);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1262 = _1216 + _1260;
    bool _1264 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1266 = isnan(_712);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -_1244;
    float _1278 = _1276 + 1.0;
    float _1280 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1282 = -_1258;
    float _1284 = _1282 + 1.0;
    float _1286 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1288 = _1258 * _1278;
    bool _1290 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1292 = isnan(_712);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1246 + _1302;
    float _1306 = -_1274;
    float _1308 = _1306 + 1.0;
    bool _1310 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1312 = isnan(_712);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1280 + _1322;
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    float _1330 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1286);
    float _1332 = _1300 * _1308;
    bool _1334 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1336 = isnan(_712);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = _1320 * _1328;
    float _1348 = -_1320;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1330);
    float _1354 = _1262 * _1262;
    float _1356 = -_1344;
    float _1358 = _1356 + 1.0;
    float _1360 = _1344 * _1350;
    bool _1362 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1364 = isnan(_712);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1376 = _712 + _1374;
    bool _1378 = !_1182;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = _1274 * _1284;
    bool _1384 = _1352 >= 0.0;
    float _1386 = fma(_1304, _1304, _1354);
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1390 = fma(_886, _1376, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1392 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1394 = isnan(_712);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1372 * _1358;
    float _1406 = _780 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1408 = -_1372;
    float _1410 = _1408 + 1.0;
    float _1412 = fma(_1324, _1324, _1386);
    float _1414 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1418 = _1402 * _1410;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1422 = _712 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1426 = _712 + _1424;
    float _1428 = -_1402;
    float _1430 = _1428 + 1.0;
    float _1432 = _1204 * _1418;
    float _1434 = _1204;
    float _1436 = _1404;
    bool _1438 = _1202;
    if (_1384)
    {
        _1434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1440 = _1434;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1444 = _712 + _1442;
    float _1446 = rsqrt(_1412);
    float _1448 = _1414 * _1388;
    int _1450 = as_type<int>(_1440);
    if (_1384)
    {
        out.m_47.x = 0.0;
    }
    if (_1384)
    {
        float _1452 = _1440 * 5.0;
        _1450 = as_type<int>(_1452);
    }
    int _1454 = _1450;
    float _1456 = fma(_938, _1444, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1458 = fma(_946, _1426, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1460 = fma(_902, _1422, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1462 = _1406 * _1416;
    if (_1384)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5131 = as_type<float>(_1454);
        out.gl_Position.z = _5131;
    }
    float _1464 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1432);
    int _1466 = ~_1206;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    out.m_63.x = _1448;
    out.m_63.y = _1462;
    bool _1472 = !_1174;
    int _1474 = _1472 ? 0 : 1;
    float _1476 = _1262 * _1446;
    float _1478 = _1304 * _1446;
    int _1480 = _1470;
    if (_1384)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1482 = rsqrt(_924);
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1488 = fma(_1220, _1404, _1464);
    if (!_1014)
    {
        int _1490 = ~_1206;
        int _1492 = _1490 + 1;
        _1480 = _1492;
    }
    int _1494 = _1480;
    float _1496 = in.m_65.z;
    float _1498 = _1324 * _1446;
    float _1500 = -_1478;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1486 + _1504;
    float _1508 = fma(_1232, _1360, _1488);
    float _1510 = -_1498;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1280);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1502 + _1514;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1520 = fma(_1390, _1346, _1508);
    float _1522 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1512 + _1524;
    float _1528 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1530 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1518);
    float _1532 = fma(_1460, _1332, _1520);
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1170);
    float _1536 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1540 = _1230 ? 0 : 1;
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1530);
    float _1544 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1546 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1538);
    int _1548 = ~_1540;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = fma(_1456, _1382, _1532);
    int _1556 = _1552;
    int _1558 = as_type<int>(_1546);
    if (!_1218)
    {
        int _1560 = ~_1540;
        int _1562 = _1560 + 1;
        _1556 = _1562;
    }
    int _1564 = _1556;
    bool _1566 = _1542 >= 0.0;
    float _1568 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1546);
    int _1570 = abs(_1474);
    int _1572 = _1202 ? 0 : 1;
    float _1574 = fma(_1568, _1534, _1496);
    float _1576 = in.m_65.x;
    float _1578 = in.m_65.y;
    float _1580 = float(_1564);
    float _1582 = float(_1570);
    if (_1566)
    {
        _1436 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1584 = _1436;
    if (_1566)
    {
        out.m_47.x = 0.0;
    }
    int _1586 = ~_1572;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = _1582 * _1580;
    int _1594 = _1590;
    if (!_1188)
    {
        int _1596 = ~_1572;
        int _1598 = _1596 + 1;
        _1594 = _1598;
    }
    int _1600 = _1594;
    if (_1566)
    {
        float _1602 = _1584 * 5.0;
        _1558 = as_type<int>(_1602);
    }
    int _1604 = _1558;
    float _1606 = float(_1494);
    int _1608 = abs(_1214);
    if (_1566)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5380 = as_type<float>(_1604);
        out.gl_Position.z = _5380;
    }
    if (_1566)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1610 = -_1476;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1614 = _1592 * (-2.0);
    float _1616 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1618 = -_1478;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1622 = float(_1608);
    float _1624 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1616);
    float _1626 = _1612 * _1612;
    float _1628 = fma(_1614, _1576, _1576);
    float _1630 = _810 + (-0.5);
    float _1632 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1634 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = fma(_1620, _1620, _1626);
    float _1638 = _1622 * _1606;
    float _1640 = -_1498;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1644 = abs(_1632);
    bool _1646 = _1644 > 0.001000000047497451305389404296875;
    float _1648 = fma(_970, _1614, _970);
    float _1650 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1628);
    float _1652 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1654 = _1646 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1656 = fma(_1642, _1642, _1636);
    float _1658 = _1638 * (-2.0);
    float _1660 = fma(_1648, _1008, _1650);
    int _1662 = abs(_1380);
    float _1664 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1652);
    float _1666 = _1632 + _1654;
    float _1668 = fma(_1658, _1578, _1578);
    float _1670 = _1660 * 0.15915493667125701904296875;
    float _1672 = in.m_59.x;
    float _1674 = _718 + (-0.5);
    float _1676 = float(_1600);
    float _1678 = fma(_1458, _1288, _1554);
    float _1680 = float(_1662);
    float _1682 = fma(_1004, _1658, _1004);
    float _1684 = abs(_1664);
    float _1686 = abs(_1666);
    float _1688 = precise::max(_1684, _1686);
    float _1690 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1668);
    float _1692 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1678);
    float _1694 = _1680 * _1676;
    bool _1696 = _1688 >= 16.0;
    float _1698 = fma(_1682, _1008, _1690);
    float _1700 = in.m_67.x;
    float _1702 = in.m_67.y;
    float _1704 = _1694 * (-2.0);
    float _1706 = _906 + (-0.5);
    float _1708 = _1698 * 0.15915493667125701904296875;
    float _1710 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1712 = fma(_1574, _1704, _1574);
    float _1714 = fma(_1010, _1704, _1010);
    float _1716 = sqrt(_1656);
    float _1718 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1710);
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1712);
    float _1722 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1724 = _1664;
    float _1726 = _1666;
    if (_1696)
    {
        float _1728 = _1664 * 0.0625;
        _1724 = _1728;
    }
    float _1730 = _1724;
    float _1732 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1718);
    float _1734 = fma(_1714, _1008, _1720);
    float _1736 = _1692 * _1672;
    if (_1696)
    {
        float _1738 = _1666 * 0.0625;
        _1726 = _1738;
    }
    float _1740 = _1726;
    float _1742 = _1670 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = abs(_1732);
    float _1748 = -_1746;
    float _1750 = _1748 + 1.0;
    float _1752 = abs(_1730);
    bool _1754 = _1752 != 0.0;
    bool _1756 = isnan(_1752);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    float _1764 = in.m_67.z;
    float _1766 = abs(_1740);
    bool _1768 = _1766 == 0.0;
    float _1770 = _1736 * _1750;
    float _1772 = abs(_1740);
    bool _1774 = _1772 == 0.0;
    bool _1776 = !_1762;
    bool _1778 = _1774 && _1776;
    float _1780 = _1446 * _1716;
    float _1782 = _1670 * 6.283185482025146484375;
    float _1784 = cos(_1782);
    float _1786 = -_1770;
    float _1788 = _1786 + _1700;
    float _1790 = _1780 * _1722;
    float _1792 = _1708 * 6.283185482025146484375;
    float _1794 = sin(_1792);
    float _1796 = _1734 * 0.15915493667125701904296875;
    int _1798 = as_type<int>(_1788);
    if (_1778)
    {
        bool _1800 = as_type<int>(_1740) >= 0;
        _1438 = _1800;
    }
    bool _1802 = _1438;
    float _1804 = _1708 * 6.283185482025146484375;
    float _1806 = cos(_1804);
    float _1808 = _1796 * 6.283185482025146484375;
    float _1810 = sin(_1808);
    float _1812 = -_1770;
    float _1814 = _1812 + _1702;
    float _1816 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1818 = _1784 * _1794;
    float _1820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1788);
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1814);
    float _1824 = _1780 * _1816;
    int _1826 = as_type<int>(_1822);
    int _1828 = _1802 ? (-1) : 0;
    if (_1778)
    {
        int _1830 = _1802 ? 0 : 1078530011;
        _1798 = _1830;
    }
    int _1832 = _1798;
    float _1834 = _1744 * _1806;
    float _1836 = _1796 * 6.283185482025146484375;
    float _1838 = cos(_1836);
    float _1840 = -_1818;
    float _1842 = fma(_1810, _1834, _1840);
    float _1844 = -_1834;
    float _1846 = fma(_1810, _1818, _1844);
    float _1848 = _1820 * _1824;
    float _1850 = _1822 * _1790;
    float _1852 = _1528 * _1528;
    if (_1778)
    {
        int _1854 = int(0x80000000) & as_type<int>(_1730);
        int _1856 = _1832 | _1854;
        _1826 = _1856;
    }
    int _1858 = _1826;
    bool _1860 = !_1762;
    bool _1862 = _1860 && _1768;
    int _1864 = _1858;
    float _1866 = as_type<float>(_1858);
    if (!_1862)
    {
        float _1868 = abs(_1730);
        bool _1870 = _1868 != as_type<float>(0x7f800000u /* inf */);
        bool _1872 = isnan(_1868);
        bool _1874 = _1870 || _1872;
        bool _1876 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1878 = _1874 || _1876;
        float _1880 = abs(_1740);
        bool _1882 = _1880 == as_type<float>(0x7f800000u /* inf */);
        float _1884 = abs(_1740);
        bool _1886 = _1884 == as_type<float>(0x7f800000u /* inf */);
        bool _1888 = !_1878;
        bool _1890 = _1886 && _1888;
        if (_1890)
        {
            bool _1892 = as_type<int>(_1740) >= 0;
            _1828 = _1892 ? (-1) : 0;
        }
        int _1894 = _1828;
        if (_1890)
        {
            _1864 = 1075235812;
        }
        int _1896 = _1864;
        int _1898 = _1896;
        if (_1890)
        {
            int _1900 = ~_1894;
            int _1902 = (_1900 != 0) ? _1896 : 1061752795;
            _1898 = _1902;
        }
        int _1904 = _1898;
        float _1906 = as_type<float>(_1904);
        if (_1890)
        {
            int _1908 = int(0x80000000) & as_type<int>(_1730);
            int _1910 = _1904 | _1908;
            _1906 = as_type<float>(_1910);
        }
        float _1912 = _1906;
        bool _1914 = !_1878;
        bool _1916 = _1914 && _1882;
        _1866 = _1912;
        if (!_1916)
        {
            float _1918 = abs(_1730);
            float _1920 = abs(_1740);
            float _1922 = precise::max(_1918, _1920);
            float _1924 = abs(_1730);
            float _1926 = abs(_1740);
            float _1928 = precise::min(_1924, _1926);
            float _1930 = 1.0 / _1922;
            float _1932 = abs(_1730);
            float _1934 = abs(_1740);
            bool _1936 = _1932 > _1934;
            bool _1938 = as_type<int>(_1740) >= 0;
            float _1940 = _1928 * _1930;
            float _1942 = _1940 * _1940;
            float _1944 = _1942 + 11.33538818359375;
            float _1946 = fma(_1942, _1944, 28.84246826171875);
            float _1948 = fma(_1942, _1946, 19.6966705322265625);
            float _1950 = fma(_1942, -0.82336294651031494140625, -5.674867153167724609375);
            float _1952 = fma(_1942, _1950, -6.565555095672607421875);
            float _1954 = 1.0 / _1948;
            float _1956 = _1942 * _1952;
            float _1958 = abs(_1730);
            float _1960 = abs(_1740);
            float _1962 = _1958 + _1960;
            int _1964 = as_type<int>(_1730) & int(0x80000000);
            float _1966 = _1940 * _1956;
            bool _1968 = _1962 > as_type<float>(0x7f800000u /* inf */);
            bool _1970 = isnan(_1962);
            bool _1972 = _1968 || _1970;
            bool _1974 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1976 = _1972 || _1974;
            float _1978 = fma(_1966, _1954, _1940);
            float _1980 = _1978;
            _1866 = _1962;
            if (_1936)
            {
                float _1982 = -_1978;
                float _1984 = _1982 + 1.57079637050628662109375;
                _1980 = _1984;
            }
            float _1986 = _1980;
            int _1988 = as_type<int>(_1986);
            if (!_1938)
            {
                float _1990 = -_1986;
                float _1992 = _1990 + 3.1415927410125732421875;
                _1988 = as_type<int>(_1992);
            }
            int _1994 = _1988;
            if (!_1976)
            {
                int _1996 = _1964 | _1994;
                _1866 = as_type<float>(_1996);
            }
        }
    }
    float _1998 = _1866;
    float _2000 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2002 = fma(_1536, _1536, _1852);
    float _2004 = _1744 * _1794;
    float _2006 = _1784 * _1806;
    float _2008 = _1838 * _1850;
    float _2010 = _1780 * _2000;
    float _2012 = fma(_1544, _1544, _2002);
    float _2014 = _1794 * _1838;
    float _2016 = _1806 * _1838;
    float _2018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1764);
    float _2020 = fma(_1810, _2006, _2004);
    float _2022 = _1784 * _2008;
    float _2024 = _1998 * (-0.15915493667125701904296875);
    float _2026 = _2018 * _2010;
    float _2028 = -_1850;
    float _2030 = _1810 * _2028;
    float _2032 = fma(_2020, _1848, _2022);
    float _2034 = rsqrt(_2012);
    float _2036 = _1744 * _2008;
    float _2038 = fma(_2016, _1848, _2030);
    float _2040 = fma(_1846, _2026, _2032);
    float _2042 = fma(_1810, _2004, _2006);
    float _2044 = fma(_1842, _1848, _2036);
    float _2046 = fma(_2014, _2026, _2038);
    float _2048 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2050 = _2024 * 6.283185482025146484375;
    float _2052 = cos(_2050);
    float _2054 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2056 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2058 = fma(_2042, _2026, _2044);
    float _2060 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2048);
    float _2062 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2054);
    float _2064 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2056);
    float _2066 = _2024 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    float _2070 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2060);
    float _2072 = _1536 * _2034;
    float _2074 = _1544 * _2034;
    float _2076 = _1528 * _2034;
    float _2078 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2062);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2082 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2064);
    float _2084 = -_2052;
    float _2086 = _2084 + 1.0;
    float _2088 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2090 = _2074 * _2074;
    float _2092 = _2072 * _2086;
    float _2094 = _2076 * _2086;
    float _2096 = fma(_2086, _2090, _2052);
    float _2098 = _2074 * _2068;
    float _2100 = _2072 * _2068;
    float _2102 = _2076 * _2068;
    float _2104 = fma(_2072, _2092, _2052);
    float _2106 = -_2098;
    float _2108 = fma(_2076, _2092, _2106);
    float _2110 = fma(_2074, _2094, _2100);
    float _2112 = fma(_2076, _2094, _2052);
    float _2114 = fma(_2076, _2092, _2098);
    float _2116 = _2088 * _2108;
    float _2118 = -_2102;
    float _2120 = fma(_2074, _2092, _2118);
    float _2122 = _2088 * _2110;
    float _2124 = fma(_2074, _2092, _2102);
    float _2126 = fma(_2080, _2104, _2116);
    float _2128 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2130 = fma(_2080, _2120, _2122);
    float _2132 = _2088 * _2112;
    float _2134 = -_2100;
    float _2136 = fma(_2074, _2094, _2134);
    float _2138 = fma(_2128, _2124, _2126);
    float _2140 = fma(_2128, _2096, _2130);
    float _2142 = fma(_2080, _2114, _2132);
    float _2144 = _1246 + _2138;
    float _2146 = _1280 + _2140;
    float _2148 = fma(_2128, _2136, _2142);
    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2152 = _2144 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2156 = _2146 + _2154;
    float _2158 = _1216 + _2148;
    float _2160 = _2152 * _2152;
    float _2162 = _2156 * _2156;
    float _2164 = _2160 + _2162;
    float _2166 = sqrt(_2164);
    bool _2168 = _2166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = _2148;
    float _2172 = _2092;
    float _2174 = _2132;
    float _2176 = _2098;
    float _2178 = _2162;
    if (!_2168)
    {
        _2170 = _2160;
    }
    float _2180 = _2170;
    float _2182 = _2180;
    if (!_2168)
    {
        _2172 = _2144;
    }
    float _2184 = _2172;
    float _2186 = _2184;
    if (!_2168)
    {
        _2174 = _2146;
    }
    float _2188 = _2174;
    float _2190 = _2188;
    if (!_2168)
    {
        _2176 = _2158;
    }
    float _2192 = _2176;
    bool _2194 = !_2168;
    float _2196 = _2192;
    if (!_2194)
    {
        float _2198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2202 = _2166 + _2200;
        float _2204 = rsqrt(_2164);
        float _2206 = _2202 * _2198;
        float _2208 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2210 = _2206 * 0.15915493667125701904296875;
        float _2212 = _2210 * 6.283185482025146484375;
        float _2214 = sin(_2212);
        float _2216 = _2210 * 6.283185482025146484375;
        float _2218 = cos(_2216);
        float _2220 = fma(_2214, _2208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2222 = _2204 * _2220;
        float _2224 = _2218 + (-1.0);
        float _2226 = fma(_2152, _2222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2228 = fma(_2156, _2222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2230 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2234 = _2226 + _2232;
        float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2238 = _2228 + _2236;
        float _2240 = fma(_2158, _2218, _2230);
        float _2242 = _2234 * _2234;
        float _2244 = _2238 * _2238;
        _2196 = _2240;
        _2182 = _2242;
        _2178 = _2244;
        _2186 = _2226;
        _2190 = _2228;
    }
    float _2246 = _2196;
    float _2248 = _2182;
    float _2250 = _2178;
    float _2252 = _2186;
    float _2254 = _2190;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2258 = _2246 + _2256;
    out.m_55.x = _672;
    out.m_55.y = _674;
    out.m_55.z = _676;
    out.m_55.w = _664;
    float _2260 = fma(_2258, _2258, _2248);
    float _2262 = _2260 + _2250;
    float _2264 = sqrt(_2262);
    bool _2266 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2268 = isnan(_2264);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2274 = _2270 || _2272;
    float _2276 = _2248;
    if (!_2274)
    {
        _2276 = 1.0;
    }
    float _2278 = _2276;
    bool _2280 = !_2274;
    float _2282 = _2278;
    if (!_2280)
    {
        bool _2284 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2286 = isnan(_2264);
        bool _2288 = _2284 || _2286;
        bool _2290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2292 = _2288 || _2290;
        if (!_2292)
        {
            float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2296 = _2264 + _2294;
            float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2300 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2298;
            float _2302 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2306 = 1.0 / _2300;
            float _2308 = _2296 * _2306;
            float _2310 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2282 = _2310;
            _2312 = true;
        }
        else
        {
            bool _2314 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2316 = isnan(_2264);
            bool _2318 = _2314 || _2316;
            bool _2320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2322 = _2318 || _2320;
            if (!_2322)
            {
                float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2326 = _2264 + _2324;
                float _2328 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2330 = _2328 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2332 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2334 = _2332 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2336 = 1.0 / _2330;
                float _2338 = _2326 * _2336;
                float _2340 = fma(_2338, _2334, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2282 = _2340;
                _2312 = true;
            }
            else
            {
                _2282 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2312 = false;
    float _2342 = _2282;
    float _2344 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2346 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2348 = _2252 + _2346;
    float _2350 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2352 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan(0.5);
    bool _2360 = _2356 || _2358;
    float _2362 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2344);
    float _2364 = fma(_2348, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2366 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2368 = _2246 + _2366;
    float _2370 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2372 = _2254 + _2370;
    float _2374 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2362);
    float _2376 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2350);
    float _2378 = -_1478;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2364);
    float _2382 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2384 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2376);
    float _2386 = fma(_2368, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2388 = fma(_2372, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2390 = 1.0 / _2382;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2394 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.5);
    bool _2402 = _2398 || _2400;
    float _2404 = -_1476;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2408 = -_1498;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2388);
    float _2412 = _2392 + _2382;
    float _2414 = _2392;
    float _2416 = _2342;
    float _2418 = _2406;
    float _2420 = _2410;
    if (_2360)
    {
        _2414 = _2380;
    }
    float _2422 = _2414;
    float _2424 = _2422;
    float _2426 = _2390;
    if (!_2360)
    {
        float _2428 = _1506 * _1506;
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2432 = -_1280;
        float _2434 = _2432 + _2388;
        float _2436 = fma(_1516, _1516, _2428);
        float _2438 = fma(_1526, _1526, _2436);
        float _2440 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2442 = sqrt(_2438);
        float _2444 = 1.0 / _1780;
        float _2446 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2448 = precise::min(_2442, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2450 = _2448 * _2430;
        float _2452 = _2450 * _2444;
        float _2454 = -_1246;
        float _2456 = _2454 + _2364;
        float _2458 = -_1216;
        float _2460 = _2458 + _2386;
        float _2462 = _2446 * _2452;
        float _2464 = _2434 * _2452;
        float _2466 = fma(_2456, _2462, _1502);
        float _2468 = fma(_2460, _2462, _1486);
        float _2470 = fma(_2446, _2464, _1512);
        _2416 = _2446;
        _2418 = _2468;
        _2424 = _2466;
        _2420 = _2470;
    }
    float _2472 = _2416;
    float _2474 = _2418;
    float _2476 = _2424;
    float _2478 = _2420;
    float _2480 = _2472;
    if (_2402)
    {
        _2480 = 1.0;
    }
    float _2482 = _2480;
    float _2484 = _2412 * _2390;
    float _2486 = _2484 * 0.5;
    float _2488 = _2482;
    float _2490 = _2486;
    if (!_2402)
    {
        float _2492 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2496 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2494);
        float _2498 = _2492 * 0.15915493667125701904296875;
        float _2500 = _2498 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        float _2504 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2506 = _2504 * 0.15915493667125701904296875;
        float _2508 = _2498 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = 1.0 / _2502;
        float _2514 = _2506 * 6.283185482025146484375;
        float _2516 = cos(_2514);
        float _2518 = _2510 * _2512;
        float _2520 = 1.0 / _2496;
        float _2522 = _2516 * _2518;
        float _2524 = _2506 * 6.283185482025146484375;
        float _2526 = sin(_2524);
        float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2530 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2528;
        float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2534 = _2520 * _2532;
        float _2536 = 1.0 / _2522;
        float _2538 = 1.0 / _2530;
        float _2540 = _2526 * _2536;
        float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2544 = fma(_2540, _2534, _2542);
        float _2546 = _2544 * _2538;
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        _2426 = _2506;
        _2488 = _2548;
    }
    float _2550 = _2426;
    float _2552 = _2488;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2556 = _2474 + _2554;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2560 = _2476 + _2558;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2478 + _2562;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2576 = _2560 * _2574;
    float _2578 = _2564 * _2574;
    float _2580 = _2576 * _2576;
    float _2582 = _2578 * _2578;
    float _2584 = _2580 + _2582;
    float _2586 = sqrt(_2584);
    bool _2588 = _2586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2592 = _2586 + _2590;
    float _2594 = _2572;
    float _2596 = _2550;
    float _2598 = _2592;
    float _2600 = _2556;
    float _2602 = _2574;
    float _2604 = _2576;
    if (_2588)
    {
        float _2606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2594 = _2606;
    }
    float _2608 = _2594;
    if (_2588)
    {
        float _2610 = rsqrt(_2584);
        _2596 = _2610;
    }
    float _2612 = _2596;
    float _2614 = _2612;
    if (_2588)
    {
        float _2616 = _2592 * _2608;
        _2598 = _2616;
    }
    float _2618 = _2598;
    if (_2588)
    {
        float _2620 = _2618 * 0.15915493667125701904296875;
        _2490 = _2620;
    }
    float _2622 = _2490;
    float _2624 = _2608;
    if (_2588)
    {
        float _2626 = _2622 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2624 = _2628;
    }
    float _2630 = _2624;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2634 = precise::max(0.0, _2632);
    float _2636 = _2564;
    float _2638 = _2634;
    if (_2588)
    {
        float _2640 = _2622 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        _2636 = _2642;
    }
    float _2644 = _2636;
    float _2646 = -_2574;
    float _2648 = -_2634;
    float _2650 = fma(_2556, _2646, _2648);
    if (!_2588)
    {
        _2600 = _2580;
    }
    float _2652 = _2600;
    float _2654 = _2652;
    if (_2588)
    {
        float _2656 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2638 = _2656;
    }
    float _2658 = _2638;
    float _2660 = sqrt(_2570);
    float _2662 = _2630;
    float _2664 = _2658;
    if (_2588)
    {
        float _2666 = fma(_2630, _2658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2662 = _2666;
    }
    float _2668 = _2662;
    float _2670 = _2668;
    float _2672 = _2644;
    if (_2588)
    {
        float _2674 = _2644 + (-1.0);
        _2664 = _2674;
    }
    float _2676 = _2664;
    float _2678 = _2676;
    if (_2588)
    {
        float _2680 = _2612 * _2668;
        _2602 = _2680;
    }
    float _2682 = _2602;
    if (!_2588)
    {
        _2614 = _2650;
    }
    float _2684 = _2614;
    float _2686 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2688 = _2684;
    if (_2588)
    {
        float _2690 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2690;
    }
    float _2692 = _2670;
    if (_2588)
    {
        float _2694 = _2576 * _2682;
        _2604 = _2694;
    }
    float _2696 = _2604;
    if (!_2588)
    {
        _2678 = _2578;
    }
    float _2698 = _2678;
    float _2700 = _2698;
    if (_2588)
    {
        float _2702 = _2578 * _2682;
        _2700 = _2702;
    }
    float _2704 = _2700;
    if (_2588)
    {
        float _2706 = fma(_2650, _2644, _2692);
        _2688 = _2706;
    }
    float _2708 = _2688;
    if (_2588)
    {
        float _2710 = _2696 * _2696;
        _2654 = _2710;
    }
    float _2712 = _2654;
    if (!_2588)
    {
        _2672 = _2582;
    }
    float _2714 = _2672;
    float _2716 = _2714;
    if (_2588)
    {
        float _2718 = _2704 * _2704;
        _2716 = _2718;
    }
    float _2720 = _2716;
    float _2722 = fma(_2708, _2708, _2712);
    float _2724 = _2722 + _2720;
    float _2726 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2730 = fma(_2660, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2728);
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2738 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2726);
    float _2740 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2742 = rsqrt(_2724);
    float _2744 = -_2732;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2738);
    float _2750 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2740);
    float _2752 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2734);
    float _2754 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2686);
    float _2756 = _2748 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2758 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2750);
    float _2760 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2752);
    float _2762 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2754);
    float _2764 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2766 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2768 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2770 = abs(_2746);
    float _2772 = log2(_2770);
    float _2774 = -_2764;
    float _2776 = fma(_2774, _2736, 1.0);
    float _2778 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2780 = _2742 * _2696;
    float _2782 = _2762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2784 = _2742 * _2708;
    float _2786 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2778);
    float _2788 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2790 = _2742 * _2704;
    float _2792 = log2(_2776);
    float _2794 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2786);
    float _2796 = -_2788;
    float _2798 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2796);
    float _2800 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2802 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2794);
    float _2804 = -_2790;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2798);
    float _2808 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2810 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2812 = 1.0 / _2802;
    float _2814 = fma(_2806, -0.5, 0.5);
    float _2816 = fma(_2806, 0.5, 0.5);
    float _2818 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2810);
    float _2820 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2800);
    float _2822 = _2784 + 1.0;
    float _2824 = fma(_2816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2826 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2818);
    float _2828 = exp2(_2808);
    float _2830 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2820);
    float _2832 = fma(_2816, _2824, -0.212114393711090087890625);
    float _2834 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2826);
    float _2836 = _2792 * 0.693147182464599609375;
    float _2838 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2830);
    float _2840 = fma(_2816, _2832, 1.570728778839111328125);
    float _2842 = sqrt(_2814);
    float _2844 = _2834 * _2812;
    float _2846 = _2838 * _2812;
    float _2848 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2850 = fma(_2844, 0.5, 0.5);
    float _2852 = fma(_2846, -0.5, 0.5);
    float _2854 = -_2784;
    float _2856 = fma(_2828, _2822, _2854);
    float3 _7355 = float3(_2850, _2852, _2848);
    float _2858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7355, float3(0.0), isnan(_7355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7355, float3(0.0), isnan(_7355)), level(0.0)).x;
    float3 _7366 = float3(_2850, _2852, _2848);
    float4 _2861 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7366, float3(0.0), isnan(_7366)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7366, float3(0.0), isnan(_7366)), level(0.0)).xyzw;
    float _2863 = _2861.x;
    float _2865 = _2861.y;
    float _2867 = _2861.z;
    float _2869 = _2861.w;
    float _2871 = fma(_2856, 0.5, 0.5);
    float _2873 = _2842 * 0.636619746685028076171875;
    float _2875 = -_2840;
    float _2877 = fma(_2873, _2875, 1.0);
    float2 _7393 = float2(_2877, _2871);
    float3 _2881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7393, float2(0.0), isnan(_7393)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7393, float2(0.0), isnan(_7393)), level(0.0)).xyz;
    float _2883 = _2881.x;
    float _2885 = _2881.y;
    float _2887 = _2881.z;
    float _2889 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2891 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2893 = _2552 > 0.0;
    bool _2895 = isnan(_2552);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(0.0);
    bool _2901 = _2897 || _2899;
    float _2903 = _2552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2905 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2891);
    float _2907 = exp2(_2889);
    float _2909 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2905);
    float _2911 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2913 = _2911 + _2802;
    out.gl_Position.x = _2834;
    out.gl_Position.y = _2838;
    out.gl_Position.z = _2911;
    out.gl_Position.w = _2802;
    float _2915 = _2913 * 0.5;
    float _2917 = -_2907;
    float _2919 = _2917 + 1.0;
    float _2921 = _2903 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2923 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2915;
    out.m_69.w = _2802;
    out.m_47.x = _2921;
    float _2925 = _2923 * _2858;
    float _2927 = -_2923;
    float _2929 = _2927 + 1.0;
    float _2931 = _2869 * _2925;
    float _2933 = _2887 * _2925;
    float _2935 = fma(_2883, _2931, _2863);
    float _2937 = fma(_2885, _2931, _2865);
    float _2939 = _2869 * _2929;
    float _2941 = fma(_2869, _2933, _2867);
    out.m_71.x = _2935;
    out.m_71.y = _2937;
    out.m_71.z = _2941;
    out.m_71.w = _2939;
    if (_2901)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2943;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2312 = false;
    bool _704 = false;
    bool _402 = false;
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
        float _3000 = as_type<float>(_106);
        out.gl_Position.z = _3000;
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
        float _3070 = as_type<float>(_144);
        out.gl_Position.z = _3070;
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
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _370 = _364 * _342;
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _374 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _368);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _376);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _372);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _410 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _418 = _410 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = _410 + _436;
    float _440 = 1.0 / _426;
    float _442 = 1.0 / _434;
    bool _444 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _446 = isnan(_410);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _458 = -_454;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _430;
    float _464 = 1.0 / _422;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _468 = _410 + _466;
    float _470 = _414 * _442;
    bool _472 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _474 = isnan(_410);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _484;
    float _488 = _468 * _440;
    bool _490 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _492 = isnan(_410);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _418 * _462;
    bool _504 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _506 = isnan(_410);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -_500;
    float _518 = _516 + 1.0;
    float _520 = fma(_486, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _522 = _482 * _518;
    bool _524 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _526 = isnan(_410);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = -_482;
    float _542 = _540 + 1.0;
    float _544 = _514 * _460;
    float _546 = _438 * _464;
    float _548 = -_514;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _556;
    float _560 = _454 * _542;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = _534 * _550;
    float _572 = fma(_554, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _574 = fma(_558, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = fma(_538, _470, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _578 = fma(_564, _470, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _580 = fma(_568, _470, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _582 = _520 * _570;
    float _584 = -_534;
    float _586 = _584 + 1.0;
    float _588 = _572 * _570;
    float _590 = _574 * _570;
    float _592 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].x, _582);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _594;
    float _598 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].y, _588);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _604;
    float _608 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _610 = fma(_576, _544, _592);
    float _612 = fma(_578, _544, _598);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _622 = fma(_602, _546, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _624 = fma(_596, _546, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _626 = fma(_606, _546, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _632 = fma(_580, _544, _608);
    float _634 = fma(_616, _488, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _636 = fma(_620, _488, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _638 = fma(_630, _488, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _640 = fma(_622, _560, _610);
    float _642 = fma(_624, _560, _612);
    float _644 = fma(_626, _560, _632);
    float _646 = fma(_634, _522, _640);
    float _648 = fma(_636, _522, _642);
    float _650 = fma(_638, _522, _644);
    float _652 = in.m_51.x;
    float _654 = in.m_51.y;
    float _656 = in.m_51.z;
    float _658 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].x, _646);
    float _660 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].y, _648);
    float _662 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].z, _650);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _670 = _662 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _672;
    out.m_55.y = _674;
    out.m_55.z = _676;
    out.m_55.w = _664;
    float _678 = _380 * _656;
    float _680 = _378 * _654;
    float _682 = _374 * _652;
    bool _684 = !_456;
    float _702;
    if (!_684)
    {
        float _686 = in.m_53.x;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_90);
        float _708 = 1.0 / _706;
        float _710 = _124 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = in.m_57.y;
    float _716 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _718 = in.m_53.y;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _722 = _720 != 0;
    float _724 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _716);
    float _726 = abs(_262);
    float _728 = abs(_266);
    float _730 = precise::max(_726, _728);
    float _732 = in.m_59.w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _740 = _738 != 0;
    float _742 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _744 = log2(_742);
    bool _746 = _730 >= 16.0;
    float _748 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _750 = in.m_57.x;
    float _752 = 1.0 / _736;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _758 = -_714;
    float _760 = _758 + 1.0;
    float _762 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _748);
    float _764 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _766 = 1.0 / _756;
    bool _768 = _718 > 0.5;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    out.m_61.w = _732;
    float _774 = _714;
    bool _776 = _746;
    if (_722)
    {
        float _778 = _768 ? _760 : _714;
        _774 = _778;
    }
    float _780 = _774;
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _262 * 0.0625;
    float _786 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _796 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _798 = _266 * 0.0625;
    float _800 = _746 ? _784 : _262;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _802;
    float _806 = 1.0 / _772;
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _786);
    float _810 = in.m_53.x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _816 = _744 * _124;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _818;
    float _822 = 1.0 / _790;
    float _824 = _746 ? _798 : _266;
    float _826 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_740)
    {
        float _834 = in.m_53.x;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _838;
    float _842 = _814 * _766;
    float _844 = 1.0 / _794;
    float _846 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _724);
    float _848 = _804 * _752;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _850;
    float _854 = abs(_800);
    bool _856 = _854 != 0.0;
    bool _858 = isnan(_854);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _874 = 1.0 / _830;
    float _876 = _852 * _806;
    float _878 = abs(_824);
    bool _880 = _878 == 0.0;
    bool _882 = !_864;
    bool _884 = _880 && _882;
    float _886 = _868 * _822;
    bool _888 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _890 = isnan(1.0);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _896 = _892 || _894;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _900 = 1.0 + _898;
    float _902 = _840 * _844;
    float _904 = 1.0 / _872;
    float _906 = in.m_53.z;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _912 = _836 > 0.5;
    bool _914 = _912 && _740;
    float _916 = _718 * 2.0;
    float _918 = 0.0;
    int _920 = _884 ? (-1) : 0;
    if (_740)
    {
        _918 = _750;
    }
    float _922 = _918;
    float _924 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _762);
    float _926 = exp2(_816);
    bool _928 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _936 = _932 || _934;
    float _938 = _910 * _874;
    float _940 = _922;
    if (_884)
    {
        bool _942 = as_type<int>(_824) >= 0;
        _776 = _942;
    }
    bool _944 = _776;
    float _946 = _820 * _904;
    float _948 = _810 + _718;
    float _950 = _810 * 2.0;
    float _952 = 1.0 / _900;
    if (_914)
    {
        float _954 = -_922;
        float _956 = _954 + 1.0;
        _940 = _956;
    }
    float _958 = _940;
    float _960 = _948 + (-1.0);
    float _962 = abs(_824);
    bool _964 = _962 == 0.0;
    float _966 = -_926;
    float _968 = _966 + 1.0;
    float _970 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _972 = _906 * 2.0;
    float _974 = floor(_950);
    float _976 = _810 + _906;
    float _978 = _718 + _906;
    float _980 = _936 ? _968 : 0.0;
    int _982 = 0;
    float _984 = _978;
    if (_884)
    {
        int _986 = _944 ? 0 : 1078530011;
        _982 = _986;
    }
    int _988 = _982;
    float _990 = _978 + (-1.0);
    int _992 = _988;
    if (!_740)
    {
        _984 = _750;
    }
    float _994 = _984;
    float _996 = floor(_916);
    float _998 = _976 + (-1.0);
    float _1000 = _994;
    if (_740)
    {
        _1000 = _958;
    }
    float _1002 = _1000;
    float _1004 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_896)
    {
        float _1006 = _980 * _952;
        _126 = _1006;
    }
    float _1008 = _126;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1012 = floor(_972);
    bool _1014 = _974 > 0.0;
    bool _1016 = _974 >= 0.0;
    bool _1018 = isnan(_974);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(0.0);
    bool _1024 = _1020 || _1022;
    if (_884)
    {
        int _1026 = int(0x80000000) & as_type<int>(_800);
        int _1028 = _988 | _1026;
        _992 = _1028;
    }
    int _1030 = _992;
    bool _1032 = !_864;
    bool _1034 = _1032 && _964;
    int _1036 = _1030;
    float _1038 = as_type<float>(_1030);
    if (!_1034)
    {
        float _1040 = abs(_800);
        bool _1042 = _1040 != as_type<float>(0x7f800000u /* inf */);
        bool _1044 = isnan(_1040);
        bool _1046 = _1042 || _1044;
        bool _1048 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1050 = _1046 || _1048;
        float _1052 = abs(_824);
        bool _1054 = _1052 == as_type<float>(0x7f800000u /* inf */);
        float _1056 = abs(_824);
        bool _1058 = _1056 == as_type<float>(0x7f800000u /* inf */);
        bool _1060 = !_1050;
        bool _1062 = _1058 && _1060;
        if (_1062)
        {
            bool _1064 = as_type<int>(_824) >= 0;
            _920 = _1064 ? (-1) : 0;
        }
        int _1066 = _920;
        if (_1062)
        {
            _1036 = 1075235812;
        }
        int _1068 = _1036;
        int _1070 = _1068;
        if (_1062)
        {
            int _1072 = ~_1066;
            int _1074 = (_1072 != 0) ? _1068 : 1061752795;
            _1070 = _1074;
        }
        int _1076 = _1070;
        float _1078 = as_type<float>(_1076);
        if (_1062)
        {
            int _1080 = int(0x80000000) & as_type<int>(_800);
            int _1082 = _1076 | _1080;
            _1078 = as_type<float>(_1082);
        }
        float _1084 = _1078;
        bool _1086 = !_1050;
        bool _1088 = _1086 && _1054;
        _1038 = _1084;
        if (!_1088)
        {
            float _1090 = abs(_800);
            float _1092 = abs(_824);
            float _1094 = precise::max(_1090, _1092);
            float _1096 = abs(_800);
            float _1098 = abs(_824);
            float _1100 = _1096 + _1098;
            float _1102 = abs(_800);
            float _1104 = abs(_824);
            float _1106 = precise::min(_1102, _1104);
            float _1108 = 1.0 / _1094;
            float _1110 = abs(_800);
            float _1112 = abs(_824);
            bool _1114 = _1110 > _1112;
            bool _1116 = as_type<int>(_824) >= 0;
            bool _1118 = _1100 > as_type<float>(0x7f800000u /* inf */);
            bool _1120 = isnan(_1100);
            bool _1122 = _1118 || _1120;
            bool _1124 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1126 = _1122 || _1124;
            int _1128 = as_type<int>(_800) & int(0x80000000);
            float _1130 = _1106 * _1108;
            float _1132 = _1130 * _1130;
            float _1134 = _1132 + 11.33538818359375;
            float _1136 = fma(_1132, _1134, 28.84246826171875);
            float _1138 = fma(_1132, _1136, 19.6966705322265625);
            float _1140 = fma(_1132, -0.82336294651031494140625, -5.674867153167724609375);
            float _1142 = fma(_1132, _1140, -6.565555095672607421875);
            float _1144 = 1.0 / _1138;
            float _1146 = _1132 * _1142;
            float _1148 = _1130 * _1146;
            float _1150 = fma(_1148, _1144, _1130);
            float _1152 = _1150;
            _1038 = _1100;
            if (_1114)
            {
                float _1154 = -_1150;
                float _1156 = _1154 + 1.57079637050628662109375;
                _1152 = _1156;
            }
            float _1158 = _1152;
            int _1160 = as_type<int>(_1158);
            if (!_1116)
            {
                float _1162 = -_1158;
                float _1164 = _1162 + 3.1415927410125732421875;
                _1160 = as_type<int>(_1164);
            }
            int _1166 = _1160;
            if (!_1126)
            {
                int _1168 = _1128 | _1166;
                _1038 = as_type<float>(_1168);
            }
        }
    }
    float _1170 = _1038;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1182 = _1180 != 0;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1186 = _712 + _1184;
    bool _1188 = _996 > 0.0;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1192 = _712 + _1190;
    bool _1194 = _996 >= 0.0;
    bool _1196 = isnan(_996);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_848, _1186, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1206 = _1024 ? 0 : 1;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1210 = _712 + _1208;
    bool _1212 = !_1178;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1218 = _1012 > 0.0;
    float _1220 = fma(_842, _1192, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1222 = _1012 >= 0.0;
    bool _1224 = isnan(_1012);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan(0.0);
    bool _1230 = _1226 || _1228;
    float _1232 = fma(_876, _1210, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1234 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1236 = isnan(_712);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1248 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1250 = isnan(_712);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1262 = _1216 + _1260;
    bool _1264 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1266 = isnan(_712);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -_1244;
    float _1278 = _1276 + 1.0;
    float _1280 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1282 = -_1258;
    float _1284 = _1282 + 1.0;
    float _1286 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1288 = _1258 * _1278;
    bool _1290 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1292 = isnan(_712);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1246 + _1302;
    float _1306 = -_1274;
    float _1308 = _1306 + 1.0;
    bool _1310 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1312 = isnan(_712);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1280 + _1322;
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    float _1330 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1286);
    float _1332 = _1300 * _1308;
    bool _1334 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1336 = isnan(_712);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = _1320 * _1328;
    float _1348 = -_1320;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1330);
    float _1354 = _1262 * _1262;
    float _1356 = -_1344;
    float _1358 = _1356 + 1.0;
    float _1360 = _1344 * _1350;
    bool _1362 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1364 = isnan(_712);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1376 = _712 + _1374;
    bool _1378 = !_1182;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = _1274 * _1284;
    bool _1384 = _1352 >= 0.0;
    float _1386 = fma(_1304, _1304, _1354);
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1390 = fma(_886, _1376, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1392 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1394 = isnan(_712);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1372 * _1358;
    float _1406 = _780 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1408 = -_1372;
    float _1410 = _1408 + 1.0;
    float _1412 = fma(_1324, _1324, _1386);
    float _1414 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1418 = _1402 * _1410;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1422 = _712 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1426 = _712 + _1424;
    float _1428 = -_1402;
    float _1430 = _1428 + 1.0;
    float _1432 = _1204 * _1418;
    float _1434 = _1204;
    float _1436 = _1404;
    bool _1438 = _1202;
    if (_1384)
    {
        _1434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1440 = _1434;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1444 = _712 + _1442;
    float _1446 = rsqrt(_1412);
    float _1448 = _1414 * _1388;
    int _1450 = as_type<int>(_1440);
    if (_1384)
    {
        out.m_47.x = 0.0;
    }
    if (_1384)
    {
        float _1452 = _1440 * 5.0;
        _1450 = as_type<int>(_1452);
    }
    int _1454 = _1450;
    float _1456 = fma(_938, _1444, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1458 = fma(_946, _1426, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1460 = fma(_902, _1422, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1462 = _1406 * _1416;
    if (_1384)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5131 = as_type<float>(_1454);
        out.gl_Position.z = _5131;
    }
    float _1464 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1432);
    int _1466 = ~_1206;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    out.m_63.x = _1448;
    out.m_63.y = _1462;
    bool _1472 = !_1174;
    int _1474 = _1472 ? 0 : 1;
    float _1476 = _1262 * _1446;
    float _1478 = _1304 * _1446;
    int _1480 = _1470;
    if (_1384)
    {
        return out;
    }
    float _1482 = rsqrt(_924);
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1488 = fma(_1220, _1404, _1464);
    if (!_1014)
    {
        int _1490 = ~_1206;
        int _1492 = _1490 + 1;
        _1480 = _1492;
    }
    int _1494 = _1480;
    float _1496 = in.m_65.z;
    float _1498 = _1324 * _1446;
    float _1500 = -_1478;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1486 + _1504;
    float _1508 = fma(_1232, _1360, _1488);
    float _1510 = -_1498;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1280);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1502 + _1514;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1520 = fma(_1390, _1346, _1508);
    float _1522 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1512 + _1524;
    float _1528 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1530 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1518);
    float _1532 = fma(_1460, _1332, _1520);
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1170);
    float _1536 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1540 = _1230 ? 0 : 1;
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1530);
    float _1544 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1546 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1538);
    int _1548 = ~_1540;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = fma(_1456, _1382, _1532);
    int _1556 = _1552;
    int _1558 = as_type<int>(_1546);
    if (!_1218)
    {
        int _1560 = ~_1540;
        int _1562 = _1560 + 1;
        _1556 = _1562;
    }
    int _1564 = _1556;
    bool _1566 = _1542 >= 0.0;
    float _1568 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1546);
    int _1570 = abs(_1474);
    int _1572 = _1202 ? 0 : 1;
    float _1574 = fma(_1568, _1534, _1496);
    float _1576 = in.m_65.x;
    float _1578 = in.m_65.y;
    float _1580 = float(_1564);
    float _1582 = float(_1570);
    if (_1566)
    {
        _1436 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1584 = _1436;
    if (_1566)
    {
        out.m_47.x = 0.0;
    }
    int _1586 = ~_1572;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = _1582 * _1580;
    int _1594 = _1590;
    if (!_1188)
    {
        int _1596 = ~_1572;
        int _1598 = _1596 + 1;
        _1594 = _1598;
    }
    int _1600 = _1594;
    if (_1566)
    {
        float _1602 = _1584 * 5.0;
        _1558 = as_type<int>(_1602);
    }
    int _1604 = _1558;
    float _1606 = float(_1494);
    int _1608 = abs(_1214);
    if (_1566)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5380 = as_type<float>(_1604);
        out.gl_Position.z = _5380;
    }
    if (_1566)
    {
        return out;
    }
    float _1610 = -_1476;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1614 = _1592 * (-2.0);
    float _1616 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1618 = -_1478;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1622 = float(_1608);
    float _1624 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1616);
    float _1626 = _1612 * _1612;
    float _1628 = fma(_1614, _1576, _1576);
    float _1630 = _810 + (-0.5);
    float _1632 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1634 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = fma(_1620, _1620, _1626);
    float _1638 = _1622 * _1606;
    float _1640 = -_1498;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1644 = abs(_1632);
    bool _1646 = _1644 > 0.001000000047497451305389404296875;
    float _1648 = fma(_970, _1614, _970);
    float _1650 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1628);
    float _1652 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1654 = _1646 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1656 = fma(_1642, _1642, _1636);
    float _1658 = _1638 * (-2.0);
    float _1660 = fma(_1648, _1008, _1650);
    int _1662 = abs(_1380);
    float _1664 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1652);
    float _1666 = _1632 + _1654;
    float _1668 = fma(_1658, _1578, _1578);
    float _1670 = _1660 * 0.15915493667125701904296875;
    float _1672 = in.m_59.x;
    float _1674 = _718 + (-0.5);
    float _1676 = float(_1600);
    float _1678 = fma(_1458, _1288, _1554);
    float _1680 = float(_1662);
    float _1682 = fma(_1004, _1658, _1004);
    float _1684 = abs(_1664);
    float _1686 = abs(_1666);
    float _1688 = precise::max(_1684, _1686);
    float _1690 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1668);
    float _1692 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1678);
    float _1694 = _1680 * _1676;
    bool _1696 = _1688 >= 16.0;
    float _1698 = fma(_1682, _1008, _1690);
    float _1700 = in.m_67.x;
    float _1702 = in.m_67.y;
    float _1704 = _1694 * (-2.0);
    float _1706 = _906 + (-0.5);
    float _1708 = _1698 * 0.15915493667125701904296875;
    float _1710 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1712 = fma(_1574, _1704, _1574);
    float _1714 = fma(_1010, _1704, _1010);
    float _1716 = sqrt(_1656);
    float _1718 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1710);
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1712);
    float _1722 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1724 = _1664;
    float _1726 = _1666;
    if (_1696)
    {
        float _1728 = _1664 * 0.0625;
        _1724 = _1728;
    }
    float _1730 = _1724;
    float _1732 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1718);
    float _1734 = fma(_1714, _1008, _1720);
    float _1736 = _1692 * _1672;
    if (_1696)
    {
        float _1738 = _1666 * 0.0625;
        _1726 = _1738;
    }
    float _1740 = _1726;
    float _1742 = _1670 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = abs(_1732);
    float _1748 = -_1746;
    float _1750 = _1748 + 1.0;
    float _1752 = abs(_1730);
    bool _1754 = _1752 != 0.0;
    bool _1756 = isnan(_1752);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    float _1764 = in.m_67.z;
    float _1766 = abs(_1740);
    bool _1768 = _1766 == 0.0;
    float _1770 = _1736 * _1750;
    float _1772 = abs(_1740);
    bool _1774 = _1772 == 0.0;
    bool _1776 = !_1762;
    bool _1778 = _1774 && _1776;
    float _1780 = _1446 * _1716;
    float _1782 = _1670 * 6.283185482025146484375;
    float _1784 = cos(_1782);
    float _1786 = -_1770;
    float _1788 = _1786 + _1700;
    float _1790 = _1780 * _1722;
    float _1792 = _1708 * 6.283185482025146484375;
    float _1794 = sin(_1792);
    float _1796 = _1734 * 0.15915493667125701904296875;
    int _1798 = as_type<int>(_1788);
    if (_1778)
    {
        bool _1800 = as_type<int>(_1740) >= 0;
        _1438 = _1800;
    }
    bool _1802 = _1438;
    float _1804 = _1708 * 6.283185482025146484375;
    float _1806 = cos(_1804);
    float _1808 = _1796 * 6.283185482025146484375;
    float _1810 = sin(_1808);
    float _1812 = -_1770;
    float _1814 = _1812 + _1702;
    float _1816 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1818 = _1784 * _1794;
    float _1820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1788);
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1814);
    float _1824 = _1780 * _1816;
    int _1826 = as_type<int>(_1822);
    int _1828 = _1802 ? (-1) : 0;
    if (_1778)
    {
        int _1830 = _1802 ? 0 : 1078530011;
        _1798 = _1830;
    }
    int _1832 = _1798;
    float _1834 = _1744 * _1806;
    float _1836 = _1796 * 6.283185482025146484375;
    float _1838 = cos(_1836);
    float _1840 = -_1818;
    float _1842 = fma(_1810, _1834, _1840);
    float _1844 = -_1834;
    float _1846 = fma(_1810, _1818, _1844);
    float _1848 = _1820 * _1824;
    float _1850 = _1822 * _1790;
    float _1852 = _1528 * _1528;
    if (_1778)
    {
        int _1854 = int(0x80000000) & as_type<int>(_1730);
        int _1856 = _1832 | _1854;
        _1826 = _1856;
    }
    int _1858 = _1826;
    bool _1860 = !_1762;
    bool _1862 = _1860 && _1768;
    int _1864 = _1858;
    float _1866 = as_type<float>(_1858);
    if (!_1862)
    {
        float _1868 = abs(_1730);
        bool _1870 = _1868 != as_type<float>(0x7f800000u /* inf */);
        bool _1872 = isnan(_1868);
        bool _1874 = _1870 || _1872;
        bool _1876 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1878 = _1874 || _1876;
        float _1880 = abs(_1740);
        bool _1882 = _1880 == as_type<float>(0x7f800000u /* inf */);
        float _1884 = abs(_1740);
        bool _1886 = _1884 == as_type<float>(0x7f800000u /* inf */);
        bool _1888 = !_1878;
        bool _1890 = _1886 && _1888;
        if (_1890)
        {
            bool _1892 = as_type<int>(_1740) >= 0;
            _1828 = _1892 ? (-1) : 0;
        }
        int _1894 = _1828;
        if (_1890)
        {
            _1864 = 1075235812;
        }
        int _1896 = _1864;
        int _1898 = _1896;
        if (_1890)
        {
            int _1900 = ~_1894;
            int _1902 = (_1900 != 0) ? _1896 : 1061752795;
            _1898 = _1902;
        }
        int _1904 = _1898;
        float _1906 = as_type<float>(_1904);
        if (_1890)
        {
            int _1908 = int(0x80000000) & as_type<int>(_1730);
            int _1910 = _1904 | _1908;
            _1906 = as_type<float>(_1910);
        }
        float _1912 = _1906;
        bool _1914 = !_1878;
        bool _1916 = _1914 && _1882;
        _1866 = _1912;
        if (!_1916)
        {
            float _1918 = abs(_1730);
            float _1920 = abs(_1740);
            float _1922 = precise::max(_1918, _1920);
            float _1924 = abs(_1730);
            float _1926 = abs(_1740);
            float _1928 = precise::min(_1924, _1926);
            float _1930 = 1.0 / _1922;
            float _1932 = abs(_1730);
            float _1934 = abs(_1740);
            bool _1936 = _1932 > _1934;
            bool _1938 = as_type<int>(_1740) >= 0;
            float _1940 = _1928 * _1930;
            float _1942 = _1940 * _1940;
            float _1944 = _1942 + 11.33538818359375;
            float _1946 = fma(_1942, _1944, 28.84246826171875);
            float _1948 = fma(_1942, _1946, 19.6966705322265625);
            float _1950 = fma(_1942, -0.82336294651031494140625, -5.674867153167724609375);
            float _1952 = fma(_1942, _1950, -6.565555095672607421875);
            float _1954 = 1.0 / _1948;
            float _1956 = _1942 * _1952;
            float _1958 = abs(_1730);
            float _1960 = abs(_1740);
            float _1962 = _1958 + _1960;
            int _1964 = as_type<int>(_1730) & int(0x80000000);
            float _1966 = _1940 * _1956;
            bool _1968 = _1962 > as_type<float>(0x7f800000u /* inf */);
            bool _1970 = isnan(_1962);
            bool _1972 = _1968 || _1970;
            bool _1974 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1976 = _1972 || _1974;
            float _1978 = fma(_1966, _1954, _1940);
            float _1980 = _1978;
            _1866 = _1962;
            if (_1936)
            {
                float _1982 = -_1978;
                float _1984 = _1982 + 1.57079637050628662109375;
                _1980 = _1984;
            }
            float _1986 = _1980;
            int _1988 = as_type<int>(_1986);
            if (!_1938)
            {
                float _1990 = -_1986;
                float _1992 = _1990 + 3.1415927410125732421875;
                _1988 = as_type<int>(_1992);
            }
            int _1994 = _1988;
            if (!_1976)
            {
                int _1996 = _1964 | _1994;
                _1866 = as_type<float>(_1996);
            }
        }
    }
    float _1998 = _1866;
    float _2000 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2002 = fma(_1536, _1536, _1852);
    float _2004 = _1744 * _1794;
    float _2006 = _1784 * _1806;
    float _2008 = _1838 * _1850;
    float _2010 = _1780 * _2000;
    float _2012 = fma(_1544, _1544, _2002);
    float _2014 = _1794 * _1838;
    float _2016 = _1806 * _1838;
    float _2018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1764);
    float _2020 = fma(_1810, _2006, _2004);
    float _2022 = _1784 * _2008;
    float _2024 = _1998 * (-0.15915493667125701904296875);
    float _2026 = _2018 * _2010;
    float _2028 = -_1850;
    float _2030 = _1810 * _2028;
    float _2032 = fma(_2020, _1848, _2022);
    float _2034 = rsqrt(_2012);
    float _2036 = _1744 * _2008;
    float _2038 = fma(_2016, _1848, _2030);
    float _2040 = fma(_1846, _2026, _2032);
    float _2042 = fma(_1810, _2004, _2006);
    float _2044 = fma(_1842, _1848, _2036);
    float _2046 = fma(_2014, _2026, _2038);
    float _2048 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2050 = _2024 * 6.283185482025146484375;
    float _2052 = cos(_2050);
    float _2054 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2056 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2058 = fma(_2042, _2026, _2044);
    float _2060 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2048);
    float _2062 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2054);
    float _2064 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2056);
    float _2066 = _2024 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    float _2070 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2060);
    float _2072 = _1536 * _2034;
    float _2074 = _1544 * _2034;
    float _2076 = _1528 * _2034;
    float _2078 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2062);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2082 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2064);
    float _2084 = -_2052;
    float _2086 = _2084 + 1.0;
    float _2088 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2090 = _2074 * _2074;
    float _2092 = _2072 * _2086;
    float _2094 = _2076 * _2086;
    float _2096 = fma(_2086, _2090, _2052);
    float _2098 = _2074 * _2068;
    float _2100 = _2072 * _2068;
    float _2102 = _2076 * _2068;
    float _2104 = fma(_2072, _2092, _2052);
    float _2106 = -_2098;
    float _2108 = fma(_2076, _2092, _2106);
    float _2110 = fma(_2074, _2094, _2100);
    float _2112 = fma(_2076, _2094, _2052);
    float _2114 = fma(_2076, _2092, _2098);
    float _2116 = _2088 * _2108;
    float _2118 = -_2102;
    float _2120 = fma(_2074, _2092, _2118);
    float _2122 = _2088 * _2110;
    float _2124 = fma(_2074, _2092, _2102);
    float _2126 = fma(_2080, _2104, _2116);
    float _2128 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2130 = fma(_2080, _2120, _2122);
    float _2132 = _2088 * _2112;
    float _2134 = -_2100;
    float _2136 = fma(_2074, _2094, _2134);
    float _2138 = fma(_2128, _2124, _2126);
    float _2140 = fma(_2128, _2096, _2130);
    float _2142 = fma(_2080, _2114, _2132);
    float _2144 = _1246 + _2138;
    float _2146 = _1280 + _2140;
    float _2148 = fma(_2128, _2136, _2142);
    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2152 = _2144 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2156 = _2146 + _2154;
    float _2158 = _1216 + _2148;
    float _2160 = _2152 * _2152;
    float _2162 = _2156 * _2156;
    float _2164 = _2160 + _2162;
    float _2166 = sqrt(_2164);
    bool _2168 = _2166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = _2148;
    float _2172 = _2092;
    float _2174 = _2132;
    float _2176 = _2098;
    float _2178 = _2162;
    if (!_2168)
    {
        _2170 = _2160;
    }
    float _2180 = _2170;
    float _2182 = _2180;
    if (!_2168)
    {
        _2172 = _2144;
    }
    float _2184 = _2172;
    float _2186 = _2184;
    if (!_2168)
    {
        _2174 = _2146;
    }
    float _2188 = _2174;
    float _2190 = _2188;
    if (!_2168)
    {
        _2176 = _2158;
    }
    float _2192 = _2176;
    bool _2194 = !_2168;
    float _2196 = _2192;
    if (!_2194)
    {
        float _2198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2202 = _2166 + _2200;
        float _2204 = rsqrt(_2164);
        float _2206 = _2202 * _2198;
        float _2208 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2210 = _2206 * 0.15915493667125701904296875;
        float _2212 = _2210 * 6.283185482025146484375;
        float _2214 = sin(_2212);
        float _2216 = _2210 * 6.283185482025146484375;
        float _2218 = cos(_2216);
        float _2220 = fma(_2214, _2208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2222 = _2204 * _2220;
        float _2224 = _2218 + (-1.0);
        float _2226 = fma(_2152, _2222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2228 = fma(_2156, _2222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2230 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2234 = _2226 + _2232;
        float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2238 = _2228 + _2236;
        float _2240 = fma(_2158, _2218, _2230);
        float _2242 = _2234 * _2234;
        float _2244 = _2238 * _2238;
        _2196 = _2240;
        _2182 = _2242;
        _2178 = _2244;
        _2186 = _2226;
        _2190 = _2228;
    }
    float _2246 = _2196;
    float _2248 = _2182;
    float _2250 = _2178;
    float _2252 = _2186;
    float _2254 = _2190;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2258 = _2246 + _2256;
    out.m_55.x = _672;
    out.m_55.y = _674;
    out.m_55.z = _676;
    out.m_55.w = _664;
    float _2260 = fma(_2258, _2258, _2248);
    float _2262 = _2260 + _2250;
    float _2264 = sqrt(_2262);
    bool _2266 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2268 = isnan(_2264);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2274 = _2270 || _2272;
    float _2276 = _2248;
    if (!_2274)
    {
        _2276 = 1.0;
    }
    float _2278 = _2276;
    bool _2280 = !_2274;
    float _2282 = _2278;
    if (!_2280)
    {
        bool _2284 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2286 = isnan(_2264);
        bool _2288 = _2284 || _2286;
        bool _2290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2292 = _2288 || _2290;
        if (!_2292)
        {
            float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2296 = _2264 + _2294;
            float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2300 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2298;
            float _2302 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2306 = 1.0 / _2300;
            float _2308 = _2296 * _2306;
            float _2310 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2282 = _2310;
            _2312 = true;
        }
        else
        {
            bool _2314 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2316 = isnan(_2264);
            bool _2318 = _2314 || _2316;
            bool _2320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2322 = _2318 || _2320;
            if (!_2322)
            {
                float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2326 = _2264 + _2324;
                float _2328 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2330 = _2328 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2332 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2334 = _2332 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2336 = 1.0 / _2330;
                float _2338 = _2326 * _2336;
                float _2340 = fma(_2338, _2334, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2282 = _2340;
                _2312 = true;
            }
            else
            {
                _2282 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2312 = false;
    float _2342 = _2282;
    float _2344 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2346 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2348 = _2252 + _2346;
    float _2350 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2352 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan(0.5);
    bool _2360 = _2356 || _2358;
    float _2362 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2344);
    float _2364 = fma(_2348, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2366 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2368 = _2246 + _2366;
    float _2370 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2372 = _2254 + _2370;
    float _2374 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2362);
    float _2376 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2350);
    float _2378 = -_1478;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2364);
    float _2382 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2384 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2376);
    float _2386 = fma(_2368, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2388 = fma(_2372, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2390 = 1.0 / _2382;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2394 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.5);
    bool _2402 = _2398 || _2400;
    float _2404 = -_1476;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2408 = -_1498;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2388);
    float _2412 = _2392 + _2382;
    float _2414 = _2392;
    float _2416 = _2342;
    float _2418 = _2406;
    float _2420 = _2410;
    if (_2360)
    {
        _2414 = _2380;
    }
    float _2422 = _2414;
    float _2424 = _2422;
    float _2426 = _2390;
    if (!_2360)
    {
        float _2428 = _1506 * _1506;
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2432 = -_1280;
        float _2434 = _2432 + _2388;
        float _2436 = fma(_1516, _1516, _2428);
        float _2438 = fma(_1526, _1526, _2436);
        float _2440 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2442 = sqrt(_2438);
        float _2444 = 1.0 / _1780;
        float _2446 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2448 = precise::min(_2442, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2450 = _2448 * _2430;
        float _2452 = _2450 * _2444;
        float _2454 = -_1246;
        float _2456 = _2454 + _2364;
        float _2458 = -_1216;
        float _2460 = _2458 + _2386;
        float _2462 = _2446 * _2452;
        float _2464 = _2434 * _2452;
        float _2466 = fma(_2456, _2462, _1502);
        float _2468 = fma(_2460, _2462, _1486);
        float _2470 = fma(_2446, _2464, _1512);
        _2416 = _2446;
        _2418 = _2468;
        _2424 = _2466;
        _2420 = _2470;
    }
    float _2472 = _2416;
    float _2474 = _2418;
    float _2476 = _2424;
    float _2478 = _2420;
    float _2480 = _2472;
    if (_2402)
    {
        _2480 = 1.0;
    }
    float _2482 = _2480;
    float _2484 = _2412 * _2390;
    float _2486 = _2484 * 0.5;
    float _2488 = _2482;
    float _2490 = _2486;
    if (!_2402)
    {
        float _2492 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2496 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2494);
        float _2498 = _2492 * 0.15915493667125701904296875;
        float _2500 = _2498 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        float _2504 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2506 = _2504 * 0.15915493667125701904296875;
        float _2508 = _2498 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = 1.0 / _2502;
        float _2514 = _2506 * 6.283185482025146484375;
        float _2516 = cos(_2514);
        float _2518 = _2510 * _2512;
        float _2520 = 1.0 / _2496;
        float _2522 = _2516 * _2518;
        float _2524 = _2506 * 6.283185482025146484375;
        float _2526 = sin(_2524);
        float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2530 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2528;
        float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2534 = _2520 * _2532;
        float _2536 = 1.0 / _2522;
        float _2538 = 1.0 / _2530;
        float _2540 = _2526 * _2536;
        float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2544 = fma(_2540, _2534, _2542);
        float _2546 = _2544 * _2538;
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        _2426 = _2506;
        _2488 = _2548;
    }
    float _2550 = _2426;
    float _2552 = _2488;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2556 = _2474 + _2554;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2560 = _2476 + _2558;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2478 + _2562;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2576 = _2560 * _2574;
    float _2578 = _2564 * _2574;
    float _2580 = _2576 * _2576;
    float _2582 = _2578 * _2578;
    float _2584 = _2580 + _2582;
    float _2586 = sqrt(_2584);
    bool _2588 = _2586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2592 = _2586 + _2590;
    float _2594 = _2572;
    float _2596 = _2550;
    float _2598 = _2592;
    float _2600 = _2556;
    float _2602 = _2574;
    float _2604 = _2576;
    if (_2588)
    {
        float _2606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2594 = _2606;
    }
    float _2608 = _2594;
    if (_2588)
    {
        float _2610 = rsqrt(_2584);
        _2596 = _2610;
    }
    float _2612 = _2596;
    float _2614 = _2612;
    if (_2588)
    {
        float _2616 = _2592 * _2608;
        _2598 = _2616;
    }
    float _2618 = _2598;
    if (_2588)
    {
        float _2620 = _2618 * 0.15915493667125701904296875;
        _2490 = _2620;
    }
    float _2622 = _2490;
    float _2624 = _2608;
    if (_2588)
    {
        float _2626 = _2622 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2624 = _2628;
    }
    float _2630 = _2624;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2634 = precise::max(0.0, _2632);
    float _2636 = _2564;
    float _2638 = _2634;
    if (_2588)
    {
        float _2640 = _2622 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        _2636 = _2642;
    }
    float _2644 = _2636;
    float _2646 = -_2574;
    float _2648 = -_2634;
    float _2650 = fma(_2556, _2646, _2648);
    if (!_2588)
    {
        _2600 = _2580;
    }
    float _2652 = _2600;
    float _2654 = _2652;
    if (_2588)
    {
        float _2656 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2638 = _2656;
    }
    float _2658 = _2638;
    float _2660 = sqrt(_2570);
    float _2662 = _2630;
    float _2664 = _2658;
    if (_2588)
    {
        float _2666 = fma(_2630, _2658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2662 = _2666;
    }
    float _2668 = _2662;
    float _2670 = _2668;
    float _2672 = _2644;
    if (_2588)
    {
        float _2674 = _2644 + (-1.0);
        _2664 = _2674;
    }
    float _2676 = _2664;
    float _2678 = _2676;
    if (_2588)
    {
        float _2680 = _2612 * _2668;
        _2602 = _2680;
    }
    float _2682 = _2602;
    if (!_2588)
    {
        _2614 = _2650;
    }
    float _2684 = _2614;
    float _2686 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2688 = _2684;
    if (_2588)
    {
        float _2690 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2690;
    }
    float _2692 = _2670;
    if (_2588)
    {
        float _2694 = _2576 * _2682;
        _2604 = _2694;
    }
    float _2696 = _2604;
    if (!_2588)
    {
        _2678 = _2578;
    }
    float _2698 = _2678;
    float _2700 = _2698;
    if (_2588)
    {
        float _2702 = _2578 * _2682;
        _2700 = _2702;
    }
    float _2704 = _2700;
    if (_2588)
    {
        float _2706 = fma(_2650, _2644, _2692);
        _2688 = _2706;
    }
    float _2708 = _2688;
    if (_2588)
    {
        float _2710 = _2696 * _2696;
        _2654 = _2710;
    }
    float _2712 = _2654;
    if (!_2588)
    {
        _2672 = _2582;
    }
    float _2714 = _2672;
    float _2716 = _2714;
    if (_2588)
    {
        float _2718 = _2704 * _2704;
        _2716 = _2718;
    }
    float _2720 = _2716;
    float _2722 = fma(_2708, _2708, _2712);
    float _2724 = _2722 + _2720;
    float _2726 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2730 = fma(_2660, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2728);
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2738 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2726);
    float _2740 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2742 = rsqrt(_2724);
    float _2744 = -_2732;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2738);
    float _2750 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2740);
    float _2752 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2734);
    float _2754 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2686);
    float _2756 = _2748 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2758 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2750);
    float _2760 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2752);
    float _2762 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2754);
    float _2764 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2766 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2768 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2770 = abs(_2746);
    float _2772 = log2(_2770);
    float _2774 = -_2764;
    float _2776 = fma(_2774, _2736, 1.0);
    float _2778 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2780 = _2742 * _2696;
    float _2782 = _2762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2784 = _2742 * _2708;
    float _2786 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2778);
    float _2788 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2790 = _2742 * _2704;
    float _2792 = log2(_2776);
    float _2794 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2786);
    float _2796 = -_2788;
    float _2798 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2796);
    float _2800 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2802 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2794);
    float _2804 = -_2790;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2798);
    float _2808 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2810 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2812 = 1.0 / _2802;
    float _2814 = fma(_2806, -0.5, 0.5);
    float _2816 = fma(_2806, 0.5, 0.5);
    float _2818 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2810);
    float _2820 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2800);
    float _2822 = _2784 + 1.0;
    float _2824 = fma(_2816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2826 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2818);
    float _2828 = exp2(_2808);
    float _2830 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2820);
    float _2832 = fma(_2816, _2824, -0.212114393711090087890625);
    float _2834 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2826);
    float _2836 = _2792 * 0.693147182464599609375;
    float _2838 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2830);
    float _2840 = fma(_2816, _2832, 1.570728778839111328125);
    float _2842 = sqrt(_2814);
    float _2844 = _2834 * _2812;
    float _2846 = _2838 * _2812;
    float _2848 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2850 = fma(_2844, 0.5, 0.5);
    float _2852 = fma(_2846, -0.5, 0.5);
    float _2854 = -_2784;
    float _2856 = fma(_2828, _2822, _2854);
    float3 _7355 = float3(_2850, _2852, _2848);
    float _2858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7355, float3(0.0), isnan(_7355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7355, float3(0.0), isnan(_7355)), level(0.0)).x;
    float3 _7366 = float3(_2850, _2852, _2848);
    float4 _2861 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7366, float3(0.0), isnan(_7366)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7366, float3(0.0), isnan(_7366)), level(0.0)).xyzw;
    float _2863 = _2861.x;
    float _2865 = _2861.y;
    float _2867 = _2861.z;
    float _2869 = _2861.w;
    float _2871 = fma(_2856, 0.5, 0.5);
    float _2873 = _2842 * 0.636619746685028076171875;
    float _2875 = -_2840;
    float _2877 = fma(_2873, _2875, 1.0);
    float2 _7393 = float2(_2877, _2871);
    float3 _2881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7393, float2(0.0), isnan(_7393)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7393, float2(0.0), isnan(_7393)), level(0.0)).xyz;
    float _2883 = _2881.x;
    float _2885 = _2881.y;
    float _2887 = _2881.z;
    float _2889 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2891 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2893 = _2552 > 0.0;
    bool _2895 = isnan(_2552);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(0.0);
    bool _2901 = _2897 || _2899;
    float _2903 = _2552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2905 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2891);
    float _2907 = exp2(_2889);
    float _2909 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2905);
    float _2911 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2913 = _2911 + _2802;
    out.gl_Position.x = _2834;
    out.gl_Position.y = _2838;
    out.gl_Position.z = _2911;
    out.gl_Position.w = _2802;
    float _2915 = _2913 * 0.5;
    float _2917 = -_2907;
    float _2919 = _2917 + 1.0;
    float _2921 = _2903 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2923 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2915;
    out.m_69.w = _2802;
    out.m_47.x = _2921;
    float _2925 = _2923 * _2858;
    float _2927 = -_2923;
    float _2929 = _2927 + 1.0;
    float _2931 = _2869 * _2925;
    float _2933 = _2887 * _2925;
    float _2935 = fma(_2883, _2931, _2863);
    float _2937 = fma(_2885, _2931, _2865);
    float _2939 = _2869 * _2929;
    float _2941 = fma(_2869, _2933, _2867);
    out.m_71.x = _2935;
    out.m_71.y = _2937;
    out.m_71.z = _2941;
    out.m_71.w = _2939;
    if (_2901)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2943;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2312 = false;
    bool _704 = false;
    bool _402 = false;
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
        float _3000 = as_type<float>(_106);
        out.gl_Position.z = _3000;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3070 = as_type<float>(_144);
        out.gl_Position.z = _3070;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _370 = _364 * _342;
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _374 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _368);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _376);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _372);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _414 = _410 + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _418 = _410 + _416;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _438 = _410 + _436;
    float _440 = 1.0 / _426;
    float _442 = 1.0 / _434;
    bool _444 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _446 = isnan(_410);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _458 = -_454;
    float _460 = _458 + 1.0;
    float _462 = 1.0 / _430;
    float _464 = 1.0 / _422;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _468 = _410 + _466;
    float _470 = _414 * _442;
    bool _472 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _474 = isnan(_410);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _484;
    float _488 = _468 * _440;
    bool _490 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _492 = isnan(_410);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _418 * _462;
    bool _504 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _506 = isnan(_410);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = -_500;
    float _518 = _516 + 1.0;
    float _520 = fma(_486, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _522 = _482 * _518;
    bool _524 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _526 = isnan(_410);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = -_482;
    float _542 = _540 + 1.0;
    float _544 = _514 * _460;
    float _546 = _438 * _464;
    float _548 = -_514;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _556;
    float _560 = _454 * _542;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = _534 * _550;
    float _572 = fma(_554, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _574 = fma(_558, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = fma(_538, _470, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _578 = fma(_564, _470, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _580 = fma(_568, _470, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _582 = _520 * _570;
    float _584 = -_534;
    float _586 = _584 + 1.0;
    float _588 = _572 * _570;
    float _590 = _574 * _570;
    float _592 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].x, _582);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _594;
    float _598 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].y, _588);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _604;
    float _608 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _610 = fma(_576, _544, _592);
    float _612 = fma(_578, _544, _598);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _622 = fma(_602, _546, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _624 = fma(_596, _546, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _626 = fma(_606, _546, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _632 = fma(_580, _544, _608);
    float _634 = fma(_616, _488, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _636 = fma(_620, _488, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _638 = fma(_630, _488, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _640 = fma(_622, _560, _610);
    float _642 = fma(_624, _560, _612);
    float _644 = fma(_626, _560, _632);
    float _646 = fma(_634, _522, _640);
    float _648 = fma(_636, _522, _642);
    float _650 = fma(_638, _522, _644);
    float _652 = in.m_51.x;
    float _654 = in.m_51.y;
    float _656 = in.m_51.z;
    float _658 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].x, _646);
    float _660 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].y, _648);
    float _662 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[111].z, _650);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _666 = _658 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _670 = _662 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _672;
    out.m_55.y = _674;
    out.m_55.z = _676;
    out.m_55.w = _664;
    float _678 = _380 * _656;
    float _680 = _378 * _654;
    float _682 = _374 * _652;
    bool _684 = !_456;
    float _702;
    if (!_684)
    {
        float _686 = in.m_53.x;
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        float _706 = float(_90);
        float _708 = 1.0 / _706;
        float _710 = _124 * _708;
        _702 = _710;
    }
    _704 = false;
    float _712 = _702;
    float _714 = in.m_57.y;
    float _716 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _718 = in.m_53.y;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _722 = _720 != 0;
    float _724 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _716);
    float _726 = abs(_262);
    float _728 = abs(_266);
    float _730 = precise::max(_726, _728);
    float _732 = in.m_59.w;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _740 = _738 != 0;
    float _742 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _744 = log2(_742);
    bool _746 = _730 >= 16.0;
    float _748 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _750 = in.m_57.x;
    float _752 = 1.0 / _736;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _758 = -_714;
    float _760 = _758 + 1.0;
    float _762 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _748);
    float _764 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _766 = 1.0 / _756;
    bool _768 = _718 > 0.5;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    out.m_61.w = _732;
    float _774 = _714;
    bool _776 = _746;
    if (_722)
    {
        float _778 = _768 ? _760 : _714;
        _774 = _778;
    }
    float _780 = _774;
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _262 * 0.0625;
    float _786 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _764);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _796 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _798 = _266 * 0.0625;
    float _800 = _746 ? _784 : _262;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _802;
    float _806 = 1.0 / _772;
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _786);
    float _810 = in.m_53.x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _816 = _744 * _124;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _818;
    float _822 = 1.0 / _790;
    float _824 = _746 ? _798 : _266;
    float _826 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _796);
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_740)
    {
        float _834 = in.m_53.x;
        _832 = _834;
    }
    float _836 = _832;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _838;
    float _842 = _814 * _766;
    float _844 = 1.0 / _794;
    float _846 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _724);
    float _848 = _804 * _752;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _850;
    float _854 = abs(_800);
    bool _856 = _854 != 0.0;
    bool _858 = isnan(_854);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _874 = 1.0 / _830;
    float _876 = _852 * _806;
    float _878 = abs(_824);
    bool _880 = _878 == 0.0;
    bool _882 = !_864;
    bool _884 = _880 && _882;
    float _886 = _868 * _822;
    bool _888 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _890 = isnan(1.0);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _896 = _892 || _894;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _900 = 1.0 + _898;
    float _902 = _840 * _844;
    float _904 = 1.0 / _872;
    float _906 = in.m_53.z;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _912 = _836 > 0.5;
    bool _914 = _912 && _740;
    float _916 = _718 * 2.0;
    float _918 = 0.0;
    int _920 = _884 ? (-1) : 0;
    if (_740)
    {
        _918 = _750;
    }
    float _922 = _918;
    float _924 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _762);
    float _926 = exp2(_816);
    bool _928 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _936 = _932 || _934;
    float _938 = _910 * _874;
    float _940 = _922;
    if (_884)
    {
        bool _942 = as_type<int>(_824) >= 0;
        _776 = _942;
    }
    bool _944 = _776;
    float _946 = _820 * _904;
    float _948 = _810 + _718;
    float _950 = _810 * 2.0;
    float _952 = 1.0 / _900;
    if (_914)
    {
        float _954 = -_922;
        float _956 = _954 + 1.0;
        _940 = _956;
    }
    float _958 = _940;
    float _960 = _948 + (-1.0);
    float _962 = abs(_824);
    bool _964 = _962 == 0.0;
    float _966 = -_926;
    float _968 = _966 + 1.0;
    float _970 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _972 = _906 * 2.0;
    float _974 = floor(_950);
    float _976 = _810 + _906;
    float _978 = _718 + _906;
    float _980 = _936 ? _968 : 0.0;
    int _982 = 0;
    float _984 = _978;
    if (_884)
    {
        int _986 = _944 ? 0 : 1078530011;
        _982 = _986;
    }
    int _988 = _982;
    float _990 = _978 + (-1.0);
    int _992 = _988;
    if (!_740)
    {
        _984 = _750;
    }
    float _994 = _984;
    float _996 = floor(_916);
    float _998 = _976 + (-1.0);
    float _1000 = _994;
    if (_740)
    {
        _1000 = _958;
    }
    float _1002 = _1000;
    float _1004 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (_896)
    {
        float _1006 = _980 * _952;
        _126 = _1006;
    }
    float _1008 = _126;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1012 = floor(_972);
    bool _1014 = _974 > 0.0;
    bool _1016 = _974 >= 0.0;
    bool _1018 = isnan(_974);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(0.0);
    bool _1024 = _1020 || _1022;
    if (_884)
    {
        int _1026 = int(0x80000000) & as_type<int>(_800);
        int _1028 = _988 | _1026;
        _992 = _1028;
    }
    int _1030 = _992;
    bool _1032 = !_864;
    bool _1034 = _1032 && _964;
    int _1036 = _1030;
    float _1038 = as_type<float>(_1030);
    if (!_1034)
    {
        float _1040 = abs(_800);
        bool _1042 = _1040 != as_type<float>(0x7f800000u /* inf */);
        bool _1044 = isnan(_1040);
        bool _1046 = _1042 || _1044;
        bool _1048 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1050 = _1046 || _1048;
        float _1052 = abs(_824);
        bool _1054 = _1052 == as_type<float>(0x7f800000u /* inf */);
        float _1056 = abs(_824);
        bool _1058 = _1056 == as_type<float>(0x7f800000u /* inf */);
        bool _1060 = !_1050;
        bool _1062 = _1058 && _1060;
        if (_1062)
        {
            bool _1064 = as_type<int>(_824) >= 0;
            _920 = _1064 ? (-1) : 0;
        }
        int _1066 = _920;
        if (_1062)
        {
            _1036 = 1075235812;
        }
        int _1068 = _1036;
        int _1070 = _1068;
        if (_1062)
        {
            int _1072 = ~_1066;
            int _1074 = (_1072 != 0) ? _1068 : 1061752795;
            _1070 = _1074;
        }
        int _1076 = _1070;
        float _1078 = as_type<float>(_1076);
        if (_1062)
        {
            int _1080 = int(0x80000000) & as_type<int>(_800);
            int _1082 = _1076 | _1080;
            _1078 = as_type<float>(_1082);
        }
        float _1084 = _1078;
        bool _1086 = !_1050;
        bool _1088 = _1086 && _1054;
        _1038 = _1084;
        if (!_1088)
        {
            float _1090 = abs(_800);
            float _1092 = abs(_824);
            float _1094 = precise::max(_1090, _1092);
            float _1096 = abs(_800);
            float _1098 = abs(_824);
            float _1100 = _1096 + _1098;
            float _1102 = abs(_800);
            float _1104 = abs(_824);
            float _1106 = precise::min(_1102, _1104);
            float _1108 = 1.0 / _1094;
            float _1110 = abs(_800);
            float _1112 = abs(_824);
            bool _1114 = _1110 > _1112;
            bool _1116 = as_type<int>(_824) >= 0;
            bool _1118 = _1100 > as_type<float>(0x7f800000u /* inf */);
            bool _1120 = isnan(_1100);
            bool _1122 = _1118 || _1120;
            bool _1124 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1126 = _1122 || _1124;
            int _1128 = as_type<int>(_800) & int(0x80000000);
            float _1130 = _1106 * _1108;
            float _1132 = _1130 * _1130;
            float _1134 = _1132 + 11.33538818359375;
            float _1136 = fma(_1132, _1134, 28.84246826171875);
            float _1138 = fma(_1132, _1136, 19.6966705322265625);
            float _1140 = fma(_1132, -0.82336294651031494140625, -5.674867153167724609375);
            float _1142 = fma(_1132, _1140, -6.565555095672607421875);
            float _1144 = 1.0 / _1138;
            float _1146 = _1132 * _1142;
            float _1148 = _1130 * _1146;
            float _1150 = fma(_1148, _1144, _1130);
            float _1152 = _1150;
            _1038 = _1100;
            if (_1114)
            {
                float _1154 = -_1150;
                float _1156 = _1154 + 1.57079637050628662109375;
                _1152 = _1156;
            }
            float _1158 = _1152;
            int _1160 = as_type<int>(_1158);
            if (!_1116)
            {
                float _1162 = -_1158;
                float _1164 = _1162 + 3.1415927410125732421875;
                _1160 = as_type<int>(_1164);
            }
            int _1166 = _1160;
            if (!_1126)
            {
                int _1168 = _1128 | _1166;
                _1038 = as_type<float>(_1168);
            }
        }
    }
    float _1170 = _1038;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1182 = _1180 != 0;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1186 = _712 + _1184;
    bool _1188 = _996 > 0.0;
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1192 = _712 + _1190;
    bool _1194 = _996 >= 0.0;
    bool _1196 = isnan(_996);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = fma(_848, _1186, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1206 = _1024 ? 0 : 1;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1210 = _712 + _1208;
    bool _1212 = !_1178;
    int _1214 = _1212 ? 0 : 1;
    float _1216 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1218 = _1012 > 0.0;
    float _1220 = fma(_842, _1192, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1222 = _1012 >= 0.0;
    bool _1224 = isnan(_1012);
    bool _1226 = _1222 || _1224;
    bool _1228 = isnan(0.0);
    bool _1230 = _1226 || _1228;
    float _1232 = fma(_876, _1210, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1234 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1236 = isnan(_712);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    float _1246 = _826 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1248 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1250 = isnan(_712);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1262 = _1216 + _1260;
    bool _1264 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1266 = isnan(_712);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = -_1244;
    float _1278 = _1276 + 1.0;
    float _1280 = _846 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1282 = -_1258;
    float _1284 = _1282 + 1.0;
    float _1286 = _1262 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1288 = _1258 * _1278;
    bool _1290 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1292 = isnan(_712);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1304 = _1246 + _1302;
    float _1306 = -_1274;
    float _1308 = _1306 + 1.0;
    bool _1310 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1312 = isnan(_712);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1280 + _1322;
    float _1326 = -_1300;
    float _1328 = _1326 + 1.0;
    float _1330 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1286);
    float _1332 = _1300 * _1308;
    bool _1334 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1336 = isnan(_712);
    bool _1338 = _1334 || _1336;
    bool _1340 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1342 = _1338 || _1340;
    float _1344 = float(_1342);
    float _1346 = _1320 * _1328;
    float _1348 = -_1320;
    float _1350 = _1348 + 1.0;
    float _1352 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1330);
    float _1354 = _1262 * _1262;
    float _1356 = -_1344;
    float _1358 = _1356 + 1.0;
    float _1360 = _1344 * _1350;
    bool _1362 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1364 = isnan(_712);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1370 = _1366 || _1368;
    float _1372 = float(_1370);
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1376 = _712 + _1374;
    bool _1378 = !_1182;
    int _1380 = _1378 ? 0 : 1;
    float _1382 = _1274 * _1284;
    bool _1384 = _1352 >= 0.0;
    float _1386 = fma(_1304, _1304, _1354);
    float _1388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1390 = fma(_886, _1376, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1392 = _712 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1394 = isnan(_712);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1372 * _1358;
    float _1406 = _780 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1408 = -_1372;
    float _1410 = _1408 + 1.0;
    float _1412 = fma(_1324, _1324, _1386);
    float _1414 = _1002 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1418 = _1402 * _1410;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1422 = _712 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1426 = _712 + _1424;
    float _1428 = -_1402;
    float _1430 = _1428 + 1.0;
    float _1432 = _1204 * _1418;
    float _1434 = _1204;
    float _1436 = _1404;
    bool _1438 = _1202;
    if (_1384)
    {
        _1434 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1440 = _1434;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1444 = _712 + _1442;
    float _1446 = rsqrt(_1412);
    float _1448 = _1414 * _1388;
    int _1450 = as_type<int>(_1440);
    if (_1384)
    {
        out.m_47.x = 0.0;
    }
    if (_1384)
    {
        float _1452 = _1440 * 5.0;
        _1450 = as_type<int>(_1452);
    }
    int _1454 = _1450;
    float _1456 = fma(_938, _1444, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1458 = fma(_946, _1426, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1460 = fma(_902, _1422, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1462 = _1406 * _1416;
    if (_1384)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5131 = as_type<float>(_1454);
        out.gl_Position.z = _5131;
    }
    float _1464 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1432);
    int _1466 = ~_1206;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    out.m_63.x = _1448;
    out.m_63.y = _1462;
    bool _1472 = !_1174;
    int _1474 = _1472 ? 0 : 1;
    float _1476 = _1262 * _1446;
    float _1478 = _1304 * _1446;
    int _1480 = _1470;
    if (_1384)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1482 = rsqrt(_924);
    float _1484 = -_1476;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1216);
    float _1488 = fma(_1220, _1404, _1464);
    if (!_1014)
    {
        int _1490 = ~_1206;
        int _1492 = _1490 + 1;
        _1480 = _1492;
    }
    int _1494 = _1480;
    float _1496 = in.m_65.z;
    float _1498 = _1324 * _1446;
    float _1500 = -_1478;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1246);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1486 + _1504;
    float _1508 = fma(_1232, _1360, _1488);
    float _1510 = -_1498;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1280);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1502 + _1514;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1520 = fma(_1390, _1346, _1508);
    float _1522 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1526 = _1512 + _1524;
    float _1528 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1530 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1518);
    float _1532 = fma(_1460, _1332, _1520);
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1170);
    float _1536 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1540 = _1230 ? 0 : 1;
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1530);
    float _1544 = _1482 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1546 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1538);
    int _1548 = ~_1540;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = fma(_1456, _1382, _1532);
    int _1556 = _1552;
    int _1558 = as_type<int>(_1546);
    if (!_1218)
    {
        int _1560 = ~_1540;
        int _1562 = _1560 + 1;
        _1556 = _1562;
    }
    int _1564 = _1556;
    bool _1566 = _1542 >= 0.0;
    float _1568 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1546);
    int _1570 = abs(_1474);
    int _1572 = _1202 ? 0 : 1;
    float _1574 = fma(_1568, _1534, _1496);
    float _1576 = in.m_65.x;
    float _1578 = in.m_65.y;
    float _1580 = float(_1564);
    float _1582 = float(_1570);
    if (_1566)
    {
        _1436 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1584 = _1436;
    if (_1566)
    {
        out.m_47.x = 0.0;
    }
    int _1586 = ~_1572;
    int _1588 = _1586 + 1;
    int _1590 = _1588 + 1;
    float _1592 = _1582 * _1580;
    int _1594 = _1590;
    if (!_1188)
    {
        int _1596 = ~_1572;
        int _1598 = _1596 + 1;
        _1594 = _1598;
    }
    int _1600 = _1594;
    if (_1566)
    {
        float _1602 = _1584 * 5.0;
        _1558 = as_type<int>(_1602);
    }
    int _1604 = _1558;
    float _1606 = float(_1494);
    int _1608 = abs(_1214);
    if (_1566)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5380 = as_type<float>(_1604);
        out.gl_Position.z = _5380;
    }
    if (_1566)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1610 = -_1476;
    float _1612 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1614 = _1592 * (-2.0);
    float _1616 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1618 = -_1478;
    float _1620 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1304);
    float _1622 = float(_1608);
    float _1624 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1616);
    float _1626 = _1612 * _1612;
    float _1628 = fma(_1614, _1576, _1576);
    float _1630 = _810 + (-0.5);
    float _1632 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1624);
    float _1634 = (*spvDescriptorSet0.vp_c10)._m0[9].z * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = fma(_1620, _1620, _1626);
    float _1638 = _1622 * _1606;
    float _1640 = -_1498;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1324);
    float _1644 = abs(_1632);
    bool _1646 = _1644 > 0.001000000047497451305389404296875;
    float _1648 = fma(_970, _1614, _970);
    float _1650 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1628);
    float _1652 = fma((*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1654 = _1646 ? 0.0 : 9.9999997473787516355514526367188e-05;
    float _1656 = fma(_1642, _1642, _1636);
    float _1658 = _1638 * (-2.0);
    float _1660 = fma(_1648, _1008, _1650);
    int _1662 = abs(_1380);
    float _1664 = fma((*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1652);
    float _1666 = _1632 + _1654;
    float _1668 = fma(_1658, _1578, _1578);
    float _1670 = _1660 * 0.15915493667125701904296875;
    float _1672 = in.m_59.x;
    float _1674 = _718 + (-0.5);
    float _1676 = float(_1600);
    float _1678 = fma(_1458, _1288, _1554);
    float _1680 = float(_1662);
    float _1682 = fma(_1004, _1658, _1004);
    float _1684 = abs(_1664);
    float _1686 = abs(_1666);
    float _1688 = precise::max(_1684, _1686);
    float _1690 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1668);
    float _1692 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1678);
    float _1694 = _1680 * _1676;
    bool _1696 = _1688 >= 16.0;
    float _1698 = fma(_1682, _1008, _1690);
    float _1700 = in.m_67.x;
    float _1702 = in.m_67.y;
    float _1704 = _1694 * (-2.0);
    float _1706 = _906 + (-0.5);
    float _1708 = _1698 * 0.15915493667125701904296875;
    float _1710 = _1528 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1712 = fma(_1574, _1704, _1574);
    float _1714 = fma(_1010, _1704, _1010);
    float _1716 = sqrt(_1656);
    float _1718 = fma(_1536, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1710);
    float _1720 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1712);
    float _1722 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1724 = _1664;
    float _1726 = _1666;
    if (_1696)
    {
        float _1728 = _1664 * 0.0625;
        _1724 = _1728;
    }
    float _1730 = _1724;
    float _1732 = fma(_1544, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1718);
    float _1734 = fma(_1714, _1008, _1720);
    float _1736 = _1692 * _1672;
    if (_1696)
    {
        float _1738 = _1666 * 0.0625;
        _1726 = _1738;
    }
    float _1740 = _1726;
    float _1742 = _1670 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = abs(_1732);
    float _1748 = -_1746;
    float _1750 = _1748 + 1.0;
    float _1752 = abs(_1730);
    bool _1754 = _1752 != 0.0;
    bool _1756 = isnan(_1752);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    float _1764 = in.m_67.z;
    float _1766 = abs(_1740);
    bool _1768 = _1766 == 0.0;
    float _1770 = _1736 * _1750;
    float _1772 = abs(_1740);
    bool _1774 = _1772 == 0.0;
    bool _1776 = !_1762;
    bool _1778 = _1774 && _1776;
    float _1780 = _1446 * _1716;
    float _1782 = _1670 * 6.283185482025146484375;
    float _1784 = cos(_1782);
    float _1786 = -_1770;
    float _1788 = _1786 + _1700;
    float _1790 = _1780 * _1722;
    float _1792 = _1708 * 6.283185482025146484375;
    float _1794 = sin(_1792);
    float _1796 = _1734 * 0.15915493667125701904296875;
    int _1798 = as_type<int>(_1788);
    if (_1778)
    {
        bool _1800 = as_type<int>(_1740) >= 0;
        _1438 = _1800;
    }
    bool _1802 = _1438;
    float _1804 = _1708 * 6.283185482025146484375;
    float _1806 = cos(_1804);
    float _1808 = _1796 * 6.283185482025146484375;
    float _1810 = sin(_1808);
    float _1812 = -_1770;
    float _1814 = _1812 + _1702;
    float _1816 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1818 = _1784 * _1794;
    float _1820 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1788);
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1814);
    float _1824 = _1780 * _1816;
    int _1826 = as_type<int>(_1822);
    int _1828 = _1802 ? (-1) : 0;
    if (_1778)
    {
        int _1830 = _1802 ? 0 : 1078530011;
        _1798 = _1830;
    }
    int _1832 = _1798;
    float _1834 = _1744 * _1806;
    float _1836 = _1796 * 6.283185482025146484375;
    float _1838 = cos(_1836);
    float _1840 = -_1818;
    float _1842 = fma(_1810, _1834, _1840);
    float _1844 = -_1834;
    float _1846 = fma(_1810, _1818, _1844);
    float _1848 = _1820 * _1824;
    float _1850 = _1822 * _1790;
    float _1852 = _1528 * _1528;
    if (_1778)
    {
        int _1854 = int(0x80000000) & as_type<int>(_1730);
        int _1856 = _1832 | _1854;
        _1826 = _1856;
    }
    int _1858 = _1826;
    bool _1860 = !_1762;
    bool _1862 = _1860 && _1768;
    int _1864 = _1858;
    float _1866 = as_type<float>(_1858);
    if (!_1862)
    {
        float _1868 = abs(_1730);
        bool _1870 = _1868 != as_type<float>(0x7f800000u /* inf */);
        bool _1872 = isnan(_1868);
        bool _1874 = _1870 || _1872;
        bool _1876 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1878 = _1874 || _1876;
        float _1880 = abs(_1740);
        bool _1882 = _1880 == as_type<float>(0x7f800000u /* inf */);
        float _1884 = abs(_1740);
        bool _1886 = _1884 == as_type<float>(0x7f800000u /* inf */);
        bool _1888 = !_1878;
        bool _1890 = _1886 && _1888;
        if (_1890)
        {
            bool _1892 = as_type<int>(_1740) >= 0;
            _1828 = _1892 ? (-1) : 0;
        }
        int _1894 = _1828;
        if (_1890)
        {
            _1864 = 1075235812;
        }
        int _1896 = _1864;
        int _1898 = _1896;
        if (_1890)
        {
            int _1900 = ~_1894;
            int _1902 = (_1900 != 0) ? _1896 : 1061752795;
            _1898 = _1902;
        }
        int _1904 = _1898;
        float _1906 = as_type<float>(_1904);
        if (_1890)
        {
            int _1908 = int(0x80000000) & as_type<int>(_1730);
            int _1910 = _1904 | _1908;
            _1906 = as_type<float>(_1910);
        }
        float _1912 = _1906;
        bool _1914 = !_1878;
        bool _1916 = _1914 && _1882;
        _1866 = _1912;
        if (!_1916)
        {
            float _1918 = abs(_1730);
            float _1920 = abs(_1740);
            float _1922 = precise::max(_1918, _1920);
            float _1924 = abs(_1730);
            float _1926 = abs(_1740);
            float _1928 = precise::min(_1924, _1926);
            float _1930 = 1.0 / _1922;
            float _1932 = abs(_1730);
            float _1934 = abs(_1740);
            bool _1936 = _1932 > _1934;
            bool _1938 = as_type<int>(_1740) >= 0;
            float _1940 = _1928 * _1930;
            float _1942 = _1940 * _1940;
            float _1944 = _1942 + 11.33538818359375;
            float _1946 = fma(_1942, _1944, 28.84246826171875);
            float _1948 = fma(_1942, _1946, 19.6966705322265625);
            float _1950 = fma(_1942, -0.82336294651031494140625, -5.674867153167724609375);
            float _1952 = fma(_1942, _1950, -6.565555095672607421875);
            float _1954 = 1.0 / _1948;
            float _1956 = _1942 * _1952;
            float _1958 = abs(_1730);
            float _1960 = abs(_1740);
            float _1962 = _1958 + _1960;
            int _1964 = as_type<int>(_1730) & int(0x80000000);
            float _1966 = _1940 * _1956;
            bool _1968 = _1962 > as_type<float>(0x7f800000u /* inf */);
            bool _1970 = isnan(_1962);
            bool _1972 = _1968 || _1970;
            bool _1974 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1976 = _1972 || _1974;
            float _1978 = fma(_1966, _1954, _1940);
            float _1980 = _1978;
            _1866 = _1962;
            if (_1936)
            {
                float _1982 = -_1978;
                float _1984 = _1982 + 1.57079637050628662109375;
                _1980 = _1984;
            }
            float _1986 = _1980;
            int _1988 = as_type<int>(_1986);
            if (!_1938)
            {
                float _1990 = -_1986;
                float _1992 = _1990 + 3.1415927410125732421875;
                _1988 = as_type<int>(_1992);
            }
            int _1994 = _1988;
            if (!_1976)
            {
                int _1996 = _1964 | _1994;
                _1866 = as_type<float>(_1996);
            }
        }
    }
    float _1998 = _1866;
    float _2000 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2002 = fma(_1536, _1536, _1852);
    float _2004 = _1744 * _1794;
    float _2006 = _1784 * _1806;
    float _2008 = _1838 * _1850;
    float _2010 = _1780 * _2000;
    float _2012 = fma(_1544, _1544, _2002);
    float _2014 = _1794 * _1838;
    float _2016 = _1806 * _1838;
    float _2018 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1764);
    float _2020 = fma(_1810, _2006, _2004);
    float _2022 = _1784 * _2008;
    float _2024 = _1998 * (-0.15915493667125701904296875);
    float _2026 = _2018 * _2010;
    float _2028 = -_1850;
    float _2030 = _1810 * _2028;
    float _2032 = fma(_2020, _1848, _2022);
    float _2034 = rsqrt(_2012);
    float _2036 = _1744 * _2008;
    float _2038 = fma(_2016, _1848, _2030);
    float _2040 = fma(_1846, _2026, _2032);
    float _2042 = fma(_1810, _2004, _2006);
    float _2044 = fma(_1842, _1848, _2036);
    float _2046 = fma(_2014, _2026, _2038);
    float _2048 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2050 = _2024 * 6.283185482025146484375;
    float _2052 = cos(_2050);
    float _2054 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2056 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2058 = fma(_2042, _2026, _2044);
    float _2060 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2048);
    float _2062 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2054);
    float _2064 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2056);
    float _2066 = _2024 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    float _2070 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2060);
    float _2072 = _1536 * _2034;
    float _2074 = _1544 * _2034;
    float _2076 = _1528 * _2034;
    float _2078 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2062);
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2082 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2064);
    float _2084 = -_2052;
    float _2086 = _2084 + 1.0;
    float _2088 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2090 = _2074 * _2074;
    float _2092 = _2072 * _2086;
    float _2094 = _2076 * _2086;
    float _2096 = fma(_2086, _2090, _2052);
    float _2098 = _2074 * _2068;
    float _2100 = _2072 * _2068;
    float _2102 = _2076 * _2068;
    float _2104 = fma(_2072, _2092, _2052);
    float _2106 = -_2098;
    float _2108 = fma(_2076, _2092, _2106);
    float _2110 = fma(_2074, _2094, _2100);
    float _2112 = fma(_2076, _2094, _2052);
    float _2114 = fma(_2076, _2092, _2098);
    float _2116 = _2088 * _2108;
    float _2118 = -_2102;
    float _2120 = fma(_2074, _2092, _2118);
    float _2122 = _2088 * _2110;
    float _2124 = fma(_2074, _2092, _2102);
    float _2126 = fma(_2080, _2104, _2116);
    float _2128 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2130 = fma(_2080, _2120, _2122);
    float _2132 = _2088 * _2112;
    float _2134 = -_2100;
    float _2136 = fma(_2074, _2094, _2134);
    float _2138 = fma(_2128, _2124, _2126);
    float _2140 = fma(_2128, _2096, _2130);
    float _2142 = fma(_2080, _2114, _2132);
    float _2144 = _1246 + _2138;
    float _2146 = _1280 + _2140;
    float _2148 = fma(_2128, _2136, _2142);
    float _2150 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2152 = _2144 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2156 = _2146 + _2154;
    float _2158 = _1216 + _2148;
    float _2160 = _2152 * _2152;
    float _2162 = _2156 * _2156;
    float _2164 = _2160 + _2162;
    float _2166 = sqrt(_2164);
    bool _2168 = _2166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2170 = _2148;
    float _2172 = _2092;
    float _2174 = _2132;
    float _2176 = _2098;
    float _2178 = _2162;
    if (!_2168)
    {
        _2170 = _2160;
    }
    float _2180 = _2170;
    float _2182 = _2180;
    if (!_2168)
    {
        _2172 = _2144;
    }
    float _2184 = _2172;
    float _2186 = _2184;
    if (!_2168)
    {
        _2174 = _2146;
    }
    float _2188 = _2174;
    float _2190 = _2188;
    if (!_2168)
    {
        _2176 = _2158;
    }
    float _2192 = _2176;
    bool _2194 = !_2168;
    float _2196 = _2192;
    if (!_2194)
    {
        float _2198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2202 = _2166 + _2200;
        float _2204 = rsqrt(_2164);
        float _2206 = _2202 * _2198;
        float _2208 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2210 = _2206 * 0.15915493667125701904296875;
        float _2212 = _2210 * 6.283185482025146484375;
        float _2214 = sin(_2212);
        float _2216 = _2210 * 6.283185482025146484375;
        float _2218 = cos(_2216);
        float _2220 = fma(_2214, _2208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2222 = _2204 * _2220;
        float _2224 = _2218 + (-1.0);
        float _2226 = fma(_2152, _2222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2228 = fma(_2156, _2222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2230 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2234 = _2226 + _2232;
        float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2238 = _2228 + _2236;
        float _2240 = fma(_2158, _2218, _2230);
        float _2242 = _2234 * _2234;
        float _2244 = _2238 * _2238;
        _2196 = _2240;
        _2182 = _2242;
        _2178 = _2244;
        _2186 = _2226;
        _2190 = _2228;
    }
    float _2246 = _2196;
    float _2248 = _2182;
    float _2250 = _2178;
    float _2252 = _2186;
    float _2254 = _2190;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2258 = _2246 + _2256;
    out.m_55.x = _672;
    out.m_55.y = _674;
    out.m_55.z = _676;
    out.m_55.w = _664;
    float _2260 = fma(_2258, _2258, _2248);
    float _2262 = _2260 + _2250;
    float _2264 = sqrt(_2262);
    bool _2266 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2268 = isnan(_2264);
    bool _2270 = _2266 || _2268;
    bool _2272 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2274 = _2270 || _2272;
    float _2276 = _2248;
    if (!_2274)
    {
        _2276 = 1.0;
    }
    float _2278 = _2276;
    bool _2280 = !_2274;
    float _2282 = _2278;
    if (!_2280)
    {
        bool _2284 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2286 = isnan(_2264);
        bool _2288 = _2284 || _2286;
        bool _2290 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2292 = _2288 || _2290;
        if (!_2292)
        {
            float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2296 = _2264 + _2294;
            float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2300 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2298;
            float _2302 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2304 = _2302 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2306 = 1.0 / _2300;
            float _2308 = _2296 * _2306;
            float _2310 = fma(_2308, _2304, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2282 = _2310;
            _2312 = true;
        }
        else
        {
            bool _2314 = _2264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2316 = isnan(_2264);
            bool _2318 = _2314 || _2316;
            bool _2320 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2322 = _2318 || _2320;
            if (!_2322)
            {
                float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2326 = _2264 + _2324;
                float _2328 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2330 = _2328 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2332 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2334 = _2332 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2336 = 1.0 / _2330;
                float _2338 = _2326 * _2336;
                float _2340 = fma(_2338, _2334, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2282 = _2340;
                _2312 = true;
            }
            else
            {
                _2282 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2312 = false;
    float _2342 = _2282;
    float _2344 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2346 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2348 = _2252 + _2346;
    float _2350 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2352 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan(0.5);
    bool _2360 = _2356 || _2358;
    float _2362 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2344);
    float _2364 = fma(_2348, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2366 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2368 = _2246 + _2366;
    float _2370 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2372 = _2254 + _2370;
    float _2374 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2362);
    float _2376 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2350);
    float _2378 = -_1478;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2364);
    float _2382 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2384 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2376);
    float _2386 = fma(_2368, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2388 = fma(_2372, _2342, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2390 = 1.0 / _2382;
    float _2392 = _2384 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2394 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2396 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan(0.5);
    bool _2402 = _2398 || _2400;
    float _2404 = -_1476;
    float _2406 = fma(_2404, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2408 = -_1498;
    float _2410 = fma(_2408, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2388);
    float _2412 = _2392 + _2382;
    float _2414 = _2392;
    float _2416 = _2342;
    float _2418 = _2406;
    float _2420 = _2410;
    if (_2360)
    {
        _2414 = _2380;
    }
    float _2422 = _2414;
    float _2424 = _2422;
    float _2426 = _2390;
    if (!_2360)
    {
        float _2428 = _1506 * _1506;
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2432 = -_1280;
        float _2434 = _2432 + _2388;
        float _2436 = fma(_1516, _1516, _2428);
        float _2438 = fma(_1526, _1526, _2436);
        float _2440 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2442 = sqrt(_2438);
        float _2444 = 1.0 / _1780;
        float _2446 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2448 = precise::min(_2442, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2450 = _2448 * _2430;
        float _2452 = _2450 * _2444;
        float _2454 = -_1246;
        float _2456 = _2454 + _2364;
        float _2458 = -_1216;
        float _2460 = _2458 + _2386;
        float _2462 = _2446 * _2452;
        float _2464 = _2434 * _2452;
        float _2466 = fma(_2456, _2462, _1502);
        float _2468 = fma(_2460, _2462, _1486);
        float _2470 = fma(_2446, _2464, _1512);
        _2416 = _2446;
        _2418 = _2468;
        _2424 = _2466;
        _2420 = _2470;
    }
    float _2472 = _2416;
    float _2474 = _2418;
    float _2476 = _2424;
    float _2478 = _2420;
    float _2480 = _2472;
    if (_2402)
    {
        _2480 = 1.0;
    }
    float _2482 = _2480;
    float _2484 = _2412 * _2390;
    float _2486 = _2484 * 0.5;
    float _2488 = _2482;
    float _2490 = _2486;
    if (!_2402)
    {
        float _2492 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2494 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2496 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2494);
        float _2498 = _2492 * 0.15915493667125701904296875;
        float _2500 = _2498 * 6.283185482025146484375;
        float _2502 = cos(_2500);
        float _2504 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2506 = _2504 * 0.15915493667125701904296875;
        float _2508 = _2498 * 6.283185482025146484375;
        float _2510 = sin(_2508);
        float _2512 = 1.0 / _2502;
        float _2514 = _2506 * 6.283185482025146484375;
        float _2516 = cos(_2514);
        float _2518 = _2510 * _2512;
        float _2520 = 1.0 / _2496;
        float _2522 = _2516 * _2518;
        float _2524 = _2506 * 6.283185482025146484375;
        float _2526 = sin(_2524);
        float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2530 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2528;
        float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2534 = _2520 * _2532;
        float _2536 = 1.0 / _2522;
        float _2538 = 1.0 / _2530;
        float _2540 = _2526 * _2536;
        float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2544 = fma(_2540, _2534, _2542);
        float _2546 = _2544 * _2538;
        float _2548 = precise::clamp(_2546, 0.0, 1.0);
        _2426 = _2506;
        _2488 = _2548;
    }
    float _2550 = _2426;
    float _2552 = _2488;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2556 = _2474 + _2554;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2560 = _2476 + _2558;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2478 + _2562;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2576 = _2560 * _2574;
    float _2578 = _2564 * _2574;
    float _2580 = _2576 * _2576;
    float _2582 = _2578 * _2578;
    float _2584 = _2580 + _2582;
    float _2586 = sqrt(_2584);
    bool _2588 = _2586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2592 = _2586 + _2590;
    float _2594 = _2572;
    float _2596 = _2550;
    float _2598 = _2592;
    float _2600 = _2556;
    float _2602 = _2574;
    float _2604 = _2576;
    if (_2588)
    {
        float _2606 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2594 = _2606;
    }
    float _2608 = _2594;
    if (_2588)
    {
        float _2610 = rsqrt(_2584);
        _2596 = _2610;
    }
    float _2612 = _2596;
    float _2614 = _2612;
    if (_2588)
    {
        float _2616 = _2592 * _2608;
        _2598 = _2616;
    }
    float _2618 = _2598;
    if (_2588)
    {
        float _2620 = _2618 * 0.15915493667125701904296875;
        _2490 = _2620;
    }
    float _2622 = _2490;
    float _2624 = _2608;
    if (_2588)
    {
        float _2626 = _2622 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2624 = _2628;
    }
    float _2630 = _2624;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2634 = precise::max(0.0, _2632);
    float _2636 = _2564;
    float _2638 = _2634;
    if (_2588)
    {
        float _2640 = _2622 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        _2636 = _2642;
    }
    float _2644 = _2636;
    float _2646 = -_2574;
    float _2648 = -_2634;
    float _2650 = fma(_2556, _2646, _2648);
    if (!_2588)
    {
        _2600 = _2580;
    }
    float _2652 = _2600;
    float _2654 = _2652;
    if (_2588)
    {
        float _2656 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2638 = _2656;
    }
    float _2658 = _2638;
    float _2660 = sqrt(_2570);
    float _2662 = _2630;
    float _2664 = _2658;
    if (_2588)
    {
        float _2666 = fma(_2630, _2658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2662 = _2666;
    }
    float _2668 = _2662;
    float _2670 = _2668;
    float _2672 = _2644;
    if (_2588)
    {
        float _2674 = _2644 + (-1.0);
        _2664 = _2674;
    }
    float _2676 = _2664;
    float _2678 = _2676;
    if (_2588)
    {
        float _2680 = _2612 * _2668;
        _2602 = _2680;
    }
    float _2682 = _2602;
    if (!_2588)
    {
        _2614 = _2650;
    }
    float _2684 = _2614;
    float _2686 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2688 = _2684;
    if (_2588)
    {
        float _2690 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2690;
    }
    float _2692 = _2670;
    if (_2588)
    {
        float _2694 = _2576 * _2682;
        _2604 = _2694;
    }
    float _2696 = _2604;
    if (!_2588)
    {
        _2678 = _2578;
    }
    float _2698 = _2678;
    float _2700 = _2698;
    if (_2588)
    {
        float _2702 = _2578 * _2682;
        _2700 = _2702;
    }
    float _2704 = _2700;
    if (_2588)
    {
        float _2706 = fma(_2650, _2644, _2692);
        _2688 = _2706;
    }
    float _2708 = _2688;
    if (_2588)
    {
        float _2710 = _2696 * _2696;
        _2654 = _2710;
    }
    float _2712 = _2654;
    if (!_2588)
    {
        _2672 = _2582;
    }
    float _2714 = _2672;
    float _2716 = _2714;
    if (_2588)
    {
        float _2718 = _2704 * _2704;
        _2716 = _2718;
    }
    float _2720 = _2716;
    float _2722 = fma(_2708, _2708, _2712);
    float _2724 = _2722 + _2720;
    float _2726 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2730 = fma(_2660, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2728);
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2738 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2726);
    float _2740 = _2474 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2742 = rsqrt(_2724);
    float _2744 = -_2732;
    float _2746 = _2744 + 1.0;
    float _2748 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2738);
    float _2750 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2740);
    float _2752 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2734);
    float _2754 = fma(_2476, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2686);
    float _2756 = _2748 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2758 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2750);
    float _2760 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2752);
    float _2762 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2754);
    float _2764 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2766 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2768 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2770 = abs(_2746);
    float _2772 = log2(_2770);
    float _2774 = -_2764;
    float _2776 = fma(_2774, _2736, 1.0);
    float _2778 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2780 = _2742 * _2696;
    float _2782 = _2762 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2784 = _2742 * _2708;
    float _2786 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2778);
    float _2788 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2790 = _2742 * _2704;
    float _2792 = log2(_2776);
    float _2794 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2786);
    float _2796 = -_2788;
    float _2798 = fma(_2784, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2796);
    float _2800 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2802 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2794);
    float _2804 = -_2790;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2798);
    float _2808 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2810 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2812 = 1.0 / _2802;
    float _2814 = fma(_2806, -0.5, 0.5);
    float _2816 = fma(_2806, 0.5, 0.5);
    float _2818 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2810);
    float _2820 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2800);
    float _2822 = _2784 + 1.0;
    float _2824 = fma(_2816, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2826 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2818);
    float _2828 = exp2(_2808);
    float _2830 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2820);
    float _2832 = fma(_2816, _2824, -0.212114393711090087890625);
    float _2834 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2826);
    float _2836 = _2792 * 0.693147182464599609375;
    float _2838 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2830);
    float _2840 = fma(_2816, _2832, 1.570728778839111328125);
    float _2842 = sqrt(_2814);
    float _2844 = _2834 * _2812;
    float _2846 = _2838 * _2812;
    float _2848 = _2836 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2850 = fma(_2844, 0.5, 0.5);
    float _2852 = fma(_2846, -0.5, 0.5);
    float _2854 = -_2784;
    float _2856 = fma(_2828, _2822, _2854);
    float3 _7355 = float3(_2850, _2852, _2848);
    float _2858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7355, float3(0.0), isnan(_7355)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7355, float3(0.0), isnan(_7355)), level(0.0)).x;
    float3 _7366 = float3(_2850, _2852, _2848);
    float4 _2861 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7366, float3(0.0), isnan(_7366)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7366, float3(0.0), isnan(_7366)), level(0.0)).xyzw;
    float _2863 = _2861.x;
    float _2865 = _2861.y;
    float _2867 = _2861.z;
    float _2869 = _2861.w;
    float _2871 = fma(_2856, 0.5, 0.5);
    float _2873 = _2842 * 0.636619746685028076171875;
    float _2875 = -_2840;
    float _2877 = fma(_2873, _2875, 1.0);
    float2 _7393 = float2(_2877, _2871);
    float3 _2881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7393, float2(0.0), isnan(_7393)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7393, float2(0.0), isnan(_7393)), level(0.0)).xyz;
    float _2883 = _2881.x;
    float _2885 = _2881.y;
    float _2887 = _2881.z;
    float _2889 = _2772 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2891 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2893 = _2552 > 0.0;
    bool _2895 = isnan(_2552);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(0.0);
    bool _2901 = _2897 || _2899;
    float _2903 = _2552 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2905 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2891);
    float _2907 = exp2(_2889);
    float _2909 = fma(_2756, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2905);
    float _2911 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2913 = _2911 + _2802;
    out.gl_Position.x = _2834;
    out.gl_Position.y = _2838;
    out.gl_Position.z = _2911;
    out.gl_Position.w = _2802;
    float _2915 = _2913 * 0.5;
    float _2917 = -_2907;
    float _2919 = _2917 + 1.0;
    float _2921 = _2903 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2923 = _2919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2915;
    out.m_69.w = _2802;
    out.m_47.x = _2921;
    float _2925 = _2923 * _2858;
    float _2927 = -_2923;
    float _2929 = _2927 + 1.0;
    float _2931 = _2869 * _2925;
    float _2933 = _2887 * _2925;
    float _2935 = fma(_2883, _2931, _2863);
    float _2937 = fma(_2885, _2931, _2865);
    float _2939 = _2869 * _2929;
    float _2941 = fma(_2869, _2933, _2867);
    out.m_71.x = _2935;
    out.m_71.y = _2937;
    out.m_71.z = _2941;
    out.m_71.w = _2939;
    if (_2901)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2943 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2943;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

