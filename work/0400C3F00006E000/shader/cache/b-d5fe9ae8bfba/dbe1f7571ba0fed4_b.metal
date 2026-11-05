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
    float4 m_53 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _578 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1954 = as_type<float>(_112);
        out.gl_Position.z = _1954;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2024 = as_type<float>(_150);
        out.gl_Position.z = _2024;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_49.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _174);
    float _270 = fma(_264, _152, _172);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_51.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_96);
        float _298 = 1.0 / _296;
        float _300 = _130 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _342;
    float _358 = -_354;
    float _360 = _358 + 1.0;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = _334 * _360;
    float _366 = -_334;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _338;
    float _372 = _322 * _356;
    float _374 = _306 * _370;
    float _376 = -_318;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _354 * _378;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _394 * _364;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = _396 * _364;
    float _408 = _398 * _364;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _428 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _430 = fma(_422, _384, _420);
    float _432 = fma(_418, _384, _426);
    float _434 = fma(_424, _384, _428);
    float _436 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].x, _430);
    float _438 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].y, _432);
    float _440 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].z, _434);
    bool _442 = !_362;
    float _460;
    if (!_442)
    {
        float _444 = in.m_51.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_96);
        float _466 = 1.0 / _464;
        float _468 = _130 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = in.m_49.x;
    float _478 = in.m_49.y;
    float _480 = in.m_49.z;
    bool _482 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_470);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _500 = isnan(_470);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    float _514 = -_492;
    float _516 = _514 + 1.0;
    bool _518 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _520 = 1.0 / _496;
    float _522 = _508 * _516;
    float _524 = -_508;
    float _526 = _524 + 1.0;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = _512 * _520;
    float _532 = _440 * _480;
    float _534 = _438 * _478;
    float _536 = fma(_530, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _538 = _436 * _476;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _542 = _536 * _522;
    float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[115].x, _542);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[116].x, _546);
    float _552 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _552;
    out.m_53.y = _554;
    out.m_53.z = _544;
    out.m_53.w = _556;
    bool _558 = !_518;
    float _576;
    if (!_558)
    {
        float _560 = in.m_51.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_96);
        float _582 = 1.0 / _580;
        float _584 = _130 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_51.z;
    float _590 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _592 = in.m_51.x;
    float _594 = in.m_51.y;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _606 = _604 != 0;
    float _608 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _612 = log2(_610);
    bool _614 = !_598;
    int _616 = _614 ? 0 : 1;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _620 = abs(_616);
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    float _626 = _612 * _130;
    float _628 = _588 * 2.0;
    float _630 = _594 * 2.0;
    float _632 = _592 * 2.0;
    float _634 = floor(_628);
    float _636 = _592 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _638 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[191].x, _592);
    float _640 = -_618;
    float _642 = fma(_636, 2.0, _640);
    float _644 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _646 = floor(_630);
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _650 = fma(_644, -2.0, _648);
    float _652 = floor(_632);
    bool _654 = _634 > 0.0;
    bool _656 = _634 >= 0.0;
    bool _658 = isnan(_634);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = _594 + _592;
    int _668 = _664 ? 0 : 1;
    float _670 = exp2(_626);
    float _672 = _594 + _588;
    bool _674 = _646 >= 0.0;
    bool _676 = isnan(_646);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    float _684 = _666 + (-1.0);
    int _686 = ~_668;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = _672 + (-1.0);
    int _694 = _690;
    if (!_654)
    {
        int _696 = ~_668;
        int _698 = _696 + 1;
        _694 = _698;
    }
    int _700 = _694;
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _704 = _646 > 0.0;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _708 = in.m_55.x;
    float _710 = in.m_55.y;
    float _712 = in.m_55.z;
    bool _714 = _652 > 0.0;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _718 = 1.0 + _716;
    bool _720 = _652 >= 0.0;
    bool _722 = isnan(_652);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _732 = 1.0 / _718;
    float _734 = in.m_57.x;
    float _736 = in.m_57.y;
    float _738 = in.m_57.z;
    bool _740 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(1.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[78].z, _730);
    int _752 = _728 ? 0 : 1;
    float _754 = -_670;
    float _756 = _754 + 1.0;
    bool _758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _770 = -_130;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[76].x, _642);
    float _774 = float(_620);
    float _776 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _750);
    float _778 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].w, _768);
    float _780 = _766 ? _756 : 0.0;
    float _782 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _650);
    float _784 = float(_700);
    float _786 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _778);
    int _788 = ~_752;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    int _794 = _792;
    if (_748)
    {
        float _796 = _780 * _732;
        _132 = _796;
    }
    float _798 = _132;
    if (!_714)
    {
        int _800 = ~_752;
        int _802 = _800 + 1;
        _794 = _802;
    }
    int _804 = _794;
    float _806 = _774 * _784;
    int _808 = abs(_624);
    float _810 = _592 + (-0.5);
    float _812 = float(_804);
    float _814 = _806 * (-2.0);
    float _816 = float(_808);
    float _818 = _638 + _712;
    int _820 = _682 ? 0 : 1;
    float _822 = fma(_814, _734, _734);
    bool _824 = !_606;
    int _826 = _824 ? 0 : 1;
    float _828 = _816 * _812;
    int _830 = ~_820;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[196].x, _822);
    int _838 = _834;
    if (!_704)
    {
        int _840 = ~_820;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_702, _814, _702);
    float _848 = _828 * (-2.0);
    int _850 = abs(_826);
    float _852 = _818 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _854 = _588 + _592;
    float _856 = fma(_848, _736, _736);
    float _858 = fma(_706, _848, _706);
    float _860 = float(_844);
    float _862 = _852 * 0.15915493667125701904296875;
    float _864 = float(_850);
    float _866 = in.m_59.x;
    float _868 = _854 + (-1.0);
    float _870 = _862 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _594 + (-0.5);
    float _876 = _864 * _860;
    float _878 = _588 + (-0.5);
    float _880 = fma(_846, _798, _836);
    float _882 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].y, _856);
    float _884 = _876 * (-2.0);
    float _886 = _880 * 0.15915493667125701904296875;
    float _888 = fma(_884, _738, _738);
    float _890 = fma(_858, _798, _882);
    float _892 = _886 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].z, _888);
    float _900 = _890 * 0.15915493667125701904296875;
    float _902 = _872 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _904 = fma(_896, _884, _896);
    float _906 = _886 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = fma(_902, 0.300000011920928955078125, _708);
    float _912 = fma(_904, _798, _898);
    float _914 = _866 * _866;
    float _916 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _918 = _912 * 0.15915493667125701904296875;
    float _920 = fma(_902, _914, _710);
    float _922 = _900 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _910);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    bool _932 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _940 = _936 || _938;
    float _942 = _926 * _916;
    float _944 = _928 * _608;
    float _946 = _930 * _590;
    float _948 = _900 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _954 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _952);
    float _956 = _918 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = _894 * _924;
    float _962 = _908 * _924;
    float _964 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _954);
    float _966 = _918 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _908 * _950;
    float _972 = _894 * _950;
    float _974 = _908 * _958;
    float _976 = _950 * _958;
    float _978 = _894 * _958;
    float _980 = _924 * _958;
    float _982 = _974 * _946;
    float _984 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = _978 * _946;
    float _988 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _990 = fma(_968, _970, _960);
    float _992 = fma(_968, _960, _970);
    float _994 = -_962;
    float _996 = fma(_968, _972, _994);
    float _998 = -_946;
    float _1000 = _968 * _998;
    float _1002 = -_972;
    float _1004 = fma(_968, _962, _1002);
    float _1006 = fma(_990, _942, _982);
    float _1008 = fma(_996, _942, _986);
    float _1010 = fma(_976, _942, _1000);
    float _1012 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _1014 = fma(_1004, _944, _1006);
    float _1016 = fma(_992, _944, _1008);
    float _1018 = fma(_980, _944, _1010);
    float _1020 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1026 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _988);
    float _1028 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1022);
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1024);
    float _1034 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1030);
    float _1040 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1032);
    float _1042 = _908;
    if (_940)
    {
        _1042 = 1.0;
    }
    float _1044 = _1042;
    float _1046 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = _1028 + _1038;
    float _1050 = _1034 + _1040;
    float _1052 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1060 = _1050 + _1058;
    float _1062 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1052);
    float _1064 = _1056 * _1056;
    float _1066 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1062);
    float _1068 = fma(_1060, _1060, _1064);
    float _1070 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1072 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1074 = sqrt(_1068);
    float _1076 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1070);
    float _1078 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1080 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1076);
    float _1082 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1078);
    float _1084 = 1.0 / _1072;
    float _1086 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1088 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1082);
    float _1090 = _1086 + _1072;
    float _1092 = _1046 + _1088;
    bool _1094 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1090 * _1084;
    float _1098 = _1096 * 0.5;
    float _1100 = _1090;
    float _1102 = _1088;
    float _1104 = _1078;
    float _1106 = _1098;
    float _1108 = _1044;
    if (!_1094)
    {
        _1100 = _1050;
    }
    float _1110 = _1100;
    float _1112 = _1110;
    if (!_1094)
    {
        _1102 = _1048;
    }
    float _1114 = _1102;
    float _1116 = _1114;
    if (!_1094)
    {
        _1104 = _1092;
    }
    float _1118 = _1104;
    bool _1120 = !_1094;
    float _1122 = _1118;
    if (!_1120)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1128 = _1074 + _1126;
        float _1130 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = rsqrt(_1068);
        float _1134 = _1128 * _1124;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _1136 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1136 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 + (-1.0);
        float _1148 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = fma(_1144, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1152 = fma(_1092, _1140, _1148);
        float _1154 = _1132 * _1150;
        float _1156 = fma(_1060, _1154, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1158 = fma(_1056, _1154, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1122 = _1152;
        _1112 = _1156;
        _1116 = _1158;
    }
    float _1160 = _1122;
    float _1162 = _1112;
    float _1164 = _1116;
    if (!_940)
    {
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1174 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1172);
        float _1176 = _1168 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = _1170 * 0.15915493667125701904296875;
        float _1182 = _1168 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        float _1186 = 1.0 / _1178;
        float _1188 = _1180 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1184 * _1186;
        float _1194 = _1180 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = _1190 * _1192;
        float _1200 = 1.0 / _1174;
        float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1204 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1202;
        float _1206 = 1.0 / _1198;
        float _1208 = 1.0 / _1204;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1212 = _1200 * _1210;
        float _1214 = _1196 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1218 = fma(_1214, _1212, _1216);
        float _1220 = _1218 * _1208;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        _1106 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1108 = _1222;
    }
    float _1224 = _1106;
    float _1226 = _1108;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1160 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1162 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1164 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1224;
    float _1278 = _1250;
    if (_1264)
    {
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1280;
    }
    float _1282 = _1270;
    if (_1264)
    {
        float _1284 = rsqrt(_1260);
        _1272 = _1284;
    }
    float _1286 = _1272;
    float _1288 = _1286;
    if (_1264)
    {
        float _1290 = _1268 * _1282;
        _1274 = _1290;
    }
    float _1292 = _1274;
    if (_1264)
    {
        float _1294 = _1292 * 0.15915493667125701904296875;
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1282;
    float _1300 = _1296;
    if (_1264)
    {
        float _1302 = _1296 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1240;
    float _1314 = _1310;
    if (_1264)
    {
        float _1316 = _1296 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1250;
    float _1324 = -_1310;
    float _1326 = fma(_1230, _1322, _1324);
    float _1328 = _1326;
    if (_1264)
    {
        float _1330 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1330;
    }
    float _1332 = _1314;
    float _1334 = _1306;
    float _1336 = _1332;
    if (_1264)
    {
        float _1338 = fma(_1306, _1332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    float _1344 = _1320;
    if (_1264)
    {
        float _1346 = _1320 + (-1.0);
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = _1348;
    if (_1264)
    {
        float _1352 = _1286 * _1340;
        _1278 = _1352;
    }
    float _1354 = _1278;
    if (!_1264)
    {
        _1342 = _1252;
    }
    float _1356 = _1342;
    float _1358 = _1356;
    if (_1264)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1360;
    }
    float _1362 = _1300;
    if (_1264)
    {
        float _1364 = _1252 * _1354;
        _1358 = _1364;
    }
    float _1366 = _1358;
    if (!_1264)
    {
        _1350 = _1254;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1264)
    {
        float _1372 = _1254 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1264)
    {
        _1288 = _1256;
    }
    float _1376 = _1288;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = fma(_1326, _1320, _1362);
        _1328 = _1380;
    }
    float _1382 = _1328;
    if (_1264)
    {
        float _1384 = _1366 * _1366;
        _1378 = _1384;
    }
    float _1386 = _1378;
    if (!_1264)
    {
        _1344 = _1258;
    }
    float _1388 = _1344;
    float _1390 = _1388;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = fma(_1382, _1382, _1386);
    float _1398 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1396 + _1394;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1404 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1402);
    float _1406 = precise::clamp(_1404, 0.0, 1.0);
    float _1408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1410 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1412 = rsqrt(_1400);
    float _1414 = -_1406;
    float _1416 = _1414 + 1.0;
    float _1418 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1410);
    float _1422 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1424 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1426 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1428 = abs(_1416);
    float _1430 = log2(_1428);
    float _1432 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1434 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1436 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1438 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1446 = _1412 * _1366;
    float _1448 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1440);
    float _1450 = _1412 * _1382;
    float _1452 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1444);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1456 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1448);
    float _1458 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1460 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1462 = _1412 * _1374;
    float _1464 = -_1454;
    float _1466 = fma(_1450, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1464);
    float _1468 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1452);
    float _1472 = -_1458;
    float _1474 = fma(_1472, _1408, 1.0);
    float _1476 = -_1462;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1466);
    float _1480 = exp2(_1460);
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1486 = fma(_1478, -0.5, 0.5);
    float _1488 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1484);
    float _1492 = _1450 + 1.0;
    float _1494 = log2(_1474);
    float _1496 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1488);
    float _1498 = fma(_1478, 0.5, 0.5);
    float _1500 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1496);
    float _1504 = fma(_1498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1506 = 1.0 / _1482;
    float _1508 = -_1450;
    float _1510 = fma(_1480, _1492, _1508);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1514 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1516 = fma(_1498, _1504, -0.212114393711090087890625);
    float _1518 = sqrt(_1486);
    float _1520 = _1494 * 0.693147182464599609375;
    float _1522 = fma(_1498, _1516, 1.570728778839111328125);
    float _1524 = fma(_1510, 0.5, 0.5);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1528 = _1512 * _1506;
    float _1530 = _1514 * _1506;
    float _1532 = fma(_1528, 0.5, 0.5);
    float _1534 = fma(_1530, -0.5, 0.5);
    float _1536 = _1518 * 0.636619746685028076171875;
    float3 _4214 = float3(_1532, _1534, _1526);
    float _1538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4214, float3(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4214, float3(0.0), isnan(_4214)), level(0.0)).x;
    float _1540 = -_1522;
    float _1542 = fma(_1536, _1540, 1.0);
    float3 _4230 = float3(_1532, _1534, _1526);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4230, float3(0.0), isnan(_4230)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4230, float3(0.0), isnan(_4230)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _4247 = float2(_1542, _1524);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4247, float2(0.0), isnan(_4247)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4247, float2(0.0), isnan(_4247)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = in.m_61.y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1573 = _594 > 0.5;
    float _1575 = in.m_59.y;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1583 = _1581 != 0;
    float _1585 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1587 = 1.0 / _1571;
    float _1589 = in.m_61.x;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1593 = _1591 != 0;
    float _1595 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1597 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1599 = isnan(_586);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1615 = _1613 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1617 = 1.0 / _1579;
    out.m_63.x = _866;
    float _1619 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1595);
    float _1621 = 0.0;
    float _1623 = _1589;
    if (_1583)
    {
        float _1625 = in.m_51.x;
        _1621 = _1625;
    }
    float _1627 = _1621;
    float _1629 = -_1565;
    float _1631 = _1629 + 1.0;
    float _1633 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1619);
    float _1635 = _1611 * _1587;
    bool _1637 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1639 = isnan(_586);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = in.m_59.z;
    float _1651 = _1565;
    if (_1593)
    {
        float _1653 = _1573 ? _1631 : _1565;
        _1651 = _1653;
    }
    float _1655 = _1651;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1659 = _586 + _1657;
    bool _1661 = _920 != 0.0;
    bool _1663 = isnan(_920);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    float _1671 = -_1647;
    float _1673 = _1671 + 1.0;
    out.m_63.y = _1575;
    float _1675 = _1615 * _1617;
    bool _1677 = _910 == 0.0;
    bool _1679 = !_1669;
    bool _1681 = _1677 && _1679;
    float _1683 = exp2(_1585);
    float _1685 = in.m_65.x;
    float _1687 = in.m_65.y;
    float _1689 = in.m_65.z;
    float _1691 = fma(_1635, _1659, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1693 = _712 == 0.0;
    bool _1695 = _1693 && _1681;
    float _1697 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1701 = _586 + _1699;
    out.m_67.x = _1162;
    out.m_67.y = _1160;
    out.m_67.z = _1164;
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1705 = fma(_1675, _1701, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1707 = fma(_1697, _1655, -0.5);
    bool _1709 = _1627 > 0.5;
    bool _1711 = _1709 && _1583;
    bool _1713 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1715 = isnan(_586);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = _1607 * _1673;
    float _1727 = -_1607;
    float _1729 = _1727 + 1.0;
    float _1731 = _1673;
    if (_1583)
    {
        _1731 = _1589;
    }
    float _1733 = _1731;
    float _1735 = -_1683;
    float _1737 = _1735 + 1.0;
    float _1739 = -_782;
    float _1741 = fma(_786, _1707, _1739);
    float _1743 = _1723 * _1729;
    float _1745 = -_1723;
    float _1747 = _1745 + 1.0;
    out.m_63.z = _1649;
    float _1749 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1751 = _1691 * _1743;
    float _1753 = _1733;
    if (_1711)
    {
        float _1755 = -_1733;
        float _1757 = _1755 + 1.0;
        _1753 = _1757;
    }
    float _1759 = _1753;
    float _1761 = _1687;
    float _1763 = _1685;
    float _1765 = _1689;
    if (!_1695)
    {
        float _1767 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1687);
        _1761 = _1767;
    }
    float _1769 = _1761;
    if (!_1695)
    {
        float _1771 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1685);
        _1763 = _1771;
    }
    float _1773 = _1763;
    if (!_1695)
    {
        float _1775 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1689);
        _1765 = _1775;
    }
    float _1777 = _1765;
    float _1779 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1751);
    float _1781 = _974 * _1769;
    float _1783 = -_1769;
    float _1785 = _968 * _1783;
    float _1787 = _978 * _1769;
    float _1789 = fma(_990, _1773, _1781);
    float _1791 = fma(_976, _1773, _1785);
    float _1793 = fma(_996, _1773, _1787);
    float _1795 = fma(_1004, _1777, _1789);
    float _1797 = fma(_980, _1777, _1791);
    float _1799 = fma(_992, _1777, _1793);
    float _1801 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1803 = fma(_1705, _1725, _1779);
    float _1805 = in.m_59.w;
    float _1807 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1809 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1801);
    float _1811 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1803);
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1583)
    {
        _1623 = _1759;
    }
    float _1819 = _1623;
    float _1821 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1807);
    float _1823 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1825 = _1741 + 0.5;
    float _1827 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1835 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1837 = fma(_1823, _1819, -0.5);
    float _1839 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1633);
    bool _1841 = _1226 > 0.0;
    bool _1843 = isnan(_1226);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    out.m_69.x = _1827;
    out.m_69.y = _1829;
    out.m_69.z = _1831;
    out.m_69.w = _1833;
    float _1851 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1853 = fma(_776, _1837, _772);
    float _1855 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1857 = _1839 + _1482;
    float _1859 = _1512 + _1482;
    float _1861 = _1482 * 0.5;
    float _1863 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1809);
    float _1865 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1851);
    float _1867 = _1853 + 0.5;
    float _1869 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1821);
    float _1871 = _1857 * 0.5;
    float _1873 = _1859 * 0.5;
    float _1875 = fma(_1514, -0.5, _1861);
    float _1877 = _1855 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.w = _1805;
    out.m_71.x = _1867;
    out.m_71.y = _1825;
    out.m_73.x = _1863;
    out.m_73.y = _1869;
    out.m_73.z = _1865;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1514;
    out.gl_Position.z = _1839;
    out.gl_Position.w = _1482;
    out.m_75.x = _1873;
    out.m_75.y = _1875;
    out.m_75.z = _1871;
    out.m_75.w = _1482;
    out.m_45.x = _1877;
    float _1879 = _1749 * _1538;
    float _1881 = -_1749;
    float _1883 = _1881 + 1.0;
    float _1885 = _1553 * _1879;
    float _1887 = _1563 * _1879;
    float _1889 = fma(_1559, _1885, _1547);
    float _1891 = fma(_1561, _1885, _1549);
    float _1893 = _1553 * _1883;
    float _1895 = fma(_1553, _1887, _1551);
    out.m_77.x = _1889;
    out.m_77.y = _1891;
    out.m_77.z = _1895;
    out.m_77.w = _1893;
    if (_1849)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1897;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _578 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1954 = as_type<float>(_112);
        out.gl_Position.z = _1954;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2024 = as_type<float>(_150);
        out.gl_Position.z = _2024;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_49.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _174);
    float _270 = fma(_264, _152, _172);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_51.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_96);
        float _298 = 1.0 / _296;
        float _300 = _130 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _342;
    float _358 = -_354;
    float _360 = _358 + 1.0;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = _334 * _360;
    float _366 = -_334;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _338;
    float _372 = _322 * _356;
    float _374 = _306 * _370;
    float _376 = -_318;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _354 * _378;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _394 * _364;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = _396 * _364;
    float _408 = _398 * _364;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _428 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _430 = fma(_422, _384, _420);
    float _432 = fma(_418, _384, _426);
    float _434 = fma(_424, _384, _428);
    float _436 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].x, _430);
    float _438 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].y, _432);
    float _440 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].z, _434);
    bool _442 = !_362;
    float _460;
    if (!_442)
    {
        float _444 = in.m_51.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_96);
        float _466 = 1.0 / _464;
        float _468 = _130 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = in.m_49.x;
    float _478 = in.m_49.y;
    float _480 = in.m_49.z;
    bool _482 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_470);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _500 = isnan(_470);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    float _514 = -_492;
    float _516 = _514 + 1.0;
    bool _518 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _520 = 1.0 / _496;
    float _522 = _508 * _516;
    float _524 = -_508;
    float _526 = _524 + 1.0;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = _512 * _520;
    float _532 = _440 * _480;
    float _534 = _438 * _478;
    float _536 = fma(_530, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _538 = _436 * _476;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _542 = _536 * _522;
    float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[115].x, _542);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[116].x, _546);
    float _552 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _552;
    out.m_53.y = _554;
    out.m_53.z = _544;
    out.m_53.w = _556;
    bool _558 = !_518;
    float _576;
    if (!_558)
    {
        float _560 = in.m_51.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_96);
        float _582 = 1.0 / _580;
        float _584 = _130 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_51.z;
    float _590 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _592 = in.m_51.x;
    float _594 = in.m_51.y;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _606 = _604 != 0;
    float _608 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _612 = log2(_610);
    bool _614 = !_598;
    int _616 = _614 ? 0 : 1;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _620 = abs(_616);
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    float _626 = _612 * _130;
    float _628 = _588 * 2.0;
    float _630 = _594 * 2.0;
    float _632 = _592 * 2.0;
    float _634 = floor(_628);
    float _636 = _592 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _638 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[191].x, _592);
    float _640 = -_618;
    float _642 = fma(_636, 2.0, _640);
    float _644 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _646 = floor(_630);
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _650 = fma(_644, -2.0, _648);
    float _652 = floor(_632);
    bool _654 = _634 > 0.0;
    bool _656 = _634 >= 0.0;
    bool _658 = isnan(_634);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = _594 + _592;
    int _668 = _664 ? 0 : 1;
    float _670 = exp2(_626);
    float _672 = _594 + _588;
    bool _674 = _646 >= 0.0;
    bool _676 = isnan(_646);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    float _684 = _666 + (-1.0);
    int _686 = ~_668;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = _672 + (-1.0);
    int _694 = _690;
    if (!_654)
    {
        int _696 = ~_668;
        int _698 = _696 + 1;
        _694 = _698;
    }
    int _700 = _694;
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _704 = _646 > 0.0;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _708 = in.m_55.x;
    float _710 = in.m_55.y;
    float _712 = in.m_55.z;
    bool _714 = _652 > 0.0;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _718 = 1.0 + _716;
    bool _720 = _652 >= 0.0;
    bool _722 = isnan(_652);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _732 = 1.0 / _718;
    float _734 = in.m_57.x;
    float _736 = in.m_57.y;
    float _738 = in.m_57.z;
    bool _740 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(1.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[78].z, _730);
    int _752 = _728 ? 0 : 1;
    float _754 = -_670;
    float _756 = _754 + 1.0;
    bool _758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _770 = -_130;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[76].x, _642);
    float _774 = float(_620);
    float _776 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _750);
    float _778 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].w, _768);
    float _780 = _766 ? _756 : 0.0;
    float _782 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _650);
    float _784 = float(_700);
    float _786 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _778);
    int _788 = ~_752;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    int _794 = _792;
    if (_748)
    {
        float _796 = _780 * _732;
        _132 = _796;
    }
    float _798 = _132;
    if (!_714)
    {
        int _800 = ~_752;
        int _802 = _800 + 1;
        _794 = _802;
    }
    int _804 = _794;
    float _806 = _774 * _784;
    int _808 = abs(_624);
    float _810 = _592 + (-0.5);
    float _812 = float(_804);
    float _814 = _806 * (-2.0);
    float _816 = float(_808);
    float _818 = _638 + _712;
    int _820 = _682 ? 0 : 1;
    float _822 = fma(_814, _734, _734);
    bool _824 = !_606;
    int _826 = _824 ? 0 : 1;
    float _828 = _816 * _812;
    int _830 = ~_820;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[196].x, _822);
    int _838 = _834;
    if (!_704)
    {
        int _840 = ~_820;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_702, _814, _702);
    float _848 = _828 * (-2.0);
    int _850 = abs(_826);
    float _852 = _818 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _854 = _588 + _592;
    float _856 = fma(_848, _736, _736);
    float _858 = fma(_706, _848, _706);
    float _860 = float(_844);
    float _862 = _852 * 0.15915493667125701904296875;
    float _864 = float(_850);
    float _866 = in.m_59.x;
    float _868 = _854 + (-1.0);
    float _870 = _862 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _594 + (-0.5);
    float _876 = _864 * _860;
    float _878 = _588 + (-0.5);
    float _880 = fma(_846, _798, _836);
    float _882 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].y, _856);
    float _884 = _876 * (-2.0);
    float _886 = _880 * 0.15915493667125701904296875;
    float _888 = fma(_884, _738, _738);
    float _890 = fma(_858, _798, _882);
    float _892 = _886 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].z, _888);
    float _900 = _890 * 0.15915493667125701904296875;
    float _902 = _872 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _904 = fma(_896, _884, _896);
    float _906 = _886 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = fma(_902, 0.300000011920928955078125, _708);
    float _912 = fma(_904, _798, _898);
    float _914 = _866 * _866;
    float _916 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _918 = _912 * 0.15915493667125701904296875;
    float _920 = fma(_902, _914, _710);
    float _922 = _900 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _910);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    bool _932 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _940 = _936 || _938;
    float _942 = _926 * _916;
    float _944 = _928 * _608;
    float _946 = _930 * _590;
    float _948 = _900 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _954 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _952);
    float _956 = _918 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = _894 * _924;
    float _962 = _908 * _924;
    float _964 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _954);
    float _966 = _918 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _908 * _950;
    float _972 = _894 * _950;
    float _974 = _908 * _958;
    float _976 = _950 * _958;
    float _978 = _894 * _958;
    float _980 = _924 * _958;
    float _982 = _974 * _946;
    float _984 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = _978 * _946;
    float _988 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _990 = fma(_968, _970, _960);
    float _992 = fma(_968, _960, _970);
    float _994 = -_962;
    float _996 = fma(_968, _972, _994);
    float _998 = -_946;
    float _1000 = _968 * _998;
    float _1002 = -_972;
    float _1004 = fma(_968, _962, _1002);
    float _1006 = fma(_990, _942, _982);
    float _1008 = fma(_996, _942, _986);
    float _1010 = fma(_976, _942, _1000);
    float _1012 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _1014 = fma(_1004, _944, _1006);
    float _1016 = fma(_992, _944, _1008);
    float _1018 = fma(_980, _944, _1010);
    float _1020 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1026 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _988);
    float _1028 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1022);
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1024);
    float _1034 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1030);
    float _1040 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1032);
    float _1042 = _908;
    if (_940)
    {
        _1042 = 1.0;
    }
    float _1044 = _1042;
    float _1046 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = _1028 + _1038;
    float _1050 = _1034 + _1040;
    float _1052 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1060 = _1050 + _1058;
    float _1062 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1052);
    float _1064 = _1056 * _1056;
    float _1066 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1062);
    float _1068 = fma(_1060, _1060, _1064);
    float _1070 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1072 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1074 = sqrt(_1068);
    float _1076 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1070);
    float _1078 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1080 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1076);
    float _1082 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1078);
    float _1084 = 1.0 / _1072;
    float _1086 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1088 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1082);
    float _1090 = _1086 + _1072;
    float _1092 = _1046 + _1088;
    bool _1094 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1090 * _1084;
    float _1098 = _1096 * 0.5;
    float _1100 = _1090;
    float _1102 = _1088;
    float _1104 = _1078;
    float _1106 = _1098;
    float _1108 = _1044;
    if (!_1094)
    {
        _1100 = _1050;
    }
    float _1110 = _1100;
    float _1112 = _1110;
    if (!_1094)
    {
        _1102 = _1048;
    }
    float _1114 = _1102;
    float _1116 = _1114;
    if (!_1094)
    {
        _1104 = _1092;
    }
    float _1118 = _1104;
    bool _1120 = !_1094;
    float _1122 = _1118;
    if (!_1120)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1128 = _1074 + _1126;
        float _1130 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = rsqrt(_1068);
        float _1134 = _1128 * _1124;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _1136 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1136 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 + (-1.0);
        float _1148 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = fma(_1144, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1152 = fma(_1092, _1140, _1148);
        float _1154 = _1132 * _1150;
        float _1156 = fma(_1060, _1154, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1158 = fma(_1056, _1154, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1122 = _1152;
        _1112 = _1156;
        _1116 = _1158;
    }
    float _1160 = _1122;
    float _1162 = _1112;
    float _1164 = _1116;
    if (!_940)
    {
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1174 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1172);
        float _1176 = _1168 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = _1170 * 0.15915493667125701904296875;
        float _1182 = _1168 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        float _1186 = 1.0 / _1178;
        float _1188 = _1180 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1184 * _1186;
        float _1194 = _1180 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = _1190 * _1192;
        float _1200 = 1.0 / _1174;
        float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1204 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1202;
        float _1206 = 1.0 / _1198;
        float _1208 = 1.0 / _1204;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1212 = _1200 * _1210;
        float _1214 = _1196 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1218 = fma(_1214, _1212, _1216);
        float _1220 = _1218 * _1208;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        _1106 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1108 = _1222;
    }
    float _1224 = _1106;
    float _1226 = _1108;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1160 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1162 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1164 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1224;
    float _1278 = _1250;
    if (_1264)
    {
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1280;
    }
    float _1282 = _1270;
    if (_1264)
    {
        float _1284 = rsqrt(_1260);
        _1272 = _1284;
    }
    float _1286 = _1272;
    float _1288 = _1286;
    if (_1264)
    {
        float _1290 = _1268 * _1282;
        _1274 = _1290;
    }
    float _1292 = _1274;
    if (_1264)
    {
        float _1294 = _1292 * 0.15915493667125701904296875;
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1282;
    float _1300 = _1296;
    if (_1264)
    {
        float _1302 = _1296 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1240;
    float _1314 = _1310;
    if (_1264)
    {
        float _1316 = _1296 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1250;
    float _1324 = -_1310;
    float _1326 = fma(_1230, _1322, _1324);
    float _1328 = _1326;
    if (_1264)
    {
        float _1330 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1330;
    }
    float _1332 = _1314;
    float _1334 = _1306;
    float _1336 = _1332;
    if (_1264)
    {
        float _1338 = fma(_1306, _1332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    float _1344 = _1320;
    if (_1264)
    {
        float _1346 = _1320 + (-1.0);
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = _1348;
    if (_1264)
    {
        float _1352 = _1286 * _1340;
        _1278 = _1352;
    }
    float _1354 = _1278;
    if (!_1264)
    {
        _1342 = _1252;
    }
    float _1356 = _1342;
    float _1358 = _1356;
    if (_1264)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1360;
    }
    float _1362 = _1300;
    if (_1264)
    {
        float _1364 = _1252 * _1354;
        _1358 = _1364;
    }
    float _1366 = _1358;
    if (!_1264)
    {
        _1350 = _1254;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1264)
    {
        float _1372 = _1254 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1264)
    {
        _1288 = _1256;
    }
    float _1376 = _1288;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = fma(_1326, _1320, _1362);
        _1328 = _1380;
    }
    float _1382 = _1328;
    if (_1264)
    {
        float _1384 = _1366 * _1366;
        _1378 = _1384;
    }
    float _1386 = _1378;
    if (!_1264)
    {
        _1344 = _1258;
    }
    float _1388 = _1344;
    float _1390 = _1388;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = fma(_1382, _1382, _1386);
    float _1398 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1396 + _1394;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1404 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1402);
    float _1406 = precise::clamp(_1404, 0.0, 1.0);
    float _1408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1410 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1412 = rsqrt(_1400);
    float _1414 = -_1406;
    float _1416 = _1414 + 1.0;
    float _1418 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1410);
    float _1422 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1424 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1426 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1428 = abs(_1416);
    float _1430 = log2(_1428);
    float _1432 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1434 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1436 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1438 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1446 = _1412 * _1366;
    float _1448 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1440);
    float _1450 = _1412 * _1382;
    float _1452 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1444);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1456 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1448);
    float _1458 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1460 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1462 = _1412 * _1374;
    float _1464 = -_1454;
    float _1466 = fma(_1450, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1464);
    float _1468 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1452);
    float _1472 = -_1458;
    float _1474 = fma(_1472, _1408, 1.0);
    float _1476 = -_1462;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1466);
    float _1480 = exp2(_1460);
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1486 = fma(_1478, -0.5, 0.5);
    float _1488 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1484);
    float _1492 = _1450 + 1.0;
    float _1494 = log2(_1474);
    float _1496 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1488);
    float _1498 = fma(_1478, 0.5, 0.5);
    float _1500 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1496);
    float _1504 = fma(_1498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1506 = 1.0 / _1482;
    float _1508 = -_1450;
    float _1510 = fma(_1480, _1492, _1508);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1514 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1516 = fma(_1498, _1504, -0.212114393711090087890625);
    float _1518 = sqrt(_1486);
    float _1520 = _1494 * 0.693147182464599609375;
    float _1522 = fma(_1498, _1516, 1.570728778839111328125);
    float _1524 = fma(_1510, 0.5, 0.5);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1528 = _1512 * _1506;
    float _1530 = _1514 * _1506;
    float _1532 = fma(_1528, 0.5, 0.5);
    float _1534 = fma(_1530, -0.5, 0.5);
    float _1536 = _1518 * 0.636619746685028076171875;
    float3 _4214 = float3(_1532, _1534, _1526);
    float _1538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4214, float3(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4214, float3(0.0), isnan(_4214)), level(0.0)).x;
    float _1540 = -_1522;
    float _1542 = fma(_1536, _1540, 1.0);
    float3 _4230 = float3(_1532, _1534, _1526);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4230, float3(0.0), isnan(_4230)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4230, float3(0.0), isnan(_4230)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _4247 = float2(_1542, _1524);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4247, float2(0.0), isnan(_4247)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4247, float2(0.0), isnan(_4247)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = in.m_61.y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1573 = _594 > 0.5;
    float _1575 = in.m_59.y;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1583 = _1581 != 0;
    float _1585 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1587 = 1.0 / _1571;
    float _1589 = in.m_61.x;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1593 = _1591 != 0;
    float _1595 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1597 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1599 = isnan(_586);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1615 = _1613 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1617 = 1.0 / _1579;
    out.m_63.x = _866;
    float _1619 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1595);
    float _1621 = 0.0;
    float _1623 = _1589;
    if (_1583)
    {
        float _1625 = in.m_51.x;
        _1621 = _1625;
    }
    float _1627 = _1621;
    float _1629 = -_1565;
    float _1631 = _1629 + 1.0;
    float _1633 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1619);
    float _1635 = _1611 * _1587;
    bool _1637 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1639 = isnan(_586);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = in.m_59.z;
    float _1651 = _1565;
    if (_1593)
    {
        float _1653 = _1573 ? _1631 : _1565;
        _1651 = _1653;
    }
    float _1655 = _1651;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1659 = _586 + _1657;
    bool _1661 = _920 != 0.0;
    bool _1663 = isnan(_920);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    float _1671 = -_1647;
    float _1673 = _1671 + 1.0;
    out.m_63.y = _1575;
    float _1675 = _1615 * _1617;
    bool _1677 = _910 == 0.0;
    bool _1679 = !_1669;
    bool _1681 = _1677 && _1679;
    float _1683 = exp2(_1585);
    float _1685 = in.m_65.x;
    float _1687 = in.m_65.y;
    float _1689 = in.m_65.z;
    float _1691 = fma(_1635, _1659, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1693 = _712 == 0.0;
    bool _1695 = _1693 && _1681;
    float _1697 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1701 = _586 + _1699;
    out.m_67.x = _1162;
    out.m_67.y = _1160;
    out.m_67.z = _1164;
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1705 = fma(_1675, _1701, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1707 = fma(_1697, _1655, -0.5);
    bool _1709 = _1627 > 0.5;
    bool _1711 = _1709 && _1583;
    bool _1713 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1715 = isnan(_586);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = _1607 * _1673;
    float _1727 = -_1607;
    float _1729 = _1727 + 1.0;
    float _1731 = _1673;
    if (_1583)
    {
        _1731 = _1589;
    }
    float _1733 = _1731;
    float _1735 = -_1683;
    float _1737 = _1735 + 1.0;
    float _1739 = -_782;
    float _1741 = fma(_786, _1707, _1739);
    float _1743 = _1723 * _1729;
    float _1745 = -_1723;
    float _1747 = _1745 + 1.0;
    out.m_63.z = _1649;
    float _1749 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1751 = _1691 * _1743;
    float _1753 = _1733;
    if (_1711)
    {
        float _1755 = -_1733;
        float _1757 = _1755 + 1.0;
        _1753 = _1757;
    }
    float _1759 = _1753;
    float _1761 = _1687;
    float _1763 = _1685;
    float _1765 = _1689;
    if (!_1695)
    {
        float _1767 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1687);
        _1761 = _1767;
    }
    float _1769 = _1761;
    if (!_1695)
    {
        float _1771 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1685);
        _1763 = _1771;
    }
    float _1773 = _1763;
    if (!_1695)
    {
        float _1775 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1689);
        _1765 = _1775;
    }
    float _1777 = _1765;
    float _1779 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1751);
    float _1781 = _974 * _1769;
    float _1783 = -_1769;
    float _1785 = _968 * _1783;
    float _1787 = _978 * _1769;
    float _1789 = fma(_990, _1773, _1781);
    float _1791 = fma(_976, _1773, _1785);
    float _1793 = fma(_996, _1773, _1787);
    float _1795 = fma(_1004, _1777, _1789);
    float _1797 = fma(_980, _1777, _1791);
    float _1799 = fma(_992, _1777, _1793);
    float _1801 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1803 = fma(_1705, _1725, _1779);
    float _1805 = in.m_59.w;
    float _1807 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1809 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1801);
    float _1811 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1803);
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1583)
    {
        _1623 = _1759;
    }
    float _1819 = _1623;
    float _1821 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1807);
    float _1823 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1825 = _1741 + 0.5;
    float _1827 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1835 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1837 = fma(_1823, _1819, -0.5);
    float _1839 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1633);
    bool _1841 = _1226 > 0.0;
    bool _1843 = isnan(_1226);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    out.m_69.x = _1827;
    out.m_69.y = _1829;
    out.m_69.z = _1831;
    out.m_69.w = _1833;
    float _1851 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1853 = fma(_776, _1837, _772);
    float _1855 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1857 = _1839 + _1482;
    float _1859 = _1512 + _1482;
    float _1861 = _1482 * 0.5;
    float _1863 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1809);
    float _1865 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1851);
    float _1867 = _1853 + 0.5;
    float _1869 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1821);
    float _1871 = _1857 * 0.5;
    float _1873 = _1859 * 0.5;
    float _1875 = fma(_1514, -0.5, _1861);
    float _1877 = _1855 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.w = _1805;
    out.m_71.x = _1867;
    out.m_71.y = _1825;
    out.m_73.x = _1863;
    out.m_73.y = _1869;
    out.m_73.z = _1865;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1514;
    out.gl_Position.z = _1839;
    out.gl_Position.w = _1482;
    out.m_75.x = _1873;
    out.m_75.y = _1875;
    out.m_75.z = _1871;
    out.m_75.w = _1482;
    out.m_45.x = _1877;
    float _1879 = _1749 * _1538;
    float _1881 = -_1749;
    float _1883 = _1881 + 1.0;
    float _1885 = _1553 * _1879;
    float _1887 = _1563 * _1879;
    float _1889 = fma(_1559, _1885, _1547);
    float _1891 = fma(_1561, _1885, _1549);
    float _1893 = _1553 * _1883;
    float _1895 = fma(_1553, _1887, _1551);
    out.m_77.x = _1889;
    out.m_77.y = _1891;
    out.m_77.z = _1895;
    out.m_77.w = _1893;
    if (_1849)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1897;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _578 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1954 = as_type<float>(_112);
        out.gl_Position.z = _1954;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2024 = as_type<float>(_150);
        out.gl_Position.z = _2024;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_49.w;
    float _154 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = in.m_42.x;
    float _174 = in.m_42.y;
    float _176 = in.m_42.z;
    float _178 = 0.0;
    float _180 = _154;
    if (!_164)
    {
        float _182 = _154 * _154;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = _186;
    if (!_164)
    {
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _190;
    }
    float _192 = _188;
    bool _194 = !_164;
    float _196 = _192;
    if (!_194)
    {
        float _198 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = log2(_198);
        float _202 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _204 = _202 + 1.0;
        float _206 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = _154 * _200;
        float _210 = 1.0 / _204;
        float _212 = _206 * 0.693147182464599609375;
        float _214 = exp2(_208);
        float _216 = 1.0 / _212;
        float _218 = _214 + (-1.0);
        float _220 = -_218;
        float _222 = fma(_220, _216, _154);
        float _224 = _222 * _210;
        float _226 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _226;
    }
    float _228 = _196;
    bool _230 = !_164;
    if (!_230)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = 1.0 / _238;
        float _242 = _154 * _234;
        float _244 = exp2(_242);
        float _246 = -_244;
        float _248 = _246 + 1.0;
        float _250 = _248 * _240;
        _180 = _250;
    }
    float _252 = _180;
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _168, _256);
    float _264 = fma(_252, _166, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _174);
    float _270 = fma(_264, _152, _172);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _292;
    if (!_274)
    {
        float _276 = in.m_51.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_96);
        float _298 = 1.0 / _296;
        float _300 = _130 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = 1.0 / _342;
    float _358 = -_354;
    float _360 = _358 + 1.0;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _364 = _334 * _360;
    float _366 = -_334;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _338;
    float _372 = _322 * _356;
    float _374 = _306 * _370;
    float _376 = -_318;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = _354 * _378;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _396 = fma(_388, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _398 = fma(_392, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _394 * _364;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = _396 * _364;
    float _408 = _398 * _364;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _418 = fma(_404, _372, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _422 = fma(_412, _372, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _372, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _426 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _400);
    float _428 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _430 = fma(_422, _384, _420);
    float _432 = fma(_418, _384, _426);
    float _434 = fma(_424, _384, _428);
    float _436 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].x, _430);
    float _438 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].y, _432);
    float _440 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[145].z, _434);
    bool _442 = !_362;
    float _460;
    if (!_442)
    {
        float _444 = in.m_51.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_96);
        float _466 = 1.0 / _464;
        float _468 = _130 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = in.m_49.x;
    float _478 = in.m_49.y;
    float _480 = in.m_49.z;
    bool _482 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_470);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _500 = isnan(_470);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _510;
    float _514 = -_492;
    float _516 = _514 + 1.0;
    bool _518 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _520 = 1.0 / _496;
    float _522 = _508 * _516;
    float _524 = -_508;
    float _526 = _524 + 1.0;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _530 = _512 * _520;
    float _532 = _440 * _480;
    float _534 = _438 * _478;
    float _536 = fma(_530, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _538 = _436 * _476;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _542 = _536 * _522;
    float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[115].x, _542);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[116].x, _546);
    float _552 = _528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _552;
    out.m_53.y = _554;
    out.m_53.z = _544;
    out.m_53.w = _556;
    bool _558 = !_518;
    float _576;
    if (!_558)
    {
        float _560 = in.m_51.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_96);
        float _582 = 1.0 / _580;
        float _584 = _130 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_51.z;
    float _590 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _592 = in.m_51.x;
    float _594 = in.m_51.y;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _606 = _604 != 0;
    float _608 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _610 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _612 = log2(_610);
    bool _614 = !_598;
    int _616 = _614 ? 0 : 1;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _620 = abs(_616);
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    float _626 = _612 * _130;
    float _628 = _588 * 2.0;
    float _630 = _594 * 2.0;
    float _632 = _592 * 2.0;
    float _634 = floor(_628);
    float _636 = _592 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _638 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[191].x, _592);
    float _640 = -_618;
    float _642 = fma(_636, 2.0, _640);
    float _644 = _594 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _646 = floor(_630);
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _650 = fma(_644, -2.0, _648);
    float _652 = floor(_632);
    bool _654 = _634 > 0.0;
    bool _656 = _634 >= 0.0;
    bool _658 = isnan(_634);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = _594 + _592;
    int _668 = _664 ? 0 : 1;
    float _670 = exp2(_626);
    float _672 = _594 + _588;
    bool _674 = _646 >= 0.0;
    bool _676 = isnan(_646);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    float _684 = _666 + (-1.0);
    int _686 = ~_668;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    float _692 = _672 + (-1.0);
    int _694 = _690;
    if (!_654)
    {
        int _696 = ~_668;
        int _698 = _696 + 1;
        _694 = _698;
    }
    int _700 = _694;
    float _702 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _704 = _646 > 0.0;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _708 = in.m_55.x;
    float _710 = in.m_55.y;
    float _712 = in.m_55.z;
    bool _714 = _652 > 0.0;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _718 = 1.0 + _716;
    bool _720 = _652 >= 0.0;
    bool _722 = isnan(_652);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _732 = 1.0 / _718;
    float _734 = in.m_57.x;
    float _736 = in.m_57.y;
    float _738 = in.m_57.z;
    bool _740 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(1.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[78].z, _730);
    int _752 = _728 ? 0 : 1;
    float _754 = -_670;
    float _756 = _754 + 1.0;
    bool _758 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(0.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _770 = -_130;
    float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[76].x, _642);
    float _774 = float(_620);
    float _776 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _750);
    float _778 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[78].w, _768);
    float _780 = _766 ? _756 : 0.0;
    float _782 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _650);
    float _784 = float(_700);
    float _786 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _778);
    int _788 = ~_752;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    int _794 = _792;
    if (_748)
    {
        float _796 = _780 * _732;
        _132 = _796;
    }
    float _798 = _132;
    if (!_714)
    {
        int _800 = ~_752;
        int _802 = _800 + 1;
        _794 = _802;
    }
    int _804 = _794;
    float _806 = _774 * _784;
    int _808 = abs(_624);
    float _810 = _592 + (-0.5);
    float _812 = float(_804);
    float _814 = _806 * (-2.0);
    float _816 = float(_808);
    float _818 = _638 + _712;
    int _820 = _682 ? 0 : 1;
    float _822 = fma(_814, _734, _734);
    bool _824 = !_606;
    int _826 = _824 ? 0 : 1;
    float _828 = _816 * _812;
    int _830 = ~_820;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[196].x, _822);
    int _838 = _834;
    if (!_704)
    {
        int _840 = ~_820;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = fma(_702, _814, _702);
    float _848 = _828 * (-2.0);
    int _850 = abs(_826);
    float _852 = _818 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _854 = _588 + _592;
    float _856 = fma(_848, _736, _736);
    float _858 = fma(_706, _848, _706);
    float _860 = float(_844);
    float _862 = _852 * 0.15915493667125701904296875;
    float _864 = float(_850);
    float _866 = in.m_59.x;
    float _868 = _854 + (-1.0);
    float _870 = _862 * 6.283185482025146484375;
    float _872 = sin(_870);
    float _874 = _594 + (-0.5);
    float _876 = _864 * _860;
    float _878 = _588 + (-0.5);
    float _880 = fma(_846, _798, _836);
    float _882 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].y, _856);
    float _884 = _876 * (-2.0);
    float _886 = _880 * 0.15915493667125701904296875;
    float _888 = fma(_884, _738, _738);
    float _890 = fma(_858, _798, _882);
    float _892 = _886 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[196].z, _888);
    float _900 = _890 * 0.15915493667125701904296875;
    float _902 = _872 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _904 = fma(_896, _884, _896);
    float _906 = _886 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = fma(_902, 0.300000011920928955078125, _708);
    float _912 = fma(_904, _798, _898);
    float _914 = _866 * _866;
    float _916 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _918 = _912 * 0.15915493667125701904296875;
    float _920 = fma(_902, _914, _710);
    float _922 = _900 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _910);
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _712);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _920);
    bool _932 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _934 = isnan(0.5);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _940 = _936 || _938;
    float _942 = _926 * _916;
    float _944 = _928 * _608;
    float _946 = _930 * _590;
    float _948 = _900 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _954 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _952);
    float _956 = _918 * 6.283185482025146484375;
    float _958 = cos(_956);
    float _960 = _894 * _924;
    float _962 = _908 * _924;
    float _964 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _954);
    float _966 = _918 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _908 * _950;
    float _972 = _894 * _950;
    float _974 = _908 * _958;
    float _976 = _950 * _958;
    float _978 = _894 * _958;
    float _980 = _924 * _958;
    float _982 = _974 * _946;
    float _984 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _986 = _978 * _946;
    float _988 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _990 = fma(_968, _970, _960);
    float _992 = fma(_968, _960, _970);
    float _994 = -_962;
    float _996 = fma(_968, _972, _994);
    float _998 = -_946;
    float _1000 = _968 * _998;
    float _1002 = -_972;
    float _1004 = fma(_968, _962, _1002);
    float _1006 = fma(_990, _942, _982);
    float _1008 = fma(_996, _942, _986);
    float _1010 = fma(_976, _942, _1000);
    float _1012 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _984);
    float _1014 = fma(_1004, _944, _1006);
    float _1016 = fma(_992, _944, _1008);
    float _1018 = fma(_980, _944, _1010);
    float _1020 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1022 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1024 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1026 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _988);
    float _1028 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1030 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1022);
    float _1032 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1024);
    float _1034 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1038 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1030);
    float _1040 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1032);
    float _1042 = _908;
    if (_940)
    {
        _1042 = 1.0;
    }
    float _1044 = _1042;
    float _1046 = _1036 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1048 = _1028 + _1038;
    float _1050 = _1034 + _1040;
    float _1052 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1060 = _1050 + _1058;
    float _1062 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1052);
    float _1064 = _1056 * _1056;
    float _1066 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1062);
    float _1068 = fma(_1060, _1060, _1064);
    float _1070 = _1046 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1072 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1074 = sqrt(_1068);
    float _1076 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1070);
    float _1078 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1080 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1076);
    float _1082 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1078);
    float _1084 = 1.0 / _1072;
    float _1086 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1088 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1082);
    float _1090 = _1086 + _1072;
    float _1092 = _1046 + _1088;
    bool _1094 = _1074 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1090 * _1084;
    float _1098 = _1096 * 0.5;
    float _1100 = _1090;
    float _1102 = _1088;
    float _1104 = _1078;
    float _1106 = _1098;
    float _1108 = _1044;
    if (!_1094)
    {
        _1100 = _1050;
    }
    float _1110 = _1100;
    float _1112 = _1110;
    if (!_1094)
    {
        _1102 = _1048;
    }
    float _1114 = _1102;
    float _1116 = _1114;
    if (!_1094)
    {
        _1104 = _1092;
    }
    float _1118 = _1104;
    bool _1120 = !_1094;
    float _1122 = _1118;
    if (!_1120)
    {
        float _1124 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1126 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1128 = _1074 + _1126;
        float _1130 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = rsqrt(_1068);
        float _1134 = _1128 * _1124;
        float _1136 = _1134 * 0.15915493667125701904296875;
        float _1138 = _1136 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = _1136 * 6.283185482025146484375;
        float _1144 = sin(_1142);
        float _1146 = _1140 + (-1.0);
        float _1148 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1150 = fma(_1144, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1152 = fma(_1092, _1140, _1148);
        float _1154 = _1132 * _1150;
        float _1156 = fma(_1060, _1154, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1158 = fma(_1056, _1154, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1122 = _1152;
        _1112 = _1156;
        _1116 = _1158;
    }
    float _1160 = _1122;
    float _1162 = _1112;
    float _1164 = _1116;
    if (!_940)
    {
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1174 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1172);
        float _1176 = _1168 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = _1170 * 0.15915493667125701904296875;
        float _1182 = _1168 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        float _1186 = 1.0 / _1178;
        float _1188 = _1180 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1184 * _1186;
        float _1194 = _1180 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = _1190 * _1192;
        float _1200 = 1.0 / _1174;
        float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1204 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1202;
        float _1206 = 1.0 / _1198;
        float _1208 = 1.0 / _1204;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1212 = _1200 * _1210;
        float _1214 = _1196 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1218 = fma(_1214, _1212, _1216);
        float _1220 = _1218 * _1208;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        _1106 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1108 = _1222;
    }
    float _1224 = _1106;
    float _1226 = _1108;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1160 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1162 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1164 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1224;
    float _1278 = _1250;
    if (_1264)
    {
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1280;
    }
    float _1282 = _1270;
    if (_1264)
    {
        float _1284 = rsqrt(_1260);
        _1272 = _1284;
    }
    float _1286 = _1272;
    float _1288 = _1286;
    if (_1264)
    {
        float _1290 = _1268 * _1282;
        _1274 = _1290;
    }
    float _1292 = _1274;
    if (_1264)
    {
        float _1294 = _1292 * 0.15915493667125701904296875;
        _1276 = _1294;
    }
    float _1296 = _1276;
    float _1298 = _1282;
    float _1300 = _1296;
    if (_1264)
    {
        float _1302 = _1296 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1298 = _1304;
    }
    float _1306 = _1298;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1240;
    float _1314 = _1310;
    if (_1264)
    {
        float _1316 = _1296 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1250;
    float _1324 = -_1310;
    float _1326 = fma(_1230, _1322, _1324);
    float _1328 = _1326;
    if (_1264)
    {
        float _1330 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1330;
    }
    float _1332 = _1314;
    float _1334 = _1306;
    float _1336 = _1332;
    if (_1264)
    {
        float _1338 = fma(_1306, _1332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    float _1344 = _1320;
    if (_1264)
    {
        float _1346 = _1320 + (-1.0);
        _1336 = _1346;
    }
    float _1348 = _1336;
    float _1350 = _1348;
    if (_1264)
    {
        float _1352 = _1286 * _1340;
        _1278 = _1352;
    }
    float _1354 = _1278;
    if (!_1264)
    {
        _1342 = _1252;
    }
    float _1356 = _1342;
    float _1358 = _1356;
    if (_1264)
    {
        float _1360 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1300 = _1360;
    }
    float _1362 = _1300;
    if (_1264)
    {
        float _1364 = _1252 * _1354;
        _1358 = _1364;
    }
    float _1366 = _1358;
    if (!_1264)
    {
        _1350 = _1254;
    }
    float _1368 = _1350;
    float _1370 = _1368;
    if (_1264)
    {
        float _1372 = _1254 * _1354;
        _1370 = _1372;
    }
    float _1374 = _1370;
    if (!_1264)
    {
        _1288 = _1256;
    }
    float _1376 = _1288;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = fma(_1326, _1320, _1362);
        _1328 = _1380;
    }
    float _1382 = _1328;
    if (_1264)
    {
        float _1384 = _1366 * _1366;
        _1378 = _1384;
    }
    float _1386 = _1378;
    if (!_1264)
    {
        _1344 = _1258;
    }
    float _1388 = _1344;
    float _1390 = _1388;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = fma(_1382, _1382, _1386);
    float _1398 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1400 = _1396 + _1394;
    float _1402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1404 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1402);
    float _1406 = precise::clamp(_1404, 0.0, 1.0);
    float _1408 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1410 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1412 = rsqrt(_1400);
    float _1414 = -_1406;
    float _1416 = _1414 + 1.0;
    float _1418 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1420 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1410);
    float _1422 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1398);
    float _1424 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1418);
    float _1426 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1428 = abs(_1416);
    float _1430 = log2(_1428);
    float _1432 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1422);
    float _1434 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1436 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1438 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1446 = _1412 * _1366;
    float _1448 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1440);
    float _1450 = _1412 * _1382;
    float _1452 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1444);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1456 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1448);
    float _1458 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1460 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1462 = _1412 * _1374;
    float _1464 = -_1454;
    float _1466 = fma(_1450, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1464);
    float _1468 = _1456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1452);
    float _1472 = -_1458;
    float _1474 = fma(_1472, _1408, 1.0);
    float _1476 = -_1462;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1466);
    float _1480 = exp2(_1460);
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1486 = fma(_1478, -0.5, 0.5);
    float _1488 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1490 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1484);
    float _1492 = _1450 + 1.0;
    float _1494 = log2(_1474);
    float _1496 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1488);
    float _1498 = fma(_1478, 0.5, 0.5);
    float _1500 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1490);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1496);
    float _1504 = fma(_1498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1506 = 1.0 / _1482;
    float _1508 = -_1450;
    float _1510 = fma(_1480, _1492, _1508);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1514 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1516 = fma(_1498, _1504, -0.212114393711090087890625);
    float _1518 = sqrt(_1486);
    float _1520 = _1494 * 0.693147182464599609375;
    float _1522 = fma(_1498, _1516, 1.570728778839111328125);
    float _1524 = fma(_1510, 0.5, 0.5);
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1528 = _1512 * _1506;
    float _1530 = _1514 * _1506;
    float _1532 = fma(_1528, 0.5, 0.5);
    float _1534 = fma(_1530, -0.5, 0.5);
    float _1536 = _1518 * 0.636619746685028076171875;
    float3 _4214 = float3(_1532, _1534, _1526);
    float _1538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4214, float3(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4214, float3(0.0), isnan(_4214)), level(0.0)).x;
    float _1540 = -_1522;
    float _1542 = fma(_1536, _1540, 1.0);
    float3 _4230 = float3(_1532, _1534, _1526);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4230, float3(0.0), isnan(_4230)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4230, float3(0.0), isnan(_4230)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _4247 = float2(_1542, _1524);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4247, float2(0.0), isnan(_4247)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4247, float2(0.0), isnan(_4247)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = in.m_61.y;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1573 = _594 > 0.5;
    float _1575 = in.m_59.y;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1579 = _1577 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1583 = _1581 != 0;
    float _1585 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1587 = 1.0 / _1571;
    float _1589 = in.m_61.x;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1593 = _1591 != 0;
    float _1595 = _1436 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1597 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1599 = isnan(_586);
    bool _1601 = _1597 || _1599;
    bool _1603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1605 = _1601 || _1603;
    float _1607 = float(_1605);
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1609;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1615 = _1613 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1617 = 1.0 / _1579;
    out.m_63.x = _866;
    float _1619 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1595);
    float _1621 = 0.0;
    float _1623 = _1589;
    if (_1583)
    {
        float _1625 = in.m_51.x;
        _1621 = _1625;
    }
    float _1627 = _1621;
    float _1629 = -_1565;
    float _1631 = _1629 + 1.0;
    float _1633 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1619);
    float _1635 = _1611 * _1587;
    bool _1637 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1639 = isnan(_586);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1645 = _1641 || _1643;
    float _1647 = float(_1645);
    float _1649 = in.m_59.z;
    float _1651 = _1565;
    if (_1593)
    {
        float _1653 = _1573 ? _1631 : _1565;
        _1651 = _1653;
    }
    float _1655 = _1651;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1659 = _586 + _1657;
    bool _1661 = _920 != 0.0;
    bool _1663 = isnan(_920);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.0);
    bool _1669 = _1665 || _1667;
    float _1671 = -_1647;
    float _1673 = _1671 + 1.0;
    out.m_63.y = _1575;
    float _1675 = _1615 * _1617;
    bool _1677 = _910 == 0.0;
    bool _1679 = !_1669;
    bool _1681 = _1677 && _1679;
    float _1683 = exp2(_1585);
    float _1685 = in.m_65.x;
    float _1687 = in.m_65.y;
    float _1689 = in.m_65.z;
    float _1691 = fma(_1635, _1659, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1693 = _712 == 0.0;
    bool _1695 = _1693 && _1681;
    float _1697 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1701 = _586 + _1699;
    out.m_67.x = _1162;
    out.m_67.y = _1160;
    out.m_67.z = _1164;
    float _1703 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1705 = fma(_1675, _1701, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1707 = fma(_1697, _1655, -0.5);
    bool _1709 = _1627 > 0.5;
    bool _1711 = _1709 && _1583;
    bool _1713 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1715 = isnan(_586);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = _1607 * _1673;
    float _1727 = -_1607;
    float _1729 = _1727 + 1.0;
    float _1731 = _1673;
    if (_1583)
    {
        _1731 = _1589;
    }
    float _1733 = _1731;
    float _1735 = -_1683;
    float _1737 = _1735 + 1.0;
    float _1739 = -_782;
    float _1741 = fma(_786, _1707, _1739);
    float _1743 = _1723 * _1729;
    float _1745 = -_1723;
    float _1747 = _1745 + 1.0;
    out.m_63.z = _1649;
    float _1749 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1751 = _1691 * _1743;
    float _1753 = _1733;
    if (_1711)
    {
        float _1755 = -_1733;
        float _1757 = _1755 + 1.0;
        _1753 = _1757;
    }
    float _1759 = _1753;
    float _1761 = _1687;
    float _1763 = _1685;
    float _1765 = _1689;
    if (!_1695)
    {
        float _1767 = fma(_920, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1687);
        _1761 = _1767;
    }
    float _1769 = _1761;
    if (!_1695)
    {
        float _1771 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1685);
        _1763 = _1771;
    }
    float _1773 = _1763;
    if (!_1695)
    {
        float _1775 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1689);
        _1765 = _1775;
    }
    float _1777 = _1765;
    float _1779 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1751);
    float _1781 = _974 * _1769;
    float _1783 = -_1769;
    float _1785 = _968 * _1783;
    float _1787 = _978 * _1769;
    float _1789 = fma(_990, _1773, _1781);
    float _1791 = fma(_976, _1773, _1785);
    float _1793 = fma(_996, _1773, _1787);
    float _1795 = fma(_1004, _1777, _1789);
    float _1797 = fma(_980, _1777, _1791);
    float _1799 = fma(_992, _1777, _1793);
    float _1801 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1803 = fma(_1705, _1725, _1779);
    float _1805 = in.m_59.w;
    float _1807 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1809 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1801);
    float _1811 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1803);
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1815 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1817 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1583)
    {
        _1623 = _1759;
    }
    float _1819 = _1623;
    float _1821 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1807);
    float _1823 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1825 = _1741 + 0.5;
    float _1827 = _1813 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1829 = _1815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _1817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1833 = _1811 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1835 = _1795 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1837 = fma(_1823, _1819, -0.5);
    float _1839 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1633);
    bool _1841 = _1226 > 0.0;
    bool _1843 = isnan(_1226);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    out.m_69.x = _1827;
    out.m_69.y = _1829;
    out.m_69.z = _1831;
    out.m_69.w = _1833;
    float _1851 = fma(_1797, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1853 = fma(_776, _1837, _772);
    float _1855 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1857 = _1839 + _1482;
    float _1859 = _1512 + _1482;
    float _1861 = _1482 * 0.5;
    float _1863 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1809);
    float _1865 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1851);
    float _1867 = _1853 + 0.5;
    float _1869 = fma(_1799, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1821);
    float _1871 = _1857 * 0.5;
    float _1873 = _1859 * 0.5;
    float _1875 = fma(_1514, -0.5, _1861);
    float _1877 = _1855 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.w = _1805;
    out.m_71.x = _1867;
    out.m_71.y = _1825;
    out.m_73.x = _1863;
    out.m_73.y = _1869;
    out.m_73.z = _1865;
    out.gl_Position.x = _1512;
    out.gl_Position.y = _1514;
    out.gl_Position.z = _1839;
    out.gl_Position.w = _1482;
    out.m_75.x = _1873;
    out.m_75.y = _1875;
    out.m_75.z = _1871;
    out.m_75.w = _1482;
    out.m_45.x = _1877;
    float _1879 = _1749 * _1538;
    float _1881 = -_1749;
    float _1883 = _1881 + 1.0;
    float _1885 = _1553 * _1879;
    float _1887 = _1563 * _1879;
    float _1889 = fma(_1559, _1885, _1547);
    float _1891 = fma(_1561, _1885, _1549);
    float _1893 = _1553 * _1883;
    float _1895 = fma(_1553, _1887, _1551);
    out.m_77.x = _1889;
    out.m_77.y = _1891;
    out.m_77.z = _1895;
    out.m_77.w = _1893;
    if (_1849)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1897;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

