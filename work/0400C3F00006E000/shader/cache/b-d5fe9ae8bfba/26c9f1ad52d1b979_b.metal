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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1975 = false;
    bool _366 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2260 = as_type<float>(_122);
        out.gl_Position.z = _2260;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_106);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2330 = as_type<float>(_160);
        out.gl_Position.z = _2330;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = in.m_55.x;
    float _292 = in.m_55.y;
    float _294 = in.m_55.z;
    float _296 = _284 * _266;
    float _298 = _286 * _266;
    float _300 = _288 * _266;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _316 = fma(_304, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _318 = fma(_308, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _320 = fma(_312, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _322 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _324 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _326 = fma(_316, _252, _314);
    float _328 = fma(_318, _252, _322);
    float _330 = fma(_320, _252, _324);
    float _332 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _326);
    float _334 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _328);
    float _336 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _330);
    float _338 = _332 * _290;
    float _340 = _334 * _292;
    float _342 = _336 * _294;
    bool _344 = !_262;
    float _346 = _208;
    float _364;
    if (!_344)
    {
        float _348 = in.m_53.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_106);
        float _370 = 1.0 / _368;
        float _372 = _140 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_53.z;
    float _378 = _338 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _382 = _380 != 0;
    float _384 = in.m_53.x;
    float _386 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _398 = _396 != 0;
    float _400 = in.m_57.x;
    float _402 = in.m_57.y;
    float _404 = in.m_57.z;
    float _406 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _408 = _328;
    bool _410 = _394;
    if (!_382)
    {
        float _412 = in.m_53.y;
        _408 = _412;
    }
    float _414 = _408;
    float _416 = _376 * 2.0;
    float _418 = _384 * 2.0;
    float _420 = floor(_416);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _400);
    float _424 = _378 * _422;
    float _426 = floor(_418);
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _430 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _432 = as_type<int>(_404);
    if (!_382)
    {
        _346 = _414;
    }
    float _434 = _346;
    float _436 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _428);
    float _440 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _430);
    bool _442 = _420 >= 0.0;
    bool _444 = isnan(_420);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _434;
    float _454 = _414;
    float _456 = _438;
    if (_382)
    {
        float _458 = in.m_53.x;
        float _460 = in.m_53.y;
        _452 = _458;
        _454 = _460;
    }
    float _462 = _452;
    float _464 = _454;
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _440);
    int _468 = _450 ? 0 : 1;
    float _470 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _436);
    float _472 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _438);
    bool _474 = _426 > 0.0;
    float _476 = sqrt(_466);
    bool _478 = _426 >= 0.0;
    bool _480 = isnan(_426);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_382)
    {
        _456 = _376;
    }
    float _490 = _456;
    bool _492 = _420 > 0.0;
    float _494 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _496 = log2(_494);
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _502 = _490;
    if (_382)
    {
        _502 = _464;
    }
    float _504 = _502;
    float _506 = _462 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _508 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[83].z, _500);
    int _510 = _486 ? 0 : 1;
    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _470);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].w, _488);
    float _516 = -_498;
    float _518 = fma(_506, 2.0, _516);
    float _520 = _504;
    if (!_382)
    {
        _520 = _376;
    }
    float _522 = _520;
    float _524 = _496 * _140;
    float _526 = _464 * 2.0;
    float _528 = _522;
    if (_382)
    {
        _528 = _464;
    }
    float _530 = _528;
    float _532 = exp2(_524);
    int _534 = ~_510;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _542 = _538;
    if (!_474)
    {
        int _544 = ~_510;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    float _550 = _530 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _552 = ~_468;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = -_140;
    float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    bool _562 = !_390;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_550, -2.0, _540);
    int _568 = _556;
    if (!_492)
    {
        int _570 = ~_468;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = in.m_59.x;
    float _578 = in.m_59.y;
    float _580 = in.m_59.z;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _584 = 1.0 + _582;
    int _586 = abs(_564);
    float _588 = floor(_526);
    bool _590 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(1.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = _384 + _464;
    bool _602 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _610 = _606 || _608;
    float _612 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _566);
    bool _614 = !_394;
    int _616 = _614 ? 0 : 1;
    float _618 = _600 + (-1.0);
    float _620 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _514);
    float _622 = 1.0 / _584;
    float _624 = float(_586);
    float _626 = float(_574);
    float _628 = -_532;
    float _630 = _628 + 1.0;
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _634 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _508);
    int _636 = abs(_616);
    float _638 = _624 * _626;
    float _640 = _610 ? _630 : 0.0;
    float _642 = sqrt(_472);
    bool _644 = _588 > 0.0;
    float _646 = _638 * (-2.0);
    bool _648 = _588 >= 0.0;
    bool _650 = isnan(_588);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = float(_548);
    bool _660 = _656;
    if (_598)
    {
        float _662 = _640 * _622;
        _142 = _662;
    }
    float _664 = _142;
    float _666 = fma(_632, _646, _632);
    bool _668 = !_398;
    int _670 = _668 ? 0 : 1;
    float _672 = _384 + (-0.5);
    float _674 = fma(_646, _576, _576);
    int _676 = _656 ? 0 : 1;
    float _678 = _376 + _464;
    int _680 = abs(_670);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].x, _674);
    float _684 = _678 + (-1.0);
    float _686 = in.m_46.x;
    float _688 = in.m_46.y;
    float _690 = in.m_46.z;
    int _692 = ~_676;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = sqrt(_512);
    float _700 = float(_636);
    float _702 = fma(_666, _664, _682);
    int _704 = _696;
    if (!_644)
    {
        int _706 = ~_676;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = float(_680);
    float _714 = _700 * _658;
    float _716 = float(_710);
    float _718 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _720 = _384 + _376;
    float _722 = _714 * (-2.0);
    float _724 = _712 * _716;
    float _726 = _720 + (-1.0);
    float _728 = _464 + (-0.5);
    float _730 = fma(_722, _578, _578);
    float _732 = _724 * (-2.0);
    float _734 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _736 = fma(_718, _722, _718);
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _740 = fma(_732, _580, _580);
    float _742 = _376 + (-0.5);
    float _744 = fma(_734, _732, _734);
    float _746 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _748 = fma(_736, _664, _738);
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _740);
    float _752 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _754 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].y, _746);
    float _756 = _748 * 0.15915493667125701904296875;
    float _758 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _760 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].x, _752);
    float _762 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].y, _754);
    float _764 = fma(_744, _664, _750);
    float _766 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].z, _758);
    float _768 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].x, _760);
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _772 = _702 * 0.15915493667125701904296875;
    float _774 = _764 * 0.15915493667125701904296875;
    float _776 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _778 = _768 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _780 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].z, _766);
    float _782 = _476 * _770;
    float _784 = _772 * 6.283185482025146484375;
    float _786 = sin(_784);
    float _788 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].w, _776);
    float _790 = _642 * _778;
    float _792 = _780 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _796 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _798 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].w, _788);
    float _800 = _698 * _792;
    float _802 = _772 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[24].x, _794);
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[26].x, _796);
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _402);
    float _812 = _798 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _808);
    float _818 = _386 * _810;
    float _820 = _756 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].w, _814);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].w, _816);
    float _828 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _832 = isnan(0.5);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _838 = _834 || _836;
    float _840 = _824 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _842 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[25].x, _828);
    float _844 = _756 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _842);
    float _850 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].w, _848);
    float _852 = _774 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _804 * _822;
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _404);
    float _860 = _786 * _822;
    float _862 = _406 * _858;
    float _864 = _774 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _786 * _846;
    float _870 = _804 * _846;
    float _872 = _786 * _854;
    float _874 = _846 * _854;
    float _876 = _822 * _854;
    float _878 = _804 * _854;
    float _880 = _872 * _818;
    float _882 = _878 * _818;
    float _884 = -_856;
    float _886 = fma(_866, _868, _884);
    float _888 = fma(_866, _860, _870);
    float _890 = -_818;
    float _892 = _866 * _890;
    float _894 = fma(_866, _870, _860);
    float _896 = fma(_886, _424, _880);
    float _898 = _826 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _900 = fma(_874, _424, _892);
    float _902 = -_868;
    float _904 = fma(_866, _856, _902);
    float _906 = fma(_888, _862, _896);
    float _908 = fma(_894, _424, _882);
    float _910 = fma(_876, _862, _900);
    float _912 = _850 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _914 = _898 + _906;
    float _916 = fma(_904, _862, _908);
    float _918 = _840 + _910;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _914 + _920;
    float _924 = _912 + _916;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _918 + _926;
    float _930 = _922 * _922;
    float _932 = fma(_928, _928, _930);
    float _934 = sqrt(_932);
    bool _936 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _938 = _870;
    float _940 = _774;
    float _942 = _914;
    float _944 = _934;
    float _946 = _850;
    float _948 = _918;
    if (!_936)
    {
        _938 = _918;
    }
    float _950 = _938;
    float _952 = _950;
    if (!_936)
    {
        _940 = _924;
    }
    float _954 = _940;
    bool _956 = !_936;
    float _958 = _954;
    if (!_956)
    {
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _964 = _934 + _962;
        float _966 = rsqrt(_932);
        float _968 = _964 * _960;
        float _970 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = _968 * 0.15915493667125701904296875;
        float _974 = _972 * 6.283185482025146484375;
        float _976 = cos(_974);
        float _978 = _972 * 6.283185482025146484375;
        float _980 = sin(_978);
        float _982 = _976 + (-1.0);
        float _984 = fma(_980, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = _966 * _984;
        float _990 = fma(_924, _976, _986);
        float _992 = fma(_928, _988, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _994 = fma(_922, _988, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _952 = _992;
        _958 = _990;
        _942 = _994;
        _944 = _972;
        _946 = _986;
    }
    float _996 = _952;
    float _998 = _958;
    float _1000 = _942;
    float _1002 = _944;
    float _1004 = _946;
    float _1006 = _998;
    float _1008 = _996;
    float _1010 = _1000;
    float _1012 = _1004;
    float _1014 = _1002;
    if (!_838)
    {
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1018 = _912 + _1016;
        float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1022 = _840 + _1020;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1026 = -_840;
        float _1028 = _1026 + _996;
        float _1030 = _1018 * _1018;
        float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1034 = _898 + _1032;
        float _1036 = -_912;
        float _1038 = _1036 + _998;
        float _1040 = fma(_1022, _1022, _1030);
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1044 = fma(_1034, _1034, _1040);
        float _1046 = sqrt(_1044);
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1050 = precise::min(_1046, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1052 = _1050 * _1042;
        float _1054 = _1048 * _1052;
        float _1056 = -_898;
        float _1058 = _1056 + _1000;
        float _1060 = fma(_1028, _1054, _840);
        float _1062 = fma(_1038, _1054, _912);
        float _1064 = fma(_1058, _1054, _898);
        _1006 = _1062;
        _1008 = _1060;
        _1010 = _1064;
        _1012 = _1042;
    }
    float _1066 = _1006;
    float _1068 = _1008;
    float _1070 = _1010;
    float _1072 = _1012;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1076 = _1066 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1080 = _1068 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1084 = _1070 + _1082;
    float _1086 = _1076 * _1076;
    float _1088 = fma(_1080, _1080, _1086);
    float _1090 = fma(_1084, _1084, _1088);
    float _1092 = rsqrt(_1090);
    float _1094 = sqrt(_1090);
    float _1096 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1098 = _1080 * _1096;
    float _1100 = _1084 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 * _1100;
    float _1106 = _1102 + _1104;
    float _1108 = sqrt(_1106);
    bool _1110 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1108 + _1112;
    float _1116 = _1084;
    float _1118 = _1106;
    float _1120 = _1114;
    float _1122 = _1072;
    float _1124 = _1076;
    if (_1110)
    {
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1116 = _1126;
    }
    float _1128 = _1116;
    if (_1110)
    {
        float _1130 = rsqrt(_1106);
        _1118 = _1130;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (_1110)
    {
        float _1136 = _1114 * _1128;
        _1120 = _1136;
    }
    float _1138 = _1120;
    if (_1110)
    {
        float _1140 = _1138 * 0.15915493667125701904296875;
        _1014 = _1140;
    }
    float _1142 = _1014;
    float _1144 = _1128;
    float _1146 = _1142;
    if (_1110)
    {
        float _1148 = _1142 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        _1144 = _1150;
    }
    float _1152 = _1144;
    float _1154 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1156 = precise::max(0.0, _1154);
    float _1158 = _1092;
    float _1160 = _1156;
    if (_1110)
    {
        float _1162 = _1142 * 6.283185482025146484375;
        float _1164 = cos(_1162);
        _1158 = _1164;
    }
    float _1166 = _1158;
    float _1168 = -_1096;
    float _1170 = -_1156;
    float _1172 = fma(_1076, _1168, _1170);
    if (_1110)
    {
        float _1174 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _1174;
    }
    float _1176 = _1160;
    float _1178 = _1176;
    if (!_1110)
    {
        _1146 = _1100;
    }
    float _1180 = _1146;
    float _1182 = _1152;
    float _1184 = _1180;
    if (_1110)
    {
        float _1186 = fma(_1152, _1176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1186;
    }
    float _1188 = _1122;
    float _1190 = _1188;
    if (!_1110)
    {
        _1182 = _1098;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (!_1110)
    {
        _1178 = _1172;
    }
    float _1196 = _1178;
    float _1198 = _1196;
    if (_1110)
    {
        float _1200 = _1166 + (-1.0);
        _1124 = _1200;
    }
    float _1202 = _1124;
    float _1204 = _1202;
    if (_1110)
    {
        float _1206 = _1132 * _1188;
        _948 = _1206;
    }
    float _1208 = _948;
    if (!_1110)
    {
        _1134 = _1102;
    }
    float _1210 = _1134;
    float _1212 = _1210;
    if (_1110)
    {
        float _1214 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1204 = _1214;
    }
    float _1216 = _1204;
    if (_1110)
    {
        float _1218 = _1098 * _1208;
        _1194 = _1218;
    }
    float _1220 = _1194;
    if (_1110)
    {
        float _1222 = _1100 * _1208;
        _1184 = _1222;
    }
    float _1224 = _1184;
    if (!_1110)
    {
        _1190 = _1104;
    }
    float _1226 = _1190;
    float _1228 = _1226;
    if (_1110)
    {
        float _1230 = fma(_1172, _1166, _1216);
        _1198 = _1230;
    }
    float _1232 = _1198;
    if (_1110)
    {
        float _1234 = _1220 * _1220;
        _1212 = _1234;
    }
    float _1236 = _1212;
    if (_1110)
    {
        float _1238 = _1224 * _1224;
        _1228 = _1238;
    }
    float _1240 = _1228;
    float _1242 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = fma(_1232, _1232, _1236);
    float _1246 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1248 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1250 = _1244 + _1240;
    float _1252 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1246);
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1256 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1254);
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = rsqrt(_1250);
    float _1262 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1252);
    float _1264 = -_1258;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1248);
    float _1276 = abs(_1266);
    float _1278 = log2(_1276);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1282 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1286 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = -_1280;
    float _1290 = fma(_1288, _1270, 1.0);
    float _1292 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1294 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1282);
    float _1296 = _1260 * _1220;
    float _1298 = _1260 * _1232;
    float _1300 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1292);
    float _1302 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1294);
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1306 = floor(_1268);
    float _1308 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1300);
    float _1310 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1312 = -_1304;
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1312);
    float _1316 = _1260 * _1224;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1322 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1324 = floor(_1284);
    float _1326 = -_1316;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1314);
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1320);
    float _1332 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1334 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1330);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1332);
    float _1338 = exp2(_1322);
    float _1340 = -_1306;
    float _1342 = _1268 + _1340;
    float _1344 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1346 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1348 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1346);
    float _1350 = log2(_1290);
    float _1352 = -_1324;
    float _1354 = _1284 + _1352;
    float _1356 = _1298 + 1.0;
    float _1358 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1348);
    float _1360 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1362 = 1.0 / _1344;
    float _1364 = fma(_1328, -0.5, 0.5);
    float _1366 = fma(_1328, 0.5, 0.5);
    float _1368 = -_1298;
    float _1370 = fma(_1338, _1356, _1368);
    float _1372 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1374 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1376 = fma(_1366, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _4276 = float2(_1342, _1354);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4276, float2(0.0), isnan(_4276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4276, float2(0.0), isnan(_4276)), level(0.0)).x;
    float _1380 = sqrt(_1364);
    float _1382 = _1350 * 0.693147182464599609375;
    float _1384 = fma(_1366, _1376, -0.212114393711090087890625);
    float _1386 = fma(_1370, 0.5, 0.5);
    float _1388 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = fma(_1366, _1384, 1.570728778839111328125);
    float _1392 = _1372 * _1362;
    float _1394 = _1374 * _1362;
    float _1396 = fma(_1392, 0.5, 0.5);
    float _1398 = fma(_1394, -0.5, 0.5);
    float _1400 = _1380 * 0.636619746685028076171875;
    float3 _4319 = float3(_1396, _1398, _1388);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4319, float3(0.0), isnan(_4319)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4319, float3(0.0), isnan(_4319)), level(0.0)).x;
    float _1404 = -_1390;
    float _1406 = fma(_1400, _1404, 1.0);
    float3 _4335 = float3(_1396, _1398, _1388);
    float4 _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4335, float3(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4335, float3(0.0), isnan(_4335)), level(0.0)).xyzw;
    float _1411 = _1409.x;
    float _1413 = _1409.y;
    float _1415 = _1409.z;
    float _1417 = _1409.w;
    float2 _4351 = float2(_1406, _1386);
    float3 _1421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4351, float2(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4351, float2(0.0), isnan(_4351)), level(0.0)).xyz;
    float _1423 = _1421.x;
    float _1425 = _1421.y;
    float _1427 = _1421.z;
    float _1429 = in.m_61.x;
    float _1431 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1433 = in.m_53.w;
    int _1435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1437 = _1435 != 0;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1441 = _1439 != 0;
    float _1443 = in.m_61.y;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1447 = _1445 != 0;
    float _1449 = in.m_61.z;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1453 = _1451 != 0;
    float _1455 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1457 = in.m_63.y;
    float _1459 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1461 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1455);
    float _1463 = _1344;
    float _1465 = _1374;
    float _1467 = _1372;
    if (_1437)
    {
        bool _1469 = _384 > 0.5;
        _410 = _1469;
    }
    bool _1471 = _410;
    float _1473 = in.m_61.w;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1475;
    float _1479 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1461);
    float _1481 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1459);
    out.m_65.x = _1429;
    float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1485 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1481);
    bool _1487 = _1433 > 0.5;
    float _1489 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_65.y = _1443;
    float _1493 = 1.0 / _1477;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1497 = _1489 + _1491;
    out.m_65.z = _1449;
    if (_1441)
    {
        bool _1499 = _376 > 0.5;
        _660 = _1499;
    }
    bool _1501 = _660;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1505 = -_1457;
    float _1507 = _1505 + 1.0;
    float _1509 = 1.0 / _1491;
    out.m_65.w = _1473;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1513 = _374 + _1511;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1519 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1513 * _1493;
    float _1523 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1525 = _1487 ? as_type<int>(_1507) : as_type<int>(_1457);
    float _1527 = _1517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1529 = _402 != 0.0;
    bool _1531 = isnan(_402);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan(0.0);
    bool _1537 = _1533 || _1535;
    float _1539 = in.m_63.x;
    float _1541 = exp2(_1431);
    float _1543 = _1497 * _1509;
    float _1545 = _1543 * 0.5;
    bool _1547 = _400 == 0.0;
    bool _1549 = !_1537;
    bool _1551 = _1547 && _1549;
    float _1553 = in.m_67.x;
    float _1555 = in.m_67.y;
    float _1557 = in.m_67.z;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1561 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
    bool _1563 = _404 == 0.0;
    bool _1565 = _1563 && _1551;
    out.m_69.x = _1527;
    out.m_69.y = _1519;
    out.m_69.z = _1523;
    out.m_69.w = _1515;
    float _1567 = 1.0 / _1561;
    float _1569 = -_1541;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1579;
    float _1583 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1585;
    float _1589 = fma(_1577, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1591 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1593 = isnan(_374);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_1581, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1605 = fma(_1587, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1607 = _1447 ? as_type<float>(_1525) : _1457;
    float _1609 = _1553;
    float _1611 = _1555;
    float _1613 = _1557;
    int _1615 = as_type<int>(_1603);
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1619 = _1539;
    float _1621 = _1457;
    if (!_1565)
    {
        float _1623 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1553);
        _1609 = _1623;
    }
    float _1625 = _1609;
    bool _1627 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1629 = isnan(_374);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1641 = -_1601;
    float _1643 = _1641 + 1.0;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1647 = _1567 * _1645;
    float _1649 = fma(_1583, _1607, -0.5);
    if (!_1565)
    {
        float _1651 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1555);
        _1611 = _1651;
    }
    float _1653 = _1611;
    float _1655 = _1637 * _1643;
    if (!_1565)
    {
        float _1657 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1557);
        _1613 = _1657;
    }
    float _1659 = _1613;
    if (_1437)
    {
        float _1661 = -_1539;
        float _1663 = _1661 + 1.0;
        _432 = as_type<int>(_1663);
    }
    int _1665 = _432;
    float _1667 = abs(_1647);
    float _1669 = log2(_1667);
    float _1671 = _1603 * _1655;
    if (_1441)
    {
        float _1673 = -_1539;
        float _1675 = _1673 + 1.0;
        _1615 = as_type<int>(_1675);
    }
    int _1677 = _1615;
    bool _1679 = _464 > 0.5;
    float _1681 = _1589 * _1655;
    if (!_1437)
    {
        _1617 = _1539;
    }
    float _1683 = _1617;
    float _1685 = -_1637;
    float _1687 = _1685 + 1.0;
    float _1689 = _1683;
    if (_1437)
    {
        float _1691 = _1471 ? as_type<float>(_1665) : _1539;
        _1689 = _1691;
    }
    float _1693 = _1689;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1441)
    {
        float _1697 = _1501 ? as_type<float>(_1677) : _1539;
        _1619 = _1697;
    }
    float _1699 = _1619;
    float _1701 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1681);
    if (_1453)
    {
        float _1703 = _1679 ? _1507 : _1457;
        _1621 = _1703;
    }
    float _1705 = _1621;
    float _1707 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1709 = _1605 * _1655;
    float _1711 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1701);
    float _1713 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1671);
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1717 = fma(_1707, _1699, -0.5);
    float _1719 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1721 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1709);
    float _1723 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = _1711 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1727 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1729 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1713);
    float _1731 = exp2(_1719);
    float _1733 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1721);
    float _1735 = -_612;
    float _1737 = fma(_620, _1649, _1735);
    float _1739 = -_1653;
    float _1741 = _866 * _1739;
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1745 = fma(_634, _1717, _560);
    float _1747 = _1723 * _1715;
    float _1749 = _1727 * _1695;
    float _1751 = _1733 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1753 = fma(_874, _1625, _1741);
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1757 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1759 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1761 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1763 = precise::clamp(_1761, 0.0, 1.0);
    float _1765 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1767 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1769 = _1647 <= 8000.0;
    bool _1771 = isnan(_1647);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(8000.0);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = fma(_1763, -2.0, 3.0);
    float _1783 = _1763 * _1763;
    float _1785 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    out.m_71.x = _1757;
    out.m_71.y = _1759;
    out.m_71.z = _1767;
    out.m_71.w = _1755;
    float _1787 = _1745 + 0.5;
    float _1789 = _1783 * _1781;
    float _1791 = _1737 + 0.5;
    float _1793 = _878 * _1653;
    bool _1795 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1797 = isnan(_1094);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1803 = _1799 || _1801;
    out.m_73.x = _1747;
    out.m_73.y = _1749;
    out.m_73.z = _1787;
    out.m_73.w = _1791;
    float _1805 = fma(_894, _1625, _1793);
    float _1807 = _872 * _1653;
    float _1809 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1785);
    float _1811 = -_1789;
    float _1813 = _1811 + 1.0;
    float _1815 = in.m_75.x;
    float _1817 = fma(_886, _1625, _1807);
    float _1819 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1809);
    float _1821 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1789);
    float _1823 = fma(_876, _1659, _1753);
    float _1825 = fma(_904, _1659, _1805);
    float _1827 = _1819 + _1344;
    float _1829 = _1779 * _1821;
    float _1831 = fma(_888, _1659, _1817);
    float _1833 = _1827 * 0.5;
    float _1835 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1372;
    out.gl_Position.y = _1374;
    out.gl_Position.z = _1819;
    out.gl_Position.w = _1344;
    float _1837 = _1817;
    float _1839 = _1819;
    float _1841 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1803)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1843 = _1837;
    out.m_77.z = _1833;
    out.m_77.w = _1344;
    out.m_79.x = _1823;
    out.m_79.y = _1825;
    out.m_79.z = _1831;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1803)
    {
        _1463 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1849 = _1463;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1803)
    {
        _1839 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1855 = _1839;
    float _1857 = _1855;
    float _1859 = _1855;
    if (!_1803)
    {
        _1465 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1861 = _1465;
    float _1863 = _1861;
    float _1865 = _1861;
    if (!_1803)
    {
        _1467 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1867 = _1467;
    float _1869 = -_1378;
    float _1871 = _1869 + 1.0;
    float _1873 = _1871 * _1835;
    float _1875 = precise::clamp(_1873, 0.0, 1.0);
    float _1877 = -_1875;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1881 = _1867;
    float _1883 = _1867;
    if (!_1803)
    {
        _1841 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1885 = _1841;
    float _1887 = _1879 * _1815;
    float _1889 = _1887 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1891 = _1573 * _1402;
    float _1893 = -_1573;
    float _1895 = _1893 + 1.0;
    out.m_81.x = _1889;
    float _1897 = _1417 * _1891;
    float _1899 = _1417 * _1895;
    float _1901 = _1427 * _1891;
    float _1903 = fma(_1423, _1897, _1411);
    float _1905 = fma(_1425, _1897, _1413);
    float _1907 = fma(_1417, _1901, _1415);
    out.m_83.x = _1903;
    out.m_83.y = _1905;
    out.m_83.z = _1907;
    out.m_83.w = _1899;
    bool _1909 = !_1803;
    float _1911 = _1885;
    float _1913 = _1885;
    if (!_1909)
    {
        bool _1915 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1917 = isnan(_1094);
        bool _1919 = _1915 || _1917;
        bool _1921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1923 = _1919 || _1921;
        if (!_1923)
        {
            float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1927 = _1094 + _1925;
            float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1931 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1929;
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1937 = 1.0 / _1931;
            float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1941 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1955 = _1927 * _1937;
            float _1957 = precise::clamp(_1955, 0.0, 1.0);
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = fma(_1957, _1935, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1965 = fma(_1957, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1967 = fma(_1957, _1941, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1969 = fma(_1957, _1945, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1971 = fma(_1957, _1949, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1973 = fma(_1957, _1953, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1847 = _1967;
            _1865 = _1971;
            _1913 = _1963;
            _1859 = _1969;
            _1853 = _1965;
            _1883 = _1973;
            _1975 = true;
        }
        else
        {
            bool _1977 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1979 = isnan(_1094);
            bool _1981 = _1977 || _1979;
            bool _1983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1985 = _1981 || _1983;
            if (!_1985)
            {
                _1911 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1987 = _1911;
            _1913 = _1987;
            if (!_1985)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1989 = _1845;
            _1847 = _1989;
            if (!_1985)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1991 = _1851;
            _1853 = _1991;
            if (!_1985)
            {
                _1857 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1993 = _1857;
            _1859 = _1993;
            if (!_1985)
            {
                _1863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1995 = _1863;
            _1865 = _1995;
            if (!_1985)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1997 = _1881;
            bool _1999 = !_1985;
            _1883 = _1997;
            if (!_1999)
            {
                bool _2001 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2003 = isnan(_1094);
                bool _2005 = _2001 || _2003;
                bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2009 = _2005 || _2007;
                if (!_2009)
                {
                    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2013 = _1094 + _2011;
                    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2015;
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2023 = 1.0 / _2017;
                    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2041 = _2013 * _2023;
                    float _2043 = precise::clamp(_2041, 0.0, 1.0);
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = fma(_2043, _2021, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2051 = fma(_2043, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2053 = fma(_2043, _2027, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2055 = fma(_2043, _2031, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2057 = fma(_2043, _2035, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2059 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1847 = _2053;
                    _1865 = _2057;
                    _1913 = _2049;
                    _1859 = _2055;
                    _1853 = _2051;
                    _1883 = _2059;
                    _1975 = true;
                }
                else
                {
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1913 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1859 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1975 = false;
    float _2061 = _1847;
    float _2063 = _1865;
    float _2065 = _1913;
    float _2067 = _1859;
    float _2069 = _1853;
    float _2071 = _1883;
    float _2073 = fma(_1825, -0.5, 0.5);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = -_2061;
    float _2079 = _2077 + _2063;
    float _2081 = -_2065;
    float _2083 = _2081 + _2067;
    float _2085 = -_2069;
    float _2087 = _2085 + _2071;
    bool _2089 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2091 = fma(_2075, _2079, _2061);
    float _2093 = fma(_2075, _2083, _2065);
    float _2095 = fma(_2075, _2087, _2069);
    float _2097 = _2091 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2099 = fma(_2093, 0.298911988735198974609375, _2097);
    float _2101 = fma(_2095, 0.114477999508380889892578125, _2099);
    out.m_85.x = 0.0;
    float _2103 = -_2101;
    float _2105 = _2093 + _2103;
    float _2107 = -_2101;
    float _2109 = _2091 + _2107;
    float _2111 = -_2101;
    float _2113 = _2095 + _2111;
    float _2115 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2117 = fma(_2105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    float _2121 = fma(_2113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    out.m_81.w = _2115;
    out.m_87.x = _2117;
    out.m_87.y = _2119;
    out.m_87.z = _2121;
    if (!_2089)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2123 = -_1066;
    float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2127 = -_1068;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2131 = -_1070;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2135 = _2125 * _2125;
    float _2137 = fma(_2129, _2129, _2135);
    float _2139 = fma(_2133, _2133, _2137);
    float _2141 = sqrt(_2139);
    float _2143 = rsqrt(_2139);
    float _2145 = -_2141;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2149 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = _2129 * _2143;
    float _2155 = _2125 * _2143;
    float _2157 = abs(_2151);
    float _2159 = log2(_2157);
    float _2161 = _2133 * _2143;
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2165 = _1825 * _2155;
    float _2167 = -_2155;
    float _2169 = -_2163;
    float _2171 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2169);
    float _2173 = fma(_1823, _2153, _2165);
    float _2175 = -_2161;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2171);
    float _2179 = fma(_1831, _2161, _2173);
    float _2181 = precise::clamp(_2179, 0.0, 1.0);
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2185 = _2177 + _2183;
    float _2187 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2189 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2191 = precise::clamp(_2189, 0.0, 1.0);
    float _2193 = exp2(_2187);
    float _2195 = _2193 * _2191;
    float _2197 = _2181 * _2195;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2203 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2199;
    out.m_85.y = _2201;
    out.m_85.z = _2203;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1975 = false;
    bool _366 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2260 = as_type<float>(_122);
        out.gl_Position.z = _2260;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_106);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2330 = as_type<float>(_160);
        out.gl_Position.z = _2330;
    }
    if (_152)
    {
        return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = in.m_55.x;
    float _292 = in.m_55.y;
    float _294 = in.m_55.z;
    float _296 = _284 * _266;
    float _298 = _286 * _266;
    float _300 = _288 * _266;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _316 = fma(_304, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _318 = fma(_308, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _320 = fma(_312, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _322 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _324 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _326 = fma(_316, _252, _314);
    float _328 = fma(_318, _252, _322);
    float _330 = fma(_320, _252, _324);
    float _332 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _326);
    float _334 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _328);
    float _336 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _330);
    float _338 = _332 * _290;
    float _340 = _334 * _292;
    float _342 = _336 * _294;
    bool _344 = !_262;
    float _346 = _208;
    float _364;
    if (!_344)
    {
        float _348 = in.m_53.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_106);
        float _370 = 1.0 / _368;
        float _372 = _140 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_53.z;
    float _378 = _338 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _382 = _380 != 0;
    float _384 = in.m_53.x;
    float _386 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _398 = _396 != 0;
    float _400 = in.m_57.x;
    float _402 = in.m_57.y;
    float _404 = in.m_57.z;
    float _406 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _408 = _328;
    bool _410 = _394;
    if (!_382)
    {
        float _412 = in.m_53.y;
        _408 = _412;
    }
    float _414 = _408;
    float _416 = _376 * 2.0;
    float _418 = _384 * 2.0;
    float _420 = floor(_416);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _400);
    float _424 = _378 * _422;
    float _426 = floor(_418);
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _430 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _432 = as_type<int>(_404);
    if (!_382)
    {
        _346 = _414;
    }
    float _434 = _346;
    float _436 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _428);
    float _440 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _430);
    bool _442 = _420 >= 0.0;
    bool _444 = isnan(_420);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _434;
    float _454 = _414;
    float _456 = _438;
    if (_382)
    {
        float _458 = in.m_53.x;
        float _460 = in.m_53.y;
        _452 = _458;
        _454 = _460;
    }
    float _462 = _452;
    float _464 = _454;
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _440);
    int _468 = _450 ? 0 : 1;
    float _470 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _436);
    float _472 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _438);
    bool _474 = _426 > 0.0;
    float _476 = sqrt(_466);
    bool _478 = _426 >= 0.0;
    bool _480 = isnan(_426);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_382)
    {
        _456 = _376;
    }
    float _490 = _456;
    bool _492 = _420 > 0.0;
    float _494 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _496 = log2(_494);
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _502 = _490;
    if (_382)
    {
        _502 = _464;
    }
    float _504 = _502;
    float _506 = _462 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _508 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[83].z, _500);
    int _510 = _486 ? 0 : 1;
    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _470);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].w, _488);
    float _516 = -_498;
    float _518 = fma(_506, 2.0, _516);
    float _520 = _504;
    if (!_382)
    {
        _520 = _376;
    }
    float _522 = _520;
    float _524 = _496 * _140;
    float _526 = _464 * 2.0;
    float _528 = _522;
    if (_382)
    {
        _528 = _464;
    }
    float _530 = _528;
    float _532 = exp2(_524);
    int _534 = ~_510;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _542 = _538;
    if (!_474)
    {
        int _544 = ~_510;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    float _550 = _530 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _552 = ~_468;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = -_140;
    float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    bool _562 = !_390;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_550, -2.0, _540);
    int _568 = _556;
    if (!_492)
    {
        int _570 = ~_468;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = in.m_59.x;
    float _578 = in.m_59.y;
    float _580 = in.m_59.z;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _584 = 1.0 + _582;
    int _586 = abs(_564);
    float _588 = floor(_526);
    bool _590 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(1.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = _384 + _464;
    bool _602 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _610 = _606 || _608;
    float _612 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _566);
    bool _614 = !_394;
    int _616 = _614 ? 0 : 1;
    float _618 = _600 + (-1.0);
    float _620 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _514);
    float _622 = 1.0 / _584;
    float _624 = float(_586);
    float _626 = float(_574);
    float _628 = -_532;
    float _630 = _628 + 1.0;
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _634 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _508);
    int _636 = abs(_616);
    float _638 = _624 * _626;
    float _640 = _610 ? _630 : 0.0;
    float _642 = sqrt(_472);
    bool _644 = _588 > 0.0;
    float _646 = _638 * (-2.0);
    bool _648 = _588 >= 0.0;
    bool _650 = isnan(_588);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = float(_548);
    bool _660 = _656;
    if (_598)
    {
        float _662 = _640 * _622;
        _142 = _662;
    }
    float _664 = _142;
    float _666 = fma(_632, _646, _632);
    bool _668 = !_398;
    int _670 = _668 ? 0 : 1;
    float _672 = _384 + (-0.5);
    float _674 = fma(_646, _576, _576);
    int _676 = _656 ? 0 : 1;
    float _678 = _376 + _464;
    int _680 = abs(_670);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].x, _674);
    float _684 = _678 + (-1.0);
    float _686 = in.m_46.x;
    float _688 = in.m_46.y;
    float _690 = in.m_46.z;
    int _692 = ~_676;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = sqrt(_512);
    float _700 = float(_636);
    float _702 = fma(_666, _664, _682);
    int _704 = _696;
    if (!_644)
    {
        int _706 = ~_676;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = float(_680);
    float _714 = _700 * _658;
    float _716 = float(_710);
    float _718 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _720 = _384 + _376;
    float _722 = _714 * (-2.0);
    float _724 = _712 * _716;
    float _726 = _720 + (-1.0);
    float _728 = _464 + (-0.5);
    float _730 = fma(_722, _578, _578);
    float _732 = _724 * (-2.0);
    float _734 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _736 = fma(_718, _722, _718);
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _740 = fma(_732, _580, _580);
    float _742 = _376 + (-0.5);
    float _744 = fma(_734, _732, _734);
    float _746 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _748 = fma(_736, _664, _738);
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _740);
    float _752 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _754 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].y, _746);
    float _756 = _748 * 0.15915493667125701904296875;
    float _758 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _760 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].x, _752);
    float _762 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].y, _754);
    float _764 = fma(_744, _664, _750);
    float _766 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].z, _758);
    float _768 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].x, _760);
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _772 = _702 * 0.15915493667125701904296875;
    float _774 = _764 * 0.15915493667125701904296875;
    float _776 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _778 = _768 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _780 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].z, _766);
    float _782 = _476 * _770;
    float _784 = _772 * 6.283185482025146484375;
    float _786 = sin(_784);
    float _788 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].w, _776);
    float _790 = _642 * _778;
    float _792 = _780 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _796 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _798 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].w, _788);
    float _800 = _698 * _792;
    float _802 = _772 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[24].x, _794);
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[26].x, _796);
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _402);
    float _812 = _798 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _808);
    float _818 = _386 * _810;
    float _820 = _756 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].w, _814);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].w, _816);
    float _828 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _832 = isnan(0.5);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _838 = _834 || _836;
    float _840 = _824 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _842 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[25].x, _828);
    float _844 = _756 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _842);
    float _850 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].w, _848);
    float _852 = _774 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _804 * _822;
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _404);
    float _860 = _786 * _822;
    float _862 = _406 * _858;
    float _864 = _774 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _786 * _846;
    float _870 = _804 * _846;
    float _872 = _786 * _854;
    float _874 = _846 * _854;
    float _876 = _822 * _854;
    float _878 = _804 * _854;
    float _880 = _872 * _818;
    float _882 = _878 * _818;
    float _884 = -_856;
    float _886 = fma(_866, _868, _884);
    float _888 = fma(_866, _860, _870);
    float _890 = -_818;
    float _892 = _866 * _890;
    float _894 = fma(_866, _870, _860);
    float _896 = fma(_886, _424, _880);
    float _898 = _826 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _900 = fma(_874, _424, _892);
    float _902 = -_868;
    float _904 = fma(_866, _856, _902);
    float _906 = fma(_888, _862, _896);
    float _908 = fma(_894, _424, _882);
    float _910 = fma(_876, _862, _900);
    float _912 = _850 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _914 = _898 + _906;
    float _916 = fma(_904, _862, _908);
    float _918 = _840 + _910;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _914 + _920;
    float _924 = _912 + _916;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _918 + _926;
    float _930 = _922 * _922;
    float _932 = fma(_928, _928, _930);
    float _934 = sqrt(_932);
    bool _936 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _938 = _870;
    float _940 = _774;
    float _942 = _914;
    float _944 = _934;
    float _946 = _850;
    float _948 = _918;
    if (!_936)
    {
        _938 = _918;
    }
    float _950 = _938;
    float _952 = _950;
    if (!_936)
    {
        _940 = _924;
    }
    float _954 = _940;
    bool _956 = !_936;
    float _958 = _954;
    if (!_956)
    {
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _964 = _934 + _962;
        float _966 = rsqrt(_932);
        float _968 = _964 * _960;
        float _970 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = _968 * 0.15915493667125701904296875;
        float _974 = _972 * 6.283185482025146484375;
        float _976 = cos(_974);
        float _978 = _972 * 6.283185482025146484375;
        float _980 = sin(_978);
        float _982 = _976 + (-1.0);
        float _984 = fma(_980, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = _966 * _984;
        float _990 = fma(_924, _976, _986);
        float _992 = fma(_928, _988, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _994 = fma(_922, _988, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _952 = _992;
        _958 = _990;
        _942 = _994;
        _944 = _972;
        _946 = _986;
    }
    float _996 = _952;
    float _998 = _958;
    float _1000 = _942;
    float _1002 = _944;
    float _1004 = _946;
    float _1006 = _998;
    float _1008 = _996;
    float _1010 = _1000;
    float _1012 = _1004;
    float _1014 = _1002;
    if (!_838)
    {
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1018 = _912 + _1016;
        float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1022 = _840 + _1020;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1026 = -_840;
        float _1028 = _1026 + _996;
        float _1030 = _1018 * _1018;
        float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1034 = _898 + _1032;
        float _1036 = -_912;
        float _1038 = _1036 + _998;
        float _1040 = fma(_1022, _1022, _1030);
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1044 = fma(_1034, _1034, _1040);
        float _1046 = sqrt(_1044);
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1050 = precise::min(_1046, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1052 = _1050 * _1042;
        float _1054 = _1048 * _1052;
        float _1056 = -_898;
        float _1058 = _1056 + _1000;
        float _1060 = fma(_1028, _1054, _840);
        float _1062 = fma(_1038, _1054, _912);
        float _1064 = fma(_1058, _1054, _898);
        _1006 = _1062;
        _1008 = _1060;
        _1010 = _1064;
        _1012 = _1042;
    }
    float _1066 = _1006;
    float _1068 = _1008;
    float _1070 = _1010;
    float _1072 = _1012;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1076 = _1066 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1080 = _1068 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1084 = _1070 + _1082;
    float _1086 = _1076 * _1076;
    float _1088 = fma(_1080, _1080, _1086);
    float _1090 = fma(_1084, _1084, _1088);
    float _1092 = rsqrt(_1090);
    float _1094 = sqrt(_1090);
    float _1096 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1098 = _1080 * _1096;
    float _1100 = _1084 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 * _1100;
    float _1106 = _1102 + _1104;
    float _1108 = sqrt(_1106);
    bool _1110 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1108 + _1112;
    float _1116 = _1084;
    float _1118 = _1106;
    float _1120 = _1114;
    float _1122 = _1072;
    float _1124 = _1076;
    if (_1110)
    {
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1116 = _1126;
    }
    float _1128 = _1116;
    if (_1110)
    {
        float _1130 = rsqrt(_1106);
        _1118 = _1130;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (_1110)
    {
        float _1136 = _1114 * _1128;
        _1120 = _1136;
    }
    float _1138 = _1120;
    if (_1110)
    {
        float _1140 = _1138 * 0.15915493667125701904296875;
        _1014 = _1140;
    }
    float _1142 = _1014;
    float _1144 = _1128;
    float _1146 = _1142;
    if (_1110)
    {
        float _1148 = _1142 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        _1144 = _1150;
    }
    float _1152 = _1144;
    float _1154 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1156 = precise::max(0.0, _1154);
    float _1158 = _1092;
    float _1160 = _1156;
    if (_1110)
    {
        float _1162 = _1142 * 6.283185482025146484375;
        float _1164 = cos(_1162);
        _1158 = _1164;
    }
    float _1166 = _1158;
    float _1168 = -_1096;
    float _1170 = -_1156;
    float _1172 = fma(_1076, _1168, _1170);
    if (_1110)
    {
        float _1174 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _1174;
    }
    float _1176 = _1160;
    float _1178 = _1176;
    if (!_1110)
    {
        _1146 = _1100;
    }
    float _1180 = _1146;
    float _1182 = _1152;
    float _1184 = _1180;
    if (_1110)
    {
        float _1186 = fma(_1152, _1176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1186;
    }
    float _1188 = _1122;
    float _1190 = _1188;
    if (!_1110)
    {
        _1182 = _1098;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (!_1110)
    {
        _1178 = _1172;
    }
    float _1196 = _1178;
    float _1198 = _1196;
    if (_1110)
    {
        float _1200 = _1166 + (-1.0);
        _1124 = _1200;
    }
    float _1202 = _1124;
    float _1204 = _1202;
    if (_1110)
    {
        float _1206 = _1132 * _1188;
        _948 = _1206;
    }
    float _1208 = _948;
    if (!_1110)
    {
        _1134 = _1102;
    }
    float _1210 = _1134;
    float _1212 = _1210;
    if (_1110)
    {
        float _1214 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1204 = _1214;
    }
    float _1216 = _1204;
    if (_1110)
    {
        float _1218 = _1098 * _1208;
        _1194 = _1218;
    }
    float _1220 = _1194;
    if (_1110)
    {
        float _1222 = _1100 * _1208;
        _1184 = _1222;
    }
    float _1224 = _1184;
    if (!_1110)
    {
        _1190 = _1104;
    }
    float _1226 = _1190;
    float _1228 = _1226;
    if (_1110)
    {
        float _1230 = fma(_1172, _1166, _1216);
        _1198 = _1230;
    }
    float _1232 = _1198;
    if (_1110)
    {
        float _1234 = _1220 * _1220;
        _1212 = _1234;
    }
    float _1236 = _1212;
    if (_1110)
    {
        float _1238 = _1224 * _1224;
        _1228 = _1238;
    }
    float _1240 = _1228;
    float _1242 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = fma(_1232, _1232, _1236);
    float _1246 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1248 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1250 = _1244 + _1240;
    float _1252 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1246);
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1256 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1254);
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = rsqrt(_1250);
    float _1262 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1252);
    float _1264 = -_1258;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1248);
    float _1276 = abs(_1266);
    float _1278 = log2(_1276);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1282 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1286 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = -_1280;
    float _1290 = fma(_1288, _1270, 1.0);
    float _1292 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1294 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1282);
    float _1296 = _1260 * _1220;
    float _1298 = _1260 * _1232;
    float _1300 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1292);
    float _1302 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1294);
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1306 = floor(_1268);
    float _1308 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1300);
    float _1310 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1312 = -_1304;
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1312);
    float _1316 = _1260 * _1224;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1322 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1324 = floor(_1284);
    float _1326 = -_1316;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1314);
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1320);
    float _1332 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1334 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1330);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1332);
    float _1338 = exp2(_1322);
    float _1340 = -_1306;
    float _1342 = _1268 + _1340;
    float _1344 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1346 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1348 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1346);
    float _1350 = log2(_1290);
    float _1352 = -_1324;
    float _1354 = _1284 + _1352;
    float _1356 = _1298 + 1.0;
    float _1358 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1348);
    float _1360 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1362 = 1.0 / _1344;
    float _1364 = fma(_1328, -0.5, 0.5);
    float _1366 = fma(_1328, 0.5, 0.5);
    float _1368 = -_1298;
    float _1370 = fma(_1338, _1356, _1368);
    float _1372 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1374 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1376 = fma(_1366, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _4276 = float2(_1342, _1354);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4276, float2(0.0), isnan(_4276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4276, float2(0.0), isnan(_4276)), level(0.0)).x;
    float _1380 = sqrt(_1364);
    float _1382 = _1350 * 0.693147182464599609375;
    float _1384 = fma(_1366, _1376, -0.212114393711090087890625);
    float _1386 = fma(_1370, 0.5, 0.5);
    float _1388 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = fma(_1366, _1384, 1.570728778839111328125);
    float _1392 = _1372 * _1362;
    float _1394 = _1374 * _1362;
    float _1396 = fma(_1392, 0.5, 0.5);
    float _1398 = fma(_1394, -0.5, 0.5);
    float _1400 = _1380 * 0.636619746685028076171875;
    float3 _4319 = float3(_1396, _1398, _1388);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4319, float3(0.0), isnan(_4319)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4319, float3(0.0), isnan(_4319)), level(0.0)).x;
    float _1404 = -_1390;
    float _1406 = fma(_1400, _1404, 1.0);
    float3 _4335 = float3(_1396, _1398, _1388);
    float4 _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4335, float3(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4335, float3(0.0), isnan(_4335)), level(0.0)).xyzw;
    float _1411 = _1409.x;
    float _1413 = _1409.y;
    float _1415 = _1409.z;
    float _1417 = _1409.w;
    float2 _4351 = float2(_1406, _1386);
    float3 _1421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4351, float2(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4351, float2(0.0), isnan(_4351)), level(0.0)).xyz;
    float _1423 = _1421.x;
    float _1425 = _1421.y;
    float _1427 = _1421.z;
    float _1429 = in.m_61.x;
    float _1431 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1433 = in.m_53.w;
    int _1435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1437 = _1435 != 0;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1441 = _1439 != 0;
    float _1443 = in.m_61.y;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1447 = _1445 != 0;
    float _1449 = in.m_61.z;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1453 = _1451 != 0;
    float _1455 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1457 = in.m_63.y;
    float _1459 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1461 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1455);
    float _1463 = _1344;
    float _1465 = _1374;
    float _1467 = _1372;
    if (_1437)
    {
        bool _1469 = _384 > 0.5;
        _410 = _1469;
    }
    bool _1471 = _410;
    float _1473 = in.m_61.w;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1475;
    float _1479 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1461);
    float _1481 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1459);
    out.m_65.x = _1429;
    float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1485 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1481);
    bool _1487 = _1433 > 0.5;
    float _1489 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_65.y = _1443;
    float _1493 = 1.0 / _1477;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1497 = _1489 + _1491;
    out.m_65.z = _1449;
    if (_1441)
    {
        bool _1499 = _376 > 0.5;
        _660 = _1499;
    }
    bool _1501 = _660;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1505 = -_1457;
    float _1507 = _1505 + 1.0;
    float _1509 = 1.0 / _1491;
    out.m_65.w = _1473;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1513 = _374 + _1511;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1519 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1513 * _1493;
    float _1523 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1525 = _1487 ? as_type<int>(_1507) : as_type<int>(_1457);
    float _1527 = _1517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1529 = _402 != 0.0;
    bool _1531 = isnan(_402);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan(0.0);
    bool _1537 = _1533 || _1535;
    float _1539 = in.m_63.x;
    float _1541 = exp2(_1431);
    float _1543 = _1497 * _1509;
    float _1545 = _1543 * 0.5;
    bool _1547 = _400 == 0.0;
    bool _1549 = !_1537;
    bool _1551 = _1547 && _1549;
    float _1553 = in.m_67.x;
    float _1555 = in.m_67.y;
    float _1557 = in.m_67.z;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1561 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
    bool _1563 = _404 == 0.0;
    bool _1565 = _1563 && _1551;
    out.m_69.x = _1527;
    out.m_69.y = _1519;
    out.m_69.z = _1523;
    out.m_69.w = _1515;
    float _1567 = 1.0 / _1561;
    float _1569 = -_1541;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1579;
    float _1583 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1585;
    float _1589 = fma(_1577, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1591 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1593 = isnan(_374);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_1581, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1605 = fma(_1587, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1607 = _1447 ? as_type<float>(_1525) : _1457;
    float _1609 = _1553;
    float _1611 = _1555;
    float _1613 = _1557;
    int _1615 = as_type<int>(_1603);
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1619 = _1539;
    float _1621 = _1457;
    if (!_1565)
    {
        float _1623 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1553);
        _1609 = _1623;
    }
    float _1625 = _1609;
    bool _1627 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1629 = isnan(_374);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1641 = -_1601;
    float _1643 = _1641 + 1.0;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1647 = _1567 * _1645;
    float _1649 = fma(_1583, _1607, -0.5);
    if (!_1565)
    {
        float _1651 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1555);
        _1611 = _1651;
    }
    float _1653 = _1611;
    float _1655 = _1637 * _1643;
    if (!_1565)
    {
        float _1657 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1557);
        _1613 = _1657;
    }
    float _1659 = _1613;
    if (_1437)
    {
        float _1661 = -_1539;
        float _1663 = _1661 + 1.0;
        _432 = as_type<int>(_1663);
    }
    int _1665 = _432;
    float _1667 = abs(_1647);
    float _1669 = log2(_1667);
    float _1671 = _1603 * _1655;
    if (_1441)
    {
        float _1673 = -_1539;
        float _1675 = _1673 + 1.0;
        _1615 = as_type<int>(_1675);
    }
    int _1677 = _1615;
    bool _1679 = _464 > 0.5;
    float _1681 = _1589 * _1655;
    if (!_1437)
    {
        _1617 = _1539;
    }
    float _1683 = _1617;
    float _1685 = -_1637;
    float _1687 = _1685 + 1.0;
    float _1689 = _1683;
    if (_1437)
    {
        float _1691 = _1471 ? as_type<float>(_1665) : _1539;
        _1689 = _1691;
    }
    float _1693 = _1689;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1441)
    {
        float _1697 = _1501 ? as_type<float>(_1677) : _1539;
        _1619 = _1697;
    }
    float _1699 = _1619;
    float _1701 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1681);
    if (_1453)
    {
        float _1703 = _1679 ? _1507 : _1457;
        _1621 = _1703;
    }
    float _1705 = _1621;
    float _1707 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1709 = _1605 * _1655;
    float _1711 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1701);
    float _1713 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1671);
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1717 = fma(_1707, _1699, -0.5);
    float _1719 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1721 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1709);
    float _1723 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = _1711 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1727 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1729 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1713);
    float _1731 = exp2(_1719);
    float _1733 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1721);
    float _1735 = -_612;
    float _1737 = fma(_620, _1649, _1735);
    float _1739 = -_1653;
    float _1741 = _866 * _1739;
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1745 = fma(_634, _1717, _560);
    float _1747 = _1723 * _1715;
    float _1749 = _1727 * _1695;
    float _1751 = _1733 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1753 = fma(_874, _1625, _1741);
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1757 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1759 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1761 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1763 = precise::clamp(_1761, 0.0, 1.0);
    float _1765 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1767 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1769 = _1647 <= 8000.0;
    bool _1771 = isnan(_1647);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(8000.0);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = fma(_1763, -2.0, 3.0);
    float _1783 = _1763 * _1763;
    float _1785 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    out.m_71.x = _1757;
    out.m_71.y = _1759;
    out.m_71.z = _1767;
    out.m_71.w = _1755;
    float _1787 = _1745 + 0.5;
    float _1789 = _1783 * _1781;
    float _1791 = _1737 + 0.5;
    float _1793 = _878 * _1653;
    bool _1795 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1797 = isnan(_1094);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1803 = _1799 || _1801;
    out.m_73.x = _1747;
    out.m_73.y = _1749;
    out.m_73.z = _1787;
    out.m_73.w = _1791;
    float _1805 = fma(_894, _1625, _1793);
    float _1807 = _872 * _1653;
    float _1809 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1785);
    float _1811 = -_1789;
    float _1813 = _1811 + 1.0;
    float _1815 = in.m_75.x;
    float _1817 = fma(_886, _1625, _1807);
    float _1819 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1809);
    float _1821 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1789);
    float _1823 = fma(_876, _1659, _1753);
    float _1825 = fma(_904, _1659, _1805);
    float _1827 = _1819 + _1344;
    float _1829 = _1779 * _1821;
    float _1831 = fma(_888, _1659, _1817);
    float _1833 = _1827 * 0.5;
    float _1835 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1372;
    out.gl_Position.y = _1374;
    out.gl_Position.z = _1819;
    out.gl_Position.w = _1344;
    float _1837 = _1817;
    float _1839 = _1819;
    float _1841 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1803)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1843 = _1837;
    out.m_77.z = _1833;
    out.m_77.w = _1344;
    out.m_79.x = _1823;
    out.m_79.y = _1825;
    out.m_79.z = _1831;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1803)
    {
        _1463 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1849 = _1463;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1803)
    {
        _1839 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1855 = _1839;
    float _1857 = _1855;
    float _1859 = _1855;
    if (!_1803)
    {
        _1465 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1861 = _1465;
    float _1863 = _1861;
    float _1865 = _1861;
    if (!_1803)
    {
        _1467 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1867 = _1467;
    float _1869 = -_1378;
    float _1871 = _1869 + 1.0;
    float _1873 = _1871 * _1835;
    float _1875 = precise::clamp(_1873, 0.0, 1.0);
    float _1877 = -_1875;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1881 = _1867;
    float _1883 = _1867;
    if (!_1803)
    {
        _1841 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1885 = _1841;
    float _1887 = _1879 * _1815;
    float _1889 = _1887 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1891 = _1573 * _1402;
    float _1893 = -_1573;
    float _1895 = _1893 + 1.0;
    out.m_81.x = _1889;
    float _1897 = _1417 * _1891;
    float _1899 = _1417 * _1895;
    float _1901 = _1427 * _1891;
    float _1903 = fma(_1423, _1897, _1411);
    float _1905 = fma(_1425, _1897, _1413);
    float _1907 = fma(_1417, _1901, _1415);
    out.m_83.x = _1903;
    out.m_83.y = _1905;
    out.m_83.z = _1907;
    out.m_83.w = _1899;
    bool _1909 = !_1803;
    float _1911 = _1885;
    float _1913 = _1885;
    if (!_1909)
    {
        bool _1915 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1917 = isnan(_1094);
        bool _1919 = _1915 || _1917;
        bool _1921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1923 = _1919 || _1921;
        if (!_1923)
        {
            float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1927 = _1094 + _1925;
            float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1931 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1929;
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1937 = 1.0 / _1931;
            float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1941 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1955 = _1927 * _1937;
            float _1957 = precise::clamp(_1955, 0.0, 1.0);
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = fma(_1957, _1935, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1965 = fma(_1957, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1967 = fma(_1957, _1941, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1969 = fma(_1957, _1945, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1971 = fma(_1957, _1949, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1973 = fma(_1957, _1953, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1847 = _1967;
            _1865 = _1971;
            _1913 = _1963;
            _1859 = _1969;
            _1853 = _1965;
            _1883 = _1973;
            _1975 = true;
        }
        else
        {
            bool _1977 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1979 = isnan(_1094);
            bool _1981 = _1977 || _1979;
            bool _1983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1985 = _1981 || _1983;
            if (!_1985)
            {
                _1911 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1987 = _1911;
            _1913 = _1987;
            if (!_1985)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1989 = _1845;
            _1847 = _1989;
            if (!_1985)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1991 = _1851;
            _1853 = _1991;
            if (!_1985)
            {
                _1857 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1993 = _1857;
            _1859 = _1993;
            if (!_1985)
            {
                _1863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1995 = _1863;
            _1865 = _1995;
            if (!_1985)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1997 = _1881;
            bool _1999 = !_1985;
            _1883 = _1997;
            if (!_1999)
            {
                bool _2001 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2003 = isnan(_1094);
                bool _2005 = _2001 || _2003;
                bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2009 = _2005 || _2007;
                if (!_2009)
                {
                    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2013 = _1094 + _2011;
                    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2015;
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2023 = 1.0 / _2017;
                    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2041 = _2013 * _2023;
                    float _2043 = precise::clamp(_2041, 0.0, 1.0);
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = fma(_2043, _2021, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2051 = fma(_2043, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2053 = fma(_2043, _2027, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2055 = fma(_2043, _2031, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2057 = fma(_2043, _2035, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2059 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1847 = _2053;
                    _1865 = _2057;
                    _1913 = _2049;
                    _1859 = _2055;
                    _1853 = _2051;
                    _1883 = _2059;
                    _1975 = true;
                }
                else
                {
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1913 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1859 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1975 = false;
    float _2061 = _1847;
    float _2063 = _1865;
    float _2065 = _1913;
    float _2067 = _1859;
    float _2069 = _1853;
    float _2071 = _1883;
    float _2073 = fma(_1825, -0.5, 0.5);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = -_2061;
    float _2079 = _2077 + _2063;
    float _2081 = -_2065;
    float _2083 = _2081 + _2067;
    float _2085 = -_2069;
    float _2087 = _2085 + _2071;
    bool _2089 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2091 = fma(_2075, _2079, _2061);
    float _2093 = fma(_2075, _2083, _2065);
    float _2095 = fma(_2075, _2087, _2069);
    float _2097 = _2091 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2099 = fma(_2093, 0.298911988735198974609375, _2097);
    float _2101 = fma(_2095, 0.114477999508380889892578125, _2099);
    out.m_85.x = 0.0;
    float _2103 = -_2101;
    float _2105 = _2093 + _2103;
    float _2107 = -_2101;
    float _2109 = _2091 + _2107;
    float _2111 = -_2101;
    float _2113 = _2095 + _2111;
    float _2115 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2117 = fma(_2105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    float _2121 = fma(_2113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    out.m_81.w = _2115;
    out.m_87.x = _2117;
    out.m_87.y = _2119;
    out.m_87.z = _2121;
    if (!_2089)
    {
        return out;
    }
    float _2123 = -_1066;
    float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2127 = -_1068;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2131 = -_1070;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2135 = _2125 * _2125;
    float _2137 = fma(_2129, _2129, _2135);
    float _2139 = fma(_2133, _2133, _2137);
    float _2141 = sqrt(_2139);
    float _2143 = rsqrt(_2139);
    float _2145 = -_2141;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2149 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = _2129 * _2143;
    float _2155 = _2125 * _2143;
    float _2157 = abs(_2151);
    float _2159 = log2(_2157);
    float _2161 = _2133 * _2143;
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2165 = _1825 * _2155;
    float _2167 = -_2155;
    float _2169 = -_2163;
    float _2171 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2169);
    float _2173 = fma(_1823, _2153, _2165);
    float _2175 = -_2161;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2171);
    float _2179 = fma(_1831, _2161, _2173);
    float _2181 = precise::clamp(_2179, 0.0, 1.0);
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2185 = _2177 + _2183;
    float _2187 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2189 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2191 = precise::clamp(_2189, 0.0, 1.0);
    float _2193 = exp2(_2187);
    float _2195 = _2193 * _2191;
    float _2197 = _2181 * _2195;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2203 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2199;
    out.m_85.y = _2201;
    out.m_85.z = _2203;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1975 = false;
    bool _366 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_49.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2260 = as_type<float>(_122);
        out.gl_Position.z = _2260;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_51.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_106);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2330 = as_type<float>(_160);
        out.gl_Position.z = _2330;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = in.m_55.x;
    float _292 = in.m_55.y;
    float _294 = in.m_55.z;
    float _296 = _284 * _266;
    float _298 = _286 * _266;
    float _300 = _288 * _266;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _316 = fma(_304, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _318 = fma(_308, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _320 = fma(_312, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _322 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _324 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _326 = fma(_316, _252, _314);
    float _328 = fma(_318, _252, _322);
    float _330 = fma(_320, _252, _324);
    float _332 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _326);
    float _334 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _328);
    float _336 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _330);
    float _338 = _332 * _290;
    float _340 = _334 * _292;
    float _342 = _336 * _294;
    bool _344 = !_262;
    float _346 = _208;
    float _364;
    if (!_344)
    {
        float _348 = in.m_53.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _364 = _362;
        _366 = true;
    }
    else
    {
        float _368 = float(_106);
        float _370 = 1.0 / _368;
        float _372 = _140 * _370;
        _364 = _372;
    }
    _366 = false;
    float _374 = _364;
    float _376 = in.m_53.z;
    float _378 = _338 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _382 = _380 != 0;
    float _384 = in.m_53.x;
    float _386 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _390 = _388 != 0;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _398 = _396 != 0;
    float _400 = in.m_57.x;
    float _402 = in.m_57.y;
    float _404 = in.m_57.z;
    float _406 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _408 = _328;
    bool _410 = _394;
    if (!_382)
    {
        float _412 = in.m_53.y;
        _408 = _412;
    }
    float _414 = _408;
    float _416 = _376 * 2.0;
    float _418 = _384 * 2.0;
    float _420 = floor(_416);
    float _422 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _400);
    float _424 = _378 * _422;
    float _426 = floor(_418);
    float _428 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _430 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    int _432 = as_type<int>(_404);
    if (!_382)
    {
        _346 = _414;
    }
    float _434 = _346;
    float _436 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _438 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _428);
    float _440 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _430);
    bool _442 = _420 >= 0.0;
    bool _444 = isnan(_420);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _434;
    float _454 = _414;
    float _456 = _438;
    if (_382)
    {
        float _458 = in.m_53.x;
        float _460 = in.m_53.y;
        _452 = _458;
        _454 = _460;
    }
    float _462 = _452;
    float _464 = _454;
    float _466 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _440);
    int _468 = _450 ? 0 : 1;
    float _470 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _436);
    float _472 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _438);
    bool _474 = _426 > 0.0;
    float _476 = sqrt(_466);
    bool _478 = _426 >= 0.0;
    bool _480 = isnan(_426);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_382)
    {
        _456 = _376;
    }
    float _490 = _456;
    bool _492 = _420 > 0.0;
    float _494 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _496 = log2(_494);
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _502 = _490;
    if (_382)
    {
        _502 = _464;
    }
    float _504 = _502;
    float _506 = _462 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _508 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[83].z, _500);
    int _510 = _486 ? 0 : 1;
    float _512 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _470);
    float _514 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].w, _488);
    float _516 = -_498;
    float _518 = fma(_506, 2.0, _516);
    float _520 = _504;
    if (!_382)
    {
        _520 = _376;
    }
    float _522 = _520;
    float _524 = _496 * _140;
    float _526 = _464 * 2.0;
    float _528 = _522;
    if (_382)
    {
        _528 = _464;
    }
    float _530 = _528;
    float _532 = exp2(_524);
    int _534 = ~_510;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _542 = _538;
    if (!_474)
    {
        int _544 = ~_510;
        int _546 = _544 + 1;
        _542 = _546;
    }
    int _548 = _542;
    float _550 = _530 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _552 = ~_468;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = -_140;
    float _560 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    bool _562 = !_390;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_550, -2.0, _540);
    int _568 = _556;
    if (!_492)
    {
        int _570 = ~_468;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = in.m_59.x;
    float _578 = in.m_59.y;
    float _580 = in.m_59.z;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _584 = 1.0 + _582;
    int _586 = abs(_564);
    float _588 = floor(_526);
    bool _590 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _592 = isnan(1.0);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _598 = _594 || _596;
    float _600 = _384 + _464;
    bool _602 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _604 = isnan(0.0);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _610 = _606 || _608;
    float _612 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _566);
    bool _614 = !_394;
    int _616 = _614 ? 0 : 1;
    float _618 = _600 + (-1.0);
    float _620 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _514);
    float _622 = 1.0 / _584;
    float _624 = float(_586);
    float _626 = float(_574);
    float _628 = -_532;
    float _630 = _628 + 1.0;
    float _632 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _634 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _508);
    int _636 = abs(_616);
    float _638 = _624 * _626;
    float _640 = _610 ? _630 : 0.0;
    float _642 = sqrt(_472);
    bool _644 = _588 > 0.0;
    float _646 = _638 * (-2.0);
    bool _648 = _588 >= 0.0;
    bool _650 = isnan(_588);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = float(_548);
    bool _660 = _656;
    if (_598)
    {
        float _662 = _640 * _622;
        _142 = _662;
    }
    float _664 = _142;
    float _666 = fma(_632, _646, _632);
    bool _668 = !_398;
    int _670 = _668 ? 0 : 1;
    float _672 = _384 + (-0.5);
    float _674 = fma(_646, _576, _576);
    int _676 = _656 ? 0 : 1;
    float _678 = _376 + _464;
    int _680 = abs(_670);
    float _682 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[196].x, _674);
    float _684 = _678 + (-1.0);
    float _686 = in.m_46.x;
    float _688 = in.m_46.y;
    float _690 = in.m_46.z;
    int _692 = ~_676;
    int _694 = _692 + 1;
    int _696 = _694 + 1;
    float _698 = sqrt(_512);
    float _700 = float(_636);
    float _702 = fma(_666, _664, _682);
    int _704 = _696;
    if (!_644)
    {
        int _706 = ~_676;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = float(_680);
    float _714 = _700 * _658;
    float _716 = float(_710);
    float _718 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _720 = _384 + _376;
    float _722 = _714 * (-2.0);
    float _724 = _712 * _716;
    float _726 = _720 + (-1.0);
    float _728 = _464 + (-0.5);
    float _730 = fma(_722, _578, _578);
    float _732 = _724 * (-2.0);
    float _734 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _736 = fma(_718, _722, _718);
    float _738 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[196].y, _730);
    float _740 = fma(_732, _580, _580);
    float _742 = _376 + (-0.5);
    float _744 = fma(_734, _732, _734);
    float _746 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _748 = fma(_736, _664, _738);
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[196].z, _740);
    float _752 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _754 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].y, _746);
    float _756 = _748 * 0.15915493667125701904296875;
    float _758 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _760 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].x, _752);
    float _762 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].y, _754);
    float _764 = fma(_744, _664, _750);
    float _766 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].z, _758);
    float _768 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].x, _760);
    float _770 = _762 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _772 = _702 * 0.15915493667125701904296875;
    float _774 = _764 * 0.15915493667125701904296875;
    float _776 = _688 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _778 = _768 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _780 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].z, _766);
    float _782 = _476 * _770;
    float _784 = _772 * 6.283185482025146484375;
    float _786 = sin(_784);
    float _788 = fma(_686, (*spvDescriptorSet0.vp_c10)._m0[14].w, _776);
    float _790 = _642 * _778;
    float _792 = _780 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _796 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _798 = fma(_690, (*spvDescriptorSet0.vp_c10)._m0[16].w, _788);
    float _800 = _698 * _792;
    float _802 = _772 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[24].x, _794);
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[26].x, _796);
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _402);
    float _812 = _798 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[24].z, _806);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[26].z, _808);
    float _818 = _386 * _810;
    float _820 = _756 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].w, _814);
    float _826 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].w, _816);
    float _828 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _832 = isnan(0.5);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _838 = _834 || _836;
    float _840 = _824 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _842 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[25].x, _828);
    float _844 = _756 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[25].z, _842);
    float _850 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].w, _848);
    float _852 = _774 * 6.283185482025146484375;
    float _854 = cos(_852);
    float _856 = _804 * _822;
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _404);
    float _860 = _786 * _822;
    float _862 = _406 * _858;
    float _864 = _774 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _786 * _846;
    float _870 = _804 * _846;
    float _872 = _786 * _854;
    float _874 = _846 * _854;
    float _876 = _822 * _854;
    float _878 = _804 * _854;
    float _880 = _872 * _818;
    float _882 = _878 * _818;
    float _884 = -_856;
    float _886 = fma(_866, _868, _884);
    float _888 = fma(_866, _860, _870);
    float _890 = -_818;
    float _892 = _866 * _890;
    float _894 = fma(_866, _870, _860);
    float _896 = fma(_886, _424, _880);
    float _898 = _826 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _900 = fma(_874, _424, _892);
    float _902 = -_868;
    float _904 = fma(_866, _856, _902);
    float _906 = fma(_888, _862, _896);
    float _908 = fma(_894, _424, _882);
    float _910 = fma(_876, _862, _900);
    float _912 = _850 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _914 = _898 + _906;
    float _916 = fma(_904, _862, _908);
    float _918 = _840 + _910;
    float _920 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _922 = _914 + _920;
    float _924 = _912 + _916;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _918 + _926;
    float _930 = _922 * _922;
    float _932 = fma(_928, _928, _930);
    float _934 = sqrt(_932);
    bool _936 = _934 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _938 = _870;
    float _940 = _774;
    float _942 = _914;
    float _944 = _934;
    float _946 = _850;
    float _948 = _918;
    if (!_936)
    {
        _938 = _918;
    }
    float _950 = _938;
    float _952 = _950;
    if (!_936)
    {
        _940 = _924;
    }
    float _954 = _940;
    bool _956 = !_936;
    float _958 = _954;
    if (!_956)
    {
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _962 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _964 = _934 + _962;
        float _966 = rsqrt(_932);
        float _968 = _964 * _960;
        float _970 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = _968 * 0.15915493667125701904296875;
        float _974 = _972 * 6.283185482025146484375;
        float _976 = cos(_974);
        float _978 = _972 * 6.283185482025146484375;
        float _980 = sin(_978);
        float _982 = _976 + (-1.0);
        float _984 = fma(_980, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _986 = _982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _988 = _966 * _984;
        float _990 = fma(_924, _976, _986);
        float _992 = fma(_928, _988, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _994 = fma(_922, _988, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _952 = _992;
        _958 = _990;
        _942 = _994;
        _944 = _972;
        _946 = _986;
    }
    float _996 = _952;
    float _998 = _958;
    float _1000 = _942;
    float _1002 = _944;
    float _1004 = _946;
    float _1006 = _998;
    float _1008 = _996;
    float _1010 = _1000;
    float _1012 = _1004;
    float _1014 = _1002;
    if (!_838)
    {
        float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1018 = _912 + _1016;
        float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1022 = _840 + _1020;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1026 = -_840;
        float _1028 = _1026 + _996;
        float _1030 = _1018 * _1018;
        float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1034 = _898 + _1032;
        float _1036 = -_912;
        float _1038 = _1036 + _998;
        float _1040 = fma(_1022, _1022, _1030);
        float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1044 = fma(_1034, _1034, _1040);
        float _1046 = sqrt(_1044);
        float _1048 = _1024 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1050 = precise::min(_1046, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1052 = _1050 * _1042;
        float _1054 = _1048 * _1052;
        float _1056 = -_898;
        float _1058 = _1056 + _1000;
        float _1060 = fma(_1028, _1054, _840);
        float _1062 = fma(_1038, _1054, _912);
        float _1064 = fma(_1058, _1054, _898);
        _1006 = _1062;
        _1008 = _1060;
        _1010 = _1064;
        _1012 = _1042;
    }
    float _1066 = _1006;
    float _1068 = _1008;
    float _1070 = _1010;
    float _1072 = _1012;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1076 = _1066 + _1074;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1080 = _1068 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1084 = _1070 + _1082;
    float _1086 = _1076 * _1076;
    float _1088 = fma(_1080, _1080, _1086);
    float _1090 = fma(_1084, _1084, _1088);
    float _1092 = rsqrt(_1090);
    float _1094 = sqrt(_1090);
    float _1096 = _1092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1098 = _1080 * _1096;
    float _1100 = _1084 * _1096;
    float _1102 = _1098 * _1098;
    float _1104 = _1100 * _1100;
    float _1106 = _1102 + _1104;
    float _1108 = sqrt(_1106);
    bool _1110 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1108 + _1112;
    float _1116 = _1084;
    float _1118 = _1106;
    float _1120 = _1114;
    float _1122 = _1072;
    float _1124 = _1076;
    if (_1110)
    {
        float _1126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1116 = _1126;
    }
    float _1128 = _1116;
    if (_1110)
    {
        float _1130 = rsqrt(_1106);
        _1118 = _1130;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (_1110)
    {
        float _1136 = _1114 * _1128;
        _1120 = _1136;
    }
    float _1138 = _1120;
    if (_1110)
    {
        float _1140 = _1138 * 0.15915493667125701904296875;
        _1014 = _1140;
    }
    float _1142 = _1014;
    float _1144 = _1128;
    float _1146 = _1142;
    if (_1110)
    {
        float _1148 = _1142 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        _1144 = _1150;
    }
    float _1152 = _1144;
    float _1154 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1156 = precise::max(0.0, _1154);
    float _1158 = _1092;
    float _1160 = _1156;
    if (_1110)
    {
        float _1162 = _1142 * 6.283185482025146484375;
        float _1164 = cos(_1162);
        _1158 = _1164;
    }
    float _1166 = _1158;
    float _1168 = -_1096;
    float _1170 = -_1156;
    float _1172 = fma(_1076, _1168, _1170);
    if (_1110)
    {
        float _1174 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1160 = _1174;
    }
    float _1176 = _1160;
    float _1178 = _1176;
    if (!_1110)
    {
        _1146 = _1100;
    }
    float _1180 = _1146;
    float _1182 = _1152;
    float _1184 = _1180;
    if (_1110)
    {
        float _1186 = fma(_1152, _1176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1186;
    }
    float _1188 = _1122;
    float _1190 = _1188;
    if (!_1110)
    {
        _1182 = _1098;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (!_1110)
    {
        _1178 = _1172;
    }
    float _1196 = _1178;
    float _1198 = _1196;
    if (_1110)
    {
        float _1200 = _1166 + (-1.0);
        _1124 = _1200;
    }
    float _1202 = _1124;
    float _1204 = _1202;
    if (_1110)
    {
        float _1206 = _1132 * _1188;
        _948 = _1206;
    }
    float _1208 = _948;
    if (!_1110)
    {
        _1134 = _1102;
    }
    float _1210 = _1134;
    float _1212 = _1210;
    if (_1110)
    {
        float _1214 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1204 = _1214;
    }
    float _1216 = _1204;
    if (_1110)
    {
        float _1218 = _1098 * _1208;
        _1194 = _1218;
    }
    float _1220 = _1194;
    if (_1110)
    {
        float _1222 = _1100 * _1208;
        _1184 = _1222;
    }
    float _1224 = _1184;
    if (!_1110)
    {
        _1190 = _1104;
    }
    float _1226 = _1190;
    float _1228 = _1226;
    if (_1110)
    {
        float _1230 = fma(_1172, _1166, _1216);
        _1198 = _1230;
    }
    float _1232 = _1198;
    if (_1110)
    {
        float _1234 = _1220 * _1220;
        _1212 = _1234;
    }
    float _1236 = _1212;
    if (_1110)
    {
        float _1238 = _1224 * _1224;
        _1228 = _1238;
    }
    float _1240 = _1228;
    float _1242 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1244 = fma(_1232, _1232, _1236);
    float _1246 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1248 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1242);
    float _1250 = _1244 + _1240;
    float _1252 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1246);
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1256 = fma(_1094, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1254);
    float _1258 = precise::clamp(_1256, 0.0, 1.0);
    float _1260 = rsqrt(_1250);
    float _1262 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1252);
    float _1264 = -_1258;
    float _1266 = _1264 + 1.0;
    float _1268 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1272 = _1262 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1248);
    float _1276 = abs(_1266);
    float _1278 = log2(_1276);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1282 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1284 = fma(_898, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1286 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1288 = -_1280;
    float _1290 = fma(_1288, _1270, 1.0);
    float _1292 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1294 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1282);
    float _1296 = _1260 * _1220;
    float _1298 = _1260 * _1232;
    float _1300 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1292);
    float _1302 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1294);
    float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1306 = floor(_1268);
    float _1308 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1300);
    float _1310 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1312 = -_1304;
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1312);
    float _1316 = _1260 * _1224;
    float _1318 = _1308 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1322 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1324 = floor(_1284);
    float _1326 = -_1316;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1314);
    float _1330 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1320);
    float _1332 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1334 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1330);
    float _1336 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1332);
    float _1338 = exp2(_1322);
    float _1340 = -_1306;
    float _1342 = _1268 + _1340;
    float _1344 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1346 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1348 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1346);
    float _1350 = log2(_1290);
    float _1352 = -_1324;
    float _1354 = _1284 + _1352;
    float _1356 = _1298 + 1.0;
    float _1358 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1348);
    float _1360 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1362 = 1.0 / _1344;
    float _1364 = fma(_1328, -0.5, 0.5);
    float _1366 = fma(_1328, 0.5, 0.5);
    float _1368 = -_1298;
    float _1370 = fma(_1338, _1356, _1368);
    float _1372 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1358);
    float _1374 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1360);
    float _1376 = fma(_1366, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _4276 = float2(_1342, _1354);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4276, float2(0.0), isnan(_4276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4276, float2(0.0), isnan(_4276)), level(0.0)).x;
    float _1380 = sqrt(_1364);
    float _1382 = _1350 * 0.693147182464599609375;
    float _1384 = fma(_1366, _1376, -0.212114393711090087890625);
    float _1386 = fma(_1370, 0.5, 0.5);
    float _1388 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1390 = fma(_1366, _1384, 1.570728778839111328125);
    float _1392 = _1372 * _1362;
    float _1394 = _1374 * _1362;
    float _1396 = fma(_1392, 0.5, 0.5);
    float _1398 = fma(_1394, -0.5, 0.5);
    float _1400 = _1380 * 0.636619746685028076171875;
    float3 _4319 = float3(_1396, _1398, _1388);
    float _1402 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4319, float3(0.0), isnan(_4319)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4319, float3(0.0), isnan(_4319)), level(0.0)).x;
    float _1404 = -_1390;
    float _1406 = fma(_1400, _1404, 1.0);
    float3 _4335 = float3(_1396, _1398, _1388);
    float4 _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4335, float3(0.0), isnan(_4335)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4335, float3(0.0), isnan(_4335)), level(0.0)).xyzw;
    float _1411 = _1409.x;
    float _1413 = _1409.y;
    float _1415 = _1409.z;
    float _1417 = _1409.w;
    float2 _4351 = float2(_1406, _1386);
    float3 _1421 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4351, float2(0.0), isnan(_4351)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4351, float2(0.0), isnan(_4351)), level(0.0)).xyz;
    float _1423 = _1421.x;
    float _1425 = _1421.y;
    float _1427 = _1421.z;
    float _1429 = in.m_61.x;
    float _1431 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1433 = in.m_53.w;
    int _1435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1437 = _1435 != 0;
    int _1439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1441 = _1439 != 0;
    float _1443 = in.m_61.y;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1447 = _1445 != 0;
    float _1449 = in.m_61.z;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1453 = _1451 != 0;
    float _1455 = _912 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1457 = in.m_63.y;
    float _1459 = _912 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1461 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1455);
    float _1463 = _1344;
    float _1465 = _1374;
    float _1467 = _1372;
    if (_1437)
    {
        bool _1469 = _384 > 0.5;
        _410 = _1469;
    }
    bool _1471 = _410;
    float _1473 = in.m_61.w;
    float _1475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1475;
    float _1479 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1461);
    float _1481 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1459);
    out.m_65.x = _1429;
    float _1483 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1485 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1481);
    bool _1487 = _1433 > 0.5;
    float _1489 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1491 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_65.y = _1443;
    float _1493 = 1.0 / _1477;
    float _1495 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1497 = _1489 + _1491;
    out.m_65.z = _1449;
    if (_1441)
    {
        bool _1499 = _376 > 0.5;
        _660 = _1499;
    }
    bool _1501 = _660;
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1505 = -_1457;
    float _1507 = _1505 + 1.0;
    float _1509 = 1.0 / _1491;
    out.m_65.w = _1473;
    float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1513 = _374 + _1511;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1519 = _1495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1521 = _1513 * _1493;
    float _1523 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1525 = _1487 ? as_type<int>(_1507) : as_type<int>(_1457);
    float _1527 = _1517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1529 = _402 != 0.0;
    bool _1531 = isnan(_402);
    bool _1533 = _1529 || _1531;
    bool _1535 = isnan(0.0);
    bool _1537 = _1533 || _1535;
    float _1539 = in.m_63.x;
    float _1541 = exp2(_1431);
    float _1543 = _1497 * _1509;
    float _1545 = _1543 * 0.5;
    bool _1547 = _400 == 0.0;
    bool _1549 = !_1537;
    bool _1551 = _1547 && _1549;
    float _1553 = in.m_67.x;
    float _1555 = in.m_67.y;
    float _1557 = in.m_67.z;
    float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1561 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1559);
    bool _1563 = _404 == 0.0;
    bool _1565 = _1563 && _1551;
    out.m_69.x = _1527;
    out.m_69.y = _1519;
    out.m_69.z = _1523;
    out.m_69.w = _1515;
    float _1567 = 1.0 / _1561;
    float _1569 = -_1541;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1579;
    float _1583 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1585;
    float _1589 = fma(_1577, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1591 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1593 = isnan(_374);
    bool _1595 = _1591 || _1593;
    bool _1597 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1599 = _1595 || _1597;
    float _1601 = float(_1599);
    float _1603 = fma(_1581, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1605 = fma(_1587, _1521, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1607 = _1447 ? as_type<float>(_1525) : _1457;
    float _1609 = _1553;
    float _1611 = _1555;
    float _1613 = _1557;
    int _1615 = as_type<int>(_1603);
    float _1617 = (*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1619 = _1539;
    float _1621 = _1457;
    if (!_1565)
    {
        float _1623 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1553);
        _1609 = _1623;
    }
    float _1625 = _1609;
    bool _1627 = _374 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1629 = isnan(_374);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1641 = -_1601;
    float _1643 = _1641 + 1.0;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1647 = _1567 * _1645;
    float _1649 = fma(_1583, _1607, -0.5);
    if (!_1565)
    {
        float _1651 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1555);
        _1611 = _1651;
    }
    float _1653 = _1611;
    float _1655 = _1637 * _1643;
    if (!_1565)
    {
        float _1657 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1557);
        _1613 = _1657;
    }
    float _1659 = _1613;
    if (_1437)
    {
        float _1661 = -_1539;
        float _1663 = _1661 + 1.0;
        _432 = as_type<int>(_1663);
    }
    int _1665 = _432;
    float _1667 = abs(_1647);
    float _1669 = log2(_1667);
    float _1671 = _1603 * _1655;
    if (_1441)
    {
        float _1673 = -_1539;
        float _1675 = _1673 + 1.0;
        _1615 = as_type<int>(_1675);
    }
    int _1677 = _1615;
    bool _1679 = _464 > 0.5;
    float _1681 = _1589 * _1655;
    if (!_1437)
    {
        _1617 = _1539;
    }
    float _1683 = _1617;
    float _1685 = -_1637;
    float _1687 = _1685 + 1.0;
    float _1689 = _1683;
    if (_1437)
    {
        float _1691 = _1471 ? as_type<float>(_1665) : _1539;
        _1689 = _1691;
    }
    float _1693 = _1689;
    float _1695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_1441)
    {
        float _1697 = _1501 ? as_type<float>(_1677) : _1539;
        _1619 = _1697;
    }
    float _1699 = _1619;
    float _1701 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1681);
    if (_1453)
    {
        float _1703 = _1679 ? _1507 : _1457;
        _1621 = _1703;
    }
    float _1705 = _1621;
    float _1707 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1709 = _1605 * _1655;
    float _1711 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1701);
    float _1713 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1671);
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1717 = fma(_1707, _1699, -0.5);
    float _1719 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1721 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1709);
    float _1723 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1725 = _1711 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1727 = _1705 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1729 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1713);
    float _1731 = exp2(_1719);
    float _1733 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1721);
    float _1735 = -_612;
    float _1737 = fma(_620, _1649, _1735);
    float _1739 = -_1653;
    float _1741 = _866 * _1739;
    float _1743 = _1729 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1745 = fma(_634, _1717, _560);
    float _1747 = _1723 * _1715;
    float _1749 = _1727 * _1695;
    float _1751 = _1733 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1753 = fma(_874, _1625, _1741);
    float _1755 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1757 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1759 = _1725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1761 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1763 = precise::clamp(_1761, 0.0, 1.0);
    float _1765 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1767 = _1751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1769 = _1647 <= 8000.0;
    bool _1771 = isnan(_1647);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan(8000.0);
    bool _1777 = _1773 || _1775;
    float _1779 = float(_1777);
    float _1781 = fma(_1763, -2.0, 3.0);
    float _1783 = _1763 * _1763;
    float _1785 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1765);
    out.m_71.x = _1757;
    out.m_71.y = _1759;
    out.m_71.z = _1767;
    out.m_71.w = _1755;
    float _1787 = _1745 + 0.5;
    float _1789 = _1783 * _1781;
    float _1791 = _1737 + 0.5;
    float _1793 = _878 * _1653;
    bool _1795 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1797 = isnan(_1094);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1803 = _1799 || _1801;
    out.m_73.x = _1747;
    out.m_73.y = _1749;
    out.m_73.z = _1787;
    out.m_73.w = _1791;
    float _1805 = fma(_894, _1625, _1793);
    float _1807 = _872 * _1653;
    float _1809 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1785);
    float _1811 = -_1789;
    float _1813 = _1811 + 1.0;
    float _1815 = in.m_75.x;
    float _1817 = fma(_886, _1625, _1807);
    float _1819 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1809);
    float _1821 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1789);
    float _1823 = fma(_876, _1659, _1753);
    float _1825 = fma(_904, _1659, _1805);
    float _1827 = _1819 + _1344;
    float _1829 = _1779 * _1821;
    float _1831 = fma(_888, _1659, _1817);
    float _1833 = _1827 * 0.5;
    float _1835 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1372;
    out.gl_Position.y = _1374;
    out.gl_Position.z = _1819;
    out.gl_Position.w = _1344;
    float _1837 = _1817;
    float _1839 = _1819;
    float _1841 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_1803)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1843 = _1837;
    out.m_77.z = _1833;
    out.m_77.w = _1344;
    out.m_79.x = _1823;
    out.m_79.y = _1825;
    out.m_79.z = _1831;
    float _1845 = _1843;
    float _1847 = _1843;
    if (!_1803)
    {
        _1463 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1849 = _1463;
    float _1851 = _1849;
    float _1853 = _1849;
    if (!_1803)
    {
        _1839 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1855 = _1839;
    float _1857 = _1855;
    float _1859 = _1855;
    if (!_1803)
    {
        _1465 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1861 = _1465;
    float _1863 = _1861;
    float _1865 = _1861;
    if (!_1803)
    {
        _1467 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1867 = _1467;
    float _1869 = -_1378;
    float _1871 = _1869 + 1.0;
    float _1873 = _1871 * _1835;
    float _1875 = precise::clamp(_1873, 0.0, 1.0);
    float _1877 = -_1875;
    float _1879 = fma(_1877, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1881 = _1867;
    float _1883 = _1867;
    if (!_1803)
    {
        _1841 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1885 = _1841;
    float _1887 = _1879 * _1815;
    float _1889 = _1887 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1891 = _1573 * _1402;
    float _1893 = -_1573;
    float _1895 = _1893 + 1.0;
    out.m_81.x = _1889;
    float _1897 = _1417 * _1891;
    float _1899 = _1417 * _1895;
    float _1901 = _1427 * _1891;
    float _1903 = fma(_1423, _1897, _1411);
    float _1905 = fma(_1425, _1897, _1413);
    float _1907 = fma(_1417, _1901, _1415);
    out.m_83.x = _1903;
    out.m_83.y = _1905;
    out.m_83.z = _1907;
    out.m_83.w = _1899;
    bool _1909 = !_1803;
    float _1911 = _1885;
    float _1913 = _1885;
    if (!_1909)
    {
        bool _1915 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1917 = isnan(_1094);
        bool _1919 = _1915 || _1917;
        bool _1921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1923 = _1919 || _1921;
        if (!_1923)
        {
            float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1927 = _1094 + _1925;
            float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1931 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1929;
            float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1935 = _1933 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1937 = 1.0 / _1931;
            float _1939 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1941 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1945 = _1943 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1955 = _1927 * _1937;
            float _1957 = precise::clamp(_1955, 0.0, 1.0);
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = fma(_1957, _1935, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1965 = fma(_1957, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1967 = fma(_1957, _1941, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1969 = fma(_1957, _1945, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1971 = fma(_1957, _1949, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1973 = fma(_1957, _1953, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1847 = _1967;
            _1865 = _1971;
            _1913 = _1963;
            _1859 = _1969;
            _1853 = _1965;
            _1883 = _1973;
            _1975 = true;
        }
        else
        {
            bool _1977 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1979 = isnan(_1094);
            bool _1981 = _1977 || _1979;
            bool _1983 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1985 = _1981 || _1983;
            if (!_1985)
            {
                _1911 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1987 = _1911;
            _1913 = _1987;
            if (!_1985)
            {
                _1845 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1989 = _1845;
            _1847 = _1989;
            if (!_1985)
            {
                _1851 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1991 = _1851;
            _1853 = _1991;
            if (!_1985)
            {
                _1857 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1993 = _1857;
            _1859 = _1993;
            if (!_1985)
            {
                _1863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1995 = _1863;
            _1865 = _1995;
            if (!_1985)
            {
                _1881 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1997 = _1881;
            bool _1999 = !_1985;
            _1883 = _1997;
            if (!_1999)
            {
                bool _2001 = _1094 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2003 = isnan(_1094);
                bool _2005 = _2001 || _2003;
                bool _2007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2009 = _2005 || _2007;
                if (!_2009)
                {
                    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2013 = _1094 + _2011;
                    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2017 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2015;
                    float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2023 = 1.0 / _2017;
                    float _2025 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2027 = _2025 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2029 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2031 = _2029 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2041 = _2013 * _2023;
                    float _2043 = precise::clamp(_2041, 0.0, 1.0);
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = fma(_2043, _2021, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2051 = fma(_2043, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2053 = fma(_2043, _2027, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2055 = fma(_2043, _2031, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2057 = fma(_2043, _2035, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2059 = fma(_2043, _2039, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1847 = _2053;
                    _1865 = _2057;
                    _1913 = _2049;
                    _1859 = _2055;
                    _1853 = _2051;
                    _1883 = _2059;
                    _1975 = true;
                }
                else
                {
                    _1847 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1913 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1859 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1853 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1883 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1975 = false;
    float _2061 = _1847;
    float _2063 = _1865;
    float _2065 = _1913;
    float _2067 = _1859;
    float _2069 = _1853;
    float _2071 = _1883;
    float _2073 = fma(_1825, -0.5, 0.5);
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = -_2061;
    float _2079 = _2077 + _2063;
    float _2081 = -_2065;
    float _2083 = _2081 + _2067;
    float _2085 = -_2069;
    float _2087 = _2085 + _2071;
    bool _2089 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2091 = fma(_2075, _2079, _2061);
    float _2093 = fma(_2075, _2083, _2065);
    float _2095 = fma(_2075, _2087, _2069);
    float _2097 = _2091 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2099 = fma(_2093, 0.298911988735198974609375, _2097);
    float _2101 = fma(_2095, 0.114477999508380889892578125, _2099);
    out.m_85.x = 0.0;
    float _2103 = -_2101;
    float _2105 = _2093 + _2103;
    float _2107 = -_2101;
    float _2109 = _2091 + _2107;
    float _2111 = -_2101;
    float _2113 = _2095 + _2111;
    float _2115 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2117 = fma(_2105, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    float _2119 = fma(_2109, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    float _2121 = fma(_2113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2101);
    out.m_81.w = _2115;
    out.m_87.x = _2117;
    out.m_87.y = _2119;
    out.m_87.z = _2121;
    if (!_2089)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2123 = -_1066;
    float _2125 = _2123 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2127 = -_1068;
    float _2129 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2131 = -_1070;
    float _2133 = _2131 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2135 = _2125 * _2125;
    float _2137 = fma(_2129, _2129, _2135);
    float _2139 = fma(_2133, _2133, _2137);
    float _2141 = sqrt(_2139);
    float _2143 = rsqrt(_2139);
    float _2145 = -_2141;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2149 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2151 = precise::clamp(_2149, 0.0, 1.0);
    float _2153 = _2129 * _2143;
    float _2155 = _2125 * _2143;
    float _2157 = abs(_2151);
    float _2159 = log2(_2157);
    float _2161 = _2133 * _2143;
    float _2163 = _2153 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2165 = _1825 * _2155;
    float _2167 = -_2155;
    float _2169 = -_2163;
    float _2171 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2169);
    float _2173 = fma(_1823, _2153, _2165);
    float _2175 = -_2161;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2171);
    float _2179 = fma(_1831, _2161, _2173);
    float _2181 = precise::clamp(_2179, 0.0, 1.0);
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2185 = _2177 + _2183;
    float _2187 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2189 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2191 = precise::clamp(_2189, 0.0, 1.0);
    float _2193 = exp2(_2187);
    float _2195 = _2193 * _2191;
    float _2197 = _2181 * _2195;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2203 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2199;
    out.m_85.y = _2201;
    out.m_85.z = _2203;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

