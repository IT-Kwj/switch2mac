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
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_73 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1564 = false;
    bool _572 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2043 = as_type<float>(_110);
        out.gl_Position.z = _2043;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_49.w;
    float _116 = float(_96);
    float _118 = in.m_51.x;
    float _120 = 1.0 / _116;
    float _122 = -_114;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_114);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = _124 * _120;
    bool _138 = _124 >= _116;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    out.m_53.x = _118;
    out.m_55.x = _136;
    float _144 = _114;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _112 = as_type<int>(_148);
    }
    int _150 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2118 = as_type<float>(_150);
        out.gl_Position.z = _2118;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_57.w;
    float _154 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _290;
    if (!_274)
    {
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _118 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _136;
    }
    _292 = false;
    float _294 = _290;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _314;
    float _326 = 1.0 / _310;
    bool _328 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _330 = isnan(_294);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = 1.0 / _318;
    float _344 = _306 * _324;
    float _346 = -_338;
    float _348 = _346 + 1.0;
    bool _350 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_294);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _322;
    float _364 = _298 * _326;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _368 = _294 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = fma(_372, _364, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _302 * _342;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_380, _364, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _384 = _368 * _362;
    bool _386 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_294);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    bool _398 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _400 = isnan(_294);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _396 * _348;
    float _412 = -_396;
    float _414 = _412 + 1.0;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -_408;
    float _422 = _420 + 1.0;
    float _424 = _360 * _414;
    float _426 = -_360;
    float _428 = _426 + 1.0;
    float _430 = fma(_418, _364, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _432 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_294);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = _408 * _428;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = _442 * _422;
    float _460 = fma(_446, _344, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _462 = fma(_452, _344, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_456, _344, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _466 = _430 * _458;
    float _468 = _374 * _458;
    float _470 = _382 * _458;
    float _472 = -_442;
    float _474 = _472 + 1.0;
    float _476 = in.m_57.x;
    float _478 = in.m_57.y;
    float _480 = in.m_57.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _496 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _498 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _500 = fma(_484, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _502 = fma(_488, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = fma(_492, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = fma(_460, _448, _494);
    float _508 = fma(_462, _448, _496);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_464, _448, _498);
    float _524 = fma(_512, _384, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_516, _384, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = fma(_520, _384, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _530 = fma(_500, _424, _506);
    float _532 = fma(_502, _424, _508);
    float _534 = fma(_504, _424, _522);
    float _536 = fma(_524, _410, _530);
    float _538 = fma(_526, _410, _532);
    float _540 = fma(_528, _410, _534);
    float _542 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].x, _536);
    float _544 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].y, _538);
    float _546 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].z, _540);
    float _548 = _542 * _476;
    float _550 = _544 * _478;
    float _552 = _546 * _480;
    bool _554 = !_340;
    float _570;
    if (!_554)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _558 = _118 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        _570 = _136;
    }
    _572 = false;
    float _574 = _570;
    float _576 = in.m_59.x;
    float _578 = in.m_59.y;
    float _580 = in.m_59.z;
    float _582 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = in.m_61.y;
    float _586 = in.m_51.z;
    float _588 = in.m_51.w;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _578);
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _576);
    float _594 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _580);
    float _598 = _582 * _590;
    float _600 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _604 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _606 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _608 = _594 * _592;
    float _610 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _612 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    float _614 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
    float _616 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _604);
    float _618 = _606 * _596;
    float _620 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[25].x, _610);
    float _622 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _624 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _616);
    float _626 = _136 + 0.20000000298023223876953125;
    float _628 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    float _630 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[25].z, _620);
    float _634 = fma(_584, -0.60000002384185791015625, _626);
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _640 = _628 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _642 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[24].x, _630);
    float _644 = _632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _646 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[26].x, _638);
    float _648 = _636 * _636;
    float _650 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[24].z, _642);
    float _652 = _640 + _644;
    float _654 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[26].z, _646);
    float _656 = _622 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _658 = _650 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[191].y, _652);
    float _662 = _624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = _654 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _666 = _656 + _658;
    float _668 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _670 = _660 + _668;
    float _672 = _662 + _664;
    float _674 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _676 = _666 + _674;
    float _678 = _670 * _670;
    float _680 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _682 = _672 + _680;
    float _684 = fma(_676, _676, _678);
    float _686 = fma(_682, _682, _684);
    float _688 = rsqrt(_686);
    float _690 = _670 * _688;
    float _692 = _676 * _688;
    float _694 = _682 * _688;
    float _696 = _690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _698 = _690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _700 = in.m_51.y;
    float _702 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _696);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _698);
    float _706 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _702);
    float _708 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _704);
    float _710 = abs(_706);
    float _712 = abs(_708);
    float _714 = precise::max(_710, _712);
    bool _716 = _714 >= 16.0;
    float _718 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _720 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _718);
    float _722 = _706;
    float _724 = _708;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _728 = _610;
    float _730 = _648;
    if (_716)
    {
        float _732 = _706 * 0.0625;
        _722 = _732;
    }
    float _734 = _722;
    if (_716)
    {
        float _736 = _708 * 0.0625;
        _724 = _736;
    }
    float _738 = _724;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _742 = _740 != 0;
    float _744 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _720);
    float _746 = abs(_734);
    bool _748 = _746 != 0.0;
    bool _750 = isnan(_746);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = abs(_738);
    bool _760 = _758 == 0.0;
    float _762 = rsqrt(_744);
    float _764 = abs(_738);
    bool _766 = _764 == 0.0;
    bool _768 = !_756;
    bool _770 = _766 && _768;
    bool _772 = false;
    if (_770)
    {
        bool _774 = as_type<int>(_738) >= 0;
        _772 = _774;
    }
    bool _776 = _772;
    int _778 = _776 ? (-1) : 0;
    if (_770)
    {
        int _780 = _776 ? 0 : 1078530011;
        _726 = _780;
    }
    int _782 = _726;
    int _784 = _782;
    if (_770)
    {
        int _786 = int(0x80000000) & as_type<int>(_734);
        int _788 = _782 | _786;
        _784 = _788;
    }
    int _790 = _784;
    bool _792 = !_756;
    bool _794 = _792 && _760;
    int _796 = _790;
    float _798 = as_type<float>(_790);
    if (!_794)
    {
        float _800 = abs(_734);
        bool _802 = _800 != as_type<float>(0x7f800000u /* inf */);
        bool _804 = isnan(_800);
        bool _806 = _802 || _804;
        bool _808 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _810 = _806 || _808;
        float _812 = abs(_738);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        float _816 = abs(_738);
        bool _818 = _816 == as_type<float>(0x7f800000u /* inf */);
        bool _820 = !_810;
        bool _822 = _818 && _820;
        if (_822)
        {
            bool _824 = as_type<int>(_738) >= 0;
            _778 = _824 ? (-1) : 0;
        }
        int _826 = _778;
        if (_822)
        {
            _796 = 1075235812;
        }
        int _828 = _796;
        int _830 = _828;
        if (_822)
        {
            int _832 = ~_826;
            int _834 = (_832 != 0) ? _828 : 1061752795;
            _830 = _834;
        }
        int _836 = _830;
        float _838 = as_type<float>(_836);
        if (_822)
        {
            int _840 = int(0x80000000) & as_type<int>(_734);
            int _842 = _836 | _840;
            _838 = as_type<float>(_842);
        }
        float _844 = _838;
        bool _846 = !_810;
        bool _848 = _846 && _814;
        _798 = _844;
        if (!_848)
        {
            float _850 = abs(_734);
            float _852 = abs(_738);
            float _854 = precise::max(_850, _852);
            float _856 = abs(_734);
            float _858 = abs(_738);
            float _860 = precise::min(_856, _858);
            float _862 = 1.0 / _854;
            float _864 = abs(_734);
            float _866 = abs(_738);
            bool _868 = _864 > _866;
            bool _870 = as_type<int>(_738) >= 0;
            float _872 = _860 * _862;
            float _874 = _872 * _872;
            float _876 = _874 + 11.33538818359375;
            float _878 = fma(_874, _876, 28.84246826171875);
            float _880 = fma(_874, _878, 19.6966705322265625);
            float _882 = fma(_874, -0.82336294651031494140625, -5.674867153167724609375);
            float _884 = fma(_874, _882, -6.565555095672607421875);
            float _886 = 1.0 / _880;
            float _888 = _874 * _884;
            float _890 = abs(_734);
            float _892 = abs(_738);
            float _894 = _890 + _892;
            int _896 = as_type<int>(_734) & int(0x80000000);
            float _898 = _872 * _888;
            bool _900 = _894 > as_type<float>(0x7f800000u /* inf */);
            bool _902 = isnan(_894);
            bool _904 = _900 || _902;
            bool _906 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _908 = _904 || _906;
            float _910 = fma(_898, _886, _872);
            float _912 = _910;
            _728 = _886;
            _798 = _894;
            if (_868)
            {
                float _914 = -_910;
                float _916 = _914 + 1.57079637050628662109375;
                _912 = _916;
            }
            float _918 = _912;
            int _920 = as_type<int>(_918);
            if (!_870)
            {
                float _922 = -_918;
                float _924 = _922 + 3.1415927410125732421875;
                _920 = as_type<int>(_924);
            }
            int _926 = _920;
            if (!_908)
            {
                int _928 = _896 | _926;
                _798 = as_type<float>(_928);
            }
        }
    }
    float _930 = _728;
    float _932 = _798;
    float _934 = -_584;
    float _936 = _934 + 1.0;
    bool _938 = _700 > 0.5;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _950 = _948 != 0;
    float _952 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _954 = _938 ? as_type<int>(_936) : as_type<int>(_584);
    float _956 = 1.0 / _942;
    float _958 = _930;
    float _960 = _936;
    if (_742)
    {
        float _962 = in.m_51.z;
        _958 = _962;
    }
    float _964 = _958;
    float _966 = _950 ? as_type<float>(_954) : _584;
    float _968 = _952 * _952;
    bool _970 = _586 > 0.5;
    float _972 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _976 = _974 != 0;
    float _978 = 1.0 / _946;
    float _980 = _970 ? _936 : _584;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = in.m_61.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _998 = _996 != 0;
    float _1000 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1002 = _976 ? _980 : _584;
    float _1004 = _984 * _956;
    float _1006 = fma(_1000, _1000, _968);
    bool _1008 = _588 > 0.5;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1016;
    int _1020 = _1008 ? as_type<int>(_936) : as_type<int>(_584);
    float _1022 = fma(_972, _972, _1006);
    float _1024 = _932 * (-0.15915493667125701904296875);
    float _1026 = _1018 * _978;
    float _1028 = _998 ? as_type<float>(_1020) : _584;
    float _1030 = rsqrt(_1022);
    bool _1032 = _1008;
    float _1034 = _980;
    bool _1036 = _998;
    if (_742)
    {
        bool _1038 = _964 > 0.5;
        _1032 = _1038;
    }
    bool _1040 = _1032;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1014)
    {
        _960 = _118;
    }
    float _1044 = _960;
    float _1046 = _1024 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1044;
    if (!_1014)
    {
        _1050 = _586;
    }
    float _1052 = _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _574 + _1054;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1062 = _574 + _1060;
    if (_1014)
    {
        _1034 = _700;
    }
    float _1064 = _1034;
    float _1066 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1042);
    float _1068 = _1024 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_118, -0.20000000298023223876953125, 1.0);
    float _1074 = _1064;
    if (_988)
    {
        bool _1076 = _118 > 0.5;
        _1036 = _1076;
    }
    bool _1078 = _1036;
    float _1080 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1058);
    if (!_1014)
    {
        _1074 = _118;
    }
    float _1082 = _1074;
    float _1084 = -_636;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1026, _1056, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1090 = _1000 * _1030;
    float _1092 = _972 * _1030;
    float _1094 = -_1048;
    float _1096 = _1094 + 1.0;
    float _1098 = fma(_1004, _1062, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1100 = _952 * _1030;
    float _1102 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1104 = -_1086;
    float _1106 = fma(_1104, _1086, 1.0);
    float _1108 = _1090 * _1096;
    float _1110 = _1100 * _1096;
    float _1112 = _1092 * _1070;
    float _1114 = _1090 * _1070;
    float _1116 = _1106 * _1102;
    float _1118 = _1100 * _1070;
    float _1120 = -_1112;
    float _1122 = fma(_1100, _1108, _1120);
    float _1124 = fma(_1092, _1110, _1114);
    float _1126 = fma(_1090, _1108, _1048);
    float _1128 = -_1118;
    float _1130 = fma(_1092, _1108, _1128);
    float _1132 = _644 * _1122;
    float _1134 = _1092 * _1092;
    float _1136 = _644 * _1124;
    float _1138 = fma(_1092, _1108, _1118);
    float _1140 = fma(_658, _1126, _1132);
    float _1142 = fma(_1096, _1134, _1048);
    float _1144 = fma(_658, _1130, _1136);
    float _1146 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1148 = _662 + _1146;
    float _1150 = fma(_664, _1138, _1140);
    float _1152 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1154 = _656 + _1152;
    float _1156 = fma(_664, _1142, _1144);
    float _1158 = _1134;
    float _1160 = _1142;
    float _1162 = _1116;
    if (!_988)
    {
        _1158 = _990;
    }
    float _1164 = _1158;
    float _1166 = _656 + _1150;
    float _1168 = fma(_1100, _1108, _1112);
    float _1170 = _662 + _1156;
    float _1172 = _1164;
    if (!_988)
    {
        _1160 = _1164;
    }
    float _1174 = _1160;
    float _1176 = fma(_1154, _1116, _1166);
    float _1178 = fma(_1100, _1110, _1048);
    float _1180 = fma(_1148, _1116, _1170);
    float _1182 = _1174;
    if (_988)
    {
        _1172 = _990;
    }
    float _1184 = _1172;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1188 = _1176 + _1186;
    float _1190 = _644 * _1178;
    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1194 = _1180 + _1192;
    float _1196 = -_1114;
    float _1198 = fma(_1092, _1110, _1196);
    float _1200 = _1188 * _1188;
    float _1202 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_658, _1168, _1190);
    bool _1208 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1210 = isnan(_574);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1002, _1202, -0.5);
    float _1222 = _1200 + _1204;
    float _1224 = fma(_664, _1198, _1206);
    bool _1226 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1228 = isnan(_574);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1218;
    float _1240 = _1238 + 1.0;
    float _1242 = sqrt(_1222);
    int _1244 = 0;
    float _1246 = _1184;
    float _1248 = _1200;
    float _1250 = _1204;
    if (_988)
    {
        float _1252 = -_1184;
        float _1254 = _1252 + 1.0;
        _1244 = as_type<int>(_1254);
    }
    int _1256 = _1244;
    bool _1258 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1260 = isnan(_574);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1236 * _1240;
    float _1272 = -_1236;
    float _1274 = _1272 + 1.0;
    float _1276 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1278 = as_type<int>(_1276);
    if (_988)
    {
        float _1280 = _1078 ? as_type<float>(_1256) : _1184;
        _1182 = _1280;
    }
    float _1282 = _1182;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1286 = _1268 * _1274;
    float _1288 = _640 + _1224;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1292 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1296 = _1088 * _1286;
    bool _1298 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1300 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1288);
    float _1302 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1304 = _640 + _1302;
    float _1306 = -_1284;
    float _1308 = fma(_1292, 2.0, _1306);
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1312 = fma(_1276, -2.0, _1294);
    int _1314 = as_type<int>(_1288);
    float _1316 = _1300;
    if (_742)
    {
        float _1318 = -_1184;
        float _1320 = _1318 + 1.0;
        _1278 = as_type<int>(_1320);
    }
    int _1322 = _1278;
    if (_994)
    {
        float _1324 = -_1184;
        float _1326 = _1324 + 1.0;
        _1314 = as_type<int>(_1326);
    }
    int _1328 = _1314;
    float _1330 = -_1268;
    float _1332 = _1330 + 1.0;
    float _1334 = fma(_1304, _1116, _1300);
    float _1336 = _1332;
    if (!_742)
    {
        _730 = _1184;
    }
    float _1338 = _730;
    float _1340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1342 = _1338;
    if (_742)
    {
        float _1344 = _1040 ? as_type<float>(_1322) : _1184;
        _1342 = _1344;
    }
    float _1346 = _1342;
    float _1348 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1296);
    if (!_1298)
    {
        _1162 = _1200;
    }
    float _1350 = _1162;
    float _1352 = _1350;
    if (_994)
    {
        float _1354 = _938 ? as_type<float>(_1328) : _1184;
        _1246 = _1354;
    }
    float _1356 = _1246;
    if (!_1298)
    {
        _1248 = _1176;
    }
    float _1358 = _1248;
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1362 = _1358;
    if (!_1298)
    {
        _1336 = _1180;
    }
    float _1364 = _1336;
    float _1366 = _1364;
    if (!_1298)
    {
        _1316 = _1334;
    }
    float _1368 = _1316;
    bool _1370 = !_1298;
    float _1372 = _1368;
    if (!_1370)
    {
        float _1374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1378 = _1242 + _1376;
        float _1380 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = rsqrt(_1222);
        float _1384 = _1378 * _1374;
        float _1386 = _1384 * 0.15915493667125701904296875;
        float _1388 = _1386 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1382 * _1396;
        float _1400 = fma(_1188, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = _1394 + (-1.0);
        float _1404 = fma(_1194, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1408 = _1400 + _1406;
        float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1414 = _1404 + _1412;
        float _1416 = _1408 * _1408;
        float _1418 = fma(_1334, _1394, _1410);
        float _1420 = _1414 * _1414;
        _1372 = _1418;
        _1352 = _1416;
        _1250 = _1420;
        _1362 = _1400;
        _1366 = _1404;
    }
    float _1422 = _1372;
    float _1424 = _1352;
    float _1426 = _1250;
    float _1428 = _1362;
    float _1430 = _1366;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1434 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1066);
    float _1436 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1080);
    float _1438 = -_124;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1308);
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1444 = _1422 + _1442;
    float _1446 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1312);
    float _1448 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1450 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1452 = fma(_1444, _1444, _1424);
    float _1454 = -_1446;
    float _1456 = fma(_1436, _1220, _1454);
    float _1458 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1460 = fma(_1448, _1356, -0.5);
    float _1462 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1464 = _1452 + _1426;
    float _1466 = _1450 * _1340;
    float _1468 = fma(_1098, _1270, _1348);
    float _1470 = fma(_1434, _1460, _1440);
    float _1472 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1474 = _1458 * _1432;
    float _1476 = _1462 * _1360;
    float _1478 = sqrt(_1464);
    float _1480 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1468);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1490 = _1472 * _1310;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1456 + 0.5;
    float _1510 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1512 = _1470 + 0.5;
    out.m_63.x = _1490;
    out.m_63.y = _1466;
    out.m_63.z = _1476;
    out.m_63.w = _1474;
    bool _1514 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1516 = isnan(_1478);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1522 = _1518 || _1520;
    out.m_65.x = _1502;
    out.m_65.y = _1504;
    out.m_65.z = _1506;
    out.m_67.x = _1494;
    out.m_67.y = _1498;
    out.m_67.z = _1500;
    out.m_67.w = _1510;
    out.m_69.x = _1512;
    out.m_69.y = _1508;
    float _1524 = _1488;
    float _1526 = _1498;
    float _1528 = _1422;
    if (!_1522)
    {
        _1524 = 1.0;
    }
    float _1530 = _1524;
    bool _1532 = !_1522;
    float _1534 = _1530;
    if (!_1532)
    {
        bool _1536 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1538 = isnan(_1478);
        bool _1540 = _1536 || _1538;
        bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1544 = _1540 || _1542;
        if (!_1544)
        {
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = _1478 + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1558 = 1.0 / _1552;
            float _1560 = _1548 * _1558;
            float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1534 = _1562;
            _1564 = true;
        }
        else
        {
            bool _1566 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1568 = isnan(_1478);
            bool _1570 = _1566 || _1568;
            bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1574 = _1570 || _1572;
            if (!_1574)
            {
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1478 + _1576;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1588 = 1.0 / _1582;
                float _1590 = _1578 * _1588;
                float _1592 = fma(_1590, _1586, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1534 = _1592;
                _1564 = true;
            }
            else
            {
                _1534 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1564 = false;
    float _1594 = _1534;
    float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1598 = _1422 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1602 = _1428 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1606 = _1430 + _1604;
    float _1608 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1610 = fma(_1602, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1612 = fma(_1606, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = _1608 + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1624 = _1612 + _1622;
    float _1626 = _1616 * _1616;
    float _1628 = fma(_1620, _1620, _1626);
    float _1630 = fma(_1624, _1624, _1628);
    float _1632 = rsqrt(_1630);
    float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1636 = _1620 * _1634;
    float _1638 = _1624 * _1634;
    float _1640 = _1636 * _1636;
    float _1642 = _1638 * _1638;
    float _1644 = _1640 + _1642;
    float _1646 = sqrt(_1644);
    bool _1648 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1646 + _1650;
    float _1654 = _1624;
    float _1656 = _1626;
    float _1658 = _1652;
    float _1660 = _1616;
    float _1662 = _1636;
    if (_1648)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1664;
    }
    float _1666 = _1654;
    if (_1648)
    {
        float _1668 = rsqrt(_1644);
        _1656 = _1668;
    }
    float _1670 = _1656;
    float _1672 = _1670;
    if (_1648)
    {
        float _1674 = _1652 * _1666;
        _1658 = _1674;
    }
    float _1676 = _1658;
    if (_1648)
    {
        float _1678 = _1676 * 0.15915493667125701904296875;
        _1526 = _1678;
    }
    float _1680 = _1526;
    float _1682 = _1632;
    if (_1648)
    {
        float _1684 = _1680 * 6.283185482025146484375;
        float _1686 = sin(_1684);
        _1682 = _1686;
    }
    float _1688 = _1682;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1692 = precise::max(0.0, _1690);
    float _1694 = _1474;
    float _1696 = _1692;
    float _1698 = _1690;
    if (_1648)
    {
        float _1700 = _1680 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        _1694 = _1702;
    }
    float _1704 = _1694;
    float _1706 = -_1634;
    float _1708 = -_1692;
    float _1710 = fma(_1616, _1706, _1708);
    if (!_1648)
    {
        _1660 = _1638;
    }
    float _1712 = _1660;
    float _1714 = _1712;
    if (_1648)
    {
        float _1716 = _1710 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1696 = _1716;
    }
    float _1718 = _1696;
    float _1720 = sqrt(_1630);
    float _1722 = _1688;
    float _1724 = _1718;
    if (_1648)
    {
        float _1726 = fma(_1688, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1722 = _1726;
    }
    float _1728 = _1722;
    float _1730 = _1728;
    if (!_1648)
    {
        _1724 = _1640;
    }
    float _1732 = _1724;
    float _1734 = _1732;
    if (_1648)
    {
        float _1736 = _1704 + (-1.0);
        _1698 = _1736;
    }
    float _1738 = _1698;
    float _1740 = _1738;
    if (_1648)
    {
        float _1742 = _1670 * _1728;
        _1528 = _1742;
    }
    float _1744 = _1528;
    if (!_1648)
    {
        _1730 = _1710;
    }
    float _1746 = _1730;
    float _1748 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = _1746;
    if (_1648)
    {
        float _1752 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1752;
    }
    float _1754 = _1672;
    if (_1648)
    {
        float _1756 = _1636 * _1744;
        _1662 = _1756;
    }
    float _1758 = _1662;
    if (_1648)
    {
        float _1760 = _1638 * _1744;
        _1714 = _1760;
    }
    float _1762 = _1714;
    if (!_1648)
    {
        _1740 = _1642;
    }
    float _1764 = _1740;
    float _1766 = _1764;
    if (_1648)
    {
        float _1768 = fma(_1710, _1704, _1754);
        _1750 = _1768;
    }
    float _1770 = _1750;
    if (_1648)
    {
        float _1772 = _1758 * _1758;
        _1734 = _1772;
    }
    float _1774 = _1734;
    if (_1648)
    {
        float _1776 = _1762 * _1762;
        _1766 = _1776;
    }
    float _1778 = _1766;
    float _1780 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1782 = fma(_1770, _1770, _1774);
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1786 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1784);
    float _1788 = precise::clamp(_1786, 0.0, 1.0);
    float _1790 = _1782 + _1778;
    float _1792 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1796 = -_1788;
    float _1798 = _1796 + 1.0;
    float _1800 = rsqrt(_1790);
    float _1802 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1804 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1802);
    float _1808 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1810 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1812 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1814 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1808);
    float _1816 = abs(_1798);
    float _1818 = log2(_1816);
    float _1820 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    float _1822 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1824 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1814);
    float _1826 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1828 = _1800 * _1758;
    float _1830 = -_1822;
    float _1832 = fma(_1830, _1794, 1.0);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1836 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1838 = _1800 * _1770;
    float _1840 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1842 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1780);
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1836);
    float _1846 = _1800 * _1762;
    float _1848 = -_1840;
    float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1848);
    float _1852 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1854 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1858 = -_1846;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1850);
    float _1862 = exp2(_1852);
    float _1864 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1856);
    float _1868 = fma(_1860, -0.5, 0.5);
    float _1870 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1864);
    float _1874 = fma(_1860, 0.5, 0.5);
    float _1876 = _1838 + 1.0;
    float _1878 = log2(_1832);
    float _1880 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1882 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1872);
    float _1884 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1886 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1880);
    float _1888 = fma(_1874, _1884, -0.212114393711090087890625);
    float _1890 = 1.0 / _1866;
    float _1892 = -_1838;
    float _1894 = fma(_1862, _1876, _1892);
    float _1896 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1882);
    float _1898 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1886);
    float _1900 = fma(_1874, _1888, 1.570728778839111328125);
    float _1902 = fma(_1894, 0.5, 0.5);
    float _1904 = sqrt(_1868);
    float _1906 = _1878 * 0.693147182464599609375;
    float _1908 = _1896 * _1890;
    float _1910 = _1898 * _1890;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1914 = fma(_1908, 0.5, 0.5);
    float _1916 = fma(_1910, -0.5, 0.5);
    float _1918 = _1904 * 0.636619746685028076171875;
    float3 _5051 = float3(_1914, _1916, _1912);
    float _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5051, float3(0.0), isnan(_5051)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5051, float3(0.0), isnan(_5051)), level(0.0)).x;
    float3 _5062 = float3(_1914, _1916, _1912);
    float4 _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5062, float3(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5062, float3(0.0), isnan(_5062)), level(0.0)).xyzw;
    float _1925 = _1923.x;
    float _1927 = _1923.y;
    float _1929 = _1923.z;
    float _1931 = _1923.w;
    float _1933 = -_1900;
    float _1935 = fma(_1918, _1933, 1.0);
    float2 _5084 = float2(_1935, _1902);
    float3 _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5084, float2(0.0), isnan(_5084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5084, float2(0.0), isnan(_5084)), level(0.0)).xyz;
    float _1941 = _1939.x;
    float _1943 = _1939.y;
    float _1945 = _1939.z;
    float _1947 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1949 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _656;
    out.m_71.y = _640;
    out.m_71.z = _662;
    float _1951 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1949);
    float _1953 = exp2(_1947);
    out.m_73.x = _1610;
    out.m_73.y = _1608;
    out.m_73.z = _1612;
    float _1955 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    float _1957 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1955);
    float _1959 = _1957 + _1866;
    out.gl_Position.x = _1896;
    out.gl_Position.y = _1898;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1866;
    float _1961 = _1959 * 0.5;
    float _1963 = -_1953;
    float _1965 = _1963 + 1.0;
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1961;
    out.m_75.w = _1866;
    float _1969 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = -_1967;
    float _1973 = _1971 + 1.0;
    out.m_47.x = _1969;
    float _1975 = _1967 * _1920;
    float _1977 = _1931 * _1975;
    float _1979 = _1945 * _1975;
    float _1981 = fma(_1941, _1977, _1925);
    float _1983 = fma(_1943, _1977, _1927);
    float _1985 = _1931 * _1973;
    float _1987 = fma(_1931, _1979, _1929);
    out.m_77.x = _1981;
    out.m_77.y = _1983;
    out.m_77.z = _1987;
    out.m_77.w = _1985;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1564 = false;
    bool _572 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2043 = as_type<float>(_110);
        out.gl_Position.z = _2043;
    }
    if (!_100)
    {
        return out;
    }
    float _114 = in.m_49.w;
    float _116 = float(_96);
    float _118 = in.m_51.x;
    float _120 = 1.0 / _116;
    float _122 = -_114;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_114);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = _124 * _120;
    bool _138 = _124 >= _116;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    out.m_53.x = _118;
    out.m_55.x = _136;
    float _144 = _114;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _112 = as_type<int>(_148);
    }
    int _150 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2118 = as_type<float>(_150);
        out.gl_Position.z = _2118;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_57.w;
    float _154 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _290;
    if (!_274)
    {
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _118 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _136;
    }
    _292 = false;
    float _294 = _290;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _314;
    float _326 = 1.0 / _310;
    bool _328 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _330 = isnan(_294);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = 1.0 / _318;
    float _344 = _306 * _324;
    float _346 = -_338;
    float _348 = _346 + 1.0;
    bool _350 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_294);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _322;
    float _364 = _298 * _326;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _368 = _294 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = fma(_372, _364, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _302 * _342;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_380, _364, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _384 = _368 * _362;
    bool _386 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_294);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    bool _398 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _400 = isnan(_294);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _396 * _348;
    float _412 = -_396;
    float _414 = _412 + 1.0;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -_408;
    float _422 = _420 + 1.0;
    float _424 = _360 * _414;
    float _426 = -_360;
    float _428 = _426 + 1.0;
    float _430 = fma(_418, _364, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _432 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_294);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = _408 * _428;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = _442 * _422;
    float _460 = fma(_446, _344, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _462 = fma(_452, _344, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_456, _344, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _466 = _430 * _458;
    float _468 = _374 * _458;
    float _470 = _382 * _458;
    float _472 = -_442;
    float _474 = _472 + 1.0;
    float _476 = in.m_57.x;
    float _478 = in.m_57.y;
    float _480 = in.m_57.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _496 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _498 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _500 = fma(_484, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _502 = fma(_488, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = fma(_492, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = fma(_460, _448, _494);
    float _508 = fma(_462, _448, _496);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_464, _448, _498);
    float _524 = fma(_512, _384, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_516, _384, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = fma(_520, _384, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _530 = fma(_500, _424, _506);
    float _532 = fma(_502, _424, _508);
    float _534 = fma(_504, _424, _522);
    float _536 = fma(_524, _410, _530);
    float _538 = fma(_526, _410, _532);
    float _540 = fma(_528, _410, _534);
    float _542 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].x, _536);
    float _544 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].y, _538);
    float _546 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].z, _540);
    float _548 = _542 * _476;
    float _550 = _544 * _478;
    float _552 = _546 * _480;
    bool _554 = !_340;
    float _570;
    if (!_554)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _558 = _118 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        _570 = _136;
    }
    _572 = false;
    float _574 = _570;
    float _576 = in.m_59.x;
    float _578 = in.m_59.y;
    float _580 = in.m_59.z;
    float _582 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = in.m_61.y;
    float _586 = in.m_51.z;
    float _588 = in.m_51.w;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _578);
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _576);
    float _594 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _580);
    float _598 = _582 * _590;
    float _600 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _604 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _606 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _608 = _594 * _592;
    float _610 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _612 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    float _614 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
    float _616 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _604);
    float _618 = _606 * _596;
    float _620 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[25].x, _610);
    float _622 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _624 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _616);
    float _626 = _136 + 0.20000000298023223876953125;
    float _628 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    float _630 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[25].z, _620);
    float _634 = fma(_584, -0.60000002384185791015625, _626);
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _640 = _628 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _642 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[24].x, _630);
    float _644 = _632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _646 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[26].x, _638);
    float _648 = _636 * _636;
    float _650 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[24].z, _642);
    float _652 = _640 + _644;
    float _654 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[26].z, _646);
    float _656 = _622 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _658 = _650 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[191].y, _652);
    float _662 = _624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = _654 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _666 = _656 + _658;
    float _668 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _670 = _660 + _668;
    float _672 = _662 + _664;
    float _674 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _676 = _666 + _674;
    float _678 = _670 * _670;
    float _680 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _682 = _672 + _680;
    float _684 = fma(_676, _676, _678);
    float _686 = fma(_682, _682, _684);
    float _688 = rsqrt(_686);
    float _690 = _670 * _688;
    float _692 = _676 * _688;
    float _694 = _682 * _688;
    float _696 = _690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _698 = _690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _700 = in.m_51.y;
    float _702 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _696);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _698);
    float _706 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _702);
    float _708 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _704);
    float _710 = abs(_706);
    float _712 = abs(_708);
    float _714 = precise::max(_710, _712);
    bool _716 = _714 >= 16.0;
    float _718 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _720 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _718);
    float _722 = _706;
    float _724 = _708;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _728 = _610;
    float _730 = _648;
    if (_716)
    {
        float _732 = _706 * 0.0625;
        _722 = _732;
    }
    float _734 = _722;
    if (_716)
    {
        float _736 = _708 * 0.0625;
        _724 = _736;
    }
    float _738 = _724;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _742 = _740 != 0;
    float _744 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _720);
    float _746 = abs(_734);
    bool _748 = _746 != 0.0;
    bool _750 = isnan(_746);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = abs(_738);
    bool _760 = _758 == 0.0;
    float _762 = rsqrt(_744);
    float _764 = abs(_738);
    bool _766 = _764 == 0.0;
    bool _768 = !_756;
    bool _770 = _766 && _768;
    bool _772 = false;
    if (_770)
    {
        bool _774 = as_type<int>(_738) >= 0;
        _772 = _774;
    }
    bool _776 = _772;
    int _778 = _776 ? (-1) : 0;
    if (_770)
    {
        int _780 = _776 ? 0 : 1078530011;
        _726 = _780;
    }
    int _782 = _726;
    int _784 = _782;
    if (_770)
    {
        int _786 = int(0x80000000) & as_type<int>(_734);
        int _788 = _782 | _786;
        _784 = _788;
    }
    int _790 = _784;
    bool _792 = !_756;
    bool _794 = _792 && _760;
    int _796 = _790;
    float _798 = as_type<float>(_790);
    if (!_794)
    {
        float _800 = abs(_734);
        bool _802 = _800 != as_type<float>(0x7f800000u /* inf */);
        bool _804 = isnan(_800);
        bool _806 = _802 || _804;
        bool _808 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _810 = _806 || _808;
        float _812 = abs(_738);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        float _816 = abs(_738);
        bool _818 = _816 == as_type<float>(0x7f800000u /* inf */);
        bool _820 = !_810;
        bool _822 = _818 && _820;
        if (_822)
        {
            bool _824 = as_type<int>(_738) >= 0;
            _778 = _824 ? (-1) : 0;
        }
        int _826 = _778;
        if (_822)
        {
            _796 = 1075235812;
        }
        int _828 = _796;
        int _830 = _828;
        if (_822)
        {
            int _832 = ~_826;
            int _834 = (_832 != 0) ? _828 : 1061752795;
            _830 = _834;
        }
        int _836 = _830;
        float _838 = as_type<float>(_836);
        if (_822)
        {
            int _840 = int(0x80000000) & as_type<int>(_734);
            int _842 = _836 | _840;
            _838 = as_type<float>(_842);
        }
        float _844 = _838;
        bool _846 = !_810;
        bool _848 = _846 && _814;
        _798 = _844;
        if (!_848)
        {
            float _850 = abs(_734);
            float _852 = abs(_738);
            float _854 = precise::max(_850, _852);
            float _856 = abs(_734);
            float _858 = abs(_738);
            float _860 = precise::min(_856, _858);
            float _862 = 1.0 / _854;
            float _864 = abs(_734);
            float _866 = abs(_738);
            bool _868 = _864 > _866;
            bool _870 = as_type<int>(_738) >= 0;
            float _872 = _860 * _862;
            float _874 = _872 * _872;
            float _876 = _874 + 11.33538818359375;
            float _878 = fma(_874, _876, 28.84246826171875);
            float _880 = fma(_874, _878, 19.6966705322265625);
            float _882 = fma(_874, -0.82336294651031494140625, -5.674867153167724609375);
            float _884 = fma(_874, _882, -6.565555095672607421875);
            float _886 = 1.0 / _880;
            float _888 = _874 * _884;
            float _890 = abs(_734);
            float _892 = abs(_738);
            float _894 = _890 + _892;
            int _896 = as_type<int>(_734) & int(0x80000000);
            float _898 = _872 * _888;
            bool _900 = _894 > as_type<float>(0x7f800000u /* inf */);
            bool _902 = isnan(_894);
            bool _904 = _900 || _902;
            bool _906 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _908 = _904 || _906;
            float _910 = fma(_898, _886, _872);
            float _912 = _910;
            _728 = _886;
            _798 = _894;
            if (_868)
            {
                float _914 = -_910;
                float _916 = _914 + 1.57079637050628662109375;
                _912 = _916;
            }
            float _918 = _912;
            int _920 = as_type<int>(_918);
            if (!_870)
            {
                float _922 = -_918;
                float _924 = _922 + 3.1415927410125732421875;
                _920 = as_type<int>(_924);
            }
            int _926 = _920;
            if (!_908)
            {
                int _928 = _896 | _926;
                _798 = as_type<float>(_928);
            }
        }
    }
    float _930 = _728;
    float _932 = _798;
    float _934 = -_584;
    float _936 = _934 + 1.0;
    bool _938 = _700 > 0.5;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _950 = _948 != 0;
    float _952 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _954 = _938 ? as_type<int>(_936) : as_type<int>(_584);
    float _956 = 1.0 / _942;
    float _958 = _930;
    float _960 = _936;
    if (_742)
    {
        float _962 = in.m_51.z;
        _958 = _962;
    }
    float _964 = _958;
    float _966 = _950 ? as_type<float>(_954) : _584;
    float _968 = _952 * _952;
    bool _970 = _586 > 0.5;
    float _972 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _976 = _974 != 0;
    float _978 = 1.0 / _946;
    float _980 = _970 ? _936 : _584;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = in.m_61.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _998 = _996 != 0;
    float _1000 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1002 = _976 ? _980 : _584;
    float _1004 = _984 * _956;
    float _1006 = fma(_1000, _1000, _968);
    bool _1008 = _588 > 0.5;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1016;
    int _1020 = _1008 ? as_type<int>(_936) : as_type<int>(_584);
    float _1022 = fma(_972, _972, _1006);
    float _1024 = _932 * (-0.15915493667125701904296875);
    float _1026 = _1018 * _978;
    float _1028 = _998 ? as_type<float>(_1020) : _584;
    float _1030 = rsqrt(_1022);
    bool _1032 = _1008;
    float _1034 = _980;
    bool _1036 = _998;
    if (_742)
    {
        bool _1038 = _964 > 0.5;
        _1032 = _1038;
    }
    bool _1040 = _1032;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1014)
    {
        _960 = _118;
    }
    float _1044 = _960;
    float _1046 = _1024 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1044;
    if (!_1014)
    {
        _1050 = _586;
    }
    float _1052 = _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _574 + _1054;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1062 = _574 + _1060;
    if (_1014)
    {
        _1034 = _700;
    }
    float _1064 = _1034;
    float _1066 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1042);
    float _1068 = _1024 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_118, -0.20000000298023223876953125, 1.0);
    float _1074 = _1064;
    if (_988)
    {
        bool _1076 = _118 > 0.5;
        _1036 = _1076;
    }
    bool _1078 = _1036;
    float _1080 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1058);
    if (!_1014)
    {
        _1074 = _118;
    }
    float _1082 = _1074;
    float _1084 = -_636;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1026, _1056, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1090 = _1000 * _1030;
    float _1092 = _972 * _1030;
    float _1094 = -_1048;
    float _1096 = _1094 + 1.0;
    float _1098 = fma(_1004, _1062, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1100 = _952 * _1030;
    float _1102 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1104 = -_1086;
    float _1106 = fma(_1104, _1086, 1.0);
    float _1108 = _1090 * _1096;
    float _1110 = _1100 * _1096;
    float _1112 = _1092 * _1070;
    float _1114 = _1090 * _1070;
    float _1116 = _1106 * _1102;
    float _1118 = _1100 * _1070;
    float _1120 = -_1112;
    float _1122 = fma(_1100, _1108, _1120);
    float _1124 = fma(_1092, _1110, _1114);
    float _1126 = fma(_1090, _1108, _1048);
    float _1128 = -_1118;
    float _1130 = fma(_1092, _1108, _1128);
    float _1132 = _644 * _1122;
    float _1134 = _1092 * _1092;
    float _1136 = _644 * _1124;
    float _1138 = fma(_1092, _1108, _1118);
    float _1140 = fma(_658, _1126, _1132);
    float _1142 = fma(_1096, _1134, _1048);
    float _1144 = fma(_658, _1130, _1136);
    float _1146 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1148 = _662 + _1146;
    float _1150 = fma(_664, _1138, _1140);
    float _1152 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1154 = _656 + _1152;
    float _1156 = fma(_664, _1142, _1144);
    float _1158 = _1134;
    float _1160 = _1142;
    float _1162 = _1116;
    if (!_988)
    {
        _1158 = _990;
    }
    float _1164 = _1158;
    float _1166 = _656 + _1150;
    float _1168 = fma(_1100, _1108, _1112);
    float _1170 = _662 + _1156;
    float _1172 = _1164;
    if (!_988)
    {
        _1160 = _1164;
    }
    float _1174 = _1160;
    float _1176 = fma(_1154, _1116, _1166);
    float _1178 = fma(_1100, _1110, _1048);
    float _1180 = fma(_1148, _1116, _1170);
    float _1182 = _1174;
    if (_988)
    {
        _1172 = _990;
    }
    float _1184 = _1172;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1188 = _1176 + _1186;
    float _1190 = _644 * _1178;
    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1194 = _1180 + _1192;
    float _1196 = -_1114;
    float _1198 = fma(_1092, _1110, _1196);
    float _1200 = _1188 * _1188;
    float _1202 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_658, _1168, _1190);
    bool _1208 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1210 = isnan(_574);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1002, _1202, -0.5);
    float _1222 = _1200 + _1204;
    float _1224 = fma(_664, _1198, _1206);
    bool _1226 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1228 = isnan(_574);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1218;
    float _1240 = _1238 + 1.0;
    float _1242 = sqrt(_1222);
    int _1244 = 0;
    float _1246 = _1184;
    float _1248 = _1200;
    float _1250 = _1204;
    if (_988)
    {
        float _1252 = -_1184;
        float _1254 = _1252 + 1.0;
        _1244 = as_type<int>(_1254);
    }
    int _1256 = _1244;
    bool _1258 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1260 = isnan(_574);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1236 * _1240;
    float _1272 = -_1236;
    float _1274 = _1272 + 1.0;
    float _1276 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1278 = as_type<int>(_1276);
    if (_988)
    {
        float _1280 = _1078 ? as_type<float>(_1256) : _1184;
        _1182 = _1280;
    }
    float _1282 = _1182;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1286 = _1268 * _1274;
    float _1288 = _640 + _1224;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1292 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1296 = _1088 * _1286;
    bool _1298 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1300 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1288);
    float _1302 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1304 = _640 + _1302;
    float _1306 = -_1284;
    float _1308 = fma(_1292, 2.0, _1306);
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1312 = fma(_1276, -2.0, _1294);
    int _1314 = as_type<int>(_1288);
    float _1316 = _1300;
    if (_742)
    {
        float _1318 = -_1184;
        float _1320 = _1318 + 1.0;
        _1278 = as_type<int>(_1320);
    }
    int _1322 = _1278;
    if (_994)
    {
        float _1324 = -_1184;
        float _1326 = _1324 + 1.0;
        _1314 = as_type<int>(_1326);
    }
    int _1328 = _1314;
    float _1330 = -_1268;
    float _1332 = _1330 + 1.0;
    float _1334 = fma(_1304, _1116, _1300);
    float _1336 = _1332;
    if (!_742)
    {
        _730 = _1184;
    }
    float _1338 = _730;
    float _1340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1342 = _1338;
    if (_742)
    {
        float _1344 = _1040 ? as_type<float>(_1322) : _1184;
        _1342 = _1344;
    }
    float _1346 = _1342;
    float _1348 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1296);
    if (!_1298)
    {
        _1162 = _1200;
    }
    float _1350 = _1162;
    float _1352 = _1350;
    if (_994)
    {
        float _1354 = _938 ? as_type<float>(_1328) : _1184;
        _1246 = _1354;
    }
    float _1356 = _1246;
    if (!_1298)
    {
        _1248 = _1176;
    }
    float _1358 = _1248;
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1362 = _1358;
    if (!_1298)
    {
        _1336 = _1180;
    }
    float _1364 = _1336;
    float _1366 = _1364;
    if (!_1298)
    {
        _1316 = _1334;
    }
    float _1368 = _1316;
    bool _1370 = !_1298;
    float _1372 = _1368;
    if (!_1370)
    {
        float _1374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1378 = _1242 + _1376;
        float _1380 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = rsqrt(_1222);
        float _1384 = _1378 * _1374;
        float _1386 = _1384 * 0.15915493667125701904296875;
        float _1388 = _1386 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1382 * _1396;
        float _1400 = fma(_1188, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = _1394 + (-1.0);
        float _1404 = fma(_1194, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1408 = _1400 + _1406;
        float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1414 = _1404 + _1412;
        float _1416 = _1408 * _1408;
        float _1418 = fma(_1334, _1394, _1410);
        float _1420 = _1414 * _1414;
        _1372 = _1418;
        _1352 = _1416;
        _1250 = _1420;
        _1362 = _1400;
        _1366 = _1404;
    }
    float _1422 = _1372;
    float _1424 = _1352;
    float _1426 = _1250;
    float _1428 = _1362;
    float _1430 = _1366;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1434 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1066);
    float _1436 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1080);
    float _1438 = -_124;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1308);
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1444 = _1422 + _1442;
    float _1446 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1312);
    float _1448 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1450 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1452 = fma(_1444, _1444, _1424);
    float _1454 = -_1446;
    float _1456 = fma(_1436, _1220, _1454);
    float _1458 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1460 = fma(_1448, _1356, -0.5);
    float _1462 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1464 = _1452 + _1426;
    float _1466 = _1450 * _1340;
    float _1468 = fma(_1098, _1270, _1348);
    float _1470 = fma(_1434, _1460, _1440);
    float _1472 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1474 = _1458 * _1432;
    float _1476 = _1462 * _1360;
    float _1478 = sqrt(_1464);
    float _1480 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1468);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1490 = _1472 * _1310;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1456 + 0.5;
    float _1510 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1512 = _1470 + 0.5;
    out.m_63.x = _1490;
    out.m_63.y = _1466;
    out.m_63.z = _1476;
    out.m_63.w = _1474;
    bool _1514 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1516 = isnan(_1478);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1522 = _1518 || _1520;
    out.m_65.x = _1502;
    out.m_65.y = _1504;
    out.m_65.z = _1506;
    out.m_67.x = _1494;
    out.m_67.y = _1498;
    out.m_67.z = _1500;
    out.m_67.w = _1510;
    out.m_69.x = _1512;
    out.m_69.y = _1508;
    float _1524 = _1488;
    float _1526 = _1498;
    float _1528 = _1422;
    if (!_1522)
    {
        _1524 = 1.0;
    }
    float _1530 = _1524;
    bool _1532 = !_1522;
    float _1534 = _1530;
    if (!_1532)
    {
        bool _1536 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1538 = isnan(_1478);
        bool _1540 = _1536 || _1538;
        bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1544 = _1540 || _1542;
        if (!_1544)
        {
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = _1478 + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1558 = 1.0 / _1552;
            float _1560 = _1548 * _1558;
            float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1534 = _1562;
            _1564 = true;
        }
        else
        {
            bool _1566 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1568 = isnan(_1478);
            bool _1570 = _1566 || _1568;
            bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1574 = _1570 || _1572;
            if (!_1574)
            {
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1478 + _1576;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1588 = 1.0 / _1582;
                float _1590 = _1578 * _1588;
                float _1592 = fma(_1590, _1586, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1534 = _1592;
                _1564 = true;
            }
            else
            {
                _1534 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1564 = false;
    float _1594 = _1534;
    float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1598 = _1422 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1602 = _1428 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1606 = _1430 + _1604;
    float _1608 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1610 = fma(_1602, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1612 = fma(_1606, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = _1608 + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1624 = _1612 + _1622;
    float _1626 = _1616 * _1616;
    float _1628 = fma(_1620, _1620, _1626);
    float _1630 = fma(_1624, _1624, _1628);
    float _1632 = rsqrt(_1630);
    float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1636 = _1620 * _1634;
    float _1638 = _1624 * _1634;
    float _1640 = _1636 * _1636;
    float _1642 = _1638 * _1638;
    float _1644 = _1640 + _1642;
    float _1646 = sqrt(_1644);
    bool _1648 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1646 + _1650;
    float _1654 = _1624;
    float _1656 = _1626;
    float _1658 = _1652;
    float _1660 = _1616;
    float _1662 = _1636;
    if (_1648)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1664;
    }
    float _1666 = _1654;
    if (_1648)
    {
        float _1668 = rsqrt(_1644);
        _1656 = _1668;
    }
    float _1670 = _1656;
    float _1672 = _1670;
    if (_1648)
    {
        float _1674 = _1652 * _1666;
        _1658 = _1674;
    }
    float _1676 = _1658;
    if (_1648)
    {
        float _1678 = _1676 * 0.15915493667125701904296875;
        _1526 = _1678;
    }
    float _1680 = _1526;
    float _1682 = _1632;
    if (_1648)
    {
        float _1684 = _1680 * 6.283185482025146484375;
        float _1686 = sin(_1684);
        _1682 = _1686;
    }
    float _1688 = _1682;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1692 = precise::max(0.0, _1690);
    float _1694 = _1474;
    float _1696 = _1692;
    float _1698 = _1690;
    if (_1648)
    {
        float _1700 = _1680 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        _1694 = _1702;
    }
    float _1704 = _1694;
    float _1706 = -_1634;
    float _1708 = -_1692;
    float _1710 = fma(_1616, _1706, _1708);
    if (!_1648)
    {
        _1660 = _1638;
    }
    float _1712 = _1660;
    float _1714 = _1712;
    if (_1648)
    {
        float _1716 = _1710 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1696 = _1716;
    }
    float _1718 = _1696;
    float _1720 = sqrt(_1630);
    float _1722 = _1688;
    float _1724 = _1718;
    if (_1648)
    {
        float _1726 = fma(_1688, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1722 = _1726;
    }
    float _1728 = _1722;
    float _1730 = _1728;
    if (!_1648)
    {
        _1724 = _1640;
    }
    float _1732 = _1724;
    float _1734 = _1732;
    if (_1648)
    {
        float _1736 = _1704 + (-1.0);
        _1698 = _1736;
    }
    float _1738 = _1698;
    float _1740 = _1738;
    if (_1648)
    {
        float _1742 = _1670 * _1728;
        _1528 = _1742;
    }
    float _1744 = _1528;
    if (!_1648)
    {
        _1730 = _1710;
    }
    float _1746 = _1730;
    float _1748 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = _1746;
    if (_1648)
    {
        float _1752 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1752;
    }
    float _1754 = _1672;
    if (_1648)
    {
        float _1756 = _1636 * _1744;
        _1662 = _1756;
    }
    float _1758 = _1662;
    if (_1648)
    {
        float _1760 = _1638 * _1744;
        _1714 = _1760;
    }
    float _1762 = _1714;
    if (!_1648)
    {
        _1740 = _1642;
    }
    float _1764 = _1740;
    float _1766 = _1764;
    if (_1648)
    {
        float _1768 = fma(_1710, _1704, _1754);
        _1750 = _1768;
    }
    float _1770 = _1750;
    if (_1648)
    {
        float _1772 = _1758 * _1758;
        _1734 = _1772;
    }
    float _1774 = _1734;
    if (_1648)
    {
        float _1776 = _1762 * _1762;
        _1766 = _1776;
    }
    float _1778 = _1766;
    float _1780 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1782 = fma(_1770, _1770, _1774);
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1786 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1784);
    float _1788 = precise::clamp(_1786, 0.0, 1.0);
    float _1790 = _1782 + _1778;
    float _1792 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1796 = -_1788;
    float _1798 = _1796 + 1.0;
    float _1800 = rsqrt(_1790);
    float _1802 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1804 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1802);
    float _1808 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1810 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1812 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1814 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1808);
    float _1816 = abs(_1798);
    float _1818 = log2(_1816);
    float _1820 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    float _1822 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1824 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1814);
    float _1826 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1828 = _1800 * _1758;
    float _1830 = -_1822;
    float _1832 = fma(_1830, _1794, 1.0);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1836 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1838 = _1800 * _1770;
    float _1840 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1842 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1780);
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1836);
    float _1846 = _1800 * _1762;
    float _1848 = -_1840;
    float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1848);
    float _1852 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1854 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1858 = -_1846;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1850);
    float _1862 = exp2(_1852);
    float _1864 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1856);
    float _1868 = fma(_1860, -0.5, 0.5);
    float _1870 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1864);
    float _1874 = fma(_1860, 0.5, 0.5);
    float _1876 = _1838 + 1.0;
    float _1878 = log2(_1832);
    float _1880 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1882 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1872);
    float _1884 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1886 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1880);
    float _1888 = fma(_1874, _1884, -0.212114393711090087890625);
    float _1890 = 1.0 / _1866;
    float _1892 = -_1838;
    float _1894 = fma(_1862, _1876, _1892);
    float _1896 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1882);
    float _1898 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1886);
    float _1900 = fma(_1874, _1888, 1.570728778839111328125);
    float _1902 = fma(_1894, 0.5, 0.5);
    float _1904 = sqrt(_1868);
    float _1906 = _1878 * 0.693147182464599609375;
    float _1908 = _1896 * _1890;
    float _1910 = _1898 * _1890;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1914 = fma(_1908, 0.5, 0.5);
    float _1916 = fma(_1910, -0.5, 0.5);
    float _1918 = _1904 * 0.636619746685028076171875;
    float3 _5051 = float3(_1914, _1916, _1912);
    float _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5051, float3(0.0), isnan(_5051)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5051, float3(0.0), isnan(_5051)), level(0.0)).x;
    float3 _5062 = float3(_1914, _1916, _1912);
    float4 _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5062, float3(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5062, float3(0.0), isnan(_5062)), level(0.0)).xyzw;
    float _1925 = _1923.x;
    float _1927 = _1923.y;
    float _1929 = _1923.z;
    float _1931 = _1923.w;
    float _1933 = -_1900;
    float _1935 = fma(_1918, _1933, 1.0);
    float2 _5084 = float2(_1935, _1902);
    float3 _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5084, float2(0.0), isnan(_5084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5084, float2(0.0), isnan(_5084)), level(0.0)).xyz;
    float _1941 = _1939.x;
    float _1943 = _1939.y;
    float _1945 = _1939.z;
    float _1947 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1949 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _656;
    out.m_71.y = _640;
    out.m_71.z = _662;
    float _1951 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1949);
    float _1953 = exp2(_1947);
    out.m_73.x = _1610;
    out.m_73.y = _1608;
    out.m_73.z = _1612;
    float _1955 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    float _1957 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1955);
    float _1959 = _1957 + _1866;
    out.gl_Position.x = _1896;
    out.gl_Position.y = _1898;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1866;
    float _1961 = _1959 * 0.5;
    float _1963 = -_1953;
    float _1965 = _1963 + 1.0;
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1961;
    out.m_75.w = _1866;
    float _1969 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = -_1967;
    float _1973 = _1971 + 1.0;
    out.m_47.x = _1969;
    float _1975 = _1967 * _1920;
    float _1977 = _1931 * _1975;
    float _1979 = _1945 * _1975;
    float _1981 = fma(_1941, _1977, _1925);
    float _1983 = fma(_1943, _1977, _1927);
    float _1985 = _1931 * _1973;
    float _1987 = fma(_1931, _1979, _1929);
    out.m_77.x = _1981;
    out.m_77.y = _1983;
    out.m_77.z = _1987;
    out.m_77.w = _1985;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1564 = false;
    bool _572 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2043 = as_type<float>(_110);
        out.gl_Position.z = _2043;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_49.w;
    float _116 = float(_96);
    float _118 = in.m_51.x;
    float _120 = 1.0 / _116;
    float _122 = -_114;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_114);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = _124 * _120;
    bool _138 = _124 >= _116;
    bool _140 = !_134;
    bool _142 = _138 || _140;
    out.m_53.x = _118;
    out.m_55.x = _136;
    float _144 = _114;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _112 = as_type<int>(_148);
    }
    int _150 = _112;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2118 = as_type<float>(_150);
        out.gl_Position.z = _2118;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_57.w;
    float _154 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _160 = _156 || _158;
    bool _162 = isnan(1.0);
    bool _164 = _160 || _162;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    float _172 = in.m_44.x;
    float _174 = in.m_44.y;
    float _176 = in.m_44.z;
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
    float _256 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _258 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _262 = fma(_252, _166, _256);
    float _264 = fma(_252, _168, _258);
    float _266 = fma(_252, _170, _260);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    float _272 = fma(_266, _152, _176);
    bool _274 = !_254;
    float _290;
    if (!_274)
    {
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _278 = _118 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        _290 = _136;
    }
    _292 = false;
    float _294 = _290;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _314;
    float _326 = 1.0 / _310;
    bool _328 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _330 = isnan(_294);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = 1.0 / _318;
    float _344 = _306 * _324;
    float _346 = -_338;
    float _348 = _346 + 1.0;
    bool _350 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _352 = isnan(_294);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _322;
    float _364 = _298 * _326;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _368 = _294 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _370;
    float _374 = fma(_372, _364, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _376 = _302 * _342;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = fma(_380, _364, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _384 = _368 * _362;
    bool _386 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _388 = isnan(_294);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    bool _398 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _400 = isnan(_294);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = _396 * _348;
    float _412 = -_396;
    float _414 = _412 + 1.0;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _416;
    float _420 = -_408;
    float _422 = _420 + 1.0;
    float _424 = _360 * _414;
    float _426 = -_360;
    float _428 = _426 + 1.0;
    float _430 = fma(_418, _364, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _432 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_294);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _448 = _408 * _428;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = _442 * _422;
    float _460 = fma(_446, _344, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _462 = fma(_452, _344, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _464 = fma(_456, _344, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _466 = _430 * _458;
    float _468 = _374 * _458;
    float _470 = _382 * _458;
    float _472 = -_442;
    float _474 = _472 + 1.0;
    float _476 = in.m_57.x;
    float _478 = in.m_57.y;
    float _480 = in.m_57.z;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _490;
    float _494 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _496 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _498 = fma(_474, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _500 = fma(_484, _376, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _502 = fma(_488, _376, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = fma(_492, _376, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = fma(_460, _448, _494);
    float _508 = fma(_462, _448, _496);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_464, _448, _498);
    float _524 = fma(_512, _384, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_516, _384, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = fma(_520, _384, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _530 = fma(_500, _424, _506);
    float _532 = fma(_502, _424, _508);
    float _534 = fma(_504, _424, _522);
    float _536 = fma(_524, _410, _530);
    float _538 = fma(_526, _410, _532);
    float _540 = fma(_528, _410, _534);
    float _542 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].x, _536);
    float _544 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].y, _538);
    float _546 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[147].z, _540);
    float _548 = _542 * _476;
    float _550 = _544 * _478;
    float _552 = _546 * _480;
    bool _554 = !_340;
    float _570;
    if (!_554)
    {
        float _556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _558 = _118 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _562 = _560 * _556;
        float _564 = floor(_562);
        float _566 = -_564;
        float _568 = _562 + _566;
        _570 = _568;
        _572 = true;
    }
    else
    {
        _570 = _136;
    }
    _572 = false;
    float _574 = _570;
    float _576 = in.m_59.x;
    float _578 = in.m_59.y;
    float _580 = in.m_59.z;
    float _582 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _584 = in.m_61.y;
    float _586 = in.m_51.z;
    float _588 = in.m_51.w;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _578);
    float _592 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _576);
    float _594 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _580);
    float _598 = _582 * _590;
    float _600 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _602 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _604 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _606 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _608 = _594 * _592;
    float _610 = _598 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _612 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _600);
    float _614 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _602);
    float _616 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _604);
    float _618 = _606 * _596;
    float _620 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[25].x, _610);
    float _622 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    float _624 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _616);
    float _626 = _136 + 0.20000000298023223876953125;
    float _628 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _614);
    float _630 = _598 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[25].z, _620);
    float _634 = fma(_584, -0.60000002384185791015625, _626);
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _598 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _640 = _628 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _642 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[24].x, _630);
    float _644 = _632 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _646 = fma(_608, (*spvDescriptorSet0.vp_c8)._m0[26].x, _638);
    float _648 = _636 * _636;
    float _650 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[24].z, _642);
    float _652 = _640 + _644;
    float _654 = fma(_618, (*spvDescriptorSet0.vp_c8)._m0[26].z, _646);
    float _656 = _622 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _658 = _650 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _660 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[191].y, _652);
    float _662 = _624 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _664 = _654 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _666 = _656 + _658;
    float _668 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _670 = _660 + _668;
    float _672 = _662 + _664;
    float _674 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _676 = _666 + _674;
    float _678 = _670 * _670;
    float _680 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _682 = _672 + _680;
    float _684 = fma(_676, _676, _678);
    float _686 = fma(_682, _682, _684);
    float _688 = rsqrt(_686);
    float _690 = _670 * _688;
    float _692 = _676 * _688;
    float _694 = _682 * _688;
    float _696 = _690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _698 = _690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _700 = in.m_51.y;
    float _702 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _696);
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _698);
    float _706 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _702);
    float _708 = fma(_694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _704);
    float _710 = abs(_706);
    float _712 = abs(_708);
    float _714 = precise::max(_710, _712);
    bool _716 = _714 >= 16.0;
    float _718 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _720 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _718);
    float _722 = _706;
    float _724 = _708;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _728 = _610;
    float _730 = _648;
    if (_716)
    {
        float _732 = _706 * 0.0625;
        _722 = _732;
    }
    float _734 = _722;
    if (_716)
    {
        float _736 = _708 * 0.0625;
        _724 = _736;
    }
    float _738 = _724;
    int _740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _742 = _740 != 0;
    float _744 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _720);
    float _746 = abs(_734);
    bool _748 = _746 != 0.0;
    bool _750 = isnan(_746);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = abs(_738);
    bool _760 = _758 == 0.0;
    float _762 = rsqrt(_744);
    float _764 = abs(_738);
    bool _766 = _764 == 0.0;
    bool _768 = !_756;
    bool _770 = _766 && _768;
    bool _772 = false;
    if (_770)
    {
        bool _774 = as_type<int>(_738) >= 0;
        _772 = _774;
    }
    bool _776 = _772;
    int _778 = _776 ? (-1) : 0;
    if (_770)
    {
        int _780 = _776 ? 0 : 1078530011;
        _726 = _780;
    }
    int _782 = _726;
    int _784 = _782;
    if (_770)
    {
        int _786 = int(0x80000000) & as_type<int>(_734);
        int _788 = _782 | _786;
        _784 = _788;
    }
    int _790 = _784;
    bool _792 = !_756;
    bool _794 = _792 && _760;
    int _796 = _790;
    float _798 = as_type<float>(_790);
    if (!_794)
    {
        float _800 = abs(_734);
        bool _802 = _800 != as_type<float>(0x7f800000u /* inf */);
        bool _804 = isnan(_800);
        bool _806 = _802 || _804;
        bool _808 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _810 = _806 || _808;
        float _812 = abs(_738);
        bool _814 = _812 == as_type<float>(0x7f800000u /* inf */);
        float _816 = abs(_738);
        bool _818 = _816 == as_type<float>(0x7f800000u /* inf */);
        bool _820 = !_810;
        bool _822 = _818 && _820;
        if (_822)
        {
            bool _824 = as_type<int>(_738) >= 0;
            _778 = _824 ? (-1) : 0;
        }
        int _826 = _778;
        if (_822)
        {
            _796 = 1075235812;
        }
        int _828 = _796;
        int _830 = _828;
        if (_822)
        {
            int _832 = ~_826;
            int _834 = (_832 != 0) ? _828 : 1061752795;
            _830 = _834;
        }
        int _836 = _830;
        float _838 = as_type<float>(_836);
        if (_822)
        {
            int _840 = int(0x80000000) & as_type<int>(_734);
            int _842 = _836 | _840;
            _838 = as_type<float>(_842);
        }
        float _844 = _838;
        bool _846 = !_810;
        bool _848 = _846 && _814;
        _798 = _844;
        if (!_848)
        {
            float _850 = abs(_734);
            float _852 = abs(_738);
            float _854 = precise::max(_850, _852);
            float _856 = abs(_734);
            float _858 = abs(_738);
            float _860 = precise::min(_856, _858);
            float _862 = 1.0 / _854;
            float _864 = abs(_734);
            float _866 = abs(_738);
            bool _868 = _864 > _866;
            bool _870 = as_type<int>(_738) >= 0;
            float _872 = _860 * _862;
            float _874 = _872 * _872;
            float _876 = _874 + 11.33538818359375;
            float _878 = fma(_874, _876, 28.84246826171875);
            float _880 = fma(_874, _878, 19.6966705322265625);
            float _882 = fma(_874, -0.82336294651031494140625, -5.674867153167724609375);
            float _884 = fma(_874, _882, -6.565555095672607421875);
            float _886 = 1.0 / _880;
            float _888 = _874 * _884;
            float _890 = abs(_734);
            float _892 = abs(_738);
            float _894 = _890 + _892;
            int _896 = as_type<int>(_734) & int(0x80000000);
            float _898 = _872 * _888;
            bool _900 = _894 > as_type<float>(0x7f800000u /* inf */);
            bool _902 = isnan(_894);
            bool _904 = _900 || _902;
            bool _906 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _908 = _904 || _906;
            float _910 = fma(_898, _886, _872);
            float _912 = _910;
            _728 = _886;
            _798 = _894;
            if (_868)
            {
                float _914 = -_910;
                float _916 = _914 + 1.57079637050628662109375;
                _912 = _916;
            }
            float _918 = _912;
            int _920 = as_type<int>(_918);
            if (!_870)
            {
                float _922 = -_918;
                float _924 = _922 + 3.1415927410125732421875;
                _920 = as_type<int>(_924);
            }
            int _926 = _920;
            if (!_908)
            {
                int _928 = _896 | _926;
                _798 = as_type<float>(_928);
            }
        }
    }
    float _930 = _728;
    float _932 = _798;
    float _934 = -_584;
    float _936 = _934 + 1.0;
    bool _938 = _700 > 0.5;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _950 = _948 != 0;
    float _952 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _954 = _938 ? as_type<int>(_936) : as_type<int>(_584);
    float _956 = 1.0 / _942;
    float _958 = _930;
    float _960 = _936;
    if (_742)
    {
        float _962 = in.m_51.z;
        _958 = _962;
    }
    float _964 = _958;
    float _966 = _950 ? as_type<float>(_954) : _584;
    float _968 = _952 * _952;
    bool _970 = _586 > 0.5;
    float _972 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _976 = _974 != 0;
    float _978 = 1.0 / _946;
    float _980 = _970 ? _936 : _584;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = in.m_61.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _998 = _996 != 0;
    float _1000 = _762 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1002 = _976 ? _980 : _584;
    float _1004 = _984 * _956;
    float _1006 = fma(_1000, _1000, _968);
    bool _1008 = _588 > 0.5;
    float _1010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1018 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1016;
    int _1020 = _1008 ? as_type<int>(_936) : as_type<int>(_584);
    float _1022 = fma(_972, _972, _1006);
    float _1024 = _932 * (-0.15915493667125701904296875);
    float _1026 = _1018 * _978;
    float _1028 = _998 ? as_type<float>(_1020) : _584;
    float _1030 = rsqrt(_1022);
    bool _1032 = _1008;
    float _1034 = _980;
    bool _1036 = _998;
    if (_742)
    {
        bool _1038 = _964 > 0.5;
        _1032 = _1038;
    }
    bool _1040 = _1032;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1014)
    {
        _960 = _118;
    }
    float _1044 = _960;
    float _1046 = _1024 * 6.283185482025146484375;
    float _1048 = cos(_1046);
    float _1050 = _1044;
    if (!_1014)
    {
        _1050 = _586;
    }
    float _1052 = _1050;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1056 = _574 + _1054;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1062 = _574 + _1060;
    if (_1014)
    {
        _1034 = _700;
    }
    float _1064 = _1034;
    float _1066 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1042);
    float _1068 = _1024 * 6.283185482025146484375;
    float _1070 = sin(_1068);
    float _1072 = fma(_118, -0.20000000298023223876953125, 1.0);
    float _1074 = _1064;
    if (_988)
    {
        bool _1076 = _118 > 0.5;
        _1036 = _1076;
    }
    bool _1078 = _1036;
    float _1080 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1058);
    if (!_1014)
    {
        _1074 = _118;
    }
    float _1082 = _1074;
    float _1084 = -_636;
    float _1086 = _1084 + 1.0;
    float _1088 = fma(_1026, _1056, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1090 = _1000 * _1030;
    float _1092 = _972 * _1030;
    float _1094 = -_1048;
    float _1096 = _1094 + 1.0;
    float _1098 = fma(_1004, _1062, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1100 = _952 * _1030;
    float _1102 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1104 = -_1086;
    float _1106 = fma(_1104, _1086, 1.0);
    float _1108 = _1090 * _1096;
    float _1110 = _1100 * _1096;
    float _1112 = _1092 * _1070;
    float _1114 = _1090 * _1070;
    float _1116 = _1106 * _1102;
    float _1118 = _1100 * _1070;
    float _1120 = -_1112;
    float _1122 = fma(_1100, _1108, _1120);
    float _1124 = fma(_1092, _1110, _1114);
    float _1126 = fma(_1090, _1108, _1048);
    float _1128 = -_1118;
    float _1130 = fma(_1092, _1108, _1128);
    float _1132 = _644 * _1122;
    float _1134 = _1092 * _1092;
    float _1136 = _644 * _1124;
    float _1138 = fma(_1092, _1108, _1118);
    float _1140 = fma(_658, _1126, _1132);
    float _1142 = fma(_1096, _1134, _1048);
    float _1144 = fma(_658, _1130, _1136);
    float _1146 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1148 = _662 + _1146;
    float _1150 = fma(_664, _1138, _1140);
    float _1152 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1154 = _656 + _1152;
    float _1156 = fma(_664, _1142, _1144);
    float _1158 = _1134;
    float _1160 = _1142;
    float _1162 = _1116;
    if (!_988)
    {
        _1158 = _990;
    }
    float _1164 = _1158;
    float _1166 = _656 + _1150;
    float _1168 = fma(_1100, _1108, _1112);
    float _1170 = _662 + _1156;
    float _1172 = _1164;
    if (!_988)
    {
        _1160 = _1164;
    }
    float _1174 = _1160;
    float _1176 = fma(_1154, _1116, _1166);
    float _1178 = fma(_1100, _1110, _1048);
    float _1180 = fma(_1148, _1116, _1170);
    float _1182 = _1174;
    if (_988)
    {
        _1172 = _990;
    }
    float _1184 = _1172;
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1188 = _1176 + _1186;
    float _1190 = _644 * _1178;
    float _1192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1194 = _1180 + _1192;
    float _1196 = -_1114;
    float _1198 = fma(_1092, _1110, _1196);
    float _1200 = _1188 * _1188;
    float _1202 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1204 = _1194 * _1194;
    float _1206 = fma(_658, _1168, _1190);
    bool _1208 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1210 = isnan(_574);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1216 = _1212 || _1214;
    float _1218 = float(_1216);
    float _1220 = fma(_1002, _1202, -0.5);
    float _1222 = _1200 + _1204;
    float _1224 = fma(_664, _1198, _1206);
    bool _1226 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1228 = isnan(_574);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = -_1218;
    float _1240 = _1238 + 1.0;
    float _1242 = sqrt(_1222);
    int _1244 = 0;
    float _1246 = _1184;
    float _1248 = _1200;
    float _1250 = _1204;
    if (_988)
    {
        float _1252 = -_1184;
        float _1254 = _1252 + 1.0;
        _1244 = as_type<int>(_1254);
    }
    int _1256 = _1244;
    bool _1258 = _574 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1260 = isnan(_574);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1236 * _1240;
    float _1272 = -_1236;
    float _1274 = _1272 + 1.0;
    float _1276 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1278 = as_type<int>(_1276);
    if (_988)
    {
        float _1280 = _1078 ? as_type<float>(_1256) : _1184;
        _1182 = _1280;
    }
    float _1282 = _1182;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1286 = _1268 * _1274;
    float _1288 = _640 + _1224;
    float _1290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1292 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1296 = _1088 * _1286;
    bool _1298 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1300 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1288);
    float _1302 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1304 = _640 + _1302;
    float _1306 = -_1284;
    float _1308 = fma(_1292, 2.0, _1306);
    float _1310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1312 = fma(_1276, -2.0, _1294);
    int _1314 = as_type<int>(_1288);
    float _1316 = _1300;
    if (_742)
    {
        float _1318 = -_1184;
        float _1320 = _1318 + 1.0;
        _1278 = as_type<int>(_1320);
    }
    int _1322 = _1278;
    if (_994)
    {
        float _1324 = -_1184;
        float _1326 = _1324 + 1.0;
        _1314 = as_type<int>(_1326);
    }
    int _1328 = _1314;
    float _1330 = -_1268;
    float _1332 = _1330 + 1.0;
    float _1334 = fma(_1304, _1116, _1300);
    float _1336 = _1332;
    if (!_742)
    {
        _730 = _1184;
    }
    float _1338 = _730;
    float _1340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1342 = _1338;
    if (_742)
    {
        float _1344 = _1040 ? as_type<float>(_1322) : _1184;
        _1342 = _1344;
    }
    float _1346 = _1342;
    float _1348 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1296);
    if (!_1298)
    {
        _1162 = _1200;
    }
    float _1350 = _1162;
    float _1352 = _1350;
    if (_994)
    {
        float _1354 = _938 ? as_type<float>(_1328) : _1184;
        _1246 = _1354;
    }
    float _1356 = _1246;
    if (!_1298)
    {
        _1248 = _1176;
    }
    float _1358 = _1248;
    float _1360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1362 = _1358;
    if (!_1298)
    {
        _1336 = _1180;
    }
    float _1364 = _1336;
    float _1366 = _1364;
    if (!_1298)
    {
        _1316 = _1334;
    }
    float _1368 = _1316;
    bool _1370 = !_1298;
    float _1372 = _1368;
    if (!_1370)
    {
        float _1374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1378 = _1242 + _1376;
        float _1380 = _1334 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = rsqrt(_1222);
        float _1384 = _1378 * _1374;
        float _1386 = _1384 * 0.15915493667125701904296875;
        float _1388 = _1386 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = fma(_1390, _1380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1382 * _1396;
        float _1400 = fma(_1188, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = _1394 + (-1.0);
        float _1404 = fma(_1194, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1408 = _1400 + _1406;
        float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1414 = _1404 + _1412;
        float _1416 = _1408 * _1408;
        float _1418 = fma(_1334, _1394, _1410);
        float _1420 = _1414 * _1414;
        _1372 = _1418;
        _1352 = _1416;
        _1250 = _1420;
        _1362 = _1400;
        _1366 = _1404;
    }
    float _1422 = _1372;
    float _1424 = _1352;
    float _1426 = _1250;
    float _1428 = _1362;
    float _1430 = _1366;
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1434 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1066);
    float _1436 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1080);
    float _1438 = -_124;
    float _1440 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1308);
    float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1444 = _1422 + _1442;
    float _1446 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1312);
    float _1448 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1450 = _966 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1452 = fma(_1444, _1444, _1424);
    float _1454 = -_1446;
    float _1456 = fma(_1436, _1220, _1454);
    float _1458 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1460 = fma(_1448, _1356, -0.5);
    float _1462 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1464 = _1452 + _1426;
    float _1466 = _1450 * _1340;
    float _1468 = fma(_1098, _1270, _1348);
    float _1470 = fma(_1434, _1460, _1440);
    float _1472 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1474 = _1458 * _1432;
    float _1476 = _1462 * _1360;
    float _1478 = sqrt(_1464);
    float _1480 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1468);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1490 = _1472 * _1310;
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1494 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1498 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1508 = _1456 + 0.5;
    float _1510 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1512 = _1470 + 0.5;
    out.m_63.x = _1490;
    out.m_63.y = _1466;
    out.m_63.z = _1476;
    out.m_63.w = _1474;
    bool _1514 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1516 = isnan(_1478);
    bool _1518 = _1514 || _1516;
    bool _1520 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1522 = _1518 || _1520;
    out.m_65.x = _1502;
    out.m_65.y = _1504;
    out.m_65.z = _1506;
    out.m_67.x = _1494;
    out.m_67.y = _1498;
    out.m_67.z = _1500;
    out.m_67.w = _1510;
    out.m_69.x = _1512;
    out.m_69.y = _1508;
    float _1524 = _1488;
    float _1526 = _1498;
    float _1528 = _1422;
    if (!_1522)
    {
        _1524 = 1.0;
    }
    float _1530 = _1524;
    bool _1532 = !_1522;
    float _1534 = _1530;
    if (!_1532)
    {
        bool _1536 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1538 = isnan(_1478);
        bool _1540 = _1536 || _1538;
        bool _1542 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1544 = _1540 || _1542;
        if (!_1544)
        {
            float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1548 = _1478 + _1546;
            float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1552 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1550;
            float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1558 = 1.0 / _1552;
            float _1560 = _1548 * _1558;
            float _1562 = fma(_1560, _1556, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1534 = _1562;
            _1564 = true;
        }
        else
        {
            bool _1566 = _1478 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1568 = isnan(_1478);
            bool _1570 = _1566 || _1568;
            bool _1572 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1574 = _1570 || _1572;
            if (!_1574)
            {
                float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1578 = _1478 + _1576;
                float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1582 = _1580 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1586 = _1584 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1588 = 1.0 / _1582;
                float _1590 = _1578 * _1588;
                float _1592 = fma(_1590, _1586, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1534 = _1592;
                _1564 = true;
            }
            else
            {
                _1534 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1564 = false;
    float _1594 = _1534;
    float _1596 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1598 = _1422 + _1596;
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1602 = _1428 + _1600;
    float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1606 = _1430 + _1604;
    float _1608 = fma(_1598, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1610 = fma(_1602, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1612 = fma(_1606, _1594, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = _1608 + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1620 = _1610 + _1618;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1624 = _1612 + _1622;
    float _1626 = _1616 * _1616;
    float _1628 = fma(_1620, _1620, _1626);
    float _1630 = fma(_1624, _1624, _1628);
    float _1632 = rsqrt(_1630);
    float _1634 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1636 = _1620 * _1634;
    float _1638 = _1624 * _1634;
    float _1640 = _1636 * _1636;
    float _1642 = _1638 * _1638;
    float _1644 = _1640 + _1642;
    float _1646 = sqrt(_1644);
    bool _1648 = _1646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1652 = _1646 + _1650;
    float _1654 = _1624;
    float _1656 = _1626;
    float _1658 = _1652;
    float _1660 = _1616;
    float _1662 = _1636;
    if (_1648)
    {
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1664;
    }
    float _1666 = _1654;
    if (_1648)
    {
        float _1668 = rsqrt(_1644);
        _1656 = _1668;
    }
    float _1670 = _1656;
    float _1672 = _1670;
    if (_1648)
    {
        float _1674 = _1652 * _1666;
        _1658 = _1674;
    }
    float _1676 = _1658;
    if (_1648)
    {
        float _1678 = _1676 * 0.15915493667125701904296875;
        _1526 = _1678;
    }
    float _1680 = _1526;
    float _1682 = _1632;
    if (_1648)
    {
        float _1684 = _1680 * 6.283185482025146484375;
        float _1686 = sin(_1684);
        _1682 = _1686;
    }
    float _1688 = _1682;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1692 = precise::max(0.0, _1690);
    float _1694 = _1474;
    float _1696 = _1692;
    float _1698 = _1690;
    if (_1648)
    {
        float _1700 = _1680 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        _1694 = _1702;
    }
    float _1704 = _1694;
    float _1706 = -_1634;
    float _1708 = -_1692;
    float _1710 = fma(_1616, _1706, _1708);
    if (!_1648)
    {
        _1660 = _1638;
    }
    float _1712 = _1660;
    float _1714 = _1712;
    if (_1648)
    {
        float _1716 = _1710 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1696 = _1716;
    }
    float _1718 = _1696;
    float _1720 = sqrt(_1630);
    float _1722 = _1688;
    float _1724 = _1718;
    if (_1648)
    {
        float _1726 = fma(_1688, _1718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1722 = _1726;
    }
    float _1728 = _1722;
    float _1730 = _1728;
    if (!_1648)
    {
        _1724 = _1640;
    }
    float _1732 = _1724;
    float _1734 = _1732;
    if (_1648)
    {
        float _1736 = _1704 + (-1.0);
        _1698 = _1736;
    }
    float _1738 = _1698;
    float _1740 = _1738;
    if (_1648)
    {
        float _1742 = _1670 * _1728;
        _1528 = _1742;
    }
    float _1744 = _1528;
    if (!_1648)
    {
        _1730 = _1710;
    }
    float _1746 = _1730;
    float _1748 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1750 = _1746;
    if (_1648)
    {
        float _1752 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1752;
    }
    float _1754 = _1672;
    if (_1648)
    {
        float _1756 = _1636 * _1744;
        _1662 = _1756;
    }
    float _1758 = _1662;
    if (_1648)
    {
        float _1760 = _1638 * _1744;
        _1714 = _1760;
    }
    float _1762 = _1714;
    if (!_1648)
    {
        _1740 = _1642;
    }
    float _1764 = _1740;
    float _1766 = _1764;
    if (_1648)
    {
        float _1768 = fma(_1710, _1704, _1754);
        _1750 = _1768;
    }
    float _1770 = _1750;
    if (_1648)
    {
        float _1772 = _1758 * _1758;
        _1734 = _1772;
    }
    float _1774 = _1734;
    if (_1648)
    {
        float _1776 = _1762 * _1762;
        _1766 = _1776;
    }
    float _1778 = _1766;
    float _1780 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1748);
    float _1782 = fma(_1770, _1770, _1774);
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1786 = fma(_1720, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1784);
    float _1788 = precise::clamp(_1786, 0.0, 1.0);
    float _1790 = _1782 + _1778;
    float _1792 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1796 = -_1788;
    float _1798 = _1796 + 1.0;
    float _1800 = rsqrt(_1790);
    float _1802 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1792);
    float _1804 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1802);
    float _1808 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1810 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1812 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1814 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1808);
    float _1816 = abs(_1798);
    float _1818 = log2(_1816);
    float _1820 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1810);
    float _1822 = _1812 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1824 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1814);
    float _1826 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1828 = _1800 * _1758;
    float _1830 = -_1822;
    float _1832 = fma(_1830, _1794, 1.0);
    float _1834 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1836 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1838 = _1800 * _1770;
    float _1840 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1842 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1780);
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1836);
    float _1846 = _1800 * _1762;
    float _1848 = -_1840;
    float _1850 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1848);
    float _1852 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1854 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1844);
    float _1858 = -_1846;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1850);
    float _1862 = exp2(_1852);
    float _1864 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1866 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1856);
    float _1868 = fma(_1860, -0.5, 0.5);
    float _1870 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1872 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1864);
    float _1874 = fma(_1860, 0.5, 0.5);
    float _1876 = _1838 + 1.0;
    float _1878 = log2(_1832);
    float _1880 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1870);
    float _1882 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1872);
    float _1884 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1886 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1880);
    float _1888 = fma(_1874, _1884, -0.212114393711090087890625);
    float _1890 = 1.0 / _1866;
    float _1892 = -_1838;
    float _1894 = fma(_1862, _1876, _1892);
    float _1896 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1882);
    float _1898 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1886);
    float _1900 = fma(_1874, _1888, 1.570728778839111328125);
    float _1902 = fma(_1894, 0.5, 0.5);
    float _1904 = sqrt(_1868);
    float _1906 = _1878 * 0.693147182464599609375;
    float _1908 = _1896 * _1890;
    float _1910 = _1898 * _1890;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1914 = fma(_1908, 0.5, 0.5);
    float _1916 = fma(_1910, -0.5, 0.5);
    float _1918 = _1904 * 0.636619746685028076171875;
    float3 _5051 = float3(_1914, _1916, _1912);
    float _1920 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5051, float3(0.0), isnan(_5051)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5051, float3(0.0), isnan(_5051)), level(0.0)).x;
    float3 _5062 = float3(_1914, _1916, _1912);
    float4 _1923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5062, float3(0.0), isnan(_5062)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5062, float3(0.0), isnan(_5062)), level(0.0)).xyzw;
    float _1925 = _1923.x;
    float _1927 = _1923.y;
    float _1929 = _1923.z;
    float _1931 = _1923.w;
    float _1933 = -_1900;
    float _1935 = fma(_1918, _1933, 1.0);
    float2 _5084 = float2(_1935, _1902);
    float3 _1939 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5084, float2(0.0), isnan(_5084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5084, float2(0.0), isnan(_5084)), level(0.0)).xyz;
    float _1941 = _1939.x;
    float _1943 = _1939.y;
    float _1945 = _1939.z;
    float _1947 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1949 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _656;
    out.m_71.y = _640;
    out.m_71.z = _662;
    float _1951 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1949);
    float _1953 = exp2(_1947);
    out.m_73.x = _1610;
    out.m_73.y = _1608;
    out.m_73.z = _1612;
    float _1955 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1951);
    float _1957 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1955);
    float _1959 = _1957 + _1866;
    out.gl_Position.x = _1896;
    out.gl_Position.y = _1898;
    out.gl_Position.z = _1957;
    out.gl_Position.w = _1866;
    float _1961 = _1959 * 0.5;
    float _1963 = -_1953;
    float _1965 = _1963 + 1.0;
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_75.z = _1961;
    out.m_75.w = _1866;
    float _1969 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1971 = -_1967;
    float _1973 = _1971 + 1.0;
    out.m_47.x = _1969;
    float _1975 = _1967 * _1920;
    float _1977 = _1931 * _1975;
    float _1979 = _1945 * _1975;
    float _1981 = fma(_1941, _1977, _1925);
    float _1983 = fma(_1943, _1977, _1927);
    float _1985 = _1931 * _1973;
    float _1987 = fma(_1931, _1979, _1929);
    out.m_77.x = _1981;
    out.m_77.y = _1983;
    out.m_77.z = _1987;
    out.m_77.w = _1985;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

