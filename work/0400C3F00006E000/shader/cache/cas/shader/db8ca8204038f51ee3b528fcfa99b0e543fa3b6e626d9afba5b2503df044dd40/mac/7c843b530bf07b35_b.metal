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
    texture2d<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_ASmplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_81 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1821 = false;
    bool _472 = false;
    bool _304 = false;
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
        float _2104 = as_type<float>(_122);
        out.gl_Position.z = _2104;
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
        float _2174 = as_type<float>(_160);
        out.gl_Position.z = _2174;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_53.w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_51.x;
    float _178 = in.m_51.y;
    float _180 = in.m_51.z;
    float _182 = in.m_46.x;
    float _184 = in.m_46.y;
    float _186 = in.m_46.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_55.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _312 + _330;
    bool _334 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_312);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _356 = isnan(_312);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_328;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _348;
    float _372 = _364 * _368;
    float _374 = -_364;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _384 = 1.0 / _352;
    float _386 = _344 * _376;
    float _388 = -_344;
    float _390 = _388 + 1.0;
    float _392 = _316 * _370;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = fma(_380, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = fma(_396, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = fma(_400, _392, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _332 * _384;
    float _410 = _402 * _386;
    float _412 = _404 * _386;
    float _414 = _406 * _386;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _410);
    float _430 = fma(_418, _408, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _432 = fma(_422, _408, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _436 = fma(_426, _408, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _440 = fma(_430, _372, _428);
    float _442 = fma(_432, _372, _434);
    float _444 = fma(_436, _372, _438);
    float _446 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].x, _440);
    float _448 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].y, _442);
    float _450 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].z, _444);
    bool _452 = !_382;
    float _470;
    if (!_452)
    {
        float _454 = in.m_55.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_106);
        float _476 = 1.0 / _474;
        float _478 = _140 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _488 = in.m_55.z;
    float _490 = in.m_55.w;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _498 = _496 != 0;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _508 = in.m_55.x;
    float _510 = in.m_55.y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _514 = _390;
    if (!_494)
    {
        float _516 = in.m_55.z;
        _514 = _516;
    }
    float _518 = _514;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _522 = -_482;
    float _524 = _522 + 1.0;
    bool _526 = _488 > 0.5;
    int _528 = _526 ? as_type<int>(_524) : as_type<int>(_482);
    float _530 = _448 * _502;
    float _532 = _498 ? as_type<float>(_528) : _482;
    float _534 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _538 = _490 > 0.5;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _542 = fma(_534, _532, -0.5);
    float _544 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _546 = _534;
    float _548 = _530;
    float _550 = _518;
    float _552 = _482;
    if (!_494)
    {
        _546 = _510;
    }
    float _554 = _546;
    float _556 = _554;
    if (_494)
    {
        _556 = _508;
    }
    float _558 = _556;
    float _560 = _544 * _484;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _572 = _570 != 0;
    float _574 = _560;
    if (!_494)
    {
        _548 = _518;
    }
    float _576 = _548;
    float _578 = -_560;
    float _580 = _578 + 1.0;
    float _582 = _576;
    if (_494)
    {
        _582 = _510;
    }
    float _584 = _582;
    float _586 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[83].z, _540);
    float _588 = _558 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_494)
    {
        _550 = _510;
    }
    float _590 = _550;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _594 = _538 ? as_type<int>(_580) : as_type<int>(_560);
    float _596 = -_512;
    float _598 = fma(_588, 2.0, _596);
    float _600 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _520);
    bool _602 = !_564;
    float _604 = _602 ? _560 : as_type<float>(_594);
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _608 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _586);
    float _610 = -_140;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[81].x, _598);
    float _614 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _600);
    float _616 = fma(_606, -2.0, _592);
    float _618 = fma(_536, _604, -0.5);
    float _620 = fma(_608, _542, _612);
    float _622 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _616);
    float _624 = -_622;
    float _626 = fma(_614, _618, _624);
    float _628 = _620 + 0.5;
    float _630 = _626 + 0.5;
    float2 _2931 = float2(_628, _630);
    float _632 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2931, float2(0.0), isnan(_2931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2931, float2(0.0), isnan(_2931)), level(0.0)).w;
    float _634 = fma(_140, -0.004999999888241291046142578125, _524);
    float _636 = -_484;
    float _638 = _636 + 1.0;
    float _640 = _634 * 43.9822998046875;
    float _642 = fma(_140, 0.004999999888241291046142578125, _524);
    float _644 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = in.m_59.z;
    float _648 = _640 * 0.15915493667125701904296875;
    float _650 = _642 * 31.415927886962890625;
    float _652 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _644);
    float _654 = in.m_59.x;
    float _656 = _650 * 0.15915493667125701904296875;
    float _658 = _648 * 6.283185482025146484375;
    float _660 = sin(_658);
    bool _662 = _508 > 0.5;
    float _664 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _652);
    float _666 = in.m_59.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = _662 ? as_type<int>(_524) : as_type<int>(_482);
    float _674 = _656 * 6.283185482025146484375;
    float _676 = sin(_674);
    bool _678 = _510 > 0.5;
    float _680 = _670 ? as_type<float>(_672) : _482;
    if (_568)
    {
        float _682 = _678 ? _524 : _482;
        _552 = _682;
    }
    float _684 = _552;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _688 = _686 != 0;
    float _690 = rsqrt(_664);
    float _692 = _660 * 0.4000000059604644775390625;
    int _694 = _678 ? as_type<int>(_580) : as_type<int>(_560);
    float _696 = fma(_676, 0.300000011920928955078125, _692);
    bool _698 = !_688;
    float _700 = _698 ? _560 : as_type<float>(_694);
    float _702 = sqrt(_664);
    float _704 = _646;
    if (_572)
    {
        float _706 = _526 ? _580 : _560;
        _574 = _706;
    }
    float _708 = _574;
    float _710 = _140 + _696;
    float _712 = _710 * _690;
    float _714 = _446 * _500;
    float _716 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _718 = _450 * _504;
    float _720 = fma(_712, -0.300000011920928955078125, _638);
    float _722 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _724 = _702 * _720;
    float _726 = fma(_712, -0.4000000059604644775390625, _638);
    float _728 = _646 * _646;
    float _730 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _732 = _724 * 1.14999997615814208984375;
    float _734 = _702 * _726;
    float _736 = fma(_654, _654, _728);
    float _738 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _740 = _732 * 0.15915493667125701904296875;
    float _742 = _734 * 1.89999997615814208984375;
    float _744 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _746 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _738);
    float _748 = _740 * 6.283185482025146484375;
    float _750 = sin(_748);
    float _752 = _742 * 0.15915493667125701904296875;
    float _754 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _744);
    float _756 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _758 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _754);
    float _760 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _762 = _752 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = rsqrt(_736);
    float _770 = _750 * 0.07999999821186065673828125;
    float _772 = fma(_764, 0.100000001490116119384765625, _770);
    float _774 = _772 + _632;
    float _776 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _778 = _768 * _774;
    float _780 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _782 = _654 * _778;
    float _784 = _646 * _778;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _788 = _782 + _654;
    float _790 = _784 + _646;
    float _792 = _544 * _786;
    float _794 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _790);
    float _798 = _776 * _794;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = _780 * _796;
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _806 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].x, _804);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[10].z, _808);
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[8].z, _810);
    float _816 = _766 + _812;
    float _818 = _806 + _814;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _822 = _816 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _826 = _818 + _824;
    float _828 = _822 * _822;
    float _830 = fma(_826, _826, _828);
    float _832 = _792 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _834 = sqrt(_830);
    float _836 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].x, _832);
    float _838 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[9].z, _836);
    float _840 = _760 + _838;
    bool _842 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _760;
    float _846 = _818;
    float _848 = _838;
    float _850 = _792;
    float _852 = _718;
    float _854 = _830;
    float _856 = _782;
    if (!_842)
    {
        _844 = _818;
    }
    float _858 = _844;
    float _860 = _858;
    if (!_842)
    {
        _846 = _816;
    }
    float _862 = _846;
    float _864 = _862;
    if (!_842)
    {
        _848 = _840;
    }
    float _866 = _848;
    bool _868 = !_842;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _834 + _874;
        float _878 = rsqrt(_830);
        float _880 = _876 * _872;
        float _882 = _840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_840, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_826, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_822, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _870 = _900;
        _860 = _904;
        _864 = _906;
    }
    float _908 = _870;
    float _910 = _860;
    float _912 = _864;
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = _908 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _920 = _910 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _924 = _912 + _922;
    float _926 = _916 * _916;
    float _928 = fma(_920, _920, _926);
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _932 = fma(_924, _924, _928);
    float _934 = rsqrt(_932);
    float _936 = sqrt(_932);
    float _938 = _934 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _940 = _920 * _938;
    float _942 = _924 * _938;
    float _944 = _940 * _940;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _950 + _954;
    float _958 = _934;
    float _960 = _948;
    float _962 = _956;
    float _964 = _916;
    float _966 = _940;
    if (_952)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _968;
    }
    float _970 = _958;
    if (_952)
    {
        float _972 = rsqrt(_948);
        _960 = _972;
    }
    float _974 = _960;
    if (_952)
    {
        float _976 = _956 * _970;
        _962 = _976;
    }
    float _978 = _962;
    if (_952)
    {
        float _980 = _978 * 0.15915493667125701904296875;
        _850 = _980;
    }
    float _982 = _850;
    float _984 = _924;
    if (_952)
    {
        float _986 = _982 * 6.283185482025146484375;
        float _988 = sin(_986);
        _984 = _988;
    }
    float _990 = _984;
    float _992 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _994 = precise::max(0.0, _992);
    float _996 = _970;
    float _998 = _994;
    if (_952)
    {
        float _1000 = _982 * 6.283185482025146484375;
        float _1002 = cos(_1000);
        _996 = _1002;
    }
    float _1004 = _996;
    float _1006 = -_938;
    float _1008 = -_994;
    float _1010 = fma(_916, _1006, _1008);
    if (_952)
    {
        float _1012 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _1012;
    }
    float _1014 = _964;
    float _1016 = _990;
    float _1018 = _1014;
    if (_952)
    {
        float _1020 = fma(_990, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1016 = _1020;
    }
    float _1022 = _1016;
    float _1024 = _1022;
    if (!_952)
    {
        _1018 = _944;
    }
    float _1026 = _1018;
    float _1028 = _1026;
    float _1030 = _1004;
    if (_952)
    {
        float _1032 = _1004 + (-1.0);
        _998 = _1032;
    }
    float _1034 = _998;
    float _1036 = _1034;
    if (_952)
    {
        float _1038 = _974 * _1022;
        _852 = _1038;
    }
    float _1040 = _852;
    if (!_952)
    {
        _1024 = _1010;
    }
    float _1042 = _1024;
    float _1044 = _1042;
    if (_952)
    {
        float _1046 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _1046;
    }
    float _1048 = _854;
    if (_952)
    {
        float _1050 = _940 * _1040;
        _966 = _1050;
    }
    float _1052 = _966;
    if (!_952)
    {
        _1036 = _942;
    }
    float _1054 = _1036;
    float _1056 = _1054;
    if (_952)
    {
        float _1058 = _942 * _1040;
        _1056 = _1058;
    }
    float _1060 = _1056;
    if (_952)
    {
        float _1062 = fma(_1010, _1004, _1048);
        _1044 = _1062;
    }
    float _1064 = _1044;
    if (_952)
    {
        float _1066 = _1052 * _1052;
        _1028 = _1066;
    }
    float _1068 = _1028;
    if (!_952)
    {
        _1030 = _946;
    }
    float _1070 = _1030;
    float _1072 = _1070;
    if (_952)
    {
        float _1074 = _1060 * _1060;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = _908 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1080 = fma(_1064, _1064, _1068);
    float _1082 = _908 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1084 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1078);
    float _1086 = _1080 + _1076;
    float _1088 = _908 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1092 = fma(_936, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1084);
    float _1098 = rsqrt(_1086);
    float _1100 = _908 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1102 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1104 = -_1094;
    float _1106 = _1104 + 1.0;
    float _1108 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1082);
    float _1110 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1100);
    float _1112 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1102);
    float _1114 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1116 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1118 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1120 = abs(_1106);
    float _1122 = log2(_1120);
    float _1124 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1130 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1132 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1134 = _1098 * _1052;
    float _1136 = _1098 * _1060;
    float _1138 = -_1126;
    float _1140 = fma(_1138, _930, 1.0);
    float _1142 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1132);
    float _1144 = _1098 * _1064;
    float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1142);
    float _1152 = log2(_1140);
    float _1154 = -_1146;
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1160 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1150);
    float _1162 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1148);
    float _1164 = -_1136;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1156);
    float _1168 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1170 = exp2(_1158);
    float _1172 = fma(_1166, -0.5, 0.5);
    float _1174 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1168);
    float _1176 = fma(_1166, 0.5, 0.5);
    float _1178 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1162);
    float _1180 = _1144 + 1.0;
    float _1182 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1174);
    float _1184 = fma(_1176, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1186 = 1.0 / _1160;
    float _1188 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1178);
    float _1190 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1182);
    float _1192 = _1152 * 0.693147182464599609375;
    float _1194 = fma(_1176, _1184, -0.212114393711090087890625);
    float _1196 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1198 = sqrt(_1172);
    float _1200 = -_1144;
    float _1202 = fma(_1170, _1180, _1200);
    float _1204 = fma(_1176, _1194, 1.570728778839111328125);
    float _1206 = fma(_1202, 0.5, 0.5);
    float _1208 = _1190 * _1186;
    float _1210 = _1188 * _1186;
    float _1212 = fma(_1208, 0.5, 0.5);
    float _1214 = fma(_1210, -0.5, 0.5);
    float _1216 = _1198 * 0.636619746685028076171875;
    float3 _3914 = float3(_1212, _1214, _1196);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3914, float3(0.0), isnan(_3914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3914, float3(0.0), isnan(_3914)), level(0.0)).x;
    float _1220 = -_1204;
    float _1222 = fma(_1216, _1220, 1.0);
    float3 _3930 = float3(_1212, _1214, _1196);
    float4 _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3930, float3(0.0), isnan(_3930)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3930, float3(0.0), isnan(_3930)), level(0.0)).xyzw;
    float _1227 = _1225.x;
    float _1229 = _1225.y;
    float _1231 = _1225.z;
    float _1233 = _1225.w;
    float2 _3946 = float2(_1222, _1206);
    float3 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3946, float2(0.0), isnan(_3946)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3946, float2(0.0), isnan(_3946)), level(0.0)).xyz;
    float _1239 = _1237.x;
    float _1241 = _1237.y;
    float _1243 = _1237.z;
    float _1245 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1249 = _480 + _1247;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_61.x = _910;
    out.m_61.y = _908;
    out.m_61.z = _912;
    float _1253 = -_1251;
    float _1255 = fma(_1245, 2.0, _1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1257;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1269 = 1.0 / _1259;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1277 = _480 + _1275;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1281 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = 1.0 / _1267;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1291 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.x = _1281;
    out.m_63.y = _1287;
    out.m_63.z = _1283;
    float _1293 = _1277 * _1269;
    float _1295 = _1269;
    float _1297 = _1188;
    if (_494)
    {
        _1295 = _508;
    }
    float _1299 = _1295;
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1303 = fma(_1291, -2.0, _1271);
    float _1305 = _1299;
    if (!_494)
    {
        _1305 = _488;
    }
    float _1307 = _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1309;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1321 = _1249 * _1285;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1335 = fma(_1311, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1337 = fma(_1329, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1339 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1341 = isnan(_480);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1353 = fma(_1315, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1355 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1357 = fma(_1333, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1359 = -_1349;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1351);
    float _1365 = fma(_680, _1355, -0.5);
    bool _1367 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1369 = isnan(_480);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = fma(_1325, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1381 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1383 = isnan(_480);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_140;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1255);
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1399 = _1377 * _1361;
    float _1401 = -_1377;
    float _1403 = _1401 + 1.0;
    float _1405 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1407 = fma(_1319, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1409 = _1391 * _1403;
    float _1411 = -_1391;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1289);
    float _1417 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1273);
    float _1419 = _1335 * _1409;
    float _1421 = _1379 * _1409;
    float _1423 = _1337 * _1409;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1427 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1363);
    float _1429 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_494)
    {
        _1435 = _510;
    }
    float _1437 = _1435;
    float _1439 = fma(_1429, _684, -0.5);
    float _1441 = -_1431;
    float _1443 = fma(_1405, 2.0, _1441);
    float _1445 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1433);
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1449 = _1437;
    if (!_494)
    {
        _1449 = _508;
    }
    float _1451 = _1449;
    float _1453 = -_140;
    float _1455 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1443);
    float _1457 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1445);
    bool _1459 = _666 != 0.0;
    bool _1461 = isnan(_666);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan(0.0);
    bool _1467 = _1463 || _1465;
    float _1469 = fma(_1427, _1365, _1395);
    float _1471 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1473 = fma(_1457, _1439, _1455);
    float _1475 = -_654;
    bool _1477 = _782 == _1475;
    bool _1479 = !_1467;
    bool _1481 = _1477 && _1479;
    float _1483 = in.m_65.z;
    float _1485 = fma(_1471, _708, -0.5);
    float _1487 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1303);
    float _1489 = -_646;
    bool _1491 = _784 == _1489;
    bool _1493 = _1491 && _1481;
    float _1495 = in.m_65.y;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1499 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1501 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1419);
    float _1503 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1421);
    float _1505 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1423);
    float _1507 = fma(_700, _1499, -0.5);
    float _1509 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1511 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1415);
    float _1513 = fma(_1353, _1399, _1501);
    float _1515 = fma(_1357, _1399, _1503);
    float _1517 = fma(_1509, -2.0, _1497);
    float _1519 = fma(_1407, _1399, _1505);
    float _1521 = -_1487;
    float _1523 = fma(_1511, _1507, _1521);
    float _1525 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1417);
    float _1527 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1517);
    float _1529 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1513);
    float _1531 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1515);
    float _1533 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1519);
    float _1535 = in.m_65.x;
    float _1537 = _784 + _1483;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1541 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1545 = as_type<int>(_1483);
    int _1547 = as_type<int>(_1527);
    if (_1493)
    {
        _704 = _1495;
    }
    float _1549 = _704;
    float _1551 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1537);
    float _1553 = -_1527;
    float _1555 = fma(_1525, _1485, _1553);
    float _1557 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1549;
    if (_1493)
    {
        _142 = _1549;
    }
    float _1561 = _142;
    float _1563 = _1561;
    if (_1493)
    {
        float _1565 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1545 = as_type<int>(_1565);
    }
    int _1567 = _1545;
    int _1569 = _1567;
    if (!_1493)
    {
        _1559 = _1495;
    }
    float _1571 = _1559;
    float _1573 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1493)
    {
        _1547 = as_type<int>(_1551);
    }
    int _1577 = _1547;
    int _1579 = _1577;
    if (!_1493)
    {
        float _1581 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1569 = as_type<int>(_1581);
    }
    int _1583 = _1569;
    if (!_1493)
    {
        _1579 = as_type<int>(_1551);
    }
    int _1585 = _1579;
    out.m_67.x = _1557;
    out.m_67.y = _1573;
    out.m_67.z = _1575;
    bool _1587 = !_1493;
    float _1589 = _1587 ? as_type<float>(_1583) : _1571;
    float _1591 = _1473 + 0.5;
    float _1593 = _1493 ? _1537 : as_type<float>(_1585);
    float _1595 = _782 + _1535;
    float _1597 = _1595;
    if (!_1493)
    {
        _1563 = as_type<float>(_1583);
    }
    float _1599 = _1563;
    float _1601 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1603 = _1469 + 0.5;
    if (!_1493)
    {
        float _1605 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1595);
        _1597 = _1605;
    }
    float _1607 = _1597;
    float _1609 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1611 = _1589 * _1589;
    float _1613 = exp2(_1601);
    float _1615 = _1523 + 0.5;
    float _1617 = fma(_1593, _1593, _1611);
    float _1619 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    out.m_69.x = _1603;
    out.m_69.y = _1615;
    out.m_69.z = _628;
    out.m_69.w = _630;
    if (_1493)
    {
        _856 = _1537;
    }
    float _1621 = _856;
    float _1623 = rsqrt(_1617);
    float _1625 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1619);
    out.m_71.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_71.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_71.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1627 = _1621;
    if (!_1493)
    {
        _1627 = _1551;
    }
    float _1629 = _1627;
    float _1631 = _1555 + 0.5;
    float _1633 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1625);
    float _1635 = -_1613;
    float _1637 = _1635 + 1.0;
    bool _1639 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1641 = isnan(_936);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1647 = _1643 || _1645;
    out.m_73.x = _1591;
    out.m_73.y = _1631;
    float _1649 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1651 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.gl_Position.x = _1190;
    out.gl_Position.y = _1188;
    out.gl_Position.z = _1633;
    out.gl_Position.w = _1160;
    float _1653 = _1589 * _1623;
    float _1655 = _1593 * _1623;
    float _1657 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1651);
    float _1659 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1661 = _1653 * _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1665 = _1653 * _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1669 = _1653 * _1667;
    float _1671 = _1651;
    float _1673 = _1633;
    float _1675 = _1190;
    if (!_1647)
    {
        _1671 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1677 = _1671;
    float _1679 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1661);
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1665);
    float _1683 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1687 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1669);
    float _1689 = _1685;
    float _1691 = _1679;
    float _1693 = _1677;
    float _1695 = _1677;
    if (!_1647)
    {
        _1297 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1697 = _1297;
    float _1699 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1701 = _1633 + _1160;
    float _1703 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1685);
    out.m_75.x = _1679;
    out.m_75.y = _1681;
    out.m_75.z = _1687;
    float _1705 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1699);
    float _1707 = _1701 * 0.5;
    float _1709 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1657);
    float _1711 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1703);
    float _1713 = _1697;
    float _1715 = _1697;
    if (!_1647)
    {
        _1673 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1717 = _1673;
    out.m_77.z = _1707;
    out.m_77.w = _1160;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1647)
    {
        _1675 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1723 = _1675;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1647)
    {
        _1689 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1729 = _1689;
    out.m_79.x = _1705;
    out.m_79.y = _1709;
    out.m_79.z = _1711;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1647)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1735 = _1691;
    float _1737 = _1649 * _1218;
    float _1739 = -_1649;
    float _1741 = _1739 + 1.0;
    float _1743 = _1233 * _1737;
    float _1745 = _1233 * _1741;
    float _1747 = _1243 * _1737;
    float _1749 = fma(_1239, _1743, _1227);
    float _1751 = fma(_1241, _1743, _1229);
    float _1753 = fma(_1233, _1747, _1231);
    out.m_81.x = _1749;
    out.m_81.y = _1751;
    out.m_81.z = _1753;
    out.m_81.w = _1745;
    bool _1755 = !_1647;
    float _1757 = _1735;
    float _1759 = _1735;
    if (!_1755)
    {
        bool _1761 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1763 = isnan(_936);
        bool _1765 = _1761 || _1763;
        bool _1767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1769 = _1765 || _1767;
        if (!_1769)
        {
            float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1773 = _936 + _1771;
            float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1777 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1775;
            float _1779 = 1.0 / _1777;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1801 = _1773 * _1779;
            float _1803 = precise::clamp(_1801, 0.0, 1.0);
            float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1809 = fma(_1803, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1811 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1813 = fma(_1803, _1787, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1815 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1817 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1819 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1809;
            _1695 = _1817;
            _1715 = _1811;
            _1727 = _1815;
            _1721 = _1813;
            _1733 = _1819;
            _1821 = true;
        }
        else
        {
            bool _1823 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1825 = isnan(_936);
            bool _1827 = _1823 || _1825;
            bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1831 = _1827 || _1829;
            if (!_1831)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1833 = _1713;
            _1715 = _1833;
            if (!_1831)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1835 = _1757;
            _1759 = _1835;
            if (!_1831)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1837 = _1719;
            _1721 = _1837;
            if (!_1831)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1839 = _1725;
            _1727 = _1839;
            if (!_1831)
            {
                _1693 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1841 = _1693;
            _1695 = _1841;
            if (!_1831)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1843 = _1731;
            bool _1845 = !_1831;
            _1733 = _1843;
            if (!_1845)
            {
                bool _1847 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1849 = isnan(_936);
                bool _1851 = _1847 || _1849;
                bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1855 = _1851 || _1853;
                if (!_1855)
                {
                    float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1859 = _936 + _1857;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1861;
                    float _1865 = 1.0 / _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1873 = _1871 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1887 = _1859 * _1865;
                    float _1889 = precise::clamp(_1887, 0.0, 1.0);
                    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1895 = fma(_1889, _1869, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1897 = fma(_1889, _1893, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1899 = fma(_1889, _1873, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1901 = fma(_1889, _1877, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1903 = fma(_1889, _1881, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1905 = fma(_1889, _1885, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1895;
                    _1695 = _1903;
                    _1715 = _1897;
                    _1727 = _1901;
                    _1721 = _1899;
                    _1733 = _1905;
                    _1821 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1695 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1821 = false;
    float _1907 = _1759;
    float _1909 = _1695;
    float _1911 = _1715;
    float _1913 = _1727;
    float _1915 = _1721;
    float _1917 = _1733;
    float _1919 = fma(_1709, -0.5, 0.5);
    float _1921 = precise::clamp(_1919, 0.0, 1.0);
    float _1923 = -_1907;
    float _1925 = _1923 + _1909;
    float _1927 = -_1911;
    float _1929 = _1927 + _1913;
    float _1931 = -_1915;
    float _1933 = _1931 + _1917;
    bool _1935 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1937 = fma(_1921, _1925, _1907);
    float _1939 = fma(_1921, _1929, _1911);
    float _1941 = fma(_1921, _1933, _1915);
    float _1943 = _1937 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1945 = fma(_1939, 0.298911988735198974609375, _1943);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1947 = fma(_1941, 0.114477999508380889892578125, _1945);
    out.m_49.x = 1.0;
    float _1949 = -_1947;
    float _1951 = _1939 + _1949;
    float _1953 = -_1947;
    float _1955 = _1937 + _1953;
    float _1957 = -_1947;
    float _1959 = _1941 + _1957;
    float _1961 = fma(_1951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    float _1963 = fma(_1955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    float _1965 = fma(_1959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    out.m_87.x = _1961;
    out.m_87.y = _1963;
    out.m_87.z = _1965;
    if (!_1935)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1967 = -_908;
    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1971 = -_910;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1975 = -_912;
    float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1979 = _1969 * _1969;
    float _1981 = fma(_1973, _1973, _1979);
    float _1983 = fma(_1977, _1977, _1981);
    float _1985 = sqrt(_1983);
    float _1987 = rsqrt(_1983);
    float _1989 = -_1985;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1993 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1973 * _1987;
    float _1999 = _1969 * _1987;
    float _2001 = abs(_1995);
    float _2003 = log2(_2001);
    float _2005 = _1977 * _1987;
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2009 = _1709 * _1999;
    float _2011 = -_1999;
    float _2013 = -_2007;
    float _2015 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2013);
    float _2017 = fma(_1705, _1997, _2009);
    float _2019 = -_2005;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2015);
    float _2023 = fma(_1711, _2005, _2017);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2029 = _2021 + _2027;
    float _2031 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2033 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = exp2(_2031);
    float _2039 = _2037 * _2035;
    float _2041 = _2025 * _2039;
    float _2043 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2047 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2043;
    out.m_83.y = _2045;
    out.m_83.z = _2047;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1821 = false;
    bool _472 = false;
    bool _304 = false;
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
        float _2104 = as_type<float>(_122);
        out.gl_Position.z = _2104;
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
        float _2174 = as_type<float>(_160);
        out.gl_Position.z = _2174;
    }
    if (_152)
    {
        return out;
    }
    float _162 = in.m_53.w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_51.x;
    float _178 = in.m_51.y;
    float _180 = in.m_51.z;
    float _182 = in.m_46.x;
    float _184 = in.m_46.y;
    float _186 = in.m_46.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_55.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _312 + _330;
    bool _334 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_312);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _356 = isnan(_312);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_328;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _348;
    float _372 = _364 * _368;
    float _374 = -_364;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _384 = 1.0 / _352;
    float _386 = _344 * _376;
    float _388 = -_344;
    float _390 = _388 + 1.0;
    float _392 = _316 * _370;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = fma(_380, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = fma(_396, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = fma(_400, _392, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _332 * _384;
    float _410 = _402 * _386;
    float _412 = _404 * _386;
    float _414 = _406 * _386;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _410);
    float _430 = fma(_418, _408, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _432 = fma(_422, _408, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _436 = fma(_426, _408, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _440 = fma(_430, _372, _428);
    float _442 = fma(_432, _372, _434);
    float _444 = fma(_436, _372, _438);
    float _446 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].x, _440);
    float _448 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].y, _442);
    float _450 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].z, _444);
    bool _452 = !_382;
    float _470;
    if (!_452)
    {
        float _454 = in.m_55.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_106);
        float _476 = 1.0 / _474;
        float _478 = _140 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _488 = in.m_55.z;
    float _490 = in.m_55.w;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _498 = _496 != 0;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _508 = in.m_55.x;
    float _510 = in.m_55.y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _514 = _390;
    if (!_494)
    {
        float _516 = in.m_55.z;
        _514 = _516;
    }
    float _518 = _514;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _522 = -_482;
    float _524 = _522 + 1.0;
    bool _526 = _488 > 0.5;
    int _528 = _526 ? as_type<int>(_524) : as_type<int>(_482);
    float _530 = _448 * _502;
    float _532 = _498 ? as_type<float>(_528) : _482;
    float _534 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _538 = _490 > 0.5;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _542 = fma(_534, _532, -0.5);
    float _544 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _546 = _534;
    float _548 = _530;
    float _550 = _518;
    float _552 = _482;
    if (!_494)
    {
        _546 = _510;
    }
    float _554 = _546;
    float _556 = _554;
    if (_494)
    {
        _556 = _508;
    }
    float _558 = _556;
    float _560 = _544 * _484;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _572 = _570 != 0;
    float _574 = _560;
    if (!_494)
    {
        _548 = _518;
    }
    float _576 = _548;
    float _578 = -_560;
    float _580 = _578 + 1.0;
    float _582 = _576;
    if (_494)
    {
        _582 = _510;
    }
    float _584 = _582;
    float _586 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[83].z, _540);
    float _588 = _558 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_494)
    {
        _550 = _510;
    }
    float _590 = _550;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _594 = _538 ? as_type<int>(_580) : as_type<int>(_560);
    float _596 = -_512;
    float _598 = fma(_588, 2.0, _596);
    float _600 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _520);
    bool _602 = !_564;
    float _604 = _602 ? _560 : as_type<float>(_594);
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _608 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _586);
    float _610 = -_140;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[81].x, _598);
    float _614 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _600);
    float _616 = fma(_606, -2.0, _592);
    float _618 = fma(_536, _604, -0.5);
    float _620 = fma(_608, _542, _612);
    float _622 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _616);
    float _624 = -_622;
    float _626 = fma(_614, _618, _624);
    float _628 = _620 + 0.5;
    float _630 = _626 + 0.5;
    float2 _2931 = float2(_628, _630);
    float _632 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2931, float2(0.0), isnan(_2931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2931, float2(0.0), isnan(_2931)), level(0.0)).w;
    float _634 = fma(_140, -0.004999999888241291046142578125, _524);
    float _636 = -_484;
    float _638 = _636 + 1.0;
    float _640 = _634 * 43.9822998046875;
    float _642 = fma(_140, 0.004999999888241291046142578125, _524);
    float _644 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = in.m_59.z;
    float _648 = _640 * 0.15915493667125701904296875;
    float _650 = _642 * 31.415927886962890625;
    float _652 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _644);
    float _654 = in.m_59.x;
    float _656 = _650 * 0.15915493667125701904296875;
    float _658 = _648 * 6.283185482025146484375;
    float _660 = sin(_658);
    bool _662 = _508 > 0.5;
    float _664 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _652);
    float _666 = in.m_59.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = _662 ? as_type<int>(_524) : as_type<int>(_482);
    float _674 = _656 * 6.283185482025146484375;
    float _676 = sin(_674);
    bool _678 = _510 > 0.5;
    float _680 = _670 ? as_type<float>(_672) : _482;
    if (_568)
    {
        float _682 = _678 ? _524 : _482;
        _552 = _682;
    }
    float _684 = _552;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _688 = _686 != 0;
    float _690 = rsqrt(_664);
    float _692 = _660 * 0.4000000059604644775390625;
    int _694 = _678 ? as_type<int>(_580) : as_type<int>(_560);
    float _696 = fma(_676, 0.300000011920928955078125, _692);
    bool _698 = !_688;
    float _700 = _698 ? _560 : as_type<float>(_694);
    float _702 = sqrt(_664);
    float _704 = _646;
    if (_572)
    {
        float _706 = _526 ? _580 : _560;
        _574 = _706;
    }
    float _708 = _574;
    float _710 = _140 + _696;
    float _712 = _710 * _690;
    float _714 = _446 * _500;
    float _716 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _718 = _450 * _504;
    float _720 = fma(_712, -0.300000011920928955078125, _638);
    float _722 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _724 = _702 * _720;
    float _726 = fma(_712, -0.4000000059604644775390625, _638);
    float _728 = _646 * _646;
    float _730 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _732 = _724 * 1.14999997615814208984375;
    float _734 = _702 * _726;
    float _736 = fma(_654, _654, _728);
    float _738 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _740 = _732 * 0.15915493667125701904296875;
    float _742 = _734 * 1.89999997615814208984375;
    float _744 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _746 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _738);
    float _748 = _740 * 6.283185482025146484375;
    float _750 = sin(_748);
    float _752 = _742 * 0.15915493667125701904296875;
    float _754 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _744);
    float _756 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _758 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _754);
    float _760 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _762 = _752 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = rsqrt(_736);
    float _770 = _750 * 0.07999999821186065673828125;
    float _772 = fma(_764, 0.100000001490116119384765625, _770);
    float _774 = _772 + _632;
    float _776 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _778 = _768 * _774;
    float _780 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _782 = _654 * _778;
    float _784 = _646 * _778;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _788 = _782 + _654;
    float _790 = _784 + _646;
    float _792 = _544 * _786;
    float _794 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _790);
    float _798 = _776 * _794;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = _780 * _796;
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _806 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].x, _804);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[10].z, _808);
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[8].z, _810);
    float _816 = _766 + _812;
    float _818 = _806 + _814;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _822 = _816 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _826 = _818 + _824;
    float _828 = _822 * _822;
    float _830 = fma(_826, _826, _828);
    float _832 = _792 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _834 = sqrt(_830);
    float _836 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].x, _832);
    float _838 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[9].z, _836);
    float _840 = _760 + _838;
    bool _842 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _760;
    float _846 = _818;
    float _848 = _838;
    float _850 = _792;
    float _852 = _718;
    float _854 = _830;
    float _856 = _782;
    if (!_842)
    {
        _844 = _818;
    }
    float _858 = _844;
    float _860 = _858;
    if (!_842)
    {
        _846 = _816;
    }
    float _862 = _846;
    float _864 = _862;
    if (!_842)
    {
        _848 = _840;
    }
    float _866 = _848;
    bool _868 = !_842;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _834 + _874;
        float _878 = rsqrt(_830);
        float _880 = _876 * _872;
        float _882 = _840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_840, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_826, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_822, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _870 = _900;
        _860 = _904;
        _864 = _906;
    }
    float _908 = _870;
    float _910 = _860;
    float _912 = _864;
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = _908 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _920 = _910 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _924 = _912 + _922;
    float _926 = _916 * _916;
    float _928 = fma(_920, _920, _926);
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _932 = fma(_924, _924, _928);
    float _934 = rsqrt(_932);
    float _936 = sqrt(_932);
    float _938 = _934 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _940 = _920 * _938;
    float _942 = _924 * _938;
    float _944 = _940 * _940;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _950 + _954;
    float _958 = _934;
    float _960 = _948;
    float _962 = _956;
    float _964 = _916;
    float _966 = _940;
    if (_952)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _968;
    }
    float _970 = _958;
    if (_952)
    {
        float _972 = rsqrt(_948);
        _960 = _972;
    }
    float _974 = _960;
    if (_952)
    {
        float _976 = _956 * _970;
        _962 = _976;
    }
    float _978 = _962;
    if (_952)
    {
        float _980 = _978 * 0.15915493667125701904296875;
        _850 = _980;
    }
    float _982 = _850;
    float _984 = _924;
    if (_952)
    {
        float _986 = _982 * 6.283185482025146484375;
        float _988 = sin(_986);
        _984 = _988;
    }
    float _990 = _984;
    float _992 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _994 = precise::max(0.0, _992);
    float _996 = _970;
    float _998 = _994;
    if (_952)
    {
        float _1000 = _982 * 6.283185482025146484375;
        float _1002 = cos(_1000);
        _996 = _1002;
    }
    float _1004 = _996;
    float _1006 = -_938;
    float _1008 = -_994;
    float _1010 = fma(_916, _1006, _1008);
    if (_952)
    {
        float _1012 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _1012;
    }
    float _1014 = _964;
    float _1016 = _990;
    float _1018 = _1014;
    if (_952)
    {
        float _1020 = fma(_990, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1016 = _1020;
    }
    float _1022 = _1016;
    float _1024 = _1022;
    if (!_952)
    {
        _1018 = _944;
    }
    float _1026 = _1018;
    float _1028 = _1026;
    float _1030 = _1004;
    if (_952)
    {
        float _1032 = _1004 + (-1.0);
        _998 = _1032;
    }
    float _1034 = _998;
    float _1036 = _1034;
    if (_952)
    {
        float _1038 = _974 * _1022;
        _852 = _1038;
    }
    float _1040 = _852;
    if (!_952)
    {
        _1024 = _1010;
    }
    float _1042 = _1024;
    float _1044 = _1042;
    if (_952)
    {
        float _1046 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _1046;
    }
    float _1048 = _854;
    if (_952)
    {
        float _1050 = _940 * _1040;
        _966 = _1050;
    }
    float _1052 = _966;
    if (!_952)
    {
        _1036 = _942;
    }
    float _1054 = _1036;
    float _1056 = _1054;
    if (_952)
    {
        float _1058 = _942 * _1040;
        _1056 = _1058;
    }
    float _1060 = _1056;
    if (_952)
    {
        float _1062 = fma(_1010, _1004, _1048);
        _1044 = _1062;
    }
    float _1064 = _1044;
    if (_952)
    {
        float _1066 = _1052 * _1052;
        _1028 = _1066;
    }
    float _1068 = _1028;
    if (!_952)
    {
        _1030 = _946;
    }
    float _1070 = _1030;
    float _1072 = _1070;
    if (_952)
    {
        float _1074 = _1060 * _1060;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = _908 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1080 = fma(_1064, _1064, _1068);
    float _1082 = _908 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1084 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1078);
    float _1086 = _1080 + _1076;
    float _1088 = _908 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1092 = fma(_936, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1084);
    float _1098 = rsqrt(_1086);
    float _1100 = _908 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1102 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1104 = -_1094;
    float _1106 = _1104 + 1.0;
    float _1108 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1082);
    float _1110 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1100);
    float _1112 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1102);
    float _1114 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1116 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1118 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1120 = abs(_1106);
    float _1122 = log2(_1120);
    float _1124 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1130 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1132 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1134 = _1098 * _1052;
    float _1136 = _1098 * _1060;
    float _1138 = -_1126;
    float _1140 = fma(_1138, _930, 1.0);
    float _1142 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1132);
    float _1144 = _1098 * _1064;
    float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1142);
    float _1152 = log2(_1140);
    float _1154 = -_1146;
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1160 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1150);
    float _1162 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1148);
    float _1164 = -_1136;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1156);
    float _1168 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1170 = exp2(_1158);
    float _1172 = fma(_1166, -0.5, 0.5);
    float _1174 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1168);
    float _1176 = fma(_1166, 0.5, 0.5);
    float _1178 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1162);
    float _1180 = _1144 + 1.0;
    float _1182 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1174);
    float _1184 = fma(_1176, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1186 = 1.0 / _1160;
    float _1188 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1178);
    float _1190 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1182);
    float _1192 = _1152 * 0.693147182464599609375;
    float _1194 = fma(_1176, _1184, -0.212114393711090087890625);
    float _1196 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1198 = sqrt(_1172);
    float _1200 = -_1144;
    float _1202 = fma(_1170, _1180, _1200);
    float _1204 = fma(_1176, _1194, 1.570728778839111328125);
    float _1206 = fma(_1202, 0.5, 0.5);
    float _1208 = _1190 * _1186;
    float _1210 = _1188 * _1186;
    float _1212 = fma(_1208, 0.5, 0.5);
    float _1214 = fma(_1210, -0.5, 0.5);
    float _1216 = _1198 * 0.636619746685028076171875;
    float3 _3914 = float3(_1212, _1214, _1196);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3914, float3(0.0), isnan(_3914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3914, float3(0.0), isnan(_3914)), level(0.0)).x;
    float _1220 = -_1204;
    float _1222 = fma(_1216, _1220, 1.0);
    float3 _3930 = float3(_1212, _1214, _1196);
    float4 _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3930, float3(0.0), isnan(_3930)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3930, float3(0.0), isnan(_3930)), level(0.0)).xyzw;
    float _1227 = _1225.x;
    float _1229 = _1225.y;
    float _1231 = _1225.z;
    float _1233 = _1225.w;
    float2 _3946 = float2(_1222, _1206);
    float3 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3946, float2(0.0), isnan(_3946)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3946, float2(0.0), isnan(_3946)), level(0.0)).xyz;
    float _1239 = _1237.x;
    float _1241 = _1237.y;
    float _1243 = _1237.z;
    float _1245 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1249 = _480 + _1247;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_61.x = _910;
    out.m_61.y = _908;
    out.m_61.z = _912;
    float _1253 = -_1251;
    float _1255 = fma(_1245, 2.0, _1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1257;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1269 = 1.0 / _1259;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1277 = _480 + _1275;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1281 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = 1.0 / _1267;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1291 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.x = _1281;
    out.m_63.y = _1287;
    out.m_63.z = _1283;
    float _1293 = _1277 * _1269;
    float _1295 = _1269;
    float _1297 = _1188;
    if (_494)
    {
        _1295 = _508;
    }
    float _1299 = _1295;
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1303 = fma(_1291, -2.0, _1271);
    float _1305 = _1299;
    if (!_494)
    {
        _1305 = _488;
    }
    float _1307 = _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1309;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1321 = _1249 * _1285;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1335 = fma(_1311, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1337 = fma(_1329, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1339 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1341 = isnan(_480);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1353 = fma(_1315, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1355 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1357 = fma(_1333, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1359 = -_1349;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1351);
    float _1365 = fma(_680, _1355, -0.5);
    bool _1367 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1369 = isnan(_480);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = fma(_1325, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1381 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1383 = isnan(_480);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_140;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1255);
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1399 = _1377 * _1361;
    float _1401 = -_1377;
    float _1403 = _1401 + 1.0;
    float _1405 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1407 = fma(_1319, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1409 = _1391 * _1403;
    float _1411 = -_1391;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1289);
    float _1417 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1273);
    float _1419 = _1335 * _1409;
    float _1421 = _1379 * _1409;
    float _1423 = _1337 * _1409;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1427 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1363);
    float _1429 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_494)
    {
        _1435 = _510;
    }
    float _1437 = _1435;
    float _1439 = fma(_1429, _684, -0.5);
    float _1441 = -_1431;
    float _1443 = fma(_1405, 2.0, _1441);
    float _1445 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1433);
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1449 = _1437;
    if (!_494)
    {
        _1449 = _508;
    }
    float _1451 = _1449;
    float _1453 = -_140;
    float _1455 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1443);
    float _1457 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1445);
    bool _1459 = _666 != 0.0;
    bool _1461 = isnan(_666);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan(0.0);
    bool _1467 = _1463 || _1465;
    float _1469 = fma(_1427, _1365, _1395);
    float _1471 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1473 = fma(_1457, _1439, _1455);
    float _1475 = -_654;
    bool _1477 = _782 == _1475;
    bool _1479 = !_1467;
    bool _1481 = _1477 && _1479;
    float _1483 = in.m_65.z;
    float _1485 = fma(_1471, _708, -0.5);
    float _1487 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1303);
    float _1489 = -_646;
    bool _1491 = _784 == _1489;
    bool _1493 = _1491 && _1481;
    float _1495 = in.m_65.y;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1499 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1501 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1419);
    float _1503 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1421);
    float _1505 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1423);
    float _1507 = fma(_700, _1499, -0.5);
    float _1509 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1511 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1415);
    float _1513 = fma(_1353, _1399, _1501);
    float _1515 = fma(_1357, _1399, _1503);
    float _1517 = fma(_1509, -2.0, _1497);
    float _1519 = fma(_1407, _1399, _1505);
    float _1521 = -_1487;
    float _1523 = fma(_1511, _1507, _1521);
    float _1525 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1417);
    float _1527 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1517);
    float _1529 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1513);
    float _1531 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1515);
    float _1533 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1519);
    float _1535 = in.m_65.x;
    float _1537 = _784 + _1483;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1541 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1545 = as_type<int>(_1483);
    int _1547 = as_type<int>(_1527);
    if (_1493)
    {
        _704 = _1495;
    }
    float _1549 = _704;
    float _1551 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1537);
    float _1553 = -_1527;
    float _1555 = fma(_1525, _1485, _1553);
    float _1557 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1549;
    if (_1493)
    {
        _142 = _1549;
    }
    float _1561 = _142;
    float _1563 = _1561;
    if (_1493)
    {
        float _1565 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1545 = as_type<int>(_1565);
    }
    int _1567 = _1545;
    int _1569 = _1567;
    if (!_1493)
    {
        _1559 = _1495;
    }
    float _1571 = _1559;
    float _1573 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1493)
    {
        _1547 = as_type<int>(_1551);
    }
    int _1577 = _1547;
    int _1579 = _1577;
    if (!_1493)
    {
        float _1581 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1569 = as_type<int>(_1581);
    }
    int _1583 = _1569;
    if (!_1493)
    {
        _1579 = as_type<int>(_1551);
    }
    int _1585 = _1579;
    out.m_67.x = _1557;
    out.m_67.y = _1573;
    out.m_67.z = _1575;
    bool _1587 = !_1493;
    float _1589 = _1587 ? as_type<float>(_1583) : _1571;
    float _1591 = _1473 + 0.5;
    float _1593 = _1493 ? _1537 : as_type<float>(_1585);
    float _1595 = _782 + _1535;
    float _1597 = _1595;
    if (!_1493)
    {
        _1563 = as_type<float>(_1583);
    }
    float _1599 = _1563;
    float _1601 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1603 = _1469 + 0.5;
    if (!_1493)
    {
        float _1605 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1595);
        _1597 = _1605;
    }
    float _1607 = _1597;
    float _1609 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1611 = _1589 * _1589;
    float _1613 = exp2(_1601);
    float _1615 = _1523 + 0.5;
    float _1617 = fma(_1593, _1593, _1611);
    float _1619 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    out.m_69.x = _1603;
    out.m_69.y = _1615;
    out.m_69.z = _628;
    out.m_69.w = _630;
    if (_1493)
    {
        _856 = _1537;
    }
    float _1621 = _856;
    float _1623 = rsqrt(_1617);
    float _1625 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1619);
    out.m_71.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_71.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_71.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1627 = _1621;
    if (!_1493)
    {
        _1627 = _1551;
    }
    float _1629 = _1627;
    float _1631 = _1555 + 0.5;
    float _1633 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1625);
    float _1635 = -_1613;
    float _1637 = _1635 + 1.0;
    bool _1639 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1641 = isnan(_936);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1647 = _1643 || _1645;
    out.m_73.x = _1591;
    out.m_73.y = _1631;
    float _1649 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1651 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.gl_Position.x = _1190;
    out.gl_Position.y = _1188;
    out.gl_Position.z = _1633;
    out.gl_Position.w = _1160;
    float _1653 = _1589 * _1623;
    float _1655 = _1593 * _1623;
    float _1657 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1651);
    float _1659 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1661 = _1653 * _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1665 = _1653 * _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1669 = _1653 * _1667;
    float _1671 = _1651;
    float _1673 = _1633;
    float _1675 = _1190;
    if (!_1647)
    {
        _1671 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1677 = _1671;
    float _1679 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1661);
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1665);
    float _1683 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1687 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1669);
    float _1689 = _1685;
    float _1691 = _1679;
    float _1693 = _1677;
    float _1695 = _1677;
    if (!_1647)
    {
        _1297 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1697 = _1297;
    float _1699 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1701 = _1633 + _1160;
    float _1703 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1685);
    out.m_75.x = _1679;
    out.m_75.y = _1681;
    out.m_75.z = _1687;
    float _1705 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1699);
    float _1707 = _1701 * 0.5;
    float _1709 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1657);
    float _1711 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1703);
    float _1713 = _1697;
    float _1715 = _1697;
    if (!_1647)
    {
        _1673 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1717 = _1673;
    out.m_77.z = _1707;
    out.m_77.w = _1160;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1647)
    {
        _1675 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1723 = _1675;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1647)
    {
        _1689 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1729 = _1689;
    out.m_79.x = _1705;
    out.m_79.y = _1709;
    out.m_79.z = _1711;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1647)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1735 = _1691;
    float _1737 = _1649 * _1218;
    float _1739 = -_1649;
    float _1741 = _1739 + 1.0;
    float _1743 = _1233 * _1737;
    float _1745 = _1233 * _1741;
    float _1747 = _1243 * _1737;
    float _1749 = fma(_1239, _1743, _1227);
    float _1751 = fma(_1241, _1743, _1229);
    float _1753 = fma(_1233, _1747, _1231);
    out.m_81.x = _1749;
    out.m_81.y = _1751;
    out.m_81.z = _1753;
    out.m_81.w = _1745;
    bool _1755 = !_1647;
    float _1757 = _1735;
    float _1759 = _1735;
    if (!_1755)
    {
        bool _1761 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1763 = isnan(_936);
        bool _1765 = _1761 || _1763;
        bool _1767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1769 = _1765 || _1767;
        if (!_1769)
        {
            float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1773 = _936 + _1771;
            float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1777 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1775;
            float _1779 = 1.0 / _1777;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1801 = _1773 * _1779;
            float _1803 = precise::clamp(_1801, 0.0, 1.0);
            float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1809 = fma(_1803, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1811 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1813 = fma(_1803, _1787, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1815 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1817 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1819 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1809;
            _1695 = _1817;
            _1715 = _1811;
            _1727 = _1815;
            _1721 = _1813;
            _1733 = _1819;
            _1821 = true;
        }
        else
        {
            bool _1823 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1825 = isnan(_936);
            bool _1827 = _1823 || _1825;
            bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1831 = _1827 || _1829;
            if (!_1831)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1833 = _1713;
            _1715 = _1833;
            if (!_1831)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1835 = _1757;
            _1759 = _1835;
            if (!_1831)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1837 = _1719;
            _1721 = _1837;
            if (!_1831)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1839 = _1725;
            _1727 = _1839;
            if (!_1831)
            {
                _1693 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1841 = _1693;
            _1695 = _1841;
            if (!_1831)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1843 = _1731;
            bool _1845 = !_1831;
            _1733 = _1843;
            if (!_1845)
            {
                bool _1847 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1849 = isnan(_936);
                bool _1851 = _1847 || _1849;
                bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1855 = _1851 || _1853;
                if (!_1855)
                {
                    float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1859 = _936 + _1857;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1861;
                    float _1865 = 1.0 / _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1873 = _1871 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1887 = _1859 * _1865;
                    float _1889 = precise::clamp(_1887, 0.0, 1.0);
                    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1895 = fma(_1889, _1869, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1897 = fma(_1889, _1893, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1899 = fma(_1889, _1873, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1901 = fma(_1889, _1877, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1903 = fma(_1889, _1881, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1905 = fma(_1889, _1885, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1895;
                    _1695 = _1903;
                    _1715 = _1897;
                    _1727 = _1901;
                    _1721 = _1899;
                    _1733 = _1905;
                    _1821 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1695 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1821 = false;
    float _1907 = _1759;
    float _1909 = _1695;
    float _1911 = _1715;
    float _1913 = _1727;
    float _1915 = _1721;
    float _1917 = _1733;
    float _1919 = fma(_1709, -0.5, 0.5);
    float _1921 = precise::clamp(_1919, 0.0, 1.0);
    float _1923 = -_1907;
    float _1925 = _1923 + _1909;
    float _1927 = -_1911;
    float _1929 = _1927 + _1913;
    float _1931 = -_1915;
    float _1933 = _1931 + _1917;
    bool _1935 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1937 = fma(_1921, _1925, _1907);
    float _1939 = fma(_1921, _1929, _1911);
    float _1941 = fma(_1921, _1933, _1915);
    float _1943 = _1937 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1945 = fma(_1939, 0.298911988735198974609375, _1943);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1947 = fma(_1941, 0.114477999508380889892578125, _1945);
    out.m_49.x = 1.0;
    float _1949 = -_1947;
    float _1951 = _1939 + _1949;
    float _1953 = -_1947;
    float _1955 = _1937 + _1953;
    float _1957 = -_1947;
    float _1959 = _1941 + _1957;
    float _1961 = fma(_1951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    float _1963 = fma(_1955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    float _1965 = fma(_1959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    out.m_87.x = _1961;
    out.m_87.y = _1963;
    out.m_87.z = _1965;
    if (!_1935)
    {
        return out;
    }
    float _1967 = -_908;
    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1971 = -_910;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1975 = -_912;
    float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1979 = _1969 * _1969;
    float _1981 = fma(_1973, _1973, _1979);
    float _1983 = fma(_1977, _1977, _1981);
    float _1985 = sqrt(_1983);
    float _1987 = rsqrt(_1983);
    float _1989 = -_1985;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1993 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1973 * _1987;
    float _1999 = _1969 * _1987;
    float _2001 = abs(_1995);
    float _2003 = log2(_2001);
    float _2005 = _1977 * _1987;
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2009 = _1709 * _1999;
    float _2011 = -_1999;
    float _2013 = -_2007;
    float _2015 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2013);
    float _2017 = fma(_1705, _1997, _2009);
    float _2019 = -_2005;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2015);
    float _2023 = fma(_1711, _2005, _2017);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2029 = _2021 + _2027;
    float _2031 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2033 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = exp2(_2031);
    float _2039 = _2037 * _2035;
    float _2041 = _2025 * _2039;
    float _2043 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2047 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2043;
    out.m_83.y = _2045;
    out.m_83.z = _2047;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1821 = false;
    bool _472 = false;
    bool _304 = false;
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
        float _2104 = as_type<float>(_122);
        out.gl_Position.z = _2104;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2174 = as_type<float>(_160);
        out.gl_Position.z = _2174;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_53.w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_51.x;
    float _178 = in.m_51.y;
    float _180 = in.m_51.z;
    float _182 = in.m_46.x;
    float _184 = in.m_46.y;
    float _186 = in.m_46.z;
    float _188 = 0.0;
    float _190 = _164;
    if (!_174)
    {
        float _192 = _164 * _164;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = _196;
    if (!_174)
    {
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _200;
    }
    float _202 = _198;
    bool _204 = !_174;
    float _206 = _202;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_174;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _164 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _190 = _260;
    }
    float _262 = _190;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _266 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _268 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _270 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _272 = fma(_262, _176, _266);
    float _274 = fma(_262, _178, _268);
    float _276 = fma(_262, _180, _270);
    float _278 = fma(_272, _162, _182);
    float _280 = fma(_274, _162, _184);
    float _282 = fma(_276, _162, _186);
    bool _284 = !_264;
    float _302;
    if (!_284)
    {
        float _286 = in.m_55.x;
        float _288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _290 = _286 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _292 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _294 = _292 * _288;
        float _296 = floor(_294);
        float _298 = -_296;
        float _300 = _294 + _298;
        _302 = _300;
        _304 = true;
    }
    else
    {
        float _306 = float(_106);
        float _308 = 1.0 / _306;
        float _310 = _140 * _308;
        _302 = _310;
    }
    _304 = false;
    float _312 = _302;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = _312 + _314;
    bool _318 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _320 = isnan(_312);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _312 + _330;
    bool _334 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _336 = isnan(_312);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _356 = isnan(_312);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_328;
    float _368 = _366 + 1.0;
    float _370 = 1.0 / _348;
    float _372 = _364 * _368;
    float _374 = -_364;
    float _376 = _374 + 1.0;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _378;
    bool _382 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _384 = 1.0 / _352;
    float _386 = _344 * _376;
    float _388 = -_344;
    float _390 = _388 + 1.0;
    float _392 = _316 * _370;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    float _402 = fma(_380, _392, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = fma(_396, _392, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = fma(_400, _392, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _408 = _332 * _384;
    float _410 = _402 * _386;
    float _412 = _404 * _386;
    float _414 = _406 * _386;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].x, _410);
    float _430 = fma(_418, _408, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _432 = fma(_422, _408, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _434 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].y, _412);
    float _436 = fma(_426, _408, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _438 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _440 = fma(_430, _372, _428);
    float _442 = fma(_432, _372, _434);
    float _444 = fma(_436, _372, _438);
    float _446 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].x, _440);
    float _448 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].y, _442);
    float _450 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[145].z, _444);
    bool _452 = !_382;
    float _470;
    if (!_452)
    {
        float _454 = in.m_55.x;
        float _456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _458 = _454 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _460 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _462 = _460 * _456;
        float _464 = floor(_462);
        float _466 = -_464;
        float _468 = _462 + _466;
        _470 = _468;
        _472 = true;
    }
    else
    {
        float _474 = float(_106);
        float _476 = 1.0 / _474;
        float _478 = _140 * _476;
        _470 = _478;
    }
    _472 = false;
    float _480 = _470;
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _488 = in.m_55.z;
    float _490 = in.m_55.w;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _498 = _496 != 0;
    float _500 = in.m_53.x;
    float _502 = in.m_53.y;
    float _504 = in.m_53.z;
    float _506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _508 = in.m_55.x;
    float _510 = in.m_55.y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _514 = _390;
    if (!_494)
    {
        float _516 = in.m_55.z;
        _514 = _516;
    }
    float _518 = _514;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _522 = -_482;
    float _524 = _522 + 1.0;
    bool _526 = _488 > 0.5;
    int _528 = _526 ? as_type<int>(_524) : as_type<int>(_482);
    float _530 = _448 * _502;
    float _532 = _498 ? as_type<float>(_528) : _482;
    float _534 = _486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _536 = _506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _538 = _490 > 0.5;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _542 = fma(_534, _532, -0.5);
    float _544 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _546 = _534;
    float _548 = _530;
    float _550 = _518;
    float _552 = _482;
    if (!_494)
    {
        _546 = _510;
    }
    float _554 = _546;
    float _556 = _554;
    if (_494)
    {
        _556 = _508;
    }
    float _558 = _556;
    float _560 = _544 * _484;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _572 = _570 != 0;
    float _574 = _560;
    if (!_494)
    {
        _548 = _518;
    }
    float _576 = _548;
    float _578 = -_560;
    float _580 = _578 + 1.0;
    float _582 = _576;
    if (_494)
    {
        _582 = _510;
    }
    float _584 = _582;
    float _586 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[83].z, _540);
    float _588 = _558 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_494)
    {
        _550 = _510;
    }
    float _590 = _550;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _594 = _538 ? as_type<int>(_580) : as_type<int>(_560);
    float _596 = -_512;
    float _598 = fma(_588, 2.0, _596);
    float _600 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[83].w, _520);
    bool _602 = !_564;
    float _604 = _602 ? _560 : as_type<float>(_594);
    float _606 = _584 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _608 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _586);
    float _610 = -_140;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[81].x, _598);
    float _614 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _600);
    float _616 = fma(_606, -2.0, _592);
    float _618 = fma(_536, _604, -0.5);
    float _620 = fma(_608, _542, _612);
    float _622 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _616);
    float _624 = -_622;
    float _626 = fma(_614, _618, _624);
    float _628 = _620 + 0.5;
    float _630 = _626 + 0.5;
    float2 _2931 = float2(_628, _630);
    float _632 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_2931, float2(0.0), isnan(_2931)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_2931, float2(0.0), isnan(_2931)), level(0.0)).w;
    float _634 = fma(_140, -0.004999999888241291046142578125, _524);
    float _636 = -_484;
    float _638 = _636 + 1.0;
    float _640 = _634 * 43.9822998046875;
    float _642 = fma(_140, 0.004999999888241291046142578125, _524);
    float _644 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _646 = in.m_59.z;
    float _648 = _640 * 0.15915493667125701904296875;
    float _650 = _642 * 31.415927886962890625;
    float _652 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _644);
    float _654 = in.m_59.x;
    float _656 = _650 * 0.15915493667125701904296875;
    float _658 = _648 * 6.283185482025146484375;
    float _660 = sin(_658);
    bool _662 = _508 > 0.5;
    float _664 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _652);
    float _666 = in.m_59.y;
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _670 = _668 != 0;
    int _672 = _662 ? as_type<int>(_524) : as_type<int>(_482);
    float _674 = _656 * 6.283185482025146484375;
    float _676 = sin(_674);
    bool _678 = _510 > 0.5;
    float _680 = _670 ? as_type<float>(_672) : _482;
    if (_568)
    {
        float _682 = _678 ? _524 : _482;
        _552 = _682;
    }
    float _684 = _552;
    int _686 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _688 = _686 != 0;
    float _690 = rsqrt(_664);
    float _692 = _660 * 0.4000000059604644775390625;
    int _694 = _678 ? as_type<int>(_580) : as_type<int>(_560);
    float _696 = fma(_676, 0.300000011920928955078125, _692);
    bool _698 = !_688;
    float _700 = _698 ? _560 : as_type<float>(_694);
    float _702 = sqrt(_664);
    float _704 = _646;
    if (_572)
    {
        float _706 = _526 ? _580 : _560;
        _574 = _706;
    }
    float _708 = _574;
    float _710 = _140 + _696;
    float _712 = _710 * _690;
    float _714 = _446 * _500;
    float _716 = _280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _718 = _450 * _504;
    float _720 = fma(_712, -0.300000011920928955078125, _638);
    float _722 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _716);
    float _724 = _702 * _720;
    float _726 = fma(_712, -0.4000000059604644775390625, _638);
    float _728 = _646 * _646;
    float _730 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _722);
    float _732 = _724 * 1.14999997615814208984375;
    float _734 = _702 * _726;
    float _736 = fma(_654, _654, _728);
    float _738 = _280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _740 = _732 * 0.15915493667125701904296875;
    float _742 = _734 * 1.89999997615814208984375;
    float _744 = _280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _746 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _738);
    float _748 = _740 * 6.283185482025146484375;
    float _750 = sin(_748);
    float _752 = _742 * 0.15915493667125701904296875;
    float _754 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _744);
    float _756 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _758 = fma(_282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _754);
    float _760 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _762 = _752 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = rsqrt(_736);
    float _770 = _750 * 0.07999999821186065673828125;
    float _772 = fma(_764, 0.100000001490116119384765625, _770);
    float _774 = _772 + _632;
    float _776 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _778 = _768 * _774;
    float _780 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _782 = _654 * _778;
    float _784 = _646 * _778;
    float _786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _788 = _782 + _654;
    float _790 = _784 + _646;
    float _792 = _544 * _786;
    float _794 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _788);
    float _796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _790);
    float _798 = _776 * _794;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _802 = _780 * _796;
    float _804 = _792 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _806 = _730 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _800);
    float _810 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].x, _804);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[10].z, _808);
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[8].z, _810);
    float _816 = _766 + _812;
    float _818 = _806 + _814;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _822 = _816 + _820;
    float _824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _826 = _818 + _824;
    float _828 = _822 * _822;
    float _830 = fma(_826, _826, _828);
    float _832 = _792 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _834 = sqrt(_830);
    float _836 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].x, _832);
    float _838 = fma(_802, (*spvDescriptorSet0.vp_c10)._m0[9].z, _836);
    float _840 = _760 + _838;
    bool _842 = _834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = _760;
    float _846 = _818;
    float _848 = _838;
    float _850 = _792;
    float _852 = _718;
    float _854 = _830;
    float _856 = _782;
    if (!_842)
    {
        _844 = _818;
    }
    float _858 = _844;
    float _860 = _858;
    if (!_842)
    {
        _846 = _816;
    }
    float _862 = _846;
    float _864 = _862;
    if (!_842)
    {
        _848 = _840;
    }
    float _866 = _848;
    bool _868 = !_842;
    float _870 = _866;
    if (!_868)
    {
        float _872 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _874 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _876 = _834 + _874;
        float _878 = rsqrt(_830);
        float _880 = _876 * _872;
        float _882 = _840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = _880 * 0.15915493667125701904296875;
        float _886 = _884 * 6.283185482025146484375;
        float _888 = cos(_886);
        float _890 = _884 * 6.283185482025146484375;
        float _892 = sin(_890);
        float _894 = _888 + (-1.0);
        float _896 = _894 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = fma(_892, _882, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _900 = fma(_840, _888, _896);
        float _902 = _878 * _898;
        float _904 = fma(_826, _902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _906 = fma(_822, _902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _870 = _900;
        _860 = _904;
        _864 = _906;
    }
    float _908 = _870;
    float _910 = _860;
    float _912 = _864;
    float _914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _916 = _908 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _920 = _910 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _924 = _912 + _922;
    float _926 = _916 * _916;
    float _928 = fma(_920, _920, _926);
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _932 = fma(_924, _924, _928);
    float _934 = rsqrt(_932);
    float _936 = sqrt(_932);
    float _938 = _934 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _940 = _920 * _938;
    float _942 = _924 * _938;
    float _944 = _940 * _940;
    float _946 = _942 * _942;
    float _948 = _944 + _946;
    float _950 = sqrt(_948);
    bool _952 = _950 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _954 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _956 = _950 + _954;
    float _958 = _934;
    float _960 = _948;
    float _962 = _956;
    float _964 = _916;
    float _966 = _940;
    if (_952)
    {
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _958 = _968;
    }
    float _970 = _958;
    if (_952)
    {
        float _972 = rsqrt(_948);
        _960 = _972;
    }
    float _974 = _960;
    if (_952)
    {
        float _976 = _956 * _970;
        _962 = _976;
    }
    float _978 = _962;
    if (_952)
    {
        float _980 = _978 * 0.15915493667125701904296875;
        _850 = _980;
    }
    float _982 = _850;
    float _984 = _924;
    if (_952)
    {
        float _986 = _982 * 6.283185482025146484375;
        float _988 = sin(_986);
        _984 = _988;
    }
    float _990 = _984;
    float _992 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _994 = precise::max(0.0, _992);
    float _996 = _970;
    float _998 = _994;
    if (_952)
    {
        float _1000 = _982 * 6.283185482025146484375;
        float _1002 = cos(_1000);
        _996 = _1002;
    }
    float _1004 = _996;
    float _1006 = -_938;
    float _1008 = -_994;
    float _1010 = fma(_916, _1006, _1008);
    if (_952)
    {
        float _1012 = _1010 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _964 = _1012;
    }
    float _1014 = _964;
    float _1016 = _990;
    float _1018 = _1014;
    if (_952)
    {
        float _1020 = fma(_990, _1014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1016 = _1020;
    }
    float _1022 = _1016;
    float _1024 = _1022;
    if (!_952)
    {
        _1018 = _944;
    }
    float _1026 = _1018;
    float _1028 = _1026;
    float _1030 = _1004;
    if (_952)
    {
        float _1032 = _1004 + (-1.0);
        _998 = _1032;
    }
    float _1034 = _998;
    float _1036 = _1034;
    if (_952)
    {
        float _1038 = _974 * _1022;
        _852 = _1038;
    }
    float _1040 = _852;
    if (!_952)
    {
        _1024 = _1010;
    }
    float _1042 = _1024;
    float _1044 = _1042;
    if (_952)
    {
        float _1046 = _1034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _1046;
    }
    float _1048 = _854;
    if (_952)
    {
        float _1050 = _940 * _1040;
        _966 = _1050;
    }
    float _1052 = _966;
    if (!_952)
    {
        _1036 = _942;
    }
    float _1054 = _1036;
    float _1056 = _1054;
    if (_952)
    {
        float _1058 = _942 * _1040;
        _1056 = _1058;
    }
    float _1060 = _1056;
    if (_952)
    {
        float _1062 = fma(_1010, _1004, _1048);
        _1044 = _1062;
    }
    float _1064 = _1044;
    if (_952)
    {
        float _1066 = _1052 * _1052;
        _1028 = _1066;
    }
    float _1068 = _1028;
    if (!_952)
    {
        _1030 = _946;
    }
    float _1070 = _1030;
    float _1072 = _1070;
    if (_952)
    {
        float _1074 = _1060 * _1060;
        _1072 = _1074;
    }
    float _1076 = _1072;
    float _1078 = _908 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1080 = fma(_1064, _1064, _1068);
    float _1082 = _908 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1084 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1078);
    float _1086 = _1080 + _1076;
    float _1088 = _908 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1092 = fma(_936, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1090);
    float _1094 = precise::clamp(_1092, 0.0, 1.0);
    float _1096 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1084);
    float _1098 = rsqrt(_1086);
    float _1100 = _908 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1102 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1088);
    float _1104 = -_1094;
    float _1106 = _1104 + 1.0;
    float _1108 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1082);
    float _1110 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1100);
    float _1112 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1102);
    float _1114 = _1096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1116 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1108);
    float _1118 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1110);
    float _1120 = abs(_1106);
    float _1122 = log2(_1120);
    float _1124 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1126 = _1114 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1128 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1130 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1132 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1134 = _1098 * _1052;
    float _1136 = _1098 * _1060;
    float _1138 = -_1126;
    float _1140 = fma(_1138, _930, 1.0);
    float _1142 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1132);
    float _1144 = _1098 * _1064;
    float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1150 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1142);
    float _1152 = log2(_1140);
    float _1154 = -_1146;
    float _1156 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1154);
    float _1158 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1160 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1150);
    float _1162 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1148);
    float _1164 = -_1136;
    float _1166 = fma(_1164, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1156);
    float _1168 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1170 = exp2(_1158);
    float _1172 = fma(_1166, -0.5, 0.5);
    float _1174 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1168);
    float _1176 = fma(_1166, 0.5, 0.5);
    float _1178 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1162);
    float _1180 = _1144 + 1.0;
    float _1182 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1174);
    float _1184 = fma(_1176, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1186 = 1.0 / _1160;
    float _1188 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1178);
    float _1190 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1182);
    float _1192 = _1152 * 0.693147182464599609375;
    float _1194 = fma(_1176, _1184, -0.212114393711090087890625);
    float _1196 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1198 = sqrt(_1172);
    float _1200 = -_1144;
    float _1202 = fma(_1170, _1180, _1200);
    float _1204 = fma(_1176, _1194, 1.570728778839111328125);
    float _1206 = fma(_1202, 0.5, 0.5);
    float _1208 = _1190 * _1186;
    float _1210 = _1188 * _1186;
    float _1212 = fma(_1208, 0.5, 0.5);
    float _1214 = fma(_1210, -0.5, 0.5);
    float _1216 = _1198 * 0.636619746685028076171875;
    float3 _3914 = float3(_1212, _1214, _1196);
    float _1218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3914, float3(0.0), isnan(_3914)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3914, float3(0.0), isnan(_3914)), level(0.0)).x;
    float _1220 = -_1204;
    float _1222 = fma(_1216, _1220, 1.0);
    float3 _3930 = float3(_1212, _1214, _1196);
    float4 _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3930, float3(0.0), isnan(_3930)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3930, float3(0.0), isnan(_3930)), level(0.0)).xyzw;
    float _1227 = _1225.x;
    float _1229 = _1225.y;
    float _1231 = _1225.z;
    float _1233 = _1225.w;
    float2 _3946 = float2(_1222, _1206);
    float3 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3946, float2(0.0), isnan(_3946)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3946, float2(0.0), isnan(_3946)), level(0.0)).xyz;
    float _1239 = _1237.x;
    float _1241 = _1237.y;
    float _1243 = _1237.z;
    float _1245 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1249 = _480 + _1247;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_61.x = _910;
    out.m_61.y = _908;
    out.m_61.z = _912;
    float _1253 = -_1251;
    float _1255 = fma(_1245, 2.0, _1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1257;
    float _1261 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1267 = _1265 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1269 = 1.0 / _1259;
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1277 = _480 + _1275;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1281 = _1261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1283 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = 1.0 / _1267;
    float _1287 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1291 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.x = _1281;
    out.m_63.y = _1287;
    out.m_63.z = _1283;
    float _1293 = _1277 * _1269;
    float _1295 = _1269;
    float _1297 = _1188;
    if (_494)
    {
        _1295 = _508;
    }
    float _1299 = _1295;
    float _1301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1303 = fma(_1291, -2.0, _1271);
    float _1305 = _1299;
    if (!_494)
    {
        _1305 = _488;
    }
    float _1307 = _1305;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1309;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1319 = _1317 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1321 = _1249 * _1285;
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1335 = fma(_1311, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1337 = fma(_1329, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1339 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1341 = isnan(_480);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1353 = fma(_1315, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1355 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1357 = fma(_1333, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1359 = -_1349;
    float _1361 = _1359 + 1.0;
    float _1363 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1351);
    float _1365 = fma(_680, _1355, -0.5);
    bool _1367 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1369 = isnan(_480);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = fma(_1325, _1293, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _1381 = _480 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1383 = isnan(_480);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = -_140;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1255);
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1399 = _1377 * _1361;
    float _1401 = -_1377;
    float _1403 = _1401 + 1.0;
    float _1405 = _1307 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1407 = fma(_1319, _1321, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1409 = _1391 * _1403;
    float _1411 = -_1391;
    float _1413 = _1411 + 1.0;
    float _1415 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1289);
    float _1417 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1273);
    float _1419 = _1335 * _1409;
    float _1421 = _1379 * _1409;
    float _1423 = _1337 * _1409;
    float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1427 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1363);
    float _1429 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[88].z;
    if (_494)
    {
        _1435 = _510;
    }
    float _1437 = _1435;
    float _1439 = fma(_1429, _684, -0.5);
    float _1441 = -_1431;
    float _1443 = fma(_1405, 2.0, _1441);
    float _1445 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1433);
    float _1447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1449 = _1437;
    if (!_494)
    {
        _1449 = _508;
    }
    float _1451 = _1449;
    float _1453 = -_140;
    float _1455 = fma(_1453, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1443);
    float _1457 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1445);
    bool _1459 = _666 != 0.0;
    bool _1461 = isnan(_666);
    bool _1463 = _1459 || _1461;
    bool _1465 = isnan(0.0);
    bool _1467 = _1463 || _1465;
    float _1469 = fma(_1427, _1365, _1395);
    float _1471 = _1425 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1473 = fma(_1457, _1439, _1455);
    float _1475 = -_654;
    bool _1477 = _782 == _1475;
    bool _1479 = !_1467;
    bool _1481 = _1477 && _1479;
    float _1483 = in.m_65.z;
    float _1485 = fma(_1471, _708, -0.5);
    float _1487 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1303);
    float _1489 = -_646;
    bool _1491 = _784 == _1489;
    bool _1493 = _1491 && _1481;
    float _1495 = in.m_65.y;
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1499 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1501 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1419);
    float _1503 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1421);
    float _1505 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1423);
    float _1507 = fma(_700, _1499, -0.5);
    float _1509 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1511 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1415);
    float _1513 = fma(_1353, _1399, _1501);
    float _1515 = fma(_1357, _1399, _1503);
    float _1517 = fma(_1509, -2.0, _1497);
    float _1519 = fma(_1407, _1399, _1505);
    float _1521 = -_1487;
    float _1523 = fma(_1511, _1507, _1521);
    float _1525 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1417);
    float _1527 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1517);
    float _1529 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1513);
    float _1531 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1515);
    float _1533 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1519);
    float _1535 = in.m_65.x;
    float _1537 = _784 + _1483;
    float _1539 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1541 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1543 = _1533 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1545 = as_type<int>(_1483);
    int _1547 = as_type<int>(_1527);
    if (_1493)
    {
        _704 = _1495;
    }
    float _1549 = _704;
    float _1551 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1537);
    float _1553 = -_1527;
    float _1555 = fma(_1525, _1485, _1553);
    float _1557 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1549;
    if (_1493)
    {
        _142 = _1549;
    }
    float _1561 = _142;
    float _1563 = _1561;
    if (_1493)
    {
        float _1565 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1549);
        _1545 = as_type<int>(_1565);
    }
    int _1567 = _1545;
    int _1569 = _1567;
    if (!_1493)
    {
        _1559 = _1495;
    }
    float _1571 = _1559;
    float _1573 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1493)
    {
        _1547 = as_type<int>(_1551);
    }
    int _1577 = _1547;
    int _1579 = _1577;
    if (!_1493)
    {
        float _1581 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1571);
        _1569 = as_type<int>(_1581);
    }
    int _1583 = _1569;
    if (!_1493)
    {
        _1579 = as_type<int>(_1551);
    }
    int _1585 = _1579;
    out.m_67.x = _1557;
    out.m_67.y = _1573;
    out.m_67.z = _1575;
    bool _1587 = !_1493;
    float _1589 = _1587 ? as_type<float>(_1583) : _1571;
    float _1591 = _1473 + 0.5;
    float _1593 = _1493 ? _1537 : as_type<float>(_1585);
    float _1595 = _782 + _1535;
    float _1597 = _1595;
    if (!_1493)
    {
        _1563 = as_type<float>(_1583);
    }
    float _1599 = _1563;
    float _1601 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1603 = _1469 + 0.5;
    if (!_1493)
    {
        float _1605 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1595);
        _1597 = _1605;
    }
    float _1607 = _1597;
    float _1609 = _1124 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1611 = _1589 * _1589;
    float _1613 = exp2(_1601);
    float _1615 = _1523 + 0.5;
    float _1617 = fma(_1593, _1593, _1611);
    float _1619 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    out.m_69.x = _1603;
    out.m_69.y = _1615;
    out.m_69.z = _628;
    out.m_69.w = _630;
    if (_1493)
    {
        _856 = _1537;
    }
    float _1621 = _856;
    float _1623 = rsqrt(_1617);
    float _1625 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1619);
    out.m_71.x = (*spvDescriptorSet0.vp_c10)._m0[8].x;
    out.m_71.y = (*spvDescriptorSet0.vp_c10)._m0[9].x;
    out.m_71.z = (*spvDescriptorSet0.vp_c10)._m0[10].x;
    float _1627 = _1621;
    if (!_1493)
    {
        _1627 = _1551;
    }
    float _1629 = _1627;
    float _1631 = _1555 + 0.5;
    float _1633 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1625);
    float _1635 = -_1613;
    float _1637 = _1635 + 1.0;
    bool _1639 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1641 = isnan(_936);
    bool _1643 = _1639 || _1641;
    bool _1645 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1647 = _1643 || _1645;
    out.m_73.x = _1591;
    out.m_73.y = _1631;
    float _1649 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1651 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    out.gl_Position.x = _1190;
    out.gl_Position.y = _1188;
    out.gl_Position.z = _1633;
    out.gl_Position.w = _1160;
    float _1653 = _1589 * _1623;
    float _1655 = _1593 * _1623;
    float _1657 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1651);
    float _1659 = -(*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1661 = _1653 * _1659;
    float _1663 = -(*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1665 = _1653 * _1663;
    float _1667 = -(*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1669 = _1653 * _1667;
    float _1671 = _1651;
    float _1673 = _1633;
    float _1675 = _1190;
    if (!_1647)
    {
        _1671 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1677 = _1671;
    float _1679 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1661);
    float _1681 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1665);
    float _1683 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = _1599 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1687 = fma(_1655, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1669);
    float _1689 = _1685;
    float _1691 = _1679;
    float _1693 = _1677;
    float _1695 = _1677;
    if (!_1647)
    {
        _1297 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1697 = _1297;
    float _1699 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1701 = _1633 + _1160;
    float _1703 = fma(_1607, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1685);
    out.m_75.x = _1679;
    out.m_75.y = _1681;
    out.m_75.z = _1687;
    float _1705 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1699);
    float _1707 = _1701 * 0.5;
    float _1709 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1657);
    float _1711 = fma(_1629, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1703);
    float _1713 = _1697;
    float _1715 = _1697;
    if (!_1647)
    {
        _1673 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1717 = _1673;
    out.m_77.z = _1707;
    out.m_77.w = _1160;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1647)
    {
        _1675 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1723 = _1675;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1647)
    {
        _1689 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1729 = _1689;
    out.m_79.x = _1705;
    out.m_79.y = _1709;
    out.m_79.z = _1711;
    float _1731 = _1729;
    float _1733 = _1729;
    if (!_1647)
    {
        _1691 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1735 = _1691;
    float _1737 = _1649 * _1218;
    float _1739 = -_1649;
    float _1741 = _1739 + 1.0;
    float _1743 = _1233 * _1737;
    float _1745 = _1233 * _1741;
    float _1747 = _1243 * _1737;
    float _1749 = fma(_1239, _1743, _1227);
    float _1751 = fma(_1241, _1743, _1229);
    float _1753 = fma(_1233, _1747, _1231);
    out.m_81.x = _1749;
    out.m_81.y = _1751;
    out.m_81.z = _1753;
    out.m_81.w = _1745;
    bool _1755 = !_1647;
    float _1757 = _1735;
    float _1759 = _1735;
    if (!_1755)
    {
        bool _1761 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1763 = isnan(_936);
        bool _1765 = _1761 || _1763;
        bool _1767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1769 = _1765 || _1767;
        if (!_1769)
        {
            float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1773 = _936 + _1771;
            float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1777 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1775;
            float _1779 = 1.0 / _1777;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1801 = _1773 * _1779;
            float _1803 = precise::clamp(_1801, 0.0, 1.0);
            float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1809 = fma(_1803, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1811 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1813 = fma(_1803, _1787, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1815 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1817 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1819 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1759 = _1809;
            _1695 = _1817;
            _1715 = _1811;
            _1727 = _1815;
            _1721 = _1813;
            _1733 = _1819;
            _1821 = true;
        }
        else
        {
            bool _1823 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1825 = isnan(_936);
            bool _1827 = _1823 || _1825;
            bool _1829 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1831 = _1827 || _1829;
            if (!_1831)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1833 = _1713;
            _1715 = _1833;
            if (!_1831)
            {
                _1757 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1835 = _1757;
            _1759 = _1835;
            if (!_1831)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1837 = _1719;
            _1721 = _1837;
            if (!_1831)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1839 = _1725;
            _1727 = _1839;
            if (!_1831)
            {
                _1693 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1841 = _1693;
            _1695 = _1841;
            if (!_1831)
            {
                _1731 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1843 = _1731;
            bool _1845 = !_1831;
            _1733 = _1843;
            if (!_1845)
            {
                bool _1847 = _936 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1849 = isnan(_936);
                bool _1851 = _1847 || _1849;
                bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1855 = _1851 || _1853;
                if (!_1855)
                {
                    float _1857 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1859 = _936 + _1857;
                    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1863 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1861;
                    float _1865 = 1.0 / _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1873 = _1871 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1875 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1879 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1883 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1887 = _1859 * _1865;
                    float _1889 = precise::clamp(_1887, 0.0, 1.0);
                    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1895 = fma(_1889, _1869, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1897 = fma(_1889, _1893, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1899 = fma(_1889, _1873, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1901 = fma(_1889, _1877, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1903 = fma(_1889, _1881, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1905 = fma(_1889, _1885, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1759 = _1895;
                    _1695 = _1903;
                    _1715 = _1897;
                    _1727 = _1901;
                    _1721 = _1899;
                    _1733 = _1905;
                    _1821 = true;
                }
                else
                {
                    _1759 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1695 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1733 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1821 = false;
    float _1907 = _1759;
    float _1909 = _1695;
    float _1911 = _1715;
    float _1913 = _1727;
    float _1915 = _1721;
    float _1917 = _1733;
    float _1919 = fma(_1709, -0.5, 0.5);
    float _1921 = precise::clamp(_1919, 0.0, 1.0);
    float _1923 = -_1907;
    float _1925 = _1923 + _1909;
    float _1927 = -_1911;
    float _1929 = _1927 + _1913;
    float _1931 = -_1915;
    float _1933 = _1931 + _1917;
    bool _1935 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1937 = fma(_1921, _1925, _1907);
    float _1939 = fma(_1921, _1929, _1911);
    float _1941 = fma(_1921, _1933, _1915);
    float _1943 = _1937 * 0.586610972881317138671875;
    out.m_83.x = 0.0;
    float _1945 = fma(_1939, 0.298911988735198974609375, _1943);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1947 = fma(_1941, 0.114477999508380889892578125, _1945);
    out.m_49.x = 1.0;
    float _1949 = -_1947;
    float _1951 = _1939 + _1949;
    float _1953 = -_1947;
    float _1955 = _1937 + _1953;
    float _1957 = -_1947;
    float _1959 = _1941 + _1957;
    float _1961 = fma(_1951, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    float _1963 = fma(_1955, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    float _1965 = fma(_1959, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1947);
    out.m_87.x = _1961;
    out.m_87.y = _1963;
    out.m_87.z = _1965;
    if (!_1935)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1967 = -_908;
    float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1971 = -_910;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1975 = -_912;
    float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1979 = _1969 * _1969;
    float _1981 = fma(_1973, _1973, _1979);
    float _1983 = fma(_1977, _1977, _1981);
    float _1985 = sqrt(_1983);
    float _1987 = rsqrt(_1983);
    float _1989 = -_1985;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1993 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1995 = precise::clamp(_1993, 0.0, 1.0);
    float _1997 = _1973 * _1987;
    float _1999 = _1969 * _1987;
    float _2001 = abs(_1995);
    float _2003 = log2(_2001);
    float _2005 = _1977 * _1987;
    float _2007 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2009 = _1709 * _1999;
    float _2011 = -_1999;
    float _2013 = -_2007;
    float _2015 = fma(_2011, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2013);
    float _2017 = fma(_1705, _1997, _2009);
    float _2019 = -_2005;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2015);
    float _2023 = fma(_1711, _2005, _2017);
    float _2025 = precise::clamp(_2023, 0.0, 1.0);
    float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2029 = _2021 + _2027;
    float _2031 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2033 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = exp2(_2031);
    float _2039 = _2037 * _2035;
    float _2041 = _2025 * _2039;
    float _2043 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2045 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2047 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2043;
    out.m_83.y = _2045;
    out.m_83.z = _2047;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

