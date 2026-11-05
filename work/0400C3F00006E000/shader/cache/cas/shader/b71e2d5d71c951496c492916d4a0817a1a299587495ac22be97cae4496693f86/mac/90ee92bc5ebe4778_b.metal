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
    float4 m_51 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _634 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2146 = as_type<float>(_108);
        out.gl_Position.z = _2146;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2215 = as_type<float>(_146);
        out.gl_Position.z = _2215;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = 0.0;
    float _188 = _150;
    if (!_160)
    {
        float _190 = _150 * _150;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = _194;
    if (!_160)
    {
        float _200 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_160;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _150 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _150);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_160;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _150 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _188 = _260;
    }
    float _262 = _188;
    out.m_51.x = _178;
    out.m_51.y = _184;
    out.m_51.z = _196;
    out.m_51.w = _182;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _162, _266);
    float _274 = fma(_262, _164, _268);
    float _276 = fma(_262, _166, _270);
    float _278 = fma(_272, _148, _170);
    float _280 = fma(_274, _148, _172);
    float _282 = fma(_276, _148, _174);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_53.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_92);
        float _308 = 1.0 / _306;
        float _310 = _126 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _316 = _312 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _334 = 1.0 / _320;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _336;
    float _340 = 1.0 / _324;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _344 = _312 + _342;
    bool _346 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _348 = isnan(_312);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_356;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _328;
    float _364 = _344 * _334;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _368 = _312 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _372 = _312 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _380 = 1.0 / _332;
    float _382 = _316 * _340;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _386 = _312 + _384;
    bool _388 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _390 = isnan(_312);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = fma(_376, _364, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _402 = 1.0 / _338;
    float _404 = _368 * _362;
    float _406 = _372 * _380;
    bool _408 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _410 = isnan(_312);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _420;
    float _424 = -_418;
    float _426 = _424 + 1.0;
    float _428 = fma(_422, _364, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _430 = _386 * _402;
    bool _432 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _434 = isnan(_312);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    bool _444 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _446 = isnan(_312);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _442 * _426;
    float _458 = -_442;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _462;
    float _466 = _454 * _360;
    float _468 = -_454;
    float _470 = _468 + 1.0;
    float _472 = _398 * _460;
    float _474 = -_398;
    float _476 = _474 + 1.0;
    float _478 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _480 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _482 = isnan(_312);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _496 = _356 * _476;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _502 = _490 * _470;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _508 = -_490;
    float _510 = _508 + 1.0;
    float _512 = fma(_494, _382, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _514 = _478 * _502;
    float _516 = _428 * _502;
    float _518 = _400 * _502;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _528;
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].x, _514);
    float _534 = fma(_500, _382, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _536 = fma(_506, _382, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _538 = fma(_522, _404, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _540 = fma(_526, _404, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _542 = fma(_530, _404, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _544 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].y, _516);
    float _546 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].z, _518);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _552 = fma(_512, _466, _532);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _558 = fma(_534, _466, _544);
    float _560 = fma(_550, _406, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _562 = fma(_538, _496, _552);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _568 = fma(_536, _466, _546);
    float _570 = fma(_556, _406, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _572 = fma(_540, _496, _558);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _578;
    float _582 = fma(_566, _406, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _584 = fma(_542, _496, _568);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _586;
    float _590 = fma(_560, _472, _562);
    float _592 = fma(_576, _430, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _594 = fma(_580, _430, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _596 = fma(_570, _472, _572);
    float _598 = fma(_588, _430, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _600 = fma(_582, _472, _584);
    float _602 = fma(_592, _456, _590);
    float _604 = fma(_594, _456, _596);
    float _606 = fma(_598, _456, _600);
    float _608 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].x, _602);
    float _610 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].y, _604);
    float _612 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].z, _606);
    bool _614 = !_378;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_92);
        float _638 = 1.0 / _636;
        float _640 = _126 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _646 = log2(_644);
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    bool _654 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(1.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _666 = 1.0 + _664;
    bool _668 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _676 = _672 || _674;
    float _678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _686 = _684 != 0;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _690 = _688 != 0;
    float _692 = _646 * _126;
    float _694 = 1.0 / _666;
    bool _696 = !_682;
    int _698 = _696 ? 0 : 1;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _710 = _708 != 0;
    bool _712 = !_690;
    int _714 = _712 ? 0 : 1;
    float _716 = exp2(_692);
    float _718 = _652 * 2.0;
    float _720 = _648 * 2.0;
    int _722 = abs(_714);
    float _724 = floor(_718);
    float _726 = -_716;
    float _728 = _726 + 1.0;
    float _730 = floor(_720);
    float _732 = _650 * 2.0;
    float _734 = _676 ? _728 : 0.0;
    bool _736 = _724 > 0.0;
    float _738 = floor(_732);
    if (_662)
    {
        float _740 = _734 * _694;
        _130 = _740;
    }
    float _742 = _130;
    float _744 = _650 + _652;
    bool _746 = _724 >= 0.0;
    bool _748 = isnan(_724);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    bool _756 = !_686;
    int _758 = _756 ? 0 : 1;
    float _760 = _744 + (-1.0);
    int _762 = _754 ? 0 : 1;
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _766 = _730 > 0.0;
    float _768 = _742 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _770 = _730 >= 0.0;
    bool _772 = isnan(_730);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _742 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _784 = _768 * _678;
    int _786 = ~_762;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = _650 + _648;
    int _794 = _790;
    if (!_736)
    {
        int _796 = ~_762;
        int _798 = _796 + 1;
        _794 = _798;
    }
    int _800 = _794;
    float _802 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[203].x, _784);
    int _804 = _778 ? 0 : 1;
    float _806 = _650 + (-0.5);
    bool _808 = _738 > 0.0;
    float _810 = floor(_802);
    bool _812 = _738 >= 0.0;
    bool _814 = isnan(_738);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    float _822 = _782 * _764;
    float _824 = _802 + 0.25;
    int _826 = ~_804;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    float _832 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[203].z, _822);
    int _834 = _830;
    if (!_766)
    {
        int _836 = ~_804;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = floor(_824);
    bool _844 = !_710;
    int _846 = _844 ? 0 : 1;
    float _848 = _832 + 0.25;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    float _862 = _792 + (-1.0);
    float _864 = in.m_55.x;
    float _866 = in.m_55.y;
    float _868 = in.m_55.z;
    float _870 = float(_840);
    bool _872 = !_856;
    int _874 = _872 ? 0 : 1;
    float _876 = floor(_832);
    bool _878 = !_852;
    int _880 = _878 ? 0 : 1;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _884 = abs(_874);
    int _886 = _820 ? 0 : 1;
    float _888 = float(_884);
    float _890 = floor(_848);
    int _892 = abs(_880);
    int _894 = ~_886;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = _888 * _870;
    float _902 = -_810;
    float _904 = _802 + _902;
    float _906 = float(_800);
    float _908 = _802 * 6.283185482025146484375;
    float _910 = _900 * (-2.0);
    int _912 = _898;
    if (!_808)
    {
        int _914 = ~_886;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = -_876;
    float _922 = _832 + _920;
    float _924 = float(_892);
    bool _926 = _904 >= 0.5;
    bool _928 = isnan(_904);
    bool _930 = _926 || _928;
    bool _932 = isnan(0.5);
    bool _934 = _930 || _932;
    float _936 = -_842;
    float _938 = _824 + _936;
    float _940 = fma(_910, _866, _866);
    float _942 = _924 * _906;
    bool _944 = _922 >= 0.5;
    bool _946 = isnan(_922);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.5);
    bool _952 = _948 || _950;
    float _954 = -_890;
    float _956 = _848 + _954;
    float _958 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].y, _940);
    float _960 = fma(_780, _910, _780);
    bool _962 = !_706;
    int _964 = _962 ? 0 : 1;
    float _966 = _908 * 0.15915493667125701904296875;
    int _968 = abs(_758);
    float _970 = _832 * 6.283185482025146484375;
    float _972 = fma(_960, _742, _958);
    int _974 = abs(_698);
    int _976 = abs(_964);
    float _978 = _966 * 6.283185482025146484375;
    float _980 = sin(_978);
    float _982 = float(_968);
    float _984 = _972 * 0.15915493667125701904296875;
    bool _986 = !_934;
    float _988 = _986 ? 0.5 : (-0.5);
    bool _990 = _938 > 0.5;
    bool _992 = !_952;
    float _994 = _992 ? 0.5 : (-0.5);
    float _996 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _998 = _996 * 2.0;
    float _1000 = float(_976);
    float _1002 = _984 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1014 = _1010 || _1012;
    float _1016 = _982 * _998;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1020 = _1018 * 2.0;
    float _1022 = _970 * 0.15915493667125701904296875;
    bool _1024 = !_702;
    int _1026 = _1024 ? 0 : 1;
    float _1028 = _1000 * _1020;
    float _1030 = float(_974);
    float _1032 = _980 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1034 = _938;
    float _1036 = _956;
    if (_990)
    {
        float _1038 = -_938;
        float _1040 = _1038 + 1.0;
        _1034 = _1040;
    }
    float _1042 = _1034;
    float _1044 = _1022 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    bool _1048 = _956 > 0.5;
    float _1050 = fma(_1030, _1032, _1016);
    float _1052 = fma(_1042, 4.0, -1.0);
    int _1054 = abs(_1026);
    float _1056 = float(_722);
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1060 = float(_1054);
    float _1062 = _984 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = fma(_1056, _1058, _1050);
    int _1068 = abs(_846);
    if (_1048)
    {
        float _1070 = -_956;
        float _1072 = _1070 + 1.0;
        _1036 = _1072;
    }
    float _1074 = _1036;
    bool _1076 = !_860;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = fma(_1066, 3.1415927410125732421875, _864);
    float _1084 = fma(_1074, 4.0, -1.0);
    int _1086 = abs(_1078);
    float _1088 = fma(_1060, _1080, _1028);
    float _1090 = float(_1068);
    float _1092 = _942 * (-2.0);
    float _1094 = float(_918);
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1098 = float(_1086);
    float _1100 = _648 + (-0.5);
    float _1102 = fma(_1082, _1092, _1082);
    float _1104 = fma(_1090, _1096, _1088);
    float _1106 = _652 + _648;
    float _1108 = _1098 * _1094;
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1102);
    float _1112 = fma(_1104, 3.1415927410125732421875, _868);
    float _1114 = _1106 + (-1.0);
    float _1116 = _1108 * (-2.0);
    float _1118 = fma(_882, _1092, _882);
    float _1120 = _652 + (-0.5);
    float _1122 = in.m_49.x;
    float _1124 = in.m_49.y;
    float _1126 = in.m_49.z;
    float _1128 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1130 = fma(_1112, _1116, _1112);
    float _1132 = fma(_1118, _742, _1110);
    float _1134 = in.m_57.x;
    float _1136 = in.m_57.y;
    float _1138 = in.m_57.z;
    float _1140 = fma(_1128, _1116, _1128);
    float _1142 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1130);
    float _1144 = _1132 * 0.15915493667125701904296875;
    float _1146 = fma(_1140, _742, _1142);
    float _1148 = _1144 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _1146 * 0.15915493667125701904296875;
    float _1154 = _1144 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1160 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1162 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1164 = _1152 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1170 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1136);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1138);
    float _1178 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1180 = _1168 * _1170;
    float _1182 = _1152 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    float _1186 = _1150 * _1064;
    float _1188 = _1150 * _1004;
    float _1190 = _1172 * _1174;
    float _1192 = _1156 * _1004;
    float _1194 = _1176 * _1178;
    float _1196 = _1156 * _1064;
    float _1198 = _1162;
    if (_1014)
    {
        _1198 = 1.0;
    }
    float _1200 = _1198;
    float _1202 = _1150 * _1166;
    float _1204 = _1064 * _1166;
    float _1206 = _1156 * _1166;
    float _1208 = _1004 * _1166;
    float _1210 = _1202 * _1190;
    float _1212 = _1206 * _1190;
    float _1214 = fma(_1184, _1186, _1192);
    float _1216 = fma(_1184, _1192, _1186);
    float _1218 = -_1190;
    float _1220 = _1184 * _1218;
    float _1222 = -_1188;
    float _1224 = fma(_1184, _1196, _1222);
    float _1226 = -_1196;
    float _1228 = fma(_1184, _1188, _1226);
    float _1230 = fma(_1214, _1180, _1210);
    float _1232 = fma(_1204, _1180, _1220);
    float _1234 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1236 = fma(_1224, _1180, _1212);
    float _1238 = fma(_1228, _1194, _1230);
    float _1240 = fma(_1208, _1194, _1232);
    float _1242 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1244 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1234);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1248 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1250 = fma(_1216, _1194, _1236);
    float _1252 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1242);
    float _1254 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1244);
    float _1256 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1258 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1246);
    float _1260 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1252);
    float _1262 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1264 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1256);
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1258);
    float _1268 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1248);
    float _1270 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1272 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1274 = _1262 + _1266;
    float _1276 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1268);
    float _1278 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1280 = _1270 + _1272;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1284 = _1274 + _1282;
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1288 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1278);
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1292 = _1280 + _1290;
    float _1294 = _1284 * _1284;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1298 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1288);
    float _1300 = fma(_1292, _1292, _1294);
    float _1302 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1296);
    float _1304 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1306 = _1286 + _1298;
    float _1308 = sqrt(_1300);
    float _1310 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1302);
    float _1312 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1314 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1316 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1312);
    float _1318 = 1.0 / _1314;
    float _1320 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1322 = _1320 + _1314;
    bool _1324 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1322 * _1318;
    float _1328 = _1326 * 0.5;
    float _1330 = _1322;
    float _1332 = _1270;
    float _1334 = _1314;
    float _1336 = _1328;
    float _1338 = _1200;
    if (!_1324)
    {
        _1330 = _1280;
    }
    float _1340 = _1330;
    float _1342 = _1340;
    if (!_1324)
    {
        _1332 = _1274;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (!_1324)
    {
        _1334 = _1306;
    }
    float _1348 = _1334;
    bool _1350 = !_1324;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1308 + _1356;
        float _1360 = rsqrt(_1300);
        float _1362 = _1358 * _1354;
        float _1364 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1382 = fma(_1306, _1370, _1378);
        float _1384 = _1360 * _1380;
        float _1386 = fma(_1292, _1384, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1284, _1384, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1382;
        _1342 = _1386;
        _1346 = _1388;
    }
    float _1390 = _1352;
    float _1392 = _1342;
    float _1394 = _1346;
    if (!_1014)
    {
        float _1396 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1398 = _1396 * 0.15915493667125701904296875;
        float _1400 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1404 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1402);
        float _1406 = _1398 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1400 * 0.15915493667125701904296875;
        float _1412 = _1398 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = 1.0 / _1408;
        float _1418 = _1410 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1414 * _1416;
        float _1424 = _1410 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = _1420 * _1422;
        float _1430 = 1.0 / _1404;
        float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1434 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1432;
        float _1436 = 1.0 / _1428;
        float _1438 = 1.0 / _1434;
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1442 = _1430 * _1440;
        float _1444 = _1426 * _1436;
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = fma(_1444, _1442, _1446);
        float _1450 = _1448 * _1438;
        float _1452 = precise::clamp(_1450, 0.0, 1.0);
        _1336 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1338 = _1452;
    }
    float _1454 = _1336;
    float _1456 = _1338;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1460 = _1390 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1464 = _1392 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1468 = _1394 + _1466;
    float _1470 = _1460 * _1460;
    float _1472 = fma(_1464, _1464, _1470);
    float _1474 = fma(_1468, _1468, _1472);
    float _1476 = rsqrt(_1474);
    float _1478 = sqrt(_1474);
    float _1480 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1482 = _1464 * _1480;
    float _1484 = _1468 * _1480;
    float _1486 = _1482 * _1482;
    float _1488 = _1484 * _1484;
    float _1490 = _1486 + _1488;
    float _1492 = sqrt(_1490);
    bool _1494 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = _1492 + _1496;
    float _1500 = _1468;
    float _1502 = _1490;
    float _1504 = _1498;
    float _1506 = _1470;
    float _1508 = _1480;
    if (_1494)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1510;
    }
    float _1512 = _1500;
    if (_1494)
    {
        float _1514 = rsqrt(_1490);
        _1502 = _1514;
    }
    float _1516 = _1502;
    float _1518 = _1516;
    if (_1494)
    {
        float _1520 = _1498 * _1512;
        _1504 = _1520;
    }
    float _1522 = _1504;
    if (_1494)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _1506 = _1524;
    }
    float _1526 = _1506;
    float _1528 = _1512;
    float _1530 = _1526;
    if (_1494)
    {
        float _1532 = _1526 * 6.283185482025146484375;
        float _1534 = sin(_1532);
        _1528 = _1534;
    }
    float _1536 = _1528;
    float _1538 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1540 = precise::max(0.0, _1538);
    float _1542 = _1454;
    float _1544 = _1540;
    if (_1494)
    {
        float _1546 = _1526 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = -_1480;
    float _1554 = -_1540;
    float _1556 = fma(_1460, _1552, _1554);
    float _1558 = _1556;
    if (_1494)
    {
        float _1560 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1560;
    }
    float _1562 = _1544;
    float _1564 = _1536;
    float _1566 = _1562;
    if (_1494)
    {
        float _1568 = fma(_1536, _1562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1564 = _1568;
    }
    float _1570 = _1564;
    float _1572 = _1570;
    float _1574 = _1550;
    if (_1494)
    {
        float _1576 = _1550 + (-1.0);
        _1566 = _1576;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (_1494)
    {
        float _1582 = _1516 * _1570;
        _1508 = _1582;
    }
    float _1584 = _1508;
    if (!_1494)
    {
        _1572 = _1482;
    }
    float _1586 = _1572;
    float _1588 = _1586;
    if (_1494)
    {
        float _1590 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1590;
    }
    float _1592 = _1530;
    if (_1494)
    {
        float _1594 = _1482 * _1584;
        _1588 = _1594;
    }
    float _1596 = _1588;
    if (!_1494)
    {
        _1580 = _1484;
    }
    float _1598 = _1580;
    float _1600 = _1598;
    if (_1494)
    {
        float _1602 = _1484 * _1584;
        _1600 = _1602;
    }
    float _1604 = _1600;
    if (!_1494)
    {
        _1518 = _1486;
    }
    float _1606 = _1518;
    float _1608 = _1606;
    if (_1494)
    {
        float _1610 = fma(_1556, _1550, _1592);
        _1558 = _1610;
    }
    float _1612 = _1558;
    if (_1494)
    {
        float _1614 = _1596 * _1596;
        _1608 = _1614;
    }
    float _1616 = _1608;
    if (!_1494)
    {
        _1574 = _1488;
    }
    float _1618 = _1574;
    float _1620 = _1618;
    if (_1494)
    {
        float _1622 = _1604 * _1604;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1628 = fma(_1612, _1612, _1616);
    float _1630 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1632 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1626);
    float _1634 = _1628 + _1624;
    float _1636 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1640 = fma(_1478, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1638);
    float _1642 = precise::clamp(_1640, 0.0, 1.0);
    float _1644 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1632);
    float _1646 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1648 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1636);
    float _1650 = rsqrt(_1634);
    float _1652 = -_1642;
    float _1654 = _1652 + 1.0;
    float _1656 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1646);
    float _1658 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1648);
    float _1660 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1664 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1656);
    float _1666 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1668 = abs(_1654);
    float _1670 = log2(_1668);
    float _1672 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1674 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1678 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1682 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1676);
    float _1684 = _1650 * _1596;
    float _1686 = _1650 * _1612;
    float _1688 = _1650 * _1604;
    float _1690 = -_1678;
    float _1692 = fma(_1690, _1630, 1.0);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1696 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1698 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1682);
    float _1700 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1702 = -_1694;
    float _1704 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1698);
    float _1710 = log2(_1692);
    float _1712 = -_1688;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1716 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1718 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1700);
    float _1720 = _1686 + 1.0;
    float _1722 = fma(_1714, -0.5, 0.5);
    float _1724 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1716);
    float _1726 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1718);
    float _1728 = 1.0 / _1708;
    float _1730 = exp2(_1706);
    float _1732 = _1710 * 0.693147182464599609375;
    float _1734 = sqrt(_1722);
    float _1736 = fma(_1714, 0.5, 0.5);
    float _1738 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1740 = fma(_1736, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1746 = -_1686;
    float _1748 = fma(_1730, _1720, _1746);
    float _1750 = fma(_1736, _1740, -0.212114393711090087890625);
    float _1752 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1726);
    float _1754 = _1742 * _1728;
    float _1756 = fma(_1736, _1750, 1.570728778839111328125);
    float _1758 = _1752 * _1728;
    float _1760 = fma(_1754, 0.5, 0.5);
    float _1762 = _1734 * 0.636619746685028076171875;
    float _1764 = fma(_1748, 0.5, 0.5);
    float _1766 = fma(_1758, -0.5, 0.5);
    float _1768 = -_1756;
    float _1770 = fma(_1762, _1768, 1.0);
    float3 _4737 = float3(_1760, _1766, _1744);
    float _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4737, float3(0.0), isnan(_4737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4737, float3(0.0), isnan(_4737)), level(0.0)).x;
    float3 _4748 = float3(_1760, _1766, _1744);
    float4 _1775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4748, float3(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4748, float3(0.0), isnan(_4748)), level(0.0)).xyzw;
    float _1777 = _1775.x;
    float _1779 = _1775.y;
    float _1781 = _1775.z;
    float _1783 = _1775.w;
    float2 _4765 = float2(_1770, _1764);
    float3 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4765, float2(0.0), isnan(_4765)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4765, float2(0.0), isnan(_4765)), level(0.0)).xyz;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_59.x = _1392;
    out.m_59.y = _1390;
    out.m_59.z = _1394;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1801 = _1136 != 0.0;
    bool _1803 = isnan(_1136);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan(0.0);
    bool _1809 = _1805 || _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1817 = _642 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1823 = 1.0 / _1799;
    bool _1825 = _1134 == 0.0;
    bool _1827 = !_1809;
    bool _1829 = _1825 && _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1835 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1837 = isnan(_642);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    bool _1847 = _1138 == 0.0;
    bool _1849 = _1847 && _1829;
    bool _1851 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1853 = isnan(_642);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = 1.0 / _1821;
    float _1865 = -_1845;
    float _1867 = _1865 + 1.0;
    float _1869 = _1813 * _1823;
    float _1871 = 1.0 / _1833;
    float _1873 = fma(_1869, _1817, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1875 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1877 = isnan(_642);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1883 = _1879 || _1881;
    float _1885 = float(_1883);
    float _1887 = in.m_61.x;
    float _1889 = in.m_61.y;
    float _1891 = in.m_61.z;
    float _1893 = exp2(_1795);
    float _1895 = _1885 * _1867;
    float _1897 = -_1885;
    float _1899 = _1897 + 1.0;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1905;
    float _1909 = _1861 * _1899;
    float _1911 = _1903 * _1863;
    bool _1913 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1915 = isnan(_642);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1861;
    float _1927 = _1925 + 1.0;
    float _1929 = _1873 * _1909;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1933 = _642 + _1931;
    float _1935 = _1907 * _1871;
    float _1937 = -_1923;
    float _1939 = _1937 + 1.0;
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1943 = _642 + _1941;
    float _1945 = fma(_1911, _1933, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1947 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1929);
    float _1949 = _1845 * _1939;
    float _1951 = fma(_1935, _1943, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1953 = -_1893;
    float _1955 = _1953 + 1.0;
    float _1957 = fma(_1945, _1895, _1947);
    float _1959 = _1889;
    float _1961 = _1887;
    float _1963 = _1891;
    if (!_1849)
    {
        float _1965 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1889);
        _1959 = _1965;
    }
    float _1967 = _1959;
    if (!_1849)
    {
        float _1969 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1961 = _1969;
    }
    float _1971 = _1961;
    if (!_1849)
    {
        float _1973 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1891);
        _1963 = _1973;
    }
    float _1975 = _1963;
    float _1977 = fma(_1951, _1949, _1957);
    float _1979 = _1202 * _1967;
    float _1981 = -_1967;
    float _1983 = _1184 * _1981;
    float _1985 = _1206 * _1967;
    float _1987 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1989 = fma(_1214, _1971, _1979);
    float _1991 = fma(_1204, _1971, _1983);
    float _1993 = fma(_1224, _1971, _1985);
    float _1995 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1977);
    float _1997 = fma(_1228, _1975, _1989);
    float _1999 = fma(_1208, _1975, _1991);
    float _2001 = in.m_63.w;
    float _2003 = fma(_1216, _1975, _1993);
    float _2005 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2007 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1987);
    float _2009 = _608 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2011 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2013 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2005);
    float _2015 = _610 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2017 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2019 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2021 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2023 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2029 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2031 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2033 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2019);
    bool _2035 = _1456 > 0.0;
    bool _2037 = isnan(_1456);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2029);
    out.m_65.x = _2021;
    out.m_65.y = _2023;
    out.m_65.z = _2025;
    out.m_65.w = _2027;
    float _2047 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2031);
    float _2049 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2051 = _2033 + _1708;
    float _2053 = _1742 + _1708;
    float _2055 = _1708 * 0.5;
    float _2057 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2013);
    float _2059 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2045);
    float _2061 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2047);
    float _2063 = _2051 * 0.5;
    float _2065 = _2053 * 0.5;
    float _2067 = fma(_1752, -0.5, _2055);
    out.m_67.w = _2001;
    float _2069 = _2049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2057;
    out.m_69.y = _2059;
    out.m_69.z = _2061;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _2033;
    out.gl_Position.w = _1708;
    out.m_71.x = _2065;
    out.m_71.y = _2067;
    out.m_71.z = _2063;
    out.m_71.w = _1708;
    out.m_45.x = _2069;
    float _2071 = _2017 * _1772;
    float _2073 = -_2017;
    float _2075 = _2073 + 1.0;
    float _2077 = _1783 * _2071;
    float _2079 = _1793 * _2071;
    float _2081 = _1783 * _2075;
    float _2083 = fma(_1789, _2077, _1777);
    float _2085 = fma(_1791, _2077, _1779);
    float _2087 = fma(_1783, _2079, _1781);
    out.m_73.x = _2083;
    out.m_73.y = _2085;
    out.m_73.z = _2087;
    out.m_73.w = _2081;
    if (_2043)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2089;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _634 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2146 = as_type<float>(_108);
        out.gl_Position.z = _2146;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2215 = as_type<float>(_146);
        out.gl_Position.z = _2215;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_49.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = 0.0;
    float _188 = _150;
    if (!_160)
    {
        float _190 = _150 * _150;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = _194;
    if (!_160)
    {
        float _200 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_160;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _150 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _150);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_160;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _150 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _188 = _260;
    }
    float _262 = _188;
    out.m_51.x = _178;
    out.m_51.y = _184;
    out.m_51.z = _196;
    out.m_51.w = _182;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _162, _266);
    float _274 = fma(_262, _164, _268);
    float _276 = fma(_262, _166, _270);
    float _278 = fma(_272, _148, _170);
    float _280 = fma(_274, _148, _172);
    float _282 = fma(_276, _148, _174);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_53.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_92);
        float _308 = 1.0 / _306;
        float _310 = _126 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _316 = _312 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _334 = 1.0 / _320;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _336;
    float _340 = 1.0 / _324;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _344 = _312 + _342;
    bool _346 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _348 = isnan(_312);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_356;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _328;
    float _364 = _344 * _334;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _368 = _312 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _372 = _312 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _380 = 1.0 / _332;
    float _382 = _316 * _340;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _386 = _312 + _384;
    bool _388 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _390 = isnan(_312);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = fma(_376, _364, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _402 = 1.0 / _338;
    float _404 = _368 * _362;
    float _406 = _372 * _380;
    bool _408 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _410 = isnan(_312);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _420;
    float _424 = -_418;
    float _426 = _424 + 1.0;
    float _428 = fma(_422, _364, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _430 = _386 * _402;
    bool _432 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _434 = isnan(_312);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    bool _444 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _446 = isnan(_312);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _442 * _426;
    float _458 = -_442;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _462;
    float _466 = _454 * _360;
    float _468 = -_454;
    float _470 = _468 + 1.0;
    float _472 = _398 * _460;
    float _474 = -_398;
    float _476 = _474 + 1.0;
    float _478 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _480 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _482 = isnan(_312);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _496 = _356 * _476;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _502 = _490 * _470;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _508 = -_490;
    float _510 = _508 + 1.0;
    float _512 = fma(_494, _382, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _514 = _478 * _502;
    float _516 = _428 * _502;
    float _518 = _400 * _502;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _528;
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].x, _514);
    float _534 = fma(_500, _382, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _536 = fma(_506, _382, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _538 = fma(_522, _404, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _540 = fma(_526, _404, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _542 = fma(_530, _404, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _544 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].y, _516);
    float _546 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].z, _518);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _552 = fma(_512, _466, _532);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _558 = fma(_534, _466, _544);
    float _560 = fma(_550, _406, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _562 = fma(_538, _496, _552);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _568 = fma(_536, _466, _546);
    float _570 = fma(_556, _406, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _572 = fma(_540, _496, _558);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _578;
    float _582 = fma(_566, _406, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _584 = fma(_542, _496, _568);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _586;
    float _590 = fma(_560, _472, _562);
    float _592 = fma(_576, _430, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _594 = fma(_580, _430, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _596 = fma(_570, _472, _572);
    float _598 = fma(_588, _430, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _600 = fma(_582, _472, _584);
    float _602 = fma(_592, _456, _590);
    float _604 = fma(_594, _456, _596);
    float _606 = fma(_598, _456, _600);
    float _608 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].x, _602);
    float _610 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].y, _604);
    float _612 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].z, _606);
    bool _614 = !_378;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_92);
        float _638 = 1.0 / _636;
        float _640 = _126 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _646 = log2(_644);
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    bool _654 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(1.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _666 = 1.0 + _664;
    bool _668 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _676 = _672 || _674;
    float _678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _686 = _684 != 0;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _690 = _688 != 0;
    float _692 = _646 * _126;
    float _694 = 1.0 / _666;
    bool _696 = !_682;
    int _698 = _696 ? 0 : 1;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _710 = _708 != 0;
    bool _712 = !_690;
    int _714 = _712 ? 0 : 1;
    float _716 = exp2(_692);
    float _718 = _652 * 2.0;
    float _720 = _648 * 2.0;
    int _722 = abs(_714);
    float _724 = floor(_718);
    float _726 = -_716;
    float _728 = _726 + 1.0;
    float _730 = floor(_720);
    float _732 = _650 * 2.0;
    float _734 = _676 ? _728 : 0.0;
    bool _736 = _724 > 0.0;
    float _738 = floor(_732);
    if (_662)
    {
        float _740 = _734 * _694;
        _130 = _740;
    }
    float _742 = _130;
    float _744 = _650 + _652;
    bool _746 = _724 >= 0.0;
    bool _748 = isnan(_724);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    bool _756 = !_686;
    int _758 = _756 ? 0 : 1;
    float _760 = _744 + (-1.0);
    int _762 = _754 ? 0 : 1;
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _766 = _730 > 0.0;
    float _768 = _742 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _770 = _730 >= 0.0;
    bool _772 = isnan(_730);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _742 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _784 = _768 * _678;
    int _786 = ~_762;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = _650 + _648;
    int _794 = _790;
    if (!_736)
    {
        int _796 = ~_762;
        int _798 = _796 + 1;
        _794 = _798;
    }
    int _800 = _794;
    float _802 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[203].x, _784);
    int _804 = _778 ? 0 : 1;
    float _806 = _650 + (-0.5);
    bool _808 = _738 > 0.0;
    float _810 = floor(_802);
    bool _812 = _738 >= 0.0;
    bool _814 = isnan(_738);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    float _822 = _782 * _764;
    float _824 = _802 + 0.25;
    int _826 = ~_804;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    float _832 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[203].z, _822);
    int _834 = _830;
    if (!_766)
    {
        int _836 = ~_804;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = floor(_824);
    bool _844 = !_710;
    int _846 = _844 ? 0 : 1;
    float _848 = _832 + 0.25;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    float _862 = _792 + (-1.0);
    float _864 = in.m_55.x;
    float _866 = in.m_55.y;
    float _868 = in.m_55.z;
    float _870 = float(_840);
    bool _872 = !_856;
    int _874 = _872 ? 0 : 1;
    float _876 = floor(_832);
    bool _878 = !_852;
    int _880 = _878 ? 0 : 1;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _884 = abs(_874);
    int _886 = _820 ? 0 : 1;
    float _888 = float(_884);
    float _890 = floor(_848);
    int _892 = abs(_880);
    int _894 = ~_886;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = _888 * _870;
    float _902 = -_810;
    float _904 = _802 + _902;
    float _906 = float(_800);
    float _908 = _802 * 6.283185482025146484375;
    float _910 = _900 * (-2.0);
    int _912 = _898;
    if (!_808)
    {
        int _914 = ~_886;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = -_876;
    float _922 = _832 + _920;
    float _924 = float(_892);
    bool _926 = _904 >= 0.5;
    bool _928 = isnan(_904);
    bool _930 = _926 || _928;
    bool _932 = isnan(0.5);
    bool _934 = _930 || _932;
    float _936 = -_842;
    float _938 = _824 + _936;
    float _940 = fma(_910, _866, _866);
    float _942 = _924 * _906;
    bool _944 = _922 >= 0.5;
    bool _946 = isnan(_922);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.5);
    bool _952 = _948 || _950;
    float _954 = -_890;
    float _956 = _848 + _954;
    float _958 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].y, _940);
    float _960 = fma(_780, _910, _780);
    bool _962 = !_706;
    int _964 = _962 ? 0 : 1;
    float _966 = _908 * 0.15915493667125701904296875;
    int _968 = abs(_758);
    float _970 = _832 * 6.283185482025146484375;
    float _972 = fma(_960, _742, _958);
    int _974 = abs(_698);
    int _976 = abs(_964);
    float _978 = _966 * 6.283185482025146484375;
    float _980 = sin(_978);
    float _982 = float(_968);
    float _984 = _972 * 0.15915493667125701904296875;
    bool _986 = !_934;
    float _988 = _986 ? 0.5 : (-0.5);
    bool _990 = _938 > 0.5;
    bool _992 = !_952;
    float _994 = _992 ? 0.5 : (-0.5);
    float _996 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _998 = _996 * 2.0;
    float _1000 = float(_976);
    float _1002 = _984 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1014 = _1010 || _1012;
    float _1016 = _982 * _998;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1020 = _1018 * 2.0;
    float _1022 = _970 * 0.15915493667125701904296875;
    bool _1024 = !_702;
    int _1026 = _1024 ? 0 : 1;
    float _1028 = _1000 * _1020;
    float _1030 = float(_974);
    float _1032 = _980 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1034 = _938;
    float _1036 = _956;
    if (_990)
    {
        float _1038 = -_938;
        float _1040 = _1038 + 1.0;
        _1034 = _1040;
    }
    float _1042 = _1034;
    float _1044 = _1022 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    bool _1048 = _956 > 0.5;
    float _1050 = fma(_1030, _1032, _1016);
    float _1052 = fma(_1042, 4.0, -1.0);
    int _1054 = abs(_1026);
    float _1056 = float(_722);
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1060 = float(_1054);
    float _1062 = _984 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = fma(_1056, _1058, _1050);
    int _1068 = abs(_846);
    if (_1048)
    {
        float _1070 = -_956;
        float _1072 = _1070 + 1.0;
        _1036 = _1072;
    }
    float _1074 = _1036;
    bool _1076 = !_860;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = fma(_1066, 3.1415927410125732421875, _864);
    float _1084 = fma(_1074, 4.0, -1.0);
    int _1086 = abs(_1078);
    float _1088 = fma(_1060, _1080, _1028);
    float _1090 = float(_1068);
    float _1092 = _942 * (-2.0);
    float _1094 = float(_918);
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1098 = float(_1086);
    float _1100 = _648 + (-0.5);
    float _1102 = fma(_1082, _1092, _1082);
    float _1104 = fma(_1090, _1096, _1088);
    float _1106 = _652 + _648;
    float _1108 = _1098 * _1094;
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1102);
    float _1112 = fma(_1104, 3.1415927410125732421875, _868);
    float _1114 = _1106 + (-1.0);
    float _1116 = _1108 * (-2.0);
    float _1118 = fma(_882, _1092, _882);
    float _1120 = _652 + (-0.5);
    float _1122 = in.m_49.x;
    float _1124 = in.m_49.y;
    float _1126 = in.m_49.z;
    float _1128 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1130 = fma(_1112, _1116, _1112);
    float _1132 = fma(_1118, _742, _1110);
    float _1134 = in.m_57.x;
    float _1136 = in.m_57.y;
    float _1138 = in.m_57.z;
    float _1140 = fma(_1128, _1116, _1128);
    float _1142 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1130);
    float _1144 = _1132 * 0.15915493667125701904296875;
    float _1146 = fma(_1140, _742, _1142);
    float _1148 = _1144 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _1146 * 0.15915493667125701904296875;
    float _1154 = _1144 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1160 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1162 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1164 = _1152 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1170 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1136);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1138);
    float _1178 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1180 = _1168 * _1170;
    float _1182 = _1152 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    float _1186 = _1150 * _1064;
    float _1188 = _1150 * _1004;
    float _1190 = _1172 * _1174;
    float _1192 = _1156 * _1004;
    float _1194 = _1176 * _1178;
    float _1196 = _1156 * _1064;
    float _1198 = _1162;
    if (_1014)
    {
        _1198 = 1.0;
    }
    float _1200 = _1198;
    float _1202 = _1150 * _1166;
    float _1204 = _1064 * _1166;
    float _1206 = _1156 * _1166;
    float _1208 = _1004 * _1166;
    float _1210 = _1202 * _1190;
    float _1212 = _1206 * _1190;
    float _1214 = fma(_1184, _1186, _1192);
    float _1216 = fma(_1184, _1192, _1186);
    float _1218 = -_1190;
    float _1220 = _1184 * _1218;
    float _1222 = -_1188;
    float _1224 = fma(_1184, _1196, _1222);
    float _1226 = -_1196;
    float _1228 = fma(_1184, _1188, _1226);
    float _1230 = fma(_1214, _1180, _1210);
    float _1232 = fma(_1204, _1180, _1220);
    float _1234 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1236 = fma(_1224, _1180, _1212);
    float _1238 = fma(_1228, _1194, _1230);
    float _1240 = fma(_1208, _1194, _1232);
    float _1242 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1244 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1234);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1248 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1250 = fma(_1216, _1194, _1236);
    float _1252 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1242);
    float _1254 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1244);
    float _1256 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1258 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1246);
    float _1260 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1252);
    float _1262 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1264 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1256);
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1258);
    float _1268 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1248);
    float _1270 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1272 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1274 = _1262 + _1266;
    float _1276 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1268);
    float _1278 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1280 = _1270 + _1272;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1284 = _1274 + _1282;
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1288 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1278);
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1292 = _1280 + _1290;
    float _1294 = _1284 * _1284;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1298 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1288);
    float _1300 = fma(_1292, _1292, _1294);
    float _1302 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1296);
    float _1304 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1306 = _1286 + _1298;
    float _1308 = sqrt(_1300);
    float _1310 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1302);
    float _1312 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1314 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1316 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1312);
    float _1318 = 1.0 / _1314;
    float _1320 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1322 = _1320 + _1314;
    bool _1324 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1322 * _1318;
    float _1328 = _1326 * 0.5;
    float _1330 = _1322;
    float _1332 = _1270;
    float _1334 = _1314;
    float _1336 = _1328;
    float _1338 = _1200;
    if (!_1324)
    {
        _1330 = _1280;
    }
    float _1340 = _1330;
    float _1342 = _1340;
    if (!_1324)
    {
        _1332 = _1274;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (!_1324)
    {
        _1334 = _1306;
    }
    float _1348 = _1334;
    bool _1350 = !_1324;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1308 + _1356;
        float _1360 = rsqrt(_1300);
        float _1362 = _1358 * _1354;
        float _1364 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1382 = fma(_1306, _1370, _1378);
        float _1384 = _1360 * _1380;
        float _1386 = fma(_1292, _1384, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1284, _1384, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1382;
        _1342 = _1386;
        _1346 = _1388;
    }
    float _1390 = _1352;
    float _1392 = _1342;
    float _1394 = _1346;
    if (!_1014)
    {
        float _1396 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1398 = _1396 * 0.15915493667125701904296875;
        float _1400 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1404 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1402);
        float _1406 = _1398 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1400 * 0.15915493667125701904296875;
        float _1412 = _1398 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = 1.0 / _1408;
        float _1418 = _1410 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1414 * _1416;
        float _1424 = _1410 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = _1420 * _1422;
        float _1430 = 1.0 / _1404;
        float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1434 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1432;
        float _1436 = 1.0 / _1428;
        float _1438 = 1.0 / _1434;
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1442 = _1430 * _1440;
        float _1444 = _1426 * _1436;
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = fma(_1444, _1442, _1446);
        float _1450 = _1448 * _1438;
        float _1452 = precise::clamp(_1450, 0.0, 1.0);
        _1336 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1338 = _1452;
    }
    float _1454 = _1336;
    float _1456 = _1338;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1460 = _1390 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1464 = _1392 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1468 = _1394 + _1466;
    float _1470 = _1460 * _1460;
    float _1472 = fma(_1464, _1464, _1470);
    float _1474 = fma(_1468, _1468, _1472);
    float _1476 = rsqrt(_1474);
    float _1478 = sqrt(_1474);
    float _1480 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1482 = _1464 * _1480;
    float _1484 = _1468 * _1480;
    float _1486 = _1482 * _1482;
    float _1488 = _1484 * _1484;
    float _1490 = _1486 + _1488;
    float _1492 = sqrt(_1490);
    bool _1494 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = _1492 + _1496;
    float _1500 = _1468;
    float _1502 = _1490;
    float _1504 = _1498;
    float _1506 = _1470;
    float _1508 = _1480;
    if (_1494)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1510;
    }
    float _1512 = _1500;
    if (_1494)
    {
        float _1514 = rsqrt(_1490);
        _1502 = _1514;
    }
    float _1516 = _1502;
    float _1518 = _1516;
    if (_1494)
    {
        float _1520 = _1498 * _1512;
        _1504 = _1520;
    }
    float _1522 = _1504;
    if (_1494)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _1506 = _1524;
    }
    float _1526 = _1506;
    float _1528 = _1512;
    float _1530 = _1526;
    if (_1494)
    {
        float _1532 = _1526 * 6.283185482025146484375;
        float _1534 = sin(_1532);
        _1528 = _1534;
    }
    float _1536 = _1528;
    float _1538 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1540 = precise::max(0.0, _1538);
    float _1542 = _1454;
    float _1544 = _1540;
    if (_1494)
    {
        float _1546 = _1526 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = -_1480;
    float _1554 = -_1540;
    float _1556 = fma(_1460, _1552, _1554);
    float _1558 = _1556;
    if (_1494)
    {
        float _1560 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1560;
    }
    float _1562 = _1544;
    float _1564 = _1536;
    float _1566 = _1562;
    if (_1494)
    {
        float _1568 = fma(_1536, _1562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1564 = _1568;
    }
    float _1570 = _1564;
    float _1572 = _1570;
    float _1574 = _1550;
    if (_1494)
    {
        float _1576 = _1550 + (-1.0);
        _1566 = _1576;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (_1494)
    {
        float _1582 = _1516 * _1570;
        _1508 = _1582;
    }
    float _1584 = _1508;
    if (!_1494)
    {
        _1572 = _1482;
    }
    float _1586 = _1572;
    float _1588 = _1586;
    if (_1494)
    {
        float _1590 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1590;
    }
    float _1592 = _1530;
    if (_1494)
    {
        float _1594 = _1482 * _1584;
        _1588 = _1594;
    }
    float _1596 = _1588;
    if (!_1494)
    {
        _1580 = _1484;
    }
    float _1598 = _1580;
    float _1600 = _1598;
    if (_1494)
    {
        float _1602 = _1484 * _1584;
        _1600 = _1602;
    }
    float _1604 = _1600;
    if (!_1494)
    {
        _1518 = _1486;
    }
    float _1606 = _1518;
    float _1608 = _1606;
    if (_1494)
    {
        float _1610 = fma(_1556, _1550, _1592);
        _1558 = _1610;
    }
    float _1612 = _1558;
    if (_1494)
    {
        float _1614 = _1596 * _1596;
        _1608 = _1614;
    }
    float _1616 = _1608;
    if (!_1494)
    {
        _1574 = _1488;
    }
    float _1618 = _1574;
    float _1620 = _1618;
    if (_1494)
    {
        float _1622 = _1604 * _1604;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1628 = fma(_1612, _1612, _1616);
    float _1630 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1632 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1626);
    float _1634 = _1628 + _1624;
    float _1636 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1640 = fma(_1478, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1638);
    float _1642 = precise::clamp(_1640, 0.0, 1.0);
    float _1644 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1632);
    float _1646 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1648 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1636);
    float _1650 = rsqrt(_1634);
    float _1652 = -_1642;
    float _1654 = _1652 + 1.0;
    float _1656 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1646);
    float _1658 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1648);
    float _1660 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1664 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1656);
    float _1666 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1668 = abs(_1654);
    float _1670 = log2(_1668);
    float _1672 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1674 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1678 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1682 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1676);
    float _1684 = _1650 * _1596;
    float _1686 = _1650 * _1612;
    float _1688 = _1650 * _1604;
    float _1690 = -_1678;
    float _1692 = fma(_1690, _1630, 1.0);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1696 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1698 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1682);
    float _1700 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1702 = -_1694;
    float _1704 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1698);
    float _1710 = log2(_1692);
    float _1712 = -_1688;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1716 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1718 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1700);
    float _1720 = _1686 + 1.0;
    float _1722 = fma(_1714, -0.5, 0.5);
    float _1724 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1716);
    float _1726 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1718);
    float _1728 = 1.0 / _1708;
    float _1730 = exp2(_1706);
    float _1732 = _1710 * 0.693147182464599609375;
    float _1734 = sqrt(_1722);
    float _1736 = fma(_1714, 0.5, 0.5);
    float _1738 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1740 = fma(_1736, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1746 = -_1686;
    float _1748 = fma(_1730, _1720, _1746);
    float _1750 = fma(_1736, _1740, -0.212114393711090087890625);
    float _1752 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1726);
    float _1754 = _1742 * _1728;
    float _1756 = fma(_1736, _1750, 1.570728778839111328125);
    float _1758 = _1752 * _1728;
    float _1760 = fma(_1754, 0.5, 0.5);
    float _1762 = _1734 * 0.636619746685028076171875;
    float _1764 = fma(_1748, 0.5, 0.5);
    float _1766 = fma(_1758, -0.5, 0.5);
    float _1768 = -_1756;
    float _1770 = fma(_1762, _1768, 1.0);
    float3 _4737 = float3(_1760, _1766, _1744);
    float _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4737, float3(0.0), isnan(_4737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4737, float3(0.0), isnan(_4737)), level(0.0)).x;
    float3 _4748 = float3(_1760, _1766, _1744);
    float4 _1775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4748, float3(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4748, float3(0.0), isnan(_4748)), level(0.0)).xyzw;
    float _1777 = _1775.x;
    float _1779 = _1775.y;
    float _1781 = _1775.z;
    float _1783 = _1775.w;
    float2 _4765 = float2(_1770, _1764);
    float3 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4765, float2(0.0), isnan(_4765)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4765, float2(0.0), isnan(_4765)), level(0.0)).xyz;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_59.x = _1392;
    out.m_59.y = _1390;
    out.m_59.z = _1394;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1801 = _1136 != 0.0;
    bool _1803 = isnan(_1136);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan(0.0);
    bool _1809 = _1805 || _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1817 = _642 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1823 = 1.0 / _1799;
    bool _1825 = _1134 == 0.0;
    bool _1827 = !_1809;
    bool _1829 = _1825 && _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1835 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1837 = isnan(_642);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    bool _1847 = _1138 == 0.0;
    bool _1849 = _1847 && _1829;
    bool _1851 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1853 = isnan(_642);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = 1.0 / _1821;
    float _1865 = -_1845;
    float _1867 = _1865 + 1.0;
    float _1869 = _1813 * _1823;
    float _1871 = 1.0 / _1833;
    float _1873 = fma(_1869, _1817, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1875 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1877 = isnan(_642);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1883 = _1879 || _1881;
    float _1885 = float(_1883);
    float _1887 = in.m_61.x;
    float _1889 = in.m_61.y;
    float _1891 = in.m_61.z;
    float _1893 = exp2(_1795);
    float _1895 = _1885 * _1867;
    float _1897 = -_1885;
    float _1899 = _1897 + 1.0;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1905;
    float _1909 = _1861 * _1899;
    float _1911 = _1903 * _1863;
    bool _1913 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1915 = isnan(_642);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1861;
    float _1927 = _1925 + 1.0;
    float _1929 = _1873 * _1909;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1933 = _642 + _1931;
    float _1935 = _1907 * _1871;
    float _1937 = -_1923;
    float _1939 = _1937 + 1.0;
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1943 = _642 + _1941;
    float _1945 = fma(_1911, _1933, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1947 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1929);
    float _1949 = _1845 * _1939;
    float _1951 = fma(_1935, _1943, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1953 = -_1893;
    float _1955 = _1953 + 1.0;
    float _1957 = fma(_1945, _1895, _1947);
    float _1959 = _1889;
    float _1961 = _1887;
    float _1963 = _1891;
    if (!_1849)
    {
        float _1965 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1889);
        _1959 = _1965;
    }
    float _1967 = _1959;
    if (!_1849)
    {
        float _1969 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1961 = _1969;
    }
    float _1971 = _1961;
    if (!_1849)
    {
        float _1973 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1891);
        _1963 = _1973;
    }
    float _1975 = _1963;
    float _1977 = fma(_1951, _1949, _1957);
    float _1979 = _1202 * _1967;
    float _1981 = -_1967;
    float _1983 = _1184 * _1981;
    float _1985 = _1206 * _1967;
    float _1987 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1989 = fma(_1214, _1971, _1979);
    float _1991 = fma(_1204, _1971, _1983);
    float _1993 = fma(_1224, _1971, _1985);
    float _1995 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1977);
    float _1997 = fma(_1228, _1975, _1989);
    float _1999 = fma(_1208, _1975, _1991);
    float _2001 = in.m_63.w;
    float _2003 = fma(_1216, _1975, _1993);
    float _2005 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2007 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1987);
    float _2009 = _608 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2011 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2013 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2005);
    float _2015 = _610 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2017 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2019 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2021 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2023 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2029 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2031 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2033 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2019);
    bool _2035 = _1456 > 0.0;
    bool _2037 = isnan(_1456);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2029);
    out.m_65.x = _2021;
    out.m_65.y = _2023;
    out.m_65.z = _2025;
    out.m_65.w = _2027;
    float _2047 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2031);
    float _2049 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2051 = _2033 + _1708;
    float _2053 = _1742 + _1708;
    float _2055 = _1708 * 0.5;
    float _2057 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2013);
    float _2059 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2045);
    float _2061 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2047);
    float _2063 = _2051 * 0.5;
    float _2065 = _2053 * 0.5;
    float _2067 = fma(_1752, -0.5, _2055);
    out.m_67.w = _2001;
    float _2069 = _2049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2057;
    out.m_69.y = _2059;
    out.m_69.z = _2061;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _2033;
    out.gl_Position.w = _1708;
    out.m_71.x = _2065;
    out.m_71.y = _2067;
    out.m_71.z = _2063;
    out.m_71.w = _1708;
    out.m_45.x = _2069;
    float _2071 = _2017 * _1772;
    float _2073 = -_2017;
    float _2075 = _2073 + 1.0;
    float _2077 = _1783 * _2071;
    float _2079 = _1793 * _2071;
    float _2081 = _1783 * _2075;
    float _2083 = fma(_1789, _2077, _1777);
    float _2085 = fma(_1791, _2077, _1779);
    float _2087 = fma(_1783, _2079, _1781);
    out.m_73.x = _2083;
    out.m_73.y = _2085;
    out.m_73.z = _2087;
    out.m_73.w = _2081;
    if (_2043)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2089;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _634 = false;
    bool _304 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2146 = as_type<float>(_108);
        out.gl_Position.z = _2146;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    float _130 = _126;
    if (_122)
    {
        float _132 = float(_92);
        _128 = _132;
    }
    float _134 = _128;
    bool _136 = _126 >= _134;
    bool _138 = !_122;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2215 = as_type<float>(_146);
        out.gl_Position.z = _2215;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.w;
    float _150 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _178 = _168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = 0.0;
    float _188 = _150;
    if (!_160)
    {
        float _190 = _150 * _150;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _180 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _198 = _194;
    if (!_160)
    {
        float _200 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_160;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _150 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _150);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_160;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _150 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _188 = _260;
    }
    float _262 = _188;
    out.m_51.x = _178;
    out.m_51.y = _184;
    out.m_51.z = _196;
    out.m_51.w = _182;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _162, _266);
    float _274 = fma(_262, _164, _268);
    float _276 = fma(_262, _166, _270);
    float _278 = fma(_272, _148, _170);
    float _280 = fma(_274, _148, _172);
    float _282 = fma(_276, _148, _174);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_53.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[11].z, _126);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_92);
        float _308 = 1.0 / _306;
        float _310 = _126 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _316 = _312 + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _334 = 1.0 / _320;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _336;
    float _340 = 1.0 / _324;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _344 = _312 + _342;
    bool _346 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _348 = isnan(_312);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_356;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _328;
    float _364 = _344 * _334;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _368 = _312 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _372 = _312 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _374;
    bool _378 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _380 = 1.0 / _332;
    float _382 = _316 * _340;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _386 = _312 + _384;
    bool _388 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _390 = isnan(_312);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = fma(_376, _364, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _402 = 1.0 / _338;
    float _404 = _368 * _362;
    float _406 = _372 * _380;
    bool _408 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _410 = isnan(_312);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _420;
    float _424 = -_418;
    float _426 = _424 + 1.0;
    float _428 = fma(_422, _364, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _430 = _386 * _402;
    bool _432 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _434 = isnan(_312);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    bool _444 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _446 = isnan(_312);
    bool _448 = _444 || _446;
    bool _450 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _452 = _448 || _450;
    float _454 = float(_452);
    float _456 = _442 * _426;
    float _458 = -_442;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _462;
    float _466 = _454 * _360;
    float _468 = -_454;
    float _470 = _468 + 1.0;
    float _472 = _398 * _460;
    float _474 = -_398;
    float _476 = _474 + 1.0;
    float _478 = fma(_464, _364, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _480 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _482 = isnan(_312);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _496 = _356 * _476;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _502 = _490 * _470;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _508 = -_490;
    float _510 = _508 + 1.0;
    float _512 = fma(_494, _382, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _514 = _478 * _502;
    float _516 = _428 * _502;
    float _518 = _400 * _502;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _528;
    float _532 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].x, _514);
    float _534 = fma(_500, _382, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _536 = fma(_506, _382, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _538 = fma(_522, _404, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _540 = fma(_526, _404, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _542 = fma(_530, _404, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _544 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].y, _516);
    float _546 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[123].z, _518);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _552 = fma(_512, _466, _532);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _558 = fma(_534, _466, _544);
    float _560 = fma(_550, _406, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _562 = fma(_538, _496, _552);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _568 = fma(_536, _466, _546);
    float _570 = fma(_556, _406, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _572 = fma(_540, _496, _558);
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _574;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _578;
    float _582 = fma(_566, _406, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _584 = fma(_542, _496, _568);
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _586;
    float _590 = fma(_560, _472, _562);
    float _592 = fma(_576, _430, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _594 = fma(_580, _430, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _596 = fma(_570, _472, _572);
    float _598 = fma(_588, _430, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _600 = fma(_582, _472, _584);
    float _602 = fma(_592, _456, _590);
    float _604 = fma(_594, _456, _596);
    float _606 = fma(_598, _456, _600);
    float _608 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].x, _602);
    float _610 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].y, _604);
    float _612 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[128].z, _606);
    bool _614 = !_378;
    float _632;
    if (!_614)
    {
        float _616 = in.m_53.x;
        float _618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _620 = _616 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _622 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _624 = _622 * _618;
        float _626 = floor(_624);
        float _628 = -_626;
        float _630 = _624 + _628;
        _632 = _630;
        _634 = true;
    }
    else
    {
        float _636 = float(_92);
        float _638 = 1.0 / _636;
        float _640 = _126 * _638;
        _632 = _640;
    }
    _634 = false;
    float _642 = _632;
    float _644 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _646 = log2(_644);
    float _648 = in.m_53.x;
    float _650 = in.m_53.y;
    float _652 = in.m_53.z;
    bool _654 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _656 = isnan(1.0);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _662 = _658 || _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _666 = 1.0 + _664;
    bool _668 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _676 = _672 || _674;
    float _678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _686 = _684 != 0;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _690 = _688 != 0;
    float _692 = _646 * _126;
    float _694 = 1.0 / _666;
    bool _696 = !_682;
    int _698 = _696 ? 0 : 1;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _702 = _700 != 0;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _710 = _708 != 0;
    bool _712 = !_690;
    int _714 = _712 ? 0 : 1;
    float _716 = exp2(_692);
    float _718 = _652 * 2.0;
    float _720 = _648 * 2.0;
    int _722 = abs(_714);
    float _724 = floor(_718);
    float _726 = -_716;
    float _728 = _726 + 1.0;
    float _730 = floor(_720);
    float _732 = _650 * 2.0;
    float _734 = _676 ? _728 : 0.0;
    bool _736 = _724 > 0.0;
    float _738 = floor(_732);
    if (_662)
    {
        float _740 = _734 * _694;
        _130 = _740;
    }
    float _742 = _130;
    float _744 = _650 + _652;
    bool _746 = _724 >= 0.0;
    bool _748 = isnan(_724);
    bool _750 = _746 || _748;
    bool _752 = isnan(0.0);
    bool _754 = _750 || _752;
    bool _756 = !_686;
    int _758 = _756 ? 0 : 1;
    float _760 = _744 + (-1.0);
    int _762 = _754 ? 0 : 1;
    float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    bool _766 = _730 > 0.0;
    float _768 = _742 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _770 = _730 >= 0.0;
    bool _772 = isnan(_730);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    float _780 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _782 = _742 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _784 = _768 * _678;
    int _786 = ~_762;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    float _792 = _650 + _648;
    int _794 = _790;
    if (!_736)
    {
        int _796 = ~_762;
        int _798 = _796 + 1;
        _794 = _798;
    }
    int _800 = _794;
    float _802 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[203].x, _784);
    int _804 = _778 ? 0 : 1;
    float _806 = _650 + (-0.5);
    bool _808 = _738 > 0.0;
    float _810 = floor(_802);
    bool _812 = _738 >= 0.0;
    bool _814 = isnan(_738);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    float _822 = _782 * _764;
    float _824 = _802 + 0.25;
    int _826 = ~_804;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    float _832 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[203].z, _822);
    int _834 = _830;
    if (!_766)
    {
        int _836 = ~_804;
        int _838 = _836 + 1;
        _834 = _838;
    }
    int _840 = _834;
    float _842 = floor(_824);
    bool _844 = !_710;
    int _846 = _844 ? 0 : 1;
    float _848 = _832 + 0.25;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _860 = _858 != 0;
    float _862 = _792 + (-1.0);
    float _864 = in.m_55.x;
    float _866 = in.m_55.y;
    float _868 = in.m_55.z;
    float _870 = float(_840);
    bool _872 = !_856;
    int _874 = _872 ? 0 : 1;
    float _876 = floor(_832);
    bool _878 = !_852;
    int _880 = _878 ? 0 : 1;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _884 = abs(_874);
    int _886 = _820 ? 0 : 1;
    float _888 = float(_884);
    float _890 = floor(_848);
    int _892 = abs(_880);
    int _894 = ~_886;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = _888 * _870;
    float _902 = -_810;
    float _904 = _802 + _902;
    float _906 = float(_800);
    float _908 = _802 * 6.283185482025146484375;
    float _910 = _900 * (-2.0);
    int _912 = _898;
    if (!_808)
    {
        int _914 = ~_886;
        int _916 = _914 + 1;
        _912 = _916;
    }
    int _918 = _912;
    float _920 = -_876;
    float _922 = _832 + _920;
    float _924 = float(_892);
    bool _926 = _904 >= 0.5;
    bool _928 = isnan(_904);
    bool _930 = _926 || _928;
    bool _932 = isnan(0.5);
    bool _934 = _930 || _932;
    float _936 = -_842;
    float _938 = _824 + _936;
    float _940 = fma(_910, _866, _866);
    float _942 = _924 * _906;
    bool _944 = _922 >= 0.5;
    bool _946 = isnan(_922);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.5);
    bool _952 = _948 || _950;
    float _954 = -_890;
    float _956 = _848 + _954;
    float _958 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].y, _940);
    float _960 = fma(_780, _910, _780);
    bool _962 = !_706;
    int _964 = _962 ? 0 : 1;
    float _966 = _908 * 0.15915493667125701904296875;
    int _968 = abs(_758);
    float _970 = _832 * 6.283185482025146484375;
    float _972 = fma(_960, _742, _958);
    int _974 = abs(_698);
    int _976 = abs(_964);
    float _978 = _966 * 6.283185482025146484375;
    float _980 = sin(_978);
    float _982 = float(_968);
    float _984 = _972 * 0.15915493667125701904296875;
    bool _986 = !_934;
    float _988 = _986 ? 0.5 : (-0.5);
    bool _990 = _938 > 0.5;
    bool _992 = !_952;
    float _994 = _992 ? 0.5 : (-0.5);
    float _996 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _998 = _996 * 2.0;
    float _1000 = float(_976);
    float _1002 = _984 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1014 = _1010 || _1012;
    float _1016 = _982 * _998;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1020 = _1018 * 2.0;
    float _1022 = _970 * 0.15915493667125701904296875;
    bool _1024 = !_702;
    int _1026 = _1024 ? 0 : 1;
    float _1028 = _1000 * _1020;
    float _1030 = float(_974);
    float _1032 = _980 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1034 = _938;
    float _1036 = _956;
    if (_990)
    {
        float _1038 = -_938;
        float _1040 = _1038 + 1.0;
        _1034 = _1040;
    }
    float _1042 = _1034;
    float _1044 = _1022 * 6.283185482025146484375;
    float _1046 = sin(_1044);
    bool _1048 = _956 > 0.5;
    float _1050 = fma(_1030, _1032, _1016);
    float _1052 = fma(_1042, 4.0, -1.0);
    int _1054 = abs(_1026);
    float _1056 = float(_722);
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1060 = float(_1054);
    float _1062 = _984 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = fma(_1056, _1058, _1050);
    int _1068 = abs(_846);
    if (_1048)
    {
        float _1070 = -_956;
        float _1072 = _1070 + 1.0;
        _1036 = _1072;
    }
    float _1074 = _1036;
    bool _1076 = !_860;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1082 = fma(_1066, 3.1415927410125732421875, _864);
    float _1084 = fma(_1074, 4.0, -1.0);
    int _1086 = abs(_1078);
    float _1088 = fma(_1060, _1080, _1028);
    float _1090 = float(_1068);
    float _1092 = _942 * (-2.0);
    float _1094 = float(_918);
    float _1096 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1098 = float(_1086);
    float _1100 = _648 + (-0.5);
    float _1102 = fma(_1082, _1092, _1082);
    float _1104 = fma(_1090, _1096, _1088);
    float _1106 = _652 + _648;
    float _1108 = _1098 * _1094;
    float _1110 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1102);
    float _1112 = fma(_1104, 3.1415927410125732421875, _868);
    float _1114 = _1106 + (-1.0);
    float _1116 = _1108 * (-2.0);
    float _1118 = fma(_882, _1092, _882);
    float _1120 = _652 + (-0.5);
    float _1122 = in.m_49.x;
    float _1124 = in.m_49.y;
    float _1126 = in.m_49.z;
    float _1128 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1130 = fma(_1112, _1116, _1112);
    float _1132 = fma(_1118, _742, _1110);
    float _1134 = in.m_57.x;
    float _1136 = in.m_57.y;
    float _1138 = in.m_57.z;
    float _1140 = fma(_1128, _1116, _1128);
    float _1142 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1130);
    float _1144 = _1132 * 0.15915493667125701904296875;
    float _1146 = fma(_1140, _742, _1142);
    float _1148 = _1144 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = _1146 * 0.15915493667125701904296875;
    float _1154 = _1144 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1160 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1162 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1164 = _1152 * 6.283185482025146484375;
    float _1166 = cos(_1164);
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1170 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1136);
    float _1174 = _1160 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1138);
    float _1178 = _1162 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1180 = _1168 * _1170;
    float _1182 = _1152 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    float _1186 = _1150 * _1064;
    float _1188 = _1150 * _1004;
    float _1190 = _1172 * _1174;
    float _1192 = _1156 * _1004;
    float _1194 = _1176 * _1178;
    float _1196 = _1156 * _1064;
    float _1198 = _1162;
    if (_1014)
    {
        _1198 = 1.0;
    }
    float _1200 = _1198;
    float _1202 = _1150 * _1166;
    float _1204 = _1064 * _1166;
    float _1206 = _1156 * _1166;
    float _1208 = _1004 * _1166;
    float _1210 = _1202 * _1190;
    float _1212 = _1206 * _1190;
    float _1214 = fma(_1184, _1186, _1192);
    float _1216 = fma(_1184, _1192, _1186);
    float _1218 = -_1190;
    float _1220 = _1184 * _1218;
    float _1222 = -_1188;
    float _1224 = fma(_1184, _1196, _1222);
    float _1226 = -_1196;
    float _1228 = fma(_1184, _1188, _1226);
    float _1230 = fma(_1214, _1180, _1210);
    float _1232 = fma(_1204, _1180, _1220);
    float _1234 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1236 = fma(_1224, _1180, _1212);
    float _1238 = fma(_1228, _1194, _1230);
    float _1240 = fma(_1208, _1194, _1232);
    float _1242 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1244 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1234);
    float _1246 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1248 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1250 = fma(_1216, _1194, _1236);
    float _1252 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1242);
    float _1254 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1244);
    float _1256 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1258 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1246);
    float _1260 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1252);
    float _1262 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1264 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1256);
    float _1266 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1258);
    float _1268 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1248);
    float _1270 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1272 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1274 = _1262 + _1266;
    float _1276 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1268);
    float _1278 = _1238 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1280 = _1270 + _1272;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1284 = _1274 + _1282;
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1288 = fma(_1240, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1278);
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1292 = _1280 + _1290;
    float _1294 = _1284 * _1284;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1298 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1288);
    float _1300 = fma(_1292, _1292, _1294);
    float _1302 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1296);
    float _1304 = _1286 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1306 = _1286 + _1298;
    float _1308 = sqrt(_1300);
    float _1310 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1302);
    float _1312 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1314 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1316 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1312);
    float _1318 = 1.0 / _1314;
    float _1320 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1322 = _1320 + _1314;
    bool _1324 = _1308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1322 * _1318;
    float _1328 = _1326 * 0.5;
    float _1330 = _1322;
    float _1332 = _1270;
    float _1334 = _1314;
    float _1336 = _1328;
    float _1338 = _1200;
    if (!_1324)
    {
        _1330 = _1280;
    }
    float _1340 = _1330;
    float _1342 = _1340;
    if (!_1324)
    {
        _1332 = _1274;
    }
    float _1344 = _1332;
    float _1346 = _1344;
    if (!_1324)
    {
        _1334 = _1306;
    }
    float _1348 = _1334;
    bool _1350 = !_1324;
    float _1352 = _1348;
    if (!_1350)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1356 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1358 = _1308 + _1356;
        float _1360 = rsqrt(_1300);
        float _1362 = _1358 * _1354;
        float _1364 = _1306 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1366 = _1362 * 0.15915493667125701904296875;
        float _1368 = _1366 * 6.283185482025146484375;
        float _1370 = cos(_1368);
        float _1372 = _1366 * 6.283185482025146484375;
        float _1374 = sin(_1372);
        float _1376 = _1370 + (-1.0);
        float _1378 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1380 = fma(_1374, _1364, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1382 = fma(_1306, _1370, _1378);
        float _1384 = _1360 * _1380;
        float _1386 = fma(_1292, _1384, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1388 = fma(_1284, _1384, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1352 = _1382;
        _1342 = _1386;
        _1346 = _1388;
    }
    float _1390 = _1352;
    float _1392 = _1342;
    float _1394 = _1346;
    if (!_1014)
    {
        float _1396 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1398 = _1396 * 0.15915493667125701904296875;
        float _1400 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1404 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1402);
        float _1406 = _1398 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1400 * 0.15915493667125701904296875;
        float _1412 = _1398 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = 1.0 / _1408;
        float _1418 = _1410 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1414 * _1416;
        float _1424 = _1410 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = _1420 * _1422;
        float _1430 = 1.0 / _1404;
        float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1434 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1432;
        float _1436 = 1.0 / _1428;
        float _1438 = 1.0 / _1434;
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1442 = _1430 * _1440;
        float _1444 = _1426 * _1436;
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = fma(_1444, _1442, _1446);
        float _1450 = _1448 * _1438;
        float _1452 = precise::clamp(_1450, 0.0, 1.0);
        _1336 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1338 = _1452;
    }
    float _1454 = _1336;
    float _1456 = _1338;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1460 = _1390 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1464 = _1392 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1468 = _1394 + _1466;
    float _1470 = _1460 * _1460;
    float _1472 = fma(_1464, _1464, _1470);
    float _1474 = fma(_1468, _1468, _1472);
    float _1476 = rsqrt(_1474);
    float _1478 = sqrt(_1474);
    float _1480 = _1476 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1482 = _1464 * _1480;
    float _1484 = _1468 * _1480;
    float _1486 = _1482 * _1482;
    float _1488 = _1484 * _1484;
    float _1490 = _1486 + _1488;
    float _1492 = sqrt(_1490);
    bool _1494 = _1492 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = _1492 + _1496;
    float _1500 = _1468;
    float _1502 = _1490;
    float _1504 = _1498;
    float _1506 = _1470;
    float _1508 = _1480;
    if (_1494)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1500 = _1510;
    }
    float _1512 = _1500;
    if (_1494)
    {
        float _1514 = rsqrt(_1490);
        _1502 = _1514;
    }
    float _1516 = _1502;
    float _1518 = _1516;
    if (_1494)
    {
        float _1520 = _1498 * _1512;
        _1504 = _1520;
    }
    float _1522 = _1504;
    if (_1494)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _1506 = _1524;
    }
    float _1526 = _1506;
    float _1528 = _1512;
    float _1530 = _1526;
    if (_1494)
    {
        float _1532 = _1526 * 6.283185482025146484375;
        float _1534 = sin(_1532);
        _1528 = _1534;
    }
    float _1536 = _1528;
    float _1538 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1540 = precise::max(0.0, _1538);
    float _1542 = _1454;
    float _1544 = _1540;
    if (_1494)
    {
        float _1546 = _1526 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = -_1480;
    float _1554 = -_1540;
    float _1556 = fma(_1460, _1552, _1554);
    float _1558 = _1556;
    if (_1494)
    {
        float _1560 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1560;
    }
    float _1562 = _1544;
    float _1564 = _1536;
    float _1566 = _1562;
    if (_1494)
    {
        float _1568 = fma(_1536, _1562, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1564 = _1568;
    }
    float _1570 = _1564;
    float _1572 = _1570;
    float _1574 = _1550;
    if (_1494)
    {
        float _1576 = _1550 + (-1.0);
        _1566 = _1576;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (_1494)
    {
        float _1582 = _1516 * _1570;
        _1508 = _1582;
    }
    float _1584 = _1508;
    if (!_1494)
    {
        _1572 = _1482;
    }
    float _1586 = _1572;
    float _1588 = _1586;
    if (_1494)
    {
        float _1590 = _1578 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1530 = _1590;
    }
    float _1592 = _1530;
    if (_1494)
    {
        float _1594 = _1482 * _1584;
        _1588 = _1594;
    }
    float _1596 = _1588;
    if (!_1494)
    {
        _1580 = _1484;
    }
    float _1598 = _1580;
    float _1600 = _1598;
    if (_1494)
    {
        float _1602 = _1484 * _1584;
        _1600 = _1602;
    }
    float _1604 = _1600;
    if (!_1494)
    {
        _1518 = _1486;
    }
    float _1606 = _1518;
    float _1608 = _1606;
    if (_1494)
    {
        float _1610 = fma(_1556, _1550, _1592);
        _1558 = _1610;
    }
    float _1612 = _1558;
    if (_1494)
    {
        float _1614 = _1596 * _1596;
        _1608 = _1614;
    }
    float _1616 = _1608;
    if (!_1494)
    {
        _1574 = _1488;
    }
    float _1618 = _1574;
    float _1620 = _1618;
    if (_1494)
    {
        float _1622 = _1604 * _1604;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1628 = fma(_1612, _1612, _1616);
    float _1630 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1632 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1626);
    float _1634 = _1628 + _1624;
    float _1636 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1638 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1640 = fma(_1478, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1638);
    float _1642 = precise::clamp(_1640, 0.0, 1.0);
    float _1644 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1632);
    float _1646 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1648 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1636);
    float _1650 = rsqrt(_1634);
    float _1652 = -_1642;
    float _1654 = _1652 + 1.0;
    float _1656 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1646);
    float _1658 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1648);
    float _1660 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1662 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1664 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1656);
    float _1666 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1668 = abs(_1654);
    float _1670 = log2(_1668);
    float _1672 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1660);
    float _1674 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1678 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1672);
    float _1682 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1676);
    float _1684 = _1650 * _1596;
    float _1686 = _1650 * _1612;
    float _1688 = _1650 * _1604;
    float _1690 = -_1678;
    float _1692 = fma(_1690, _1630, 1.0);
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1696 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1698 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1682);
    float _1700 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1702 = -_1694;
    float _1704 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1708 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1698);
    float _1710 = log2(_1692);
    float _1712 = -_1688;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1716 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1718 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1700);
    float _1720 = _1686 + 1.0;
    float _1722 = fma(_1714, -0.5, 0.5);
    float _1724 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1716);
    float _1726 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1718);
    float _1728 = 1.0 / _1708;
    float _1730 = exp2(_1706);
    float _1732 = _1710 * 0.693147182464599609375;
    float _1734 = sqrt(_1722);
    float _1736 = fma(_1714, 0.5, 0.5);
    float _1738 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1740 = fma(_1736, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1738);
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1746 = -_1686;
    float _1748 = fma(_1730, _1720, _1746);
    float _1750 = fma(_1736, _1740, -0.212114393711090087890625);
    float _1752 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1726);
    float _1754 = _1742 * _1728;
    float _1756 = fma(_1736, _1750, 1.570728778839111328125);
    float _1758 = _1752 * _1728;
    float _1760 = fma(_1754, 0.5, 0.5);
    float _1762 = _1734 * 0.636619746685028076171875;
    float _1764 = fma(_1748, 0.5, 0.5);
    float _1766 = fma(_1758, -0.5, 0.5);
    float _1768 = -_1756;
    float _1770 = fma(_1762, _1768, 1.0);
    float3 _4737 = float3(_1760, _1766, _1744);
    float _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4737, float3(0.0), isnan(_4737)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4737, float3(0.0), isnan(_4737)), level(0.0)).x;
    float3 _4748 = float3(_1760, _1766, _1744);
    float4 _1775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4748, float3(0.0), isnan(_4748)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4748, float3(0.0), isnan(_4748)), level(0.0)).xyzw;
    float _1777 = _1775.x;
    float _1779 = _1775.y;
    float _1781 = _1775.z;
    float _1783 = _1775.w;
    float2 _4765 = float2(_1770, _1764);
    float3 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4765, float2(0.0), isnan(_4765)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4765, float2(0.0), isnan(_4765)), level(0.0)).xyz;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_59.x = _1392;
    out.m_59.y = _1390;
    out.m_59.z = _1394;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1801 = _1136 != 0.0;
    bool _1803 = isnan(_1136);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan(0.0);
    bool _1809 = _1805 || _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1817 = _642 + _1815;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1823 = 1.0 / _1799;
    bool _1825 = _1134 == 0.0;
    bool _1827 = !_1809;
    bool _1829 = _1825 && _1827;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1833 = _1831 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1835 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1837 = isnan(_642);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    bool _1847 = _1138 == 0.0;
    bool _1849 = _1847 && _1829;
    bool _1851 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1853 = isnan(_642);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = 1.0 / _1821;
    float _1865 = -_1845;
    float _1867 = _1865 + 1.0;
    float _1869 = _1813 * _1823;
    float _1871 = 1.0 / _1833;
    float _1873 = fma(_1869, _1817, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1875 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1877 = isnan(_642);
    bool _1879 = _1875 || _1877;
    bool _1881 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1883 = _1879 || _1881;
    float _1885 = float(_1883);
    float _1887 = in.m_61.x;
    float _1889 = in.m_61.y;
    float _1891 = in.m_61.z;
    float _1893 = exp2(_1795);
    float _1895 = _1885 * _1867;
    float _1897 = -_1885;
    float _1899 = _1897 + 1.0;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1905;
    float _1909 = _1861 * _1899;
    float _1911 = _1903 * _1863;
    bool _1913 = _642 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1915 = isnan(_642);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1861;
    float _1927 = _1925 + 1.0;
    float _1929 = _1873 * _1909;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1933 = _642 + _1931;
    float _1935 = _1907 * _1871;
    float _1937 = -_1923;
    float _1939 = _1937 + 1.0;
    float _1941 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1943 = _642 + _1941;
    float _1945 = fma(_1911, _1933, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1947 = fma(_1927, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1929);
    float _1949 = _1845 * _1939;
    float _1951 = fma(_1935, _1943, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1953 = -_1893;
    float _1955 = _1953 + 1.0;
    float _1957 = fma(_1945, _1895, _1947);
    float _1959 = _1889;
    float _1961 = _1887;
    float _1963 = _1891;
    if (!_1849)
    {
        float _1965 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1889);
        _1959 = _1965;
    }
    float _1967 = _1959;
    if (!_1849)
    {
        float _1969 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1961 = _1969;
    }
    float _1971 = _1961;
    if (!_1849)
    {
        float _1973 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1891);
        _1963 = _1973;
    }
    float _1975 = _1963;
    float _1977 = fma(_1951, _1949, _1957);
    float _1979 = _1202 * _1967;
    float _1981 = -_1967;
    float _1983 = _1184 * _1981;
    float _1985 = _1206 * _1967;
    float _1987 = _1666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1989 = fma(_1214, _1971, _1979);
    float _1991 = fma(_1204, _1971, _1983);
    float _1993 = fma(_1224, _1971, _1985);
    float _1995 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1977);
    float _1997 = fma(_1228, _1975, _1989);
    float _1999 = fma(_1208, _1975, _1991);
    float _2001 = in.m_63.w;
    float _2003 = fma(_1216, _1975, _1993);
    float _2005 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2007 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1987);
    float _2009 = _608 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2011 = _612 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2013 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2005);
    float _2015 = _610 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2017 = _1955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2019 = fma(_1662, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2007);
    float _2021 = _2009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2023 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2025 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2027 = _1995 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2029 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2031 = _1997 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2033 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2019);
    bool _2035 = _1456 > 0.0;
    bool _2037 = isnan(_1456);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.0);
    bool _2043 = _2039 || _2041;
    float _2045 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2029);
    out.m_65.x = _2021;
    out.m_65.y = _2023;
    out.m_65.z = _2025;
    out.m_65.w = _2027;
    float _2047 = fma(_1999, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2031);
    float _2049 = _1456 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2051 = _2033 + _1708;
    float _2053 = _1742 + _1708;
    float _2055 = _1708 * 0.5;
    float _2057 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2013);
    float _2059 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2045);
    float _2061 = fma(_2003, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2047);
    float _2063 = _2051 * 0.5;
    float _2065 = _2053 * 0.5;
    float _2067 = fma(_1752, -0.5, _2055);
    out.m_67.w = _2001;
    float _2069 = _2049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2057;
    out.m_69.y = _2059;
    out.m_69.z = _2061;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _2033;
    out.gl_Position.w = _1708;
    out.m_71.x = _2065;
    out.m_71.y = _2067;
    out.m_71.z = _2063;
    out.m_71.w = _1708;
    out.m_45.x = _2069;
    float _2071 = _2017 * _1772;
    float _2073 = -_2017;
    float _2075 = _2073 + 1.0;
    float _2077 = _1783 * _2071;
    float _2079 = _1793 * _2071;
    float _2081 = _1783 * _2075;
    float _2083 = fma(_1789, _2077, _1777);
    float _2085 = fma(_1791, _2077, _1779);
    float _2087 = fma(_1783, _2079, _1781);
    out.m_73.x = _2083;
    out.m_73.y = _2085;
    out.m_73.z = _2087;
    out.m_73.w = _2081;
    if (_2043)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2089 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2089;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

