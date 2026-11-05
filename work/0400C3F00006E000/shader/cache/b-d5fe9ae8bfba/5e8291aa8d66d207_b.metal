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
    float4 m_57 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _866 = false;
    bool _648 = false;
    bool _480 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2488 = as_type<float>(_114);
        out.gl_Position.z = _2488;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2558 = as_type<float>(_152);
        out.gl_Position.z = _2558;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_49.y;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _156;
    if (!_168)
    {
        float _186 = _156 * _156;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    out.m_53.y = _154;
    bool _198 = !_168;
    float _200 = _196;
    float _202 = _154;
    if (!_198)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _156 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _156);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _232;
    }
    float _234 = _200;
    bool _236 = !_168;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _184 = _256;
    }
    float _258 = _184;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _170, _262);
    float _270 = fma(_258, _172, _264);
    float _272 = fma(_258, _174, _266);
    float _274 = fma(_268, _158, _176);
    float _276 = fma(_270, _158, _178);
    float _278 = fma(_272, _158, _180);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_55.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_98);
        float _304 = 1.0 / _302;
        float _306 = _132 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _308 + _310;
    bool _314 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_308);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _308 + _326;
    bool _330 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_308);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_324;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _348;
    float _368 = _360 * _364;
    float _370 = -_360;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = 1.0 / _344;
    float _382 = _340 * _372;
    float _384 = -_340;
    float _386 = _384 + 1.0;
    float _388 = _328 * _366;
    float _390 = _312 * _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_376, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = in.m_51.x;
    float _408 = in.m_51.y;
    float _410 = in.m_51.z;
    float _412 = _400 * _382;
    float _414 = _402 * _382;
    float _416 = _404 * _382;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _432 = fma(_420, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _434 = fma(_424, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _436 = fma(_428, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _440 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _442 = fma(_432, _368, _430);
    float _444 = fma(_434, _368, _438);
    float _446 = fma(_436, _368, _440);
    float _448 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].x, _442);
    float _450 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].y, _444);
    float _452 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].z, _446);
    float _454 = _448 * _406;
    float _456 = _450 * _408;
    float _458 = _452 * _410;
    bool _460 = !_378;
    float _478;
    if (!_460)
    {
        float _462 = in.m_55.x;
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _470 = _468 * _464;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = true;
    }
    else
    {
        float _482 = float(_98);
        float _484 = 1.0 / _482;
        float _486 = _132 * _484;
        _478 = _486;
    }
    _480 = false;
    float _488 = _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _492 = _488 + _490;
    bool _494 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _496 = isnan(_488);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _508 = _488 + _506;
    bool _510 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_488);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _530 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _532 = isnan(_488);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_504;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _524;
    float _548 = _540 * _544;
    float _550 = -_540;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _528;
    float _562 = _520 * _552;
    float _564 = -_520;
    float _566 = _564 + 1.0;
    float _568 = _492 * _546;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _574;
    float _578 = fma(_556, _568, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _580 = fma(_572, _568, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _582 = fma(_576, _568, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _584 = _508 * _560;
    float _586 = _578 * _562;
    float _588 = _580 * _562;
    float _590 = _582 * _562;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _604 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].x, _586);
    float _606 = fma(_594, _584, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _608 = fma(_598, _584, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _610 = fma(_602, _584, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].y, _588);
    float _614 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _616 = fma(_606, _548, _604);
    float _618 = fma(_608, _548, _612);
    float _620 = fma(_610, _548, _614);
    float _622 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].x, _616);
    float _624 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].y, _618);
    float _626 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].z, _620);
    bool _628 = !_558;
    float _646;
    if (!_628)
    {
        float _630 = in.m_55.x;
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _634 = _630 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _638 = _636 * _632;
        float _640 = floor(_638);
        float _642 = -_640;
        float _644 = _638 + _642;
        _646 = _644;
        _648 = true;
    }
    else
    {
        float _650 = float(_98);
        float _652 = 1.0 / _650;
        float _654 = _132 * _652;
        _646 = _654;
    }
    _648 = false;
    float _656 = _646;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _656 + _658;
    float _662 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _676 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _678 = isnan(_656);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = 1.0 / _666;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _694 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _696 = isnan(_656);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _708 = _626 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _712 = 1.0 / _674;
    float _714 = _670 * _688;
    bool _716 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _718 = isnan(_656);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = 1.0 / _692;
    float _730 = -_686;
    float _732 = _730 + 1.0;
    float _734 = fma(_714, _660, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _740 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _742 = isnan(_656);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -_726;
    float _754 = _752 + 1.0;
    float _756 = _726 * _732;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = 1.0 / _738;
    float _764 = -_750;
    float _766 = _764 + 1.0;
    float _768 = _704 * _754;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _770;
    float _774 = _760 * _712;
    float _776 = _686 * _766;
    float _778 = _734 * _768;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = _656 + _780;
    float _784 = -_704;
    float _786 = _784 + 1.0;
    bool _788 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _790 = isnan(_656);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _772 * _728;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _808 = _656 + _806;
    float _810 = fma(_774, _782, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _778);
    float _814 = -_798;
    float _816 = _814 + 1.0;
    float _818 = _804 * _762;
    float _820 = fma(_800, _808, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _824 = _656 + _822;
    float _826 = fma(_810, _756, _812);
    float _828 = _750 * _816;
    float _830 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = fma(_818, _824, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _834 = fma(_820, _776, _826);
    float _836 = fma(_832, _828, _834);
    float _838 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[119].x, _836);
    float _842 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _842;
    out.m_57.y = _838;
    out.m_57.z = _830;
    out.m_57.w = _844;
    bool _846 = !_710;
    float _864;
    if (!_846)
    {
        float _848 = in.m_55.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_98);
        float _870 = 1.0 / _868;
        float _872 = _132 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = in.m_55.z;
    float _878 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _880 = in.m_55.x;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _884 = _882 != 0;
    float _886 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _888 = in.m_55.y;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _902 = _900 != 0;
    float _904 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _908 = !_894;
    int _910 = _908 ? 0 : 1;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _914 = _876 * 2.0;
    float _916 = _880 * 2.0;
    float _918 = _880 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _920 = floor(_914);
    float _922 = _888 + _876;
    float _924 = _888 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _926 = _888 * 2.0;
    float _928 = -_906;
    float _930 = fma(_918, 2.0, _928);
    float _932 = _922 + (-1.0);
    float _934 = fma(_924, -2.0, _890);
    float _936 = floor(_916);
    float _938 = _918;
    float _940 = _932;
    if (!_884)
    {
        _938 = _876;
    }
    float _942 = _938;
    float _944 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _934);
    float _948 = _942;
    if (!_884)
    {
        _940 = _876;
    }
    float _950 = _940;
    float _952 = _888 + (-0.5);
    float _954 = _950;
    if (_884)
    {
        _948 = _888;
    }
    float _956 = _948;
    float _958 = floor(_926);
    bool _960 = _920 > 0.0;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _964 = _920 >= 0.0;
    bool _966 = isnan(_920);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _956 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _976 = _920;
    if (!_884)
    {
        _976 = _888;
    }
    float _978 = _976;
    float _980 = -_132;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[76].x, _930);
    float _984 = _978;
    if (_884)
    {
        _984 = _880;
    }
    float _986 = _984;
    if (_884)
    {
        _954 = _888;
    }
    float _988 = _954;
    bool _990 = _936 > 0.0;
    float _992 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[83].z, _962);
    bool _994 = _936 >= 0.0;
    bool _996 = isnan(_936);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = _986 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1006 = !_898;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1012 = log2(_1010);
    int _1014 = _1002 ? 0 : 1;
    float _1016 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _912);
    bool _1018 = _958 > 0.0;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1022 = _958 >= 0.0;
    bool _1024 = isnan(_958);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    float _1032 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1016);
    float _1034 = -_1020;
    float _1036 = fma(_1004, 2.0, _1034);
    int _1038 = ~_1014;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    int _1044 = abs(_1008);
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1048 = _1042;
    bool _1050 = _1018;
    if (!_990)
    {
        int _1052 = ~_1014;
        int _1054 = _1052 + 1;
        _1048 = _1054;
    }
    int _1056 = _1048;
    float _1058 = float(_1044);
    float _1060 = fma(_974, -2.0, _1046);
    float _1062 = float(_1056);
    float _1064 = _1012 * _132;
    int _1066 = _1030 ? 0 : 1;
    float _1068 = in.m_59.x;
    float _1070 = in.m_59.y;
    float _1072 = in.m_59.z;
    int _1074 = _972 ? 0 : 1;
    float _1076 = _1058 * _1062;
    float _1078 = exp2(_1064);
    int _1080 = ~_1066;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1084;
    if (!_1018)
    {
        int _1088 = ~_1066;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1096 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1094);
    bool _1098 = !_902;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1104 = ~_1074;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1096);
    int _1112 = _1108;
    if (!_960)
    {
        int _1114 = ~_1074;
        int _1116 = _1114 + 1;
        _1112 = _1116;
    }
    int _1118 = _1112;
    float _1120 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1102);
    int _1122 = abs(_1100);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1126 = 1.0 + _1124;
    bool _1128 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1130 = isnan(1.0);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1136 = _1132 || _1134;
    float _1138 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1120);
    float _1140 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _992);
    float _1142 = 1.0 / _1126;
    float _1144 = _1076 * (-2.0);
    float _1146 = float(_1122);
    float _1148 = -_1078;
    float _1150 = _1148 + 1.0;
    float _1152 = float(_1092);
    bool _1154 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1156 = isnan(0.0);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1162 = _1158 || _1160;
    float _1164 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1166 = fma(_1144, _1070, _1070);
    float _1168 = fma(_944, _1144, _944);
    int _1170 = abs(_910);
    float _1172 = _1146 * _1152;
    float _1174 = _880 + _876;
    float _1176 = float(_1118);
    float _1178 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1166);
    float _1180 = float(_1170);
    float _1182 = _1172 * (-2.0);
    float _1184 = _1162 ? _1150 : 0.0;
    float _1186 = _1174 + (-1.0);
    float _1188 = -_132;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1036);
    float _1192 = _1180 * _1176;
    float _1194 = _1182;
    if (_1136)
    {
        float _1196 = _1184 * _1142;
        _134 = _1196;
    }
    float _1198 = _134;
    float _1200 = _876 + (-0.5);
    float _1202 = fma(_1182, _1072, _1072);
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1206 = _880 + _888;
    float _1208 = fma(_1168, _1198, _1178);
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1202);
    float _1212 = fma(_1204, _1182, _1204);
    float _1214 = _1192 * (-2.0);
    float _1216 = _1206 + (-1.0);
    float _1218 = _1208 * 0.15915493667125701904296875;
    float _1220 = fma(_1212, _1198, _1210);
    float _1222 = fma(_1214, _1068, _1068);
    float _1224 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1226 = _880 + (-0.5);
    float _1228 = in.m_61.x;
    float _1230 = in.m_61.y;
    float _1232 = in.m_61.z;
    float _1234 = _1220 * 0.15915493667125701904296875;
    float _1236 = fma(_1224, _1214, _1224);
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1222);
    float _1240 = _1218 * 6.283185482025146484375;
    float _1242 = sin(_1240);
    float _1244 = fma(_1236, _1198, _1238);
    bool _1246 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1248 = isnan(0.5);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    float _1256 = _1244 * 0.15915493667125701904296875;
    float _1258 = _1218 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1234 * 6.283185482025146484375;
    float _1264 = sin(_1262);
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1228);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1230);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1232);
    float _1272 = _1234 * 6.283185482025146484375;
    float _1274 = cos(_1272);
    float _1276 = _878 * _1266;
    float _1278 = _904 * _1270;
    float _1280 = _1256 * 6.283185482025146484375;
    float _1282 = cos(_1280);
    float _1284 = _886 * _1268;
    float _1286 = _1242 * _1264;
    float _1288 = _1260 * _1264;
    float _1290 = _1256 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = _1260 * _1274;
    float _1296 = _1242 * _1274;
    float _1298 = _1282 * _1274;
    float _1300 = _1282 * _1264;
    float _1302 = _1282 * _1242;
    float _1304 = _1282 * _1260;
    float _1306 = fma(_1292, _1286, _1294);
    float _1308 = -_1296;
    float _1310 = fma(_1292, _1288, _1308);
    float _1312 = fma(_1292, _1294, _1286);
    float _1314 = -_1288;
    float _1316 = fma(_1292, _1296, _1314);
    float _1318 = _1298 * _1284;
    float _1320 = _1312 * _1284;
    float _1322 = _1316 * _1284;
    float _1324 = fma(_1300, _1276, _1318);
    float _1326 = fma(_1310, _1276, _1320);
    float _1328 = fma(_1306, _1276, _1322);
    float _1330 = -_1292;
    float _1332 = fma(_1330, _1278, _1324);
    float _1334 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1336 = fma(_1304, _1278, _1326);
    float _1338 = fma(_1302, _1278, _1328);
    float _1340 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1342 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1344 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1334);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1350 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1342);
    float _1352 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1344);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    float _1358 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1350);
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1364 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1368 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1372 = _1360 + _1364;
    float _1374 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1376 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1368);
    float _1378 = _1366 + _1370;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1382 = _1372 + _1380;
    float _1384 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1374);
    float _1386 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1390 = _1378 + _1388;
    float _1392 = _1382 * _1382;
    float _1394 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1398 = fma(_1390, _1390, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1402 = sqrt(_1398);
    float _1404 = _1396 + _1400;
    bool _1406 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = _1336;
    float _1410 = _1400;
    float _1412 = _1378;
    float _1414 = _1344;
    float _1416 = _1398;
    int _1418 = as_type<int>(_1230);
    if (!_1406)
    {
        _1408 = _1378;
    }
    float _1420 = _1408;
    float _1422 = _1420;
    if (!_1406)
    {
        _1410 = _1372;
    }
    float _1424 = _1410;
    float _1426 = _1424;
    if (!_1406)
    {
        _1412 = _1404;
    }
    float _1428 = _1412;
    bool _1430 = !_1406;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1402 + _1436;
        float _1440 = rsqrt(_1398);
        float _1442 = _1438 * _1434;
        float _1444 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1404, _1450, _1460);
        float _1466 = fma(_1390, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1382, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1422 = _1466;
        _1432 = _1464;
        _1426 = _1468;
        _1414 = _1456;
    }
    float _1470 = _1422;
    float _1472 = _1432;
    float _1474 = _1426;
    float _1476 = _1414;
    float _1478 = _1472;
    float _1480 = _1470;
    float _1482 = _1474;
    float _1484 = _1476;
    if (!_1254)
    {
        float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1488 = _1396 + _1486;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1492 = _1366 + _1490;
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1496 = _1488 * _1488;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1500 = _1360 + _1498;
        float _1502 = fma(_1492, _1492, _1496);
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1506 = fma(_1500, _1500, _1502);
        float _1508 = sqrt(_1506);
        float _1510 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1512 = precise::min(_1508, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1514 = _1512 * _1504;
        float _1516 = -_1366;
        float _1518 = _1516 + _1470;
        float _1520 = _1510 * _1514;
        float _1522 = -_1396;
        float _1524 = _1522 + _1472;
        float _1526 = -_1360;
        float _1528 = _1526 + _1474;
        float _1530 = fma(_1518, _1520, _1366);
        float _1532 = fma(_1524, _1520, _1396);
        float _1534 = fma(_1528, _1520, _1360);
        _1478 = _1532;
        _1480 = _1530;
        _1482 = _1534;
        _1484 = _1528;
    }
    float _1536 = _1478;
    float _1538 = _1480;
    float _1540 = _1482;
    float _1542 = _1484;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1546 = _1536 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1538 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1554 = _1540 + _1552;
    float _1556 = _1546 * _1546;
    float _1558 = fma(_1550, _1550, _1556);
    float _1560 = fma(_1554, _1554, _1558);
    float _1562 = rsqrt(_1560);
    float _1564 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1550 * _1564;
    float _1568 = _1554 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _1390;
    float _1586 = _1574;
    float _1588 = _1582;
    float _1590 = _1564;
    if (_1578)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1592;
    }
    float _1594 = _1584;
    if (_1578)
    {
        float _1596 = rsqrt(_1574);
        _1586 = _1596;
    }
    float _1598 = _1586;
    if (_1578)
    {
        float _1600 = _1582 * _1594;
        _1588 = _1600;
    }
    float _1602 = _1588;
    if (_1578)
    {
        float _1604 = _1602 * 0.15915493667125701904296875;
        _1194 = _1604;
    }
    float _1606 = _1194;
    float _1608 = _1542;
    if (_1578)
    {
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1618 = precise::max(0.0, _1616);
    float _1620 = _1372;
    float _1622 = _1618;
    if (_1578)
    {
        float _1624 = _1606 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = -_1564;
    float _1632 = -_1618;
    float _1634 = fma(_1546, _1630, _1632);
    float _1636 = _1634;
    if (_1578)
    {
        float _1638 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1638;
    }
    float _1640 = _1622;
    float _1642 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = _1614;
    float _1646 = _1640;
    if (_1578)
    {
        float _1648 = fma(_1614, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1416 = _1648;
    }
    float _1650 = _1416;
    float _1652 = _1650;
    if (!_1578)
    {
        _1644 = _1566;
    }
    float _1654 = _1644;
    float _1656 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1658 = _1654;
    float _1660 = _1628;
    if (_1578)
    {
        float _1662 = _1628 + (-1.0);
        _1590 = _1662;
    }
    float _1664 = _1590;
    float _1666 = _1664;
    if (_1578)
    {
        float _1668 = _1598 * _1650;
        _1652 = _1668;
    }
    float _1670 = _1652;
    float _1672 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1674 = sqrt(_1560);
    if (_1578)
    {
        float _1676 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1646 = _1676;
    }
    float _1678 = _1646;
    float _1680 = _1678;
    if (_1578)
    {
        float _1682 = _1566 * _1670;
        _1658 = _1682;
    }
    float _1684 = _1658;
    if (!_1578)
    {
        _1666 = _1568;
    }
    float _1686 = _1666;
    float _1688 = _1686;
    if (_1578)
    {
        float _1690 = _1568 * _1670;
        _1688 = _1690;
    }
    float _1692 = _1688;
    if (_1578)
    {
        float _1694 = fma(_1634, _1628, _1678);
        _1636 = _1694;
    }
    float _1696 = _1636;
    if (!_1578)
    {
        _1680 = _1570;
    }
    float _1698 = _1680;
    float _1700 = _1698;
    if (_1578)
    {
        float _1702 = _1684 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (!_1578)
    {
        _1660 = _1572;
    }
    float _1706 = _1660;
    float _1708 = _1706;
    if (_1578)
    {
        float _1710 = _1692 * _1692;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1716 = fma(_1696, _1696, _1704);
    float _1718 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1714);
    float _1724 = _1716 + _1712;
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1728 = fma(_1674, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1726);
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1734 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1722);
    float _1736 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1740 = rsqrt(_1724);
    float _1742 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1732);
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1748 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1738);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = -_1730;
    float _1754 = _1752 + 1.0;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1746);
    float _1758 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1762 = abs(_1754);
    float _1764 = log2(_1762);
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1768 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1770 = _1740 * _1684;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1774 = _1740 * _1696;
    float _1776 = _1740 * _1692;
    float _1778 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1780 = -_1768;
    float _1782 = fma(_1780, _1760, 1.0);
    float _1784 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = 1.0 / _1772;
    float _1788 = -_1778;
    float _1790 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1788);
    float _1792 = _1774 + 1.0;
    float _1794 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1796 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1798 = -_1776;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1790);
    float _1802 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1804 = log2(_1782);
    float _1806 = fma(_1800, -0.5, 0.5);
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1802);
    float _1812 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1796);
    float _1814 = fma(_1808, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1816 = exp2(_1794);
    float _1818 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1820 = fma(_1808, _1814, -0.212114393711090087890625);
    float _1822 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1812);
    float _1824 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1818);
    float _1826 = fma(_1808, _1820, 1.570728778839111328125);
    float _1828 = _1822 * _1786;
    float _1830 = sqrt(_1806);
    float _1832 = _1804 * 0.693147182464599609375;
    float _1834 = _1824 * _1786;
    float _1836 = fma(_1828, 0.5, 0.5);
    float _1838 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1840 = fma(_1834, -0.5, 0.5);
    float _1842 = -_1774;
    float _1844 = fma(_1816, _1792, _1842);
    float _1846 = fma(_1844, 0.5, 0.5);
    float _1848 = _1830 * 0.636619746685028076171875;
    float _1850 = -_1826;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _5259 = float3(_1836, _1840, _1838);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5259, float3(0.0), isnan(_5259)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5259, float3(0.0), isnan(_5259)), level(0.0)).x;
    float3 _5270 = float3(_1836, _1840, _1838);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5270, float3(0.0), isnan(_5270)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5270, float3(0.0), isnan(_5270)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _5287 = float2(_1852, _1846);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5287, float2(0.0), isnan(_5287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5287, float2(0.0), isnan(_5287)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = in.m_55.w;
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1885 = in.m_63.x;
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1893 = _1891 != 0;
    float _1895 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1897 = 1.0 / _1883;
    float _1899 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1903 = _1901 != 0;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1911 = _1909 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1919 = _1917 != 0;
    float _1921 = 1.0 / _1889;
    int _1923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1925 = _1923 != 0;
    float _1927 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1899);
    float _1929 = in.m_49.x;
    bool _1931 = _888 > 0.5;
    bool _1933 = _1877 > 0.5;
    float _1935 = _1911 * _1897;
    float _1937 = -_154;
    float _1939 = _1937 + 1.0;
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1943 = _874 + _1941;
    float _1945 = 1.0 / _1915;
    bool _1947 = _1933;
    if (_1903)
    {
        bool _1949 = _880 > 0.5;
        _1050 = _1949;
    }
    bool _1951 = _1050;
    out.m_65.x = _1885;
    int _1953 = _1933 ? as_type<int>(_1939) : as_type<int>(_154);
    float _1955 = _1907 * _1921;
    float _1957 = _1929;
    if (_1893)
    {
        bool _1959 = _876 > 0.5;
        _1947 = _1959;
    }
    bool _1961 = _1947;
    float _1963 = _1919 ? as_type<float>(_1953) : _154;
    float _1965 = fma(_1955, _1943, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1967 = _1230 != 0.0;
    bool _1969 = isnan(_1230);
    bool _1971 = _1967 || _1969;
    bool _1973 = isnan(0.0);
    bool _1975 = _1971 || _1973;
    float _1977 = in.m_67.x;
    float _1979 = in.m_67.y;
    float _1981 = in.m_67.z;
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1985 = _1228 == 0.0;
    bool _1987 = !_1975;
    bool _1989 = _1985 && _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1993 = _874 + _1991;
    if (_1925)
    {
        float _1995 = _1931 ? _1939 : _154;
        _202 = _1995;
    }
    float _1997 = _202;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1999;
    bool _2003 = _1232 == 0.0;
    bool _2005 = _2003 && _1989;
    float _2007 = fma(_1935, _1993, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2011 = _874 + _2009;
    float _2013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2015 = _2001 * _1945;
    bool _2017 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2019 = isnan(_874);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    bool _2029 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2031 = isnan(_874);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = fma(_2015, _2011, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2043 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2045 = isnan(_874);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -_2027;
    float _2057 = _2055 + 1.0;
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2061 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2063 = isnan(_874);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2075 = _2039 * _2057;
    float _2077 = -_2039;
    float _2079 = _2077 + 1.0;
    float _2081 = _2039;
    if (!_1903)
    {
        _2081 = _1929;
    }
    float _2083 = _2081;
    float _2085 = _1977;
    float _2087 = _1979;
    float _2089 = _2083;
    float _2091 = _1981;
    if (!_2005)
    {
        float _2093 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2085 = _2093;
    }
    float _2095 = _2085;
    if (!_2005)
    {
        float _2097 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2103 = as_type<int>(_1983);
    if (_1903)
    {
        float _2105 = -_1929;
        float _2107 = _2105 + 1.0;
        _1418 = as_type<int>(_2107);
    }
    int _2109 = _1418;
    if (_1893)
    {
        float _2111 = -_1929;
        float _2113 = _2111 + 1.0;
        _2103 = as_type<int>(_2113);
    }
    int _2115 = _2103;
    float _2117 = fma(_1963, _2073, -0.5);
    float _2119 = fma(_2101, _1997, -0.5);
    float _2121 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1903)
    {
        float _2123 = _1951 ? as_type<float>(_2109) : _1929;
        _2089 = _2123;
    }
    float _2125 = _2089;
    if (!_2005)
    {
        float _2127 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _2091 = _2127;
    }
    float _2129 = _2091;
    if (_1893)
    {
        float _2131 = _1961 ? as_type<float>(_2115) : _1929;
        _1957 = _2131;
    }
    float _2133 = _1957;
    float _2135 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2137 = -_1164;
    float _2139 = fma(_1032, _2117, _2137);
    float _2141 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2143 = _1292 * _2141;
    float _2145 = -_946;
    float _2147 = fma(_1110, _2119, _2145);
    float _2149 = fma(_2121, _2133, -0.5);
    float _2151 = fma(_2135, _2125, -0.5);
    float _2153 = -_2053;
    float _2155 = _2153 + 1.0;
    float _2157 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2159 = fma(_1140, _2149, _1190);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2163 = _1292 * _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _1292 * _2165;
    float _2169 = _2053 * _2079;
    float _2171 = _2071 * _2155;
    float _2173 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2163);
    float _2175 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2167);
    float _2177 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2143);
    float _2179 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2181 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2183 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2185 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2187 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2179);
    float _2189 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2157);
    float _2191 = _1965 * _2171;
    float _2193 = -_2071;
    float _2195 = _2193 + 1.0;
    float _2197 = fma(_1138, _2151, _982);
    float _2199 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2201 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2181);
    float _2203 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    float _2205 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2185);
    float _2207 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2187);
    float _2209 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2191);
    float _2213 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    float _2215 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2201);
    float _2217 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2203);
    float _2219 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2205);
    float _2221 = _2207 * _2099;
    float _2223 = _2209 * _2099;
    float _2225 = fma(_2007, _2169, _2211);
    float _2227 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2213);
    float _2229 = _2215 * _2099;
    float _2231 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2173);
    float _2233 = fma(_2217, _2095, _2221);
    float _2235 = fma(_2219, _2095, _2223);
    float _2237 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2175);
    float _2239 = fma(_2041, _2075, _2225);
    float _2241 = fma(_2227, _2095, _2229);
    float _2243 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2245 = fma(_2231, _2129, _2233);
    float _2247 = fma(_2237, _2129, _2235);
    float _2249 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2239);
    float _2251 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2177);
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2259 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2243);
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2263 = _2255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2265 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2267 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2269 = _2147 + 0.5;
    float _2271 = _2139 + 0.5;
    float _2273 = _2197 + 0.5;
    float _2275 = _2159 + 0.5;
    float _2277 = _2249 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2279 = fma(_2251, _2129, _2241);
    float _2281 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2259);
    float _2283 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2267);
    out.m_69.x = _2273;
    out.m_69.y = _2269;
    out.m_69.z = _2275;
    out.m_69.w = _2271;
    bool _2285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2287 = isnan(0.5);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2293 = _2289 || _2291;
    float _2295 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2297 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2283);
    out.m_71.x = _2261;
    out.m_71.y = _2263;
    out.m_71.z = _2265;
    out.m_71.w = _2277;
    float _2299 = exp2(_1895);
    float _2301 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1927);
    float _2303 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_73.x = _2245;
    out.m_73.y = _2247;
    out.m_73.z = _2279;
    float _2305 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2301);
    float _2307 = _2303 + _2295;
    float _2309 = 1.0 / _2295;
    float _2311 = _2281;
    if (_2293)
    {
        _2311 = 1.0;
    }
    float _2313 = _2311;
    float _2315 = _2307 * _2309;
    float _2317 = _2315 * 0.5;
    float _2319 = _2313;
    if (!_2293)
    {
        float _2321 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2325 = _2321 * 0.15915493667125701904296875;
        float _2327 = _2323 * 0.15915493667125701904296875;
        float _2329 = _2325 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2335 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2333);
        float _2337 = _2325 * 6.283185482025146484375;
        float _2339 = sin(_2337);
        float _2341 = 1.0 / _2331;
        float _2343 = _2327 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = _2327 * 6.283185482025146484375;
        float _2351 = sin(_2349);
        float _2353 = _2345 * _2347;
        float _2355 = 1.0 / _2335;
        float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2357;
        float _2361 = 1.0 / _2353;
        float _2363 = 1.0 / _2359;
        float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2367 = _2355 * _2365;
        float _2369 = _2351 * _2361;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2373 = fma(_2369, _2367, _2371);
        float _2375 = _2373 * _2363;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2319 = _2377;
    }
    float _2379 = _2319;
    float _2381 = -_2299;
    float _2383 = _2381 + 1.0;
    float _2385 = _1772 * 0.5;
    float _2387 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2389 = _2379 > 0.0;
    bool _2391 = isnan(_2379);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2401 = fma(_1824, -0.5, _2385);
    float _2403 = _2387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2405 = _2305 + _1772;
    float _2407 = _2399 * _1854;
    float _2409 = _1822 + _1772;
    float _2411 = -_2399;
    float _2413 = _2411 + 1.0;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1824;
    out.gl_Position.z = _2305;
    out.gl_Position.w = _1772;
    float _2415 = _1865 * _2407;
    float _2417 = _1875 * _2407;
    float _2419 = _2405 * 0.5;
    float _2421 = _2409 * 0.5;
    float _2423 = fma(_1871, _2415, _1859);
    float _2425 = fma(_1873, _2415, _1861);
    float _2427 = _1865 * _2413;
    float _2429 = fma(_1865, _2417, _1863);
    out.m_75.x = _1550;
    out.m_75.y = _1546;
    out.m_75.z = _1554;
    out.m_77.x = _2421;
    out.m_77.y = _2401;
    out.m_77.z = _2419;
    out.m_77.w = _1772;
    out.m_45.x = _2403;
    out.m_79.x = _2423;
    out.m_79.y = _2425;
    out.m_79.z = _2429;
    out.m_79.w = _2427;
    if (_2397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2431 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2431;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _866 = false;
    bool _648 = false;
    bool _480 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2488 = as_type<float>(_114);
        out.gl_Position.z = _2488;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2558 = as_type<float>(_152);
        out.gl_Position.z = _2558;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_49.y;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _156;
    if (!_168)
    {
        float _186 = _156 * _156;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    out.m_53.y = _154;
    bool _198 = !_168;
    float _200 = _196;
    float _202 = _154;
    if (!_198)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _156 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _156);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _232;
    }
    float _234 = _200;
    bool _236 = !_168;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _184 = _256;
    }
    float _258 = _184;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _170, _262);
    float _270 = fma(_258, _172, _264);
    float _272 = fma(_258, _174, _266);
    float _274 = fma(_268, _158, _176);
    float _276 = fma(_270, _158, _178);
    float _278 = fma(_272, _158, _180);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_55.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_98);
        float _304 = 1.0 / _302;
        float _306 = _132 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _308 + _310;
    bool _314 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_308);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _308 + _326;
    bool _330 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_308);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_324;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _348;
    float _368 = _360 * _364;
    float _370 = -_360;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = 1.0 / _344;
    float _382 = _340 * _372;
    float _384 = -_340;
    float _386 = _384 + 1.0;
    float _388 = _328 * _366;
    float _390 = _312 * _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_376, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = in.m_51.x;
    float _408 = in.m_51.y;
    float _410 = in.m_51.z;
    float _412 = _400 * _382;
    float _414 = _402 * _382;
    float _416 = _404 * _382;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _432 = fma(_420, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _434 = fma(_424, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _436 = fma(_428, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _440 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _442 = fma(_432, _368, _430);
    float _444 = fma(_434, _368, _438);
    float _446 = fma(_436, _368, _440);
    float _448 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].x, _442);
    float _450 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].y, _444);
    float _452 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].z, _446);
    float _454 = _448 * _406;
    float _456 = _450 * _408;
    float _458 = _452 * _410;
    bool _460 = !_378;
    float _478;
    if (!_460)
    {
        float _462 = in.m_55.x;
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _470 = _468 * _464;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = true;
    }
    else
    {
        float _482 = float(_98);
        float _484 = 1.0 / _482;
        float _486 = _132 * _484;
        _478 = _486;
    }
    _480 = false;
    float _488 = _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _492 = _488 + _490;
    bool _494 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _496 = isnan(_488);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _508 = _488 + _506;
    bool _510 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_488);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _530 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _532 = isnan(_488);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_504;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _524;
    float _548 = _540 * _544;
    float _550 = -_540;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _528;
    float _562 = _520 * _552;
    float _564 = -_520;
    float _566 = _564 + 1.0;
    float _568 = _492 * _546;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _574;
    float _578 = fma(_556, _568, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _580 = fma(_572, _568, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _582 = fma(_576, _568, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _584 = _508 * _560;
    float _586 = _578 * _562;
    float _588 = _580 * _562;
    float _590 = _582 * _562;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _604 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].x, _586);
    float _606 = fma(_594, _584, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _608 = fma(_598, _584, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _610 = fma(_602, _584, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].y, _588);
    float _614 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _616 = fma(_606, _548, _604);
    float _618 = fma(_608, _548, _612);
    float _620 = fma(_610, _548, _614);
    float _622 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].x, _616);
    float _624 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].y, _618);
    float _626 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].z, _620);
    bool _628 = !_558;
    float _646;
    if (!_628)
    {
        float _630 = in.m_55.x;
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _634 = _630 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _638 = _636 * _632;
        float _640 = floor(_638);
        float _642 = -_640;
        float _644 = _638 + _642;
        _646 = _644;
        _648 = true;
    }
    else
    {
        float _650 = float(_98);
        float _652 = 1.0 / _650;
        float _654 = _132 * _652;
        _646 = _654;
    }
    _648 = false;
    float _656 = _646;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _656 + _658;
    float _662 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _676 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _678 = isnan(_656);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = 1.0 / _666;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _694 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _696 = isnan(_656);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _708 = _626 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _712 = 1.0 / _674;
    float _714 = _670 * _688;
    bool _716 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _718 = isnan(_656);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = 1.0 / _692;
    float _730 = -_686;
    float _732 = _730 + 1.0;
    float _734 = fma(_714, _660, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _740 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _742 = isnan(_656);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -_726;
    float _754 = _752 + 1.0;
    float _756 = _726 * _732;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = 1.0 / _738;
    float _764 = -_750;
    float _766 = _764 + 1.0;
    float _768 = _704 * _754;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _770;
    float _774 = _760 * _712;
    float _776 = _686 * _766;
    float _778 = _734 * _768;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = _656 + _780;
    float _784 = -_704;
    float _786 = _784 + 1.0;
    bool _788 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _790 = isnan(_656);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _772 * _728;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _808 = _656 + _806;
    float _810 = fma(_774, _782, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _778);
    float _814 = -_798;
    float _816 = _814 + 1.0;
    float _818 = _804 * _762;
    float _820 = fma(_800, _808, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _824 = _656 + _822;
    float _826 = fma(_810, _756, _812);
    float _828 = _750 * _816;
    float _830 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = fma(_818, _824, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _834 = fma(_820, _776, _826);
    float _836 = fma(_832, _828, _834);
    float _838 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[119].x, _836);
    float _842 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _842;
    out.m_57.y = _838;
    out.m_57.z = _830;
    out.m_57.w = _844;
    bool _846 = !_710;
    float _864;
    if (!_846)
    {
        float _848 = in.m_55.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_98);
        float _870 = 1.0 / _868;
        float _872 = _132 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = in.m_55.z;
    float _878 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _880 = in.m_55.x;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _884 = _882 != 0;
    float _886 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _888 = in.m_55.y;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _902 = _900 != 0;
    float _904 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _908 = !_894;
    int _910 = _908 ? 0 : 1;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _914 = _876 * 2.0;
    float _916 = _880 * 2.0;
    float _918 = _880 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _920 = floor(_914);
    float _922 = _888 + _876;
    float _924 = _888 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _926 = _888 * 2.0;
    float _928 = -_906;
    float _930 = fma(_918, 2.0, _928);
    float _932 = _922 + (-1.0);
    float _934 = fma(_924, -2.0, _890);
    float _936 = floor(_916);
    float _938 = _918;
    float _940 = _932;
    if (!_884)
    {
        _938 = _876;
    }
    float _942 = _938;
    float _944 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _934);
    float _948 = _942;
    if (!_884)
    {
        _940 = _876;
    }
    float _950 = _940;
    float _952 = _888 + (-0.5);
    float _954 = _950;
    if (_884)
    {
        _948 = _888;
    }
    float _956 = _948;
    float _958 = floor(_926);
    bool _960 = _920 > 0.0;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _964 = _920 >= 0.0;
    bool _966 = isnan(_920);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _956 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _976 = _920;
    if (!_884)
    {
        _976 = _888;
    }
    float _978 = _976;
    float _980 = -_132;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[76].x, _930);
    float _984 = _978;
    if (_884)
    {
        _984 = _880;
    }
    float _986 = _984;
    if (_884)
    {
        _954 = _888;
    }
    float _988 = _954;
    bool _990 = _936 > 0.0;
    float _992 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[83].z, _962);
    bool _994 = _936 >= 0.0;
    bool _996 = isnan(_936);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = _986 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1006 = !_898;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1012 = log2(_1010);
    int _1014 = _1002 ? 0 : 1;
    float _1016 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _912);
    bool _1018 = _958 > 0.0;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1022 = _958 >= 0.0;
    bool _1024 = isnan(_958);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    float _1032 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1016);
    float _1034 = -_1020;
    float _1036 = fma(_1004, 2.0, _1034);
    int _1038 = ~_1014;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    int _1044 = abs(_1008);
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1048 = _1042;
    bool _1050 = _1018;
    if (!_990)
    {
        int _1052 = ~_1014;
        int _1054 = _1052 + 1;
        _1048 = _1054;
    }
    int _1056 = _1048;
    float _1058 = float(_1044);
    float _1060 = fma(_974, -2.0, _1046);
    float _1062 = float(_1056);
    float _1064 = _1012 * _132;
    int _1066 = _1030 ? 0 : 1;
    float _1068 = in.m_59.x;
    float _1070 = in.m_59.y;
    float _1072 = in.m_59.z;
    int _1074 = _972 ? 0 : 1;
    float _1076 = _1058 * _1062;
    float _1078 = exp2(_1064);
    int _1080 = ~_1066;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1084;
    if (!_1018)
    {
        int _1088 = ~_1066;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1096 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1094);
    bool _1098 = !_902;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1104 = ~_1074;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1096);
    int _1112 = _1108;
    if (!_960)
    {
        int _1114 = ~_1074;
        int _1116 = _1114 + 1;
        _1112 = _1116;
    }
    int _1118 = _1112;
    float _1120 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1102);
    int _1122 = abs(_1100);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1126 = 1.0 + _1124;
    bool _1128 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1130 = isnan(1.0);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1136 = _1132 || _1134;
    float _1138 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1120);
    float _1140 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _992);
    float _1142 = 1.0 / _1126;
    float _1144 = _1076 * (-2.0);
    float _1146 = float(_1122);
    float _1148 = -_1078;
    float _1150 = _1148 + 1.0;
    float _1152 = float(_1092);
    bool _1154 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1156 = isnan(0.0);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1162 = _1158 || _1160;
    float _1164 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1166 = fma(_1144, _1070, _1070);
    float _1168 = fma(_944, _1144, _944);
    int _1170 = abs(_910);
    float _1172 = _1146 * _1152;
    float _1174 = _880 + _876;
    float _1176 = float(_1118);
    float _1178 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1166);
    float _1180 = float(_1170);
    float _1182 = _1172 * (-2.0);
    float _1184 = _1162 ? _1150 : 0.0;
    float _1186 = _1174 + (-1.0);
    float _1188 = -_132;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1036);
    float _1192 = _1180 * _1176;
    float _1194 = _1182;
    if (_1136)
    {
        float _1196 = _1184 * _1142;
        _134 = _1196;
    }
    float _1198 = _134;
    float _1200 = _876 + (-0.5);
    float _1202 = fma(_1182, _1072, _1072);
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1206 = _880 + _888;
    float _1208 = fma(_1168, _1198, _1178);
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1202);
    float _1212 = fma(_1204, _1182, _1204);
    float _1214 = _1192 * (-2.0);
    float _1216 = _1206 + (-1.0);
    float _1218 = _1208 * 0.15915493667125701904296875;
    float _1220 = fma(_1212, _1198, _1210);
    float _1222 = fma(_1214, _1068, _1068);
    float _1224 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1226 = _880 + (-0.5);
    float _1228 = in.m_61.x;
    float _1230 = in.m_61.y;
    float _1232 = in.m_61.z;
    float _1234 = _1220 * 0.15915493667125701904296875;
    float _1236 = fma(_1224, _1214, _1224);
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1222);
    float _1240 = _1218 * 6.283185482025146484375;
    float _1242 = sin(_1240);
    float _1244 = fma(_1236, _1198, _1238);
    bool _1246 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1248 = isnan(0.5);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    float _1256 = _1244 * 0.15915493667125701904296875;
    float _1258 = _1218 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1234 * 6.283185482025146484375;
    float _1264 = sin(_1262);
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1228);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1230);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1232);
    float _1272 = _1234 * 6.283185482025146484375;
    float _1274 = cos(_1272);
    float _1276 = _878 * _1266;
    float _1278 = _904 * _1270;
    float _1280 = _1256 * 6.283185482025146484375;
    float _1282 = cos(_1280);
    float _1284 = _886 * _1268;
    float _1286 = _1242 * _1264;
    float _1288 = _1260 * _1264;
    float _1290 = _1256 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = _1260 * _1274;
    float _1296 = _1242 * _1274;
    float _1298 = _1282 * _1274;
    float _1300 = _1282 * _1264;
    float _1302 = _1282 * _1242;
    float _1304 = _1282 * _1260;
    float _1306 = fma(_1292, _1286, _1294);
    float _1308 = -_1296;
    float _1310 = fma(_1292, _1288, _1308);
    float _1312 = fma(_1292, _1294, _1286);
    float _1314 = -_1288;
    float _1316 = fma(_1292, _1296, _1314);
    float _1318 = _1298 * _1284;
    float _1320 = _1312 * _1284;
    float _1322 = _1316 * _1284;
    float _1324 = fma(_1300, _1276, _1318);
    float _1326 = fma(_1310, _1276, _1320);
    float _1328 = fma(_1306, _1276, _1322);
    float _1330 = -_1292;
    float _1332 = fma(_1330, _1278, _1324);
    float _1334 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1336 = fma(_1304, _1278, _1326);
    float _1338 = fma(_1302, _1278, _1328);
    float _1340 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1342 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1344 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1334);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1350 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1342);
    float _1352 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1344);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    float _1358 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1350);
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1364 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1368 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1372 = _1360 + _1364;
    float _1374 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1376 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1368);
    float _1378 = _1366 + _1370;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1382 = _1372 + _1380;
    float _1384 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1374);
    float _1386 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1390 = _1378 + _1388;
    float _1392 = _1382 * _1382;
    float _1394 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1398 = fma(_1390, _1390, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1402 = sqrt(_1398);
    float _1404 = _1396 + _1400;
    bool _1406 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = _1336;
    float _1410 = _1400;
    float _1412 = _1378;
    float _1414 = _1344;
    float _1416 = _1398;
    int _1418 = as_type<int>(_1230);
    if (!_1406)
    {
        _1408 = _1378;
    }
    float _1420 = _1408;
    float _1422 = _1420;
    if (!_1406)
    {
        _1410 = _1372;
    }
    float _1424 = _1410;
    float _1426 = _1424;
    if (!_1406)
    {
        _1412 = _1404;
    }
    float _1428 = _1412;
    bool _1430 = !_1406;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1402 + _1436;
        float _1440 = rsqrt(_1398);
        float _1442 = _1438 * _1434;
        float _1444 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1404, _1450, _1460);
        float _1466 = fma(_1390, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1382, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1422 = _1466;
        _1432 = _1464;
        _1426 = _1468;
        _1414 = _1456;
    }
    float _1470 = _1422;
    float _1472 = _1432;
    float _1474 = _1426;
    float _1476 = _1414;
    float _1478 = _1472;
    float _1480 = _1470;
    float _1482 = _1474;
    float _1484 = _1476;
    if (!_1254)
    {
        float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1488 = _1396 + _1486;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1492 = _1366 + _1490;
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1496 = _1488 * _1488;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1500 = _1360 + _1498;
        float _1502 = fma(_1492, _1492, _1496);
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1506 = fma(_1500, _1500, _1502);
        float _1508 = sqrt(_1506);
        float _1510 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1512 = precise::min(_1508, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1514 = _1512 * _1504;
        float _1516 = -_1366;
        float _1518 = _1516 + _1470;
        float _1520 = _1510 * _1514;
        float _1522 = -_1396;
        float _1524 = _1522 + _1472;
        float _1526 = -_1360;
        float _1528 = _1526 + _1474;
        float _1530 = fma(_1518, _1520, _1366);
        float _1532 = fma(_1524, _1520, _1396);
        float _1534 = fma(_1528, _1520, _1360);
        _1478 = _1532;
        _1480 = _1530;
        _1482 = _1534;
        _1484 = _1528;
    }
    float _1536 = _1478;
    float _1538 = _1480;
    float _1540 = _1482;
    float _1542 = _1484;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1546 = _1536 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1538 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1554 = _1540 + _1552;
    float _1556 = _1546 * _1546;
    float _1558 = fma(_1550, _1550, _1556);
    float _1560 = fma(_1554, _1554, _1558);
    float _1562 = rsqrt(_1560);
    float _1564 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1550 * _1564;
    float _1568 = _1554 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _1390;
    float _1586 = _1574;
    float _1588 = _1582;
    float _1590 = _1564;
    if (_1578)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1592;
    }
    float _1594 = _1584;
    if (_1578)
    {
        float _1596 = rsqrt(_1574);
        _1586 = _1596;
    }
    float _1598 = _1586;
    if (_1578)
    {
        float _1600 = _1582 * _1594;
        _1588 = _1600;
    }
    float _1602 = _1588;
    if (_1578)
    {
        float _1604 = _1602 * 0.15915493667125701904296875;
        _1194 = _1604;
    }
    float _1606 = _1194;
    float _1608 = _1542;
    if (_1578)
    {
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1618 = precise::max(0.0, _1616);
    float _1620 = _1372;
    float _1622 = _1618;
    if (_1578)
    {
        float _1624 = _1606 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = -_1564;
    float _1632 = -_1618;
    float _1634 = fma(_1546, _1630, _1632);
    float _1636 = _1634;
    if (_1578)
    {
        float _1638 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1638;
    }
    float _1640 = _1622;
    float _1642 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = _1614;
    float _1646 = _1640;
    if (_1578)
    {
        float _1648 = fma(_1614, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1416 = _1648;
    }
    float _1650 = _1416;
    float _1652 = _1650;
    if (!_1578)
    {
        _1644 = _1566;
    }
    float _1654 = _1644;
    float _1656 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1658 = _1654;
    float _1660 = _1628;
    if (_1578)
    {
        float _1662 = _1628 + (-1.0);
        _1590 = _1662;
    }
    float _1664 = _1590;
    float _1666 = _1664;
    if (_1578)
    {
        float _1668 = _1598 * _1650;
        _1652 = _1668;
    }
    float _1670 = _1652;
    float _1672 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1674 = sqrt(_1560);
    if (_1578)
    {
        float _1676 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1646 = _1676;
    }
    float _1678 = _1646;
    float _1680 = _1678;
    if (_1578)
    {
        float _1682 = _1566 * _1670;
        _1658 = _1682;
    }
    float _1684 = _1658;
    if (!_1578)
    {
        _1666 = _1568;
    }
    float _1686 = _1666;
    float _1688 = _1686;
    if (_1578)
    {
        float _1690 = _1568 * _1670;
        _1688 = _1690;
    }
    float _1692 = _1688;
    if (_1578)
    {
        float _1694 = fma(_1634, _1628, _1678);
        _1636 = _1694;
    }
    float _1696 = _1636;
    if (!_1578)
    {
        _1680 = _1570;
    }
    float _1698 = _1680;
    float _1700 = _1698;
    if (_1578)
    {
        float _1702 = _1684 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (!_1578)
    {
        _1660 = _1572;
    }
    float _1706 = _1660;
    float _1708 = _1706;
    if (_1578)
    {
        float _1710 = _1692 * _1692;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1716 = fma(_1696, _1696, _1704);
    float _1718 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1714);
    float _1724 = _1716 + _1712;
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1728 = fma(_1674, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1726);
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1734 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1722);
    float _1736 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1740 = rsqrt(_1724);
    float _1742 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1732);
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1748 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1738);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = -_1730;
    float _1754 = _1752 + 1.0;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1746);
    float _1758 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1762 = abs(_1754);
    float _1764 = log2(_1762);
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1768 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1770 = _1740 * _1684;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1774 = _1740 * _1696;
    float _1776 = _1740 * _1692;
    float _1778 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1780 = -_1768;
    float _1782 = fma(_1780, _1760, 1.0);
    float _1784 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = 1.0 / _1772;
    float _1788 = -_1778;
    float _1790 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1788);
    float _1792 = _1774 + 1.0;
    float _1794 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1796 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1798 = -_1776;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1790);
    float _1802 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1804 = log2(_1782);
    float _1806 = fma(_1800, -0.5, 0.5);
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1802);
    float _1812 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1796);
    float _1814 = fma(_1808, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1816 = exp2(_1794);
    float _1818 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1820 = fma(_1808, _1814, -0.212114393711090087890625);
    float _1822 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1812);
    float _1824 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1818);
    float _1826 = fma(_1808, _1820, 1.570728778839111328125);
    float _1828 = _1822 * _1786;
    float _1830 = sqrt(_1806);
    float _1832 = _1804 * 0.693147182464599609375;
    float _1834 = _1824 * _1786;
    float _1836 = fma(_1828, 0.5, 0.5);
    float _1838 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1840 = fma(_1834, -0.5, 0.5);
    float _1842 = -_1774;
    float _1844 = fma(_1816, _1792, _1842);
    float _1846 = fma(_1844, 0.5, 0.5);
    float _1848 = _1830 * 0.636619746685028076171875;
    float _1850 = -_1826;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _5259 = float3(_1836, _1840, _1838);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5259, float3(0.0), isnan(_5259)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5259, float3(0.0), isnan(_5259)), level(0.0)).x;
    float3 _5270 = float3(_1836, _1840, _1838);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5270, float3(0.0), isnan(_5270)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5270, float3(0.0), isnan(_5270)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _5287 = float2(_1852, _1846);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5287, float2(0.0), isnan(_5287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5287, float2(0.0), isnan(_5287)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = in.m_55.w;
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1885 = in.m_63.x;
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1893 = _1891 != 0;
    float _1895 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1897 = 1.0 / _1883;
    float _1899 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1903 = _1901 != 0;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1911 = _1909 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1919 = _1917 != 0;
    float _1921 = 1.0 / _1889;
    int _1923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1925 = _1923 != 0;
    float _1927 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1899);
    float _1929 = in.m_49.x;
    bool _1931 = _888 > 0.5;
    bool _1933 = _1877 > 0.5;
    float _1935 = _1911 * _1897;
    float _1937 = -_154;
    float _1939 = _1937 + 1.0;
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1943 = _874 + _1941;
    float _1945 = 1.0 / _1915;
    bool _1947 = _1933;
    if (_1903)
    {
        bool _1949 = _880 > 0.5;
        _1050 = _1949;
    }
    bool _1951 = _1050;
    out.m_65.x = _1885;
    int _1953 = _1933 ? as_type<int>(_1939) : as_type<int>(_154);
    float _1955 = _1907 * _1921;
    float _1957 = _1929;
    if (_1893)
    {
        bool _1959 = _876 > 0.5;
        _1947 = _1959;
    }
    bool _1961 = _1947;
    float _1963 = _1919 ? as_type<float>(_1953) : _154;
    float _1965 = fma(_1955, _1943, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1967 = _1230 != 0.0;
    bool _1969 = isnan(_1230);
    bool _1971 = _1967 || _1969;
    bool _1973 = isnan(0.0);
    bool _1975 = _1971 || _1973;
    float _1977 = in.m_67.x;
    float _1979 = in.m_67.y;
    float _1981 = in.m_67.z;
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1985 = _1228 == 0.0;
    bool _1987 = !_1975;
    bool _1989 = _1985 && _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1993 = _874 + _1991;
    if (_1925)
    {
        float _1995 = _1931 ? _1939 : _154;
        _202 = _1995;
    }
    float _1997 = _202;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1999;
    bool _2003 = _1232 == 0.0;
    bool _2005 = _2003 && _1989;
    float _2007 = fma(_1935, _1993, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2011 = _874 + _2009;
    float _2013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2015 = _2001 * _1945;
    bool _2017 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2019 = isnan(_874);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    bool _2029 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2031 = isnan(_874);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = fma(_2015, _2011, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2043 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2045 = isnan(_874);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -_2027;
    float _2057 = _2055 + 1.0;
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2061 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2063 = isnan(_874);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2075 = _2039 * _2057;
    float _2077 = -_2039;
    float _2079 = _2077 + 1.0;
    float _2081 = _2039;
    if (!_1903)
    {
        _2081 = _1929;
    }
    float _2083 = _2081;
    float _2085 = _1977;
    float _2087 = _1979;
    float _2089 = _2083;
    float _2091 = _1981;
    if (!_2005)
    {
        float _2093 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2085 = _2093;
    }
    float _2095 = _2085;
    if (!_2005)
    {
        float _2097 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2103 = as_type<int>(_1983);
    if (_1903)
    {
        float _2105 = -_1929;
        float _2107 = _2105 + 1.0;
        _1418 = as_type<int>(_2107);
    }
    int _2109 = _1418;
    if (_1893)
    {
        float _2111 = -_1929;
        float _2113 = _2111 + 1.0;
        _2103 = as_type<int>(_2113);
    }
    int _2115 = _2103;
    float _2117 = fma(_1963, _2073, -0.5);
    float _2119 = fma(_2101, _1997, -0.5);
    float _2121 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1903)
    {
        float _2123 = _1951 ? as_type<float>(_2109) : _1929;
        _2089 = _2123;
    }
    float _2125 = _2089;
    if (!_2005)
    {
        float _2127 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _2091 = _2127;
    }
    float _2129 = _2091;
    if (_1893)
    {
        float _2131 = _1961 ? as_type<float>(_2115) : _1929;
        _1957 = _2131;
    }
    float _2133 = _1957;
    float _2135 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2137 = -_1164;
    float _2139 = fma(_1032, _2117, _2137);
    float _2141 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2143 = _1292 * _2141;
    float _2145 = -_946;
    float _2147 = fma(_1110, _2119, _2145);
    float _2149 = fma(_2121, _2133, -0.5);
    float _2151 = fma(_2135, _2125, -0.5);
    float _2153 = -_2053;
    float _2155 = _2153 + 1.0;
    float _2157 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2159 = fma(_1140, _2149, _1190);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2163 = _1292 * _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _1292 * _2165;
    float _2169 = _2053 * _2079;
    float _2171 = _2071 * _2155;
    float _2173 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2163);
    float _2175 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2167);
    float _2177 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2143);
    float _2179 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2181 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2183 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2185 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2187 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2179);
    float _2189 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2157);
    float _2191 = _1965 * _2171;
    float _2193 = -_2071;
    float _2195 = _2193 + 1.0;
    float _2197 = fma(_1138, _2151, _982);
    float _2199 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2201 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2181);
    float _2203 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    float _2205 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2185);
    float _2207 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2187);
    float _2209 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2191);
    float _2213 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    float _2215 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2201);
    float _2217 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2203);
    float _2219 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2205);
    float _2221 = _2207 * _2099;
    float _2223 = _2209 * _2099;
    float _2225 = fma(_2007, _2169, _2211);
    float _2227 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2213);
    float _2229 = _2215 * _2099;
    float _2231 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2173);
    float _2233 = fma(_2217, _2095, _2221);
    float _2235 = fma(_2219, _2095, _2223);
    float _2237 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2175);
    float _2239 = fma(_2041, _2075, _2225);
    float _2241 = fma(_2227, _2095, _2229);
    float _2243 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2245 = fma(_2231, _2129, _2233);
    float _2247 = fma(_2237, _2129, _2235);
    float _2249 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2239);
    float _2251 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2177);
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2259 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2243);
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2263 = _2255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2265 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2267 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2269 = _2147 + 0.5;
    float _2271 = _2139 + 0.5;
    float _2273 = _2197 + 0.5;
    float _2275 = _2159 + 0.5;
    float _2277 = _2249 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2279 = fma(_2251, _2129, _2241);
    float _2281 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2259);
    float _2283 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2267);
    out.m_69.x = _2273;
    out.m_69.y = _2269;
    out.m_69.z = _2275;
    out.m_69.w = _2271;
    bool _2285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2287 = isnan(0.5);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2293 = _2289 || _2291;
    float _2295 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2297 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2283);
    out.m_71.x = _2261;
    out.m_71.y = _2263;
    out.m_71.z = _2265;
    out.m_71.w = _2277;
    float _2299 = exp2(_1895);
    float _2301 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1927);
    float _2303 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_73.x = _2245;
    out.m_73.y = _2247;
    out.m_73.z = _2279;
    float _2305 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2301);
    float _2307 = _2303 + _2295;
    float _2309 = 1.0 / _2295;
    float _2311 = _2281;
    if (_2293)
    {
        _2311 = 1.0;
    }
    float _2313 = _2311;
    float _2315 = _2307 * _2309;
    float _2317 = _2315 * 0.5;
    float _2319 = _2313;
    if (!_2293)
    {
        float _2321 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2325 = _2321 * 0.15915493667125701904296875;
        float _2327 = _2323 * 0.15915493667125701904296875;
        float _2329 = _2325 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2335 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2333);
        float _2337 = _2325 * 6.283185482025146484375;
        float _2339 = sin(_2337);
        float _2341 = 1.0 / _2331;
        float _2343 = _2327 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = _2327 * 6.283185482025146484375;
        float _2351 = sin(_2349);
        float _2353 = _2345 * _2347;
        float _2355 = 1.0 / _2335;
        float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2357;
        float _2361 = 1.0 / _2353;
        float _2363 = 1.0 / _2359;
        float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2367 = _2355 * _2365;
        float _2369 = _2351 * _2361;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2373 = fma(_2369, _2367, _2371);
        float _2375 = _2373 * _2363;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2319 = _2377;
    }
    float _2379 = _2319;
    float _2381 = -_2299;
    float _2383 = _2381 + 1.0;
    float _2385 = _1772 * 0.5;
    float _2387 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2389 = _2379 > 0.0;
    bool _2391 = isnan(_2379);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2401 = fma(_1824, -0.5, _2385);
    float _2403 = _2387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2405 = _2305 + _1772;
    float _2407 = _2399 * _1854;
    float _2409 = _1822 + _1772;
    float _2411 = -_2399;
    float _2413 = _2411 + 1.0;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1824;
    out.gl_Position.z = _2305;
    out.gl_Position.w = _1772;
    float _2415 = _1865 * _2407;
    float _2417 = _1875 * _2407;
    float _2419 = _2405 * 0.5;
    float _2421 = _2409 * 0.5;
    float _2423 = fma(_1871, _2415, _1859);
    float _2425 = fma(_1873, _2415, _1861);
    float _2427 = _1865 * _2413;
    float _2429 = fma(_1865, _2417, _1863);
    out.m_75.x = _1550;
    out.m_75.y = _1546;
    out.m_75.z = _1554;
    out.m_77.x = _2421;
    out.m_77.y = _2401;
    out.m_77.z = _2419;
    out.m_77.w = _1772;
    out.m_45.x = _2403;
    out.m_79.x = _2423;
    out.m_79.y = _2425;
    out.m_79.z = _2429;
    out.m_79.w = _2427;
    if (_2397)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2431 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2431;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _866 = false;
    bool _648 = false;
    bool _480 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2488 = as_type<float>(_114);
        out.gl_Position.z = _2488;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2558 = as_type<float>(_152);
        out.gl_Position.z = _2558;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_49.y;
    float _156 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_51.w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _156;
    if (!_168)
    {
        float _186 = _156 * _156;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    out.m_53.y = _154;
    bool _198 = !_168;
    float _200 = _196;
    float _202 = _154;
    if (!_198)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _156 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _156);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _232;
    }
    float _234 = _200;
    bool _236 = !_168;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _156 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _184 = _256;
    }
    float _258 = _184;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _170, _262);
    float _270 = fma(_258, _172, _264);
    float _272 = fma(_258, _174, _266);
    float _274 = fma(_268, _158, _176);
    float _276 = fma(_270, _158, _178);
    float _278 = fma(_272, _158, _180);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_55.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_98);
        float _304 = 1.0 / _302;
        float _306 = _132 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _308 + _310;
    bool _314 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_308);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _308 + _326;
    bool _330 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_308);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_324;
    float _364 = _362 + 1.0;
    float _366 = 1.0 / _348;
    float _368 = _360 * _364;
    float _370 = -_360;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _380 = 1.0 / _344;
    float _382 = _340 * _372;
    float _384 = -_340;
    float _386 = _384 + 1.0;
    float _388 = _328 * _366;
    float _390 = _312 * _380;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_376, _390, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _402 = fma(_394, _390, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _404 = fma(_398, _390, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = in.m_51.x;
    float _408 = in.m_51.y;
    float _410 = in.m_51.z;
    float _412 = _400 * _382;
    float _414 = _402 * _382;
    float _416 = _404 * _382;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _430 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _432 = fma(_420, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _434 = fma(_424, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _436 = fma(_428, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _414);
    float _440 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _416);
    float _442 = fma(_432, _368, _430);
    float _444 = fma(_434, _368, _438);
    float _446 = fma(_436, _368, _440);
    float _448 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].x, _442);
    float _450 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].y, _444);
    float _452 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].z, _446);
    float _454 = _448 * _406;
    float _456 = _450 * _408;
    float _458 = _452 * _410;
    bool _460 = !_378;
    float _478;
    if (!_460)
    {
        float _462 = in.m_55.x;
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _466 = _462 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _468 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _470 = _468 * _464;
        float _472 = floor(_470);
        float _474 = -_472;
        float _476 = _470 + _474;
        _478 = _476;
        _480 = true;
    }
    else
    {
        float _482 = float(_98);
        float _484 = 1.0 / _482;
        float _486 = _132 * _484;
        _478 = _486;
    }
    _480 = false;
    float _488 = _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _492 = _488 + _490;
    bool _494 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _496 = isnan(_488);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _508 = _488 + _506;
    bool _510 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_488);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _530 = _488 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _532 = isnan(_488);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -_504;
    float _544 = _542 + 1.0;
    float _546 = 1.0 / _524;
    float _548 = _540 * _544;
    float _550 = -_540;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _528;
    float _562 = _520 * _552;
    float _564 = -_520;
    float _566 = _564 + 1.0;
    float _568 = _492 * _546;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _574;
    float _578 = fma(_556, _568, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _580 = fma(_572, _568, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _582 = fma(_576, _568, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _584 = _508 * _560;
    float _586 = _578 * _562;
    float _588 = _580 * _562;
    float _590 = _582 * _562;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _604 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].x, _586);
    float _606 = fma(_594, _584, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _608 = fma(_598, _584, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _610 = fma(_602, _584, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _612 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].y, _588);
    float _614 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[107].z, _590);
    float _616 = fma(_606, _548, _604);
    float _618 = fma(_608, _548, _612);
    float _620 = fma(_610, _548, _614);
    float _622 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].x, _616);
    float _624 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].y, _618);
    float _626 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[109].z, _620);
    bool _628 = !_558;
    float _646;
    if (!_628)
    {
        float _630 = in.m_55.x;
        float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _634 = _630 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _636 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _638 = _636 * _632;
        float _640 = floor(_638);
        float _642 = -_640;
        float _644 = _638 + _642;
        _646 = _644;
        _648 = true;
    }
    else
    {
        float _650 = float(_98);
        float _652 = 1.0 / _650;
        float _654 = _132 * _652;
        _646 = _654;
    }
    _648 = false;
    float _656 = _646;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _656 + _658;
    float _662 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _668;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _676 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _678 = isnan(_656);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = 1.0 / _666;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _694 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _696 = isnan(_656);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = _624 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _708 = _626 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _712 = 1.0 / _674;
    float _714 = _670 * _688;
    bool _716 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _718 = isnan(_656);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = 1.0 / _692;
    float _730 = -_686;
    float _732 = _730 + 1.0;
    float _734 = fma(_714, _660, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _740 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _742 = isnan(_656);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -_726;
    float _754 = _752 + 1.0;
    float _756 = _726 * _732;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = 1.0 / _738;
    float _764 = -_750;
    float _766 = _764 + 1.0;
    float _768 = _704 * _754;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _770;
    float _774 = _760 * _712;
    float _776 = _686 * _766;
    float _778 = _734 * _768;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _782 = _656 + _780;
    float _784 = -_704;
    float _786 = _784 + 1.0;
    bool _788 = _656 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _790 = isnan(_656);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _772 * _728;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _808 = _656 + _806;
    float _810 = fma(_774, _782, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[115].x, _778);
    float _814 = -_798;
    float _816 = _814 + 1.0;
    float _818 = _804 * _762;
    float _820 = fma(_800, _808, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _824 = _656 + _822;
    float _826 = fma(_810, _756, _812);
    float _828 = _750 * _816;
    float _830 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _832 = fma(_818, _824, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _834 = fma(_820, _776, _826);
    float _836 = fma(_832, _828, _834);
    float _838 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _840 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[119].x, _836);
    float _842 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _844 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _842;
    out.m_57.y = _838;
    out.m_57.z = _830;
    out.m_57.w = _844;
    bool _846 = !_710;
    float _864;
    if (!_846)
    {
        float _848 = in.m_55.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_98);
        float _870 = 1.0 / _868;
        float _872 = _132 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = in.m_55.z;
    float _878 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _880 = in.m_55.x;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _884 = _882 != 0;
    float _886 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _888 = in.m_55.y;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _902 = _900 != 0;
    float _904 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _908 = !_894;
    int _910 = _908 ? 0 : 1;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _914 = _876 * 2.0;
    float _916 = _880 * 2.0;
    float _918 = _880 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _920 = floor(_914);
    float _922 = _888 + _876;
    float _924 = _888 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _926 = _888 * 2.0;
    float _928 = -_906;
    float _930 = fma(_918, 2.0, _928);
    float _932 = _922 + (-1.0);
    float _934 = fma(_924, -2.0, _890);
    float _936 = floor(_916);
    float _938 = _918;
    float _940 = _932;
    if (!_884)
    {
        _938 = _876;
    }
    float _942 = _938;
    float _944 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _946 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _934);
    float _948 = _942;
    if (!_884)
    {
        _940 = _876;
    }
    float _950 = _940;
    float _952 = _888 + (-0.5);
    float _954 = _950;
    if (_884)
    {
        _948 = _888;
    }
    float _956 = _948;
    float _958 = floor(_926);
    bool _960 = _920 > 0.0;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _964 = _920 >= 0.0;
    bool _966 = isnan(_920);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = _956 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _976 = _920;
    if (!_884)
    {
        _976 = _888;
    }
    float _978 = _976;
    float _980 = -_132;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[76].x, _930);
    float _984 = _978;
    if (_884)
    {
        _984 = _880;
    }
    float _986 = _984;
    if (_884)
    {
        _954 = _888;
    }
    float _988 = _954;
    bool _990 = _936 > 0.0;
    float _992 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[83].z, _962);
    bool _994 = _936 >= 0.0;
    bool _996 = isnan(_936);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = _986 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1006 = !_898;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1012 = log2(_1010);
    int _1014 = _1002 ? 0 : 1;
    float _1016 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _912);
    bool _1018 = _958 > 0.0;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1022 = _958 >= 0.0;
    bool _1024 = isnan(_958);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    float _1032 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1016);
    float _1034 = -_1020;
    float _1036 = fma(_1004, 2.0, _1034);
    int _1038 = ~_1014;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    int _1044 = abs(_1008);
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1048 = _1042;
    bool _1050 = _1018;
    if (!_990)
    {
        int _1052 = ~_1014;
        int _1054 = _1052 + 1;
        _1048 = _1054;
    }
    int _1056 = _1048;
    float _1058 = float(_1044);
    float _1060 = fma(_974, -2.0, _1046);
    float _1062 = float(_1056);
    float _1064 = _1012 * _132;
    int _1066 = _1030 ? 0 : 1;
    float _1068 = in.m_59.x;
    float _1070 = in.m_59.y;
    float _1072 = in.m_59.z;
    int _1074 = _972 ? 0 : 1;
    float _1076 = _1058 * _1062;
    float _1078 = exp2(_1064);
    int _1080 = ~_1066;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1084;
    if (!_1018)
    {
        int _1088 = ~_1066;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1096 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1094);
    bool _1098 = !_902;
    int _1100 = _1098 ? 0 : 1;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1104 = ~_1074;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1096);
    int _1112 = _1108;
    if (!_960)
    {
        int _1114 = ~_1074;
        int _1116 = _1114 + 1;
        _1112 = _1116;
    }
    int _1118 = _1112;
    float _1120 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1102);
    int _1122 = abs(_1100);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1126 = 1.0 + _1124;
    bool _1128 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1130 = isnan(1.0);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1136 = _1132 || _1134;
    float _1138 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1120);
    float _1140 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _992);
    float _1142 = 1.0 / _1126;
    float _1144 = _1076 * (-2.0);
    float _1146 = float(_1122);
    float _1148 = -_1078;
    float _1150 = _1148 + 1.0;
    float _1152 = float(_1092);
    bool _1154 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1156 = isnan(0.0);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1162 = _1158 || _1160;
    float _1164 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1060);
    float _1166 = fma(_1144, _1070, _1070);
    float _1168 = fma(_944, _1144, _944);
    int _1170 = abs(_910);
    float _1172 = _1146 * _1152;
    float _1174 = _880 + _876;
    float _1176 = float(_1118);
    float _1178 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1166);
    float _1180 = float(_1170);
    float _1182 = _1172 * (-2.0);
    float _1184 = _1162 ? _1150 : 0.0;
    float _1186 = _1174 + (-1.0);
    float _1188 = -_132;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1036);
    float _1192 = _1180 * _1176;
    float _1194 = _1182;
    if (_1136)
    {
        float _1196 = _1184 * _1142;
        _134 = _1196;
    }
    float _1198 = _134;
    float _1200 = _876 + (-0.5);
    float _1202 = fma(_1182, _1072, _1072);
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1206 = _880 + _888;
    float _1208 = fma(_1168, _1198, _1178);
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1202);
    float _1212 = fma(_1204, _1182, _1204);
    float _1214 = _1192 * (-2.0);
    float _1216 = _1206 + (-1.0);
    float _1218 = _1208 * 0.15915493667125701904296875;
    float _1220 = fma(_1212, _1198, _1210);
    float _1222 = fma(_1214, _1068, _1068);
    float _1224 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1226 = _880 + (-0.5);
    float _1228 = in.m_61.x;
    float _1230 = in.m_61.y;
    float _1232 = in.m_61.z;
    float _1234 = _1220 * 0.15915493667125701904296875;
    float _1236 = fma(_1224, _1214, _1224);
    float _1238 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1222);
    float _1240 = _1218 * 6.283185482025146484375;
    float _1242 = sin(_1240);
    float _1244 = fma(_1236, _1198, _1238);
    bool _1246 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1248 = isnan(0.5);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    float _1256 = _1244 * 0.15915493667125701904296875;
    float _1258 = _1218 * 6.283185482025146484375;
    float _1260 = cos(_1258);
    float _1262 = _1234 * 6.283185482025146484375;
    float _1264 = sin(_1262);
    float _1266 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1228);
    float _1268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1230);
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1232);
    float _1272 = _1234 * 6.283185482025146484375;
    float _1274 = cos(_1272);
    float _1276 = _878 * _1266;
    float _1278 = _904 * _1270;
    float _1280 = _1256 * 6.283185482025146484375;
    float _1282 = cos(_1280);
    float _1284 = _886 * _1268;
    float _1286 = _1242 * _1264;
    float _1288 = _1260 * _1264;
    float _1290 = _1256 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = _1260 * _1274;
    float _1296 = _1242 * _1274;
    float _1298 = _1282 * _1274;
    float _1300 = _1282 * _1264;
    float _1302 = _1282 * _1242;
    float _1304 = _1282 * _1260;
    float _1306 = fma(_1292, _1286, _1294);
    float _1308 = -_1296;
    float _1310 = fma(_1292, _1288, _1308);
    float _1312 = fma(_1292, _1294, _1286);
    float _1314 = -_1288;
    float _1316 = fma(_1292, _1296, _1314);
    float _1318 = _1298 * _1284;
    float _1320 = _1312 * _1284;
    float _1322 = _1316 * _1284;
    float _1324 = fma(_1300, _1276, _1318);
    float _1326 = fma(_1310, _1276, _1320);
    float _1328 = fma(_1306, _1276, _1322);
    float _1330 = -_1292;
    float _1332 = fma(_1330, _1278, _1324);
    float _1334 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1336 = fma(_1304, _1278, _1326);
    float _1338 = fma(_1302, _1278, _1328);
    float _1340 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1342 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1344 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1334);
    float _1346 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1340);
    float _1350 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1342);
    float _1352 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1344);
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1346);
    float _1356 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1348);
    float _1358 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1350);
    float _1360 = _1352 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1362 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1354);
    float _1364 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1368 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1372 = _1360 + _1364;
    float _1374 = _1332 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1376 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1368);
    float _1378 = _1366 + _1370;
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1382 = _1372 + _1380;
    float _1384 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1374);
    float _1386 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1376);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1390 = _1378 + _1388;
    float _1392 = _1382 * _1382;
    float _1394 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1398 = fma(_1390, _1390, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1402 = sqrt(_1398);
    float _1404 = _1396 + _1400;
    bool _1406 = _1402 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1408 = _1336;
    float _1410 = _1400;
    float _1412 = _1378;
    float _1414 = _1344;
    float _1416 = _1398;
    int _1418 = as_type<int>(_1230);
    if (!_1406)
    {
        _1408 = _1378;
    }
    float _1420 = _1408;
    float _1422 = _1420;
    if (!_1406)
    {
        _1410 = _1372;
    }
    float _1424 = _1410;
    float _1426 = _1424;
    if (!_1406)
    {
        _1412 = _1404;
    }
    float _1428 = _1412;
    bool _1430 = !_1406;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1402 + _1436;
        float _1440 = rsqrt(_1398);
        float _1442 = _1438 * _1434;
        float _1444 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1404, _1450, _1460);
        float _1466 = fma(_1390, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1382, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1422 = _1466;
        _1432 = _1464;
        _1426 = _1468;
        _1414 = _1456;
    }
    float _1470 = _1422;
    float _1472 = _1432;
    float _1474 = _1426;
    float _1476 = _1414;
    float _1478 = _1472;
    float _1480 = _1470;
    float _1482 = _1474;
    float _1484 = _1476;
    if (!_1254)
    {
        float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1488 = _1396 + _1486;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1492 = _1366 + _1490;
        float _1494 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1496 = _1488 * _1488;
        float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1500 = _1360 + _1498;
        float _1502 = fma(_1492, _1492, _1496);
        float _1504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1506 = fma(_1500, _1500, _1502);
        float _1508 = sqrt(_1506);
        float _1510 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1512 = precise::min(_1508, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1514 = _1512 * _1504;
        float _1516 = -_1366;
        float _1518 = _1516 + _1470;
        float _1520 = _1510 * _1514;
        float _1522 = -_1396;
        float _1524 = _1522 + _1472;
        float _1526 = -_1360;
        float _1528 = _1526 + _1474;
        float _1530 = fma(_1518, _1520, _1366);
        float _1532 = fma(_1524, _1520, _1396);
        float _1534 = fma(_1528, _1520, _1360);
        _1478 = _1532;
        _1480 = _1530;
        _1482 = _1534;
        _1484 = _1528;
    }
    float _1536 = _1478;
    float _1538 = _1480;
    float _1540 = _1482;
    float _1542 = _1484;
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1546 = _1536 + _1544;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1550 = _1538 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1554 = _1540 + _1552;
    float _1556 = _1546 * _1546;
    float _1558 = fma(_1550, _1550, _1556);
    float _1560 = fma(_1554, _1554, _1558);
    float _1562 = rsqrt(_1560);
    float _1564 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1566 = _1550 * _1564;
    float _1568 = _1554 * _1564;
    float _1570 = _1566 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 + _1572;
    float _1576 = sqrt(_1574);
    bool _1578 = _1576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1576 + _1580;
    float _1584 = _1390;
    float _1586 = _1574;
    float _1588 = _1582;
    float _1590 = _1564;
    if (_1578)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1584 = _1592;
    }
    float _1594 = _1584;
    if (_1578)
    {
        float _1596 = rsqrt(_1574);
        _1586 = _1596;
    }
    float _1598 = _1586;
    if (_1578)
    {
        float _1600 = _1582 * _1594;
        _1588 = _1600;
    }
    float _1602 = _1588;
    if (_1578)
    {
        float _1604 = _1602 * 0.15915493667125701904296875;
        _1194 = _1604;
    }
    float _1606 = _1194;
    float _1608 = _1542;
    if (_1578)
    {
        float _1610 = _1606 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        _1608 = _1612;
    }
    float _1614 = _1608;
    float _1616 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1618 = precise::max(0.0, _1616);
    float _1620 = _1372;
    float _1622 = _1618;
    if (_1578)
    {
        float _1624 = _1606 * 6.283185482025146484375;
        float _1626 = cos(_1624);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = -_1564;
    float _1632 = -_1618;
    float _1634 = fma(_1546, _1630, _1632);
    float _1636 = _1634;
    if (_1578)
    {
        float _1638 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1638;
    }
    float _1640 = _1622;
    float _1642 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1644 = _1614;
    float _1646 = _1640;
    if (_1578)
    {
        float _1648 = fma(_1614, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1416 = _1648;
    }
    float _1650 = _1416;
    float _1652 = _1650;
    if (!_1578)
    {
        _1644 = _1566;
    }
    float _1654 = _1644;
    float _1656 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1642);
    float _1658 = _1654;
    float _1660 = _1628;
    if (_1578)
    {
        float _1662 = _1628 + (-1.0);
        _1590 = _1662;
    }
    float _1664 = _1590;
    float _1666 = _1664;
    if (_1578)
    {
        float _1668 = _1598 * _1650;
        _1652 = _1668;
    }
    float _1670 = _1652;
    float _1672 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1674 = sqrt(_1560);
    if (_1578)
    {
        float _1676 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1646 = _1676;
    }
    float _1678 = _1646;
    float _1680 = _1678;
    if (_1578)
    {
        float _1682 = _1566 * _1670;
        _1658 = _1682;
    }
    float _1684 = _1658;
    if (!_1578)
    {
        _1666 = _1568;
    }
    float _1686 = _1666;
    float _1688 = _1686;
    if (_1578)
    {
        float _1690 = _1568 * _1670;
        _1688 = _1690;
    }
    float _1692 = _1688;
    if (_1578)
    {
        float _1694 = fma(_1634, _1628, _1678);
        _1636 = _1694;
    }
    float _1696 = _1636;
    if (!_1578)
    {
        _1680 = _1570;
    }
    float _1698 = _1680;
    float _1700 = _1698;
    if (_1578)
    {
        float _1702 = _1684 * _1684;
        _1700 = _1702;
    }
    float _1704 = _1700;
    if (!_1578)
    {
        _1660 = _1572;
    }
    float _1706 = _1660;
    float _1708 = _1706;
    if (_1578)
    {
        float _1710 = _1692 * _1692;
        _1708 = _1710;
    }
    float _1712 = _1708;
    float _1714 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1716 = fma(_1696, _1696, _1704);
    float _1718 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1722 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1714);
    float _1724 = _1716 + _1712;
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1728 = fma(_1674, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1726);
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1734 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1722);
    float _1736 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1720);
    float _1740 = rsqrt(_1724);
    float _1742 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1732);
    float _1744 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1746 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1748 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1738);
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1752 = -_1730;
    float _1754 = _1752 + 1.0;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1746);
    float _1758 = _1748 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1762 = abs(_1754);
    float _1764 = log2(_1762);
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1768 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1770 = _1740 * _1684;
    float _1772 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1766);
    float _1774 = _1740 * _1696;
    float _1776 = _1740 * _1692;
    float _1778 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1780 = -_1768;
    float _1782 = fma(_1780, _1760, 1.0);
    float _1784 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = 1.0 / _1772;
    float _1788 = -_1778;
    float _1790 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1788);
    float _1792 = _1774 + 1.0;
    float _1794 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1796 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1798 = -_1776;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1790);
    float _1802 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1804 = log2(_1782);
    float _1806 = fma(_1800, -0.5, 0.5);
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1802);
    float _1812 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1796);
    float _1814 = fma(_1808, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1816 = exp2(_1794);
    float _1818 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1820 = fma(_1808, _1814, -0.212114393711090087890625);
    float _1822 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1812);
    float _1824 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1818);
    float _1826 = fma(_1808, _1820, 1.570728778839111328125);
    float _1828 = _1822 * _1786;
    float _1830 = sqrt(_1806);
    float _1832 = _1804 * 0.693147182464599609375;
    float _1834 = _1824 * _1786;
    float _1836 = fma(_1828, 0.5, 0.5);
    float _1838 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1840 = fma(_1834, -0.5, 0.5);
    float _1842 = -_1774;
    float _1844 = fma(_1816, _1792, _1842);
    float _1846 = fma(_1844, 0.5, 0.5);
    float _1848 = _1830 * 0.636619746685028076171875;
    float _1850 = -_1826;
    float _1852 = fma(_1848, _1850, 1.0);
    float3 _5259 = float3(_1836, _1840, _1838);
    float _1854 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5259, float3(0.0), isnan(_5259)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5259, float3(0.0), isnan(_5259)), level(0.0)).x;
    float3 _5270 = float3(_1836, _1840, _1838);
    float4 _1857 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5270, float3(0.0), isnan(_5270)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5270, float3(0.0), isnan(_5270)), level(0.0)).xyzw;
    float _1859 = _1857.x;
    float _1861 = _1857.y;
    float _1863 = _1857.z;
    float _1865 = _1857.w;
    float2 _5287 = float2(_1852, _1846);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5287, float2(0.0), isnan(_5287)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5287, float2(0.0), isnan(_5287)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = in.m_55.w;
    float _1879 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1883 = _1881 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1885 = in.m_63.x;
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1893 = _1891 != 0;
    float _1895 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1897 = 1.0 / _1883;
    float _1899 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1903 = _1901 != 0;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1905;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1911 = _1909 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1919 = _1917 != 0;
    float _1921 = 1.0 / _1889;
    int _1923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1925 = _1923 != 0;
    float _1927 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1899);
    float _1929 = in.m_49.x;
    bool _1931 = _888 > 0.5;
    bool _1933 = _1877 > 0.5;
    float _1935 = _1911 * _1897;
    float _1937 = -_154;
    float _1939 = _1937 + 1.0;
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1943 = _874 + _1941;
    float _1945 = 1.0 / _1915;
    bool _1947 = _1933;
    if (_1903)
    {
        bool _1949 = _880 > 0.5;
        _1050 = _1949;
    }
    bool _1951 = _1050;
    out.m_65.x = _1885;
    int _1953 = _1933 ? as_type<int>(_1939) : as_type<int>(_154);
    float _1955 = _1907 * _1921;
    float _1957 = _1929;
    if (_1893)
    {
        bool _1959 = _876 > 0.5;
        _1947 = _1959;
    }
    bool _1961 = _1947;
    float _1963 = _1919 ? as_type<float>(_1953) : _154;
    float _1965 = fma(_1955, _1943, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1967 = _1230 != 0.0;
    bool _1969 = isnan(_1230);
    bool _1971 = _1967 || _1969;
    bool _1973 = isnan(0.0);
    bool _1975 = _1971 || _1973;
    float _1977 = in.m_67.x;
    float _1979 = in.m_67.y;
    float _1981 = in.m_67.z;
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1985 = _1228 == 0.0;
    bool _1987 = !_1975;
    bool _1989 = _1985 && _1987;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1993 = _874 + _1991;
    if (_1925)
    {
        float _1995 = _1931 ? _1939 : _154;
        _202 = _1995;
    }
    float _1997 = _202;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1999;
    bool _2003 = _1232 == 0.0;
    bool _2005 = _2003 && _1989;
    float _2007 = fma(_1935, _1993, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2011 = _874 + _2009;
    float _2013 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2015 = _2001 * _1945;
    bool _2017 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2019 = isnan(_874);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    bool _2029 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2031 = isnan(_874);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = fma(_2015, _2011, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2043 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2045 = isnan(_874);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = -_2027;
    float _2057 = _2055 + 1.0;
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2061 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2063 = isnan(_874);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2069 = _2065 || _2067;
    float _2071 = float(_2069);
    float _2073 = _1879 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2075 = _2039 * _2057;
    float _2077 = -_2039;
    float _2079 = _2077 + 1.0;
    float _2081 = _2039;
    if (!_1903)
    {
        _2081 = _1929;
    }
    float _2083 = _2081;
    float _2085 = _1977;
    float _2087 = _1979;
    float _2089 = _2083;
    float _2091 = _1981;
    if (!_2005)
    {
        float _2093 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1977);
        _2085 = _2093;
    }
    float _2095 = _2085;
    if (!_2005)
    {
        float _2097 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1979);
        _2087 = _2097;
    }
    float _2099 = _2087;
    float _2101 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2103 = as_type<int>(_1983);
    if (_1903)
    {
        float _2105 = -_1929;
        float _2107 = _2105 + 1.0;
        _1418 = as_type<int>(_2107);
    }
    int _2109 = _1418;
    if (_1893)
    {
        float _2111 = -_1929;
        float _2113 = _2111 + 1.0;
        _2103 = as_type<int>(_2113);
    }
    int _2115 = _2103;
    float _2117 = fma(_1963, _2073, -0.5);
    float _2119 = fma(_2101, _1997, -0.5);
    float _2121 = _2013 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1903)
    {
        float _2123 = _1951 ? as_type<float>(_2109) : _1929;
        _2089 = _2123;
    }
    float _2125 = _2089;
    if (!_2005)
    {
        float _2127 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1981);
        _2091 = _2127;
    }
    float _2129 = _2091;
    if (_1893)
    {
        float _2131 = _1961 ? as_type<float>(_2115) : _1929;
        _1957 = _2131;
    }
    float _2133 = _1957;
    float _2135 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2137 = -_1164;
    float _2139 = fma(_1032, _2117, _2137);
    float _2141 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2143 = _1292 * _2141;
    float _2145 = -_946;
    float _2147 = fma(_1110, _2119, _2145);
    float _2149 = fma(_2121, _2133, -0.5);
    float _2151 = fma(_2135, _2125, -0.5);
    float _2153 = -_2053;
    float _2155 = _2153 + 1.0;
    float _2157 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2159 = fma(_1140, _2149, _1190);
    float _2161 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2163 = _1292 * _2161;
    float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2167 = _1292 * _2165;
    float _2169 = _2053 * _2079;
    float _2171 = _2071 * _2155;
    float _2173 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2163);
    float _2175 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2167);
    float _2177 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2143);
    float _2179 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2181 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2183 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2185 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2187 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2179);
    float _2189 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2157);
    float _2191 = _1965 * _2171;
    float _2193 = -_2071;
    float _2195 = _2193 + 1.0;
    float _2197 = fma(_1138, _2151, _982);
    float _2199 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2201 = fma(_1316, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2181);
    float _2203 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2183);
    float _2205 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2185);
    float _2207 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2187);
    float _2209 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2189);
    float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2191);
    float _2213 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
    float _2215 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2201);
    float _2217 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2203);
    float _2219 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2205);
    float _2221 = _2207 * _2099;
    float _2223 = _2209 * _2099;
    float _2225 = fma(_2007, _2169, _2211);
    float _2227 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2213);
    float _2229 = _2215 * _2099;
    float _2231 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2173);
    float _2233 = fma(_2217, _2095, _2221);
    float _2235 = fma(_2219, _2095, _2223);
    float _2237 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2175);
    float _2239 = fma(_2041, _2075, _2225);
    float _2241 = fma(_2227, _2095, _2229);
    float _2243 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2245 = fma(_2231, _2129, _2233);
    float _2247 = fma(_2237, _2129, _2235);
    float _2249 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2239);
    float _2251 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2177);
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2255 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2259 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2243);
    float _2261 = _2253 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2263 = _2255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2265 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2267 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2269 = _2147 + 0.5;
    float _2271 = _2139 + 0.5;
    float _2273 = _2197 + 0.5;
    float _2275 = _2159 + 0.5;
    float _2277 = _2249 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2279 = fma(_2251, _2129, _2241);
    float _2281 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2259);
    float _2283 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2267);
    out.m_69.x = _2273;
    out.m_69.y = _2269;
    out.m_69.z = _2275;
    out.m_69.w = _2271;
    bool _2285 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2287 = isnan(0.5);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2293 = _2289 || _2291;
    float _2295 = _2281 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2297 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2283);
    out.m_71.x = _2261;
    out.m_71.y = _2263;
    out.m_71.z = _2265;
    out.m_71.w = _2277;
    float _2299 = exp2(_1895);
    float _2301 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1927);
    float _2303 = _2297 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_73.x = _2245;
    out.m_73.y = _2247;
    out.m_73.z = _2279;
    float _2305 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2301);
    float _2307 = _2303 + _2295;
    float _2309 = 1.0 / _2295;
    float _2311 = _2281;
    if (_2293)
    {
        _2311 = 1.0;
    }
    float _2313 = _2311;
    float _2315 = _2307 * _2309;
    float _2317 = _2315 * 0.5;
    float _2319 = _2313;
    if (!_2293)
    {
        float _2321 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2323 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2325 = _2321 * 0.15915493667125701904296875;
        float _2327 = _2323 * 0.15915493667125701904296875;
        float _2329 = _2325 * 6.283185482025146484375;
        float _2331 = cos(_2329);
        float _2333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2335 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2333);
        float _2337 = _2325 * 6.283185482025146484375;
        float _2339 = sin(_2337);
        float _2341 = 1.0 / _2331;
        float _2343 = _2327 * 6.283185482025146484375;
        float _2345 = cos(_2343);
        float _2347 = _2339 * _2341;
        float _2349 = _2327 * 6.283185482025146484375;
        float _2351 = sin(_2349);
        float _2353 = _2345 * _2347;
        float _2355 = 1.0 / _2335;
        float _2357 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2359 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2357;
        float _2361 = 1.0 / _2353;
        float _2363 = 1.0 / _2359;
        float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2367 = _2355 * _2365;
        float _2369 = _2351 * _2361;
        float _2371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2373 = fma(_2369, _2367, _2371);
        float _2375 = _2373 * _2363;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2319 = _2377;
    }
    float _2379 = _2319;
    float _2381 = -_2299;
    float _2383 = _2381 + 1.0;
    float _2385 = _1772 * 0.5;
    float _2387 = _2379 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2389 = _2379 > 0.0;
    bool _2391 = isnan(_2379);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = _2383 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2401 = fma(_1824, -0.5, _2385);
    float _2403 = _2387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2405 = _2305 + _1772;
    float _2407 = _2399 * _1854;
    float _2409 = _1822 + _1772;
    float _2411 = -_2399;
    float _2413 = _2411 + 1.0;
    out.gl_Position.x = _1822;
    out.gl_Position.y = _1824;
    out.gl_Position.z = _2305;
    out.gl_Position.w = _1772;
    float _2415 = _1865 * _2407;
    float _2417 = _1875 * _2407;
    float _2419 = _2405 * 0.5;
    float _2421 = _2409 * 0.5;
    float _2423 = fma(_1871, _2415, _1859);
    float _2425 = fma(_1873, _2415, _1861);
    float _2427 = _1865 * _2413;
    float _2429 = fma(_1865, _2417, _1863);
    out.m_75.x = _1550;
    out.m_75.y = _1546;
    out.m_75.z = _1554;
    out.m_77.x = _2421;
    out.m_77.y = _2401;
    out.m_77.z = _2419;
    out.m_77.w = _1772;
    out.m_45.x = _2403;
    out.m_79.x = _2423;
    out.m_79.y = _2425;
    out.m_79.z = _2429;
    out.m_79.w = _2427;
    if (_2397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2431 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2431;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

