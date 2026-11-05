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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
    float4 m_71 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2115 = false;
    bool _1464 = false;
    bool _600 = false;
    bool _496 = false;
    bool _354 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2400 = as_type<float>(_130);
        out.gl_Position.z = _2400;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_53.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_166);
        out.gl_Position.z = _2468;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    float _180 = in.m_59.x;
    float _182 = in.m_59.y;
    float _184 = in.m_59.z;
    float _186 = _168 * _168;
    float _188 = _170 * _170;
    float _190 = _172 * _172;
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = sqrt(_198);
    float _206 = in.m_61.y;
    float _208 = sqrt(_200);
    float _210 = sqrt(_202);
    bool _212 = _204 > 0.0;
    bool _214 = _208 > 0.0;
    out.m_63.y = _206;
    float _216 = _198;
    float _218 = _208;
    float _220 = _202;
    float _222 = _168;
    float _224 = _206;
    if (_212)
    {
        float _226 = rsqrt(_198);
        _216 = _226;
    }
    float _228 = _216;
    float _230 = 0.0;
    if (!_212)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _210 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    if (!_212)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = 0.0;
    float _244 = _240;
    if (!_212)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = _210;
    float _250 = _246;
    if (_214)
    {
        float _252 = rsqrt(_200);
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    if (!_214)
    {
        _256 = 0.0;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (!_214)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (!_214)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = _204;
    float _274 = _270;
    if (_234)
    {
        float _276 = rsqrt(_202);
        _272 = _276;
    }
    float _278 = _272;
    if (_212)
    {
        float _280 = _228 * _174;
        _238 = _280;
    }
    float _282 = _238;
    if (_212)
    {
        float _284 = _228 * _168;
        _244 = _284;
    }
    float _286 = _244;
    if (_212)
    {
        float _288 = _228 * _180;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_234)
    {
        _218 = 0.0;
    }
    float _294 = _218;
    float _296 = 0.0;
    float _298 = _294;
    if (!_234)
    {
        _296 = 0.0;
    }
    float _300 = _296;
    float _302 = _300;
    if (_214)
    {
        float _304 = _254 * _176;
        _262 = _304;
    }
    float _306 = _262;
    float _308 = _306;
    if (!_234)
    {
        _220 = 0.0;
    }
    float _310 = _220;
    float _312 = _310;
    if (_214)
    {
        float _314 = _254 * _170;
        _268 = _314;
    }
    float _316 = _268;
    if (_214)
    {
        float _318 = _254 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_234)
    {
        float _322 = _278 * _178;
        _298 = _322;
    }
    float _324 = _298;
    if (_234)
    {
        float _326 = _278 * _172;
        _312 = _326;
    }
    float _328 = _312;
    if (_234)
    {
        float _330 = _278 * _184;
        _302 = _330;
    }
    float _332 = _302;
    bool _334 = !_292;
    float _352;
    if (!_334)
    {
        float _336 = in.m_65.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_114);
        float _358 = 1.0 / _356;
        float _360 = _148 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _370 = isnan(_362);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _384 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _408 = isnan(_362);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = _394 * _404;
    float _422 = -_394;
    float _424 = _422 + 1.0;
    float _426 = 1.0 / _382;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _434 = _400 * _396;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _362 + _436;
    float _440 = -_416;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _362 + _444;
    float _448 = _432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = fma(_434, _438, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _452 = _378 * _442;
    float _454 = _430 * _426;
    float _456 = _450 * _420;
    float _458 = fma(_454, _446, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _460 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _464 = fma(_458, _452, _460);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[117].x, _464);
    float _470 = _462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _472 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _470;
    out.m_67.y = _472;
    out.m_67.z = _448;
    out.m_67.w = _474;
    bool _476 = !_418;
    float _494;
    if (!_476)
    {
        float _478 = in.m_65.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_114);
        float _500 = 1.0 / _498;
        float _502 = _148 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    bool _506 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _508 = isnan(_504);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _522 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _524 = isnan(_504);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _540 = _504 + _538;
    float _542 = 1.0 / _520;
    float _544 = -_516;
    float _546 = _544 + 1.0;
    float _548 = _532 * _546;
    float _550 = -_532;
    float _552 = _550 + 1.0;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _536 * _542;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = fma(_566, _540, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _572 = _570 * _548;
    float _574 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[131].x, _572);
    float _576 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[132].x, _574);
    float _578 = _576 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _562;
    out.m_69.y = _564;
    out.m_69.z = _568;
    out.m_69.w = _578;
    bool _580 = !_558;
    float _598;
    if (!_580)
    {
        float _582 = in.m_65.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_114);
        float _604 = 1.0 / _602;
        float _606 = _148 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_65.w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _614 = _608 + _612;
    float _616 = in.m_48.x;
    float _618 = in.m_48.y;
    float _620 = in.m_48.z;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _624 = _622 != 0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _628 = _608 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _632 = _608 + _630;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _636 = _634 != 0;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _640 = _608 + _638;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _644 = _642 != 0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _656 = _654 != 0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _660 = _608 + _658;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _664 = _662 != 0;
    float _666 = in.m_61.x;
    float _668 = 1.0 / _652;
    float _670 = 0.0;
    if (!_624)
    {
        float _672 = in.m_65.z;
        _670 = _672;
    }
    float _674 = _670;
    bool _676 = _610 > 0.5;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _678;
    float _682 = in.m_71.x;
    float _684 = in.m_71.y;
    float _686 = in.m_71.z;
    float _688 = 1.0 / _648;
    float _690 = _182 * _618;
    float _692 = _176 * _618;
    float _694 = _170 * _618;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _700 = fma(_180, _616, _690);
    float _702 = fma(_174, _616, _692);
    float _704 = fma(_168, _616, _694);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _706;
    float _710 = fma(_184, _620, _700);
    bool _712 = _676;
    float _714 = _674;
    if (_636)
    {
        float _716 = in.m_65.z;
        _222 = _716;
    }
    float _718 = _222;
    float _720 = fma(_178, _620, _702);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _726 = fma(_172, _620, _704);
    float _728 = in.m_73.x;
    float _730 = in.m_73.y;
    float _732 = in.m_73.z;
    float _734 = 1.0 / _708;
    float _736 = _614 * _688;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _740 = _608 + _738;
    float _742 = _616;
    if (_644)
    {
        float _744 = in.m_65.x;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = _710 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _750 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _752 = isnan(_608);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    int _762 = 0;
    if (_636)
    {
        float _764 = -_666;
        float _766 = _764 + 1.0;
        _762 = as_type<int>(_766);
    }
    int _768 = _762;
    float _770 = 1.0 / _724;
    float _772 = _682 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _776 = _608 + _774;
    float _778 = _686 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _780 = _684 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _782 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = _776 * _668;
    float _786 = 1.0 / _698;
    float _788 = _628 * _734;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _794;
    bool _798 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _800 = isnan(_608);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = -_760;
    float _812 = _810 + 1.0;
    bool _814 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _816 = isnan(_608);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = 1.0 / _680;
    float _828 = -_206;
    float _830 = _828 + 1.0;
    float _832 = _740 * _770;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _728);
    bool _836 = false;
    if (_644)
    {
        bool _838 = _746 > 0.5;
        _836 = _838;
    }
    bool _840 = _836;
    float _842 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _844 = _676 ? as_type<int>(_830) : as_type<int>(_206);
    float _846 = _782 * _834;
    float _848 = 1.0 / _796;
    int _850 = as_type<int>(_846);
    if (_636)
    {
        bool _852 = _718 > 0.5;
        _712 = _852;
    }
    bool _854 = _712;
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _860 = _790 * _856;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _862;
    float _866 = _632 * _786;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _868;
    float _872 = _640 * _826;
    float _874 = fma(_864, _736, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _876 = _792 * _858;
    float _878 = fma(_870, _736, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _884;
    float _888 = _660 * _848;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _890;
    float _894 = fma(_882, _784, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _896 = fma(_886, _872, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _898 = fma(_892, _872, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _920 = fma(_906, _788, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _922 = fma(_910, _866, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _924 = fma(_914, _788, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _926 = fma(_902, _866, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _928 = _914;
    float _930 = _874;
    if (!_624)
    {
        float _932 = in.m_65.y;
        _928 = _932;
    }
    float _934 = _928;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _940 = fma(_918, _784, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _942 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _944 = isnan(_608);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _958 = fma(_938, _832, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _960 = _656 ? as_type<float>(_844) : _206;
    float _962 = in.m_75.x;
    float _964 = in.m_75.y;
    float _966 = in.m_75.z;
    bool _968 = _730 != 0.0;
    bool _970 = isnan(_730);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    float _978 = -_952;
    float _980 = _978 + 1.0;
    bool _982 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _984 = isnan(_608);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_956, _832, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _996 = _728 == 0.0;
    bool _998 = !_976;
    bool _1000 = _996 && _998;
    float _1002 = -_824;
    float _1004 = _1002 + 1.0;
    bool _1006 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1008 = isnan(_608);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = _992 * _980;
    float _1020 = -_992;
    float _1022 = _1020 + 1.0;
    bool _1024 = _732 == 0.0;
    bool _1026 = _1024 && _1000;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1030 = _760 * _1022;
    bool _1032 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1034 = isnan(_608);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _1016 * _1004;
    bool _1046 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1048 = isnan(_608);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = -_1016;
    float _1060 = _1058 + 1.0;
    float _1062 = _992;
    float _1064 = _952;
    float _1066 = _1044;
    if (!_624)
    {
        _1062 = _934;
    }
    float _1068 = _1062;
    float _1070 = -_1042;
    float _1072 = _1070 + 1.0;
    float _1074 = _952 * _1060;
    if (!_644)
    {
        _1064 = _666;
    }
    float _1076 = _1064;
    float _1078 = _1056 * _1072;
    float _1080 = _1068;
    float _1082 = _934;
    float _1084 = _1076;
    if (_624)
    {
        float _1086 = in.m_65.x;
        float _1088 = in.m_65.y;
        _1080 = _1086;
        _1082 = _1088;
    }
    float _1090 = _1080;
    float _1092 = _1082;
    float _1094 = _962;
    float _1096 = _964;
    float _1098 = _966;
    if (!_1026)
    {
        float _1100 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _1094 = _1100;
    }
    float _1102 = _1094;
    float _1104 = _808 * _812;
    float _1106 = -_808;
    float _1108 = _1106 + 1.0;
    if (!_1026)
    {
        float _1110 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1096 = _1110;
    }
    float _1112 = _1096;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1114;
    float _1118 = _1042 * _1108;
    if (!_1026)
    {
        float _1120 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1098 = _1120;
    }
    float _1122 = _1098;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1124;
    float _1128 = _874 * _1078;
    float _1130 = _878 * _1078;
    float _1132 = fma(_1116, _888, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1134 = fma(_1126, _888, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1136 = _876 * _306;
    float _1138 = _876 * _320;
    float _1140 = _876 * _316;
    if (!_624)
    {
        _930 = _674;
    }
    float _1142 = _930;
    float _1144 = fma(_846, _282, _1136);
    float _1146 = fma(_846, _290, _1138);
    float _1148 = _316 * _1112;
    float _1150 = _320 * _1112;
    float _1152 = -_1056;
    float _1154 = _1152 + 1.0;
    float _1156 = fma(_860, _332, _1146);
    float _1158 = _1142;
    if (_624)
    {
        _1158 = _1092;
    }
    float _1160 = _1158;
    float _1162 = fma(_286, _1102, _1148);
    float _1164 = _1162;
    if (_624)
    {
        _714 = _1092;
    }
    float _1166 = _714;
    float _1168 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1170 = _1092 > 0.5;
    float _1172 = fma(_846, _286, _1140);
    float _1174 = _306 * _1112;
    float _1176 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1178 = fma(_860, _324, _1144);
    float _1180 = fma(_282, _1102, _1174);
    float _1182 = _748 + _1156;
    float _1184 = _1176 + _1178;
    float _1186 = _1184;
    float _1188 = _1182;
    if (_644)
    {
        float _1190 = -_666;
        float _1192 = _1190 + 1.0;
        _850 = as_type<int>(_1192);
    }
    int _1194 = _850;
    float _1196 = fma(_290, _1102, _1150);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1184 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1182 + _1204;
    if (_644)
    {
        float _1208 = _840 ? as_type<float>(_1194) : _666;
        _1084 = _1208;
    }
    float _1210 = _1084;
    float _1212 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1198);
    float _1214 = _1202 * _1202;
    float _1216 = _1206 * _1206;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1220 = _1214;
    float _1222 = _1216;
    if (!_636)
    {
        _308 = _666;
    }
    float _1224 = _308;
    float _1226 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1228 = _1214 + _1216;
    float _1230 = _1224;
    if (_636)
    {
        float _1232 = _854 ? as_type<float>(_768) : _666;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1128);
    float _1238 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1130);
    float _1240 = fma(_1226, _960, -0.5);
    float _1242 = sqrt(_1228);
    float _1244 = fma(_894, _1118, _1236);
    float _1246 = fma(_940, _1118, _1238);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_664)
    {
        float _1250 = _1170 ? _830 : _206;
        _224 = _1250;
    }
    float _1252 = _224;
    float _1254 = fma(_896, _1104, _1244);
    float _1256 = fma(_898, _1104, _1246);
    float _1258 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1262 = fma(_860, _328, _1172);
    float _1264 = fma(_1258, _1234, -0.5);
    float _1266 = -_1260;
    float _1268 = fma(_1168, 2.0, _1266);
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1272 = fma(_922, _1030, _1254);
    bool _1274 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1276 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1248);
    float _1278 = fma(_926, _1030, _1256);
    float _1280 = _842 + _1262;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1284 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1286 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1212);
    float _1288 = -_148;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1268);
    float _1292 = fma(_920, _1018, _1272);
    float _1294 = fma(_924, _1018, _1278);
    float _1296 = fma(_1284, -2.0, _1282);
    float _1298 = fma(_1286, _1264, _1290);
    float _1300 = fma(_958, _1074, _1292);
    float _1302 = _1278;
    if (!_1274)
    {
        _1302 = _1280;
    }
    float _1304 = _1302;
    bool _1306 = !_1274;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1242 + _1312;
        float _1316 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = rsqrt(_1228);
        float _1320 = _1314 * _1310;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        float _1332 = fma(_1326, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1334 = _1318 * _1332;
        float _1336 = _1330 + (-1.0);
        float _1338 = fma(_1202, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = fma(_1206, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1350 = _1340 + _1348;
        float _1352 = fma(_1280, _1330, _1342);
        float _1354 = _1346 * _1346;
        float _1356 = _1350 * _1350;
        _1308 = _1352;
        _1220 = _1354;
        _1222 = _1356;
        _1186 = _1338;
        _1188 = _1340;
    }
    float _1358 = _1308;
    float _1360 = _1220;
    float _1362 = _1222;
    float _1364 = _1186;
    float _1366 = _1188;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1370 = _1358 + _1368;
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1374 = fma(_994, _1074, _1294);
    float _1376 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1276);
    float _1378 = fma(_1370, _1370, _1360);
    float _1380 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1382 = fma(_1132, _1044, _1374);
    float _1384 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1378 + _1362;
    float _1388 = fma(_1134, _1044, _1300);
    float _1390 = -_1380;
    float _1392 = fma(_1376, _1240, _1390);
    float _1394 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1396 = fma(_324, _1122, _1180);
    float _1398 = _1384 * _1270;
    float _1400 = sqrt(_1386);
    float _1402 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1388);
    float _1404 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1382);
    float _1406 = _1394 * _1372;
    float _1408 = _1298 + 0.5;
    float _1410 = _1392 + 0.5;
    float _1412 = fma(_328, _1122, _1162);
    float _1414 = fma(_332, _1122, _1196);
    out.m_77.x = _1402;
    out.m_77.y = _1404;
    out.m_79.x = _1398;
    out.m_79.y = _1406;
    out.m_79.z = _1408;
    out.m_79.w = _1410;
    out.m_81.x = _1396;
    out.m_81.y = _1412;
    out.m_81.z = _1414;
    bool _1416 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1418 = isnan(_1400);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1424 = _1420 || _1422;
    float _1426 = _1392;
    float _1428 = _1382;
    if (!_1424)
    {
        _1426 = 1.0;
    }
    float _1430 = _1426;
    bool _1432 = !_1424;
    float _1434 = _1430;
    if (!_1432)
    {
        bool _1436 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1438 = isnan(_1400);
        bool _1440 = _1436 || _1438;
        bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1444 = _1440 || _1442;
        if (!_1444)
        {
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = _1400 + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1452 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1450;
            float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1458 = 1.0 / _1452;
            float _1460 = _1448 * _1458;
            float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1434 = _1462;
            _1464 = true;
        }
        else
        {
            bool _1466 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1468 = isnan(_1400);
            bool _1470 = _1466 || _1468;
            bool _1472 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1474 = _1470 || _1472;
            if (!_1474)
            {
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1400 + _1476;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1486 = _1484 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1488 = 1.0 / _1482;
                float _1490 = _1478 * _1488;
                float _1492 = fma(_1490, _1486, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1434 = _1492;
                _1464 = true;
            }
            else
            {
                _1434 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1464 = false;
    float _1494 = _1434;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1498 = _1358 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1502 = _1364 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1506 = _1366 + _1504;
    float _1508 = fma(_1498, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1510 = fma(_1502, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1512 = fma(_1506, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1508 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1510 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1512 + _1522;
    float _1526 = _1516 * _1516;
    float _1528 = fma(_1520, _1520, _1526);
    float _1530 = fma(_1524, _1524, _1528);
    float _1532 = rsqrt(_1530);
    float _1534 = sqrt(_1530);
    float _1536 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1538 = _1520 * _1536;
    float _1540 = _1524 * _1536;
    float _1542 = _1538 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 + _1544;
    float _1548 = sqrt(_1546);
    bool _1550 = _1548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1548 + _1552;
    float _1556 = _1210;
    float _1558 = _1554;
    float _1560 = _1524;
    float _1562 = _1516;
    if (_1550)
    {
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1556 = _1564;
    }
    float _1566 = _1556;
    if (_1550)
    {
        float _1568 = rsqrt(_1546);
        _1066 = _1568;
    }
    float _1570 = _1066;
    if (_1550)
    {
        float _1572 = _1554 * _1566;
        _1558 = _1572;
    }
    float _1574 = _1558;
    float _1576 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1550)
    {
        float _1578 = _1574 * 0.15915493667125701904296875;
        _1428 = _1578;
    }
    float _1580 = _1428;
    float _1582 = _328;
    float _1584 = _1580;
    if (_1550)
    {
        float _1586 = _1580 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1582 = _1588;
    }
    float _1590 = _1582;
    float _1592 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1594 = precise::max(0.0, _1592);
    float _1596 = _1074;
    float _1598 = _1594;
    float _1600 = _1592;
    if (_1550)
    {
        float _1602 = _1580 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = -_1536;
    float _1610 = -_1594;
    float _1612 = fma(_1516, _1608, _1610);
    float _1614 = _1612;
    if (_1550)
    {
        float _1616 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1598 = _1616;
    }
    float _1618 = _1598;
    float _1620 = _1618;
    if (!_1550)
    {
        _1584 = _1538;
    }
    float _1622 = _1584;
    float _1624 = _1590;
    float _1626 = _1622;
    if (_1550)
    {
        float _1628 = fma(_1590, _1618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = _1630;
    if (_1550)
    {
        float _1634 = _1606 + (-1.0);
        _1600 = _1634;
    }
    float _1636 = _1600;
    float _1638 = _1636;
    if (_1550)
    {
        float _1640 = _1570 * _1630;
        _1164 = _1640;
    }
    float _1642 = _1164;
    if (!_1550)
    {
        _1632 = _1540;
    }
    float _1644 = _1632;
    float _1646 = _1644;
    if (_1550)
    {
        float _1648 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1648;
    }
    float _1650 = _1620;
    float _1652 = _1650;
    if (_1550)
    {
        float _1654 = _1538 * _1642;
        _1626 = _1654;
    }
    float _1656 = _1626;
    if (_1550)
    {
        float _1658 = _1540 * _1642;
        _1646 = _1658;
    }
    float _1660 = _1646;
    if (!_1550)
    {
        _1638 = _1544;
    }
    float _1662 = _1638;
    float _1664 = _1662;
    if (_1550)
    {
        float _1666 = fma(_1612, _1606, _1650);
        _1614 = _1666;
    }
    float _1668 = _1614;
    if (!_1550)
    {
        _1652 = _1542;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1550)
    {
        float _1674 = _1656 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (_1550)
    {
        float _1678 = _1660 * _1660;
        _1664 = _1678;
    }
    float _1680 = _1664;
    float _1682 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = fma(_1668, _1668, _1676);
    float _1686 = _1684 + _1680;
    float _1688 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1692 = fma(_1534, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1690);
    float _1694 = precise::clamp(_1692, 0.0, 1.0);
    float _1696 = rsqrt(_1686);
    float _1698 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1700 = -_1694;
    float _1702 = _1700 + 1.0;
    float _1704 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1706 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1712 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1576);
    float _1714 = abs(_1702);
    float _1716 = log2(_1714);
    float _1718 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1724 = -_1718;
    float _1726 = fma(_1724, _1706, 1.0);
    float _1728 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1730 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1732 = _1696 * _1656;
    float _1734 = _1696 * _1668;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1728);
    float _1738 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1740 = _1696 * _1660;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1744 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = floor(_1704);
    float _1750 = -_1742;
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1750);
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1758 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = -_1740;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1752);
    float _1764 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1756);
    float _1768 = floor(_1710);
    float _1770 = fma(_1762, -0.5, 0.5);
    float _1772 = fma(_1762, 0.5, 0.5);
    float _1774 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1776 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1774);
    float _1780 = -_1748;
    float _1782 = _1704 + _1780;
    float _1784 = exp2(_1764);
    float _1786 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1788 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1790 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1786);
    float _1792 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1794 = -_1768;
    float _1796 = _1710 + _1794;
    float _1798 = log2(_1726);
    float _1800 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1802 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1804 = _1734 + 1.0;
    float _1806 = fma(_1772, _1800, -0.212114393711090087890625);
    float _1808 = 1.0 / _1778;
    float _1810 = fma(_1772, _1806, 1.570728778839111328125);
    float _1812 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1802);
    float _1814 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1816 = sqrt(_1770);
    float _1818 = _1798 * 0.693147182464599609375;
    float2 _5162 = float2(_1782, _1796);
    float _1820 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5162, float2(0.0), isnan(_5162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5162, float2(0.0), isnan(_5162)), level(0.0)).x;
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1824 = _1814 * _1808;
    float _1826 = -_1734;
    float _1828 = fma(_1784, _1804, _1826);
    float _1830 = _1812 * _1808;
    float _1832 = fma(_1824, -0.5, 0.5);
    float _1834 = fma(_1828, 0.5, 0.5);
    float _1836 = fma(_1830, 0.5, 0.5);
    float _1838 = _1816 * 0.636619746685028076171875;
    float3 _5198 = float3(_1836, _1832, _1822);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5198, float3(0.0), isnan(_5198)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5198, float3(0.0), isnan(_5198)), level(0.0)).x;
    float3 _5209 = float3(_1836, _1832, _1822);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5209, float3(0.0), isnan(_5209)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5209, float3(0.0), isnan(_5209)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1810;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _5230 = float2(_1855, _1834);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5230, float2(0.0), isnan(_5230)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5230, float2(0.0), isnan(_5230)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _842 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _842 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1875 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    float _1877 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1879 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1873);
    float _1881 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1875);
    float _1883 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1877);
    float _1885 = exp2(_1871);
    float _1887 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1891 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1879);
    out.m_83.x = _1520;
    out.m_83.y = _1516;
    out.m_83.z = _1524;
    float _1893 = _1889 + _1887;
    bool _1895 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1897 = isnan(_1534);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1903 = _1899 || _1901;
    float _1905 = 1.0 / _1887;
    float _1907 = -_1885;
    float _1909 = _1907 + 1.0;
    float _1911 = _1909;
    if (!_1903)
    {
        _1560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1560;
    float _1915 = _1913;
    float _1917 = _1913;
    if (!_1903)
    {
        _1562 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1919 = _1562;
    float _1921 = _1893 * _1905;
    float _1923 = _1921 * 0.5;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1927 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
    float _1929 = 1.0 / _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1933 = _1929 * _1931;
    float _1935 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1891);
    float _1937 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = abs(_1933);
    float _1941 = log2(_1939);
    float _1943 = _1919;
    float _1945 = _1919;
    if (!_1903)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1947 = _1911;
    bool _1949 = _1933 <= 8000.0;
    bool _1951 = isnan(_1933);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(8000.0);
    bool _1957 = _1953 || _1955;
    float _1959 = float(_1957);
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1963 = exp2(_1961);
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = _1935 + _1778;
    float _1971 = fma(_1967, -2.0, 3.0);
    float _1973 = _1967 * _1967;
    float _1975 = _1969 * 0.5;
    float _1977 = _1973 * _1971;
    float _1979 = in.m_85.x;
    float _1981 = -_1977;
    float _1983 = _1981 + 1.0;
    out.m_87.z = _1975;
    out.m_87.w = _1778;
    float _1985 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1977);
    float _1987 = _1959 * _1985;
    out.gl_Position.x = _1812;
    out.gl_Position.y = _1814;
    out.gl_Position.z = _1935;
    out.gl_Position.w = _1778;
    float _1989 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1991 = _1812;
    float _1993 = _1947;
    float _1995 = _1947;
    if (!_1903)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1997 = _1991;
    float _1999 = -_1820;
    float _2001 = _1999 + 1.0;
    float _2003 = _2001 * _1989;
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = -_2005;
    float _2009 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2011 = _2009 * _1979;
    float _2013 = _1937 * _1840;
    float _2015 = -_1937;
    float _2017 = _2015 + 1.0;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2021 = _2011;
    float _2023 = _1997;
    float _2025 = _1997;
    if (!_1903)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2027 = _2021;
    float _2029 = _1851 * _2013;
    float _2031 = _1851 * _2017;
    out.m_89.x = _2019;
    float _2033 = _1865 * _2013;
    float _2035 = fma(_1861, _2029, _1845);
    float _2037 = fma(_1863, _2029, _1847);
    float _2039 = _2029;
    float _2041 = _2027;
    float _2043 = _2027;
    if (!_1903)
    {
        _2039 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2045 = _2039;
    float _2047 = fma(_1851, _2033, _1849);
    out.m_91.x = _2035;
    out.m_91.y = _2037;
    out.m_91.z = _2047;
    out.m_91.w = _2031;
    bool _2049 = !_1903;
    float _2051 = _2045;
    float _2053 = _2045;
    if (!_2049)
    {
        bool _2055 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2057 = isnan(_1534);
        bool _2059 = _2055 || _2057;
        bool _2061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2063 = _2059 || _2061;
        if (!_2063)
        {
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2067 = _1534 + _2065;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2069;
            float _2073 = 1.0 / _2071;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2095 = _2067 * _2073;
            float _2097 = precise::clamp(_2095, 0.0, 1.0);
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2103 = fma(_2097, _2077, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2105 = fma(_2097, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2107 = fma(_2097, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2109 = fma(_2097, _2085, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2111 = fma(_2097, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2113 = fma(_2097, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1995 = _2105;
            _2053 = _2111;
            _2025 = _2103;
            _1945 = _2109;
            _1917 = _2107;
            _2043 = _2113;
            _2115 = true;
        }
        else
        {
            bool _2117 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2119 = isnan(_1534);
            bool _2121 = _2117 || _2119;
            bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2125 = _2121 || _2123;
            if (!_2125)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2127 = _2023;
            _2025 = _2127;
            if (!_2125)
            {
                _1993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2129 = _1993;
            _1995 = _2129;
            if (!_2125)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2131 = _1915;
            _1917 = _2131;
            if (!_2125)
            {
                _1943 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2133 = _1943;
            _1945 = _2133;
            if (!_2125)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2135 = _2051;
            _2053 = _2135;
            if (!_2125)
            {
                _2041 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2137 = _2041;
            bool _2139 = !_2125;
            _2043 = _2137;
            if (!_2139)
            {
                bool _2141 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2143 = isnan(_1534);
                bool _2145 = _2141 || _2143;
                bool _2147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2149 = _2145 || _2147;
                if (!_2149)
                {
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2153 = _1534 + _2151;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2155;
                    float _2159 = 1.0 / _2157;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2181 = _2153 * _2159;
                    float _2183 = precise::clamp(_2181, 0.0, 1.0);
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2189 = fma(_2183, _2163, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2191 = fma(_2183, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2193 = fma(_2183, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2195 = fma(_2183, _2171, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2197 = fma(_2183, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2199 = fma(_2183, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1995 = _2191;
                    _2053 = _2197;
                    _2025 = _2189;
                    _1945 = _2195;
                    _1917 = _2193;
                    _2043 = _2199;
                    _2115 = true;
                }
                else
                {
                    _1995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1945 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2043 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2115 = false;
    float _2201 = _1995;
    float _2203 = _2053;
    float _2205 = _2025;
    float _2207 = _1945;
    float _2209 = _1917;
    float _2211 = _2043;
    float _2213 = fma(_1412, -0.5, 0.5);
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = -_2201;
    float _2219 = _2217 + _2203;
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    bool _2229 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2231 = fma(_2215, _2219, _2201);
    float _2233 = fma(_2215, _2223, _2205);
    float _2235 = fma(_2215, _2227, _2209);
    float _2237 = _2231 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2239 = fma(_2233, 0.298911988735198974609375, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = fma(_2235, 0.114477999508380889892578125, _2239);
    out.m_51.x = _2241;
    float _2245 = -_2243;
    float _2247 = _2233 + _2245;
    float _2249 = -_2243;
    float _2251 = _2231 + _2249;
    float _2253 = -_2243;
    float _2255 = _2235 + _2253;
    float _2257 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_95.x = _2257;
    out.m_95.y = _2259;
    out.m_95.z = _2261;
    if (!_2229)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2263 = -_1508;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2267 = -_1510;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2271 = -_1512;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2275 = _2265 * _2265;
    float _2277 = fma(_2269, _2269, _2275);
    float _2279 = fma(_2273, _2273, _2277);
    float _2281 = sqrt(_2279);
    float _2283 = rsqrt(_2279);
    float _2285 = -_2281;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = _2269 * _2283;
    float _2295 = _2265 * _2283;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2273 * _2283;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2305 = _1412 * _2295;
    float _2307 = -_2295;
    float _2309 = -_2303;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2309);
    float _2313 = fma(_1396, _2293, _2305);
    float _2315 = -_2301;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2311);
    float _2319 = fma(_1414, _2301, _2313);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2325 = _2317 + _2323;
    float _2327 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = exp2(_2327);
    float _2335 = _2333 * _2331;
    float _2337 = _2321 * _2335;
    float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2339;
    out.m_93.y = _2341;
    out.m_93.z = _2343;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2115 = false;
    bool _1464 = false;
    bool _600 = false;
    bool _496 = false;
    bool _354 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2400 = as_type<float>(_130);
        out.gl_Position.z = _2400;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_53.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_166);
        out.gl_Position.z = _2468;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    float _180 = in.m_59.x;
    float _182 = in.m_59.y;
    float _184 = in.m_59.z;
    float _186 = _168 * _168;
    float _188 = _170 * _170;
    float _190 = _172 * _172;
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = sqrt(_198);
    float _206 = in.m_61.y;
    float _208 = sqrt(_200);
    float _210 = sqrt(_202);
    bool _212 = _204 > 0.0;
    bool _214 = _208 > 0.0;
    out.m_63.y = _206;
    float _216 = _198;
    float _218 = _208;
    float _220 = _202;
    float _222 = _168;
    float _224 = _206;
    if (_212)
    {
        float _226 = rsqrt(_198);
        _216 = _226;
    }
    float _228 = _216;
    float _230 = 0.0;
    if (!_212)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _210 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    if (!_212)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = 0.0;
    float _244 = _240;
    if (!_212)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = _210;
    float _250 = _246;
    if (_214)
    {
        float _252 = rsqrt(_200);
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    if (!_214)
    {
        _256 = 0.0;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (!_214)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (!_214)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = _204;
    float _274 = _270;
    if (_234)
    {
        float _276 = rsqrt(_202);
        _272 = _276;
    }
    float _278 = _272;
    if (_212)
    {
        float _280 = _228 * _174;
        _238 = _280;
    }
    float _282 = _238;
    if (_212)
    {
        float _284 = _228 * _168;
        _244 = _284;
    }
    float _286 = _244;
    if (_212)
    {
        float _288 = _228 * _180;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_234)
    {
        _218 = 0.0;
    }
    float _294 = _218;
    float _296 = 0.0;
    float _298 = _294;
    if (!_234)
    {
        _296 = 0.0;
    }
    float _300 = _296;
    float _302 = _300;
    if (_214)
    {
        float _304 = _254 * _176;
        _262 = _304;
    }
    float _306 = _262;
    float _308 = _306;
    if (!_234)
    {
        _220 = 0.0;
    }
    float _310 = _220;
    float _312 = _310;
    if (_214)
    {
        float _314 = _254 * _170;
        _268 = _314;
    }
    float _316 = _268;
    if (_214)
    {
        float _318 = _254 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_234)
    {
        float _322 = _278 * _178;
        _298 = _322;
    }
    float _324 = _298;
    if (_234)
    {
        float _326 = _278 * _172;
        _312 = _326;
    }
    float _328 = _312;
    if (_234)
    {
        float _330 = _278 * _184;
        _302 = _330;
    }
    float _332 = _302;
    bool _334 = !_292;
    float _352;
    if (!_334)
    {
        float _336 = in.m_65.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_114);
        float _358 = 1.0 / _356;
        float _360 = _148 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _370 = isnan(_362);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _384 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _408 = isnan(_362);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = _394 * _404;
    float _422 = -_394;
    float _424 = _422 + 1.0;
    float _426 = 1.0 / _382;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _434 = _400 * _396;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _362 + _436;
    float _440 = -_416;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _362 + _444;
    float _448 = _432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = fma(_434, _438, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _452 = _378 * _442;
    float _454 = _430 * _426;
    float _456 = _450 * _420;
    float _458 = fma(_454, _446, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _460 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _464 = fma(_458, _452, _460);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[117].x, _464);
    float _470 = _462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _472 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _470;
    out.m_67.y = _472;
    out.m_67.z = _448;
    out.m_67.w = _474;
    bool _476 = !_418;
    float _494;
    if (!_476)
    {
        float _478 = in.m_65.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_114);
        float _500 = 1.0 / _498;
        float _502 = _148 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    bool _506 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _508 = isnan(_504);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _522 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _524 = isnan(_504);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _540 = _504 + _538;
    float _542 = 1.0 / _520;
    float _544 = -_516;
    float _546 = _544 + 1.0;
    float _548 = _532 * _546;
    float _550 = -_532;
    float _552 = _550 + 1.0;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _536 * _542;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = fma(_566, _540, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _572 = _570 * _548;
    float _574 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[131].x, _572);
    float _576 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[132].x, _574);
    float _578 = _576 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _562;
    out.m_69.y = _564;
    out.m_69.z = _568;
    out.m_69.w = _578;
    bool _580 = !_558;
    float _598;
    if (!_580)
    {
        float _582 = in.m_65.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_114);
        float _604 = 1.0 / _602;
        float _606 = _148 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_65.w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _614 = _608 + _612;
    float _616 = in.m_48.x;
    float _618 = in.m_48.y;
    float _620 = in.m_48.z;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _624 = _622 != 0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _628 = _608 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _632 = _608 + _630;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _636 = _634 != 0;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _640 = _608 + _638;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _644 = _642 != 0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _656 = _654 != 0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _660 = _608 + _658;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _664 = _662 != 0;
    float _666 = in.m_61.x;
    float _668 = 1.0 / _652;
    float _670 = 0.0;
    if (!_624)
    {
        float _672 = in.m_65.z;
        _670 = _672;
    }
    float _674 = _670;
    bool _676 = _610 > 0.5;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _678;
    float _682 = in.m_71.x;
    float _684 = in.m_71.y;
    float _686 = in.m_71.z;
    float _688 = 1.0 / _648;
    float _690 = _182 * _618;
    float _692 = _176 * _618;
    float _694 = _170 * _618;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _700 = fma(_180, _616, _690);
    float _702 = fma(_174, _616, _692);
    float _704 = fma(_168, _616, _694);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _706;
    float _710 = fma(_184, _620, _700);
    bool _712 = _676;
    float _714 = _674;
    if (_636)
    {
        float _716 = in.m_65.z;
        _222 = _716;
    }
    float _718 = _222;
    float _720 = fma(_178, _620, _702);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _726 = fma(_172, _620, _704);
    float _728 = in.m_73.x;
    float _730 = in.m_73.y;
    float _732 = in.m_73.z;
    float _734 = 1.0 / _708;
    float _736 = _614 * _688;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _740 = _608 + _738;
    float _742 = _616;
    if (_644)
    {
        float _744 = in.m_65.x;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = _710 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _750 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _752 = isnan(_608);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    int _762 = 0;
    if (_636)
    {
        float _764 = -_666;
        float _766 = _764 + 1.0;
        _762 = as_type<int>(_766);
    }
    int _768 = _762;
    float _770 = 1.0 / _724;
    float _772 = _682 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _776 = _608 + _774;
    float _778 = _686 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _780 = _684 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _782 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = _776 * _668;
    float _786 = 1.0 / _698;
    float _788 = _628 * _734;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _794;
    bool _798 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _800 = isnan(_608);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = -_760;
    float _812 = _810 + 1.0;
    bool _814 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _816 = isnan(_608);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = 1.0 / _680;
    float _828 = -_206;
    float _830 = _828 + 1.0;
    float _832 = _740 * _770;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _728);
    bool _836 = false;
    if (_644)
    {
        bool _838 = _746 > 0.5;
        _836 = _838;
    }
    bool _840 = _836;
    float _842 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _844 = _676 ? as_type<int>(_830) : as_type<int>(_206);
    float _846 = _782 * _834;
    float _848 = 1.0 / _796;
    int _850 = as_type<int>(_846);
    if (_636)
    {
        bool _852 = _718 > 0.5;
        _712 = _852;
    }
    bool _854 = _712;
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _860 = _790 * _856;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _862;
    float _866 = _632 * _786;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _868;
    float _872 = _640 * _826;
    float _874 = fma(_864, _736, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _876 = _792 * _858;
    float _878 = fma(_870, _736, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _884;
    float _888 = _660 * _848;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _890;
    float _894 = fma(_882, _784, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _896 = fma(_886, _872, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _898 = fma(_892, _872, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _920 = fma(_906, _788, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _922 = fma(_910, _866, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _924 = fma(_914, _788, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _926 = fma(_902, _866, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _928 = _914;
    float _930 = _874;
    if (!_624)
    {
        float _932 = in.m_65.y;
        _928 = _932;
    }
    float _934 = _928;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _940 = fma(_918, _784, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _942 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _944 = isnan(_608);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _958 = fma(_938, _832, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _960 = _656 ? as_type<float>(_844) : _206;
    float _962 = in.m_75.x;
    float _964 = in.m_75.y;
    float _966 = in.m_75.z;
    bool _968 = _730 != 0.0;
    bool _970 = isnan(_730);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    float _978 = -_952;
    float _980 = _978 + 1.0;
    bool _982 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _984 = isnan(_608);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_956, _832, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _996 = _728 == 0.0;
    bool _998 = !_976;
    bool _1000 = _996 && _998;
    float _1002 = -_824;
    float _1004 = _1002 + 1.0;
    bool _1006 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1008 = isnan(_608);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = _992 * _980;
    float _1020 = -_992;
    float _1022 = _1020 + 1.0;
    bool _1024 = _732 == 0.0;
    bool _1026 = _1024 && _1000;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1030 = _760 * _1022;
    bool _1032 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1034 = isnan(_608);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _1016 * _1004;
    bool _1046 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1048 = isnan(_608);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = -_1016;
    float _1060 = _1058 + 1.0;
    float _1062 = _992;
    float _1064 = _952;
    float _1066 = _1044;
    if (!_624)
    {
        _1062 = _934;
    }
    float _1068 = _1062;
    float _1070 = -_1042;
    float _1072 = _1070 + 1.0;
    float _1074 = _952 * _1060;
    if (!_644)
    {
        _1064 = _666;
    }
    float _1076 = _1064;
    float _1078 = _1056 * _1072;
    float _1080 = _1068;
    float _1082 = _934;
    float _1084 = _1076;
    if (_624)
    {
        float _1086 = in.m_65.x;
        float _1088 = in.m_65.y;
        _1080 = _1086;
        _1082 = _1088;
    }
    float _1090 = _1080;
    float _1092 = _1082;
    float _1094 = _962;
    float _1096 = _964;
    float _1098 = _966;
    if (!_1026)
    {
        float _1100 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _1094 = _1100;
    }
    float _1102 = _1094;
    float _1104 = _808 * _812;
    float _1106 = -_808;
    float _1108 = _1106 + 1.0;
    if (!_1026)
    {
        float _1110 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1096 = _1110;
    }
    float _1112 = _1096;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1114;
    float _1118 = _1042 * _1108;
    if (!_1026)
    {
        float _1120 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1098 = _1120;
    }
    float _1122 = _1098;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1124;
    float _1128 = _874 * _1078;
    float _1130 = _878 * _1078;
    float _1132 = fma(_1116, _888, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1134 = fma(_1126, _888, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1136 = _876 * _306;
    float _1138 = _876 * _320;
    float _1140 = _876 * _316;
    if (!_624)
    {
        _930 = _674;
    }
    float _1142 = _930;
    float _1144 = fma(_846, _282, _1136);
    float _1146 = fma(_846, _290, _1138);
    float _1148 = _316 * _1112;
    float _1150 = _320 * _1112;
    float _1152 = -_1056;
    float _1154 = _1152 + 1.0;
    float _1156 = fma(_860, _332, _1146);
    float _1158 = _1142;
    if (_624)
    {
        _1158 = _1092;
    }
    float _1160 = _1158;
    float _1162 = fma(_286, _1102, _1148);
    float _1164 = _1162;
    if (_624)
    {
        _714 = _1092;
    }
    float _1166 = _714;
    float _1168 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1170 = _1092 > 0.5;
    float _1172 = fma(_846, _286, _1140);
    float _1174 = _306 * _1112;
    float _1176 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1178 = fma(_860, _324, _1144);
    float _1180 = fma(_282, _1102, _1174);
    float _1182 = _748 + _1156;
    float _1184 = _1176 + _1178;
    float _1186 = _1184;
    float _1188 = _1182;
    if (_644)
    {
        float _1190 = -_666;
        float _1192 = _1190 + 1.0;
        _850 = as_type<int>(_1192);
    }
    int _1194 = _850;
    float _1196 = fma(_290, _1102, _1150);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1184 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1182 + _1204;
    if (_644)
    {
        float _1208 = _840 ? as_type<float>(_1194) : _666;
        _1084 = _1208;
    }
    float _1210 = _1084;
    float _1212 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1198);
    float _1214 = _1202 * _1202;
    float _1216 = _1206 * _1206;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1220 = _1214;
    float _1222 = _1216;
    if (!_636)
    {
        _308 = _666;
    }
    float _1224 = _308;
    float _1226 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1228 = _1214 + _1216;
    float _1230 = _1224;
    if (_636)
    {
        float _1232 = _854 ? as_type<float>(_768) : _666;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1128);
    float _1238 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1130);
    float _1240 = fma(_1226, _960, -0.5);
    float _1242 = sqrt(_1228);
    float _1244 = fma(_894, _1118, _1236);
    float _1246 = fma(_940, _1118, _1238);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_664)
    {
        float _1250 = _1170 ? _830 : _206;
        _224 = _1250;
    }
    float _1252 = _224;
    float _1254 = fma(_896, _1104, _1244);
    float _1256 = fma(_898, _1104, _1246);
    float _1258 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1262 = fma(_860, _328, _1172);
    float _1264 = fma(_1258, _1234, -0.5);
    float _1266 = -_1260;
    float _1268 = fma(_1168, 2.0, _1266);
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1272 = fma(_922, _1030, _1254);
    bool _1274 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1276 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1248);
    float _1278 = fma(_926, _1030, _1256);
    float _1280 = _842 + _1262;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1284 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1286 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1212);
    float _1288 = -_148;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1268);
    float _1292 = fma(_920, _1018, _1272);
    float _1294 = fma(_924, _1018, _1278);
    float _1296 = fma(_1284, -2.0, _1282);
    float _1298 = fma(_1286, _1264, _1290);
    float _1300 = fma(_958, _1074, _1292);
    float _1302 = _1278;
    if (!_1274)
    {
        _1302 = _1280;
    }
    float _1304 = _1302;
    bool _1306 = !_1274;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1242 + _1312;
        float _1316 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = rsqrt(_1228);
        float _1320 = _1314 * _1310;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        float _1332 = fma(_1326, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1334 = _1318 * _1332;
        float _1336 = _1330 + (-1.0);
        float _1338 = fma(_1202, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = fma(_1206, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1350 = _1340 + _1348;
        float _1352 = fma(_1280, _1330, _1342);
        float _1354 = _1346 * _1346;
        float _1356 = _1350 * _1350;
        _1308 = _1352;
        _1220 = _1354;
        _1222 = _1356;
        _1186 = _1338;
        _1188 = _1340;
    }
    float _1358 = _1308;
    float _1360 = _1220;
    float _1362 = _1222;
    float _1364 = _1186;
    float _1366 = _1188;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1370 = _1358 + _1368;
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1374 = fma(_994, _1074, _1294);
    float _1376 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1276);
    float _1378 = fma(_1370, _1370, _1360);
    float _1380 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1382 = fma(_1132, _1044, _1374);
    float _1384 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1378 + _1362;
    float _1388 = fma(_1134, _1044, _1300);
    float _1390 = -_1380;
    float _1392 = fma(_1376, _1240, _1390);
    float _1394 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1396 = fma(_324, _1122, _1180);
    float _1398 = _1384 * _1270;
    float _1400 = sqrt(_1386);
    float _1402 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1388);
    float _1404 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1382);
    float _1406 = _1394 * _1372;
    float _1408 = _1298 + 0.5;
    float _1410 = _1392 + 0.5;
    float _1412 = fma(_328, _1122, _1162);
    float _1414 = fma(_332, _1122, _1196);
    out.m_77.x = _1402;
    out.m_77.y = _1404;
    out.m_79.x = _1398;
    out.m_79.y = _1406;
    out.m_79.z = _1408;
    out.m_79.w = _1410;
    out.m_81.x = _1396;
    out.m_81.y = _1412;
    out.m_81.z = _1414;
    bool _1416 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1418 = isnan(_1400);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1424 = _1420 || _1422;
    float _1426 = _1392;
    float _1428 = _1382;
    if (!_1424)
    {
        _1426 = 1.0;
    }
    float _1430 = _1426;
    bool _1432 = !_1424;
    float _1434 = _1430;
    if (!_1432)
    {
        bool _1436 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1438 = isnan(_1400);
        bool _1440 = _1436 || _1438;
        bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1444 = _1440 || _1442;
        if (!_1444)
        {
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = _1400 + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1452 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1450;
            float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1458 = 1.0 / _1452;
            float _1460 = _1448 * _1458;
            float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1434 = _1462;
            _1464 = true;
        }
        else
        {
            bool _1466 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1468 = isnan(_1400);
            bool _1470 = _1466 || _1468;
            bool _1472 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1474 = _1470 || _1472;
            if (!_1474)
            {
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1400 + _1476;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1486 = _1484 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1488 = 1.0 / _1482;
                float _1490 = _1478 * _1488;
                float _1492 = fma(_1490, _1486, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1434 = _1492;
                _1464 = true;
            }
            else
            {
                _1434 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1464 = false;
    float _1494 = _1434;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1498 = _1358 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1502 = _1364 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1506 = _1366 + _1504;
    float _1508 = fma(_1498, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1510 = fma(_1502, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1512 = fma(_1506, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1508 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1510 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1512 + _1522;
    float _1526 = _1516 * _1516;
    float _1528 = fma(_1520, _1520, _1526);
    float _1530 = fma(_1524, _1524, _1528);
    float _1532 = rsqrt(_1530);
    float _1534 = sqrt(_1530);
    float _1536 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1538 = _1520 * _1536;
    float _1540 = _1524 * _1536;
    float _1542 = _1538 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 + _1544;
    float _1548 = sqrt(_1546);
    bool _1550 = _1548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1548 + _1552;
    float _1556 = _1210;
    float _1558 = _1554;
    float _1560 = _1524;
    float _1562 = _1516;
    if (_1550)
    {
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1556 = _1564;
    }
    float _1566 = _1556;
    if (_1550)
    {
        float _1568 = rsqrt(_1546);
        _1066 = _1568;
    }
    float _1570 = _1066;
    if (_1550)
    {
        float _1572 = _1554 * _1566;
        _1558 = _1572;
    }
    float _1574 = _1558;
    float _1576 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1550)
    {
        float _1578 = _1574 * 0.15915493667125701904296875;
        _1428 = _1578;
    }
    float _1580 = _1428;
    float _1582 = _328;
    float _1584 = _1580;
    if (_1550)
    {
        float _1586 = _1580 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1582 = _1588;
    }
    float _1590 = _1582;
    float _1592 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1594 = precise::max(0.0, _1592);
    float _1596 = _1074;
    float _1598 = _1594;
    float _1600 = _1592;
    if (_1550)
    {
        float _1602 = _1580 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = -_1536;
    float _1610 = -_1594;
    float _1612 = fma(_1516, _1608, _1610);
    float _1614 = _1612;
    if (_1550)
    {
        float _1616 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1598 = _1616;
    }
    float _1618 = _1598;
    float _1620 = _1618;
    if (!_1550)
    {
        _1584 = _1538;
    }
    float _1622 = _1584;
    float _1624 = _1590;
    float _1626 = _1622;
    if (_1550)
    {
        float _1628 = fma(_1590, _1618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = _1630;
    if (_1550)
    {
        float _1634 = _1606 + (-1.0);
        _1600 = _1634;
    }
    float _1636 = _1600;
    float _1638 = _1636;
    if (_1550)
    {
        float _1640 = _1570 * _1630;
        _1164 = _1640;
    }
    float _1642 = _1164;
    if (!_1550)
    {
        _1632 = _1540;
    }
    float _1644 = _1632;
    float _1646 = _1644;
    if (_1550)
    {
        float _1648 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1648;
    }
    float _1650 = _1620;
    float _1652 = _1650;
    if (_1550)
    {
        float _1654 = _1538 * _1642;
        _1626 = _1654;
    }
    float _1656 = _1626;
    if (_1550)
    {
        float _1658 = _1540 * _1642;
        _1646 = _1658;
    }
    float _1660 = _1646;
    if (!_1550)
    {
        _1638 = _1544;
    }
    float _1662 = _1638;
    float _1664 = _1662;
    if (_1550)
    {
        float _1666 = fma(_1612, _1606, _1650);
        _1614 = _1666;
    }
    float _1668 = _1614;
    if (!_1550)
    {
        _1652 = _1542;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1550)
    {
        float _1674 = _1656 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (_1550)
    {
        float _1678 = _1660 * _1660;
        _1664 = _1678;
    }
    float _1680 = _1664;
    float _1682 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = fma(_1668, _1668, _1676);
    float _1686 = _1684 + _1680;
    float _1688 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1692 = fma(_1534, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1690);
    float _1694 = precise::clamp(_1692, 0.0, 1.0);
    float _1696 = rsqrt(_1686);
    float _1698 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1700 = -_1694;
    float _1702 = _1700 + 1.0;
    float _1704 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1706 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1712 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1576);
    float _1714 = abs(_1702);
    float _1716 = log2(_1714);
    float _1718 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1724 = -_1718;
    float _1726 = fma(_1724, _1706, 1.0);
    float _1728 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1730 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1732 = _1696 * _1656;
    float _1734 = _1696 * _1668;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1728);
    float _1738 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1740 = _1696 * _1660;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1744 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = floor(_1704);
    float _1750 = -_1742;
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1750);
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1758 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = -_1740;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1752);
    float _1764 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1756);
    float _1768 = floor(_1710);
    float _1770 = fma(_1762, -0.5, 0.5);
    float _1772 = fma(_1762, 0.5, 0.5);
    float _1774 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1776 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1774);
    float _1780 = -_1748;
    float _1782 = _1704 + _1780;
    float _1784 = exp2(_1764);
    float _1786 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1788 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1790 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1786);
    float _1792 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1794 = -_1768;
    float _1796 = _1710 + _1794;
    float _1798 = log2(_1726);
    float _1800 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1802 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1804 = _1734 + 1.0;
    float _1806 = fma(_1772, _1800, -0.212114393711090087890625);
    float _1808 = 1.0 / _1778;
    float _1810 = fma(_1772, _1806, 1.570728778839111328125);
    float _1812 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1802);
    float _1814 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1816 = sqrt(_1770);
    float _1818 = _1798 * 0.693147182464599609375;
    float2 _5162 = float2(_1782, _1796);
    float _1820 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5162, float2(0.0), isnan(_5162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5162, float2(0.0), isnan(_5162)), level(0.0)).x;
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1824 = _1814 * _1808;
    float _1826 = -_1734;
    float _1828 = fma(_1784, _1804, _1826);
    float _1830 = _1812 * _1808;
    float _1832 = fma(_1824, -0.5, 0.5);
    float _1834 = fma(_1828, 0.5, 0.5);
    float _1836 = fma(_1830, 0.5, 0.5);
    float _1838 = _1816 * 0.636619746685028076171875;
    float3 _5198 = float3(_1836, _1832, _1822);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5198, float3(0.0), isnan(_5198)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5198, float3(0.0), isnan(_5198)), level(0.0)).x;
    float3 _5209 = float3(_1836, _1832, _1822);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5209, float3(0.0), isnan(_5209)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5209, float3(0.0), isnan(_5209)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1810;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _5230 = float2(_1855, _1834);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5230, float2(0.0), isnan(_5230)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5230, float2(0.0), isnan(_5230)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _842 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _842 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1875 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    float _1877 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1879 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1873);
    float _1881 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1875);
    float _1883 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1877);
    float _1885 = exp2(_1871);
    float _1887 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1891 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1879);
    out.m_83.x = _1520;
    out.m_83.y = _1516;
    out.m_83.z = _1524;
    float _1893 = _1889 + _1887;
    bool _1895 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1897 = isnan(_1534);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1903 = _1899 || _1901;
    float _1905 = 1.0 / _1887;
    float _1907 = -_1885;
    float _1909 = _1907 + 1.0;
    float _1911 = _1909;
    if (!_1903)
    {
        _1560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1560;
    float _1915 = _1913;
    float _1917 = _1913;
    if (!_1903)
    {
        _1562 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1919 = _1562;
    float _1921 = _1893 * _1905;
    float _1923 = _1921 * 0.5;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1927 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
    float _1929 = 1.0 / _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1933 = _1929 * _1931;
    float _1935 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1891);
    float _1937 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = abs(_1933);
    float _1941 = log2(_1939);
    float _1943 = _1919;
    float _1945 = _1919;
    if (!_1903)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1947 = _1911;
    bool _1949 = _1933 <= 8000.0;
    bool _1951 = isnan(_1933);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(8000.0);
    bool _1957 = _1953 || _1955;
    float _1959 = float(_1957);
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1963 = exp2(_1961);
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = _1935 + _1778;
    float _1971 = fma(_1967, -2.0, 3.0);
    float _1973 = _1967 * _1967;
    float _1975 = _1969 * 0.5;
    float _1977 = _1973 * _1971;
    float _1979 = in.m_85.x;
    float _1981 = -_1977;
    float _1983 = _1981 + 1.0;
    out.m_87.z = _1975;
    out.m_87.w = _1778;
    float _1985 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1977);
    float _1987 = _1959 * _1985;
    out.gl_Position.x = _1812;
    out.gl_Position.y = _1814;
    out.gl_Position.z = _1935;
    out.gl_Position.w = _1778;
    float _1989 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1991 = _1812;
    float _1993 = _1947;
    float _1995 = _1947;
    if (!_1903)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1997 = _1991;
    float _1999 = -_1820;
    float _2001 = _1999 + 1.0;
    float _2003 = _2001 * _1989;
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = -_2005;
    float _2009 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2011 = _2009 * _1979;
    float _2013 = _1937 * _1840;
    float _2015 = -_1937;
    float _2017 = _2015 + 1.0;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2021 = _2011;
    float _2023 = _1997;
    float _2025 = _1997;
    if (!_1903)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2027 = _2021;
    float _2029 = _1851 * _2013;
    float _2031 = _1851 * _2017;
    out.m_89.x = _2019;
    float _2033 = _1865 * _2013;
    float _2035 = fma(_1861, _2029, _1845);
    float _2037 = fma(_1863, _2029, _1847);
    float _2039 = _2029;
    float _2041 = _2027;
    float _2043 = _2027;
    if (!_1903)
    {
        _2039 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2045 = _2039;
    float _2047 = fma(_1851, _2033, _1849);
    out.m_91.x = _2035;
    out.m_91.y = _2037;
    out.m_91.z = _2047;
    out.m_91.w = _2031;
    bool _2049 = !_1903;
    float _2051 = _2045;
    float _2053 = _2045;
    if (!_2049)
    {
        bool _2055 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2057 = isnan(_1534);
        bool _2059 = _2055 || _2057;
        bool _2061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2063 = _2059 || _2061;
        if (!_2063)
        {
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2067 = _1534 + _2065;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2069;
            float _2073 = 1.0 / _2071;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2095 = _2067 * _2073;
            float _2097 = precise::clamp(_2095, 0.0, 1.0);
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2103 = fma(_2097, _2077, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2105 = fma(_2097, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2107 = fma(_2097, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2109 = fma(_2097, _2085, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2111 = fma(_2097, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2113 = fma(_2097, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1995 = _2105;
            _2053 = _2111;
            _2025 = _2103;
            _1945 = _2109;
            _1917 = _2107;
            _2043 = _2113;
            _2115 = true;
        }
        else
        {
            bool _2117 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2119 = isnan(_1534);
            bool _2121 = _2117 || _2119;
            bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2125 = _2121 || _2123;
            if (!_2125)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2127 = _2023;
            _2025 = _2127;
            if (!_2125)
            {
                _1993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2129 = _1993;
            _1995 = _2129;
            if (!_2125)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2131 = _1915;
            _1917 = _2131;
            if (!_2125)
            {
                _1943 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2133 = _1943;
            _1945 = _2133;
            if (!_2125)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2135 = _2051;
            _2053 = _2135;
            if (!_2125)
            {
                _2041 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2137 = _2041;
            bool _2139 = !_2125;
            _2043 = _2137;
            if (!_2139)
            {
                bool _2141 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2143 = isnan(_1534);
                bool _2145 = _2141 || _2143;
                bool _2147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2149 = _2145 || _2147;
                if (!_2149)
                {
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2153 = _1534 + _2151;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2155;
                    float _2159 = 1.0 / _2157;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2181 = _2153 * _2159;
                    float _2183 = precise::clamp(_2181, 0.0, 1.0);
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2189 = fma(_2183, _2163, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2191 = fma(_2183, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2193 = fma(_2183, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2195 = fma(_2183, _2171, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2197 = fma(_2183, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2199 = fma(_2183, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1995 = _2191;
                    _2053 = _2197;
                    _2025 = _2189;
                    _1945 = _2195;
                    _1917 = _2193;
                    _2043 = _2199;
                    _2115 = true;
                }
                else
                {
                    _1995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1945 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2043 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2115 = false;
    float _2201 = _1995;
    float _2203 = _2053;
    float _2205 = _2025;
    float _2207 = _1945;
    float _2209 = _1917;
    float _2211 = _2043;
    float _2213 = fma(_1412, -0.5, 0.5);
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = -_2201;
    float _2219 = _2217 + _2203;
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    bool _2229 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2231 = fma(_2215, _2219, _2201);
    float _2233 = fma(_2215, _2223, _2205);
    float _2235 = fma(_2215, _2227, _2209);
    float _2237 = _2231 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2239 = fma(_2233, 0.298911988735198974609375, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = fma(_2235, 0.114477999508380889892578125, _2239);
    out.m_51.x = _2241;
    float _2245 = -_2243;
    float _2247 = _2233 + _2245;
    float _2249 = -_2243;
    float _2251 = _2231 + _2249;
    float _2253 = -_2243;
    float _2255 = _2235 + _2253;
    float _2257 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_95.x = _2257;
    out.m_95.y = _2259;
    out.m_95.z = _2261;
    if (!_2229)
    {
        return out;
    }
    float _2263 = -_1508;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2267 = -_1510;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2271 = -_1512;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2275 = _2265 * _2265;
    float _2277 = fma(_2269, _2269, _2275);
    float _2279 = fma(_2273, _2273, _2277);
    float _2281 = sqrt(_2279);
    float _2283 = rsqrt(_2279);
    float _2285 = -_2281;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = _2269 * _2283;
    float _2295 = _2265 * _2283;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2273 * _2283;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2305 = _1412 * _2295;
    float _2307 = -_2295;
    float _2309 = -_2303;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2309);
    float _2313 = fma(_1396, _2293, _2305);
    float _2315 = -_2301;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2311);
    float _2319 = fma(_1414, _2301, _2313);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2325 = _2317 + _2323;
    float _2327 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = exp2(_2327);
    float _2335 = _2333 * _2331;
    float _2337 = _2321 * _2335;
    float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2339;
    out.m_93.y = _2341;
    out.m_93.z = _2343;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2115 = false;
    bool _1464 = false;
    bool _600 = false;
    bool _496 = false;
    bool _354 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_51.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2400 = as_type<float>(_130);
        out.gl_Position.z = _2400;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_53.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    if (_144)
    {
        float _152 = float(_114);
        _150 = _152;
    }
    float _154 = _150;
    bool _156 = _148 >= _154;
    bool _158 = !_144;
    bool _160 = _156 || _158;
    if (_160)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _124;
    if (_160)
    {
        out.m_51.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2468 = as_type<float>(_166);
        out.gl_Position.z = _2468;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.x;
    float _170 = in.m_55.y;
    float _172 = in.m_55.z;
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    float _180 = in.m_59.x;
    float _182 = in.m_59.y;
    float _184 = in.m_59.z;
    float _186 = _168 * _168;
    float _188 = _170 * _170;
    float _190 = _172 * _172;
    float _192 = fma(_174, _174, _186);
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_178, _178, _190);
    float _198 = fma(_180, _180, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = sqrt(_198);
    float _206 = in.m_61.y;
    float _208 = sqrt(_200);
    float _210 = sqrt(_202);
    bool _212 = _204 > 0.0;
    bool _214 = _208 > 0.0;
    out.m_63.y = _206;
    float _216 = _198;
    float _218 = _208;
    float _220 = _202;
    float _222 = _168;
    float _224 = _206;
    if (_212)
    {
        float _226 = rsqrt(_198);
        _216 = _226;
    }
    float _228 = _216;
    float _230 = 0.0;
    if (!_212)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _210 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    if (!_212)
    {
        _236 = 0.0;
    }
    float _240 = _236;
    float _242 = 0.0;
    float _244 = _240;
    if (!_212)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = _210;
    float _250 = _246;
    if (_214)
    {
        float _252 = rsqrt(_200);
        _248 = _252;
    }
    float _254 = _248;
    float _256 = 0.0;
    if (!_214)
    {
        _256 = 0.0;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (!_214)
    {
        _260 = 0.0;
    }
    float _264 = _260;
    float _266 = 0.0;
    float _268 = _264;
    if (!_214)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = _204;
    float _274 = _270;
    if (_234)
    {
        float _276 = rsqrt(_202);
        _272 = _276;
    }
    float _278 = _272;
    if (_212)
    {
        float _280 = _228 * _174;
        _238 = _280;
    }
    float _282 = _238;
    if (_212)
    {
        float _284 = _228 * _168;
        _244 = _284;
    }
    float _286 = _244;
    if (_212)
    {
        float _288 = _228 * _180;
        _250 = _288;
    }
    float _290 = _250;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    if (!_234)
    {
        _218 = 0.0;
    }
    float _294 = _218;
    float _296 = 0.0;
    float _298 = _294;
    if (!_234)
    {
        _296 = 0.0;
    }
    float _300 = _296;
    float _302 = _300;
    if (_214)
    {
        float _304 = _254 * _176;
        _262 = _304;
    }
    float _306 = _262;
    float _308 = _306;
    if (!_234)
    {
        _220 = 0.0;
    }
    float _310 = _220;
    float _312 = _310;
    if (_214)
    {
        float _314 = _254 * _170;
        _268 = _314;
    }
    float _316 = _268;
    if (_214)
    {
        float _318 = _254 * _182;
        _274 = _318;
    }
    float _320 = _274;
    if (_234)
    {
        float _322 = _278 * _178;
        _298 = _322;
    }
    float _324 = _298;
    if (_234)
    {
        float _326 = _278 * _172;
        _312 = _326;
    }
    float _328 = _312;
    if (_234)
    {
        float _330 = _278 * _184;
        _302 = _330;
    }
    float _332 = _302;
    bool _334 = !_292;
    float _352;
    if (!_334)
    {
        float _336 = in.m_65.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_114);
        float _358 = 1.0 / _356;
        float _360 = _148 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _368 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _370 = isnan(_362);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _384 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _386 = isnan(_362);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _366;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _398;
    float _402 = -_378;
    float _404 = _402 + 1.0;
    bool _406 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _408 = isnan(_362);
    bool _410 = _406 || _408;
    bool _412 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _414 = _410 || _412;
    float _416 = float(_414);
    bool _418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _420 = _394 * _404;
    float _422 = -_394;
    float _424 = _422 + 1.0;
    float _426 = 1.0 / _382;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _434 = _400 * _396;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _438 = _362 + _436;
    float _440 = -_416;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _362 + _444;
    float _448 = _432 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = fma(_434, _438, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _452 = _378 * _442;
    float _454 = _430 * _426;
    float _456 = _450 * _420;
    float _458 = fma(_454, _446, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _460 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[115].x, _456);
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _464 = fma(_458, _452, _460);
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _468 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[117].x, _464);
    float _470 = _462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _472 = _466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _474 = _468 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _470;
    out.m_67.y = _472;
    out.m_67.z = _448;
    out.m_67.w = _474;
    bool _476 = !_418;
    float _494;
    if (!_476)
    {
        float _478 = in.m_65.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].w, _148);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_114);
        float _500 = 1.0 / _498;
        float _502 = _148 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    bool _506 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _508 = isnan(_504);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _522 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _524 = isnan(_504);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _540 = _504 + _538;
    float _542 = 1.0 / _520;
    float _544 = -_516;
    float _546 = _544 + 1.0;
    float _548 = _532 * _546;
    float _550 = -_532;
    float _552 = _550 + 1.0;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _562 = _554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _564 = _556 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _536 * _542;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = fma(_566, _540, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _572 = _570 * _548;
    float _574 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[131].x, _572);
    float _576 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[132].x, _574);
    float _578 = _576 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _562;
    out.m_69.y = _564;
    out.m_69.z = _568;
    out.m_69.w = _578;
    bool _580 = !_558;
    float _598;
    if (!_580)
    {
        float _582 = in.m_65.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[14].x, _148);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_114);
        float _604 = 1.0 / _602;
        float _606 = _148 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_65.w;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _614 = _608 + _612;
    float _616 = in.m_48.x;
    float _618 = in.m_48.y;
    float _620 = in.m_48.z;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _624 = _622 != 0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _628 = _608 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _632 = _608 + _630;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _636 = _634 != 0;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _640 = _608 + _638;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _644 = _642 != 0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _656 = _654 != 0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _660 = _608 + _658;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _664 = _662 != 0;
    float _666 = in.m_61.x;
    float _668 = 1.0 / _652;
    float _670 = 0.0;
    if (!_624)
    {
        float _672 = in.m_65.z;
        _670 = _672;
    }
    float _674 = _670;
    bool _676 = _610 > 0.5;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _678;
    float _682 = in.m_71.x;
    float _684 = in.m_71.y;
    float _686 = in.m_71.z;
    float _688 = 1.0 / _648;
    float _690 = _182 * _618;
    float _692 = _176 * _618;
    float _694 = _170 * _618;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _700 = fma(_180, _616, _690);
    float _702 = fma(_174, _616, _692);
    float _704 = fma(_168, _616, _694);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _706;
    float _710 = fma(_184, _620, _700);
    bool _712 = _676;
    float _714 = _674;
    if (_636)
    {
        float _716 = in.m_65.z;
        _222 = _716;
    }
    float _718 = _222;
    float _720 = fma(_178, _620, _702);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _726 = fma(_172, _620, _704);
    float _728 = in.m_73.x;
    float _730 = in.m_73.y;
    float _732 = in.m_73.z;
    float _734 = 1.0 / _708;
    float _736 = _614 * _688;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _740 = _608 + _738;
    float _742 = _616;
    if (_644)
    {
        float _744 = in.m_65.x;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = _710 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _750 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _752 = isnan(_608);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    int _762 = 0;
    if (_636)
    {
        float _764 = -_666;
        float _766 = _764 + 1.0;
        _762 = as_type<int>(_766);
    }
    int _768 = _762;
    float _770 = 1.0 / _724;
    float _772 = _682 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _776 = _608 + _774;
    float _778 = _686 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _780 = _684 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _782 = _772 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = _776 * _668;
    float _786 = 1.0 / _698;
    float _788 = _628 * _734;
    float _790 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _792 = _780 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _794;
    bool _798 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _800 = isnan(_608);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _806 = _802 || _804;
    float _808 = float(_806);
    float _810 = -_760;
    float _812 = _810 + 1.0;
    bool _814 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _816 = isnan(_608);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = 1.0 / _680;
    float _828 = -_206;
    float _830 = _828 + 1.0;
    float _832 = _740 * _770;
    float _834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _728);
    bool _836 = false;
    if (_644)
    {
        bool _838 = _746 > 0.5;
        _836 = _838;
    }
    bool _840 = _836;
    float _842 = _726 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _844 = _676 ? as_type<int>(_830) : as_type<int>(_206);
    float _846 = _782 * _834;
    float _848 = 1.0 / _796;
    int _850 = as_type<int>(_846);
    if (_636)
    {
        bool _852 = _718 > 0.5;
        _712 = _852;
    }
    bool _854 = _712;
    float _856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _732);
    float _858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _730);
    float _860 = _790 * _856;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _862;
    float _866 = _632 * _786;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _868;
    float _872 = _640 * _826;
    float _874 = fma(_864, _736, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _876 = _792 * _858;
    float _878 = fma(_870, _736, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _884;
    float _888 = _660 * _848;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _890;
    float _894 = fma(_882, _784, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _896 = fma(_886, _872, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _898 = fma(_892, _872, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _920 = fma(_906, _788, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _922 = fma(_910, _866, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _924 = fma(_914, _788, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _926 = fma(_902, _866, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _928 = _914;
    float _930 = _874;
    if (!_624)
    {
        float _932 = in.m_65.y;
        _928 = _932;
    }
    float _934 = _928;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _940 = fma(_918, _784, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _942 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _944 = isnan(_608);
    bool _946 = _942 || _944;
    bool _948 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _950 = _946 || _948;
    float _952 = float(_950);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _958 = fma(_938, _832, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _960 = _656 ? as_type<float>(_844) : _206;
    float _962 = in.m_75.x;
    float _964 = in.m_75.y;
    float _966 = in.m_75.z;
    bool _968 = _730 != 0.0;
    bool _970 = isnan(_730);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.0);
    bool _976 = _972 || _974;
    float _978 = -_952;
    float _980 = _978 + 1.0;
    bool _982 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _984 = isnan(_608);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = fma(_956, _832, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _996 = _728 == 0.0;
    bool _998 = !_976;
    bool _1000 = _996 && _998;
    float _1002 = -_824;
    float _1004 = _1002 + 1.0;
    bool _1006 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1008 = isnan(_608);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    float _1018 = _992 * _980;
    float _1020 = -_992;
    float _1022 = _1020 + 1.0;
    bool _1024 = _732 == 0.0;
    bool _1026 = _1024 && _1000;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1030 = _760 * _1022;
    bool _1032 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1034 = isnan(_608);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _1016 * _1004;
    bool _1046 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1048 = isnan(_608);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1054 = _1050 || _1052;
    float _1056 = float(_1054);
    float _1058 = -_1016;
    float _1060 = _1058 + 1.0;
    float _1062 = _992;
    float _1064 = _952;
    float _1066 = _1044;
    if (!_624)
    {
        _1062 = _934;
    }
    float _1068 = _1062;
    float _1070 = -_1042;
    float _1072 = _1070 + 1.0;
    float _1074 = _952 * _1060;
    if (!_644)
    {
        _1064 = _666;
    }
    float _1076 = _1064;
    float _1078 = _1056 * _1072;
    float _1080 = _1068;
    float _1082 = _934;
    float _1084 = _1076;
    if (_624)
    {
        float _1086 = in.m_65.x;
        float _1088 = in.m_65.y;
        _1080 = _1086;
        _1082 = _1088;
    }
    float _1090 = _1080;
    float _1092 = _1082;
    float _1094 = _962;
    float _1096 = _964;
    float _1098 = _966;
    if (!_1026)
    {
        float _1100 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[17].y, _962);
        _1094 = _1100;
    }
    float _1102 = _1094;
    float _1104 = _808 * _812;
    float _1106 = -_808;
    float _1108 = _1106 + 1.0;
    if (!_1026)
    {
        float _1110 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1096 = _1110;
    }
    float _1112 = _1096;
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1114;
    float _1118 = _1042 * _1108;
    if (!_1026)
    {
        float _1120 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1098 = _1120;
    }
    float _1122 = _1098;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1126 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1124;
    float _1128 = _874 * _1078;
    float _1130 = _878 * _1078;
    float _1132 = fma(_1116, _888, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1134 = fma(_1126, _888, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1136 = _876 * _306;
    float _1138 = _876 * _320;
    float _1140 = _876 * _316;
    if (!_624)
    {
        _930 = _674;
    }
    float _1142 = _930;
    float _1144 = fma(_846, _282, _1136);
    float _1146 = fma(_846, _290, _1138);
    float _1148 = _316 * _1112;
    float _1150 = _320 * _1112;
    float _1152 = -_1056;
    float _1154 = _1152 + 1.0;
    float _1156 = fma(_860, _332, _1146);
    float _1158 = _1142;
    if (_624)
    {
        _1158 = _1092;
    }
    float _1160 = _1158;
    float _1162 = fma(_286, _1102, _1148);
    float _1164 = _1162;
    if (_624)
    {
        _714 = _1092;
    }
    float _1166 = _714;
    float _1168 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1170 = _1092 > 0.5;
    float _1172 = fma(_846, _286, _1140);
    float _1174 = _306 * _1112;
    float _1176 = _720 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1178 = fma(_860, _324, _1144);
    float _1180 = fma(_282, _1102, _1174);
    float _1182 = _748 + _1156;
    float _1184 = _1176 + _1178;
    float _1186 = _1184;
    float _1188 = _1182;
    if (_644)
    {
        float _1190 = -_666;
        float _1192 = _1190 + 1.0;
        _850 = as_type<int>(_1192);
    }
    int _1194 = _850;
    float _1196 = fma(_290, _1102, _1150);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1202 = _1184 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1182 + _1204;
    if (_644)
    {
        float _1208 = _840 ? as_type<float>(_1194) : _666;
        _1084 = _1208;
    }
    float _1210 = _1084;
    float _1212 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1198);
    float _1214 = _1202 * _1202;
    float _1216 = _1206 * _1206;
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1220 = _1214;
    float _1222 = _1216;
    if (!_636)
    {
        _308 = _666;
    }
    float _1224 = _308;
    float _1226 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1228 = _1214 + _1216;
    float _1230 = _1224;
    if (_636)
    {
        float _1232 = _854 ? as_type<float>(_768) : _666;
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1128);
    float _1238 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1130);
    float _1240 = fma(_1226, _960, -0.5);
    float _1242 = sqrt(_1228);
    float _1244 = fma(_894, _1118, _1236);
    float _1246 = fma(_940, _1118, _1238);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_664)
    {
        float _1250 = _1170 ? _830 : _206;
        _224 = _1250;
    }
    float _1252 = _224;
    float _1254 = fma(_896, _1104, _1244);
    float _1256 = fma(_898, _1104, _1246);
    float _1258 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1262 = fma(_860, _328, _1172);
    float _1264 = fma(_1258, _1234, -0.5);
    float _1266 = -_1260;
    float _1268 = fma(_1168, 2.0, _1266);
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1272 = fma(_922, _1030, _1254);
    bool _1274 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1276 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1248);
    float _1278 = fma(_926, _1030, _1256);
    float _1280 = _842 + _1262;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1284 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1286 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1212);
    float _1288 = -_148;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1268);
    float _1292 = fma(_920, _1018, _1272);
    float _1294 = fma(_924, _1018, _1278);
    float _1296 = fma(_1284, -2.0, _1282);
    float _1298 = fma(_1286, _1264, _1290);
    float _1300 = fma(_958, _1074, _1292);
    float _1302 = _1278;
    if (!_1274)
    {
        _1302 = _1280;
    }
    float _1304 = _1302;
    bool _1306 = !_1274;
    float _1308 = _1304;
    if (!_1306)
    {
        float _1310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1314 = _1242 + _1312;
        float _1316 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = rsqrt(_1228);
        float _1320 = _1314 * _1310;
        float _1322 = _1320 * 0.15915493667125701904296875;
        float _1324 = _1322 * 6.283185482025146484375;
        float _1326 = sin(_1324);
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = cos(_1328);
        float _1332 = fma(_1326, _1316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1334 = _1318 * _1332;
        float _1336 = _1330 + (-1.0);
        float _1338 = fma(_1202, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1340 = fma(_1206, _1334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1342 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1344 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1346 = _1338 + _1344;
        float _1348 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1350 = _1340 + _1348;
        float _1352 = fma(_1280, _1330, _1342);
        float _1354 = _1346 * _1346;
        float _1356 = _1350 * _1350;
        _1308 = _1352;
        _1220 = _1354;
        _1222 = _1356;
        _1186 = _1338;
        _1188 = _1340;
    }
    float _1358 = _1308;
    float _1360 = _1220;
    float _1362 = _1222;
    float _1364 = _1186;
    float _1366 = _1188;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1370 = _1358 + _1368;
    float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1374 = fma(_994, _1074, _1294);
    float _1376 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1276);
    float _1378 = fma(_1370, _1370, _1360);
    float _1380 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1382 = fma(_1132, _1044, _1374);
    float _1384 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1386 = _1378 + _1362;
    float _1388 = fma(_1134, _1044, _1300);
    float _1390 = -_1380;
    float _1392 = fma(_1376, _1240, _1390);
    float _1394 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1396 = fma(_324, _1122, _1180);
    float _1398 = _1384 * _1270;
    float _1400 = sqrt(_1386);
    float _1402 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1388);
    float _1404 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1382);
    float _1406 = _1394 * _1372;
    float _1408 = _1298 + 0.5;
    float _1410 = _1392 + 0.5;
    float _1412 = fma(_328, _1122, _1162);
    float _1414 = fma(_332, _1122, _1196);
    out.m_77.x = _1402;
    out.m_77.y = _1404;
    out.m_79.x = _1398;
    out.m_79.y = _1406;
    out.m_79.z = _1408;
    out.m_79.w = _1410;
    out.m_81.x = _1396;
    out.m_81.y = _1412;
    out.m_81.z = _1414;
    bool _1416 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1418 = isnan(_1400);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1424 = _1420 || _1422;
    float _1426 = _1392;
    float _1428 = _1382;
    if (!_1424)
    {
        _1426 = 1.0;
    }
    float _1430 = _1426;
    bool _1432 = !_1424;
    float _1434 = _1430;
    if (!_1432)
    {
        bool _1436 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1438 = isnan(_1400);
        bool _1440 = _1436 || _1438;
        bool _1442 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1444 = _1440 || _1442;
        if (!_1444)
        {
            float _1446 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1448 = _1400 + _1446;
            float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1452 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1450;
            float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1458 = 1.0 / _1452;
            float _1460 = _1448 * _1458;
            float _1462 = fma(_1460, _1456, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1434 = _1462;
            _1464 = true;
        }
        else
        {
            bool _1466 = _1400 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1468 = isnan(_1400);
            bool _1470 = _1466 || _1468;
            bool _1472 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1474 = _1470 || _1472;
            if (!_1474)
            {
                float _1476 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1478 = _1400 + _1476;
                float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1482 = _1480 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1486 = _1484 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1488 = 1.0 / _1482;
                float _1490 = _1478 * _1488;
                float _1492 = fma(_1490, _1486, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1434 = _1492;
                _1464 = true;
            }
            else
            {
                _1434 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1464 = false;
    float _1494 = _1434;
    float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1498 = _1358 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1502 = _1364 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1506 = _1366 + _1504;
    float _1508 = fma(_1498, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1510 = fma(_1502, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1512 = fma(_1506, _1494, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1516 = _1508 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1510 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1524 = _1512 + _1522;
    float _1526 = _1516 * _1516;
    float _1528 = fma(_1520, _1520, _1526);
    float _1530 = fma(_1524, _1524, _1528);
    float _1532 = rsqrt(_1530);
    float _1534 = sqrt(_1530);
    float _1536 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1538 = _1520 * _1536;
    float _1540 = _1524 * _1536;
    float _1542 = _1538 * _1538;
    float _1544 = _1540 * _1540;
    float _1546 = _1542 + _1544;
    float _1548 = sqrt(_1546);
    bool _1550 = _1548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1554 = _1548 + _1552;
    float _1556 = _1210;
    float _1558 = _1554;
    float _1560 = _1524;
    float _1562 = _1516;
    if (_1550)
    {
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1556 = _1564;
    }
    float _1566 = _1556;
    if (_1550)
    {
        float _1568 = rsqrt(_1546);
        _1066 = _1568;
    }
    float _1570 = _1066;
    if (_1550)
    {
        float _1572 = _1554 * _1566;
        _1558 = _1572;
    }
    float _1574 = _1558;
    float _1576 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1550)
    {
        float _1578 = _1574 * 0.15915493667125701904296875;
        _1428 = _1578;
    }
    float _1580 = _1428;
    float _1582 = _328;
    float _1584 = _1580;
    if (_1550)
    {
        float _1586 = _1580 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        _1582 = _1588;
    }
    float _1590 = _1582;
    float _1592 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1594 = precise::max(0.0, _1592);
    float _1596 = _1074;
    float _1598 = _1594;
    float _1600 = _1592;
    if (_1550)
    {
        float _1602 = _1580 * 6.283185482025146484375;
        float _1604 = cos(_1602);
        _1596 = _1604;
    }
    float _1606 = _1596;
    float _1608 = -_1536;
    float _1610 = -_1594;
    float _1612 = fma(_1516, _1608, _1610);
    float _1614 = _1612;
    if (_1550)
    {
        float _1616 = _1612 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1598 = _1616;
    }
    float _1618 = _1598;
    float _1620 = _1618;
    if (!_1550)
    {
        _1584 = _1538;
    }
    float _1622 = _1584;
    float _1624 = _1590;
    float _1626 = _1622;
    if (_1550)
    {
        float _1628 = fma(_1590, _1618, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1624 = _1628;
    }
    float _1630 = _1624;
    float _1632 = _1630;
    if (_1550)
    {
        float _1634 = _1606 + (-1.0);
        _1600 = _1634;
    }
    float _1636 = _1600;
    float _1638 = _1636;
    if (_1550)
    {
        float _1640 = _1570 * _1630;
        _1164 = _1640;
    }
    float _1642 = _1164;
    if (!_1550)
    {
        _1632 = _1540;
    }
    float _1644 = _1632;
    float _1646 = _1644;
    if (_1550)
    {
        float _1648 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1648;
    }
    float _1650 = _1620;
    float _1652 = _1650;
    if (_1550)
    {
        float _1654 = _1538 * _1642;
        _1626 = _1654;
    }
    float _1656 = _1626;
    if (_1550)
    {
        float _1658 = _1540 * _1642;
        _1646 = _1658;
    }
    float _1660 = _1646;
    if (!_1550)
    {
        _1638 = _1544;
    }
    float _1662 = _1638;
    float _1664 = _1662;
    if (_1550)
    {
        float _1666 = fma(_1612, _1606, _1650);
        _1614 = _1666;
    }
    float _1668 = _1614;
    if (!_1550)
    {
        _1652 = _1542;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1550)
    {
        float _1674 = _1656 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (_1550)
    {
        float _1678 = _1660 * _1660;
        _1664 = _1678;
    }
    float _1680 = _1664;
    float _1682 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = fma(_1668, _1668, _1676);
    float _1686 = _1684 + _1680;
    float _1688 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1692 = fma(_1534, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1690);
    float _1694 = precise::clamp(_1692, 0.0, 1.0);
    float _1696 = rsqrt(_1686);
    float _1698 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1700 = -_1694;
    float _1702 = _1700 + 1.0;
    float _1704 = fma(_1176, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1706 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1708 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = fma(_748, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1712 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1576);
    float _1714 = abs(_1702);
    float _1716 = log2(_1714);
    float _1718 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1720 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1722 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1724 = -_1718;
    float _1726 = fma(_1724, _1706, 1.0);
    float _1728 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1730 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1720);
    float _1732 = _1696 * _1656;
    float _1734 = _1696 * _1668;
    float _1736 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1728);
    float _1738 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1730);
    float _1740 = _1696 * _1660;
    float _1742 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1744 = fma(_1512, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = floor(_1704);
    float _1750 = -_1742;
    float _1752 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1750);
    float _1754 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1758 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = -_1740;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1752);
    float _1764 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1766 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1756);
    float _1768 = floor(_1710);
    float _1770 = fma(_1762, -0.5, 0.5);
    float _1772 = fma(_1762, 0.5, 0.5);
    float _1774 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1776 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1774);
    float _1780 = -_1748;
    float _1782 = _1704 + _1780;
    float _1784 = exp2(_1764);
    float _1786 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1788 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1776);
    float _1790 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1786);
    float _1792 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1788);
    float _1794 = -_1768;
    float _1796 = _1710 + _1794;
    float _1798 = log2(_1726);
    float _1800 = fma(_1772, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1802 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1804 = _1734 + 1.0;
    float _1806 = fma(_1772, _1800, -0.212114393711090087890625);
    float _1808 = 1.0 / _1778;
    float _1810 = fma(_1772, _1806, 1.570728778839111328125);
    float _1812 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1802);
    float _1814 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1816 = sqrt(_1770);
    float _1818 = _1798 * 0.693147182464599609375;
    float2 _5162 = float2(_1782, _1796);
    float _1820 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5162, float2(0.0), isnan(_5162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5162, float2(0.0), isnan(_5162)), level(0.0)).x;
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1824 = _1814 * _1808;
    float _1826 = -_1734;
    float _1828 = fma(_1784, _1804, _1826);
    float _1830 = _1812 * _1808;
    float _1832 = fma(_1824, -0.5, 0.5);
    float _1834 = fma(_1828, 0.5, 0.5);
    float _1836 = fma(_1830, 0.5, 0.5);
    float _1838 = _1816 * 0.636619746685028076171875;
    float3 _5198 = float3(_1836, _1832, _1822);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5198, float3(0.0), isnan(_5198)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5198, float3(0.0), isnan(_5198)), level(0.0)).x;
    float3 _5209 = float3(_1836, _1832, _1822);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5209, float3(0.0), isnan(_5209)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5209, float3(0.0), isnan(_5209)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1810;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _5230 = float2(_1855, _1834);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5230, float2(0.0), isnan(_5230)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5230, float2(0.0), isnan(_5230)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _842 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _842 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1875 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    float _1877 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1879 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1873);
    float _1881 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1875);
    float _1883 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1877);
    float _1885 = exp2(_1871);
    float _1887 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1889 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1891 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1879);
    out.m_83.x = _1520;
    out.m_83.y = _1516;
    out.m_83.z = _1524;
    float _1893 = _1889 + _1887;
    bool _1895 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1897 = isnan(_1534);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1903 = _1899 || _1901;
    float _1905 = 1.0 / _1887;
    float _1907 = -_1885;
    float _1909 = _1907 + 1.0;
    float _1911 = _1909;
    if (!_1903)
    {
        _1560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1913 = _1560;
    float _1915 = _1913;
    float _1917 = _1913;
    if (!_1903)
    {
        _1562 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1919 = _1562;
    float _1921 = _1893 * _1905;
    float _1923 = _1921 * 0.5;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1927 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
    float _1929 = 1.0 / _1927;
    float _1931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1933 = _1929 * _1931;
    float _1935 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1891);
    float _1937 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1939 = abs(_1933);
    float _1941 = log2(_1939);
    float _1943 = _1919;
    float _1945 = _1919;
    if (!_1903)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1947 = _1911;
    bool _1949 = _1933 <= 8000.0;
    bool _1951 = isnan(_1933);
    bool _1953 = _1949 || _1951;
    bool _1955 = isnan(8000.0);
    bool _1957 = _1953 || _1955;
    float _1959 = float(_1957);
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1963 = exp2(_1961);
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1967 = precise::clamp(_1965, 0.0, 1.0);
    float _1969 = _1935 + _1778;
    float _1971 = fma(_1967, -2.0, 3.0);
    float _1973 = _1967 * _1967;
    float _1975 = _1969 * 0.5;
    float _1977 = _1973 * _1971;
    float _1979 = in.m_85.x;
    float _1981 = -_1977;
    float _1983 = _1981 + 1.0;
    out.m_87.z = _1975;
    out.m_87.w = _1778;
    float _1985 = fma(_1983, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1977);
    float _1987 = _1959 * _1985;
    out.gl_Position.x = _1812;
    out.gl_Position.y = _1814;
    out.gl_Position.z = _1935;
    out.gl_Position.w = _1778;
    float _1989 = _1987 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1991 = _1812;
    float _1993 = _1947;
    float _1995 = _1947;
    if (!_1903)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1997 = _1991;
    float _1999 = -_1820;
    float _2001 = _1999 + 1.0;
    float _2003 = _2001 * _1989;
    float _2005 = precise::clamp(_2003, 0.0, 1.0);
    float _2007 = -_2005;
    float _2009 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2011 = _2009 * _1979;
    float _2013 = _1937 * _1840;
    float _2015 = -_1937;
    float _2017 = _2015 + 1.0;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2021 = _2011;
    float _2023 = _1997;
    float _2025 = _1997;
    if (!_1903)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2027 = _2021;
    float _2029 = _1851 * _2013;
    float _2031 = _1851 * _2017;
    out.m_89.x = _2019;
    float _2033 = _1865 * _2013;
    float _2035 = fma(_1861, _2029, _1845);
    float _2037 = fma(_1863, _2029, _1847);
    float _2039 = _2029;
    float _2041 = _2027;
    float _2043 = _2027;
    if (!_1903)
    {
        _2039 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2045 = _2039;
    float _2047 = fma(_1851, _2033, _1849);
    out.m_91.x = _2035;
    out.m_91.y = _2037;
    out.m_91.z = _2047;
    out.m_91.w = _2031;
    bool _2049 = !_1903;
    float _2051 = _2045;
    float _2053 = _2045;
    if (!_2049)
    {
        bool _2055 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2057 = isnan(_1534);
        bool _2059 = _2055 || _2057;
        bool _2061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2063 = _2059 || _2061;
        if (!_2063)
        {
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2067 = _1534 + _2065;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2069;
            float _2073 = 1.0 / _2071;
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2095 = _2067 * _2073;
            float _2097 = precise::clamp(_2095, 0.0, 1.0);
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2103 = fma(_2097, _2077, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2105 = fma(_2097, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2107 = fma(_2097, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2109 = fma(_2097, _2085, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2111 = fma(_2097, _2089, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2113 = fma(_2097, _2093, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1995 = _2105;
            _2053 = _2111;
            _2025 = _2103;
            _1945 = _2109;
            _1917 = _2107;
            _2043 = _2113;
            _2115 = true;
        }
        else
        {
            bool _2117 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2119 = isnan(_1534);
            bool _2121 = _2117 || _2119;
            bool _2123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2125 = _2121 || _2123;
            if (!_2125)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2127 = _2023;
            _2025 = _2127;
            if (!_2125)
            {
                _1993 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2129 = _1993;
            _1995 = _2129;
            if (!_2125)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2131 = _1915;
            _1917 = _2131;
            if (!_2125)
            {
                _1943 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2133 = _1943;
            _1945 = _2133;
            if (!_2125)
            {
                _2051 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2135 = _2051;
            _2053 = _2135;
            if (!_2125)
            {
                _2041 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2137 = _2041;
            bool _2139 = !_2125;
            _2043 = _2137;
            if (!_2139)
            {
                bool _2141 = _1534 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2143 = isnan(_1534);
                bool _2145 = _2141 || _2143;
                bool _2147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2149 = _2145 || _2147;
                if (!_2149)
                {
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2153 = _1534 + _2151;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2155;
                    float _2159 = 1.0 / _2157;
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2163 = _2161 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2169 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2173 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2181 = _2153 * _2159;
                    float _2183 = precise::clamp(_2181, 0.0, 1.0);
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2189 = fma(_2183, _2163, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2191 = fma(_2183, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2193 = fma(_2183, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2195 = fma(_2183, _2171, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2197 = fma(_2183, _2175, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2199 = fma(_2183, _2179, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1995 = _2191;
                    _2053 = _2197;
                    _2025 = _2189;
                    _1945 = _2195;
                    _1917 = _2193;
                    _2043 = _2199;
                    _2115 = true;
                }
                else
                {
                    _1995 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2053 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1945 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2043 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2115 = false;
    float _2201 = _1995;
    float _2203 = _2053;
    float _2205 = _2025;
    float _2207 = _1945;
    float _2209 = _1917;
    float _2211 = _2043;
    float _2213 = fma(_1412, -0.5, 0.5);
    float _2215 = precise::clamp(_2213, 0.0, 1.0);
    float _2217 = -_2201;
    float _2219 = _2217 + _2203;
    float _2221 = -_2205;
    float _2223 = _2221 + _2207;
    float _2225 = -_2209;
    float _2227 = _2225 + _2211;
    bool _2229 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2231 = fma(_2215, _2219, _2201);
    float _2233 = fma(_2215, _2223, _2205);
    float _2235 = fma(_2215, _2227, _2209);
    float _2237 = _2231 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _2239 = fma(_2233, 0.298911988735198974609375, _2237);
    float _2241 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2243 = fma(_2235, 0.114477999508380889892578125, _2239);
    out.m_51.x = _2241;
    float _2245 = -_2243;
    float _2247 = _2233 + _2245;
    float _2249 = -_2243;
    float _2251 = _2231 + _2249;
    float _2253 = -_2243;
    float _2255 = _2235 + _2253;
    float _2257 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    float _2261 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2243);
    out.m_95.x = _2257;
    out.m_95.y = _2259;
    out.m_95.z = _2261;
    if (!_2229)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2263 = -_1508;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2267 = -_1510;
    float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2271 = -_1512;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2275 = _2265 * _2265;
    float _2277 = fma(_2269, _2269, _2275);
    float _2279 = fma(_2273, _2273, _2277);
    float _2281 = sqrt(_2279);
    float _2283 = rsqrt(_2279);
    float _2285 = -_2281;
    float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2289 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2291 = precise::clamp(_2289, 0.0, 1.0);
    float _2293 = _2269 * _2283;
    float _2295 = _2265 * _2283;
    float _2297 = abs(_2291);
    float _2299 = log2(_2297);
    float _2301 = _2273 * _2283;
    float _2303 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2305 = _1412 * _2295;
    float _2307 = -_2295;
    float _2309 = -_2303;
    float _2311 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2309);
    float _2313 = fma(_1396, _2293, _2305);
    float _2315 = -_2301;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2311);
    float _2319 = fma(_1414, _2301, _2313);
    float _2321 = precise::clamp(_2319, 0.0, 1.0);
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2325 = _2317 + _2323;
    float _2327 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2329 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = exp2(_2327);
    float _2335 = _2333 * _2331;
    float _2337 = _2321 * _2335;
    float _2339 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2341 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2343 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2339;
    out.m_93.y = _2341;
    out.m_93.z = _2343;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

