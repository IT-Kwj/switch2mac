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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_73 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1671 = false;
    bool _642 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1956 = as_type<float>(_114);
        out.gl_Position.z = _1956;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
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
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_150);
        out.gl_Position.z = _2025;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _338;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _342;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _306 * _360;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _388;
    float _392 = fma(_370, _382, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = _322 * _374;
    float _400 = _392 * _376;
    float _402 = _394 * _376;
    float _404 = _396 * _376;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _418 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].x, _400);
    float _420 = fma(_408, _398, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _422 = fma(_412, _398, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _424 = fma(_416, _398, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _426 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _428 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _430 = fma(_420, _362, _418);
    float _432 = fma(_422, _362, _426);
    float _434 = fma(_424, _362, _428);
    float _436 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].x, _430);
    float _438 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].y, _432);
    float _440 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].z, _434);
    bool _442 = !_372;
    float _460;
    if (!_442)
    {
        float _444 = in.m_53.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_98);
        float _466 = 1.0 / _464;
        float _468 = _132 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _500 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_470);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    bool _522 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_470);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _510 * _516;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _542 = 1.0 / _494;
    float _544 = _532 * _538;
    float _546 = -_532;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _498;
    float _552 = _520 * _512;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _542;
    bool _562 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _564 = isnan(_470);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _470 + _578;
    float _582 = _558 * _544;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _586 = _470 + _584;
    float _588 = -_572;
    float _590 = _588 + 1.0;
    float _592 = fma(_560, _580, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _594 = _576 * _550;
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _598 = _490 * _590;
    float _600 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = fma(_594, _586, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _604 = fma(_592, _534, _596);
    float _606 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = fma(_602, _598, _604);
    float _612 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[118].x, _610);
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _608;
    out.m_55.y = _618;
    out.m_55.z = _614;
    out.m_55.w = _620;
    bool _622 = !_540;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_98);
        float _646 = 1.0 / _644;
        float _648 = _132 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _656 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _660 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _654);
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _664 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _666 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    float _668 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _662);
    float _670 = _664 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _672 = _666 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = _668 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _678 = _670 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _682 = _672 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _686 = _674 + _684;
    float _688 = _678 * _678;
    float _690 = fma(_682, _682, _688);
    float _692 = fma(_686, _686, _690);
    float _694 = rsqrt(_692);
    float _696 = _678 * _694;
    float _698 = _682 * _694;
    float _700 = _686 * _694;
    float _702 = -_696;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _706 = -_698;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _710 = -_700;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _714 = _704 * _704;
    float _716 = in.m_51.x;
    float _718 = in.m_51.y;
    float _720 = in.m_51.z;
    float _722 = fma(_708, _708, _714);
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = in.m_57.z;
    float _730 = fma(_712, _712, _722);
    float _732 = sqrt(_730);
    float _734 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _736 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = _694 * _732;
    float _740 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _746 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = _742 * _738;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _754 = _746 * _738;
    float _756 = _748 * _738;
    float _758 = _750 * _744;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _762 = _754 * _752;
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _766 = _756 * _760;
    float _768 = _758 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].x, _764);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].x, _768);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[10].z, _770);
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[8].z, _772);
    float _778 = _674 + _774;
    float _780 = _672 + _776;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _784 = _778 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _788 = _780 + _786;
    float _790 = _784 * _784;
    float _792 = fma(_788, _788, _790);
    float _794 = _758 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _796 = sqrt(_792);
    float _798 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].x, _794);
    float _800 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[9].z, _798);
    float _802 = _670 + _800;
    bool _804 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = _766;
    float _808 = _800;
    float _810 = _756;
    float _812 = _738;
    float _814 = _796;
    float _816 = _802;
    float _818 = _726;
    if (!_804)
    {
        _806 = _780;
    }
    float _820 = _806;
    float _822 = _820;
    if (!_804)
    {
        _808 = _778;
    }
    float _824 = _808;
    float _826 = _824;
    if (!_804)
    {
        _810 = _802;
    }
    float _828 = _810;
    bool _830 = !_804;
    float _832 = _828;
    if (!_830)
    {
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _838 = _796 + _836;
        float _840 = rsqrt(_792);
        float _842 = _838 * _834;
        float _844 = _802 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = _842 * 0.15915493667125701904296875;
        float _848 = _846 * 6.283185482025146484375;
        float _850 = cos(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        float _856 = _850 + (-1.0);
        float _858 = _856 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = fma(_854, _844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _862 = fma(_802, _850, _858);
        float _864 = _840 * _860;
        float _866 = fma(_788, _864, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _868 = fma(_784, _864, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _832 = _862;
        _822 = _866;
        _826 = _868;
        _812 = _846;
        _814 = _864;
    }
    float _870 = _832;
    float _872 = _822;
    float _874 = _826;
    float _876 = _812;
    float _878 = _814;
    float _880 = -_696;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _884 = -_698;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _888 = -_700;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _894 = _882 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _898 = _886 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _902 = _890 + _900;
    float _904 = _894 * _894;
    float _906 = fma(_898, _898, _904);
    float _908 = fma(_902, _902, _906);
    float _910 = rsqrt(_908);
    float _912 = sqrt(_908);
    float _914 = _910 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _916 = _898 * _914;
    float _918 = _902 * _914;
    float _920 = _916 * _916;
    float _922 = _918 * _918;
    float _924 = _920 + _922;
    float _926 = sqrt(_924);
    bool _928 = _926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _932 = _926 + _930;
    float _934 = _876;
    float _936 = _932;
    float _938 = _894;
    float _940 = _914;
    float _942 = _916;
    if (_928)
    {
        float _944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _934 = _944;
    }
    float _946 = _934;
    float _948 = _946;
    if (_928)
    {
        float _950 = _932 * _946;
        _936 = _950;
    }
    float _952 = _936;
    if (_928)
    {
        float _954 = rsqrt(_924);
        _948 = _954;
    }
    float _956 = _948;
    float _958 = _956;
    if (_928)
    {
        float _960 = _952 * 0.15915493667125701904296875;
        _816 = _960;
    }
    float _962 = _816;
    float _964 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _966 = _902;
    if (_928)
    {
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = precise::max(0.0, _964);
    float _976 = _878;
    float _978 = _974;
    if (_928)
    {
        float _980 = _962 * 6.283185482025146484375;
        float _982 = cos(_980);
        _976 = _982;
    }
    float _984 = _976;
    float _986 = -_914;
    float _988 = -_974;
    float _990 = fma(_894, _986, _988);
    if (_928)
    {
        float _992 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _938 = _992;
    }
    float _994 = _938;
    float _996 = _972;
    float _998 = _994;
    if (_928)
    {
        float _1000 = fma(_972, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _996 = _1000;
    }
    float _1002 = _996;
    float _1004 = _1002;
    if (!_928)
    {
        _998 = _990;
    }
    float _1006 = _998;
    float _1008 = _1006;
    if (_928)
    {
        float _1010 = _956 * _1002;
        _940 = _1010;
    }
    float _1012 = _940;
    if (!_928)
    {
        _1004 = _920;
    }
    float _1014 = _1004;
    float _1016 = _1014;
    float _1018 = _984;
    if (_928)
    {
        float _1020 = _984 + (-1.0);
        _978 = _1020;
    }
    float _1022 = _978;
    float _1024 = _1022;
    if (_928)
    {
        float _1026 = _916 * _1012;
        _942 = _1026;
    }
    float _1028 = _942;
    if (_928)
    {
        float _1030 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _1030;
    }
    float _1032 = _958;
    if (!_928)
    {
        _1024 = _918;
    }
    float _1034 = _1024;
    float _1036 = _1034;
    if (_928)
    {
        float _1038 = _918 * _1012;
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (_928)
    {
        float _1042 = _1028 * _1028;
        _1016 = _1042;
    }
    float _1044 = _1016;
    if (_928)
    {
        float _1046 = fma(_990, _984, _1032);
        _1008 = _1046;
    }
    float _1048 = _1008;
    if (!_928)
    {
        _1018 = _922;
    }
    float _1050 = _1018;
    float _1052 = _1050;
    if (_928)
    {
        float _1054 = _1040 * _1040;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _882 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1060 = fma(_1048, _1048, _1044);
    float _1062 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1058);
    float _1064 = _1060 + _1056;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1068 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1066);
    float _1070 = precise::clamp(_1068, 0.0, 1.0);
    float _1072 = _882 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1062);
    float _1076 = rsqrt(_1064);
    float _1078 = -_1070;
    float _1080 = _1078 + 1.0;
    float _1082 = _882 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1084 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1086 = _882 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1088 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1090 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1082);
    float _1092 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1084);
    float _1094 = abs(_1080);
    float _1096 = log2(_1094);
    float _1098 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1086);
    float _1100 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1090);
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1104 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1106 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1098);
    float _1108 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1110 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1112 = _1076 * _1028;
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1116 = -_1104;
    float _1118 = fma(_1116, _1102, 1.0);
    float _1120 = _1076 * _1048;
    float _1122 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1126 = _1076 * _1040;
    float _1128 = _1120 + 1.0;
    float _1130 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1132 = -_1124;
    float _1134 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1132);
    float _1136 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1138 = log2(_1118);
    float _1140 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1130);
    float _1142 = -_1126;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1134);
    float _1146 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1148 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1152 = fma(_1144, -0.5, 0.5);
    float _1154 = fma(_1144, 0.5, 0.5);
    float _1156 = exp2(_1136);
    float _1158 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1146);
    float _1160 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1148);
    float _1162 = fma(_1154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1164 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1158);
    float _1166 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1168 = fma(_1154, _1162, -0.212114393711090087890625);
    float _1170 = 1.0 / _1150;
    float _1172 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1164);
    float _1174 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1166);
    float _1176 = _1138 * 0.693147182464599609375;
    float _1178 = fma(_1154, _1168, 1.570728778839111328125);
    float _1180 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1182 = sqrt(_1152);
    float _1184 = -_1120;
    float _1186 = fma(_1156, _1128, _1184);
    float _1188 = _1172 * _1170;
    float _1190 = _1174 * _1170;
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = fma(_1190, -0.5, 0.5);
    float _1196 = _1182 * 0.636619746685028076171875;
    float3 _3735 = float3(_1192, _1194, _1180);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3735, float3(0.0), isnan(_3735)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3735, float3(0.0), isnan(_3735)), level(0.0)).x;
    float _1200 = -_1178;
    float _1202 = fma(_1196, _1200, 1.0);
    float _1204 = fma(_1186, 0.5, 0.5);
    float3 _3753 = float3(_1192, _1194, _1180);
    float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3753, float3(0.0), isnan(_3753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3753, float3(0.0), isnan(_3753)), level(0.0)).xyzw;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = _1207.w;
    float2 _3770 = float2(_1202, _1204);
    float3 _1219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3770, float2(0.0), isnan(_3770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3770, float2(0.0), isnan(_3770)), level(0.0)).xyz;
    float _1221 = _1219.x;
    float _1223 = _1219.y;
    float _1225 = _1219.z;
    float _1227 = in.m_53.y;
    float _1229 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1233 = _1231 != 0;
    float _1235 = in.m_59.y;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1239 = _1237 != 0;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1249 = in.m_61.x;
    float _1251 = 1.0 / _1243;
    float _1253 = in.m_61.y;
    float _1255 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1229);
    float _1257 = _1180;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1261 = _1150;
    float _1263 = _1174;
    float _1265 = _1172;
    if (_1233)
    {
        float _1267 = in.m_53.x;
        _1257 = _1267;
    }
    float _1269 = _1257;
    float _1271 = 1.0 / _1247;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1275 = _650 + _1273;
    float _1277 = in.m_61.z;
    float _1279 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1255);
    bool _1281 = _1227 > 0.5;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1285 = _650 + _1283;
    float _1287 = in.m_61.w;
    float _1289 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1291 = -_1235;
    float _1293 = _1291 + 1.0;
    float _1295 = _1285 * _1251;
    float _1297 = in.m_59.x;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1299;
    float _1303 = _1275 * _1271;
    float _1305 = _1235;
    float _1307 = _1289;
    if (_1239)
    {
        float _1309 = _1281 ? _1293 : _1235;
        _1305 = _1309;
    }
    float _1311 = _1305;
    float _1313 = in.m_63.x;
    float _1315 = in.m_63.y;
    float _1317 = in.m_63.z;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1319;
    bool _1323 = _726 != 0.0;
    bool _1325 = isnan(_726);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(0.0);
    bool _1331 = _1327 || _1329;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1333;
    out.m_65.x = _1249;
    bool _1337 = _1269 > 0.5;
    bool _1339 = _1337 && _1233;
    float _1341 = fma(_1301, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1343 = _724 == 0.0;
    bool _1345 = !_1331;
    bool _1347 = _1343 && _1345;
    out.m_65.y = _1253;
    bool _1349 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1351 = isnan(_650);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = fma(_1335, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1363 = _728 == 0.0;
    bool _1365 = _1363 && _1347;
    float _1367 = fma(_1321, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1369 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1371 = isnan(_650);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    out.m_65.z = _1277;
    bool _1381 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1383 = isnan(_650);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1397 = -_1379;
    float _1399 = _1397 + 1.0;
    out.m_65.w = _1287;
    float _1401 = fma(_1395, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1407 = _1359 * _1399;
    float _1409 = -_1359;
    float _1411 = _1409 + 1.0;
    float _1413 = _1315;
    float _1415 = _1317;
    float _1417 = _1313;
    if (!_1365)
    {
        float _1419 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1315);
        _1413 = _1419;
    }
    float _1421 = _1413;
    if (!_1365)
    {
        float _1423 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1317);
        _1415 = _1423;
    }
    float _1425 = _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1431 = _1391 * _1411;
    float _1433 = -_1391;
    float _1435 = _1433 + 1.0;
    if (_1233)
    {
        _1259 = _1297;
    }
    float _1437 = _1259;
    float _1439 = _1437;
    if (!_1365)
    {
        float _1441 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1313);
        _1417 = _1441;
    }
    float _1443 = _1417;
    float _1445 = _1341 * _1431;
    if (!_1233)
    {
        _818 = _1297;
    }
    float _1447 = _818;
    float _1449 = _1367 * _1431;
    float _1451 = _1361 * _1431;
    float _1453 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1455 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1457 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1459 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1445);
    float _1461 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1465 = fma(_1405, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1467 = fma(_1429, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1469 = _1447;
    if (_1339)
    {
        float _1471 = -_1437;
        float _1473 = _1471 + 1.0;
        _1439 = _1473;
    }
    float _1475 = _1439;
    float _1477 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1449);
    float _1479 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1451);
    float _1481 = fma(_1465, _1407, _1459);
    float _1483 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1485 = exp2(_1461);
    float _1487 = fma(_1401, _1407, _1477);
    float _1489 = fma(_1467, _1407, _1479);
    if (_1233)
    {
        _1469 = _1475;
    }
    float _1491 = _1469;
    float _1493 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1453);
    float _1495 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1487);
    float _1497 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1481);
    float _1499 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1489);
    float _1501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1503 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1455);
    float _1505 = _1483 * _1463;
    float _1507 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1457);
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1511 = _1289 + _1150;
    float _1513 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1515 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1503);
    float _1517 = -_1485;
    float _1519 = _1517 + 1.0;
    float _1521 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1507);
    float _1523 = _1511 * 0.5;
    bool _1525 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1527 = isnan(_912);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1533 = _1529 || _1531;
    float _1535 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1537 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_67.x = _1513;
    out.m_67.y = _1515;
    out.m_67.z = _1521;
    float _1539 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1541 = _1509 * _1501;
    float _1543 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_69.z = _1523;
    out.m_69.w = _1150;
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1541;
    out.m_71.y = _1505;
    out.m_73.x = _1545;
    out.m_73.y = _1549;
    out.m_73.z = _1547;
    out.gl_Position.x = _1172;
    out.gl_Position.y = _1174;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1150;
    float _1551 = _1549;
    float _1553 = _1545;
    if (!_1533)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1555 = _1551;
    float _1557 = _1555;
    float _1559 = _1555;
    if (!_1533)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1561 = _1553;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1533)
    {
        _1261 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1567 = _1261;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1533)
    {
        _1307 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1573 = _1307;
    float _1575 = _1573;
    float _1577 = _1573;
    if (!_1533)
    {
        _1263 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1579 = _1263;
    float _1581 = _1579;
    float _1583 = _1579;
    if (!_1533)
    {
        _1265 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1585 = _1265;
    float _1587 = _1535 * _1198;
    float _1589 = -_1535;
    float _1591 = _1589 + 1.0;
    float _1593 = _1215 * _1587;
    float _1595 = _1215 * _1591;
    float _1597 = _1225 * _1587;
    float _1599 = fma(_1221, _1593, _1209);
    float _1601 = fma(_1223, _1593, _1211);
    float _1603 = fma(_1215, _1597, _1213);
    out.m_75.x = _1599;
    out.m_75.y = _1601;
    out.m_75.z = _1603;
    out.m_75.w = _1595;
    bool _1605 = !_1533;
    float _1607 = _1585;
    float _1609 = _1585;
    if (!_1605)
    {
        bool _1611 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1613 = isnan(_912);
        bool _1615 = _1611 || _1613;
        bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1619 = _1615 || _1617;
        if (!_1619)
        {
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1623 = _912 + _1621;
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1625;
            float _1629 = 1.0 / _1627;
            float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1649 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1651 = _1623 * _1629;
            float _1653 = precise::clamp(_1651, 0.0, 1.0);
            float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1657 = _1655 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1659 = fma(_1653, _1633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1661 = fma(_1653, _1657, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1663 = fma(_1653, _1637, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1665 = fma(_1653, _1641, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1667 = fma(_1653, _1645, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1669 = fma(_1653, _1649, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1565 = _1661;
            _1583 = _1667;
            _1559 = _1659;
            _1577 = _1665;
            _1571 = _1663;
            _1609 = _1669;
            _1671 = true;
        }
        else
        {
            bool _1673 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1675 = isnan(_912);
            bool _1677 = _1673 || _1675;
            bool _1679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1681 = _1677 || _1679;
            if (!_1681)
            {
                _1557 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1683 = _1557;
            _1559 = _1683;
            if (!_1681)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1685 = _1563;
            _1565 = _1685;
            if (!_1681)
            {
                _1569 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1687 = _1569;
            _1571 = _1687;
            if (!_1681)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1689 = _1575;
            _1577 = _1689;
            if (!_1681)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1691 = _1581;
            _1583 = _1691;
            if (!_1681)
            {
                _1607 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1693 = _1607;
            bool _1695 = !_1681;
            _1609 = _1693;
            if (!_1695)
            {
                bool _1697 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1699 = isnan(_912);
                bool _1701 = _1697 || _1699;
                bool _1703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1705 = _1701 || _1703;
                if (!_1705)
                {
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1709 = _912 + _1707;
                    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1711;
                    float _1715 = 1.0 / _1713;
                    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1731 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1735 = _1733 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1737 = _1709 * _1715;
                    float _1739 = precise::clamp(_1737, 0.0, 1.0);
                    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1745 = fma(_1739, _1719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1747 = fma(_1739, _1743, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1749 = fma(_1739, _1723, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1751 = fma(_1739, _1727, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1753 = fma(_1739, _1731, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1755 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1565 = _1747;
                    _1583 = _1753;
                    _1559 = _1745;
                    _1577 = _1751;
                    _1571 = _1749;
                    _1609 = _1755;
                    _1671 = true;
                }
                else
                {
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1559 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1571 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1609 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1671 = false;
    float _1757 = _1565;
    float _1759 = _1583;
    float _1761 = _1559;
    float _1763 = _1577;
    float _1765 = _1571;
    float _1767 = _1609;
    float _1769 = fma(_1515, -0.5, 0.5);
    float _1771 = precise::clamp(_1769, 0.0, 1.0);
    float _1773 = -_1757;
    float _1775 = _1773 + _1759;
    float _1777 = -_1761;
    float _1779 = _1777 + _1763;
    float _1781 = -_1765;
    float _1783 = _1781 + _1767;
    bool _1785 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1787 = fma(_1771, _1775, _1757);
    float _1789 = fma(_1771, _1779, _1761);
    float _1791 = fma(_1771, _1783, _1765);
    float _1793 = _1787 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1795 = fma(_1789, 0.298911988735198974609375, _1793);
    float _1797 = fma(_1791, 0.114477999508380889892578125, _1795);
    float _1799 = -_1797;
    float _1801 = _1789 + _1799;
    float _1803 = -_1797;
    float _1805 = _1787 + _1803;
    float _1807 = -_1797;
    float _1809 = _1791 + _1807;
    float _1811 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1813 = fma(_1801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    float _1817 = fma(_1809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    out.m_47.x = _1811;
    out.m_79.x = _1813;
    out.m_79.y = _1815;
    out.m_79.z = _1817;
    if (!_1785)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1819 = -_882;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1823 = -_886;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1827 = -_890;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1831 = _1821 * _1821;
    float _1833 = fma(_1825, _1825, _1831);
    float _1835 = fma(_1829, _1829, _1833);
    float _1837 = sqrt(_1835);
    float _1839 = rsqrt(_1835);
    float _1841 = -_1837;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1845 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = _1825 * _1839;
    float _1851 = _1821 * _1839;
    float _1853 = abs(_1847);
    float _1855 = log2(_1853);
    float _1857 = _1829 * _1839;
    float _1859 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1861 = _1515 * _1851;
    float _1863 = -_1851;
    float _1865 = -_1859;
    float _1867 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1865);
    float _1869 = fma(_1513, _1849, _1861);
    float _1871 = -_1857;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1867);
    float _1875 = fma(_1521, _1857, _1869);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1881 = _1873 + _1879;
    float _1883 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1885 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = exp2(_1883);
    float _1891 = _1889 * _1887;
    float _1893 = _1877 * _1891;
    float _1895 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1897 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1899 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1895;
    out.m_77.y = _1897;
    out.m_77.z = _1899;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1671 = false;
    bool _642 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1956 = as_type<float>(_114);
        out.gl_Position.z = _1956;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
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
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_150);
        out.gl_Position.z = _2025;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _338;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _342;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _306 * _360;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _388;
    float _392 = fma(_370, _382, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = _322 * _374;
    float _400 = _392 * _376;
    float _402 = _394 * _376;
    float _404 = _396 * _376;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _418 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].x, _400);
    float _420 = fma(_408, _398, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _422 = fma(_412, _398, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _424 = fma(_416, _398, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _426 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _428 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _430 = fma(_420, _362, _418);
    float _432 = fma(_422, _362, _426);
    float _434 = fma(_424, _362, _428);
    float _436 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].x, _430);
    float _438 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].y, _432);
    float _440 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].z, _434);
    bool _442 = !_372;
    float _460;
    if (!_442)
    {
        float _444 = in.m_53.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_98);
        float _466 = 1.0 / _464;
        float _468 = _132 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _500 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_470);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    bool _522 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_470);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _510 * _516;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _542 = 1.0 / _494;
    float _544 = _532 * _538;
    float _546 = -_532;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _498;
    float _552 = _520 * _512;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _542;
    bool _562 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _564 = isnan(_470);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _470 + _578;
    float _582 = _558 * _544;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _586 = _470 + _584;
    float _588 = -_572;
    float _590 = _588 + 1.0;
    float _592 = fma(_560, _580, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _594 = _576 * _550;
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _598 = _490 * _590;
    float _600 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = fma(_594, _586, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _604 = fma(_592, _534, _596);
    float _606 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = fma(_602, _598, _604);
    float _612 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[118].x, _610);
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _608;
    out.m_55.y = _618;
    out.m_55.z = _614;
    out.m_55.w = _620;
    bool _622 = !_540;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_98);
        float _646 = 1.0 / _644;
        float _648 = _132 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _656 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _660 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _654);
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _664 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _666 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    float _668 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _662);
    float _670 = _664 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _672 = _666 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = _668 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _678 = _670 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _682 = _672 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _686 = _674 + _684;
    float _688 = _678 * _678;
    float _690 = fma(_682, _682, _688);
    float _692 = fma(_686, _686, _690);
    float _694 = rsqrt(_692);
    float _696 = _678 * _694;
    float _698 = _682 * _694;
    float _700 = _686 * _694;
    float _702 = -_696;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _706 = -_698;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _710 = -_700;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _714 = _704 * _704;
    float _716 = in.m_51.x;
    float _718 = in.m_51.y;
    float _720 = in.m_51.z;
    float _722 = fma(_708, _708, _714);
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = in.m_57.z;
    float _730 = fma(_712, _712, _722);
    float _732 = sqrt(_730);
    float _734 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _736 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = _694 * _732;
    float _740 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _746 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = _742 * _738;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _754 = _746 * _738;
    float _756 = _748 * _738;
    float _758 = _750 * _744;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _762 = _754 * _752;
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _766 = _756 * _760;
    float _768 = _758 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].x, _764);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].x, _768);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[10].z, _770);
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[8].z, _772);
    float _778 = _674 + _774;
    float _780 = _672 + _776;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _784 = _778 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _788 = _780 + _786;
    float _790 = _784 * _784;
    float _792 = fma(_788, _788, _790);
    float _794 = _758 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _796 = sqrt(_792);
    float _798 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].x, _794);
    float _800 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[9].z, _798);
    float _802 = _670 + _800;
    bool _804 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = _766;
    float _808 = _800;
    float _810 = _756;
    float _812 = _738;
    float _814 = _796;
    float _816 = _802;
    float _818 = _726;
    if (!_804)
    {
        _806 = _780;
    }
    float _820 = _806;
    float _822 = _820;
    if (!_804)
    {
        _808 = _778;
    }
    float _824 = _808;
    float _826 = _824;
    if (!_804)
    {
        _810 = _802;
    }
    float _828 = _810;
    bool _830 = !_804;
    float _832 = _828;
    if (!_830)
    {
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _838 = _796 + _836;
        float _840 = rsqrt(_792);
        float _842 = _838 * _834;
        float _844 = _802 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = _842 * 0.15915493667125701904296875;
        float _848 = _846 * 6.283185482025146484375;
        float _850 = cos(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        float _856 = _850 + (-1.0);
        float _858 = _856 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = fma(_854, _844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _862 = fma(_802, _850, _858);
        float _864 = _840 * _860;
        float _866 = fma(_788, _864, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _868 = fma(_784, _864, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _832 = _862;
        _822 = _866;
        _826 = _868;
        _812 = _846;
        _814 = _864;
    }
    float _870 = _832;
    float _872 = _822;
    float _874 = _826;
    float _876 = _812;
    float _878 = _814;
    float _880 = -_696;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _884 = -_698;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _888 = -_700;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _894 = _882 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _898 = _886 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _902 = _890 + _900;
    float _904 = _894 * _894;
    float _906 = fma(_898, _898, _904);
    float _908 = fma(_902, _902, _906);
    float _910 = rsqrt(_908);
    float _912 = sqrt(_908);
    float _914 = _910 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _916 = _898 * _914;
    float _918 = _902 * _914;
    float _920 = _916 * _916;
    float _922 = _918 * _918;
    float _924 = _920 + _922;
    float _926 = sqrt(_924);
    bool _928 = _926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _932 = _926 + _930;
    float _934 = _876;
    float _936 = _932;
    float _938 = _894;
    float _940 = _914;
    float _942 = _916;
    if (_928)
    {
        float _944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _934 = _944;
    }
    float _946 = _934;
    float _948 = _946;
    if (_928)
    {
        float _950 = _932 * _946;
        _936 = _950;
    }
    float _952 = _936;
    if (_928)
    {
        float _954 = rsqrt(_924);
        _948 = _954;
    }
    float _956 = _948;
    float _958 = _956;
    if (_928)
    {
        float _960 = _952 * 0.15915493667125701904296875;
        _816 = _960;
    }
    float _962 = _816;
    float _964 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _966 = _902;
    if (_928)
    {
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = precise::max(0.0, _964);
    float _976 = _878;
    float _978 = _974;
    if (_928)
    {
        float _980 = _962 * 6.283185482025146484375;
        float _982 = cos(_980);
        _976 = _982;
    }
    float _984 = _976;
    float _986 = -_914;
    float _988 = -_974;
    float _990 = fma(_894, _986, _988);
    if (_928)
    {
        float _992 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _938 = _992;
    }
    float _994 = _938;
    float _996 = _972;
    float _998 = _994;
    if (_928)
    {
        float _1000 = fma(_972, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _996 = _1000;
    }
    float _1002 = _996;
    float _1004 = _1002;
    if (!_928)
    {
        _998 = _990;
    }
    float _1006 = _998;
    float _1008 = _1006;
    if (_928)
    {
        float _1010 = _956 * _1002;
        _940 = _1010;
    }
    float _1012 = _940;
    if (!_928)
    {
        _1004 = _920;
    }
    float _1014 = _1004;
    float _1016 = _1014;
    float _1018 = _984;
    if (_928)
    {
        float _1020 = _984 + (-1.0);
        _978 = _1020;
    }
    float _1022 = _978;
    float _1024 = _1022;
    if (_928)
    {
        float _1026 = _916 * _1012;
        _942 = _1026;
    }
    float _1028 = _942;
    if (_928)
    {
        float _1030 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _1030;
    }
    float _1032 = _958;
    if (!_928)
    {
        _1024 = _918;
    }
    float _1034 = _1024;
    float _1036 = _1034;
    if (_928)
    {
        float _1038 = _918 * _1012;
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (_928)
    {
        float _1042 = _1028 * _1028;
        _1016 = _1042;
    }
    float _1044 = _1016;
    if (_928)
    {
        float _1046 = fma(_990, _984, _1032);
        _1008 = _1046;
    }
    float _1048 = _1008;
    if (!_928)
    {
        _1018 = _922;
    }
    float _1050 = _1018;
    float _1052 = _1050;
    if (_928)
    {
        float _1054 = _1040 * _1040;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _882 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1060 = fma(_1048, _1048, _1044);
    float _1062 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1058);
    float _1064 = _1060 + _1056;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1068 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1066);
    float _1070 = precise::clamp(_1068, 0.0, 1.0);
    float _1072 = _882 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1062);
    float _1076 = rsqrt(_1064);
    float _1078 = -_1070;
    float _1080 = _1078 + 1.0;
    float _1082 = _882 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1084 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1086 = _882 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1088 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1090 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1082);
    float _1092 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1084);
    float _1094 = abs(_1080);
    float _1096 = log2(_1094);
    float _1098 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1086);
    float _1100 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1090);
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1104 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1106 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1098);
    float _1108 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1110 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1112 = _1076 * _1028;
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1116 = -_1104;
    float _1118 = fma(_1116, _1102, 1.0);
    float _1120 = _1076 * _1048;
    float _1122 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1126 = _1076 * _1040;
    float _1128 = _1120 + 1.0;
    float _1130 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1132 = -_1124;
    float _1134 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1132);
    float _1136 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1138 = log2(_1118);
    float _1140 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1130);
    float _1142 = -_1126;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1134);
    float _1146 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1148 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1152 = fma(_1144, -0.5, 0.5);
    float _1154 = fma(_1144, 0.5, 0.5);
    float _1156 = exp2(_1136);
    float _1158 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1146);
    float _1160 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1148);
    float _1162 = fma(_1154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1164 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1158);
    float _1166 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1168 = fma(_1154, _1162, -0.212114393711090087890625);
    float _1170 = 1.0 / _1150;
    float _1172 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1164);
    float _1174 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1166);
    float _1176 = _1138 * 0.693147182464599609375;
    float _1178 = fma(_1154, _1168, 1.570728778839111328125);
    float _1180 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1182 = sqrt(_1152);
    float _1184 = -_1120;
    float _1186 = fma(_1156, _1128, _1184);
    float _1188 = _1172 * _1170;
    float _1190 = _1174 * _1170;
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = fma(_1190, -0.5, 0.5);
    float _1196 = _1182 * 0.636619746685028076171875;
    float3 _3735 = float3(_1192, _1194, _1180);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3735, float3(0.0), isnan(_3735)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3735, float3(0.0), isnan(_3735)), level(0.0)).x;
    float _1200 = -_1178;
    float _1202 = fma(_1196, _1200, 1.0);
    float _1204 = fma(_1186, 0.5, 0.5);
    float3 _3753 = float3(_1192, _1194, _1180);
    float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3753, float3(0.0), isnan(_3753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3753, float3(0.0), isnan(_3753)), level(0.0)).xyzw;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = _1207.w;
    float2 _3770 = float2(_1202, _1204);
    float3 _1219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3770, float2(0.0), isnan(_3770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3770, float2(0.0), isnan(_3770)), level(0.0)).xyz;
    float _1221 = _1219.x;
    float _1223 = _1219.y;
    float _1225 = _1219.z;
    float _1227 = in.m_53.y;
    float _1229 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1233 = _1231 != 0;
    float _1235 = in.m_59.y;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1239 = _1237 != 0;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1249 = in.m_61.x;
    float _1251 = 1.0 / _1243;
    float _1253 = in.m_61.y;
    float _1255 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1229);
    float _1257 = _1180;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1261 = _1150;
    float _1263 = _1174;
    float _1265 = _1172;
    if (_1233)
    {
        float _1267 = in.m_53.x;
        _1257 = _1267;
    }
    float _1269 = _1257;
    float _1271 = 1.0 / _1247;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1275 = _650 + _1273;
    float _1277 = in.m_61.z;
    float _1279 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1255);
    bool _1281 = _1227 > 0.5;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1285 = _650 + _1283;
    float _1287 = in.m_61.w;
    float _1289 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1291 = -_1235;
    float _1293 = _1291 + 1.0;
    float _1295 = _1285 * _1251;
    float _1297 = in.m_59.x;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1299;
    float _1303 = _1275 * _1271;
    float _1305 = _1235;
    float _1307 = _1289;
    if (_1239)
    {
        float _1309 = _1281 ? _1293 : _1235;
        _1305 = _1309;
    }
    float _1311 = _1305;
    float _1313 = in.m_63.x;
    float _1315 = in.m_63.y;
    float _1317 = in.m_63.z;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1319;
    bool _1323 = _726 != 0.0;
    bool _1325 = isnan(_726);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(0.0);
    bool _1331 = _1327 || _1329;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1333;
    out.m_65.x = _1249;
    bool _1337 = _1269 > 0.5;
    bool _1339 = _1337 && _1233;
    float _1341 = fma(_1301, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1343 = _724 == 0.0;
    bool _1345 = !_1331;
    bool _1347 = _1343 && _1345;
    out.m_65.y = _1253;
    bool _1349 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1351 = isnan(_650);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = fma(_1335, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1363 = _728 == 0.0;
    bool _1365 = _1363 && _1347;
    float _1367 = fma(_1321, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1369 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1371 = isnan(_650);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    out.m_65.z = _1277;
    bool _1381 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1383 = isnan(_650);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1397 = -_1379;
    float _1399 = _1397 + 1.0;
    out.m_65.w = _1287;
    float _1401 = fma(_1395, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1407 = _1359 * _1399;
    float _1409 = -_1359;
    float _1411 = _1409 + 1.0;
    float _1413 = _1315;
    float _1415 = _1317;
    float _1417 = _1313;
    if (!_1365)
    {
        float _1419 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1315);
        _1413 = _1419;
    }
    float _1421 = _1413;
    if (!_1365)
    {
        float _1423 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1317);
        _1415 = _1423;
    }
    float _1425 = _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1431 = _1391 * _1411;
    float _1433 = -_1391;
    float _1435 = _1433 + 1.0;
    if (_1233)
    {
        _1259 = _1297;
    }
    float _1437 = _1259;
    float _1439 = _1437;
    if (!_1365)
    {
        float _1441 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1313);
        _1417 = _1441;
    }
    float _1443 = _1417;
    float _1445 = _1341 * _1431;
    if (!_1233)
    {
        _818 = _1297;
    }
    float _1447 = _818;
    float _1449 = _1367 * _1431;
    float _1451 = _1361 * _1431;
    float _1453 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1455 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1457 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1459 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1445);
    float _1461 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1465 = fma(_1405, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1467 = fma(_1429, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1469 = _1447;
    if (_1339)
    {
        float _1471 = -_1437;
        float _1473 = _1471 + 1.0;
        _1439 = _1473;
    }
    float _1475 = _1439;
    float _1477 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1449);
    float _1479 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1451);
    float _1481 = fma(_1465, _1407, _1459);
    float _1483 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1485 = exp2(_1461);
    float _1487 = fma(_1401, _1407, _1477);
    float _1489 = fma(_1467, _1407, _1479);
    if (_1233)
    {
        _1469 = _1475;
    }
    float _1491 = _1469;
    float _1493 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1453);
    float _1495 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1487);
    float _1497 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1481);
    float _1499 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1489);
    float _1501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1503 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1455);
    float _1505 = _1483 * _1463;
    float _1507 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1457);
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1511 = _1289 + _1150;
    float _1513 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1515 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1503);
    float _1517 = -_1485;
    float _1519 = _1517 + 1.0;
    float _1521 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1507);
    float _1523 = _1511 * 0.5;
    bool _1525 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1527 = isnan(_912);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1533 = _1529 || _1531;
    float _1535 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1537 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_67.x = _1513;
    out.m_67.y = _1515;
    out.m_67.z = _1521;
    float _1539 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1541 = _1509 * _1501;
    float _1543 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_69.z = _1523;
    out.m_69.w = _1150;
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1541;
    out.m_71.y = _1505;
    out.m_73.x = _1545;
    out.m_73.y = _1549;
    out.m_73.z = _1547;
    out.gl_Position.x = _1172;
    out.gl_Position.y = _1174;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1150;
    float _1551 = _1549;
    float _1553 = _1545;
    if (!_1533)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1555 = _1551;
    float _1557 = _1555;
    float _1559 = _1555;
    if (!_1533)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1561 = _1553;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1533)
    {
        _1261 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1567 = _1261;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1533)
    {
        _1307 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1573 = _1307;
    float _1575 = _1573;
    float _1577 = _1573;
    if (!_1533)
    {
        _1263 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1579 = _1263;
    float _1581 = _1579;
    float _1583 = _1579;
    if (!_1533)
    {
        _1265 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1585 = _1265;
    float _1587 = _1535 * _1198;
    float _1589 = -_1535;
    float _1591 = _1589 + 1.0;
    float _1593 = _1215 * _1587;
    float _1595 = _1215 * _1591;
    float _1597 = _1225 * _1587;
    float _1599 = fma(_1221, _1593, _1209);
    float _1601 = fma(_1223, _1593, _1211);
    float _1603 = fma(_1215, _1597, _1213);
    out.m_75.x = _1599;
    out.m_75.y = _1601;
    out.m_75.z = _1603;
    out.m_75.w = _1595;
    bool _1605 = !_1533;
    float _1607 = _1585;
    float _1609 = _1585;
    if (!_1605)
    {
        bool _1611 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1613 = isnan(_912);
        bool _1615 = _1611 || _1613;
        bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1619 = _1615 || _1617;
        if (!_1619)
        {
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1623 = _912 + _1621;
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1625;
            float _1629 = 1.0 / _1627;
            float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1649 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1651 = _1623 * _1629;
            float _1653 = precise::clamp(_1651, 0.0, 1.0);
            float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1657 = _1655 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1659 = fma(_1653, _1633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1661 = fma(_1653, _1657, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1663 = fma(_1653, _1637, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1665 = fma(_1653, _1641, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1667 = fma(_1653, _1645, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1669 = fma(_1653, _1649, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1565 = _1661;
            _1583 = _1667;
            _1559 = _1659;
            _1577 = _1665;
            _1571 = _1663;
            _1609 = _1669;
            _1671 = true;
        }
        else
        {
            bool _1673 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1675 = isnan(_912);
            bool _1677 = _1673 || _1675;
            bool _1679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1681 = _1677 || _1679;
            if (!_1681)
            {
                _1557 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1683 = _1557;
            _1559 = _1683;
            if (!_1681)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1685 = _1563;
            _1565 = _1685;
            if (!_1681)
            {
                _1569 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1687 = _1569;
            _1571 = _1687;
            if (!_1681)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1689 = _1575;
            _1577 = _1689;
            if (!_1681)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1691 = _1581;
            _1583 = _1691;
            if (!_1681)
            {
                _1607 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1693 = _1607;
            bool _1695 = !_1681;
            _1609 = _1693;
            if (!_1695)
            {
                bool _1697 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1699 = isnan(_912);
                bool _1701 = _1697 || _1699;
                bool _1703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1705 = _1701 || _1703;
                if (!_1705)
                {
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1709 = _912 + _1707;
                    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1711;
                    float _1715 = 1.0 / _1713;
                    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1731 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1735 = _1733 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1737 = _1709 * _1715;
                    float _1739 = precise::clamp(_1737, 0.0, 1.0);
                    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1745 = fma(_1739, _1719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1747 = fma(_1739, _1743, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1749 = fma(_1739, _1723, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1751 = fma(_1739, _1727, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1753 = fma(_1739, _1731, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1755 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1565 = _1747;
                    _1583 = _1753;
                    _1559 = _1745;
                    _1577 = _1751;
                    _1571 = _1749;
                    _1609 = _1755;
                    _1671 = true;
                }
                else
                {
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1559 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1571 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1609 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1671 = false;
    float _1757 = _1565;
    float _1759 = _1583;
    float _1761 = _1559;
    float _1763 = _1577;
    float _1765 = _1571;
    float _1767 = _1609;
    float _1769 = fma(_1515, -0.5, 0.5);
    float _1771 = precise::clamp(_1769, 0.0, 1.0);
    float _1773 = -_1757;
    float _1775 = _1773 + _1759;
    float _1777 = -_1761;
    float _1779 = _1777 + _1763;
    float _1781 = -_1765;
    float _1783 = _1781 + _1767;
    bool _1785 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1787 = fma(_1771, _1775, _1757);
    float _1789 = fma(_1771, _1779, _1761);
    float _1791 = fma(_1771, _1783, _1765);
    float _1793 = _1787 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1795 = fma(_1789, 0.298911988735198974609375, _1793);
    float _1797 = fma(_1791, 0.114477999508380889892578125, _1795);
    float _1799 = -_1797;
    float _1801 = _1789 + _1799;
    float _1803 = -_1797;
    float _1805 = _1787 + _1803;
    float _1807 = -_1797;
    float _1809 = _1791 + _1807;
    float _1811 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1813 = fma(_1801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    float _1817 = fma(_1809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    out.m_47.x = _1811;
    out.m_79.x = _1813;
    out.m_79.y = _1815;
    out.m_79.z = _1817;
    if (!_1785)
    {
        return out;
    }
    float _1819 = -_882;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1823 = -_886;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1827 = -_890;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1831 = _1821 * _1821;
    float _1833 = fma(_1825, _1825, _1831);
    float _1835 = fma(_1829, _1829, _1833);
    float _1837 = sqrt(_1835);
    float _1839 = rsqrt(_1835);
    float _1841 = -_1837;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1845 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = _1825 * _1839;
    float _1851 = _1821 * _1839;
    float _1853 = abs(_1847);
    float _1855 = log2(_1853);
    float _1857 = _1829 * _1839;
    float _1859 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1861 = _1515 * _1851;
    float _1863 = -_1851;
    float _1865 = -_1859;
    float _1867 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1865);
    float _1869 = fma(_1513, _1849, _1861);
    float _1871 = -_1857;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1867);
    float _1875 = fma(_1521, _1857, _1869);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1881 = _1873 + _1879;
    float _1883 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1885 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = exp2(_1883);
    float _1891 = _1889 * _1887;
    float _1893 = _1877 * _1891;
    float _1895 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1897 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1899 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1895;
    out.m_77.y = _1897;
    out.m_77.z = _1899;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1671 = false;
    bool _642 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1956 = as_type<float>(_114);
        out.gl_Position.z = _1956;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_128)
    {
        float _134 = float(_98);
        _108 = _134;
    }
    float _136 = _108;
    bool _138 = _132 >= _136;
    bool _140 = !_128;
    bool _142 = _138 || _140;
    float _144 = _136;
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
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2025 = as_type<float>(_150);
        out.gl_Position.z = _2025;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _254 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
    float _292;
    if (!_274)
    {
        float _276 = in.m_53.x;
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _280 = _276 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        float _296 = float(_98);
        float _298 = 1.0 / _296;
        float _300 = _132 * _298;
        _292 = _300;
    }
    _294 = false;
    float _302 = _292;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _306 = _302 + _304;
    bool _308 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _310 = isnan(_302);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _302 + _320;
    bool _324 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _326 = isnan(_302);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _344 = _302 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _346 = isnan(_302);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -_318;
    float _358 = _356 + 1.0;
    float _360 = 1.0 / _338;
    float _362 = _354 * _358;
    float _364 = -_354;
    float _366 = _364 + 1.0;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _342;
    float _376 = _334 * _366;
    float _378 = -_334;
    float _380 = _378 + 1.0;
    float _382 = _306 * _360;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _388;
    float _392 = fma(_370, _382, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _394 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = _322 * _374;
    float _400 = _392 * _376;
    float _402 = _394 * _376;
    float _404 = _396 * _376;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _418 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].x, _400);
    float _420 = fma(_408, _398, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _422 = fma(_412, _398, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _424 = fma(_416, _398, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _426 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _428 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _430 = fma(_420, _362, _418);
    float _432 = fma(_422, _362, _426);
    float _434 = fma(_424, _362, _428);
    float _436 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].x, _430);
    float _438 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].y, _432);
    float _440 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[109].z, _434);
    bool _442 = !_372;
    float _460;
    if (!_442)
    {
        float _444 = in.m_53.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_98);
        float _466 = 1.0 / _464;
        float _468 = _132 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _500 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _502 = isnan(_470);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = 1.0 / _478;
    float _514 = -_490;
    float _516 = _514 + 1.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _518;
    bool _522 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_470);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _510 * _516;
    float _536 = -_510;
    float _538 = _536 + 1.0;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _542 = 1.0 / _494;
    float _544 = _532 * _538;
    float _546 = -_532;
    float _548 = _546 + 1.0;
    float _550 = 1.0 / _498;
    float _552 = _520 * _512;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _558 = fma(_552, _474, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = _556 * _542;
    bool _562 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _564 = isnan(_470);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _580 = _470 + _578;
    float _582 = _558 * _544;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _586 = _470 + _584;
    float _588 = -_572;
    float _590 = _588 + 1.0;
    float _592 = fma(_560, _580, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _594 = _576 * _550;
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _582);
    float _598 = _490 * _590;
    float _600 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = fma(_594, _586, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _604 = fma(_592, _534, _596);
    float _606 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = fma(_602, _598, _604);
    float _612 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[118].x, _610);
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _608;
    out.m_55.y = _618;
    out.m_55.z = _614;
    out.m_55.w = _620;
    bool _622 = !_540;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_98);
        float _646 = 1.0 / _644;
        float _648 = _132 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _656 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _660 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _654);
    float _662 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _664 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _658);
    float _666 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    float _668 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _662);
    float _670 = _664 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _672 = _666 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _674 = _668 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _678 = _670 + _676;
    float _680 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _682 = _672 + _680;
    float _684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _686 = _674 + _684;
    float _688 = _678 * _678;
    float _690 = fma(_682, _682, _688);
    float _692 = fma(_686, _686, _690);
    float _694 = rsqrt(_692);
    float _696 = _678 * _694;
    float _698 = _682 * _694;
    float _700 = _686 * _694;
    float _702 = -_696;
    float _704 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[18].w, _678);
    float _706 = -_698;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _682);
    float _710 = -_700;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _686);
    float _714 = _704 * _704;
    float _716 = in.m_51.x;
    float _718 = in.m_51.y;
    float _720 = in.m_51.z;
    float _722 = fma(_708, _708, _714);
    float _724 = in.m_57.x;
    float _726 = in.m_57.y;
    float _728 = in.m_57.z;
    float _730 = fma(_712, _712, _722);
    float _732 = sqrt(_730);
    float _734 = _718 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _736 = _716 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _738 = _694 * _732;
    float _740 = _720 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _742 = _734 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _726);
    float _746 = _736 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _748 = _740 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = _742 * _738;
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _724);
    float _754 = _746 * _738;
    float _756 = _748 * _738;
    float _758 = _750 * _744;
    float _760 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _728);
    float _762 = _754 * _752;
    float _764 = _758 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _766 = _756 * _760;
    float _768 = _758 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _770 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[10].x, _764);
    float _772 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[8].x, _768);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[10].z, _770);
    float _776 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[8].z, _772);
    float _778 = _674 + _774;
    float _780 = _672 + _776;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _784 = _778 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _788 = _780 + _786;
    float _790 = _784 * _784;
    float _792 = fma(_788, _788, _790);
    float _794 = _758 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _796 = sqrt(_792);
    float _798 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[9].x, _794);
    float _800 = fma(_766, (*spvDescriptorSet0.vp_c10)._m0[9].z, _798);
    float _802 = _670 + _800;
    bool _804 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = _766;
    float _808 = _800;
    float _810 = _756;
    float _812 = _738;
    float _814 = _796;
    float _816 = _802;
    float _818 = _726;
    if (!_804)
    {
        _806 = _780;
    }
    float _820 = _806;
    float _822 = _820;
    if (!_804)
    {
        _808 = _778;
    }
    float _824 = _808;
    float _826 = _824;
    if (!_804)
    {
        _810 = _802;
    }
    float _828 = _810;
    bool _830 = !_804;
    float _832 = _828;
    if (!_830)
    {
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _838 = _796 + _836;
        float _840 = rsqrt(_792);
        float _842 = _838 * _834;
        float _844 = _802 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = _842 * 0.15915493667125701904296875;
        float _848 = _846 * 6.283185482025146484375;
        float _850 = cos(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        float _856 = _850 + (-1.0);
        float _858 = _856 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = fma(_854, _844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _862 = fma(_802, _850, _858);
        float _864 = _840 * _860;
        float _866 = fma(_788, _864, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _868 = fma(_784, _864, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _832 = _862;
        _822 = _866;
        _826 = _868;
        _812 = _846;
        _814 = _864;
    }
    float _870 = _832;
    float _872 = _822;
    float _874 = _826;
    float _876 = _812;
    float _878 = _814;
    float _880 = -_696;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _884 = -_698;
    float _886 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _888 = -_700;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _894 = _882 + _892;
    float _896 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _898 = _886 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _902 = _890 + _900;
    float _904 = _894 * _894;
    float _906 = fma(_898, _898, _904);
    float _908 = fma(_902, _902, _906);
    float _910 = rsqrt(_908);
    float _912 = sqrt(_908);
    float _914 = _910 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _916 = _898 * _914;
    float _918 = _902 * _914;
    float _920 = _916 * _916;
    float _922 = _918 * _918;
    float _924 = _920 + _922;
    float _926 = sqrt(_924);
    bool _928 = _926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _932 = _926 + _930;
    float _934 = _876;
    float _936 = _932;
    float _938 = _894;
    float _940 = _914;
    float _942 = _916;
    if (_928)
    {
        float _944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _934 = _944;
    }
    float _946 = _934;
    float _948 = _946;
    if (_928)
    {
        float _950 = _932 * _946;
        _936 = _950;
    }
    float _952 = _936;
    if (_928)
    {
        float _954 = rsqrt(_924);
        _948 = _954;
    }
    float _956 = _948;
    float _958 = _956;
    if (_928)
    {
        float _960 = _952 * 0.15915493667125701904296875;
        _816 = _960;
    }
    float _962 = _816;
    float _964 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _966 = _902;
    if (_928)
    {
        float _968 = _962 * 6.283185482025146484375;
        float _970 = sin(_968);
        _966 = _970;
    }
    float _972 = _966;
    float _974 = precise::max(0.0, _964);
    float _976 = _878;
    float _978 = _974;
    if (_928)
    {
        float _980 = _962 * 6.283185482025146484375;
        float _982 = cos(_980);
        _976 = _982;
    }
    float _984 = _976;
    float _986 = -_914;
    float _988 = -_974;
    float _990 = fma(_894, _986, _988);
    if (_928)
    {
        float _992 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _938 = _992;
    }
    float _994 = _938;
    float _996 = _972;
    float _998 = _994;
    if (_928)
    {
        float _1000 = fma(_972, _994, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _996 = _1000;
    }
    float _1002 = _996;
    float _1004 = _1002;
    if (!_928)
    {
        _998 = _990;
    }
    float _1006 = _998;
    float _1008 = _1006;
    if (_928)
    {
        float _1010 = _956 * _1002;
        _940 = _1010;
    }
    float _1012 = _940;
    if (!_928)
    {
        _1004 = _920;
    }
    float _1014 = _1004;
    float _1016 = _1014;
    float _1018 = _984;
    if (_928)
    {
        float _1020 = _984 + (-1.0);
        _978 = _1020;
    }
    float _1022 = _978;
    float _1024 = _1022;
    if (_928)
    {
        float _1026 = _916 * _1012;
        _942 = _1026;
    }
    float _1028 = _942;
    if (_928)
    {
        float _1030 = _1022 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _1030;
    }
    float _1032 = _958;
    if (!_928)
    {
        _1024 = _918;
    }
    float _1034 = _1024;
    float _1036 = _1034;
    if (_928)
    {
        float _1038 = _918 * _1012;
        _1036 = _1038;
    }
    float _1040 = _1036;
    if (_928)
    {
        float _1042 = _1028 * _1028;
        _1016 = _1042;
    }
    float _1044 = _1016;
    if (_928)
    {
        float _1046 = fma(_990, _984, _1032);
        _1008 = _1046;
    }
    float _1048 = _1008;
    if (!_928)
    {
        _1018 = _922;
    }
    float _1050 = _1018;
    float _1052 = _1050;
    if (_928)
    {
        float _1054 = _1040 * _1040;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = _882 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1060 = fma(_1048, _1048, _1044);
    float _1062 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1058);
    float _1064 = _1060 + _1056;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1068 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1066);
    float _1070 = precise::clamp(_1068, 0.0, 1.0);
    float _1072 = _882 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1074 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1062);
    float _1076 = rsqrt(_1064);
    float _1078 = -_1070;
    float _1080 = _1078 + 1.0;
    float _1082 = _882 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1084 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1072);
    float _1086 = _882 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1088 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1090 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1082);
    float _1092 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1084);
    float _1094 = abs(_1080);
    float _1096 = log2(_1094);
    float _1098 = fma(_886, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1086);
    float _1100 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1090);
    float _1102 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1104 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1106 = fma(_890, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1098);
    float _1108 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1110 = _1100 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1112 = _1076 * _1028;
    float _1114 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1116 = -_1104;
    float _1118 = fma(_1116, _1102, 1.0);
    float _1120 = _1076 * _1048;
    float _1122 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1124 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1126 = _1076 * _1040;
    float _1128 = _1120 + 1.0;
    float _1130 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1122);
    float _1132 = -_1124;
    float _1134 = fma(_1120, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1132);
    float _1136 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1138 = log2(_1118);
    float _1140 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1130);
    float _1142 = -_1126;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1134);
    float _1146 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1148 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1140);
    float _1152 = fma(_1144, -0.5, 0.5);
    float _1154 = fma(_1144, 0.5, 0.5);
    float _1156 = exp2(_1136);
    float _1158 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1146);
    float _1160 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1148);
    float _1162 = fma(_1154, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1164 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1158);
    float _1166 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1160);
    float _1168 = fma(_1154, _1162, -0.212114393711090087890625);
    float _1170 = 1.0 / _1150;
    float _1172 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1164);
    float _1174 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1166);
    float _1176 = _1138 * 0.693147182464599609375;
    float _1178 = fma(_1154, _1168, 1.570728778839111328125);
    float _1180 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1182 = sqrt(_1152);
    float _1184 = -_1120;
    float _1186 = fma(_1156, _1128, _1184);
    float _1188 = _1172 * _1170;
    float _1190 = _1174 * _1170;
    float _1192 = fma(_1188, 0.5, 0.5);
    float _1194 = fma(_1190, -0.5, 0.5);
    float _1196 = _1182 * 0.636619746685028076171875;
    float3 _3735 = float3(_1192, _1194, _1180);
    float _1198 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3735, float3(0.0), isnan(_3735)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3735, float3(0.0), isnan(_3735)), level(0.0)).x;
    float _1200 = -_1178;
    float _1202 = fma(_1196, _1200, 1.0);
    float _1204 = fma(_1186, 0.5, 0.5);
    float3 _3753 = float3(_1192, _1194, _1180);
    float4 _1207 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3753, float3(0.0), isnan(_3753)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3753, float3(0.0), isnan(_3753)), level(0.0)).xyzw;
    float _1209 = _1207.x;
    float _1211 = _1207.y;
    float _1213 = _1207.z;
    float _1215 = _1207.w;
    float2 _3770 = float2(_1202, _1204);
    float3 _1219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3770, float2(0.0), isnan(_3770)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3770, float2(0.0), isnan(_3770)), level(0.0)).xyz;
    float _1221 = _1219.x;
    float _1223 = _1219.y;
    float _1225 = _1219.z;
    float _1227 = in.m_53.y;
    float _1229 = _1108 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1233 = _1231 != 0;
    float _1235 = in.m_59.y;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1239 = _1237 != 0;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1241;
    float _1245 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1247 = _1245 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1249 = in.m_61.x;
    float _1251 = 1.0 / _1243;
    float _1253 = in.m_61.y;
    float _1255 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1229);
    float _1257 = _1180;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1261 = _1150;
    float _1263 = _1174;
    float _1265 = _1172;
    if (_1233)
    {
        float _1267 = in.m_53.x;
        _1257 = _1267;
    }
    float _1269 = _1257;
    float _1271 = 1.0 / _1247;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1275 = _650 + _1273;
    float _1277 = in.m_61.z;
    float _1279 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1255);
    bool _1281 = _1227 > 0.5;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1285 = _650 + _1283;
    float _1287 = in.m_61.w;
    float _1289 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1279);
    float _1291 = -_1235;
    float _1293 = _1291 + 1.0;
    float _1295 = _1285 * _1251;
    float _1297 = in.m_59.x;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1299;
    float _1303 = _1275 * _1271;
    float _1305 = _1235;
    float _1307 = _1289;
    if (_1239)
    {
        float _1309 = _1281 ? _1293 : _1235;
        _1305 = _1309;
    }
    float _1311 = _1305;
    float _1313 = in.m_63.x;
    float _1315 = in.m_63.y;
    float _1317 = in.m_63.z;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1319;
    bool _1323 = _726 != 0.0;
    bool _1325 = isnan(_726);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan(0.0);
    bool _1331 = _1327 || _1329;
    float _1333 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1335 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1333;
    out.m_65.x = _1249;
    bool _1337 = _1269 > 0.5;
    bool _1339 = _1337 && _1233;
    float _1341 = fma(_1301, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1343 = _724 == 0.0;
    bool _1345 = !_1331;
    bool _1347 = _1343 && _1345;
    out.m_65.y = _1253;
    bool _1349 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1351 = isnan(_650);
    bool _1353 = _1349 || _1351;
    bool _1355 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1357 = _1353 || _1355;
    float _1359 = float(_1357);
    float _1361 = fma(_1335, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1363 = _728 == 0.0;
    bool _1365 = _1363 && _1347;
    float _1367 = fma(_1321, _1295, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1369 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1371 = isnan(_650);
    bool _1373 = _1369 || _1371;
    bool _1375 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1377 = _1373 || _1375;
    float _1379 = float(_1377);
    out.m_65.z = _1277;
    bool _1381 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1383 = isnan(_650);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1397 = -_1379;
    float _1399 = _1397 + 1.0;
    out.m_65.w = _1287;
    float _1401 = fma(_1395, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1407 = _1359 * _1399;
    float _1409 = -_1359;
    float _1411 = _1409 + 1.0;
    float _1413 = _1315;
    float _1415 = _1317;
    float _1417 = _1313;
    if (!_1365)
    {
        float _1419 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1315);
        _1413 = _1419;
    }
    float _1421 = _1413;
    if (!_1365)
    {
        float _1423 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1317);
        _1415 = _1423;
    }
    float _1425 = _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1431 = _1391 * _1411;
    float _1433 = -_1391;
    float _1435 = _1433 + 1.0;
    if (_1233)
    {
        _1259 = _1297;
    }
    float _1437 = _1259;
    float _1439 = _1437;
    if (!_1365)
    {
        float _1441 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1313);
        _1417 = _1441;
    }
    float _1443 = _1417;
    float _1445 = _1341 * _1431;
    if (!_1233)
    {
        _818 = _1297;
    }
    float _1447 = _818;
    float _1449 = _1367 * _1431;
    float _1451 = _1361 * _1431;
    float _1453 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1455 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1457 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1459 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1445);
    float _1461 = _1096 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1465 = fma(_1405, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1467 = fma(_1429, _1303, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1469 = _1447;
    if (_1339)
    {
        float _1471 = -_1437;
        float _1473 = _1471 + 1.0;
        _1439 = _1473;
    }
    float _1475 = _1439;
    float _1477 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1449);
    float _1479 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1451);
    float _1481 = fma(_1465, _1407, _1459);
    float _1483 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1485 = exp2(_1461);
    float _1487 = fma(_1401, _1407, _1477);
    float _1489 = fma(_1467, _1407, _1479);
    if (_1233)
    {
        _1469 = _1475;
    }
    float _1491 = _1469;
    float _1493 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1453);
    float _1495 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1487);
    float _1497 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1481);
    float _1499 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1489);
    float _1501 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1503 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1455);
    float _1505 = _1483 * _1463;
    float _1507 = fma(_1443, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1457);
    float _1509 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1511 = _1289 + _1150;
    float _1513 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1493);
    float _1515 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1503);
    float _1517 = -_1485;
    float _1519 = _1517 + 1.0;
    float _1521 = fma(_1425, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1507);
    float _1523 = _1511 * 0.5;
    bool _1525 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1527 = isnan(_912);
    bool _1529 = _1525 || _1527;
    bool _1531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1533 = _1529 || _1531;
    float _1535 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1537 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_67.x = _1513;
    out.m_67.y = _1515;
    out.m_67.z = _1521;
    float _1539 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1541 = _1509 * _1501;
    float _1543 = _1497 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_69.z = _1523;
    out.m_69.w = _1150;
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1547 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1549 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1541;
    out.m_71.y = _1505;
    out.m_73.x = _1545;
    out.m_73.y = _1549;
    out.m_73.z = _1547;
    out.gl_Position.x = _1172;
    out.gl_Position.y = _1174;
    out.gl_Position.z = _1289;
    out.gl_Position.w = _1150;
    float _1551 = _1549;
    float _1553 = _1545;
    if (!_1533)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1555 = _1551;
    float _1557 = _1555;
    float _1559 = _1555;
    if (!_1533)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1561 = _1553;
    float _1563 = _1561;
    float _1565 = _1561;
    if (!_1533)
    {
        _1261 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1567 = _1261;
    float _1569 = _1567;
    float _1571 = _1567;
    if (!_1533)
    {
        _1307 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1573 = _1307;
    float _1575 = _1573;
    float _1577 = _1573;
    if (!_1533)
    {
        _1263 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1579 = _1263;
    float _1581 = _1579;
    float _1583 = _1579;
    if (!_1533)
    {
        _1265 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1585 = _1265;
    float _1587 = _1535 * _1198;
    float _1589 = -_1535;
    float _1591 = _1589 + 1.0;
    float _1593 = _1215 * _1587;
    float _1595 = _1215 * _1591;
    float _1597 = _1225 * _1587;
    float _1599 = fma(_1221, _1593, _1209);
    float _1601 = fma(_1223, _1593, _1211);
    float _1603 = fma(_1215, _1597, _1213);
    out.m_75.x = _1599;
    out.m_75.y = _1601;
    out.m_75.z = _1603;
    out.m_75.w = _1595;
    bool _1605 = !_1533;
    float _1607 = _1585;
    float _1609 = _1585;
    if (!_1605)
    {
        bool _1611 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1613 = isnan(_912);
        bool _1615 = _1611 || _1613;
        bool _1617 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1619 = _1615 || _1617;
        if (!_1619)
        {
            float _1621 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1623 = _912 + _1621;
            float _1625 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1627 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1625;
            float _1629 = 1.0 / _1627;
            float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1633 = _1631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1641 = _1639 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1649 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1651 = _1623 * _1629;
            float _1653 = precise::clamp(_1651, 0.0, 1.0);
            float _1655 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1657 = _1655 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1659 = fma(_1653, _1633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1661 = fma(_1653, _1657, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1663 = fma(_1653, _1637, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1665 = fma(_1653, _1641, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1667 = fma(_1653, _1645, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1669 = fma(_1653, _1649, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1565 = _1661;
            _1583 = _1667;
            _1559 = _1659;
            _1577 = _1665;
            _1571 = _1663;
            _1609 = _1669;
            _1671 = true;
        }
        else
        {
            bool _1673 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1675 = isnan(_912);
            bool _1677 = _1673 || _1675;
            bool _1679 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1681 = _1677 || _1679;
            if (!_1681)
            {
                _1557 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1683 = _1557;
            _1559 = _1683;
            if (!_1681)
            {
                _1563 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1685 = _1563;
            _1565 = _1685;
            if (!_1681)
            {
                _1569 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1687 = _1569;
            _1571 = _1687;
            if (!_1681)
            {
                _1575 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1689 = _1575;
            _1577 = _1689;
            if (!_1681)
            {
                _1581 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1691 = _1581;
            _1583 = _1691;
            if (!_1681)
            {
                _1607 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1693 = _1607;
            bool _1695 = !_1681;
            _1609 = _1693;
            if (!_1695)
            {
                bool _1697 = _912 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1699 = isnan(_912);
                bool _1701 = _1697 || _1699;
                bool _1703 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1705 = _1701 || _1703;
                if (!_1705)
                {
                    float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1709 = _912 + _1707;
                    float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1713 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1711;
                    float _1715 = 1.0 / _1713;
                    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1729 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1731 = _1729 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1735 = _1733 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1737 = _1709 * _1715;
                    float _1739 = precise::clamp(_1737, 0.0, 1.0);
                    float _1741 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1745 = fma(_1739, _1719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1747 = fma(_1739, _1743, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1749 = fma(_1739, _1723, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1751 = fma(_1739, _1727, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1753 = fma(_1739, _1731, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1755 = fma(_1739, _1735, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1565 = _1747;
                    _1583 = _1753;
                    _1559 = _1745;
                    _1577 = _1751;
                    _1571 = _1749;
                    _1609 = _1755;
                    _1671 = true;
                }
                else
                {
                    _1565 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1583 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1559 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1577 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1571 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1609 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1671 = false;
    float _1757 = _1565;
    float _1759 = _1583;
    float _1761 = _1559;
    float _1763 = _1577;
    float _1765 = _1571;
    float _1767 = _1609;
    float _1769 = fma(_1515, -0.5, 0.5);
    float _1771 = precise::clamp(_1769, 0.0, 1.0);
    float _1773 = -_1757;
    float _1775 = _1773 + _1759;
    float _1777 = -_1761;
    float _1779 = _1777 + _1763;
    float _1781 = -_1765;
    float _1783 = _1781 + _1767;
    bool _1785 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1787 = fma(_1771, _1775, _1757);
    float _1789 = fma(_1771, _1779, _1761);
    float _1791 = fma(_1771, _1783, _1765);
    float _1793 = _1787 * 0.586610972881317138671875;
    out.m_77.x = 0.0;
    float _1795 = fma(_1789, 0.298911988735198974609375, _1793);
    float _1797 = fma(_1791, 0.114477999508380889892578125, _1795);
    float _1799 = -_1797;
    float _1801 = _1789 + _1799;
    float _1803 = -_1797;
    float _1805 = _1787 + _1803;
    float _1807 = -_1797;
    float _1809 = _1791 + _1807;
    float _1811 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1813 = fma(_1801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    float _1815 = fma(_1805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    float _1817 = fma(_1809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1797);
    out.m_47.x = _1811;
    out.m_79.x = _1813;
    out.m_79.y = _1815;
    out.m_79.z = _1817;
    if (!_1785)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1819 = -_882;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1823 = -_886;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1827 = -_890;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1831 = _1821 * _1821;
    float _1833 = fma(_1825, _1825, _1831);
    float _1835 = fma(_1829, _1829, _1833);
    float _1837 = sqrt(_1835);
    float _1839 = rsqrt(_1835);
    float _1841 = -_1837;
    float _1843 = _1841 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1845 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1847 = precise::clamp(_1845, 0.0, 1.0);
    float _1849 = _1825 * _1839;
    float _1851 = _1821 * _1839;
    float _1853 = abs(_1847);
    float _1855 = log2(_1853);
    float _1857 = _1829 * _1839;
    float _1859 = _1849 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1861 = _1515 * _1851;
    float _1863 = -_1851;
    float _1865 = -_1859;
    float _1867 = fma(_1863, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1865);
    float _1869 = fma(_1513, _1849, _1861);
    float _1871 = -_1857;
    float _1873 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1867);
    float _1875 = fma(_1521, _1857, _1869);
    float _1877 = precise::clamp(_1875, 0.0, 1.0);
    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1881 = _1873 + _1879;
    float _1883 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1885 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1887 = precise::clamp(_1885, 0.0, 1.0);
    float _1889 = exp2(_1883);
    float _1891 = _1889 * _1887;
    float _1893 = _1877 * _1891;
    float _1895 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1897 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1899 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_77.x = _1895;
    out.m_77.y = _1897;
    out.m_77.z = _1899;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

