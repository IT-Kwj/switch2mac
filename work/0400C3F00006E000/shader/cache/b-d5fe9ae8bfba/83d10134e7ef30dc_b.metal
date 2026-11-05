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
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_61 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _718 = false;
    bool _576 = false;
    bool _286 = false;
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
        float _1904 = as_type<float>(_106);
        out.gl_Position.z = _1904;
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
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1973 = as_type<float>(_142);
        out.gl_Position.z = _1973;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    bool _326 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_294);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    bool _338 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_294);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _314;
    float _352 = -_348;
    float _354 = _352 + 1.0;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _358 = 1.0 / _318;
    float _360 = _298 * _324;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _364 = _294 + _362;
    float _366 = 1.0 / _322;
    float _368 = _302 * _350;
    bool _370 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _372 = isnan(_294);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -_380;
    float _384 = _382 + 1.0;
    float _386 = _306 * _358;
    float _388 = _364 * _366;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = _400 * _384;
    float _408 = -_400;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _416;
    float _420 = fma(_404, _360, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = _336 * _410;
    float _424 = -_336;
    float _426 = _424 + 1.0;
    float _428 = fma(_414, _360, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _430 = fma(_418, _360, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _432 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_294);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _348 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = _442 * _354;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _460;
    float _464 = fma(_452, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _466 = fma(_456, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _468 = _428 * _458;
    float _470 = _430 * _458;
    float _472 = _420 * _458;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    float _478 = in.m_49.x;
    float _480 = in.m_49.y;
    float _482 = in.m_49.z;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _494 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _496 = fma(_448, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _500 = fma(_486, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _502 = fma(_462, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = fma(_490, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = fma(_464, _444, _492);
    float _508 = fma(_466, _444, _494);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_496, _444, _498);
    float _524 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_516, _388, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = fma(_520, _388, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _530 = fma(_500, _422, _506);
    float _532 = fma(_502, _422, _508);
    float _534 = fma(_504, _422, _522);
    float _536 = fma(_524, _406, _530);
    float _538 = fma(_526, _406, _532);
    float _540 = fma(_528, _406, _534);
    float _542 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].x, _536);
    float _544 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].y, _538);
    float _546 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].z, _540);
    float _548 = _542 * _478;
    float _550 = _544 * _480;
    float _552 = _546 * _482;
    bool _554 = !_356;
    float _556 = _472;
    float _574;
    if (!_554)
    {
        float _558 = in.m_51.x;
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _562 = _558 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _566 = _564 * _560;
        float _568 = floor(_566);
        float _570 = -_568;
        float _572 = _566 + _570;
        _574 = _572;
        _576 = true;
    }
    else
    {
        float _578 = float(_90);
        float _580 = 1.0 / _578;
        float _582 = _124 * _580;
        _574 = _582;
    }
    _576 = false;
    float _584 = _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _588 = _584 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = isnan(_584);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _612 = isnan(_584);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _622;
    bool _626 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = isnan(_584);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = 1.0 / _592;
    float _640 = -_604;
    float _642 = _640 + 1.0;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _646 = _620 * _642;
    float _648 = -_620;
    float _650 = _648 + 1.0;
    float _652 = 1.0 / _608;
    float _654 = _624 * _638;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = fma(_654, _588, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _662 = _658 * _652;
    float _664 = _660 * _646;
    float _666 = -_636;
    float _668 = _666 + 1.0;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _584 + _670;
    float _674 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    float _676 = _604 * _668;
    float _678 = fma(_662, _672, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_678, _676, _674);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[117].x, _682);
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _690;
    out.m_53.y = _692;
    out.m_53.z = _694;
    out.m_53.w = _696;
    bool _698 = !_644;
    float _716;
    if (!_698)
    {
        float _700 = in.m_51.x;
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        float _720 = float(_90);
        float _722 = 1.0 / _720;
        float _724 = _124 * _722;
        _716 = _724;
    }
    _718 = false;
    float _726 = _716;
    float _728 = in.m_55.x;
    float _730 = in.m_55.y;
    float _732 = in.m_55.z;
    float _734 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _728);
    float _754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    float _756 = _734 * _750;
    float _758 = _736 * _752;
    float _760 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _762 = _738 * _754;
    float _764 = _756 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _766 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _768 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    float _770 = _756 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _764);
    float _774 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _766);
    float _776 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _768);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _770);
    float _780 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].z, _772);
    float _782 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _784 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _774);
    float _786 = _776 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].z, _778);
    float _790 = _780 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _792 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _782);
    float _794 = _784 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _798 = _786 + _790;
    float _800 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _802 = _794 + _796;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _798 + _804;
    float _808 = _800 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _812 = _802 + _810;
    float _814 = _806 * _806;
    float _816 = _808 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _818 = fma(_812, _812, _814);
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _816);
    float _822 = sqrt(_818);
    float _824 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[11].z, _820);
    float _826 = _808 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _828 = _824 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _830 = _756 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _832 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _826);
    float _834 = 1.0 / _828;
    float _836 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _830);
    float _838 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[10].z, _832);
    float _840 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].z, _836);
    float _842 = _838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _844 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _846 = _840 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = _842 + _828;
    float _850 = _808 + _846;
    float _852 = _848 * _834;
    float _854 = _852 * 0.5;
    float _856 = _848;
    float _858 = _846;
    float _860 = _762;
    float _862 = _840;
    float _864 = _828;
    if (_748)
    {
        _856 = 1.0;
    }
    float _866 = _856;
    float _868 = _866;
    if (!_844)
    {
        _858 = _802;
    }
    float _870 = _858;
    float _872 = _870;
    if (!_844)
    {
        _860 = _798;
    }
    float _874 = _860;
    float _876 = _874;
    if (!_844)
    {
        _862 = _850;
    }
    float _878 = _862;
    bool _880 = !_844;
    float _882 = _878;
    if (!_880)
    {
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _888 = _822 + _886;
        float _890 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = rsqrt(_818);
        float _894 = _888 * _884;
        float _896 = _894 * 0.15915493667125701904296875;
        float _898 = _896 * 6.283185482025146484375;
        float _900 = cos(_898);
        float _902 = _896 * 6.283185482025146484375;
        float _904 = sin(_902);
        float _906 = _900 + (-1.0);
        float _908 = _906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _910 = fma(_904, _890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = fma(_850, _900, _908);
        float _914 = _892 * _910;
        float _916 = fma(_812, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _918 = fma(_806, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _882 = _912;
        _872 = _916;
        _876 = _918;
    }
    float _920 = _882;
    float _922 = _872;
    float _924 = _876;
    if (!_748)
    {
        float _926 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _928 = _926 * 0.15915493667125701904296875;
        float _930 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _934 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _932);
        float _936 = _928 * 6.283185482025146484375;
        float _938 = cos(_936);
        float _940 = _930 * 0.15915493667125701904296875;
        float _942 = _928 * 6.283185482025146484375;
        float _944 = sin(_942);
        float _946 = 1.0 / _938;
        float _948 = _940 * 6.283185482025146484375;
        float _950 = cos(_948);
        float _952 = _944 * _946;
        float _954 = _940 * 6.283185482025146484375;
        float _956 = sin(_954);
        float _958 = _950 * _952;
        float _960 = 1.0 / _934;
        float _962 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _964 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _962;
        float _966 = 1.0 / _958;
        float _968 = 1.0 / _964;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _972 = _960 * _970;
        float _974 = _956 * _966;
        float _976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _978 = fma(_974, _972, _976);
        float _980 = _978 * _968;
        float _982 = precise::clamp(_980, 0.0, 1.0);
        _864 = _968;
        _868 = _982;
    }
    float _984 = _864;
    float _986 = _868;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _990 = _920 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _994 = _922 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _998 = _924 + _996;
    float _1000 = _990 * _990;
    float _1002 = fma(_994, _994, _1000);
    float _1004 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1006 = fma(_998, _998, _1002);
    float _1008 = rsqrt(_1006);
    float _1010 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1012 = _994 * _1010;
    float _1014 = _998 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 + _1018;
    float _1022 = sqrt(_1020);
    bool _1024 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1022 + _1026;
    float _1030 = _806;
    float _1032 = _1020;
    float _1034 = _1028;
    float _1036 = _990;
    float _1038 = _1012;
    if (_1024)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1040;
    }
    float _1042 = _1030;
    if (_1024)
    {
        float _1044 = rsqrt(_1020);
        _1032 = _1044;
    }
    float _1046 = _1032;
    float _1048 = _1042;
    if (_1024)
    {
        float _1050 = _1028 * _1042;
        _1034 = _1050;
    }
    float _1052 = _1034;
    if (_1024)
    {
        float _1054 = _1052 * 0.15915493667125701904296875;
        _1048 = _1054;
    }
    float _1056 = _1048;
    float _1058 = _998;
    float _1060 = _1056;
    if (_1024)
    {
        float _1062 = _1056 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        _1058 = _1064;
    }
    float _1066 = _1058;
    float _1068 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1070 = precise::max(0.0, _1068);
    float _1072 = _984;
    float _1074 = _1070;
    if (_1024)
    {
        float _1076 = _1056 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = -_1010;
    float _1084 = -_1070;
    float _1086 = fma(_990, _1082, _1084);
    if (_1024)
    {
        float _1088 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1088;
    }
    float _1090 = _1036;
    float _1092 = _1090;
    float _1094 = _1066;
    if (_1024)
    {
        float _1096 = fma(_1066, _1090, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1092 = _1096;
    }
    float _1098 = _1092;
    float _1100 = _1098;
    if (!_1024)
    {
        _1094 = _1016;
    }
    float _1102 = _1094;
    float _1104 = _920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1106 = _1102;
    float _1108 = _1080;
    if (_1024)
    {
        float _1110 = _1080 + (-1.0);
        _1074 = _1110;
    }
    float _1112 = _1074;
    float _1114 = _1112;
    if (_1024)
    {
        float _1116 = _1046 * _1098;
        _556 = _1116;
    }
    float _1118 = _556;
    if (!_1024)
    {
        _1100 = _1086;
    }
    float _1120 = _1100;
    float _1122 = sqrt(_1006);
    float _1124 = _1120;
    if (_1024)
    {
        float _1126 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1126;
    }
    float _1128 = _1060;
    if (_1024)
    {
        float _1130 = _1012 * _1118;
        _1038 = _1130;
    }
    float _1132 = _1038;
    if (!_1024)
    {
        _1114 = _1014;
    }
    float _1134 = _1114;
    float _1136 = _1134;
    if (_1024)
    {
        float _1138 = _1014 * _1118;
        _1136 = _1138;
    }
    float _1140 = _1136;
    if (_1024)
    {
        float _1142 = fma(_1086, _1080, _1128);
        _1124 = _1142;
    }
    float _1144 = _1124;
    if (_1024)
    {
        float _1146 = _1132 * _1132;
        _1106 = _1146;
    }
    float _1148 = _1106;
    if (!_1024)
    {
        _1108 = _1018;
    }
    float _1150 = _1108;
    float _1152 = _1150;
    if (_1024)
    {
        float _1154 = _1140 * _1140;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = fma(_1144, _1144, _1148);
    float _1160 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1104);
    float _1162 = _1158 + _1156;
    float _1164 = _920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1168 = fma(_1122, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1166);
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    float _1172 = _920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1176 = rsqrt(_1162);
    float _1178 = -_1170;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1184 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1186 = _920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1182);
    float _1190 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = abs(_1180);
    float _1194 = log2(_1192);
    float _1196 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1198 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1200 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1202 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1196);
    float _1204 = -_1200;
    float _1206 = fma(_1204, _1004, 1.0);
    float _1208 = _1176 * _1132;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1214 = _1176 * _1144;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1218 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1160);
    float _1220 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1212);
    float _1222 = _1176 * _1140;
    float _1224 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1226 = -_1216;
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1226);
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1232 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1220);
    float _1234 = exp2(_1224);
    float _1236 = -_1222;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1228);
    float _1240 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1242 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1232);
    float _1244 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1246 = fma(_1238, -0.5, 0.5);
    float _1248 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1240);
    float _1250 = fma(_1238, 0.5, 0.5);
    float _1252 = log2(_1206);
    float _1254 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1244);
    float _1256 = _1214 + 1.0;
    float _1258 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1248);
    float _1260 = fma(_1250, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1262 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1254);
    float _1264 = 1.0 / _1242;
    float _1266 = -_1214;
    float _1268 = fma(_1234, _1256, _1266);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1258);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1262);
    float _1274 = fma(_1250, _1260, -0.212114393711090087890625);
    float _1276 = fma(_1268, 0.5, 0.5);
    float _1278 = sqrt(_1246);
    float _1280 = _1252 * 0.693147182464599609375;
    float _1282 = fma(_1250, _1274, 1.570728778839111328125);
    float _1284 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1286 = _1272 * _1264;
    float _1288 = _1270 * _1264;
    float _1290 = fma(_1286, -0.5, 0.5);
    float _1292 = fma(_1288, 0.5, 0.5);
    float _1294 = _1278 * 0.636619746685028076171875;
    float _1296 = -_1282;
    float _1298 = fma(_1294, _1296, 1.0);
    float3 _3865 = float3(_1292, _1290, _1284);
    float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3865, float3(0.0), isnan(_3865)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3865, float3(0.0), isnan(_3865)), level(0.0)).x;
    float3 _3876 = float3(_1292, _1290, _1284);
    float4 _1303 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).xyzw;
    float _1305 = _1303.x;
    float _1307 = _1303.y;
    float _1309 = _1303.z;
    float _1311 = _1303.w;
    float2 _3893 = float2(_1298, _1276);
    float3 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3893, float2(0.0), isnan(_3893)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3893, float2(0.0), isnan(_3893)), level(0.0)).xyz;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = in.m_51.w;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1327 = in.m_57.y;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1331 = _1329 != 0;
    float _1333 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = in.m_51.y;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1347 = _1345 != 0;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1351 = in.m_51.z;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1355 = _1353 != 0;
    float _1357 = in.m_51.x;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1361 = 1.0 / _1343;
    float _1363 = in.m_57.x;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    out.m_59.x = _794;
    out.m_59.y = _808;
    out.m_59.z = _786;
    bool _1367 = _1323 > 0.5;
    float _1369 = -_1327;
    float _1371 = _1369 + 1.0;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    out.m_61.x = _922;
    out.m_61.y = _920;
    out.m_61.z = _924;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1379 = _1339 > 0.5;
    float _1381 = 1.0 / _1377;
    bool _1383 = _1351 > 0.5;
    int _1385 = _1379 ? as_type<int>(_1371) : as_type<int>(_1327);
    int _1387 = _1383 ? as_type<int>(_1371) : as_type<int>(_1327);
    float _1389 = _1337 ? as_type<float>(_1385) : _1327;
    float _1391 = _1347 ? as_type<float>(_1387) : _1327;
    float _1393 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1395 = _1327;
    bool _1397 = _1331;
    float _1399 = _1389;
    float _1401 = _1339;
    if (_1331)
    {
        float _1403 = _1367 ? _1371 : _1327;
        _1395 = _1403;
    }
    float _1405 = _1395;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1413 = _1411 != 0;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1415;
    float _1419 = fma(_1393, -2.0, _1359);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1423 = _726 + _1421;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1427 = _1417 * _1381;
    float _1429 = _1409 * _1361;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1433 = _726 + _1431;
    bool _1435 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1437 = isnan(_726);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = fma(_1427, _1423, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1449 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1451 = fma(_1429, _1433, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1453 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1455 = fma(_1449, _1389, -0.5);
    bool _1457 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1459 = isnan(_726);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1473 = _1471 != 0;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1477 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1479 = -_1467;
    float _1481 = _1479 + 1.0;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    float _1487 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1475);
    float _1489 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1469);
    float _1491 = fma(_1391, _1477, -0.5);
    bool _1493 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1495 = isnan(_726);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = _1445 * _1481;
    float _1507 = -_1445;
    float _1509 = _1507 + 1.0;
    float _1511 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1487);
    float _1513 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1419);
    float _1515 = _1503 * _1509;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1519 = -_1513;
    float _1521 = fma(_1511, _1455, _1519);
    float _1523 = _1419;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    float _1527 = _1453;
    float _1529 = _1447;
    float _1531 = _1363;
    if (_1413)
    {
        _1523 = _1357;
    }
    float _1533 = _1523;
    float _1535 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1539 = _1533;
    if (_1355)
    {
        float _1541 = -_1363;
        float _1543 = _1541 + 1.0;
        _1525 = as_type<int>(_1543);
    }
    int _1545 = _1525;
    if (!_1413)
    {
        _1539 = _1351;
    }
    float _1547 = _1539;
    float _1549 = -_1517;
    float _1551 = fma(_1453, 2.0, _1549);
    if (_1355)
    {
        bool _1553 = _1357 > 0.5;
        _1397 = _1553;
    }
    bool _1555 = _1397;
    float _1557 = fma(_1535, _1405, -0.5);
    if (!_1355)
    {
        _1527 = _1363;
    }
    float _1559 = _1527;
    float _1561 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1563 = _1559;
    int _1565 = as_type<int>(_1561);
    if (_1355)
    {
        float _1567 = _1555 ? as_type<float>(_1545) : _1363;
        _1563 = _1567;
    }
    float _1569 = _1563;
    float _1571 = -_1503;
    float _1573 = _1571 + 1.0;
    float _1575 = -_1537;
    float _1577 = fma(_1561, 2.0, _1575);
    if (!_1413)
    {
        _1399 = _1339;
    }
    float _1579 = _1399;
    int _1581 = 0;
    float _1583 = _1579;
    if (_1473)
    {
        float _1585 = -_1363;
        float _1587 = _1585 + 1.0;
        _1581 = as_type<int>(_1587);
    }
    int _1589 = _1581;
    if (_1413)
    {
        _1583 = _1357;
    }
    float _1591 = _1583;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1595 = _1447 * _1515;
    float _1597 = _1595;
    if (_1485)
    {
        float _1599 = -_1363;
        float _1601 = _1599 + 1.0;
        _1565 = as_type<int>(_1601);
    }
    int _1603 = _1565;
    float _1605 = fma(_1591, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1593);
    float _1607 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1611 = _1607;
    if (!_1473)
    {
        _1529 = _1363;
    }
    float _1613 = _1529;
    float _1615 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1595);
    float _1617 = _1613;
    if (_1473)
    {
        float _1619 = _1383 ? as_type<float>(_1589) : _1363;
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = -_1609;
    float _1625 = fma(_1607, 2.0, _1623);
    if (_1413)
    {
        _1611 = _1351;
    }
    float _1627 = _1611;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1631 = _1627;
    if (!_1413)
    {
        _1631 = _1339;
    }
    float _1633 = _1631;
    float _1635 = fma(_1451, _1505, _1615);
    float _1637 = _1633;
    if (_1485)
    {
        float _1639 = _1379 ? as_type<float>(_1603) : _1363;
        _1531 = _1639;
    }
    float _1641 = _1531;
    float _1643 = -_124;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1551);
    float _1647 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1365);
    if (!_1413)
    {
        _1597 = _1351;
    }
    float _1649 = _1597;
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1653 = _1649;
    if (!_1413)
    {
        _1637 = _1351;
    }
    float _1655 = _1637;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1659 = _1655;
    if (_1413)
    {
        _1653 = _1339;
    }
    float _1661 = _1653;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1665 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1657);
    float _1667 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1647);
    float _1669 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1663);
    float _1671 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1675 = _1667 * (-0.15915493667125701904296875);
    if (_1413)
    {
        _1659 = _1339;
    }
    float _1677 = _1659;
    float _1679 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1373);
    if (!_1413)
    {
        _1401 = _1357;
    }
    float _1681 = _1401;
    float _1683 = fma(_1671, _1621, -0.5);
    float _1685 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1689 = _1675 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = fma(_1685, _1569, -0.5);
    float _1695 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1665);
    float _1697 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1699 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1605);
    float _1701 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    float _1703 = fma(_1695, _1693, _1645);
    float _1705 = _1675 * 6.283185482025146484375;
    float _1707 = cos(_1705);
    float _1709 = fma(_1697, -2.0, _1687);
    float _1711 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1713 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1717 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1709);
    float _1719 = fma(_1711, _1641, -0.5);
    float _1721 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1635);
    float _1723 = _1691 * _1491;
    float _1725 = fma(_1713, -2.0, _1715);
    float _1727 = -_1717;
    float _1729 = fma(_1701, _1557, _1727);
    float _1731 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1679);
    float _1733 = -_124;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1577);
    float _1737 = -_124;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1625);
    float _1741 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1725);
    bool _1743 = _986 > 0.0;
    bool _1745 = isnan(_986);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan(0.0);
    bool _1751 = _1747 || _1749;
    float _1753 = -_1723;
    float _1755 = fma(_1707, _1719, _1753);
    float _1757 = _1707 * _1491;
    float _1759 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1489);
    float _1761 = fma(_1731, _1755, _1735);
    float _1763 = fma(_1691, _1719, _1757);
    float _1765 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1333);
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1771 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1765);
    float _1773 = -_1741;
    float _1775 = fma(_1759, _1763, _1773);
    float _1777 = fma(_1699, _1683, _1739);
    float _1779 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1783 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1771);
    float _1785 = _1721 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1789 = _1761 + 0.5;
    float _1791 = _1703 + 0.5;
    float _1793 = exp2(_1781);
    float _1795 = _1775 + 0.5;
    float _1797 = _986 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1799 = _1783 + _1242;
    float _1801 = _1270 + _1242;
    float _1803 = _1242 * 0.5;
    float _1805 = _1777 + 0.5;
    float _1807 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1809 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1811 = _1521 + 0.5;
    float _1813 = _1729 + 0.5;
    float _1815 = _1799 * 0.5;
    float _1817 = _1801 * 0.5;
    float _1819 = fma(_1272, -0.5, _1803);
    float _1821 = -_1793;
    float _1823 = _1821 + 1.0;
    out.m_63.x = _1807;
    out.m_63.y = _1809;
    out.m_63.z = _1779;
    out.m_63.w = _1785;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1827 = _1797 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1791;
    out.m_65.y = _1811;
    out.m_65.z = _1805;
    out.m_65.w = _1813;
    out.m_67.x = _1789;
    out.m_67.y = _1795;
    out.gl_Position.x = _1270;
    out.gl_Position.y = _1272;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1242;
    out.m_69.x = _1817;
    out.m_69.y = _1819;
    out.m_69.z = _1815;
    out.m_69.w = _1242;
    out.m_45.x = _1827;
    float _1829 = _1825 * _1300;
    float _1831 = -_1825;
    float _1833 = _1831 + 1.0;
    float _1835 = _1311 * _1829;
    float _1837 = _1321 * _1829;
    float _1839 = _1311 * _1833;
    float _1841 = fma(_1317, _1835, _1305);
    float _1843 = fma(_1319, _1835, _1307);
    float _1845 = fma(_1311, _1837, _1309);
    out.m_71.x = _1841;
    out.m_71.y = _1843;
    out.m_71.z = _1845;
    out.m_71.w = _1839;
    if (_1751)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1847;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _718 = false;
    bool _576 = false;
    bool _286 = false;
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
        float _1904 = as_type<float>(_106);
        out.gl_Position.z = _1904;
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
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1973 = as_type<float>(_142);
        out.gl_Position.z = _1973;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    bool _326 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_294);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    bool _338 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_294);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _314;
    float _352 = -_348;
    float _354 = _352 + 1.0;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _358 = 1.0 / _318;
    float _360 = _298 * _324;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _364 = _294 + _362;
    float _366 = 1.0 / _322;
    float _368 = _302 * _350;
    bool _370 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _372 = isnan(_294);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -_380;
    float _384 = _382 + 1.0;
    float _386 = _306 * _358;
    float _388 = _364 * _366;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = _400 * _384;
    float _408 = -_400;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _416;
    float _420 = fma(_404, _360, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = _336 * _410;
    float _424 = -_336;
    float _426 = _424 + 1.0;
    float _428 = fma(_414, _360, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _430 = fma(_418, _360, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _432 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_294);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _348 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = _442 * _354;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _460;
    float _464 = fma(_452, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _466 = fma(_456, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _468 = _428 * _458;
    float _470 = _430 * _458;
    float _472 = _420 * _458;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    float _478 = in.m_49.x;
    float _480 = in.m_49.y;
    float _482 = in.m_49.z;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _494 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _496 = fma(_448, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _500 = fma(_486, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _502 = fma(_462, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = fma(_490, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = fma(_464, _444, _492);
    float _508 = fma(_466, _444, _494);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_496, _444, _498);
    float _524 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_516, _388, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = fma(_520, _388, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _530 = fma(_500, _422, _506);
    float _532 = fma(_502, _422, _508);
    float _534 = fma(_504, _422, _522);
    float _536 = fma(_524, _406, _530);
    float _538 = fma(_526, _406, _532);
    float _540 = fma(_528, _406, _534);
    float _542 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].x, _536);
    float _544 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].y, _538);
    float _546 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].z, _540);
    float _548 = _542 * _478;
    float _550 = _544 * _480;
    float _552 = _546 * _482;
    bool _554 = !_356;
    float _556 = _472;
    float _574;
    if (!_554)
    {
        float _558 = in.m_51.x;
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _562 = _558 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _566 = _564 * _560;
        float _568 = floor(_566);
        float _570 = -_568;
        float _572 = _566 + _570;
        _574 = _572;
        _576 = true;
    }
    else
    {
        float _578 = float(_90);
        float _580 = 1.0 / _578;
        float _582 = _124 * _580;
        _574 = _582;
    }
    _576 = false;
    float _584 = _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _588 = _584 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = isnan(_584);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _612 = isnan(_584);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _622;
    bool _626 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = isnan(_584);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = 1.0 / _592;
    float _640 = -_604;
    float _642 = _640 + 1.0;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _646 = _620 * _642;
    float _648 = -_620;
    float _650 = _648 + 1.0;
    float _652 = 1.0 / _608;
    float _654 = _624 * _638;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = fma(_654, _588, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _662 = _658 * _652;
    float _664 = _660 * _646;
    float _666 = -_636;
    float _668 = _666 + 1.0;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _584 + _670;
    float _674 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    float _676 = _604 * _668;
    float _678 = fma(_662, _672, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_678, _676, _674);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[117].x, _682);
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _690;
    out.m_53.y = _692;
    out.m_53.z = _694;
    out.m_53.w = _696;
    bool _698 = !_644;
    float _716;
    if (!_698)
    {
        float _700 = in.m_51.x;
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        float _720 = float(_90);
        float _722 = 1.0 / _720;
        float _724 = _124 * _722;
        _716 = _724;
    }
    _718 = false;
    float _726 = _716;
    float _728 = in.m_55.x;
    float _730 = in.m_55.y;
    float _732 = in.m_55.z;
    float _734 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _728);
    float _754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    float _756 = _734 * _750;
    float _758 = _736 * _752;
    float _760 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _762 = _738 * _754;
    float _764 = _756 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _766 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _768 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    float _770 = _756 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _764);
    float _774 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _766);
    float _776 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _768);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _770);
    float _780 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].z, _772);
    float _782 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _784 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _774);
    float _786 = _776 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].z, _778);
    float _790 = _780 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _792 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _782);
    float _794 = _784 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _798 = _786 + _790;
    float _800 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _802 = _794 + _796;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _798 + _804;
    float _808 = _800 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _812 = _802 + _810;
    float _814 = _806 * _806;
    float _816 = _808 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _818 = fma(_812, _812, _814);
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _816);
    float _822 = sqrt(_818);
    float _824 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[11].z, _820);
    float _826 = _808 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _828 = _824 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _830 = _756 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _832 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _826);
    float _834 = 1.0 / _828;
    float _836 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _830);
    float _838 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[10].z, _832);
    float _840 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].z, _836);
    float _842 = _838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _844 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _846 = _840 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = _842 + _828;
    float _850 = _808 + _846;
    float _852 = _848 * _834;
    float _854 = _852 * 0.5;
    float _856 = _848;
    float _858 = _846;
    float _860 = _762;
    float _862 = _840;
    float _864 = _828;
    if (_748)
    {
        _856 = 1.0;
    }
    float _866 = _856;
    float _868 = _866;
    if (!_844)
    {
        _858 = _802;
    }
    float _870 = _858;
    float _872 = _870;
    if (!_844)
    {
        _860 = _798;
    }
    float _874 = _860;
    float _876 = _874;
    if (!_844)
    {
        _862 = _850;
    }
    float _878 = _862;
    bool _880 = !_844;
    float _882 = _878;
    if (!_880)
    {
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _888 = _822 + _886;
        float _890 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = rsqrt(_818);
        float _894 = _888 * _884;
        float _896 = _894 * 0.15915493667125701904296875;
        float _898 = _896 * 6.283185482025146484375;
        float _900 = cos(_898);
        float _902 = _896 * 6.283185482025146484375;
        float _904 = sin(_902);
        float _906 = _900 + (-1.0);
        float _908 = _906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _910 = fma(_904, _890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = fma(_850, _900, _908);
        float _914 = _892 * _910;
        float _916 = fma(_812, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _918 = fma(_806, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _882 = _912;
        _872 = _916;
        _876 = _918;
    }
    float _920 = _882;
    float _922 = _872;
    float _924 = _876;
    if (!_748)
    {
        float _926 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _928 = _926 * 0.15915493667125701904296875;
        float _930 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _934 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _932);
        float _936 = _928 * 6.283185482025146484375;
        float _938 = cos(_936);
        float _940 = _930 * 0.15915493667125701904296875;
        float _942 = _928 * 6.283185482025146484375;
        float _944 = sin(_942);
        float _946 = 1.0 / _938;
        float _948 = _940 * 6.283185482025146484375;
        float _950 = cos(_948);
        float _952 = _944 * _946;
        float _954 = _940 * 6.283185482025146484375;
        float _956 = sin(_954);
        float _958 = _950 * _952;
        float _960 = 1.0 / _934;
        float _962 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _964 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _962;
        float _966 = 1.0 / _958;
        float _968 = 1.0 / _964;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _972 = _960 * _970;
        float _974 = _956 * _966;
        float _976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _978 = fma(_974, _972, _976);
        float _980 = _978 * _968;
        float _982 = precise::clamp(_980, 0.0, 1.0);
        _864 = _968;
        _868 = _982;
    }
    float _984 = _864;
    float _986 = _868;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _990 = _920 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _994 = _922 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _998 = _924 + _996;
    float _1000 = _990 * _990;
    float _1002 = fma(_994, _994, _1000);
    float _1004 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1006 = fma(_998, _998, _1002);
    float _1008 = rsqrt(_1006);
    float _1010 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1012 = _994 * _1010;
    float _1014 = _998 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 + _1018;
    float _1022 = sqrt(_1020);
    bool _1024 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1022 + _1026;
    float _1030 = _806;
    float _1032 = _1020;
    float _1034 = _1028;
    float _1036 = _990;
    float _1038 = _1012;
    if (_1024)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1040;
    }
    float _1042 = _1030;
    if (_1024)
    {
        float _1044 = rsqrt(_1020);
        _1032 = _1044;
    }
    float _1046 = _1032;
    float _1048 = _1042;
    if (_1024)
    {
        float _1050 = _1028 * _1042;
        _1034 = _1050;
    }
    float _1052 = _1034;
    if (_1024)
    {
        float _1054 = _1052 * 0.15915493667125701904296875;
        _1048 = _1054;
    }
    float _1056 = _1048;
    float _1058 = _998;
    float _1060 = _1056;
    if (_1024)
    {
        float _1062 = _1056 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        _1058 = _1064;
    }
    float _1066 = _1058;
    float _1068 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1070 = precise::max(0.0, _1068);
    float _1072 = _984;
    float _1074 = _1070;
    if (_1024)
    {
        float _1076 = _1056 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = -_1010;
    float _1084 = -_1070;
    float _1086 = fma(_990, _1082, _1084);
    if (_1024)
    {
        float _1088 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1088;
    }
    float _1090 = _1036;
    float _1092 = _1090;
    float _1094 = _1066;
    if (_1024)
    {
        float _1096 = fma(_1066, _1090, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1092 = _1096;
    }
    float _1098 = _1092;
    float _1100 = _1098;
    if (!_1024)
    {
        _1094 = _1016;
    }
    float _1102 = _1094;
    float _1104 = _920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1106 = _1102;
    float _1108 = _1080;
    if (_1024)
    {
        float _1110 = _1080 + (-1.0);
        _1074 = _1110;
    }
    float _1112 = _1074;
    float _1114 = _1112;
    if (_1024)
    {
        float _1116 = _1046 * _1098;
        _556 = _1116;
    }
    float _1118 = _556;
    if (!_1024)
    {
        _1100 = _1086;
    }
    float _1120 = _1100;
    float _1122 = sqrt(_1006);
    float _1124 = _1120;
    if (_1024)
    {
        float _1126 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1126;
    }
    float _1128 = _1060;
    if (_1024)
    {
        float _1130 = _1012 * _1118;
        _1038 = _1130;
    }
    float _1132 = _1038;
    if (!_1024)
    {
        _1114 = _1014;
    }
    float _1134 = _1114;
    float _1136 = _1134;
    if (_1024)
    {
        float _1138 = _1014 * _1118;
        _1136 = _1138;
    }
    float _1140 = _1136;
    if (_1024)
    {
        float _1142 = fma(_1086, _1080, _1128);
        _1124 = _1142;
    }
    float _1144 = _1124;
    if (_1024)
    {
        float _1146 = _1132 * _1132;
        _1106 = _1146;
    }
    float _1148 = _1106;
    if (!_1024)
    {
        _1108 = _1018;
    }
    float _1150 = _1108;
    float _1152 = _1150;
    if (_1024)
    {
        float _1154 = _1140 * _1140;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = fma(_1144, _1144, _1148);
    float _1160 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1104);
    float _1162 = _1158 + _1156;
    float _1164 = _920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1168 = fma(_1122, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1166);
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    float _1172 = _920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1176 = rsqrt(_1162);
    float _1178 = -_1170;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1184 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1186 = _920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1182);
    float _1190 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = abs(_1180);
    float _1194 = log2(_1192);
    float _1196 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1198 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1200 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1202 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1196);
    float _1204 = -_1200;
    float _1206 = fma(_1204, _1004, 1.0);
    float _1208 = _1176 * _1132;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1214 = _1176 * _1144;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1218 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1160);
    float _1220 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1212);
    float _1222 = _1176 * _1140;
    float _1224 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1226 = -_1216;
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1226);
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1232 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1220);
    float _1234 = exp2(_1224);
    float _1236 = -_1222;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1228);
    float _1240 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1242 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1232);
    float _1244 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1246 = fma(_1238, -0.5, 0.5);
    float _1248 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1240);
    float _1250 = fma(_1238, 0.5, 0.5);
    float _1252 = log2(_1206);
    float _1254 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1244);
    float _1256 = _1214 + 1.0;
    float _1258 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1248);
    float _1260 = fma(_1250, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1262 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1254);
    float _1264 = 1.0 / _1242;
    float _1266 = -_1214;
    float _1268 = fma(_1234, _1256, _1266);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1258);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1262);
    float _1274 = fma(_1250, _1260, -0.212114393711090087890625);
    float _1276 = fma(_1268, 0.5, 0.5);
    float _1278 = sqrt(_1246);
    float _1280 = _1252 * 0.693147182464599609375;
    float _1282 = fma(_1250, _1274, 1.570728778839111328125);
    float _1284 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1286 = _1272 * _1264;
    float _1288 = _1270 * _1264;
    float _1290 = fma(_1286, -0.5, 0.5);
    float _1292 = fma(_1288, 0.5, 0.5);
    float _1294 = _1278 * 0.636619746685028076171875;
    float _1296 = -_1282;
    float _1298 = fma(_1294, _1296, 1.0);
    float3 _3865 = float3(_1292, _1290, _1284);
    float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3865, float3(0.0), isnan(_3865)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3865, float3(0.0), isnan(_3865)), level(0.0)).x;
    float3 _3876 = float3(_1292, _1290, _1284);
    float4 _1303 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).xyzw;
    float _1305 = _1303.x;
    float _1307 = _1303.y;
    float _1309 = _1303.z;
    float _1311 = _1303.w;
    float2 _3893 = float2(_1298, _1276);
    float3 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3893, float2(0.0), isnan(_3893)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3893, float2(0.0), isnan(_3893)), level(0.0)).xyz;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = in.m_51.w;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1327 = in.m_57.y;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1331 = _1329 != 0;
    float _1333 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = in.m_51.y;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1347 = _1345 != 0;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1351 = in.m_51.z;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1355 = _1353 != 0;
    float _1357 = in.m_51.x;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1361 = 1.0 / _1343;
    float _1363 = in.m_57.x;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    out.m_59.x = _794;
    out.m_59.y = _808;
    out.m_59.z = _786;
    bool _1367 = _1323 > 0.5;
    float _1369 = -_1327;
    float _1371 = _1369 + 1.0;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    out.m_61.x = _922;
    out.m_61.y = _920;
    out.m_61.z = _924;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1379 = _1339 > 0.5;
    float _1381 = 1.0 / _1377;
    bool _1383 = _1351 > 0.5;
    int _1385 = _1379 ? as_type<int>(_1371) : as_type<int>(_1327);
    int _1387 = _1383 ? as_type<int>(_1371) : as_type<int>(_1327);
    float _1389 = _1337 ? as_type<float>(_1385) : _1327;
    float _1391 = _1347 ? as_type<float>(_1387) : _1327;
    float _1393 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1395 = _1327;
    bool _1397 = _1331;
    float _1399 = _1389;
    float _1401 = _1339;
    if (_1331)
    {
        float _1403 = _1367 ? _1371 : _1327;
        _1395 = _1403;
    }
    float _1405 = _1395;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1413 = _1411 != 0;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1415;
    float _1419 = fma(_1393, -2.0, _1359);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1423 = _726 + _1421;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1427 = _1417 * _1381;
    float _1429 = _1409 * _1361;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1433 = _726 + _1431;
    bool _1435 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1437 = isnan(_726);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = fma(_1427, _1423, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1449 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1451 = fma(_1429, _1433, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1453 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1455 = fma(_1449, _1389, -0.5);
    bool _1457 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1459 = isnan(_726);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1473 = _1471 != 0;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1477 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1479 = -_1467;
    float _1481 = _1479 + 1.0;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    float _1487 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1475);
    float _1489 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1469);
    float _1491 = fma(_1391, _1477, -0.5);
    bool _1493 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1495 = isnan(_726);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = _1445 * _1481;
    float _1507 = -_1445;
    float _1509 = _1507 + 1.0;
    float _1511 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1487);
    float _1513 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1419);
    float _1515 = _1503 * _1509;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1519 = -_1513;
    float _1521 = fma(_1511, _1455, _1519);
    float _1523 = _1419;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    float _1527 = _1453;
    float _1529 = _1447;
    float _1531 = _1363;
    if (_1413)
    {
        _1523 = _1357;
    }
    float _1533 = _1523;
    float _1535 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1539 = _1533;
    if (_1355)
    {
        float _1541 = -_1363;
        float _1543 = _1541 + 1.0;
        _1525 = as_type<int>(_1543);
    }
    int _1545 = _1525;
    if (!_1413)
    {
        _1539 = _1351;
    }
    float _1547 = _1539;
    float _1549 = -_1517;
    float _1551 = fma(_1453, 2.0, _1549);
    if (_1355)
    {
        bool _1553 = _1357 > 0.5;
        _1397 = _1553;
    }
    bool _1555 = _1397;
    float _1557 = fma(_1535, _1405, -0.5);
    if (!_1355)
    {
        _1527 = _1363;
    }
    float _1559 = _1527;
    float _1561 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1563 = _1559;
    int _1565 = as_type<int>(_1561);
    if (_1355)
    {
        float _1567 = _1555 ? as_type<float>(_1545) : _1363;
        _1563 = _1567;
    }
    float _1569 = _1563;
    float _1571 = -_1503;
    float _1573 = _1571 + 1.0;
    float _1575 = -_1537;
    float _1577 = fma(_1561, 2.0, _1575);
    if (!_1413)
    {
        _1399 = _1339;
    }
    float _1579 = _1399;
    int _1581 = 0;
    float _1583 = _1579;
    if (_1473)
    {
        float _1585 = -_1363;
        float _1587 = _1585 + 1.0;
        _1581 = as_type<int>(_1587);
    }
    int _1589 = _1581;
    if (_1413)
    {
        _1583 = _1357;
    }
    float _1591 = _1583;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1595 = _1447 * _1515;
    float _1597 = _1595;
    if (_1485)
    {
        float _1599 = -_1363;
        float _1601 = _1599 + 1.0;
        _1565 = as_type<int>(_1601);
    }
    int _1603 = _1565;
    float _1605 = fma(_1591, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1593);
    float _1607 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1611 = _1607;
    if (!_1473)
    {
        _1529 = _1363;
    }
    float _1613 = _1529;
    float _1615 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1595);
    float _1617 = _1613;
    if (_1473)
    {
        float _1619 = _1383 ? as_type<float>(_1589) : _1363;
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = -_1609;
    float _1625 = fma(_1607, 2.0, _1623);
    if (_1413)
    {
        _1611 = _1351;
    }
    float _1627 = _1611;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1631 = _1627;
    if (!_1413)
    {
        _1631 = _1339;
    }
    float _1633 = _1631;
    float _1635 = fma(_1451, _1505, _1615);
    float _1637 = _1633;
    if (_1485)
    {
        float _1639 = _1379 ? as_type<float>(_1603) : _1363;
        _1531 = _1639;
    }
    float _1641 = _1531;
    float _1643 = -_124;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1551);
    float _1647 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1365);
    if (!_1413)
    {
        _1597 = _1351;
    }
    float _1649 = _1597;
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1653 = _1649;
    if (!_1413)
    {
        _1637 = _1351;
    }
    float _1655 = _1637;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1659 = _1655;
    if (_1413)
    {
        _1653 = _1339;
    }
    float _1661 = _1653;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1665 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1657);
    float _1667 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1647);
    float _1669 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1663);
    float _1671 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1675 = _1667 * (-0.15915493667125701904296875);
    if (_1413)
    {
        _1659 = _1339;
    }
    float _1677 = _1659;
    float _1679 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1373);
    if (!_1413)
    {
        _1401 = _1357;
    }
    float _1681 = _1401;
    float _1683 = fma(_1671, _1621, -0.5);
    float _1685 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1689 = _1675 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = fma(_1685, _1569, -0.5);
    float _1695 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1665);
    float _1697 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1699 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1605);
    float _1701 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    float _1703 = fma(_1695, _1693, _1645);
    float _1705 = _1675 * 6.283185482025146484375;
    float _1707 = cos(_1705);
    float _1709 = fma(_1697, -2.0, _1687);
    float _1711 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1713 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1717 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1709);
    float _1719 = fma(_1711, _1641, -0.5);
    float _1721 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1635);
    float _1723 = _1691 * _1491;
    float _1725 = fma(_1713, -2.0, _1715);
    float _1727 = -_1717;
    float _1729 = fma(_1701, _1557, _1727);
    float _1731 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1679);
    float _1733 = -_124;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1577);
    float _1737 = -_124;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1625);
    float _1741 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1725);
    bool _1743 = _986 > 0.0;
    bool _1745 = isnan(_986);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan(0.0);
    bool _1751 = _1747 || _1749;
    float _1753 = -_1723;
    float _1755 = fma(_1707, _1719, _1753);
    float _1757 = _1707 * _1491;
    float _1759 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1489);
    float _1761 = fma(_1731, _1755, _1735);
    float _1763 = fma(_1691, _1719, _1757);
    float _1765 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1333);
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1771 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1765);
    float _1773 = -_1741;
    float _1775 = fma(_1759, _1763, _1773);
    float _1777 = fma(_1699, _1683, _1739);
    float _1779 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1783 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1771);
    float _1785 = _1721 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1789 = _1761 + 0.5;
    float _1791 = _1703 + 0.5;
    float _1793 = exp2(_1781);
    float _1795 = _1775 + 0.5;
    float _1797 = _986 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1799 = _1783 + _1242;
    float _1801 = _1270 + _1242;
    float _1803 = _1242 * 0.5;
    float _1805 = _1777 + 0.5;
    float _1807 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1809 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1811 = _1521 + 0.5;
    float _1813 = _1729 + 0.5;
    float _1815 = _1799 * 0.5;
    float _1817 = _1801 * 0.5;
    float _1819 = fma(_1272, -0.5, _1803);
    float _1821 = -_1793;
    float _1823 = _1821 + 1.0;
    out.m_63.x = _1807;
    out.m_63.y = _1809;
    out.m_63.z = _1779;
    out.m_63.w = _1785;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1827 = _1797 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1791;
    out.m_65.y = _1811;
    out.m_65.z = _1805;
    out.m_65.w = _1813;
    out.m_67.x = _1789;
    out.m_67.y = _1795;
    out.gl_Position.x = _1270;
    out.gl_Position.y = _1272;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1242;
    out.m_69.x = _1817;
    out.m_69.y = _1819;
    out.m_69.z = _1815;
    out.m_69.w = _1242;
    out.m_45.x = _1827;
    float _1829 = _1825 * _1300;
    float _1831 = -_1825;
    float _1833 = _1831 + 1.0;
    float _1835 = _1311 * _1829;
    float _1837 = _1321 * _1829;
    float _1839 = _1311 * _1833;
    float _1841 = fma(_1317, _1835, _1305);
    float _1843 = fma(_1319, _1835, _1307);
    float _1845 = fma(_1311, _1837, _1309);
    out.m_71.x = _1841;
    out.m_71.y = _1843;
    out.m_71.z = _1845;
    out.m_71.w = _1839;
    if (_1751)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1847;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _718 = false;
    bool _576 = false;
    bool _286 = false;
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
        float _1904 = as_type<float>(_106);
        out.gl_Position.z = _1904;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1973 = as_type<float>(_142);
        out.gl_Position.z = _1973;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    bool _326 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_294);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    bool _338 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_294);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = 1.0 / _314;
    float _352 = -_348;
    float _354 = _352 + 1.0;
    bool _356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _358 = 1.0 / _318;
    float _360 = _298 * _324;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _364 = _294 + _362;
    float _366 = 1.0 / _322;
    float _368 = _302 * _350;
    bool _370 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _372 = isnan(_294);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -_380;
    float _384 = _382 + 1.0;
    float _386 = _306 * _358;
    float _388 = _364 * _366;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = _400 * _384;
    float _408 = -_400;
    float _410 = _408 + 1.0;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _412;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _416;
    float _420 = fma(_404, _360, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = _336 * _410;
    float _424 = -_336;
    float _426 = _424 + 1.0;
    float _428 = fma(_414, _360, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _430 = fma(_418, _360, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _432 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_294);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _348 * _426;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = _442 * _354;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _460;
    float _464 = fma(_452, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _466 = fma(_456, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _468 = _428 * _458;
    float _470 = _430 * _458;
    float _472 = _420 * _458;
    float _474 = -_442;
    float _476 = _474 + 1.0;
    float _478 = in.m_49.x;
    float _480 = in.m_49.y;
    float _482 = in.m_49.z;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].x, _468);
    float _494 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].y, _470);
    float _496 = fma(_448, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _498 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[143].z, _472);
    float _500 = fma(_486, _386, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _502 = fma(_462, _386, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = fma(_490, _386, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _506 = fma(_464, _444, _492);
    float _508 = fma(_466, _444, _494);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _522 = fma(_496, _444, _498);
    float _524 = fma(_512, _388, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _526 = fma(_516, _388, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _528 = fma(_520, _388, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _530 = fma(_500, _422, _506);
    float _532 = fma(_502, _422, _508);
    float _534 = fma(_504, _422, _522);
    float _536 = fma(_524, _406, _530);
    float _538 = fma(_526, _406, _532);
    float _540 = fma(_528, _406, _534);
    float _542 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].x, _536);
    float _544 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].y, _538);
    float _546 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].z, _540);
    float _548 = _542 * _478;
    float _550 = _544 * _480;
    float _552 = _546 * _482;
    bool _554 = !_356;
    float _556 = _472;
    float _574;
    if (!_554)
    {
        float _558 = in.m_51.x;
        float _560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _562 = _558 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _564 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _566 = _564 * _560;
        float _568 = floor(_566);
        float _570 = -_568;
        float _572 = _566 + _570;
        _574 = _572;
        _576 = true;
    }
    else
    {
        float _578 = float(_90);
        float _580 = 1.0 / _578;
        float _582 = _124 * _580;
        _574 = _582;
    }
    _576 = false;
    float _584 = _574;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _588 = _584 + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _590 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _594 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = isnan(_584);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _612 = isnan(_584);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _622;
    bool _626 = _584 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = isnan(_584);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = 1.0 / _592;
    float _640 = -_604;
    float _642 = _640 + 1.0;
    bool _644 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _646 = _620 * _642;
    float _648 = -_620;
    float _650 = _648 + 1.0;
    float _652 = 1.0 / _608;
    float _654 = _624 * _638;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _660 = fma(_654, _588, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _662 = _658 * _652;
    float _664 = _660 * _646;
    float _666 = -_636;
    float _668 = _666 + 1.0;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _584 + _670;
    float _674 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    float _676 = _604 * _668;
    float _678 = fma(_662, _672, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_678, _676, _674);
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[117].x, _682);
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _688 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _690;
    out.m_53.y = _692;
    out.m_53.z = _694;
    out.m_53.w = _696;
    bool _698 = !_644;
    float _716;
    if (!_698)
    {
        float _700 = in.m_51.x;
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        float _720 = float(_90);
        float _722 = 1.0 / _720;
        float _724 = _124 * _722;
        _716 = _724;
    }
    _718 = false;
    float _726 = _716;
    float _728 = in.m_55.x;
    float _730 = in.m_55.y;
    float _732 = in.m_55.z;
    float _734 = _550 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _736 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _740 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _742 = isnan(0.5);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _748 = _744 || _746;
    float _750 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _728);
    float _754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    float _756 = _734 * _750;
    float _758 = _736 * _752;
    float _760 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _762 = _738 * _754;
    float _764 = _756 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _766 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _768 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _760);
    float _770 = _756 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _772 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[26].x, _764);
    float _774 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _766);
    float _776 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _768);
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[24].x, _770);
    float _780 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].z, _772);
    float _782 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _784 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _774);
    float _786 = _776 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].z, _778);
    float _790 = _780 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _792 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _782);
    float _794 = _784 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _796 = _788 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _798 = _786 + _790;
    float _800 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _802 = _794 + _796;
    float _804 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _806 = _798 + _804;
    float _808 = _800 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _812 = _802 + _810;
    float _814 = _806 * _806;
    float _816 = _808 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _818 = fma(_812, _812, _814);
    float _820 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _816);
    float _822 = sqrt(_818);
    float _824 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[11].z, _820);
    float _826 = _808 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _828 = _824 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _830 = _756 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _832 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _826);
    float _834 = 1.0 / _828;
    float _836 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[25].x, _830);
    float _838 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[10].z, _832);
    float _840 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].z, _836);
    float _842 = _838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _844 = _822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _846 = _840 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = _842 + _828;
    float _850 = _808 + _846;
    float _852 = _848 * _834;
    float _854 = _852 * 0.5;
    float _856 = _848;
    float _858 = _846;
    float _860 = _762;
    float _862 = _840;
    float _864 = _828;
    if (_748)
    {
        _856 = 1.0;
    }
    float _866 = _856;
    float _868 = _866;
    if (!_844)
    {
        _858 = _802;
    }
    float _870 = _858;
    float _872 = _870;
    if (!_844)
    {
        _860 = _798;
    }
    float _874 = _860;
    float _876 = _874;
    if (!_844)
    {
        _862 = _850;
    }
    float _878 = _862;
    bool _880 = !_844;
    float _882 = _878;
    if (!_880)
    {
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _888 = _822 + _886;
        float _890 = _850 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = rsqrt(_818);
        float _894 = _888 * _884;
        float _896 = _894 * 0.15915493667125701904296875;
        float _898 = _896 * 6.283185482025146484375;
        float _900 = cos(_898);
        float _902 = _896 * 6.283185482025146484375;
        float _904 = sin(_902);
        float _906 = _900 + (-1.0);
        float _908 = _906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _910 = fma(_904, _890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = fma(_850, _900, _908);
        float _914 = _892 * _910;
        float _916 = fma(_812, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _918 = fma(_806, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _882 = _912;
        _872 = _916;
        _876 = _918;
    }
    float _920 = _882;
    float _922 = _872;
    float _924 = _876;
    if (!_748)
    {
        float _926 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _928 = _926 * 0.15915493667125701904296875;
        float _930 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _934 = fma(_854, (*spvDescriptorSet0.vp_c8)._m0[30].w, _932);
        float _936 = _928 * 6.283185482025146484375;
        float _938 = cos(_936);
        float _940 = _930 * 0.15915493667125701904296875;
        float _942 = _928 * 6.283185482025146484375;
        float _944 = sin(_942);
        float _946 = 1.0 / _938;
        float _948 = _940 * 6.283185482025146484375;
        float _950 = cos(_948);
        float _952 = _944 * _946;
        float _954 = _940 * 6.283185482025146484375;
        float _956 = sin(_954);
        float _958 = _950 * _952;
        float _960 = 1.0 / _934;
        float _962 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _964 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _962;
        float _966 = 1.0 / _958;
        float _968 = 1.0 / _964;
        float _970 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _972 = _960 * _970;
        float _974 = _956 * _966;
        float _976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _978 = fma(_974, _972, _976);
        float _980 = _978 * _968;
        float _982 = precise::clamp(_980, 0.0, 1.0);
        _864 = _968;
        _868 = _982;
    }
    float _984 = _864;
    float _986 = _868;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _990 = _920 + _988;
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _994 = _922 + _992;
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _998 = _924 + _996;
    float _1000 = _990 * _990;
    float _1002 = fma(_994, _994, _1000);
    float _1004 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1006 = fma(_998, _998, _1002);
    float _1008 = rsqrt(_1006);
    float _1010 = _1008 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1012 = _994 * _1010;
    float _1014 = _998 * _1010;
    float _1016 = _1012 * _1012;
    float _1018 = _1014 * _1014;
    float _1020 = _1016 + _1018;
    float _1022 = sqrt(_1020);
    bool _1024 = _1022 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1028 = _1022 + _1026;
    float _1030 = _806;
    float _1032 = _1020;
    float _1034 = _1028;
    float _1036 = _990;
    float _1038 = _1012;
    if (_1024)
    {
        float _1040 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1030 = _1040;
    }
    float _1042 = _1030;
    if (_1024)
    {
        float _1044 = rsqrt(_1020);
        _1032 = _1044;
    }
    float _1046 = _1032;
    float _1048 = _1042;
    if (_1024)
    {
        float _1050 = _1028 * _1042;
        _1034 = _1050;
    }
    float _1052 = _1034;
    if (_1024)
    {
        float _1054 = _1052 * 0.15915493667125701904296875;
        _1048 = _1054;
    }
    float _1056 = _1048;
    float _1058 = _998;
    float _1060 = _1056;
    if (_1024)
    {
        float _1062 = _1056 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        _1058 = _1064;
    }
    float _1066 = _1058;
    float _1068 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1070 = precise::max(0.0, _1068);
    float _1072 = _984;
    float _1074 = _1070;
    if (_1024)
    {
        float _1076 = _1056 * 6.283185482025146484375;
        float _1078 = cos(_1076);
        _1072 = _1078;
    }
    float _1080 = _1072;
    float _1082 = -_1010;
    float _1084 = -_1070;
    float _1086 = fma(_990, _1082, _1084);
    if (_1024)
    {
        float _1088 = _1086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1036 = _1088;
    }
    float _1090 = _1036;
    float _1092 = _1090;
    float _1094 = _1066;
    if (_1024)
    {
        float _1096 = fma(_1066, _1090, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1092 = _1096;
    }
    float _1098 = _1092;
    float _1100 = _1098;
    if (!_1024)
    {
        _1094 = _1016;
    }
    float _1102 = _1094;
    float _1104 = _920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1106 = _1102;
    float _1108 = _1080;
    if (_1024)
    {
        float _1110 = _1080 + (-1.0);
        _1074 = _1110;
    }
    float _1112 = _1074;
    float _1114 = _1112;
    if (_1024)
    {
        float _1116 = _1046 * _1098;
        _556 = _1116;
    }
    float _1118 = _556;
    if (!_1024)
    {
        _1100 = _1086;
    }
    float _1120 = _1100;
    float _1122 = sqrt(_1006);
    float _1124 = _1120;
    if (_1024)
    {
        float _1126 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1126;
    }
    float _1128 = _1060;
    if (_1024)
    {
        float _1130 = _1012 * _1118;
        _1038 = _1130;
    }
    float _1132 = _1038;
    if (!_1024)
    {
        _1114 = _1014;
    }
    float _1134 = _1114;
    float _1136 = _1134;
    if (_1024)
    {
        float _1138 = _1014 * _1118;
        _1136 = _1138;
    }
    float _1140 = _1136;
    if (_1024)
    {
        float _1142 = fma(_1086, _1080, _1128);
        _1124 = _1142;
    }
    float _1144 = _1124;
    if (_1024)
    {
        float _1146 = _1132 * _1132;
        _1106 = _1146;
    }
    float _1148 = _1106;
    if (!_1024)
    {
        _1108 = _1018;
    }
    float _1150 = _1108;
    float _1152 = _1150;
    if (_1024)
    {
        float _1154 = _1140 * _1140;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = fma(_1144, _1144, _1148);
    float _1160 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1104);
    float _1162 = _1158 + _1156;
    float _1164 = _920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1168 = fma(_1122, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1166);
    float _1170 = precise::clamp(_1168, 0.0, 1.0);
    float _1172 = _920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1174 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1176 = rsqrt(_1162);
    float _1178 = -_1170;
    float _1180 = _1178 + 1.0;
    float _1182 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1172);
    float _1184 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1186 = _920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1188 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1182);
    float _1190 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = abs(_1180);
    float _1194 = log2(_1192);
    float _1196 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1186);
    float _1198 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1200 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1202 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1196);
    float _1204 = -_1200;
    float _1206 = fma(_1204, _1004, 1.0);
    float _1208 = _1176 * _1132;
    float _1210 = _1202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1212 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1214 = _1176 * _1144;
    float _1216 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1218 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1160);
    float _1220 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1212);
    float _1222 = _1176 * _1140;
    float _1224 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1226 = -_1216;
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1226);
    float _1230 = _1218 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1232 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1220);
    float _1234 = exp2(_1224);
    float _1236 = -_1222;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1228);
    float _1240 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1242 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1232);
    float _1244 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1246 = fma(_1238, -0.5, 0.5);
    float _1248 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1240);
    float _1250 = fma(_1238, 0.5, 0.5);
    float _1252 = log2(_1206);
    float _1254 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1244);
    float _1256 = _1214 + 1.0;
    float _1258 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1248);
    float _1260 = fma(_1250, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1262 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1254);
    float _1264 = 1.0 / _1242;
    float _1266 = -_1214;
    float _1268 = fma(_1234, _1256, _1266);
    float _1270 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1258);
    float _1272 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1262);
    float _1274 = fma(_1250, _1260, -0.212114393711090087890625);
    float _1276 = fma(_1268, 0.5, 0.5);
    float _1278 = sqrt(_1246);
    float _1280 = _1252 * 0.693147182464599609375;
    float _1282 = fma(_1250, _1274, 1.570728778839111328125);
    float _1284 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1286 = _1272 * _1264;
    float _1288 = _1270 * _1264;
    float _1290 = fma(_1286, -0.5, 0.5);
    float _1292 = fma(_1288, 0.5, 0.5);
    float _1294 = _1278 * 0.636619746685028076171875;
    float _1296 = -_1282;
    float _1298 = fma(_1294, _1296, 1.0);
    float3 _3865 = float3(_1292, _1290, _1284);
    float _1300 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3865, float3(0.0), isnan(_3865)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3865, float3(0.0), isnan(_3865)), level(0.0)).x;
    float3 _3876 = float3(_1292, _1290, _1284);
    float4 _1303 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3876, float3(0.0), isnan(_3876)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3876, float3(0.0), isnan(_3876)), level(0.0)).xyzw;
    float _1305 = _1303.x;
    float _1307 = _1303.y;
    float _1309 = _1303.z;
    float _1311 = _1303.w;
    float2 _3893 = float2(_1298, _1276);
    float3 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3893, float2(0.0), isnan(_3893)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3893, float2(0.0), isnan(_3893)), level(0.0)).xyz;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = in.m_51.w;
    float _1325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1327 = in.m_57.y;
    int _1329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1331 = _1329 != 0;
    float _1333 = _1198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1337 = _1335 != 0;
    float _1339 = in.m_51.y;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1347 = _1345 != 0;
    float _1349 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1351 = in.m_51.z;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1355 = _1353 != 0;
    float _1357 = in.m_51.x;
    float _1359 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1361 = 1.0 / _1343;
    float _1363 = in.m_57.x;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    out.m_59.x = _794;
    out.m_59.y = _808;
    out.m_59.z = _786;
    bool _1367 = _1323 > 0.5;
    float _1369 = -_1327;
    float _1371 = _1369 + 1.0;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    out.m_61.x = _922;
    out.m_61.y = _920;
    out.m_61.z = _924;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1379 = _1339 > 0.5;
    float _1381 = 1.0 / _1377;
    bool _1383 = _1351 > 0.5;
    int _1385 = _1379 ? as_type<int>(_1371) : as_type<int>(_1327);
    int _1387 = _1383 ? as_type<int>(_1371) : as_type<int>(_1327);
    float _1389 = _1337 ? as_type<float>(_1385) : _1327;
    float _1391 = _1347 ? as_type<float>(_1387) : _1327;
    float _1393 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1395 = _1327;
    bool _1397 = _1331;
    float _1399 = _1389;
    float _1401 = _1339;
    if (_1331)
    {
        float _1403 = _1367 ? _1371 : _1327;
        _1395 = _1403;
    }
    float _1405 = _1395;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1413 = _1411 != 0;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1415;
    float _1419 = fma(_1393, -2.0, _1359);
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1423 = _726 + _1421;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1427 = _1417 * _1381;
    float _1429 = _1409 * _1361;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1433 = _726 + _1431;
    bool _1435 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1437 = isnan(_726);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    float _1447 = fma(_1427, _1423, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1449 = _1325 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1451 = fma(_1429, _1433, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1453 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1455 = fma(_1449, _1389, -0.5);
    bool _1457 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1459 = isnan(_726);
    bool _1461 = _1457 || _1459;
    bool _1463 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1465 = _1461 || _1463;
    float _1467 = float(_1465);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1473 = _1471 != 0;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1477 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1479 = -_1467;
    float _1481 = _1479 + 1.0;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    float _1487 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1475);
    float _1489 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1469);
    float _1491 = fma(_1391, _1477, -0.5);
    bool _1493 = _726 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1495 = isnan(_726);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = _1445 * _1481;
    float _1507 = -_1445;
    float _1509 = _1507 + 1.0;
    float _1511 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1487);
    float _1513 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1419);
    float _1515 = _1503 * _1509;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1519 = -_1513;
    float _1521 = fma(_1511, _1455, _1519);
    float _1523 = _1419;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].x);
    float _1527 = _1453;
    float _1529 = _1447;
    float _1531 = _1363;
    if (_1413)
    {
        _1523 = _1357;
    }
    float _1533 = _1523;
    float _1535 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1539 = _1533;
    if (_1355)
    {
        float _1541 = -_1363;
        float _1543 = _1541 + 1.0;
        _1525 = as_type<int>(_1543);
    }
    int _1545 = _1525;
    if (!_1413)
    {
        _1539 = _1351;
    }
    float _1547 = _1539;
    float _1549 = -_1517;
    float _1551 = fma(_1453, 2.0, _1549);
    if (_1355)
    {
        bool _1553 = _1357 > 0.5;
        _1397 = _1553;
    }
    bool _1555 = _1397;
    float _1557 = fma(_1535, _1405, -0.5);
    if (!_1355)
    {
        _1527 = _1363;
    }
    float _1559 = _1527;
    float _1561 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1563 = _1559;
    int _1565 = as_type<int>(_1561);
    if (_1355)
    {
        float _1567 = _1555 ? as_type<float>(_1545) : _1363;
        _1563 = _1567;
    }
    float _1569 = _1563;
    float _1571 = -_1503;
    float _1573 = _1571 + 1.0;
    float _1575 = -_1537;
    float _1577 = fma(_1561, 2.0, _1575);
    if (!_1413)
    {
        _1399 = _1339;
    }
    float _1579 = _1399;
    int _1581 = 0;
    float _1583 = _1579;
    if (_1473)
    {
        float _1585 = -_1363;
        float _1587 = _1585 + 1.0;
        _1581 = as_type<int>(_1587);
    }
    int _1589 = _1581;
    if (_1413)
    {
        _1583 = _1357;
    }
    float _1591 = _1583;
    float _1593 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1595 = _1447 * _1515;
    float _1597 = _1595;
    if (_1485)
    {
        float _1599 = -_1363;
        float _1601 = _1599 + 1.0;
        _1565 = as_type<int>(_1601);
    }
    int _1603 = _1565;
    float _1605 = fma(_1591, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1593);
    float _1607 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1611 = _1607;
    if (!_1473)
    {
        _1529 = _1363;
    }
    float _1613 = _1529;
    float _1615 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1595);
    float _1617 = _1613;
    if (_1473)
    {
        float _1619 = _1383 ? as_type<float>(_1589) : _1363;
        _1617 = _1619;
    }
    float _1621 = _1617;
    float _1623 = -_1609;
    float _1625 = fma(_1607, 2.0, _1623);
    if (_1413)
    {
        _1611 = _1351;
    }
    float _1627 = _1611;
    float _1629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1631 = _1627;
    if (!_1413)
    {
        _1631 = _1339;
    }
    float _1633 = _1631;
    float _1635 = fma(_1451, _1505, _1615);
    float _1637 = _1633;
    if (_1485)
    {
        float _1639 = _1379 ? as_type<float>(_1603) : _1363;
        _1531 = _1639;
    }
    float _1641 = _1531;
    float _1643 = -_124;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1551);
    float _1647 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1365);
    if (!_1413)
    {
        _1597 = _1351;
    }
    float _1649 = _1597;
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1653 = _1649;
    if (!_1413)
    {
        _1637 = _1351;
    }
    float _1655 = _1637;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1659 = _1655;
    if (_1413)
    {
        _1653 = _1339;
    }
    float _1661 = _1653;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1665 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1657);
    float _1667 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1647);
    float _1669 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1663);
    float _1671 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1675 = _1667 * (-0.15915493667125701904296875);
    if (_1413)
    {
        _1659 = _1339;
    }
    float _1677 = _1659;
    float _1679 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1373);
    if (!_1413)
    {
        _1401 = _1357;
    }
    float _1681 = _1401;
    float _1683 = fma(_1671, _1621, -0.5);
    float _1685 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1687 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1689 = _1675 * 6.283185482025146484375;
    float _1691 = sin(_1689);
    float _1693 = fma(_1685, _1569, -0.5);
    float _1695 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1665);
    float _1697 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1699 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1605);
    float _1701 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1669);
    float _1703 = fma(_1695, _1693, _1645);
    float _1705 = _1675 * 6.283185482025146484375;
    float _1707 = cos(_1705);
    float _1709 = fma(_1697, -2.0, _1687);
    float _1711 = _1673 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1713 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1717 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1709);
    float _1719 = fma(_1711, _1641, -0.5);
    float _1721 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1635);
    float _1723 = _1691 * _1491;
    float _1725 = fma(_1713, -2.0, _1715);
    float _1727 = -_1717;
    float _1729 = fma(_1701, _1557, _1727);
    float _1731 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1679);
    float _1733 = -_124;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1577);
    float _1737 = -_124;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1625);
    float _1741 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1725);
    bool _1743 = _986 > 0.0;
    bool _1745 = isnan(_986);
    bool _1747 = _1743 || _1745;
    bool _1749 = isnan(0.0);
    bool _1751 = _1747 || _1749;
    float _1753 = -_1723;
    float _1755 = fma(_1707, _1719, _1753);
    float _1757 = _1707 * _1491;
    float _1759 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1489);
    float _1761 = fma(_1731, _1755, _1735);
    float _1763 = fma(_1691, _1719, _1757);
    float _1765 = fma(_1210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1333);
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1771 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1765);
    float _1773 = -_1741;
    float _1775 = fma(_1759, _1763, _1773);
    float _1777 = fma(_1699, _1683, _1739);
    float _1779 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1781 = _1194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1783 = fma(_1230, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1771);
    float _1785 = _1721 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1789 = _1761 + 0.5;
    float _1791 = _1703 + 0.5;
    float _1793 = exp2(_1781);
    float _1795 = _1775 + 0.5;
    float _1797 = _986 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1799 = _1783 + _1242;
    float _1801 = _1270 + _1242;
    float _1803 = _1242 * 0.5;
    float _1805 = _1777 + 0.5;
    float _1807 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1809 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1811 = _1521 + 0.5;
    float _1813 = _1729 + 0.5;
    float _1815 = _1799 * 0.5;
    float _1817 = _1801 * 0.5;
    float _1819 = fma(_1272, -0.5, _1803);
    float _1821 = -_1793;
    float _1823 = _1821 + 1.0;
    out.m_63.x = _1807;
    out.m_63.y = _1809;
    out.m_63.z = _1779;
    out.m_63.w = _1785;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1827 = _1797 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1791;
    out.m_65.y = _1811;
    out.m_65.z = _1805;
    out.m_65.w = _1813;
    out.m_67.x = _1789;
    out.m_67.y = _1795;
    out.gl_Position.x = _1270;
    out.gl_Position.y = _1272;
    out.gl_Position.z = _1783;
    out.gl_Position.w = _1242;
    out.m_69.x = _1817;
    out.m_69.y = _1819;
    out.m_69.z = _1815;
    out.m_69.w = _1242;
    out.m_45.x = _1827;
    float _1829 = _1825 * _1300;
    float _1831 = -_1825;
    float _1833 = _1831 + 1.0;
    float _1835 = _1311 * _1829;
    float _1837 = _1321 * _1829;
    float _1839 = _1311 * _1833;
    float _1841 = fma(_1317, _1835, _1305);
    float _1843 = fma(_1319, _1835, _1307);
    float _1845 = fma(_1311, _1837, _1309);
    out.m_71.x = _1841;
    out.m_71.y = _1843;
    out.m_71.z = _1845;
    out.m_71.w = _1839;
    if (_1751)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1847 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1847;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

