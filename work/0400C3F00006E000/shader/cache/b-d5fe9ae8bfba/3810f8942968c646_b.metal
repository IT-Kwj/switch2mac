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
    float4 m_55 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _642 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1604 = as_type<float>(_110);
        out.gl_Position.z = _1604;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    float _116 = in.m_49.z;
    float _118 = in.m_49.w;
    bool _120 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_114);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_114;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.z = _116;
    out.m_51.w = _118;
    if (_128)
    {
        float _134 = float(_94);
        _104 = _134;
    }
    float _136 = _104;
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
        out.m_45.x = 0.0;
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
        float _1681 = as_type<float>(_150);
        out.gl_Position.z = _1681;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_53.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _276 = in.m_49.x;
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
        float _296 = float(_94);
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
        float _444 = in.m_49.x;
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
        float _464 = float(_94);
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
        float _624 = in.m_49.x;
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
        float _644 = float(_94);
        float _646 = 1.0 / _644;
        float _648 = _132 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _654 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _666 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _652);
    float _668 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _670 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = _650 + _672;
    float _676 = 1.0 / _660;
    float _678 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _680 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _668);
    float _682 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _670);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _684;
    bool _688 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _690 = isnan(_650);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = 1.0 / _664;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _702;
    bool _706 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _708 = isnan(_650);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = in.m_57.w;
    float _720 = _674 * _676;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _724 = _650 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _726;
    float _730 = fma(_686, _720, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _732 = fma(_704, _720, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _734 = fma(_728, _720, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _736 = -_698;
    float _738 = _736 + 1.0;
    float _740 = _724 * _700;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _754 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _756 = isnan(_650);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = fma(_744, _740, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _768 = _680 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = -_716;
    float _772 = _770 + 1.0;
    float _774 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _716 * _738;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _768 + _778;
    float _782 = fma(_748, _740, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _784 = fma(_752, _740, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _786 = _682 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = _764 * _772;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _792 = _774 + _790;
    float _794 = _780 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _786 + _796;
    float _800 = _730 * _788;
    float _802 = _734 * _788;
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[28].x, _794);
    float _806 = _732 * _788;
    float _808 = -_764;
    float _810 = _808 + 1.0;
    float _812 = _780 * _780;
    float _814 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[28].z, _804);
    out.m_59.w = _718;
    float _816 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].x, _802);
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].z, _806);
    bool _822 = _814 >= 0.0;
    float _824 = fma(_792, _792, _812);
    float _826 = fma(_766, _776, _816);
    float _828 = fma(_782, _776, _818);
    float _830 = fma(_784, _776, _820);
    float _832 = fma(_798, _798, _824);
    float _834 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].x, _826);
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].y, _828);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].z, _830);
    float _840 = rsqrt(_832);
    float _842 = _834 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _844 = _836 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _848 = _782;
    int _850 = as_type<int>(_842);
    float _852 = _768;
    if (_822)
    {
        _848 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _854 = _848;
    float _856 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_822)
    {
        float _862 = _854 * 5.0;
        _850 = as_type<int>(_862);
    }
    int _864 = _850;
    if (_822)
    {
        out.m_45.x = 0.0;
    }
    out.m_61.x = _856;
    out.m_61.y = _858;
    out.m_61.z = _860;
    float _866 = _780 * _840;
    float _868 = _792 * _840;
    if (_822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2877 = as_type<float>(_864);
        out.gl_Position.z = _2877;
    }
    if (_822)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _870 = -_866;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _768);
    float _874 = _798 * _840;
    float _876 = -_868;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _880 = -_866;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _886 = _872 + _884;
    float _888 = -_874;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _894 = _878 + _892;
    float _896 = -_868;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _900 = _886 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _904 = _890 + _902;
    float _906 = -_874;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _910 = in.m_53.x;
    float _912 = in.m_53.y;
    float _914 = in.m_53.z;
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[28].x, _900);
    float _918 = _882 * _882;
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[28].z, _916);
    float _922 = fma(_898, _898, _918);
    bool _924 = _920 >= 0.0;
    float _926 = fma(_908, _908, _922);
    float _928 = sqrt(_926);
    float _930 = _918;
    float _932 = 0.0;
    if (_924)
    {
        _930 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _934 = _930;
    if (_924)
    {
        out.m_45.x = 0.0;
    }
    int _936 = 0;
    if (_924)
    {
        float _938 = _934 * 5.0;
        _936 = as_type<int>(_938);
    }
    int _940 = _936;
    if (_924)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3006 = as_type<float>(_940);
        out.gl_Position.z = _3006;
    }
    if (_924)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _942 = in.m_63.x;
    float _944 = in.m_63.y;
    float _946 = in.m_63.z;
    float _948 = _912 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _950 = _910 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _952 = _840 * _928;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _956 = _914 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _958 = _950 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _960 = _952 * _954;
    float _962 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _964 = _952 * _958;
    float _966 = _952 * _962;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _944);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _946);
    float _974 = _960 * _968;
    float _976 = _964 * _970;
    float _978 = _966 * _972;
    float _980 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _984 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _980);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _982);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _994 = _990 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _786 + _992;
    float _998 = _774 + _994;
    float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1002 = _996 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _998 + _1004;
    float _1008 = _1002 * _1002;
    float _1010 = fma(_1006, _1006, _1008);
    float _1012 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1014 = sqrt(_1010);
    float _1016 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1012);
    float _1018 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1016);
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1022 = _768 + _1020;
    bool _1024 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _998;
    float _1028 = _996;
    float _1030 = _1014;
    float _1032 = _1022;
    if (!_1024)
    {
        _852 = _998;
    }
    float _1034 = _852;
    float _1036 = _1034;
    if (!_1024)
    {
        _1026 = _996;
    }
    float _1038 = _1026;
    float _1040 = _1038;
    if (!_1024)
    {
        _1028 = _1022;
    }
    float _1042 = _1028;
    bool _1044 = !_1024;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _1014 + _1050;
        float _1054 = rsqrt(_1010);
        float _1056 = _1052 * _1048;
        float _1058 = _1022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = _1056 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = cos(_1066);
        float _1070 = fma(_1064, _1058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1072 = _1054 * _1070;
        float _1074 = _1068 + (-1.0);
        float _1076 = fma(_1006, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1078 = fma(_1002, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1080 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1022, _1068, _1080);
        _1046 = _1082;
        _1036 = _1076;
        _1040 = _1078;
        _1030 = _1054;
    }
    float _1084 = _1046;
    float _1086 = _1036;
    float _1088 = _1040;
    float _1090 = _1030;
    float _1092 = -_866;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1096 = -_868;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1100 = -_874;
    float _1102 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1088);
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1106 = _1094 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1110 = _1098 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1114 = _1102 + _1112;
    float _1116 = _1106 * _1106;
    float _1118 = fma(_1110, _1110, _1116);
    float _1120 = fma(_1114, _1114, _1118);
    float _1122 = rsqrt(_1120);
    float _1124 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1126 = _1110 * _1124;
    float _1128 = _1114 * _1124;
    float _1130 = _1126 * _1126;
    float _1132 = _1128 * _1128;
    float _1134 = _1130 + _1132;
    float _1136 = sqrt(_1134);
    bool _1138 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = _1136 + _1140;
    float _1144 = _1122;
    float _1146 = _1134;
    float _1148 = _1142;
    float _1150 = _1124;
    float _1152 = _1126;
    if (_1138)
    {
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1154;
    }
    float _1156 = _1144;
    if (_1138)
    {
        float _1158 = rsqrt(_1134);
        _1146 = _1158;
    }
    float _1160 = _1146;
    float _1162 = _1160;
    if (_1138)
    {
        float _1164 = _1142 * _1156;
        _1148 = _1164;
    }
    float _1166 = _1148;
    if (_1138)
    {
        float _1168 = _1166 * 0.15915493667125701904296875;
        _1032 = _1168;
    }
    float _1170 = _1032;
    float _1172 = _1090;
    if (_1138)
    {
        float _1174 = _1170 * 6.283185482025146484375;
        float _1176 = sin(_1174);
        _1172 = _1176;
    }
    float _1178 = _1172;
    float _1180 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1182 = precise::max(0.0, _1180);
    float _1184 = _1114;
    float _1186 = _1182;
    float _1188 = _1180;
    if (_1138)
    {
        float _1190 = _1170 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        _1184 = _1192;
    }
    float _1194 = _1184;
    float _1196 = -_1124;
    float _1198 = -_1182;
    float _1200 = fma(_1106, _1196, _1198);
    if (_1138)
    {
        float _1202 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1202;
    }
    float _1204 = _1186;
    float _1206 = sqrt(_1120);
    float _1208 = _1178;
    float _1210 = _1204;
    if (_1138)
    {
        float _1212 = fma(_1178, _1204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1208 = _1212;
    }
    float _1214 = _1208;
    float _1216 = _1214;
    if (!_1138)
    {
        _1210 = _1128;
    }
    float _1218 = _1210;
    float _1220 = _1218;
    if (_1138)
    {
        float _1222 = _1194 + (-1.0);
        _1188 = _1222;
    }
    float _1224 = _1188;
    float _1226 = _1224;
    if (_1138)
    {
        float _1228 = _1160 * _1214;
        _932 = _1228;
    }
    float _1230 = _932;
    if (!_1138)
    {
        _1216 = _1200;
    }
    float _1232 = _1216;
    float _1234 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1236 = _1232;
    if (_1138)
    {
        float _1238 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1238;
    }
    float _1240 = _1150;
    if (_1138)
    {
        float _1242 = _1126 * _1230;
        _1152 = _1242;
    }
    float _1244 = _1152;
    if (!_1138)
    {
        _1162 = _1130;
    }
    float _1246 = _1162;
    float _1248 = _1246;
    if (_1138)
    {
        float _1250 = _1128 * _1230;
        _1220 = _1250;
    }
    float _1252 = _1220;
    if (_1138)
    {
        float _1254 = fma(_1200, _1194, _1240);
        _1236 = _1254;
    }
    float _1256 = _1236;
    if (_1138)
    {
        float _1258 = _1244 * _1244;
        _1248 = _1258;
    }
    float _1260 = _1248;
    if (!_1138)
    {
        _1226 = _1132;
    }
    float _1262 = _1226;
    float _1264 = _1262;
    if (_1138)
    {
        float _1266 = _1252 * _1252;
        _1264 = _1266;
    }
    float _1268 = _1264;
    float _1270 = fma(_1256, _1256, _1260);
    float _1272 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1234);
    float _1274 = _1270 + _1268;
    float _1276 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1280 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1278);
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1286 = rsqrt(_1274);
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1276);
    float _1290 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1292 = -_1282;
    float _1294 = _1292 + 1.0;
    float _1296 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1298 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1288);
    float _1300 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1290);
    float _1302 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1272);
    float _1304 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1296);
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1308 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1300);
    float _1310 = abs(_1294);
    float _1312 = log2(_1310);
    float _1314 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1304);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1320 = _1286 * _1244;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1324 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1326 = -_1316;
    float _1328 = fma(_1326, _1284, 1.0);
    float _1330 = _1286 * _1256;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1324);
    float _1336 = _1286 * _1252;
    float _1338 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1340 = -_1332;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1340);
    float _1344 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1334);
    float _1346 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1348 = log2(_1328);
    float _1350 = -_1336;
    float _1352 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1342);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1344);
    float _1356 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1358 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1360 = fma(_1352, -0.5, 0.5);
    float _1362 = fma(_1352, 0.5, 0.5);
    float _1364 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1356);
    float _1366 = exp2(_1346);
    float _1368 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1358);
    float _1370 = _1330 + 1.0;
    float _1372 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1364);
    float _1374 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1376 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1372);
    float _1378 = 1.0 / _1354;
    float _1380 = fma(_1362, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1382 = _1348 * 0.693147182464599609375;
    float _1384 = fma(_1362, _1380, -0.212114393711090087890625);
    float _1386 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1388 = sqrt(_1360);
    float _1390 = -_1330;
    float _1392 = fma(_1366, _1370, _1390);
    float _1394 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1374);
    float _1396 = fma(_1362, _1384, 1.570728778839111328125);
    float _1398 = fma(_1392, 0.5, 0.5);
    float _1400 = _1376 * _1378;
    float _1402 = _1394 * _1378;
    float _1404 = fma(_1400, 0.5, 0.5);
    float _1406 = fma(_1402, -0.5, 0.5);
    float _1408 = _1388 * 0.636619746685028076171875;
    float3 _3798 = float3(_1404, _1406, _1386);
    float _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3798, float3(0.0), isnan(_3798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3798, float3(0.0), isnan(_3798)), level(0.0)).x;
    float3 _3809 = float3(_1404, _1406, _1386);
    float4 _1413 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3809, float3(0.0), isnan(_3809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3809, float3(0.0), isnan(_3809)), level(0.0)).xyzw;
    float _1415 = _1413.x;
    float _1417 = _1413.y;
    float _1419 = _1413.z;
    float _1421 = _1413.w;
    float _1423 = -_1396;
    float _1425 = fma(_1408, _1423, 1.0);
    float2 _3831 = float2(_1425, _1398);
    float3 _1429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3831, float2(0.0), isnan(_3831)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3831, float2(0.0), isnan(_3831)), level(0.0)).xyz;
    float _1431 = _1429.x;
    float _1433 = _1429.y;
    float _1435 = _1429.z;
    float _1437 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1439 = in.m_65.x;
    float _1441 = in.m_65.y;
    float _1443 = in.m_65.z;
    bool _1445 = _944 != 0.0;
    bool _1447 = isnan(_944);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan(0.0);
    bool _1453 = _1449 || _1451;
    float _1455 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _878;
    out.m_67.y = _872;
    out.m_67.z = _890;
    float _1457 = exp2(_1437);
    bool _1459 = _942 == 0.0;
    bool _1461 = !_1453;
    bool _1463 = _1459 && _1461;
    float _1465 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1455);
    out.m_69.x = _1098;
    out.m_69.y = _1094;
    out.m_69.z = _1102;
    bool _1467 = _946 == 0.0;
    bool _1469 = _1467 && _1463;
    float _1471 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1465);
    float _1473 = _1354 * 0.5;
    float _1475 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1394;
    out.gl_Position.z = _1475;
    out.gl_Position.w = _1354;
    float _1477 = -_1457;
    float _1479 = _1477 + 1.0;
    float _1481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1483 = _1441;
    float _1485 = _1439;
    float _1487 = _1443;
    if (!_1469)
    {
        float _1489 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1441);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1469)
    {
        float _1495 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1439);
        _1485 = _1495;
    }
    float _1497 = _1485;
    if (!_1469)
    {
        float _1499 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1443);
        _1487 = _1499;
    }
    float _1501 = _1487;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1505 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1509 = _1475 + _1354;
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1503);
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1505);
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1507);
    float _1517 = _1376 + _1354;
    float _1519 = -_1493;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1511);
    float _1525 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1513);
    float _1527 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1515);
    float _1529 = fma(_1394, -0.5, _1473);
    float _1531 = _1509 * 0.5;
    float _1533 = _1517 * 0.5;
    out.m_45.x = _1481;
    out.m_71.x = _1523;
    out.m_71.y = _1525;
    out.m_71.z = _1527;
    out.m_73.x = _1533;
    out.m_73.y = _1529;
    out.m_73.z = _1531;
    out.m_73.w = _1354;
    float _1535 = _1493 * _1410;
    float _1537 = _1421 * _1535;
    float _1539 = _1421 * _1521;
    float _1541 = _1435 * _1535;
    float _1543 = fma(_1431, _1537, _1415);
    float _1545 = fma(_1433, _1537, _1417);
    float _1547 = fma(_1421, _1541, _1419);
    out.m_75.x = _1543;
    out.m_75.y = _1545;
    out.m_75.z = _1547;
    out.m_75.w = _1539;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _642 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1604 = as_type<float>(_110);
        out.gl_Position.z = _1604;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    float _116 = in.m_49.z;
    float _118 = in.m_49.w;
    bool _120 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_114);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_114;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.z = _116;
    out.m_51.w = _118;
    if (_128)
    {
        float _134 = float(_94);
        _104 = _134;
    }
    float _136 = _104;
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
        out.m_45.x = 0.0;
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
        float _1681 = as_type<float>(_150);
        out.gl_Position.z = _1681;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_53.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _276 = in.m_49.x;
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
        float _296 = float(_94);
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
        float _444 = in.m_49.x;
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
        float _464 = float(_94);
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
        float _624 = in.m_49.x;
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
        float _644 = float(_94);
        float _646 = 1.0 / _644;
        float _648 = _132 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _654 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _666 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _652);
    float _668 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _670 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = _650 + _672;
    float _676 = 1.0 / _660;
    float _678 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _680 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _668);
    float _682 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _670);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _684;
    bool _688 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _690 = isnan(_650);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = 1.0 / _664;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _702;
    bool _706 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _708 = isnan(_650);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = in.m_57.w;
    float _720 = _674 * _676;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _724 = _650 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _726;
    float _730 = fma(_686, _720, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _732 = fma(_704, _720, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _734 = fma(_728, _720, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _736 = -_698;
    float _738 = _736 + 1.0;
    float _740 = _724 * _700;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _754 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _756 = isnan(_650);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = fma(_744, _740, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _768 = _680 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = -_716;
    float _772 = _770 + 1.0;
    float _774 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _716 * _738;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _768 + _778;
    float _782 = fma(_748, _740, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _784 = fma(_752, _740, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _786 = _682 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = _764 * _772;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _792 = _774 + _790;
    float _794 = _780 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _786 + _796;
    float _800 = _730 * _788;
    float _802 = _734 * _788;
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[28].x, _794);
    float _806 = _732 * _788;
    float _808 = -_764;
    float _810 = _808 + 1.0;
    float _812 = _780 * _780;
    float _814 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[28].z, _804);
    out.m_59.w = _718;
    float _816 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].x, _802);
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].z, _806);
    bool _822 = _814 >= 0.0;
    float _824 = fma(_792, _792, _812);
    float _826 = fma(_766, _776, _816);
    float _828 = fma(_782, _776, _818);
    float _830 = fma(_784, _776, _820);
    float _832 = fma(_798, _798, _824);
    float _834 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].x, _826);
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].y, _828);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].z, _830);
    float _840 = rsqrt(_832);
    float _842 = _834 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _844 = _836 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _848 = _782;
    int _850 = as_type<int>(_842);
    float _852 = _768;
    if (_822)
    {
        _848 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _854 = _848;
    float _856 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_822)
    {
        float _862 = _854 * 5.0;
        _850 = as_type<int>(_862);
    }
    int _864 = _850;
    if (_822)
    {
        out.m_45.x = 0.0;
    }
    out.m_61.x = _856;
    out.m_61.y = _858;
    out.m_61.z = _860;
    float _866 = _780 * _840;
    float _868 = _792 * _840;
    if (_822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2877 = as_type<float>(_864);
        out.gl_Position.z = _2877;
    }
    if (_822)
    {
        return out;
    }
    float _870 = -_866;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _768);
    float _874 = _798 * _840;
    float _876 = -_868;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _880 = -_866;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _886 = _872 + _884;
    float _888 = -_874;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _894 = _878 + _892;
    float _896 = -_868;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _900 = _886 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _904 = _890 + _902;
    float _906 = -_874;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _910 = in.m_53.x;
    float _912 = in.m_53.y;
    float _914 = in.m_53.z;
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[28].x, _900);
    float _918 = _882 * _882;
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[28].z, _916);
    float _922 = fma(_898, _898, _918);
    bool _924 = _920 >= 0.0;
    float _926 = fma(_908, _908, _922);
    float _928 = sqrt(_926);
    float _930 = _918;
    float _932 = 0.0;
    if (_924)
    {
        _930 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _934 = _930;
    if (_924)
    {
        out.m_45.x = 0.0;
    }
    int _936 = 0;
    if (_924)
    {
        float _938 = _934 * 5.0;
        _936 = as_type<int>(_938);
    }
    int _940 = _936;
    if (_924)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3006 = as_type<float>(_940);
        out.gl_Position.z = _3006;
    }
    if (_924)
    {
        return out;
    }
    float _942 = in.m_63.x;
    float _944 = in.m_63.y;
    float _946 = in.m_63.z;
    float _948 = _912 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _950 = _910 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _952 = _840 * _928;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _956 = _914 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _958 = _950 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _960 = _952 * _954;
    float _962 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _964 = _952 * _958;
    float _966 = _952 * _962;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _944);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _946);
    float _974 = _960 * _968;
    float _976 = _964 * _970;
    float _978 = _966 * _972;
    float _980 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _984 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _980);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _982);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _994 = _990 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _786 + _992;
    float _998 = _774 + _994;
    float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1002 = _996 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _998 + _1004;
    float _1008 = _1002 * _1002;
    float _1010 = fma(_1006, _1006, _1008);
    float _1012 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1014 = sqrt(_1010);
    float _1016 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1012);
    float _1018 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1016);
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1022 = _768 + _1020;
    bool _1024 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _998;
    float _1028 = _996;
    float _1030 = _1014;
    float _1032 = _1022;
    if (!_1024)
    {
        _852 = _998;
    }
    float _1034 = _852;
    float _1036 = _1034;
    if (!_1024)
    {
        _1026 = _996;
    }
    float _1038 = _1026;
    float _1040 = _1038;
    if (!_1024)
    {
        _1028 = _1022;
    }
    float _1042 = _1028;
    bool _1044 = !_1024;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _1014 + _1050;
        float _1054 = rsqrt(_1010);
        float _1056 = _1052 * _1048;
        float _1058 = _1022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = _1056 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = cos(_1066);
        float _1070 = fma(_1064, _1058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1072 = _1054 * _1070;
        float _1074 = _1068 + (-1.0);
        float _1076 = fma(_1006, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1078 = fma(_1002, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1080 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1022, _1068, _1080);
        _1046 = _1082;
        _1036 = _1076;
        _1040 = _1078;
        _1030 = _1054;
    }
    float _1084 = _1046;
    float _1086 = _1036;
    float _1088 = _1040;
    float _1090 = _1030;
    float _1092 = -_866;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1096 = -_868;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1100 = -_874;
    float _1102 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1088);
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1106 = _1094 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1110 = _1098 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1114 = _1102 + _1112;
    float _1116 = _1106 * _1106;
    float _1118 = fma(_1110, _1110, _1116);
    float _1120 = fma(_1114, _1114, _1118);
    float _1122 = rsqrt(_1120);
    float _1124 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1126 = _1110 * _1124;
    float _1128 = _1114 * _1124;
    float _1130 = _1126 * _1126;
    float _1132 = _1128 * _1128;
    float _1134 = _1130 + _1132;
    float _1136 = sqrt(_1134);
    bool _1138 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = _1136 + _1140;
    float _1144 = _1122;
    float _1146 = _1134;
    float _1148 = _1142;
    float _1150 = _1124;
    float _1152 = _1126;
    if (_1138)
    {
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1154;
    }
    float _1156 = _1144;
    if (_1138)
    {
        float _1158 = rsqrt(_1134);
        _1146 = _1158;
    }
    float _1160 = _1146;
    float _1162 = _1160;
    if (_1138)
    {
        float _1164 = _1142 * _1156;
        _1148 = _1164;
    }
    float _1166 = _1148;
    if (_1138)
    {
        float _1168 = _1166 * 0.15915493667125701904296875;
        _1032 = _1168;
    }
    float _1170 = _1032;
    float _1172 = _1090;
    if (_1138)
    {
        float _1174 = _1170 * 6.283185482025146484375;
        float _1176 = sin(_1174);
        _1172 = _1176;
    }
    float _1178 = _1172;
    float _1180 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1182 = precise::max(0.0, _1180);
    float _1184 = _1114;
    float _1186 = _1182;
    float _1188 = _1180;
    if (_1138)
    {
        float _1190 = _1170 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        _1184 = _1192;
    }
    float _1194 = _1184;
    float _1196 = -_1124;
    float _1198 = -_1182;
    float _1200 = fma(_1106, _1196, _1198);
    if (_1138)
    {
        float _1202 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1202;
    }
    float _1204 = _1186;
    float _1206 = sqrt(_1120);
    float _1208 = _1178;
    float _1210 = _1204;
    if (_1138)
    {
        float _1212 = fma(_1178, _1204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1208 = _1212;
    }
    float _1214 = _1208;
    float _1216 = _1214;
    if (!_1138)
    {
        _1210 = _1128;
    }
    float _1218 = _1210;
    float _1220 = _1218;
    if (_1138)
    {
        float _1222 = _1194 + (-1.0);
        _1188 = _1222;
    }
    float _1224 = _1188;
    float _1226 = _1224;
    if (_1138)
    {
        float _1228 = _1160 * _1214;
        _932 = _1228;
    }
    float _1230 = _932;
    if (!_1138)
    {
        _1216 = _1200;
    }
    float _1232 = _1216;
    float _1234 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1236 = _1232;
    if (_1138)
    {
        float _1238 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1238;
    }
    float _1240 = _1150;
    if (_1138)
    {
        float _1242 = _1126 * _1230;
        _1152 = _1242;
    }
    float _1244 = _1152;
    if (!_1138)
    {
        _1162 = _1130;
    }
    float _1246 = _1162;
    float _1248 = _1246;
    if (_1138)
    {
        float _1250 = _1128 * _1230;
        _1220 = _1250;
    }
    float _1252 = _1220;
    if (_1138)
    {
        float _1254 = fma(_1200, _1194, _1240);
        _1236 = _1254;
    }
    float _1256 = _1236;
    if (_1138)
    {
        float _1258 = _1244 * _1244;
        _1248 = _1258;
    }
    float _1260 = _1248;
    if (!_1138)
    {
        _1226 = _1132;
    }
    float _1262 = _1226;
    float _1264 = _1262;
    if (_1138)
    {
        float _1266 = _1252 * _1252;
        _1264 = _1266;
    }
    float _1268 = _1264;
    float _1270 = fma(_1256, _1256, _1260);
    float _1272 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1234);
    float _1274 = _1270 + _1268;
    float _1276 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1280 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1278);
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1286 = rsqrt(_1274);
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1276);
    float _1290 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1292 = -_1282;
    float _1294 = _1292 + 1.0;
    float _1296 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1298 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1288);
    float _1300 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1290);
    float _1302 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1272);
    float _1304 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1296);
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1308 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1300);
    float _1310 = abs(_1294);
    float _1312 = log2(_1310);
    float _1314 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1304);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1320 = _1286 * _1244;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1324 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1326 = -_1316;
    float _1328 = fma(_1326, _1284, 1.0);
    float _1330 = _1286 * _1256;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1324);
    float _1336 = _1286 * _1252;
    float _1338 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1340 = -_1332;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1340);
    float _1344 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1334);
    float _1346 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1348 = log2(_1328);
    float _1350 = -_1336;
    float _1352 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1342);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1344);
    float _1356 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1358 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1360 = fma(_1352, -0.5, 0.5);
    float _1362 = fma(_1352, 0.5, 0.5);
    float _1364 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1356);
    float _1366 = exp2(_1346);
    float _1368 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1358);
    float _1370 = _1330 + 1.0;
    float _1372 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1364);
    float _1374 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1376 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1372);
    float _1378 = 1.0 / _1354;
    float _1380 = fma(_1362, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1382 = _1348 * 0.693147182464599609375;
    float _1384 = fma(_1362, _1380, -0.212114393711090087890625);
    float _1386 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1388 = sqrt(_1360);
    float _1390 = -_1330;
    float _1392 = fma(_1366, _1370, _1390);
    float _1394 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1374);
    float _1396 = fma(_1362, _1384, 1.570728778839111328125);
    float _1398 = fma(_1392, 0.5, 0.5);
    float _1400 = _1376 * _1378;
    float _1402 = _1394 * _1378;
    float _1404 = fma(_1400, 0.5, 0.5);
    float _1406 = fma(_1402, -0.5, 0.5);
    float _1408 = _1388 * 0.636619746685028076171875;
    float3 _3798 = float3(_1404, _1406, _1386);
    float _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3798, float3(0.0), isnan(_3798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3798, float3(0.0), isnan(_3798)), level(0.0)).x;
    float3 _3809 = float3(_1404, _1406, _1386);
    float4 _1413 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3809, float3(0.0), isnan(_3809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3809, float3(0.0), isnan(_3809)), level(0.0)).xyzw;
    float _1415 = _1413.x;
    float _1417 = _1413.y;
    float _1419 = _1413.z;
    float _1421 = _1413.w;
    float _1423 = -_1396;
    float _1425 = fma(_1408, _1423, 1.0);
    float2 _3831 = float2(_1425, _1398);
    float3 _1429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3831, float2(0.0), isnan(_3831)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3831, float2(0.0), isnan(_3831)), level(0.0)).xyz;
    float _1431 = _1429.x;
    float _1433 = _1429.y;
    float _1435 = _1429.z;
    float _1437 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1439 = in.m_65.x;
    float _1441 = in.m_65.y;
    float _1443 = in.m_65.z;
    bool _1445 = _944 != 0.0;
    bool _1447 = isnan(_944);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan(0.0);
    bool _1453 = _1449 || _1451;
    float _1455 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _878;
    out.m_67.y = _872;
    out.m_67.z = _890;
    float _1457 = exp2(_1437);
    bool _1459 = _942 == 0.0;
    bool _1461 = !_1453;
    bool _1463 = _1459 && _1461;
    float _1465 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1455);
    out.m_69.x = _1098;
    out.m_69.y = _1094;
    out.m_69.z = _1102;
    bool _1467 = _946 == 0.0;
    bool _1469 = _1467 && _1463;
    float _1471 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1465);
    float _1473 = _1354 * 0.5;
    float _1475 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1394;
    out.gl_Position.z = _1475;
    out.gl_Position.w = _1354;
    float _1477 = -_1457;
    float _1479 = _1477 + 1.0;
    float _1481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1483 = _1441;
    float _1485 = _1439;
    float _1487 = _1443;
    if (!_1469)
    {
        float _1489 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1441);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1469)
    {
        float _1495 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1439);
        _1485 = _1495;
    }
    float _1497 = _1485;
    if (!_1469)
    {
        float _1499 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1443);
        _1487 = _1499;
    }
    float _1501 = _1487;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1505 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1509 = _1475 + _1354;
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1503);
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1505);
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1507);
    float _1517 = _1376 + _1354;
    float _1519 = -_1493;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1511);
    float _1525 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1513);
    float _1527 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1515);
    float _1529 = fma(_1394, -0.5, _1473);
    float _1531 = _1509 * 0.5;
    float _1533 = _1517 * 0.5;
    out.m_45.x = _1481;
    out.m_71.x = _1523;
    out.m_71.y = _1525;
    out.m_71.z = _1527;
    out.m_73.x = _1533;
    out.m_73.y = _1529;
    out.m_73.z = _1531;
    out.m_73.w = _1354;
    float _1535 = _1493 * _1410;
    float _1537 = _1421 * _1535;
    float _1539 = _1421 * _1521;
    float _1541 = _1435 * _1535;
    float _1543 = fma(_1431, _1537, _1415);
    float _1545 = fma(_1433, _1537, _1417);
    float _1547 = fma(_1421, _1541, _1419);
    out.m_75.x = _1543;
    out.m_75.y = _1545;
    out.m_75.z = _1547;
    out.m_75.w = _1539;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _642 = false;
    bool _462 = false;
    bool _294 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1604 = as_type<float>(_110);
        out.gl_Position.z = _1604;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    float _116 = in.m_49.z;
    float _118 = in.m_49.w;
    bool _120 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_114);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_114;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.z = _116;
    out.m_51.w = _118;
    if (_128)
    {
        float _134 = float(_94);
        _104 = _134;
    }
    float _136 = _104;
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
        out.m_45.x = 0.0;
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
        float _1681 = as_type<float>(_150);
        out.gl_Position.z = _1681;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_53.w;
    float _154 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
        float _276 = in.m_49.x;
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
        float _296 = float(_94);
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
        float _444 = in.m_49.x;
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
        float _464 = float(_94);
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
        float _624 = in.m_49.x;
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
        float _644 = float(_94);
        float _646 = 1.0 / _644;
        float _648 = _132 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = _270 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _654 = _270 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _656 = _270 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _658;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _666 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].x, _652);
    float _668 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].x, _654);
    float _670 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].x, _656);
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = _650 + _672;
    float _676 = 1.0 / _660;
    float _678 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].z, _666);
    float _680 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].z, _668);
    float _682 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].z, _670);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _684;
    bool _688 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _690 = isnan(_650);
    bool _692 = _688 || _690;
    bool _694 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _696 = _692 || _694;
    float _698 = float(_696);
    float _700 = 1.0 / _664;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _702;
    bool _706 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _708 = isnan(_650);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = in.m_57.w;
    float _720 = _674 * _676;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _724 = _650 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _726;
    float _730 = fma(_686, _720, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _732 = fma(_704, _720, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _734 = fma(_728, _720, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _736 = -_698;
    float _738 = _736 + 1.0;
    float _740 = _724 * _700;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _748 = _746 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _754 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _756 = isnan(_650);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = fma(_744, _740, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _768 = _680 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _770 = -_716;
    float _772 = _770 + 1.0;
    float _774 = _678 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _776 = _716 * _738;
    float _778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _780 = _768 + _778;
    float _782 = fma(_748, _740, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _784 = fma(_752, _740, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _786 = _682 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = _764 * _772;
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _792 = _774 + _790;
    float _794 = _780 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _798 = _786 + _796;
    float _800 = _730 * _788;
    float _802 = _734 * _788;
    float _804 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[28].x, _794);
    float _806 = _732 * _788;
    float _808 = -_764;
    float _810 = _808 + 1.0;
    float _812 = _780 * _780;
    float _814 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[28].z, _804);
    out.m_59.w = _718;
    float _816 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].x, _802);
    float _818 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].y, _800);
    float _820 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[123].z, _806);
    bool _822 = _814 >= 0.0;
    float _824 = fma(_792, _792, _812);
    float _826 = fma(_766, _776, _816);
    float _828 = fma(_782, _776, _818);
    float _830 = fma(_784, _776, _820);
    float _832 = fma(_798, _798, _824);
    float _834 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].x, _826);
    float _836 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].y, _828);
    float _838 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[125].z, _830);
    float _840 = rsqrt(_832);
    float _842 = _834 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _844 = _836 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _846 = _838 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _848 = _782;
    int _850 = as_type<int>(_842);
    float _852 = _768;
    if (_822)
    {
        _848 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _854 = _848;
    float _856 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_822)
    {
        float _862 = _854 * 5.0;
        _850 = as_type<int>(_862);
    }
    int _864 = _850;
    if (_822)
    {
        out.m_45.x = 0.0;
    }
    out.m_61.x = _856;
    out.m_61.y = _858;
    out.m_61.z = _860;
    float _866 = _780 * _840;
    float _868 = _792 * _840;
    if (_822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2877 = as_type<float>(_864);
        out.gl_Position.z = _2877;
    }
    if (_822)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _870 = -_866;
    float _872 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _768);
    float _874 = _798 * _840;
    float _876 = -_868;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    float _880 = -_866;
    float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[18].w, _780);
    float _884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _886 = _872 + _884;
    float _888 = -_874;
    float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[18].w, _786);
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _894 = _878 + _892;
    float _896 = -_868;
    float _898 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[18].w, _792);
    float _900 = _886 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _904 = _890 + _902;
    float _906 = -_874;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _910 = in.m_53.x;
    float _912 = in.m_53.y;
    float _914 = in.m_53.z;
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[28].x, _900);
    float _918 = _882 * _882;
    float _920 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[28].z, _916);
    float _922 = fma(_898, _898, _918);
    bool _924 = _920 >= 0.0;
    float _926 = fma(_908, _908, _922);
    float _928 = sqrt(_926);
    float _930 = _918;
    float _932 = 0.0;
    if (_924)
    {
        _930 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _934 = _930;
    if (_924)
    {
        out.m_45.x = 0.0;
    }
    int _936 = 0;
    if (_924)
    {
        float _938 = _934 * 5.0;
        _936 = as_type<int>(_938);
    }
    int _940 = _936;
    if (_924)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3006 = as_type<float>(_940);
        out.gl_Position.z = _3006;
    }
    if (_924)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _942 = in.m_63.x;
    float _944 = in.m_63.y;
    float _946 = in.m_63.z;
    float _948 = _912 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _950 = _910 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _952 = _840 * _928;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _956 = _914 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _958 = _950 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _960 = _952 * _954;
    float _962 = _956 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _964 = _952 * _958;
    float _966 = _952 * _962;
    float _968 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _944);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _942);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _946);
    float _974 = _960 * _968;
    float _976 = _964 * _970;
    float _978 = _966 * _972;
    float _980 = _974 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _982 = _974 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _984 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _980);
    float _986 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _982);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[26].z, _984);
    float _990 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[24].z, _986);
    float _992 = _988 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _994 = _990 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _996 = _786 + _992;
    float _998 = _774 + _994;
    float _1000 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1002 = _996 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1006 = _998 + _1004;
    float _1008 = _1002 * _1002;
    float _1010 = fma(_1006, _1006, _1008);
    float _1012 = _974 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1014 = sqrt(_1010);
    float _1016 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1012);
    float _1018 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1016);
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1022 = _768 + _1020;
    bool _1024 = _1014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1026 = _998;
    float _1028 = _996;
    float _1030 = _1014;
    float _1032 = _1022;
    if (!_1024)
    {
        _852 = _998;
    }
    float _1034 = _852;
    float _1036 = _1034;
    if (!_1024)
    {
        _1026 = _996;
    }
    float _1038 = _1026;
    float _1040 = _1038;
    if (!_1024)
    {
        _1028 = _1022;
    }
    float _1042 = _1028;
    bool _1044 = !_1024;
    float _1046 = _1042;
    if (!_1044)
    {
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1052 = _1014 + _1050;
        float _1054 = rsqrt(_1010);
        float _1056 = _1052 * _1048;
        float _1058 = _1022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1060 = _1056 * 0.15915493667125701904296875;
        float _1062 = _1060 * 6.283185482025146484375;
        float _1064 = sin(_1062);
        float _1066 = _1060 * 6.283185482025146484375;
        float _1068 = cos(_1066);
        float _1070 = fma(_1064, _1058, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1072 = _1054 * _1070;
        float _1074 = _1068 + (-1.0);
        float _1076 = fma(_1006, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1078 = fma(_1002, _1072, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1080 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1082 = fma(_1022, _1068, _1080);
        _1046 = _1082;
        _1036 = _1076;
        _1040 = _1078;
        _1030 = _1054;
    }
    float _1084 = _1046;
    float _1086 = _1036;
    float _1088 = _1040;
    float _1090 = _1030;
    float _1092 = -_866;
    float _1094 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1084);
    float _1096 = -_868;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1100 = -_874;
    float _1102 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1088);
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1106 = _1094 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1110 = _1098 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1114 = _1102 + _1112;
    float _1116 = _1106 * _1106;
    float _1118 = fma(_1110, _1110, _1116);
    float _1120 = fma(_1114, _1114, _1118);
    float _1122 = rsqrt(_1120);
    float _1124 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1126 = _1110 * _1124;
    float _1128 = _1114 * _1124;
    float _1130 = _1126 * _1126;
    float _1132 = _1128 * _1128;
    float _1134 = _1130 + _1132;
    float _1136 = sqrt(_1134);
    bool _1138 = _1136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1142 = _1136 + _1140;
    float _1144 = _1122;
    float _1146 = _1134;
    float _1148 = _1142;
    float _1150 = _1124;
    float _1152 = _1126;
    if (_1138)
    {
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1154;
    }
    float _1156 = _1144;
    if (_1138)
    {
        float _1158 = rsqrt(_1134);
        _1146 = _1158;
    }
    float _1160 = _1146;
    float _1162 = _1160;
    if (_1138)
    {
        float _1164 = _1142 * _1156;
        _1148 = _1164;
    }
    float _1166 = _1148;
    if (_1138)
    {
        float _1168 = _1166 * 0.15915493667125701904296875;
        _1032 = _1168;
    }
    float _1170 = _1032;
    float _1172 = _1090;
    if (_1138)
    {
        float _1174 = _1170 * 6.283185482025146484375;
        float _1176 = sin(_1174);
        _1172 = _1176;
    }
    float _1178 = _1172;
    float _1180 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1182 = precise::max(0.0, _1180);
    float _1184 = _1114;
    float _1186 = _1182;
    float _1188 = _1180;
    if (_1138)
    {
        float _1190 = _1170 * 6.283185482025146484375;
        float _1192 = cos(_1190);
        _1184 = _1192;
    }
    float _1194 = _1184;
    float _1196 = -_1124;
    float _1198 = -_1182;
    float _1200 = fma(_1106, _1196, _1198);
    if (_1138)
    {
        float _1202 = _1200 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1202;
    }
    float _1204 = _1186;
    float _1206 = sqrt(_1120);
    float _1208 = _1178;
    float _1210 = _1204;
    if (_1138)
    {
        float _1212 = fma(_1178, _1204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1208 = _1212;
    }
    float _1214 = _1208;
    float _1216 = _1214;
    if (!_1138)
    {
        _1210 = _1128;
    }
    float _1218 = _1210;
    float _1220 = _1218;
    if (_1138)
    {
        float _1222 = _1194 + (-1.0);
        _1188 = _1222;
    }
    float _1224 = _1188;
    float _1226 = _1224;
    if (_1138)
    {
        float _1228 = _1160 * _1214;
        _932 = _1228;
    }
    float _1230 = _932;
    if (!_1138)
    {
        _1216 = _1200;
    }
    float _1232 = _1216;
    float _1234 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1236 = _1232;
    if (_1138)
    {
        float _1238 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1150 = _1238;
    }
    float _1240 = _1150;
    if (_1138)
    {
        float _1242 = _1126 * _1230;
        _1152 = _1242;
    }
    float _1244 = _1152;
    if (!_1138)
    {
        _1162 = _1130;
    }
    float _1246 = _1162;
    float _1248 = _1246;
    if (_1138)
    {
        float _1250 = _1128 * _1230;
        _1220 = _1250;
    }
    float _1252 = _1220;
    if (_1138)
    {
        float _1254 = fma(_1200, _1194, _1240);
        _1236 = _1254;
    }
    float _1256 = _1236;
    if (_1138)
    {
        float _1258 = _1244 * _1244;
        _1248 = _1258;
    }
    float _1260 = _1248;
    if (!_1138)
    {
        _1226 = _1132;
    }
    float _1262 = _1226;
    float _1264 = _1262;
    if (_1138)
    {
        float _1266 = _1252 * _1252;
        _1264 = _1266;
    }
    float _1268 = _1264;
    float _1270 = fma(_1256, _1256, _1260);
    float _1272 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1234);
    float _1274 = _1270 + _1268;
    float _1276 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1280 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1278);
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1286 = rsqrt(_1274);
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1276);
    float _1290 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1292 = -_1282;
    float _1294 = _1292 + 1.0;
    float _1296 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1298 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1288);
    float _1300 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1290);
    float _1302 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1272);
    float _1304 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1296);
    float _1306 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1308 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1300);
    float _1310 = abs(_1294);
    float _1312 = log2(_1310);
    float _1314 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1304);
    float _1316 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1320 = _1286 * _1244;
    float _1322 = _1314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1324 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1326 = -_1316;
    float _1328 = fma(_1326, _1284, 1.0);
    float _1330 = _1286 * _1256;
    float _1332 = _1320 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1324);
    float _1336 = _1286 * _1252;
    float _1338 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1340 = -_1332;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1340);
    float _1344 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1334);
    float _1346 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1348 = log2(_1328);
    float _1350 = -_1336;
    float _1352 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1342);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1344);
    float _1356 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1358 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1360 = fma(_1352, -0.5, 0.5);
    float _1362 = fma(_1352, 0.5, 0.5);
    float _1364 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1356);
    float _1366 = exp2(_1346);
    float _1368 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1358);
    float _1370 = _1330 + 1.0;
    float _1372 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1364);
    float _1374 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1368);
    float _1376 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1372);
    float _1378 = 1.0 / _1354;
    float _1380 = fma(_1362, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1382 = _1348 * 0.693147182464599609375;
    float _1384 = fma(_1362, _1380, -0.212114393711090087890625);
    float _1386 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1388 = sqrt(_1360);
    float _1390 = -_1330;
    float _1392 = fma(_1366, _1370, _1390);
    float _1394 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1374);
    float _1396 = fma(_1362, _1384, 1.570728778839111328125);
    float _1398 = fma(_1392, 0.5, 0.5);
    float _1400 = _1376 * _1378;
    float _1402 = _1394 * _1378;
    float _1404 = fma(_1400, 0.5, 0.5);
    float _1406 = fma(_1402, -0.5, 0.5);
    float _1408 = _1388 * 0.636619746685028076171875;
    float3 _3798 = float3(_1404, _1406, _1386);
    float _1410 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3798, float3(0.0), isnan(_3798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3798, float3(0.0), isnan(_3798)), level(0.0)).x;
    float3 _3809 = float3(_1404, _1406, _1386);
    float4 _1413 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3809, float3(0.0), isnan(_3809)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3809, float3(0.0), isnan(_3809)), level(0.0)).xyzw;
    float _1415 = _1413.x;
    float _1417 = _1413.y;
    float _1419 = _1413.z;
    float _1421 = _1413.w;
    float _1423 = -_1396;
    float _1425 = fma(_1408, _1423, 1.0);
    float2 _3831 = float2(_1425, _1398);
    float3 _1429 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3831, float2(0.0), isnan(_3831)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3831, float2(0.0), isnan(_3831)), level(0.0)).xyz;
    float _1431 = _1429.x;
    float _1433 = _1429.y;
    float _1435 = _1429.z;
    float _1437 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1439 = in.m_65.x;
    float _1441 = in.m_65.y;
    float _1443 = in.m_65.z;
    bool _1445 = _944 != 0.0;
    bool _1447 = isnan(_944);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan(0.0);
    bool _1453 = _1449 || _1451;
    float _1455 = _1318 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_67.x = _878;
    out.m_67.y = _872;
    out.m_67.z = _890;
    float _1457 = exp2(_1437);
    bool _1459 = _942 == 0.0;
    bool _1461 = !_1453;
    bool _1463 = _1459 && _1461;
    float _1465 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1455);
    out.m_69.x = _1098;
    out.m_69.y = _1094;
    out.m_69.z = _1102;
    bool _1467 = _946 == 0.0;
    bool _1469 = _1467 && _1463;
    float _1471 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1465);
    float _1473 = _1354 * 0.5;
    float _1475 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1471);
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1394;
    out.gl_Position.z = _1475;
    out.gl_Position.w = _1354;
    float _1477 = -_1457;
    float _1479 = _1477 + 1.0;
    float _1481 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1483 = _1441;
    float _1485 = _1439;
    float _1487 = _1443;
    if (!_1469)
    {
        float _1489 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1441);
        _1483 = _1489;
    }
    float _1491 = _1483;
    float _1493 = _1479 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1469)
    {
        float _1495 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1439);
        _1485 = _1495;
    }
    float _1497 = _1485;
    if (!_1469)
    {
        float _1499 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1443);
        _1487 = _1499;
    }
    float _1501 = _1487;
    float _1503 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1505 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1507 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1509 = _1475 + _1354;
    float _1511 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1503);
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1505);
    float _1515 = fma(_1497, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1507);
    float _1517 = _1376 + _1354;
    float _1519 = -_1493;
    float _1521 = _1519 + 1.0;
    float _1523 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1511);
    float _1525 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1513);
    float _1527 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1515);
    float _1529 = fma(_1394, -0.5, _1473);
    float _1531 = _1509 * 0.5;
    float _1533 = _1517 * 0.5;
    out.m_45.x = _1481;
    out.m_71.x = _1523;
    out.m_71.y = _1525;
    out.m_71.z = _1527;
    out.m_73.x = _1533;
    out.m_73.y = _1529;
    out.m_73.z = _1531;
    out.m_73.w = _1354;
    float _1535 = _1493 * _1410;
    float _1537 = _1421 * _1535;
    float _1539 = _1421 * _1521;
    float _1541 = _1435 * _1535;
    float _1543 = fma(_1431, _1537, _1415);
    float _1545 = fma(_1433, _1537, _1417);
    float _1547 = fma(_1421, _1541, _1419);
    out.m_75.x = _1543;
    out.m_75.y = _1545;
    out.m_75.z = _1547;
    out.m_75.w = _1539;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

