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
    float4 m_63 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _666 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1570 = as_type<float>(_102);
        out.gl_Position.z = _1570;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1639 = as_type<float>(_138);
        out.gl_Position.z = _1639;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = 1.0 / _294;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = 1.0 / _298;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = _290 + _320;
    bool _324 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_290);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _290 + _338;
    float _342 = _322 * _308;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = _290 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _350 = _290 + _348;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _312;
    float _356 = _340 * _318;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _360 = _290 + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _364 = _290 + _362;
    bool _366 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _306;
    float _380 = _346 * _336;
    bool _382 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _384 = isnan(_290);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = -_376;
    float _400 = _398 + 1.0;
    float _402 = fma(_396, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = 1.0 / _316;
    float _406 = _360 * _354;
    bool _408 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _410 = isnan(_290);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_392;
    float _422 = _420 + 1.0;
    float _424 = -_418;
    float _426 = _424 + 1.0;
    float _428 = _350 * _378;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _376 * _422;
    float _440 = fma(_436, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _418 * _400;
    float _444 = _364 * _404;
    float _446 = fma(_432, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _334 * _426;
    bool _450 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _452 = isnan(_290);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _466 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _468 = isnan(_290);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -_334;
    float _480 = _478 + 1.0;
    bool _482 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _484 = isnan(_290);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _502 = _460 * _480;
    float _504 = -_460;
    float _506 = _504 + 1.0;
    float _508 = -_492;
    float _510 = _508 + 1.0;
    float _512 = fma(_496, _356, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _514 = fma(_464, _356, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _516 = _476 * _510;
    float _518 = -_476;
    float _520 = _518 + 1.0;
    float _522 = fma(_500, _356, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _492 * _506;
    float _526 = _440 * _516;
    float _528 = _446 * _516;
    float _530 = _402 * _516;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _552 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _554 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _556;
    float _560 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _562 = fma(_542, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _564 = fma(_546, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = fma(_550, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _568 = fma(_534, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _570 = fma(_558, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _572 = fma(_512, _524, _552);
    float _574 = fma(_514, _524, _554);
    float _576 = fma(_522, _524, _560);
    float _578 = fma(_538, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _580 = fma(_568, _502, _572);
    float _582 = fma(_570, _502, _576);
    float _584 = fma(_578, _502, _574);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _594;
    float _598 = fma(_562, _448, _580);
    float _600 = fma(_566, _448, _582);
    float _602 = fma(_588, _406, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _604 = fma(_592, _406, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _606 = fma(_564, _448, _584);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _616 = fma(_596, _406, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _622 = fma(_610, _444, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _624 = fma(_614, _444, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _626 = fma(_604, _442, _606);
    float _628 = fma(_602, _442, _598);
    float _630 = fma(_620, _444, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _632 = fma(_616, _442, _600);
    float _634 = fma(_624, _438, _626);
    float _636 = fma(_622, _438, _628);
    float _638 = fma(_630, _438, _632);
    float _640 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].y, _634);
    float _642 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].z, _638);
    bool _646 = !_352;
    float _664;
    if (!_646)
    {
        float _648 = in.m_51.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_86);
        float _670 = 1.0 / _668;
        float _672 = _120 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _680 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _682 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _684 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _678);
    float _686 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _680);
    float _688 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _690 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _684);
    float _692 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _686);
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = _690 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _694 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _706 = _696 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _710 = _698 + _708;
    float _712 = _702 * _702;
    float _714 = fma(_706, _706, _712);
    float _716 = fma(_710, _710, _714);
    float _718 = rsqrt(_716);
    float _720 = _702 * _718;
    float _722 = _706 * _718;
    float _724 = -_720;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _702);
    float _728 = -_722;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _706);
    float _732 = _710 * _718;
    float _734 = _726 * _726;
    float _736 = in.m_49.x;
    float _738 = in.m_49.y;
    float _740 = in.m_49.z;
    float _742 = -_732;
    float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _746 = fma(_730, _730, _734);
    float _748 = in.m_53.x;
    float _750 = in.m_53.y;
    float _752 = in.m_53.z;
    float _754 = fma(_744, _744, _746);
    float _756 = sqrt(_754);
    float _758 = _640 * _738;
    float _760 = _642 * _736;
    float _762 = _718 * _756;
    float _764 = _644 * _740;
    float _766 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _750);
    float _770 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _748);
    float _774 = _766 * _762;
    float _776 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _778 = _770 * _762;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _752);
    float _782 = _774 * _768;
    float _784 = _776 * _762;
    float _786 = _778 * _772;
    float _788 = _782 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _790 = _784 * _780;
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _788);
    float _796 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _798 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _794);
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _802 = _698 + _798;
    float _804 = _696 + _800;
    float _806 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _810 = _802 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _804 + _812;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _806);
    float _818 = _810 * _810;
    float _820 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _822 = fma(_814, _814, _818);
    float _824 = _694 + _820;
    float _826 = sqrt(_822);
    bool _828 = _826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _830 = _806;
    float _832 = _820;
    float _834 = _790;
    if (!_828)
    {
        _830 = _804;
    }
    float _836 = _830;
    float _838 = _836;
    if (!_828)
    {
        _832 = _802;
    }
    float _840 = _832;
    float _842 = _840;
    if (!_828)
    {
        _834 = _824;
    }
    float _844 = _834;
    bool _846 = !_828;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _854 = _826 + _852;
        float _856 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _858 = rsqrt(_822);
        float _860 = _854 * _850;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = _872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_870, _856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = fma(_824, _866, _874);
        float _880 = _858 * _876;
        float _882 = fma(_814, _880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_810, _880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _848 = _878;
        _838 = _882;
        _842 = _884;
    }
    float _886 = _848;
    float _888 = _838;
    float _890 = _842;
    float _892 = -_720;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _896 = -_722;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _888);
    float _900 = -_732;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _906 = _894 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _914 = _902 + _912;
    float _916 = _906 * _906;
    float _918 = fma(_910, _910, _916);
    float _920 = fma(_914, _914, _918);
    float _922 = rsqrt(_920);
    float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _910 * _924;
    float _928 = _914 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _824;
    float _946 = _934;
    float _948 = _942;
    float _950 = _906;
    float _952 = _924;
    float _954 = _926;
    if (_938)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _956;
    }
    float _958 = _944;
    if (_938)
    {
        float _960 = rsqrt(_934);
        _946 = _960;
    }
    float _962 = _946;
    float _964 = _958;
    if (_938)
    {
        float _966 = _942 * _958;
        _948 = _966;
    }
    float _968 = _948;
    if (_938)
    {
        float _970 = _968 * 0.15915493667125701904296875;
        _964 = _970;
    }
    float _972 = _964;
    float _974 = _914;
    float _976 = _972;
    if (_938)
    {
        float _978 = _972 * 6.283185482025146484375;
        float _980 = sin(_978);
        _974 = _980;
    }
    float _982 = _974;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _986 = precise::max(0.0, _984);
    float _988 = _922;
    float _990 = _986;
    if (_938)
    {
        float _992 = _972 * 6.283185482025146484375;
        float _994 = cos(_992);
        _988 = _994;
    }
    float _996 = _988;
    float _998 = -_924;
    float _1000 = -_986;
    float _1002 = fma(_906, _998, _1000);
    if (_938)
    {
        float _1004 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _950 = _1004;
    }
    float _1006 = _950;
    float _1008 = _1006;
    float _1010 = _982;
    if (_938)
    {
        float _1012 = fma(_982, _1006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1008 = _1012;
    }
    float _1014 = _1008;
    float _1016 = _1014;
    if (!_938)
    {
        _1010 = _930;
    }
    float _1018 = _1010;
    float _1020 = _1018;
    float _1022 = _996;
    if (_938)
    {
        float _1024 = _996 + (-1.0);
        _990 = _1024;
    }
    float _1026 = _990;
    float _1028 = _1026;
    if (_938)
    {
        float _1030 = _962 * _1014;
        _952 = _1030;
    }
    float _1032 = _952;
    if (!_938)
    {
        _1016 = _1002;
    }
    float _1034 = _1016;
    float _1036 = sqrt(_920);
    float _1038 = _1034;
    if (_938)
    {
        float _1040 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _1040;
    }
    float _1042 = _976;
    if (_938)
    {
        float _1044 = _926 * _1032;
        _954 = _1044;
    }
    float _1046 = _954;
    if (!_938)
    {
        _1028 = _928;
    }
    float _1048 = _1028;
    float _1050 = _1048;
    if (_938)
    {
        float _1052 = _928 * _1032;
        _1050 = _1052;
    }
    float _1054 = _1050;
    if (_938)
    {
        float _1056 = fma(_1002, _996, _1042);
        _1038 = _1056;
    }
    float _1058 = _1038;
    if (_938)
    {
        float _1060 = _1046 * _1046;
        _1020 = _1060;
    }
    float _1062 = _1020;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1064 = _1022;
    float _1066 = _1064;
    if (_938)
    {
        float _1068 = _1054 * _1054;
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = fma(_1058, _1058, _1062);
    float _1074 = _1072 + _1070;
    float _1076 = _894 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1078);
    float _1082 = precise::clamp(_1080, 0.0, 1.0);
    float _1084 = _894 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1086 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1076);
    float _1088 = rsqrt(_1074);
    float _1090 = -_1082;
    float _1092 = _1090 + 1.0;
    float _1094 = _894 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1086);
    float _1098 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1084);
    float _1100 = _894 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1102 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1106 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1108 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1100);
    float _1110 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1098);
    float _1112 = abs(_1092);
    float _1114 = log2(_1112);
    float _1116 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1106);
    float _1118 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1120 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1124 = _1088 * _1046;
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1132 = _1088 * _1058;
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1136 = _1088 * _1054;
    float _1138 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1130);
    float _1140 = -_1122;
    float _1142 = fma(_1140, _1102, 1.0);
    float _1144 = -_1134;
    float _1146 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1144);
    float _1148 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1138);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1152 = -_1136;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1146);
    float _1156 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1158 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1148);
    float _1160 = log2(_1142);
    float _1162 = fma(_1154, -0.5, 0.5);
    float _1164 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1166 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1156);
    float _1168 = fma(_1154, 0.5, 0.5);
    float _1170 = _1132 + 1.0;
    float _1172 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1164);
    float _1174 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1166);
    float _1176 = exp2(_1150);
    float _1178 = fma(_1168, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1180 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1172);
    float _1182 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1174);
    float _1184 = fma(_1168, _1178, -0.212114393711090087890625);
    float _1186 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1180);
    float _1188 = 1.0 / _1158;
    float _1190 = _1160 * 0.693147182464599609375;
    float _1192 = fma(_1168, _1184, 1.570728778839111328125);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1196 = sqrt(_1162);
    float _1198 = -_1132;
    float _1200 = fma(_1176, _1170, _1198);
    float _1202 = fma(_1200, 0.5, 0.5);
    float _1204 = _1182 * _1188;
    float _1206 = _1186 * _1188;
    float _1208 = fma(_1204, 0.5, 0.5);
    float _1210 = fma(_1206, -0.5, 0.5);
    float _1212 = _1196 * 0.636619746685028076171875;
    float _1214 = -_1192;
    float _1216 = fma(_1212, _1214, 1.0);
    float3 _3421 = float3(_1208, _1210, _1194);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3421, float3(0.0), isnan(_3421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3421, float3(0.0), isnan(_3421)), level(0.0)).x;
    float3 _3432 = float3(_1208, _1210, _1194);
    float4 _1221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3432, float3(0.0), isnan(_3432)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3432, float3(0.0), isnan(_3432)), level(0.0)).xyzw;
    float _1223 = _1221.x;
    float _1225 = _1221.y;
    float _1227 = _1221.z;
    float _1229 = _1221.w;
    float2 _3449 = float2(_1216, _1202);
    float3 _1233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3449, float2(0.0), isnan(_3449)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3449, float2(0.0), isnan(_3449)), level(0.0)).xyz;
    float _1235 = _1233.x;
    float _1237 = _1233.y;
    float _1239 = _1233.z;
    float _1241 = in.m_55.y;
    float _1243 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1245 = in.m_51.y;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    float _1251 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1243);
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1261 = in.m_55.x;
    float _1263 = 1.0 / _1259;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1273 = _380;
    if (_1249)
    {
        float _1275 = in.m_51.x;
        _1273 = _1275;
    }
    float _1277 = _1273;
    float _1279 = 1.0 / _1267;
    float _1281 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1283 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1251);
    float _1285 = -_1241;
    float _1287 = _1285 + 1.0;
    float _1289 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1283);
    bool _1291 = _1245 > 0.5;
    float _1293 = 1.0 / _1271;
    bool _1295 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1297 = isnan(_674);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1311 = _1241;
    if (_1255)
    {
        float _1313 = _1291 ? _1287 : _1241;
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1319 = _1289 + _1317;
    bool _1321 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1323 = isnan(_674);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1339 = _674 + _1337;
    float _1341 = exp2(_1281);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1343;
    float _1347 = _1335 * _1279;
    bool _1349 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1351 = isnan(_674);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1363 = _1345 * _1263;
    float _1365 = -_1331;
    float _1367 = _1365 + 1.0;
    bool _1369 = _1277 > 0.5;
    bool _1371 = _1369 && _1249;
    float _1373 = _1309 * _1293;
    float _1375 = fma(_1363, _1339, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1377 = _1305 * _1367;
    float _1379 = -_1305;
    float _1381 = _1379 + 1.0;
    bool _1383 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1385 = isnan(_674);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1397 = _1277;
    if (_1249)
    {
        _1397 = _1261;
    }
    float _1399 = _1397;
    float _1401 = _1359 * _1381;
    float _1403 = -_1359;
    float _1405 = _1403 + 1.0;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1409 = _674 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1413 = _674 + _1411;
    float _1415 = -_1341;
    float _1417 = _1415 + 1.0;
    float _1419 = _1393 * _1405;
    float _1421 = fma(_1373, _1409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1423 = fma(_1347, _1413, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1425 = _1375 * _1419;
    float _1427 = -_1393;
    float _1429 = _1427 + 1.0;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1433 = _1399;
    float _1435 = _1413;
    if (_1371)
    {
        float _1437 = -_1399;
        float _1439 = _1437 + 1.0;
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1449 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1425);
    if (!_1249)
    {
        _1435 = _1261;
    }
    float _1451 = _1435;
    float _1453 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1455 = _1451;
    if (_1249)
    {
        _1455 = _1441;
    }
    float _1457 = _1455;
    float _1459 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = fma(_1421, _1401, _1449);
    float _1465 = _1361 * _1395;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1469 = fma(_1423, _1377, _1463);
    out.m_59.x = _1459;
    out.m_59.y = _1453;
    out.m_59.z = _1461;
    float _1471 = _1467 * _1431;
    float _1473 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1469);
    float _1475 = _1158 + _1319;
    float _1477 = _1473 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1471;
    out.m_61.y = _1465;
    float _1479 = _1475 * 0.5;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1483 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1186;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1158;
    out.m_63.x = _1489;
    out.m_63.y = _1493;
    out.m_63.z = _1495;
    out.m_63.w = _1477;
    out.m_65.z = _1479;
    out.m_65.w = _1158;
    out.m_45.x = _1491;
    float _1497 = _1483 * _1218;
    float _1499 = _1229 * _1497;
    float _1501 = _1239 * _1497;
    float _1503 = -_1483;
    float _1505 = _1503 + 1.0;
    float _1507 = fma(_1235, _1499, _1223);
    float _1509 = fma(_1237, _1499, _1225);
    float _1511 = _1229 * _1505;
    float _1513 = fma(_1229, _1501, _1227);
    out.m_67.x = _1507;
    out.m_67.y = _1509;
    out.m_67.z = _1513;
    out.m_67.w = _1511;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _666 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1570 = as_type<float>(_102);
        out.gl_Position.z = _1570;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1639 = as_type<float>(_138);
        out.gl_Position.z = _1639;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = 1.0 / _294;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = 1.0 / _298;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = _290 + _320;
    bool _324 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_290);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _290 + _338;
    float _342 = _322 * _308;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = _290 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _350 = _290 + _348;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _312;
    float _356 = _340 * _318;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _360 = _290 + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _364 = _290 + _362;
    bool _366 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _306;
    float _380 = _346 * _336;
    bool _382 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _384 = isnan(_290);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = -_376;
    float _400 = _398 + 1.0;
    float _402 = fma(_396, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = 1.0 / _316;
    float _406 = _360 * _354;
    bool _408 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _410 = isnan(_290);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_392;
    float _422 = _420 + 1.0;
    float _424 = -_418;
    float _426 = _424 + 1.0;
    float _428 = _350 * _378;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _376 * _422;
    float _440 = fma(_436, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _418 * _400;
    float _444 = _364 * _404;
    float _446 = fma(_432, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _334 * _426;
    bool _450 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _452 = isnan(_290);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _466 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _468 = isnan(_290);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -_334;
    float _480 = _478 + 1.0;
    bool _482 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _484 = isnan(_290);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _502 = _460 * _480;
    float _504 = -_460;
    float _506 = _504 + 1.0;
    float _508 = -_492;
    float _510 = _508 + 1.0;
    float _512 = fma(_496, _356, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _514 = fma(_464, _356, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _516 = _476 * _510;
    float _518 = -_476;
    float _520 = _518 + 1.0;
    float _522 = fma(_500, _356, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _492 * _506;
    float _526 = _440 * _516;
    float _528 = _446 * _516;
    float _530 = _402 * _516;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _552 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _554 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _556;
    float _560 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _562 = fma(_542, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _564 = fma(_546, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = fma(_550, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _568 = fma(_534, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _570 = fma(_558, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _572 = fma(_512, _524, _552);
    float _574 = fma(_514, _524, _554);
    float _576 = fma(_522, _524, _560);
    float _578 = fma(_538, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _580 = fma(_568, _502, _572);
    float _582 = fma(_570, _502, _576);
    float _584 = fma(_578, _502, _574);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _594;
    float _598 = fma(_562, _448, _580);
    float _600 = fma(_566, _448, _582);
    float _602 = fma(_588, _406, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _604 = fma(_592, _406, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _606 = fma(_564, _448, _584);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _616 = fma(_596, _406, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _622 = fma(_610, _444, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _624 = fma(_614, _444, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _626 = fma(_604, _442, _606);
    float _628 = fma(_602, _442, _598);
    float _630 = fma(_620, _444, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _632 = fma(_616, _442, _600);
    float _634 = fma(_624, _438, _626);
    float _636 = fma(_622, _438, _628);
    float _638 = fma(_630, _438, _632);
    float _640 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].y, _634);
    float _642 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].z, _638);
    bool _646 = !_352;
    float _664;
    if (!_646)
    {
        float _648 = in.m_51.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_86);
        float _670 = 1.0 / _668;
        float _672 = _120 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _680 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _682 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _684 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _678);
    float _686 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _680);
    float _688 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _690 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _684);
    float _692 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _686);
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = _690 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _694 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _706 = _696 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _710 = _698 + _708;
    float _712 = _702 * _702;
    float _714 = fma(_706, _706, _712);
    float _716 = fma(_710, _710, _714);
    float _718 = rsqrt(_716);
    float _720 = _702 * _718;
    float _722 = _706 * _718;
    float _724 = -_720;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _702);
    float _728 = -_722;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _706);
    float _732 = _710 * _718;
    float _734 = _726 * _726;
    float _736 = in.m_49.x;
    float _738 = in.m_49.y;
    float _740 = in.m_49.z;
    float _742 = -_732;
    float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _746 = fma(_730, _730, _734);
    float _748 = in.m_53.x;
    float _750 = in.m_53.y;
    float _752 = in.m_53.z;
    float _754 = fma(_744, _744, _746);
    float _756 = sqrt(_754);
    float _758 = _640 * _738;
    float _760 = _642 * _736;
    float _762 = _718 * _756;
    float _764 = _644 * _740;
    float _766 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _750);
    float _770 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _748);
    float _774 = _766 * _762;
    float _776 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _778 = _770 * _762;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _752);
    float _782 = _774 * _768;
    float _784 = _776 * _762;
    float _786 = _778 * _772;
    float _788 = _782 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _790 = _784 * _780;
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _788);
    float _796 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _798 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _794);
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _802 = _698 + _798;
    float _804 = _696 + _800;
    float _806 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _810 = _802 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _804 + _812;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _806);
    float _818 = _810 * _810;
    float _820 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _822 = fma(_814, _814, _818);
    float _824 = _694 + _820;
    float _826 = sqrt(_822);
    bool _828 = _826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _830 = _806;
    float _832 = _820;
    float _834 = _790;
    if (!_828)
    {
        _830 = _804;
    }
    float _836 = _830;
    float _838 = _836;
    if (!_828)
    {
        _832 = _802;
    }
    float _840 = _832;
    float _842 = _840;
    if (!_828)
    {
        _834 = _824;
    }
    float _844 = _834;
    bool _846 = !_828;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _854 = _826 + _852;
        float _856 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _858 = rsqrt(_822);
        float _860 = _854 * _850;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = _872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_870, _856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = fma(_824, _866, _874);
        float _880 = _858 * _876;
        float _882 = fma(_814, _880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_810, _880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _848 = _878;
        _838 = _882;
        _842 = _884;
    }
    float _886 = _848;
    float _888 = _838;
    float _890 = _842;
    float _892 = -_720;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _896 = -_722;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _888);
    float _900 = -_732;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _906 = _894 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _914 = _902 + _912;
    float _916 = _906 * _906;
    float _918 = fma(_910, _910, _916);
    float _920 = fma(_914, _914, _918);
    float _922 = rsqrt(_920);
    float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _910 * _924;
    float _928 = _914 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _824;
    float _946 = _934;
    float _948 = _942;
    float _950 = _906;
    float _952 = _924;
    float _954 = _926;
    if (_938)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _956;
    }
    float _958 = _944;
    if (_938)
    {
        float _960 = rsqrt(_934);
        _946 = _960;
    }
    float _962 = _946;
    float _964 = _958;
    if (_938)
    {
        float _966 = _942 * _958;
        _948 = _966;
    }
    float _968 = _948;
    if (_938)
    {
        float _970 = _968 * 0.15915493667125701904296875;
        _964 = _970;
    }
    float _972 = _964;
    float _974 = _914;
    float _976 = _972;
    if (_938)
    {
        float _978 = _972 * 6.283185482025146484375;
        float _980 = sin(_978);
        _974 = _980;
    }
    float _982 = _974;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _986 = precise::max(0.0, _984);
    float _988 = _922;
    float _990 = _986;
    if (_938)
    {
        float _992 = _972 * 6.283185482025146484375;
        float _994 = cos(_992);
        _988 = _994;
    }
    float _996 = _988;
    float _998 = -_924;
    float _1000 = -_986;
    float _1002 = fma(_906, _998, _1000);
    if (_938)
    {
        float _1004 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _950 = _1004;
    }
    float _1006 = _950;
    float _1008 = _1006;
    float _1010 = _982;
    if (_938)
    {
        float _1012 = fma(_982, _1006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1008 = _1012;
    }
    float _1014 = _1008;
    float _1016 = _1014;
    if (!_938)
    {
        _1010 = _930;
    }
    float _1018 = _1010;
    float _1020 = _1018;
    float _1022 = _996;
    if (_938)
    {
        float _1024 = _996 + (-1.0);
        _990 = _1024;
    }
    float _1026 = _990;
    float _1028 = _1026;
    if (_938)
    {
        float _1030 = _962 * _1014;
        _952 = _1030;
    }
    float _1032 = _952;
    if (!_938)
    {
        _1016 = _1002;
    }
    float _1034 = _1016;
    float _1036 = sqrt(_920);
    float _1038 = _1034;
    if (_938)
    {
        float _1040 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _1040;
    }
    float _1042 = _976;
    if (_938)
    {
        float _1044 = _926 * _1032;
        _954 = _1044;
    }
    float _1046 = _954;
    if (!_938)
    {
        _1028 = _928;
    }
    float _1048 = _1028;
    float _1050 = _1048;
    if (_938)
    {
        float _1052 = _928 * _1032;
        _1050 = _1052;
    }
    float _1054 = _1050;
    if (_938)
    {
        float _1056 = fma(_1002, _996, _1042);
        _1038 = _1056;
    }
    float _1058 = _1038;
    if (_938)
    {
        float _1060 = _1046 * _1046;
        _1020 = _1060;
    }
    float _1062 = _1020;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1064 = _1022;
    float _1066 = _1064;
    if (_938)
    {
        float _1068 = _1054 * _1054;
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = fma(_1058, _1058, _1062);
    float _1074 = _1072 + _1070;
    float _1076 = _894 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1078);
    float _1082 = precise::clamp(_1080, 0.0, 1.0);
    float _1084 = _894 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1086 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1076);
    float _1088 = rsqrt(_1074);
    float _1090 = -_1082;
    float _1092 = _1090 + 1.0;
    float _1094 = _894 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1086);
    float _1098 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1084);
    float _1100 = _894 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1102 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1106 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1108 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1100);
    float _1110 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1098);
    float _1112 = abs(_1092);
    float _1114 = log2(_1112);
    float _1116 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1106);
    float _1118 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1120 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1124 = _1088 * _1046;
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1132 = _1088 * _1058;
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1136 = _1088 * _1054;
    float _1138 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1130);
    float _1140 = -_1122;
    float _1142 = fma(_1140, _1102, 1.0);
    float _1144 = -_1134;
    float _1146 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1144);
    float _1148 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1138);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1152 = -_1136;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1146);
    float _1156 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1158 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1148);
    float _1160 = log2(_1142);
    float _1162 = fma(_1154, -0.5, 0.5);
    float _1164 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1166 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1156);
    float _1168 = fma(_1154, 0.5, 0.5);
    float _1170 = _1132 + 1.0;
    float _1172 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1164);
    float _1174 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1166);
    float _1176 = exp2(_1150);
    float _1178 = fma(_1168, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1180 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1172);
    float _1182 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1174);
    float _1184 = fma(_1168, _1178, -0.212114393711090087890625);
    float _1186 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1180);
    float _1188 = 1.0 / _1158;
    float _1190 = _1160 * 0.693147182464599609375;
    float _1192 = fma(_1168, _1184, 1.570728778839111328125);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1196 = sqrt(_1162);
    float _1198 = -_1132;
    float _1200 = fma(_1176, _1170, _1198);
    float _1202 = fma(_1200, 0.5, 0.5);
    float _1204 = _1182 * _1188;
    float _1206 = _1186 * _1188;
    float _1208 = fma(_1204, 0.5, 0.5);
    float _1210 = fma(_1206, -0.5, 0.5);
    float _1212 = _1196 * 0.636619746685028076171875;
    float _1214 = -_1192;
    float _1216 = fma(_1212, _1214, 1.0);
    float3 _3421 = float3(_1208, _1210, _1194);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3421, float3(0.0), isnan(_3421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3421, float3(0.0), isnan(_3421)), level(0.0)).x;
    float3 _3432 = float3(_1208, _1210, _1194);
    float4 _1221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3432, float3(0.0), isnan(_3432)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3432, float3(0.0), isnan(_3432)), level(0.0)).xyzw;
    float _1223 = _1221.x;
    float _1225 = _1221.y;
    float _1227 = _1221.z;
    float _1229 = _1221.w;
    float2 _3449 = float2(_1216, _1202);
    float3 _1233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3449, float2(0.0), isnan(_3449)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3449, float2(0.0), isnan(_3449)), level(0.0)).xyz;
    float _1235 = _1233.x;
    float _1237 = _1233.y;
    float _1239 = _1233.z;
    float _1241 = in.m_55.y;
    float _1243 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1245 = in.m_51.y;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    float _1251 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1243);
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1261 = in.m_55.x;
    float _1263 = 1.0 / _1259;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1273 = _380;
    if (_1249)
    {
        float _1275 = in.m_51.x;
        _1273 = _1275;
    }
    float _1277 = _1273;
    float _1279 = 1.0 / _1267;
    float _1281 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1283 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1251);
    float _1285 = -_1241;
    float _1287 = _1285 + 1.0;
    float _1289 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1283);
    bool _1291 = _1245 > 0.5;
    float _1293 = 1.0 / _1271;
    bool _1295 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1297 = isnan(_674);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1311 = _1241;
    if (_1255)
    {
        float _1313 = _1291 ? _1287 : _1241;
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1319 = _1289 + _1317;
    bool _1321 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1323 = isnan(_674);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1339 = _674 + _1337;
    float _1341 = exp2(_1281);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1343;
    float _1347 = _1335 * _1279;
    bool _1349 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1351 = isnan(_674);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1363 = _1345 * _1263;
    float _1365 = -_1331;
    float _1367 = _1365 + 1.0;
    bool _1369 = _1277 > 0.5;
    bool _1371 = _1369 && _1249;
    float _1373 = _1309 * _1293;
    float _1375 = fma(_1363, _1339, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1377 = _1305 * _1367;
    float _1379 = -_1305;
    float _1381 = _1379 + 1.0;
    bool _1383 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1385 = isnan(_674);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1397 = _1277;
    if (_1249)
    {
        _1397 = _1261;
    }
    float _1399 = _1397;
    float _1401 = _1359 * _1381;
    float _1403 = -_1359;
    float _1405 = _1403 + 1.0;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1409 = _674 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1413 = _674 + _1411;
    float _1415 = -_1341;
    float _1417 = _1415 + 1.0;
    float _1419 = _1393 * _1405;
    float _1421 = fma(_1373, _1409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1423 = fma(_1347, _1413, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1425 = _1375 * _1419;
    float _1427 = -_1393;
    float _1429 = _1427 + 1.0;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1433 = _1399;
    float _1435 = _1413;
    if (_1371)
    {
        float _1437 = -_1399;
        float _1439 = _1437 + 1.0;
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1449 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1425);
    if (!_1249)
    {
        _1435 = _1261;
    }
    float _1451 = _1435;
    float _1453 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1455 = _1451;
    if (_1249)
    {
        _1455 = _1441;
    }
    float _1457 = _1455;
    float _1459 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = fma(_1421, _1401, _1449);
    float _1465 = _1361 * _1395;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1469 = fma(_1423, _1377, _1463);
    out.m_59.x = _1459;
    out.m_59.y = _1453;
    out.m_59.z = _1461;
    float _1471 = _1467 * _1431;
    float _1473 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1469);
    float _1475 = _1158 + _1319;
    float _1477 = _1473 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1471;
    out.m_61.y = _1465;
    float _1479 = _1475 * 0.5;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1483 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1186;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1158;
    out.m_63.x = _1489;
    out.m_63.y = _1493;
    out.m_63.z = _1495;
    out.m_63.w = _1477;
    out.m_65.z = _1479;
    out.m_65.w = _1158;
    out.m_45.x = _1491;
    float _1497 = _1483 * _1218;
    float _1499 = _1229 * _1497;
    float _1501 = _1239 * _1497;
    float _1503 = -_1483;
    float _1505 = _1503 + 1.0;
    float _1507 = fma(_1235, _1499, _1223);
    float _1509 = fma(_1237, _1499, _1225);
    float _1511 = _1229 * _1505;
    float _1513 = fma(_1229, _1501, _1227);
    out.m_67.x = _1507;
    out.m_67.y = _1509;
    out.m_67.z = _1513;
    out.m_67.w = _1511;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    bool _666 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _81 = in.m_42.w;
    float _83 = trunc(_81);
    int _86 = int(_83);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _92;
    float _96 = _94;
    if (!_90)
    {
        out.m_45.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _94 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1570 = as_type<float>(_102);
        out.gl_Position.z = _1570;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_47.w;
    bool _108 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _110 = isnan(_106);
    bool _112 = _108 || _110;
    bool _114 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _116 = _112 || _114;
    float _118 = -_106;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_116)
    {
        float _122 = float(_86);
        _96 = _122;
    }
    float _124 = _96;
    bool _126 = _120 >= _124;
    bool _128 = !_116;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_45.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _104 = as_type<int>(_136);
    }
    int _138 = _104;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1639 = as_type<float>(_138);
        out.gl_Position.z = _1639;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_49.w;
    float _142 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_47.x;
    float _156 = in.m_47.y;
    float _158 = in.m_47.z;
    float _160 = in.m_42.x;
    float _162 = in.m_42.y;
    float _164 = in.m_42.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_51.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_86);
        float _286 = 1.0 / _284;
        float _288 = _120 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _292;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _308 = 1.0 / _294;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _318 = 1.0 / _298;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = _290 + _320;
    bool _324 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _326 = isnan(_290);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _340 = _290 + _338;
    float _342 = _322 * _308;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _346 = _290 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _350 = _290 + _348;
    bool _352 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _354 = 1.0 / _312;
    float _356 = _340 * _318;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _360 = _290 + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _364 = _290 + _362;
    bool _366 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_290);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = 1.0 / _306;
    float _380 = _346 * _336;
    bool _382 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _384 = isnan(_290);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _394;
    float _398 = -_376;
    float _400 = _398 + 1.0;
    float _402 = fma(_396, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = 1.0 / _316;
    float _406 = _360 * _354;
    bool _408 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _410 = isnan(_290);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -_392;
    float _422 = _420 + 1.0;
    float _424 = -_418;
    float _426 = _424 + 1.0;
    float _428 = _350 * _378;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _434;
    float _438 = _376 * _422;
    float _440 = fma(_436, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = _418 * _400;
    float _444 = _364 * _404;
    float _446 = fma(_432, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = _334 * _426;
    bool _450 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _452 = isnan(_290);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _466 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _468 = isnan(_290);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = -_334;
    float _480 = _478 + 1.0;
    bool _482 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _484 = isnan(_290);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _502 = _460 * _480;
    float _504 = -_460;
    float _506 = _504 + 1.0;
    float _508 = -_492;
    float _510 = _508 + 1.0;
    float _512 = fma(_496, _356, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _514 = fma(_464, _356, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _516 = _476 * _510;
    float _518 = -_476;
    float _520 = _518 + 1.0;
    float _522 = fma(_500, _356, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _524 = _492 * _506;
    float _526 = _440 * _516;
    float _528 = _446 * _516;
    float _530 = _402 * _516;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _552 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].x, _526);
    float _554 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].y, _528);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _556;
    float _560 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[143].z, _530);
    float _562 = fma(_542, _428, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _564 = fma(_546, _428, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _566 = fma(_550, _428, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _568 = fma(_534, _380, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _570 = fma(_558, _380, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _572 = fma(_512, _524, _552);
    float _574 = fma(_514, _524, _554);
    float _576 = fma(_522, _524, _560);
    float _578 = fma(_538, _380, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _580 = fma(_568, _502, _572);
    float _582 = fma(_570, _502, _576);
    float _584 = fma(_578, _502, _574);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _594;
    float _598 = fma(_562, _448, _580);
    float _600 = fma(_566, _448, _582);
    float _602 = fma(_588, _406, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _604 = fma(_592, _406, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _606 = fma(_564, _448, _584);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _616 = fma(_596, _406, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _620 = _618 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _622 = fma(_610, _444, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _624 = fma(_614, _444, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _626 = fma(_604, _442, _606);
    float _628 = fma(_602, _442, _598);
    float _630 = fma(_620, _444, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _632 = fma(_616, _442, _600);
    float _634 = fma(_624, _438, _626);
    float _636 = fma(_622, _438, _628);
    float _638 = fma(_630, _438, _632);
    float _640 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].y, _634);
    float _642 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].x, _636);
    float _644 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].z, _638);
    bool _646 = !_352;
    float _664;
    if (!_646)
    {
        float _648 = in.m_51.x;
        float _650 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _652 = _648 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _654 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _656 = _654 * _650;
        float _658 = floor(_656);
        float _660 = -_658;
        float _662 = _656 + _660;
        _664 = _662;
        _666 = true;
    }
    else
    {
        float _668 = float(_86);
        float _670 = 1.0 / _668;
        float _672 = _120 * _670;
        _664 = _672;
    }
    _666 = false;
    float _674 = _664;
    float _676 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _678 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _680 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _682 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _676);
    float _684 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _678);
    float _686 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _680);
    float _688 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _690 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _684);
    float _692 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _686);
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = _690 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _698 = _692 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _694 + _700;
    float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _706 = _696 + _704;
    float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _710 = _698 + _708;
    float _712 = _702 * _702;
    float _714 = fma(_706, _706, _712);
    float _716 = fma(_710, _710, _714);
    float _718 = rsqrt(_716);
    float _720 = _702 * _718;
    float _722 = _706 * _718;
    float _724 = -_720;
    float _726 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[18].w, _702);
    float _728 = -_722;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _706);
    float _732 = _710 * _718;
    float _734 = _726 * _726;
    float _736 = in.m_49.x;
    float _738 = in.m_49.y;
    float _740 = in.m_49.z;
    float _742 = -_732;
    float _744 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _746 = fma(_730, _730, _734);
    float _748 = in.m_53.x;
    float _750 = in.m_53.y;
    float _752 = in.m_53.z;
    float _754 = fma(_744, _744, _746);
    float _756 = sqrt(_754);
    float _758 = _640 * _738;
    float _760 = _642 * _736;
    float _762 = _718 * _756;
    float _764 = _644 * _740;
    float _766 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _750);
    float _770 = _760 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _748);
    float _774 = _766 * _762;
    float _776 = _764 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _778 = _770 * _762;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _752);
    float _782 = _774 * _768;
    float _784 = _776 * _762;
    float _786 = _778 * _772;
    float _788 = _782 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _790 = _784 * _780;
    float _792 = _782 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[10].x, _788);
    float _796 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[8].x, _792);
    float _798 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[10].z, _794);
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _802 = _698 + _798;
    float _804 = _696 + _800;
    float _806 = _782 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _810 = _802 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _814 = _804 + _812;
    float _816 = fma(_786, (*spvDescriptorSet0.vp_c10)._m0[9].x, _806);
    float _818 = _810 * _810;
    float _820 = fma(_790, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _822 = fma(_814, _814, _818);
    float _824 = _694 + _820;
    float _826 = sqrt(_822);
    bool _828 = _826 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _830 = _806;
    float _832 = _820;
    float _834 = _790;
    if (!_828)
    {
        _830 = _804;
    }
    float _836 = _830;
    float _838 = _836;
    if (!_828)
    {
        _832 = _802;
    }
    float _840 = _832;
    float _842 = _840;
    if (!_828)
    {
        _834 = _824;
    }
    float _844 = _834;
    bool _846 = !_828;
    float _848 = _844;
    if (!_846)
    {
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _854 = _826 + _852;
        float _856 = _824 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _858 = rsqrt(_822);
        float _860 = _854 * _850;
        float _862 = _860 * 0.15915493667125701904296875;
        float _864 = _862 * 6.283185482025146484375;
        float _866 = cos(_864);
        float _868 = _862 * 6.283185482025146484375;
        float _870 = sin(_868);
        float _872 = _866 + (-1.0);
        float _874 = _872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _876 = fma(_870, _856, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _878 = fma(_824, _866, _874);
        float _880 = _858 * _876;
        float _882 = fma(_814, _880, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _884 = fma(_810, _880, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _848 = _878;
        _838 = _882;
        _842 = _884;
    }
    float _886 = _848;
    float _888 = _838;
    float _890 = _842;
    float _892 = -_720;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[18].w, _886);
    float _896 = -_722;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _888);
    float _900 = -_732;
    float _902 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _906 = _894 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _910 = _898 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _914 = _902 + _912;
    float _916 = _906 * _906;
    float _918 = fma(_910, _910, _916);
    float _920 = fma(_914, _914, _918);
    float _922 = rsqrt(_920);
    float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _926 = _910 * _924;
    float _928 = _914 * _924;
    float _930 = _926 * _926;
    float _932 = _928 * _928;
    float _934 = _930 + _932;
    float _936 = sqrt(_934);
    bool _938 = _936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _942 = _936 + _940;
    float _944 = _824;
    float _946 = _934;
    float _948 = _942;
    float _950 = _906;
    float _952 = _924;
    float _954 = _926;
    if (_938)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _944 = _956;
    }
    float _958 = _944;
    if (_938)
    {
        float _960 = rsqrt(_934);
        _946 = _960;
    }
    float _962 = _946;
    float _964 = _958;
    if (_938)
    {
        float _966 = _942 * _958;
        _948 = _966;
    }
    float _968 = _948;
    if (_938)
    {
        float _970 = _968 * 0.15915493667125701904296875;
        _964 = _970;
    }
    float _972 = _964;
    float _974 = _914;
    float _976 = _972;
    if (_938)
    {
        float _978 = _972 * 6.283185482025146484375;
        float _980 = sin(_978);
        _974 = _980;
    }
    float _982 = _974;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _986 = precise::max(0.0, _984);
    float _988 = _922;
    float _990 = _986;
    if (_938)
    {
        float _992 = _972 * 6.283185482025146484375;
        float _994 = cos(_992);
        _988 = _994;
    }
    float _996 = _988;
    float _998 = -_924;
    float _1000 = -_986;
    float _1002 = fma(_906, _998, _1000);
    if (_938)
    {
        float _1004 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _950 = _1004;
    }
    float _1006 = _950;
    float _1008 = _1006;
    float _1010 = _982;
    if (_938)
    {
        float _1012 = fma(_982, _1006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1008 = _1012;
    }
    float _1014 = _1008;
    float _1016 = _1014;
    if (!_938)
    {
        _1010 = _930;
    }
    float _1018 = _1010;
    float _1020 = _1018;
    float _1022 = _996;
    if (_938)
    {
        float _1024 = _996 + (-1.0);
        _990 = _1024;
    }
    float _1026 = _990;
    float _1028 = _1026;
    if (_938)
    {
        float _1030 = _962 * _1014;
        _952 = _1030;
    }
    float _1032 = _952;
    if (!_938)
    {
        _1016 = _1002;
    }
    float _1034 = _1016;
    float _1036 = sqrt(_920);
    float _1038 = _1034;
    if (_938)
    {
        float _1040 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _976 = _1040;
    }
    float _1042 = _976;
    if (_938)
    {
        float _1044 = _926 * _1032;
        _954 = _1044;
    }
    float _1046 = _954;
    if (!_938)
    {
        _1028 = _928;
    }
    float _1048 = _1028;
    float _1050 = _1048;
    if (_938)
    {
        float _1052 = _928 * _1032;
        _1050 = _1052;
    }
    float _1054 = _1050;
    if (_938)
    {
        float _1056 = fma(_1002, _996, _1042);
        _1038 = _1056;
    }
    float _1058 = _1038;
    if (_938)
    {
        float _1060 = _1046 * _1046;
        _1020 = _1060;
    }
    float _1062 = _1020;
    if (!_938)
    {
        _1022 = _932;
    }
    float _1064 = _1022;
    float _1066 = _1064;
    if (_938)
    {
        float _1068 = _1054 * _1054;
        _1066 = _1068;
    }
    float _1070 = _1066;
    float _1072 = fma(_1058, _1058, _1062);
    float _1074 = _1072 + _1070;
    float _1076 = _894 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1080 = fma(_1036, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1078);
    float _1082 = precise::clamp(_1080, 0.0, 1.0);
    float _1084 = _894 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1086 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1076);
    float _1088 = rsqrt(_1074);
    float _1090 = -_1082;
    float _1092 = _1090 + 1.0;
    float _1094 = _894 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1096 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1086);
    float _1098 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1084);
    float _1100 = _894 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1102 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1104 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1106 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1094);
    float _1108 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1100);
    float _1110 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1098);
    float _1112 = abs(_1092);
    float _1114 = log2(_1112);
    float _1116 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1106);
    float _1118 = fma(_902, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1120 = _1110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1122 = _1104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1124 = _1088 * _1046;
    float _1126 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1130 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1132 = _1088 * _1058;
    float _1134 = _1124 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1136 = _1088 * _1054;
    float _1138 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1130);
    float _1140 = -_1122;
    float _1142 = fma(_1140, _1102, 1.0);
    float _1144 = -_1134;
    float _1146 = fma(_1132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1144);
    float _1148 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1138);
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1152 = -_1136;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1146);
    float _1156 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1158 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1148);
    float _1160 = log2(_1142);
    float _1162 = fma(_1154, -0.5, 0.5);
    float _1164 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1166 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1156);
    float _1168 = fma(_1154, 0.5, 0.5);
    float _1170 = _1132 + 1.0;
    float _1172 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1164);
    float _1174 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1166);
    float _1176 = exp2(_1150);
    float _1178 = fma(_1168, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1180 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1172);
    float _1182 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1174);
    float _1184 = fma(_1168, _1178, -0.212114393711090087890625);
    float _1186 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1180);
    float _1188 = 1.0 / _1158;
    float _1190 = _1160 * 0.693147182464599609375;
    float _1192 = fma(_1168, _1184, 1.570728778839111328125);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1196 = sqrt(_1162);
    float _1198 = -_1132;
    float _1200 = fma(_1176, _1170, _1198);
    float _1202 = fma(_1200, 0.5, 0.5);
    float _1204 = _1182 * _1188;
    float _1206 = _1186 * _1188;
    float _1208 = fma(_1204, 0.5, 0.5);
    float _1210 = fma(_1206, -0.5, 0.5);
    float _1212 = _1196 * 0.636619746685028076171875;
    float _1214 = -_1192;
    float _1216 = fma(_1212, _1214, 1.0);
    float3 _3421 = float3(_1208, _1210, _1194);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3421, float3(0.0), isnan(_3421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3421, float3(0.0), isnan(_3421)), level(0.0)).x;
    float3 _3432 = float3(_1208, _1210, _1194);
    float4 _1221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3432, float3(0.0), isnan(_3432)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3432, float3(0.0), isnan(_3432)), level(0.0)).xyzw;
    float _1223 = _1221.x;
    float _1225 = _1221.y;
    float _1227 = _1221.z;
    float _1229 = _1221.w;
    float2 _3449 = float2(_1216, _1202);
    float3 _1233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3449, float2(0.0), isnan(_3449)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3449, float2(0.0), isnan(_3449)), level(0.0)).xyz;
    float _1235 = _1233.x;
    float _1237 = _1233.y;
    float _1239 = _1233.z;
    float _1241 = in.m_55.y;
    float _1243 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1245 = in.m_51.y;
    int _1247 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1249 = _1247 != 0;
    float _1251 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1243);
    int _1253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1255 = _1253 != 0;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1261 = in.m_55.x;
    float _1263 = 1.0 / _1259;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1269 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1271 = _1269 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1273 = _380;
    if (_1249)
    {
        float _1275 = in.m_51.x;
        _1273 = _1275;
    }
    float _1277 = _1273;
    float _1279 = 1.0 / _1267;
    float _1281 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _1283 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1251);
    float _1285 = -_1241;
    float _1287 = _1285 + 1.0;
    float _1289 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1283);
    bool _1291 = _1245 > 0.5;
    float _1293 = 1.0 / _1271;
    bool _1295 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1297 = isnan(_674);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1309 = _1307 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1311 = _1241;
    if (_1255)
    {
        float _1313 = _1291 ? _1287 : _1241;
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1319 = _1289 + _1317;
    bool _1321 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1323 = isnan(_674);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1339 = _674 + _1337;
    float _1341 = exp2(_1281);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1343;
    float _1347 = _1335 * _1279;
    bool _1349 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1351 = isnan(_674);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = _1315 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1363 = _1345 * _1263;
    float _1365 = -_1331;
    float _1367 = _1365 + 1.0;
    bool _1369 = _1277 > 0.5;
    bool _1371 = _1369 && _1249;
    float _1373 = _1309 * _1293;
    float _1375 = fma(_1363, _1339, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1377 = _1305 * _1367;
    float _1379 = -_1305;
    float _1381 = _1379 + 1.0;
    bool _1383 = _674 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1385 = isnan(_674);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1391 = _1387 || _1389;
    float _1393 = float(_1391);
    float _1395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1397 = _1277;
    if (_1249)
    {
        _1397 = _1261;
    }
    float _1399 = _1397;
    float _1401 = _1359 * _1381;
    float _1403 = -_1359;
    float _1405 = _1403 + 1.0;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1409 = _674 + _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1413 = _674 + _1411;
    float _1415 = -_1341;
    float _1417 = _1415 + 1.0;
    float _1419 = _1393 * _1405;
    float _1421 = fma(_1373, _1409, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1423 = fma(_1347, _1413, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1425 = _1375 * _1419;
    float _1427 = -_1393;
    float _1429 = _1427 + 1.0;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1433 = _1399;
    float _1435 = _1413;
    if (_1371)
    {
        float _1437 = -_1399;
        float _1439 = _1437 + 1.0;
        _1433 = _1439;
    }
    float _1441 = _1433;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1449 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1425);
    if (!_1249)
    {
        _1435 = _1261;
    }
    float _1451 = _1435;
    float _1453 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1455 = _1451;
    if (_1249)
    {
        _1455 = _1441;
    }
    float _1457 = _1455;
    float _1459 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1461 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1463 = fma(_1421, _1401, _1449);
    float _1465 = _1361 * _1395;
    float _1467 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1469 = fma(_1423, _1377, _1463);
    out.m_59.x = _1459;
    out.m_59.y = _1453;
    out.m_59.z = _1461;
    float _1471 = _1467 * _1431;
    float _1473 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1469);
    float _1475 = _1158 + _1319;
    float _1477 = _1473 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _1471;
    out.m_61.y = _1465;
    float _1479 = _1475 * 0.5;
    float _1481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1483 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1491 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1182;
    out.gl_Position.y = _1186;
    out.gl_Position.z = _1319;
    out.gl_Position.w = _1158;
    out.m_63.x = _1489;
    out.m_63.y = _1493;
    out.m_63.z = _1495;
    out.m_63.w = _1477;
    out.m_65.z = _1479;
    out.m_65.w = _1158;
    out.m_45.x = _1491;
    float _1497 = _1483 * _1218;
    float _1499 = _1229 * _1497;
    float _1501 = _1239 * _1497;
    float _1503 = -_1483;
    float _1505 = _1503 + 1.0;
    float _1507 = fma(_1235, _1499, _1223);
    float _1509 = fma(_1237, _1499, _1225);
    float _1511 = _1229 * _1505;
    float _1513 = fma(_1229, _1501, _1227);
    out.m_67.x = _1507;
    out.m_67.y = _1509;
    out.m_67.z = _1513;
    out.m_67.w = _1511;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

