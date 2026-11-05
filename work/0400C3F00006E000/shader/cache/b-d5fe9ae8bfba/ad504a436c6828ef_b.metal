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
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1538 = false;
    bool _194 = false;
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
        float _2544 = as_type<float>(_130);
        out.gl_Position.z = _2544;
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
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_168);
        out.gl_Position.z = _2613;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _172 = !_170;
    float _190;
    int _192;
    if (!_172)
    {
        float _174 = in.m_55.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = as_type<int>(_182);
        _194 = true;
    }
    else
    {
        float _196 = float(_114);
        float _198 = 1.0 / _196;
        float _200 = _148 * _198;
        _190 = _200;
        _192 = as_type<int>(_198);
    }
    _194 = false;
    float _202 = _190;
    int _204 = _192;
    float _206 = in.m_55.w;
    float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _210 = in.m_57.x;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _214 = _212 != 0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _218 = _216 != 0;
    float _220 = in.m_55.z;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _224 = _222 != 0;
    float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _230 = _228 != 0;
    float _232 = in.m_55.x;
    float _234 = in.m_48.x;
    float _236 = in.m_48.y;
    float _238 = in.m_48.z;
    bool _240 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _242 = isnan(_202);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _254 = 1.0 + _252;
    float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _258 = in.m_55.y;
    float _260 = in.m_57.y;
    bool _262 = _206 > 0.5;
    float _264 = 1.0 / _254;
    int _266 = as_type<int>(_206);
    int _268 = _204;
    float _270 = _210;
    if (_214)
    {
        float _272 = -_210;
        float _274 = _272 + 1.0;
        _266 = as_type<int>(_274);
    }
    int _276 = _266;
    if (_218)
    {
        float _278 = -_210;
        float _280 = _278 + 1.0;
        _268 = as_type<int>(_280);
    }
    int _282 = _268;
    float _284 = 0.0;
    if (!_214)
    {
        _284 = _210;
    }
    float _286 = _284;
    int _288 = 0;
    float _290 = _286;
    if (_224)
    {
        float _292 = -_210;
        float _294 = _292 + 1.0;
        _288 = as_type<int>(_294);
    }
    int _296 = _288;
    bool _298 = false;
    if (_214)
    {
        bool _300 = _220 > 0.5;
        _298 = _300;
    }
    bool _302 = _298;
    float _304 = _220 * 2.0;
    float _306 = 0.0;
    if (!_218)
    {
        _306 = _210;
    }
    float _308 = _306;
    float _310 = in.m_59.x;
    float _312 = in.m_59.y;
    float _314 = in.m_59.z;
    bool _316 = false;
    float _318 = _308;
    if (_218)
    {
        bool _320 = _232 > 0.5;
        _316 = _320;
    }
    bool _322 = _316;
    float _324 = floor(_304);
    if (_214)
    {
        float _326 = _302 ? as_type<float>(_276) : _210;
        _290 = _326;
    }
    float _328 = _290;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_218)
    {
        float _332 = _322 ? as_type<float>(_282) : _210;
        _318 = _332;
    }
    float _334 = _318;
    float _336 = _236 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = _236 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _236 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _342 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _346 = _344 != 0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _354 = _352 != 0;
    float _356 = -_260;
    float _358 = _356 + 1.0;
    bool _360 = _258 > 0.5;
    float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _364 = log2(_362);
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _368 = _366 != 0;
    float _370 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _372 = _260;
    float _374 = _358;
    float _376 = _350;
    if (_224)
    {
        float _378 = _360 ? as_type<float>(_296) : _210;
        _270 = _378;
    }
    float _380 = _270;
    float _382 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[6].x, _340);
    int _384 = _360 ? as_type<int>(_358) : as_type<int>(_260);
    float _386 = _258 * 2.0;
    float _388 = _262 ? _358 : _260;
    float _390 = 1.0 / _350;
    bool _392 = _220 > 0.5;
    float _394 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[88].w, _330);
    float _396 = _230 ? as_type<float>(_384) : _260;
    float _398 = _314 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _402 = _400 != 0;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _410 = _408 != 0;
    float _412 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _394);
    float _414 = floor(_386);
    float _416 = _346 ? _388 : _260;
    float _418 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _420 = _388;
    if (_354)
    {
        float _422 = _392 ? _358 : _260;
        _372 = _422;
    }
    float _424 = _372;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    bool _430 = !_402;
    int _432 = _430 ? 0 : 1;
    float _434 = _310 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _446 = _444 != 0;
    float _448 = _364 * _148;
    if (_368)
    {
        _420 = _232;
    }
    float _450 = _420;
    float _452 = _428 * _390;
    float _454 = exp2(_448);
    float _456 = _450;
    if (_368)
    {
        _374 = _450;
    }
    float _458 = _374;
    float _460 = _312 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _464 = _458;
    float _466 = _462;
    if (!_368)
    {
        _464 = _220;
    }
    float _468 = _464;
    float _470 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_368)
    {
        _376 = _220;
    }
    float _472 = _376;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _476 = _472;
    if (!_368)
    {
        _476 = _258;
    }
    float _478 = _476;
    float _480 = _468 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_368)
    {
        _456 = _232;
    }
    float _482 = _456;
    float _484 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _486 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[89].z, _462);
    if (_368)
    {
        _466 = _258;
    }
    float _488 = _466;
    float _490 = -_474;
    float _492 = fma(_480, 2.0, _490);
    float _494 = in.m_61.x;
    float _496 = in.m_61.y;
    float _498 = in.m_61.z;
    float _500 = _488;
    if (!_368)
    {
        _500 = _482;
    }
    float _502 = _500;
    float _504 = -_454;
    float _506 = _504 + 1.0;
    bool _508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _510 = isnan(1.0);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _516 = _512 || _514;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _522 = _502 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _524 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[88].z, _518);
    float _536 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[89].x, _486);
    float _538 = fma(_522, -2.0, _520);
    float _540 = _532 ? _506 : 0.0;
    float _542 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _534);
    float _544 = -_148;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[86].x, _492);
    float _548 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _538);
    if (_516)
    {
        float _550 = _540 * _264;
        _152 = _550;
    }
    float _552 = _152;
    bool _554 = _324 >= 0.0;
    bool _556 = isnan(_324);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = _418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _566 = !_406;
    int _568 = _566 ? 0 : 1;
    int _570 = _562 ? 0 : 1;
    bool _572 = _324 > 0.0;
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    bool _576 = _414 > 0.0;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _494);
    bool _580 = _414 >= 0.0;
    bool _582 = isnan(_414);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _592 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _594 = isnan(_202);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _496);
    int _606 = ~_570;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _574 * _590;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _616 = _202 + _614;
    float _618 = -_250;
    float _620 = _618 + 1.0;
    bool _622 = !_410;
    int _624 = _622 ? 0 : 1;
    float _626 = _578 * _470;
    int _628 = _610;
    if (!_572)
    {
        int _630 = ~_570;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = _602 * _620;
    bool _638 = _496 != 0.0;
    bool _640 = isnan(_496);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_452, _616, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _650 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _342);
    float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _654 = _482 * 2.0;
    bool _656 = _494 == 0.0;
    bool _658 = !_646;
    bool _660 = _656 && _658;
    float _662 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _370);
    float _664 = _648 * _636;
    bool _666 = _498 == 0.0;
    bool _668 = _666 && _660;
    float _670 = -_602;
    float _672 = _670 + 1.0;
    float _674 = floor(_654);
    float _676 = _588 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _678 = _604 * _484;
    bool _680 = !_446;
    int _682 = _680 ? 0 : 1;
    float _684 = in.m_63.x;
    float _686 = in.m_63.y;
    float _688 = in.m_63.z;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    int _704 = ~as_type<int>(_676);
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _712 = _208 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _714 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[116].x, _702);
    float _716 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _718 = _708;
    float _720 = _664;
    float _722 = _672;
    float _724 = _676;
    float _726 = _684;
    float _728 = _686;
    if (!_576)
    {
        int _730 = ~as_type<int>(_676);
        int _732 = _730 + 1;
        _718 = _732;
    }
    int _734 = _718;
    float _736 = fma(_712, _380, -0.5);
    float _738 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _740 = _716 * _226;
    bool _742 = _674 >= 0.0;
    bool _744 = isnan(_674);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _258 + _220;
    float _754 = _738 * _652;
    float _756 = _258 + _482;
    int _758 = _750 ? 0 : 1;
    float _760 = _752 + (-1.0);
    float _762 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[203].x, _754);
    bool _764 = _674 > 0.0;
    float _766 = _256 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _768 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _770 = floor(_762);
    bool _772 = !_692;
    int _774 = _772 ? 0 : 1;
    float _776 = _756 + (-1.0);
    float _778 = fma(_766, _424, -0.5);
    bool _780 = !_696;
    int _782 = _780 ? 0 : 1;
    float _784 = _650 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _786 = abs(_774);
    float _788 = _762 + 0.25;
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _792 = abs(_782);
    float _794 = in.m_65.x;
    float _796 = in.m_65.y;
    float _798 = in.m_65.z;
    int _800 = ~_758;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[203].z, _740);
    int _808 = _804;
    if (!_764)
    {
        int _810 = ~_758;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = floor(_788);
    float _818 = -_770;
    float _820 = _762 + _818;
    float _822 = _762 * 6.283185482025146484375;
    float _824 = float(_814);
    float _826 = _806 + 0.25;
    float _828 = float(_792);
    float _830 = _822 * 0.15915493667125701904296875;
    float _832 = float(_786);
    float _834 = floor(_826);
    float _836 = float(_634);
    float _838 = _828 * _824;
    bool _840 = _820 >= 0.5;
    bool _842 = isnan(_820);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.5);
    bool _848 = _844 || _846;
    int _850 = abs(_568);
    float _852 = _838 * (-2.0);
    float _854 = _832 * _836;
    float _856 = floor(_806);
    float _858 = -_816;
    float _860 = _788 + _858;
    bool _862 = !_848;
    float _864 = _862 ? 0.5 : (-0.5);
    float _866 = fma(_768, _852, _768);
    int _868 = abs(_432);
    float _870 = fma(_852, _796, _796);
    float _872 = float(_850);
    float _874 = _864 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _876 = _874 * 2.0;
    float _878 = _830 * 6.283185482025146484375;
    float _880 = sin(_878);
    bool _882 = _860 > 0.5;
    float _884 = _258 + (-0.5);
    float _886 = -_834;
    float _888 = _826 + _886;
    float _890 = _806 * 6.283185482025146484375;
    float _892 = _872 * _876;
    float _894 = float(_868);
    float _896 = -_856;
    float _898 = _806 + _896;
    bool _900 = !_442;
    int _902 = _900 ? 0 : 1;
    float _904 = _890 * 0.15915493667125701904296875;
    int _906 = abs(_624);
    float _908 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[196].y, _870);
    int _910 = abs(_902);
    float _912 = _860;
    float _914 = _888;
    if (_882)
    {
        float _916 = -_860;
        float _918 = _916 + 1.0;
        _912 = _918;
    }
    float _920 = _912;
    bool _922 = _898 >= 0.5;
    bool _924 = isnan(_898);
    bool _926 = _922 || _924;
    bool _928 = isnan(0.5);
    bool _930 = _926 || _928;
    float _932 = _880 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _934 = _904 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = fma(_920, 4.0, -1.0);
    bool _940 = !_930;
    float _942 = _940 ? 0.5 : (-0.5);
    float _944 = fma(_894, _932, _892);
    bool _946 = !_438;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_866, _552, _908);
    bool _952 = _888 > 0.5;
    float _954 = _942 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _956 = _954 * 2.0;
    int _958 = abs(_948);
    float _960 = _938 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _962 = float(_906);
    float _964 = float(_910);
    float _966 = fma(_962, _960, _944);
    float _968 = _936 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _970 = _964 * _956;
    float _972 = float(_958);
    if (_952)
    {
        float _974 = -_888;
        float _976 = _974 + 1.0;
        _914 = _976;
    }
    float _978 = _914;
    float _980 = fma(_966, 3.1415927410125732421875, _794);
    float _982 = _536 * (-0.15915493667125701904296875);
    bool _984 = !_700;
    int _986 = _984 ? 0 : 1;
    float _988 = fma(_978, 4.0, -1.0);
    float _990 = _854 * (-2.0);
    float _992 = fma(_972, _968, _970);
    int _994 = abs(_682);
    float _996 = _950 * 0.15915493667125701904296875;
    float _998 = fma(_980, _990, _980);
    float _1000 = _220 + _482;
    int _1002 = abs(_986);
    float _1004 = _482 + (-0.5);
    float _1006 = float(_994);
    float _1008 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1010 = _1000 + (-1.0);
    float _1012 = float(_734);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[196].x, _998);
    float _1016 = float(_1002);
    float _1018 = fma(_790, _990, _790);
    float _1020 = fma(_1006, _1008, _992);
    float _1022 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1024 = _220 + (-0.5);
    float _1026 = _1016 * _1012;
    float _1028 = fma(_1020, 3.1415927410125732421875, _798);
    float _1030 = fma(_1018, _552, _1014);
    if (_668)
    {
        _720 = _684;
    }
    float _1032 = _720;
    float _1034 = in.m_67.x;
    float _1036 = in.m_67.y;
    float _1038 = in.m_67.z;
    float _1040 = in.m_67.w;
    float _1042 = _1026 * (-2.0);
    float _1044 = _1032;
    if (_668)
    {
        _722 = _686;
    }
    float _1046 = _722;
    float _1048 = _982 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = _1046;
    if (_668)
    {
        _724 = _1032;
    }
    float _1054 = _724;
    float _1056 = fma(_1028, _1042, _1028);
    float _1058 = fma(_1022, _1042, _1022);
    float _1060 = _1054;
    if (!_668)
    {
        _1044 = _684;
    }
    float _1062 = _1044;
    float _1064 = _1030 * 0.15915493667125701904296875;
    float _1066 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1056);
    if (_668)
    {
        _726 = _1046;
    }
    float _1068 = _726;
    float _1070 = _982 * 6.283185482025146484375;
    float _1072 = cos(_1070);
    float _1074 = _1068;
    if (!_668)
    {
        _1052 = _686;
    }
    float _1076 = _1052;
    float _1078 = fma(_1058, _552, _1066);
    if (_668)
    {
        _728 = _688;
    }
    float _1080 = _728;
    float _1082 = _1080;
    if (!_668)
    {
        float _1084 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1062);
        _1060 = _1084;
    }
    float _1086 = _1060;
    if (!_668)
    {
        float _1088 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _688);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = _1078 * 0.15915493667125701904296875;
    if (!_668)
    {
        float _1094 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1076);
        _1074 = _1094;
    }
    float _1096 = _1074;
    float _1098 = _996 * 6.283185482025146484375;
    float _1100 = sin(_1098);
    float _1102 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1104 = _1034 * _1076;
    float _1106 = _1038 * _1062;
    float _1108 = _996 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1118 = _1036 * _688;
    float _1120 = -_1106;
    float _1122 = fma(_1034, _688, _1120);
    float _1124 = _1050 * _778;
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1064 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1072 * _778;
    float _1138 = -_1124;
    float _1140 = fma(_1072, _736, _1138);
    float _1142 = -_1118;
    float _1144 = fma(_1038, _1076, _1142);
    float _1146 = _1122 * _1040;
    out.m_69.x = _1126;
    out.m_69.y = _1132;
    out.m_69.z = _1134;
    out.m_69.w = _1102;
    float _1148 = _1064 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = fma(_542, _1140, _546);
    float _1154 = fma(_1050, _736, _1136);
    float _1156 = -_548;
    float _1158 = fma(_412, _1154, _1156);
    float _1160 = _1092 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = -_1104;
    float _1166 = fma(_1036, _1062, _1164);
    float _1168 = _1130 * _1110;
    float _1170 = _1144 * _1040;
    float _1172 = _1130 * _1100;
    float _1174 = _1166 * _1040;
    float _1176 = _1092 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = _1150 * _1110;
    float _1182 = _1150 * _1100;
    float _1184 = _1150 * _1162;
    float _1186 = _1130 * _1162;
    float _1188 = _1110 * _1162;
    float _1190 = _1100 * _1162;
    float _1192 = _1184 * _678;
    float _1194 = _1186 * _678;
    float _1196 = _1184 * _1036;
    float _1198 = _1186 * _1036;
    float _1200 = fma(_1178, _1180, _1172);
    float _1202 = fma(_1178, _1172, _1180);
    float _1204 = -_678;
    float _1206 = _1178 * _1204;
    float _1208 = -_1168;
    float _1210 = fma(_1178, _1182, _1208);
    float _1212 = fma(_1200, _626, _1192);
    float _1214 = -_1182;
    float _1216 = fma(_1178, _1168, _1214);
    float _1218 = fma(_1188, _626, _1206);
    float _1220 = -_1096;
    float _1222 = _1178 * _1220;
    float _1224 = fma(_1210, _612, _1212);
    float _1226 = fma(_1216, _626, _1194);
    float _1228 = fma(_1190, _612, _1218);
    float _1230 = -_1036;
    float _1232 = _1178 * _1230;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1236 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1238 = fma(_1202, _612, _1226);
    float _1240 = -_1146;
    float _1242 = _1178 * _1240;
    float _1244 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1234);
    float _1246 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1236);
    float _1248 = fma(_1188, _1086, _1222);
    float _1250 = fma(_1188, _1034, _1232);
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1244);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1246);
    float _1256 = fma(_1188, _1170, _1242);
    float _1258 = _1184 * _1096;
    float _1260 = _710 + _1252;
    float _1262 = _564 + _1254;
    float _1264 = _1186 * _1096;
    float _1266 = _1184 * _1146;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1270 = _1260 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1274 = _1262 + _1272;
    float _1276 = fma(_1200, _1034, _1196);
    float _1278 = fma(_1216, _1034, _1198);
    float _1280 = _1270 * _1270;
    float _1282 = _1274 * _1274;
    float _1284 = _1186 * _1146;
    float _1286 = fma(_1200, _1086, _1258);
    float _1288 = fma(_1216, _1086, _1264);
    float _1290 = _1280 + _1282;
    float _1292 = fma(_1216, _1170, _1284);
    float _1294 = fma(_1210, _1090, _1286);
    float _1296 = fma(_1190, _1090, _1248);
    float _1298 = sqrt(_1290);
    float _1300 = fma(_1190, _1038, _1250);
    float _1302 = fma(_1190, _1174, _1256);
    float _1304 = fma(_1202, _1090, _1288);
    float _1306 = fma(_1200, _1170, _1266);
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1310 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1312 = fma(_1210, _1038, _1276);
    float _1314 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1316 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1318 = fma(_1210, _1174, _1306);
    float _1320 = fma(_1202, _1038, _1278);
    float _1322 = fma(_1202, _1174, _1292);
    float _1324 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1310);
    float _1326 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1308);
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1330 = _1298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1314);
    float _1334 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1316);
    float _1336 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1338 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1324);
    float _1340 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1342 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1346 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1336);
    float _1348 = _784 + _1338;
    float _1350 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1340);
    float _1352 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1342);
    float _1354 = _1338;
    float _1356 = _1280;
    float _1358 = _1282;
    float _1360 = _1260;
    float _1362 = _1262;
    float _1364 = _1304;
    if (!_1330)
    {
        _1354 = _1348;
    }
    float _1366 = _1354;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1370 = !_1330;
    float _1372 = _1366;
    if (!_1370)
    {
        float _1374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1378 = _1298 + _1376;
        float _1380 = rsqrt(_1290);
        float _1382 = _1378 * _1374;
        float _1384 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = _1382 * 0.15915493667125701904296875;
        float _1388 = _1386 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = fma(_1390, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1380 * _1396;
        float _1400 = fma(_1270, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = _1394 + (-1.0);
        float _1404 = fma(_1274, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1408 = _1400 + _1406;
        float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1414 = _1404 + _1412;
        float _1416 = _1408 * _1408;
        float _1418 = fma(_1348, _1394, _1410);
        float _1420 = _1414 * _1414;
        _1372 = _1418;
        _1356 = _1416;
        _1358 = _1420;
        _1360 = _1400;
        _1362 = _1404;
    }
    float _1422 = _1372;
    float _1424 = _1356;
    float _1426 = _1358;
    float _1428 = _1360;
    float _1430 = _1362;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1434 = _1422 + _1432;
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1438 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1440 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = fma(_1434, _1434, _1424);
    float _1444 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1438);
    float _1448 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1440);
    float _1450 = _1442 + _1426;
    float _1452 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1444);
    float _1454 = _396 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = _416 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = _334 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1460 = _328 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1462 = sqrt(_1450);
    float _1464 = _1454 * _1344;
    float _1466 = _1456 * _1368;
    float _1468 = _1458 * _1328;
    float _1470 = _1460 * _1436;
    float _1472 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1350);
    float _1474 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1346);
    float _1476 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1446);
    float _1478 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1448);
    float _1480 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1352);
    float _1482 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1452);
    float _1484 = _1152 + 0.5;
    float _1486 = _1158 + 0.5;
    float _1488 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1490 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1332);
    float _1492 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1334);
    out.m_71.x = _1468;
    out.m_71.y = _1464;
    out.m_71.z = _1470;
    out.m_71.w = _1466;
    bool _1494 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1496 = isnan(_1462);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1502 = _1498 || _1500;
    out.m_73.x = _1484;
    out.m_73.y = _1486;
    out.m_75.x = _1472;
    out.m_75.y = _1474;
    out.m_75.z = _1480;
    out.m_77.x = _1476;
    out.m_77.y = _1478;
    out.m_77.z = _1482;
    if (!_1502)
    {
        _1364 = 1.0;
    }
    float _1504 = _1364;
    out.m_79.x = _1488;
    out.m_79.y = _1490;
    out.m_79.z = _1492;
    bool _1506 = !_1502;
    float _1508 = _1504;
    if (!_1506)
    {
        bool _1510 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1512 = isnan(_1462);
        bool _1514 = _1510 || _1512;
        bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1518 = _1514 || _1516;
        if (!_1518)
        {
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = _1462 + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1532 = 1.0 / _1526;
            float _1534 = _1522 * _1532;
            float _1536 = fma(_1534, _1530, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1508 = _1536;
            _1538 = true;
        }
        else
        {
            bool _1540 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1542 = isnan(_1462);
            bool _1544 = _1540 || _1542;
            bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1548 = _1544 || _1546;
            if (!_1548)
            {
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1462 + _1550;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1562 = 1.0 / _1556;
                float _1564 = _1552 * _1562;
                float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1508 = _1566;
                _1538 = true;
            }
            else
            {
                _1508 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1538 = false;
    float _1568 = _1508;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1572 = _1422 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1576 = _1428 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1580 = _1430 + _1578;
    float _1582 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1584 = fma(_1576, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1586 = fma(_1580, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1590 = _1582 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1594 = _1584 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1586 + _1596;
    float _1600 = fma(_564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1602 = _1590 * _1590;
    float _1604 = floor(_1600);
    float _1606 = fma(_1594, _1594, _1602);
    float _1608 = fma(_1598, _1598, _1606);
    float _1610 = rsqrt(_1608);
    float _1612 = -_1604;
    float _1614 = _1600 + _1612;
    float _1616 = sqrt(_1608);
    float _1618 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1594 * _1618;
    float _1622 = _1598 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1476;
    float _1640 = _1628;
    float _1642 = _1636;
    float _1644 = _1572;
    float _1646 = _1618;
    float _1648 = _1598;
    if (_1632)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1650;
    }
    float _1652 = _1638;
    if (_1632)
    {
        float _1654 = rsqrt(_1628);
        _1640 = _1654;
    }
    float _1656 = _1640;
    float _1658 = _1656;
    if (_1632)
    {
        float _1660 = _1636 * _1652;
        _1642 = _1660;
    }
    float _1662 = _1642;
    if (_1632)
    {
        float _1664 = _1662 * 0.15915493667125701904296875;
        _1644 = _1664;
    }
    float _1666 = _1644;
    float _1668 = _1482;
    float _1670 = _1666;
    if (_1632)
    {
        float _1672 = _1666 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        _1668 = _1674;
    }
    float _1676 = _1668;
    float _1678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1680 = precise::max(0.0, _1678);
    float _1682 = _1478;
    float _1684 = _1678;
    float _1686 = _1680;
    if (_1632)
    {
        float _1688 = _1666 * 6.283185482025146484375;
        float _1690 = cos(_1688);
        _1682 = _1690;
    }
    float _1692 = _1682;
    float _1694 = -_1618;
    float _1696 = -_1680;
    float _1698 = fma(_1590, _1694, _1696);
    float _1700 = _1698;
    if (_1632)
    {
        float _1702 = _1698 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1702;
    }
    float _1704 = _1684;
    float _1706 = _1704;
    if (!_1632)
    {
        _1670 = _1620;
    }
    float _1708 = _1670;
    float _1710 = _1676;
    float _1712 = _1708;
    if (_1632)
    {
        float _1714 = fma(_1676, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = _1716;
    if (!_1632)
    {
        _1706 = _1624;
    }
    float _1720 = _1706;
    float _1722 = _1720;
    if (_1632)
    {
        float _1724 = _1692 + (-1.0);
        _1686 = _1724;
    }
    float _1726 = _1686;
    float _1728 = _1726;
    if (_1632)
    {
        float _1730 = _1656 * _1716;
        _1646 = _1730;
    }
    float _1732 = _1646;
    if (!_1632)
    {
        _1658 = _1622;
    }
    float _1734 = _1658;
    float _1736 = _1734;
    if (_1632)
    {
        float _1738 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1728 = _1738;
    }
    float _1740 = _1728;
    if (_1632)
    {
        float _1742 = _1620 * _1732;
        _1712 = _1742;
    }
    float _1744 = _1712;
    if (_1632)
    {
        float _1746 = _1622 * _1732;
        _1736 = _1746;
    }
    float _1748 = _1736;
    if (!_1632)
    {
        _1718 = _1626;
    }
    float _1750 = _1718;
    float _1752 = _1750;
    if (_1632)
    {
        float _1754 = fma(_1698, _1692, _1740);
        _1700 = _1754;
    }
    float _1756 = _1700;
    if (_1632)
    {
        float _1758 = _1744 * _1744;
        _1722 = _1758;
    }
    float _1760 = _1722;
    if (_1632)
    {
        float _1762 = _1748 * _1748;
        _1752 = _1762;
    }
    float _1764 = _1752;
    float _1766 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1768 = fma(_1756, _1756, _1760);
    float _1770 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1772 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1766);
    float _1774 = _1768 + _1764;
    float _1776 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1770);
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1780 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1778);
    float _1782 = precise::clamp(_1780, 0.0, 1.0);
    float _1784 = rsqrt(_1774);
    float _1786 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1788 = -_1782;
    float _1790 = _1788 + 1.0;
    float _1792 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1796 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1798 = abs(_1790);
    float _1800 = log2(_1798);
    float _1802 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1804 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = -_1802;
    float _1808 = fma(_1806, _1794, 1.0);
    float _1810 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1812 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1814 = _1784 * _1744;
    float _1816 = _1784 * _1756;
    float _1818 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1810);
    float _1820 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    float _1822 = _1784 * _1748;
    float _1824 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1826 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1818);
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = floor(_1792);
    float _1832 = -_1824;
    float _1834 = fma(_1816, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1832);
    float _1836 = _1826 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1840 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = -_1822;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1834);
    float _1846 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1772);
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1838);
    float _1850 = log2(_1808);
    float _1852 = fma(_1844, -0.5, 0.5);
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1848);
    float _1858 = fma(_1844, 0.5, 0.5);
    float _1860 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1856);
    float _1864 = exp2(_1840);
    float _1866 = -_1830;
    float _1868 = _1792 + _1866;
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1872 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1860);
    float _1874 = fma(_1858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1876 = 1.0 / _1862;
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1870);
    float _1880 = _1816 + 1.0;
    float _1882 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1872);
    float _1884 = fma(_1858, _1874, -0.212114393711090087890625);
    float _1886 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1888 = _1850 * 0.693147182464599609375;
    float _1890 = sqrt(_1852);
    float _1892 = -_1816;
    float _1894 = fma(_1864, _1880, _1892);
    float _1896 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1886);
    float _1898 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1882);
    float _1900 = fma(_1858, _1884, 1.570728778839111328125);
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5402 = float2(_1868, _1614);
    float _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5402, float2(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5402, float2(0.0), isnan(_5402)), level(0.0)).x;
    float _1906 = fma(_1894, 0.5, 0.5);
    float _1908 = _1896 * _1876;
    float _1910 = _1898 * _1876;
    float _1912 = fma(_1908, 0.5, 0.5);
    float _1914 = fma(_1910, -0.5, 0.5);
    float _1916 = _1890 * 0.636619746685028076171875;
    float _1918 = -_1900;
    float _1920 = fma(_1916, _1918, 1.0);
    float3 _5433 = float3(_1912, _1914, _1902);
    float _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5433, float3(0.0), isnan(_5433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5433, float3(0.0), isnan(_5433)), level(0.0)).x;
    float3 _5444 = float3(_1912, _1914, _1902);
    float4 _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5444, float3(0.0), isnan(_5444)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5444, float3(0.0), isnan(_5444)), level(0.0)).xyzw;
    float _1927 = _1925.x;
    float _1929 = _1925.y;
    float _1931 = _1925.z;
    float _1933 = _1925.w;
    float2 _5460 = float2(_1920, _1906);
    float3 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5460, float2(0.0), isnan(_5460)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5460, float2(0.0), isnan(_5460)), level(0.0)).xyz;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1947 = _784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1949 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _1594;
    out.m_81.y = _1590;
    out.m_81.z = _1598;
    float _1951 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1945);
    float _1953 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1947);
    float _1955 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1949);
    float _1957 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1951);
    float _1959 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1953);
    float _1961 = in.m_83.x;
    float _1963 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1965 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1967 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1955);
    float _1969 = 1.0 / _1963;
    float _1971 = _1965 + _1963;
    out.m_85.x = _1584;
    out.m_85.y = _1582;
    out.m_85.z = _1586;
    float _1973 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1975 = _1973 + _1862;
    out.gl_Position.x = _1896;
    out.gl_Position.y = _1898;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1862;
    bool _1977 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.5);
    bool _1985 = _1981 || _1983;
    float _1987 = _1971 * _1969;
    float _1989 = _1987 * 0.5;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1993 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1991);
    float _1995 = 1.0 / _1993;
    float _1997 = _1957;
    float _1999 = _1993;
    float _2001 = _1967;
    float _2003 = _1800;
    if (!_1985)
    {
        _1997 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2005 = _1997;
    if (!_1985)
    {
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = _2005 + _2007;
        _1999 = _2009;
    }
    float _2011 = _1999;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = _1995 * _2013;
    float _2017 = abs(_2015);
    float _2019 = log2(_2017);
    if (!_1985)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2023 = _2015 + _2021;
        _2001 = _2023;
    }
    float _2025 = _2001;
    float _2027 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2029 = exp2(_2027);
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (!_1985)
    {
        float _2039 = 1.0 / _2011;
        _2037 = _2039;
    }
    float _2041 = _2037;
    if (_1985)
    {
        _2003 = 1.0;
    }
    float _2043 = _2003;
    float _2045 = fma(_2033, -2.0, 3.0);
    float _2047 = _2033 * _2033;
    float _2049 = _2047 * _2045;
    float _2051 = exp2(_2035);
    bool _2053 = _2015 <= 8000.0;
    bool _2055 = isnan(_2015);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan(8000.0);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = -_2049;
    float _2067 = _2065 + 1.0;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2049);
    float _2071 = _2043;
    if (!_1985)
    {
        float _2073 = _2025 * _2041;
        float _2075 = precise::clamp(_2073, 0.0, 1.0);
        _2071 = _2075;
    }
    float _2077 = _2071;
    float _2079 = _1975 * 0.5;
    float _2081 = _2063 * _2069;
    bool _2083 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2085 = isnan(_1616);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2091 = _2087 || _2089;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2095 = -_2051;
    float _2097 = _2095 + 1.0;
    out.m_87.z = _2079;
    out.m_87.w = _1862;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2101 = -_2099;
    float _2103 = _2101 + 1.0;
    float _2105 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2107 = _2103;
    if (!_2091)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2109 = _1648;
    float _2111 = _2077 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2113 = -_1904;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * _2093;
    float _2119 = precise::clamp(_2117, 0.0, 1.0);
    float _2121 = -_2119;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2125 = _1927;
    float _2127 = _1929;
    float _2129 = _2109;
    float _2131 = _2109;
    if (!_2091)
    {
        _2105 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2133 = _2105;
    float _2135 = _2123 * _1961;
    float _2137 = _2099 * _1922;
    float _2139 = _2135 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2141 = _1933 * _2103;
    float _2143 = _2133;
    float _2145 = _2133;
    if (!_2091)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2147 = _2107;
    float _2149 = _1933 * _2137;
    float _2151 = _1943 * _2137;
    out.m_89.x = _2139;
    float _2153 = fma(_1939, _2149, _1927);
    float _2155 = fma(_1941, _2149, _1929);
    float _2157 = fma(_1933, _2151, _1931);
    float _2159 = _2149;
    float _2161 = _2147;
    float _2163 = _2147;
    if (!_2091)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2165 = _2125;
    float _2167 = _2165;
    float _2169 = _2165;
    if (!_2091)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2171 = _2127;
    out.m_91.x = _2153;
    out.m_91.y = _2155;
    out.m_91.z = _2157;
    out.m_91.w = _2141;
    float _2173 = _2171;
    float _2175 = _2171;
    if (!_2091)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2177 = _2159;
    bool _2179 = !_2091;
    float _2181 = _2177;
    float _2183 = _2177;
    if (!_2179)
    {
        bool _2185 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1616);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1616 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2169 = _2237;
            _2183 = _2241;
            _2145 = _2233;
            _2131 = _2239;
            _2175 = _2235;
            _2163 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1616);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2143;
            _2145 = _2257;
            if (!_2255)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2167;
            _2169 = _2259;
            if (!_2255)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2173;
            _2175 = _2261;
            if (!_2255)
            {
                _2129 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2129;
            _2131 = _2263;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2181;
            _2183 = _2265;
            if (!_2255)
            {
                _2161 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2161;
            bool _2269 = !_2255;
            _2163 = _2267;
            if (!_2269)
            {
                bool _2271 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1616);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1616 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2169 = _2323;
                    _2183 = _2327;
                    _2145 = _2319;
                    _2131 = _2325;
                    _2175 = _2321;
                    _2163 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2131 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2163 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2169;
    float _2333 = _2183;
    float _2335 = _2145;
    float _2337 = _2131;
    float _2339 = _2175;
    float _2341 = _2163;
    float _2343 = fma(_1490, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = _2111 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = -_2335;
    float _2355 = _2353 + _2337;
    float _2357 = fma(_2345, _2349, _2331);
    out.m_93.x = 0.0;
    float _2359 = -_2339;
    float _2361 = _2359 + _2341;
    float _2363 = fma(_2345, _2355, _2335);
    float _2365 = _2357 * 0.586610972881317138671875;
    out.m_51.x = _2351;
    bool _2367 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2369 = fma(_2345, _2361, _2339);
    float _2371 = fma(_2363, 0.298911988735198974609375, _2365);
    bool _2373 = _2077 > 0.0;
    bool _2375 = isnan(_2077);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2369, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2363 + _2385;
    float _2389 = -_2383;
    float _2391 = _2357 + _2389;
    float _2393 = -_2383;
    float _2395 = _2369 + _2393;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2367;
    if (!_2403)
    {
        float _2405 = -_1582;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1584;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1586;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _1490 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_1488, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_1492, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2481;
        out.m_93.y = _2483;
        out.m_93.z = _2485;
    }
    out.m_95.x = _2397;
    out.m_95.y = _2399;
    out.m_95.z = _2401;
    if (_2381)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1538 = false;
    bool _194 = false;
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
        float _2544 = as_type<float>(_130);
        out.gl_Position.z = _2544;
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
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_168);
        out.gl_Position.z = _2613;
    }
    if (_162)
    {
        return out;
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _172 = !_170;
    float _190;
    int _192;
    if (!_172)
    {
        float _174 = in.m_55.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = as_type<int>(_182);
        _194 = true;
    }
    else
    {
        float _196 = float(_114);
        float _198 = 1.0 / _196;
        float _200 = _148 * _198;
        _190 = _200;
        _192 = as_type<int>(_198);
    }
    _194 = false;
    float _202 = _190;
    int _204 = _192;
    float _206 = in.m_55.w;
    float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _210 = in.m_57.x;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _214 = _212 != 0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _218 = _216 != 0;
    float _220 = in.m_55.z;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _224 = _222 != 0;
    float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _230 = _228 != 0;
    float _232 = in.m_55.x;
    float _234 = in.m_48.x;
    float _236 = in.m_48.y;
    float _238 = in.m_48.z;
    bool _240 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _242 = isnan(_202);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _254 = 1.0 + _252;
    float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _258 = in.m_55.y;
    float _260 = in.m_57.y;
    bool _262 = _206 > 0.5;
    float _264 = 1.0 / _254;
    int _266 = as_type<int>(_206);
    int _268 = _204;
    float _270 = _210;
    if (_214)
    {
        float _272 = -_210;
        float _274 = _272 + 1.0;
        _266 = as_type<int>(_274);
    }
    int _276 = _266;
    if (_218)
    {
        float _278 = -_210;
        float _280 = _278 + 1.0;
        _268 = as_type<int>(_280);
    }
    int _282 = _268;
    float _284 = 0.0;
    if (!_214)
    {
        _284 = _210;
    }
    float _286 = _284;
    int _288 = 0;
    float _290 = _286;
    if (_224)
    {
        float _292 = -_210;
        float _294 = _292 + 1.0;
        _288 = as_type<int>(_294);
    }
    int _296 = _288;
    bool _298 = false;
    if (_214)
    {
        bool _300 = _220 > 0.5;
        _298 = _300;
    }
    bool _302 = _298;
    float _304 = _220 * 2.0;
    float _306 = 0.0;
    if (!_218)
    {
        _306 = _210;
    }
    float _308 = _306;
    float _310 = in.m_59.x;
    float _312 = in.m_59.y;
    float _314 = in.m_59.z;
    bool _316 = false;
    float _318 = _308;
    if (_218)
    {
        bool _320 = _232 > 0.5;
        _316 = _320;
    }
    bool _322 = _316;
    float _324 = floor(_304);
    if (_214)
    {
        float _326 = _302 ? as_type<float>(_276) : _210;
        _290 = _326;
    }
    float _328 = _290;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_218)
    {
        float _332 = _322 ? as_type<float>(_282) : _210;
        _318 = _332;
    }
    float _334 = _318;
    float _336 = _236 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = _236 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _236 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _342 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _346 = _344 != 0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _354 = _352 != 0;
    float _356 = -_260;
    float _358 = _356 + 1.0;
    bool _360 = _258 > 0.5;
    float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _364 = log2(_362);
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _368 = _366 != 0;
    float _370 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _372 = _260;
    float _374 = _358;
    float _376 = _350;
    if (_224)
    {
        float _378 = _360 ? as_type<float>(_296) : _210;
        _270 = _378;
    }
    float _380 = _270;
    float _382 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[6].x, _340);
    int _384 = _360 ? as_type<int>(_358) : as_type<int>(_260);
    float _386 = _258 * 2.0;
    float _388 = _262 ? _358 : _260;
    float _390 = 1.0 / _350;
    bool _392 = _220 > 0.5;
    float _394 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[88].w, _330);
    float _396 = _230 ? as_type<float>(_384) : _260;
    float _398 = _314 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _402 = _400 != 0;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _410 = _408 != 0;
    float _412 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _394);
    float _414 = floor(_386);
    float _416 = _346 ? _388 : _260;
    float _418 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _420 = _388;
    if (_354)
    {
        float _422 = _392 ? _358 : _260;
        _372 = _422;
    }
    float _424 = _372;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    bool _430 = !_402;
    int _432 = _430 ? 0 : 1;
    float _434 = _310 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _446 = _444 != 0;
    float _448 = _364 * _148;
    if (_368)
    {
        _420 = _232;
    }
    float _450 = _420;
    float _452 = _428 * _390;
    float _454 = exp2(_448);
    float _456 = _450;
    if (_368)
    {
        _374 = _450;
    }
    float _458 = _374;
    float _460 = _312 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _464 = _458;
    float _466 = _462;
    if (!_368)
    {
        _464 = _220;
    }
    float _468 = _464;
    float _470 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_368)
    {
        _376 = _220;
    }
    float _472 = _376;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _476 = _472;
    if (!_368)
    {
        _476 = _258;
    }
    float _478 = _476;
    float _480 = _468 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_368)
    {
        _456 = _232;
    }
    float _482 = _456;
    float _484 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _486 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[89].z, _462);
    if (_368)
    {
        _466 = _258;
    }
    float _488 = _466;
    float _490 = -_474;
    float _492 = fma(_480, 2.0, _490);
    float _494 = in.m_61.x;
    float _496 = in.m_61.y;
    float _498 = in.m_61.z;
    float _500 = _488;
    if (!_368)
    {
        _500 = _482;
    }
    float _502 = _500;
    float _504 = -_454;
    float _506 = _504 + 1.0;
    bool _508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _510 = isnan(1.0);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _516 = _512 || _514;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _522 = _502 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _524 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[88].z, _518);
    float _536 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[89].x, _486);
    float _538 = fma(_522, -2.0, _520);
    float _540 = _532 ? _506 : 0.0;
    float _542 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _534);
    float _544 = -_148;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[86].x, _492);
    float _548 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _538);
    if (_516)
    {
        float _550 = _540 * _264;
        _152 = _550;
    }
    float _552 = _152;
    bool _554 = _324 >= 0.0;
    bool _556 = isnan(_324);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = _418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _566 = !_406;
    int _568 = _566 ? 0 : 1;
    int _570 = _562 ? 0 : 1;
    bool _572 = _324 > 0.0;
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    bool _576 = _414 > 0.0;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _494);
    bool _580 = _414 >= 0.0;
    bool _582 = isnan(_414);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _592 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _594 = isnan(_202);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _496);
    int _606 = ~_570;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _574 * _590;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _616 = _202 + _614;
    float _618 = -_250;
    float _620 = _618 + 1.0;
    bool _622 = !_410;
    int _624 = _622 ? 0 : 1;
    float _626 = _578 * _470;
    int _628 = _610;
    if (!_572)
    {
        int _630 = ~_570;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = _602 * _620;
    bool _638 = _496 != 0.0;
    bool _640 = isnan(_496);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_452, _616, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _650 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _342);
    float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _654 = _482 * 2.0;
    bool _656 = _494 == 0.0;
    bool _658 = !_646;
    bool _660 = _656 && _658;
    float _662 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _370);
    float _664 = _648 * _636;
    bool _666 = _498 == 0.0;
    bool _668 = _666 && _660;
    float _670 = -_602;
    float _672 = _670 + 1.0;
    float _674 = floor(_654);
    float _676 = _588 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _678 = _604 * _484;
    bool _680 = !_446;
    int _682 = _680 ? 0 : 1;
    float _684 = in.m_63.x;
    float _686 = in.m_63.y;
    float _688 = in.m_63.z;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    int _704 = ~as_type<int>(_676);
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _712 = _208 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _714 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[116].x, _702);
    float _716 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _718 = _708;
    float _720 = _664;
    float _722 = _672;
    float _724 = _676;
    float _726 = _684;
    float _728 = _686;
    if (!_576)
    {
        int _730 = ~as_type<int>(_676);
        int _732 = _730 + 1;
        _718 = _732;
    }
    int _734 = _718;
    float _736 = fma(_712, _380, -0.5);
    float _738 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _740 = _716 * _226;
    bool _742 = _674 >= 0.0;
    bool _744 = isnan(_674);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _258 + _220;
    float _754 = _738 * _652;
    float _756 = _258 + _482;
    int _758 = _750 ? 0 : 1;
    float _760 = _752 + (-1.0);
    float _762 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[203].x, _754);
    bool _764 = _674 > 0.0;
    float _766 = _256 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _768 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _770 = floor(_762);
    bool _772 = !_692;
    int _774 = _772 ? 0 : 1;
    float _776 = _756 + (-1.0);
    float _778 = fma(_766, _424, -0.5);
    bool _780 = !_696;
    int _782 = _780 ? 0 : 1;
    float _784 = _650 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _786 = abs(_774);
    float _788 = _762 + 0.25;
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _792 = abs(_782);
    float _794 = in.m_65.x;
    float _796 = in.m_65.y;
    float _798 = in.m_65.z;
    int _800 = ~_758;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[203].z, _740);
    int _808 = _804;
    if (!_764)
    {
        int _810 = ~_758;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = floor(_788);
    float _818 = -_770;
    float _820 = _762 + _818;
    float _822 = _762 * 6.283185482025146484375;
    float _824 = float(_814);
    float _826 = _806 + 0.25;
    float _828 = float(_792);
    float _830 = _822 * 0.15915493667125701904296875;
    float _832 = float(_786);
    float _834 = floor(_826);
    float _836 = float(_634);
    float _838 = _828 * _824;
    bool _840 = _820 >= 0.5;
    bool _842 = isnan(_820);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.5);
    bool _848 = _844 || _846;
    int _850 = abs(_568);
    float _852 = _838 * (-2.0);
    float _854 = _832 * _836;
    float _856 = floor(_806);
    float _858 = -_816;
    float _860 = _788 + _858;
    bool _862 = !_848;
    float _864 = _862 ? 0.5 : (-0.5);
    float _866 = fma(_768, _852, _768);
    int _868 = abs(_432);
    float _870 = fma(_852, _796, _796);
    float _872 = float(_850);
    float _874 = _864 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _876 = _874 * 2.0;
    float _878 = _830 * 6.283185482025146484375;
    float _880 = sin(_878);
    bool _882 = _860 > 0.5;
    float _884 = _258 + (-0.5);
    float _886 = -_834;
    float _888 = _826 + _886;
    float _890 = _806 * 6.283185482025146484375;
    float _892 = _872 * _876;
    float _894 = float(_868);
    float _896 = -_856;
    float _898 = _806 + _896;
    bool _900 = !_442;
    int _902 = _900 ? 0 : 1;
    float _904 = _890 * 0.15915493667125701904296875;
    int _906 = abs(_624);
    float _908 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[196].y, _870);
    int _910 = abs(_902);
    float _912 = _860;
    float _914 = _888;
    if (_882)
    {
        float _916 = -_860;
        float _918 = _916 + 1.0;
        _912 = _918;
    }
    float _920 = _912;
    bool _922 = _898 >= 0.5;
    bool _924 = isnan(_898);
    bool _926 = _922 || _924;
    bool _928 = isnan(0.5);
    bool _930 = _926 || _928;
    float _932 = _880 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _934 = _904 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = fma(_920, 4.0, -1.0);
    bool _940 = !_930;
    float _942 = _940 ? 0.5 : (-0.5);
    float _944 = fma(_894, _932, _892);
    bool _946 = !_438;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_866, _552, _908);
    bool _952 = _888 > 0.5;
    float _954 = _942 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _956 = _954 * 2.0;
    int _958 = abs(_948);
    float _960 = _938 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _962 = float(_906);
    float _964 = float(_910);
    float _966 = fma(_962, _960, _944);
    float _968 = _936 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _970 = _964 * _956;
    float _972 = float(_958);
    if (_952)
    {
        float _974 = -_888;
        float _976 = _974 + 1.0;
        _914 = _976;
    }
    float _978 = _914;
    float _980 = fma(_966, 3.1415927410125732421875, _794);
    float _982 = _536 * (-0.15915493667125701904296875);
    bool _984 = !_700;
    int _986 = _984 ? 0 : 1;
    float _988 = fma(_978, 4.0, -1.0);
    float _990 = _854 * (-2.0);
    float _992 = fma(_972, _968, _970);
    int _994 = abs(_682);
    float _996 = _950 * 0.15915493667125701904296875;
    float _998 = fma(_980, _990, _980);
    float _1000 = _220 + _482;
    int _1002 = abs(_986);
    float _1004 = _482 + (-0.5);
    float _1006 = float(_994);
    float _1008 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1010 = _1000 + (-1.0);
    float _1012 = float(_734);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[196].x, _998);
    float _1016 = float(_1002);
    float _1018 = fma(_790, _990, _790);
    float _1020 = fma(_1006, _1008, _992);
    float _1022 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1024 = _220 + (-0.5);
    float _1026 = _1016 * _1012;
    float _1028 = fma(_1020, 3.1415927410125732421875, _798);
    float _1030 = fma(_1018, _552, _1014);
    if (_668)
    {
        _720 = _684;
    }
    float _1032 = _720;
    float _1034 = in.m_67.x;
    float _1036 = in.m_67.y;
    float _1038 = in.m_67.z;
    float _1040 = in.m_67.w;
    float _1042 = _1026 * (-2.0);
    float _1044 = _1032;
    if (_668)
    {
        _722 = _686;
    }
    float _1046 = _722;
    float _1048 = _982 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = _1046;
    if (_668)
    {
        _724 = _1032;
    }
    float _1054 = _724;
    float _1056 = fma(_1028, _1042, _1028);
    float _1058 = fma(_1022, _1042, _1022);
    float _1060 = _1054;
    if (!_668)
    {
        _1044 = _684;
    }
    float _1062 = _1044;
    float _1064 = _1030 * 0.15915493667125701904296875;
    float _1066 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1056);
    if (_668)
    {
        _726 = _1046;
    }
    float _1068 = _726;
    float _1070 = _982 * 6.283185482025146484375;
    float _1072 = cos(_1070);
    float _1074 = _1068;
    if (!_668)
    {
        _1052 = _686;
    }
    float _1076 = _1052;
    float _1078 = fma(_1058, _552, _1066);
    if (_668)
    {
        _728 = _688;
    }
    float _1080 = _728;
    float _1082 = _1080;
    if (!_668)
    {
        float _1084 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1062);
        _1060 = _1084;
    }
    float _1086 = _1060;
    if (!_668)
    {
        float _1088 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _688);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = _1078 * 0.15915493667125701904296875;
    if (!_668)
    {
        float _1094 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1076);
        _1074 = _1094;
    }
    float _1096 = _1074;
    float _1098 = _996 * 6.283185482025146484375;
    float _1100 = sin(_1098);
    float _1102 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1104 = _1034 * _1076;
    float _1106 = _1038 * _1062;
    float _1108 = _996 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1118 = _1036 * _688;
    float _1120 = -_1106;
    float _1122 = fma(_1034, _688, _1120);
    float _1124 = _1050 * _778;
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1064 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1072 * _778;
    float _1138 = -_1124;
    float _1140 = fma(_1072, _736, _1138);
    float _1142 = -_1118;
    float _1144 = fma(_1038, _1076, _1142);
    float _1146 = _1122 * _1040;
    out.m_69.x = _1126;
    out.m_69.y = _1132;
    out.m_69.z = _1134;
    out.m_69.w = _1102;
    float _1148 = _1064 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = fma(_542, _1140, _546);
    float _1154 = fma(_1050, _736, _1136);
    float _1156 = -_548;
    float _1158 = fma(_412, _1154, _1156);
    float _1160 = _1092 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = -_1104;
    float _1166 = fma(_1036, _1062, _1164);
    float _1168 = _1130 * _1110;
    float _1170 = _1144 * _1040;
    float _1172 = _1130 * _1100;
    float _1174 = _1166 * _1040;
    float _1176 = _1092 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = _1150 * _1110;
    float _1182 = _1150 * _1100;
    float _1184 = _1150 * _1162;
    float _1186 = _1130 * _1162;
    float _1188 = _1110 * _1162;
    float _1190 = _1100 * _1162;
    float _1192 = _1184 * _678;
    float _1194 = _1186 * _678;
    float _1196 = _1184 * _1036;
    float _1198 = _1186 * _1036;
    float _1200 = fma(_1178, _1180, _1172);
    float _1202 = fma(_1178, _1172, _1180);
    float _1204 = -_678;
    float _1206 = _1178 * _1204;
    float _1208 = -_1168;
    float _1210 = fma(_1178, _1182, _1208);
    float _1212 = fma(_1200, _626, _1192);
    float _1214 = -_1182;
    float _1216 = fma(_1178, _1168, _1214);
    float _1218 = fma(_1188, _626, _1206);
    float _1220 = -_1096;
    float _1222 = _1178 * _1220;
    float _1224 = fma(_1210, _612, _1212);
    float _1226 = fma(_1216, _626, _1194);
    float _1228 = fma(_1190, _612, _1218);
    float _1230 = -_1036;
    float _1232 = _1178 * _1230;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1236 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1238 = fma(_1202, _612, _1226);
    float _1240 = -_1146;
    float _1242 = _1178 * _1240;
    float _1244 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1234);
    float _1246 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1236);
    float _1248 = fma(_1188, _1086, _1222);
    float _1250 = fma(_1188, _1034, _1232);
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1244);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1246);
    float _1256 = fma(_1188, _1170, _1242);
    float _1258 = _1184 * _1096;
    float _1260 = _710 + _1252;
    float _1262 = _564 + _1254;
    float _1264 = _1186 * _1096;
    float _1266 = _1184 * _1146;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1270 = _1260 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1274 = _1262 + _1272;
    float _1276 = fma(_1200, _1034, _1196);
    float _1278 = fma(_1216, _1034, _1198);
    float _1280 = _1270 * _1270;
    float _1282 = _1274 * _1274;
    float _1284 = _1186 * _1146;
    float _1286 = fma(_1200, _1086, _1258);
    float _1288 = fma(_1216, _1086, _1264);
    float _1290 = _1280 + _1282;
    float _1292 = fma(_1216, _1170, _1284);
    float _1294 = fma(_1210, _1090, _1286);
    float _1296 = fma(_1190, _1090, _1248);
    float _1298 = sqrt(_1290);
    float _1300 = fma(_1190, _1038, _1250);
    float _1302 = fma(_1190, _1174, _1256);
    float _1304 = fma(_1202, _1090, _1288);
    float _1306 = fma(_1200, _1170, _1266);
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1310 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1312 = fma(_1210, _1038, _1276);
    float _1314 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1316 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1318 = fma(_1210, _1174, _1306);
    float _1320 = fma(_1202, _1038, _1278);
    float _1322 = fma(_1202, _1174, _1292);
    float _1324 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1310);
    float _1326 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1308);
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1330 = _1298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1314);
    float _1334 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1316);
    float _1336 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1338 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1324);
    float _1340 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1342 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1346 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1336);
    float _1348 = _784 + _1338;
    float _1350 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1340);
    float _1352 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1342);
    float _1354 = _1338;
    float _1356 = _1280;
    float _1358 = _1282;
    float _1360 = _1260;
    float _1362 = _1262;
    float _1364 = _1304;
    if (!_1330)
    {
        _1354 = _1348;
    }
    float _1366 = _1354;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1370 = !_1330;
    float _1372 = _1366;
    if (!_1370)
    {
        float _1374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1378 = _1298 + _1376;
        float _1380 = rsqrt(_1290);
        float _1382 = _1378 * _1374;
        float _1384 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = _1382 * 0.15915493667125701904296875;
        float _1388 = _1386 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = fma(_1390, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1380 * _1396;
        float _1400 = fma(_1270, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = _1394 + (-1.0);
        float _1404 = fma(_1274, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1408 = _1400 + _1406;
        float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1414 = _1404 + _1412;
        float _1416 = _1408 * _1408;
        float _1418 = fma(_1348, _1394, _1410);
        float _1420 = _1414 * _1414;
        _1372 = _1418;
        _1356 = _1416;
        _1358 = _1420;
        _1360 = _1400;
        _1362 = _1404;
    }
    float _1422 = _1372;
    float _1424 = _1356;
    float _1426 = _1358;
    float _1428 = _1360;
    float _1430 = _1362;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1434 = _1422 + _1432;
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1438 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1440 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = fma(_1434, _1434, _1424);
    float _1444 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1438);
    float _1448 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1440);
    float _1450 = _1442 + _1426;
    float _1452 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1444);
    float _1454 = _396 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = _416 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = _334 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1460 = _328 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1462 = sqrt(_1450);
    float _1464 = _1454 * _1344;
    float _1466 = _1456 * _1368;
    float _1468 = _1458 * _1328;
    float _1470 = _1460 * _1436;
    float _1472 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1350);
    float _1474 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1346);
    float _1476 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1446);
    float _1478 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1448);
    float _1480 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1352);
    float _1482 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1452);
    float _1484 = _1152 + 0.5;
    float _1486 = _1158 + 0.5;
    float _1488 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1490 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1332);
    float _1492 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1334);
    out.m_71.x = _1468;
    out.m_71.y = _1464;
    out.m_71.z = _1470;
    out.m_71.w = _1466;
    bool _1494 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1496 = isnan(_1462);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1502 = _1498 || _1500;
    out.m_73.x = _1484;
    out.m_73.y = _1486;
    out.m_75.x = _1472;
    out.m_75.y = _1474;
    out.m_75.z = _1480;
    out.m_77.x = _1476;
    out.m_77.y = _1478;
    out.m_77.z = _1482;
    if (!_1502)
    {
        _1364 = 1.0;
    }
    float _1504 = _1364;
    out.m_79.x = _1488;
    out.m_79.y = _1490;
    out.m_79.z = _1492;
    bool _1506 = !_1502;
    float _1508 = _1504;
    if (!_1506)
    {
        bool _1510 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1512 = isnan(_1462);
        bool _1514 = _1510 || _1512;
        bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1518 = _1514 || _1516;
        if (!_1518)
        {
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = _1462 + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1532 = 1.0 / _1526;
            float _1534 = _1522 * _1532;
            float _1536 = fma(_1534, _1530, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1508 = _1536;
            _1538 = true;
        }
        else
        {
            bool _1540 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1542 = isnan(_1462);
            bool _1544 = _1540 || _1542;
            bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1548 = _1544 || _1546;
            if (!_1548)
            {
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1462 + _1550;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1562 = 1.0 / _1556;
                float _1564 = _1552 * _1562;
                float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1508 = _1566;
                _1538 = true;
            }
            else
            {
                _1508 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1538 = false;
    float _1568 = _1508;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1572 = _1422 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1576 = _1428 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1580 = _1430 + _1578;
    float _1582 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1584 = fma(_1576, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1586 = fma(_1580, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1590 = _1582 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1594 = _1584 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1586 + _1596;
    float _1600 = fma(_564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1602 = _1590 * _1590;
    float _1604 = floor(_1600);
    float _1606 = fma(_1594, _1594, _1602);
    float _1608 = fma(_1598, _1598, _1606);
    float _1610 = rsqrt(_1608);
    float _1612 = -_1604;
    float _1614 = _1600 + _1612;
    float _1616 = sqrt(_1608);
    float _1618 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1594 * _1618;
    float _1622 = _1598 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1476;
    float _1640 = _1628;
    float _1642 = _1636;
    float _1644 = _1572;
    float _1646 = _1618;
    float _1648 = _1598;
    if (_1632)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1650;
    }
    float _1652 = _1638;
    if (_1632)
    {
        float _1654 = rsqrt(_1628);
        _1640 = _1654;
    }
    float _1656 = _1640;
    float _1658 = _1656;
    if (_1632)
    {
        float _1660 = _1636 * _1652;
        _1642 = _1660;
    }
    float _1662 = _1642;
    if (_1632)
    {
        float _1664 = _1662 * 0.15915493667125701904296875;
        _1644 = _1664;
    }
    float _1666 = _1644;
    float _1668 = _1482;
    float _1670 = _1666;
    if (_1632)
    {
        float _1672 = _1666 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        _1668 = _1674;
    }
    float _1676 = _1668;
    float _1678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1680 = precise::max(0.0, _1678);
    float _1682 = _1478;
    float _1684 = _1678;
    float _1686 = _1680;
    if (_1632)
    {
        float _1688 = _1666 * 6.283185482025146484375;
        float _1690 = cos(_1688);
        _1682 = _1690;
    }
    float _1692 = _1682;
    float _1694 = -_1618;
    float _1696 = -_1680;
    float _1698 = fma(_1590, _1694, _1696);
    float _1700 = _1698;
    if (_1632)
    {
        float _1702 = _1698 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1702;
    }
    float _1704 = _1684;
    float _1706 = _1704;
    if (!_1632)
    {
        _1670 = _1620;
    }
    float _1708 = _1670;
    float _1710 = _1676;
    float _1712 = _1708;
    if (_1632)
    {
        float _1714 = fma(_1676, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = _1716;
    if (!_1632)
    {
        _1706 = _1624;
    }
    float _1720 = _1706;
    float _1722 = _1720;
    if (_1632)
    {
        float _1724 = _1692 + (-1.0);
        _1686 = _1724;
    }
    float _1726 = _1686;
    float _1728 = _1726;
    if (_1632)
    {
        float _1730 = _1656 * _1716;
        _1646 = _1730;
    }
    float _1732 = _1646;
    if (!_1632)
    {
        _1658 = _1622;
    }
    float _1734 = _1658;
    float _1736 = _1734;
    if (_1632)
    {
        float _1738 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1728 = _1738;
    }
    float _1740 = _1728;
    if (_1632)
    {
        float _1742 = _1620 * _1732;
        _1712 = _1742;
    }
    float _1744 = _1712;
    if (_1632)
    {
        float _1746 = _1622 * _1732;
        _1736 = _1746;
    }
    float _1748 = _1736;
    if (!_1632)
    {
        _1718 = _1626;
    }
    float _1750 = _1718;
    float _1752 = _1750;
    if (_1632)
    {
        float _1754 = fma(_1698, _1692, _1740);
        _1700 = _1754;
    }
    float _1756 = _1700;
    if (_1632)
    {
        float _1758 = _1744 * _1744;
        _1722 = _1758;
    }
    float _1760 = _1722;
    if (_1632)
    {
        float _1762 = _1748 * _1748;
        _1752 = _1762;
    }
    float _1764 = _1752;
    float _1766 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1768 = fma(_1756, _1756, _1760);
    float _1770 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1772 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1766);
    float _1774 = _1768 + _1764;
    float _1776 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1770);
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1780 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1778);
    float _1782 = precise::clamp(_1780, 0.0, 1.0);
    float _1784 = rsqrt(_1774);
    float _1786 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1788 = -_1782;
    float _1790 = _1788 + 1.0;
    float _1792 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1796 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1798 = abs(_1790);
    float _1800 = log2(_1798);
    float _1802 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1804 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = -_1802;
    float _1808 = fma(_1806, _1794, 1.0);
    float _1810 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1812 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1814 = _1784 * _1744;
    float _1816 = _1784 * _1756;
    float _1818 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1810);
    float _1820 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    float _1822 = _1784 * _1748;
    float _1824 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1826 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1818);
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = floor(_1792);
    float _1832 = -_1824;
    float _1834 = fma(_1816, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1832);
    float _1836 = _1826 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1840 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = -_1822;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1834);
    float _1846 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1772);
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1838);
    float _1850 = log2(_1808);
    float _1852 = fma(_1844, -0.5, 0.5);
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1848);
    float _1858 = fma(_1844, 0.5, 0.5);
    float _1860 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1856);
    float _1864 = exp2(_1840);
    float _1866 = -_1830;
    float _1868 = _1792 + _1866;
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1872 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1860);
    float _1874 = fma(_1858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1876 = 1.0 / _1862;
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1870);
    float _1880 = _1816 + 1.0;
    float _1882 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1872);
    float _1884 = fma(_1858, _1874, -0.212114393711090087890625);
    float _1886 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1888 = _1850 * 0.693147182464599609375;
    float _1890 = sqrt(_1852);
    float _1892 = -_1816;
    float _1894 = fma(_1864, _1880, _1892);
    float _1896 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1886);
    float _1898 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1882);
    float _1900 = fma(_1858, _1884, 1.570728778839111328125);
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5402 = float2(_1868, _1614);
    float _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5402, float2(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5402, float2(0.0), isnan(_5402)), level(0.0)).x;
    float _1906 = fma(_1894, 0.5, 0.5);
    float _1908 = _1896 * _1876;
    float _1910 = _1898 * _1876;
    float _1912 = fma(_1908, 0.5, 0.5);
    float _1914 = fma(_1910, -0.5, 0.5);
    float _1916 = _1890 * 0.636619746685028076171875;
    float _1918 = -_1900;
    float _1920 = fma(_1916, _1918, 1.0);
    float3 _5433 = float3(_1912, _1914, _1902);
    float _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5433, float3(0.0), isnan(_5433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5433, float3(0.0), isnan(_5433)), level(0.0)).x;
    float3 _5444 = float3(_1912, _1914, _1902);
    float4 _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5444, float3(0.0), isnan(_5444)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5444, float3(0.0), isnan(_5444)), level(0.0)).xyzw;
    float _1927 = _1925.x;
    float _1929 = _1925.y;
    float _1931 = _1925.z;
    float _1933 = _1925.w;
    float2 _5460 = float2(_1920, _1906);
    float3 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5460, float2(0.0), isnan(_5460)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5460, float2(0.0), isnan(_5460)), level(0.0)).xyz;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1947 = _784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1949 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _1594;
    out.m_81.y = _1590;
    out.m_81.z = _1598;
    float _1951 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1945);
    float _1953 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1947);
    float _1955 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1949);
    float _1957 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1951);
    float _1959 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1953);
    float _1961 = in.m_83.x;
    float _1963 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1965 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1967 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1955);
    float _1969 = 1.0 / _1963;
    float _1971 = _1965 + _1963;
    out.m_85.x = _1584;
    out.m_85.y = _1582;
    out.m_85.z = _1586;
    float _1973 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1975 = _1973 + _1862;
    out.gl_Position.x = _1896;
    out.gl_Position.y = _1898;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1862;
    bool _1977 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.5);
    bool _1985 = _1981 || _1983;
    float _1987 = _1971 * _1969;
    float _1989 = _1987 * 0.5;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1993 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1991);
    float _1995 = 1.0 / _1993;
    float _1997 = _1957;
    float _1999 = _1993;
    float _2001 = _1967;
    float _2003 = _1800;
    if (!_1985)
    {
        _1997 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2005 = _1997;
    if (!_1985)
    {
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = _2005 + _2007;
        _1999 = _2009;
    }
    float _2011 = _1999;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = _1995 * _2013;
    float _2017 = abs(_2015);
    float _2019 = log2(_2017);
    if (!_1985)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2023 = _2015 + _2021;
        _2001 = _2023;
    }
    float _2025 = _2001;
    float _2027 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2029 = exp2(_2027);
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (!_1985)
    {
        float _2039 = 1.0 / _2011;
        _2037 = _2039;
    }
    float _2041 = _2037;
    if (_1985)
    {
        _2003 = 1.0;
    }
    float _2043 = _2003;
    float _2045 = fma(_2033, -2.0, 3.0);
    float _2047 = _2033 * _2033;
    float _2049 = _2047 * _2045;
    float _2051 = exp2(_2035);
    bool _2053 = _2015 <= 8000.0;
    bool _2055 = isnan(_2015);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan(8000.0);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = -_2049;
    float _2067 = _2065 + 1.0;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2049);
    float _2071 = _2043;
    if (!_1985)
    {
        float _2073 = _2025 * _2041;
        float _2075 = precise::clamp(_2073, 0.0, 1.0);
        _2071 = _2075;
    }
    float _2077 = _2071;
    float _2079 = _1975 * 0.5;
    float _2081 = _2063 * _2069;
    bool _2083 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2085 = isnan(_1616);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2091 = _2087 || _2089;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2095 = -_2051;
    float _2097 = _2095 + 1.0;
    out.m_87.z = _2079;
    out.m_87.w = _1862;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2101 = -_2099;
    float _2103 = _2101 + 1.0;
    float _2105 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2107 = _2103;
    if (!_2091)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2109 = _1648;
    float _2111 = _2077 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2113 = -_1904;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * _2093;
    float _2119 = precise::clamp(_2117, 0.0, 1.0);
    float _2121 = -_2119;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2125 = _1927;
    float _2127 = _1929;
    float _2129 = _2109;
    float _2131 = _2109;
    if (!_2091)
    {
        _2105 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2133 = _2105;
    float _2135 = _2123 * _1961;
    float _2137 = _2099 * _1922;
    float _2139 = _2135 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2141 = _1933 * _2103;
    float _2143 = _2133;
    float _2145 = _2133;
    if (!_2091)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2147 = _2107;
    float _2149 = _1933 * _2137;
    float _2151 = _1943 * _2137;
    out.m_89.x = _2139;
    float _2153 = fma(_1939, _2149, _1927);
    float _2155 = fma(_1941, _2149, _1929);
    float _2157 = fma(_1933, _2151, _1931);
    float _2159 = _2149;
    float _2161 = _2147;
    float _2163 = _2147;
    if (!_2091)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2165 = _2125;
    float _2167 = _2165;
    float _2169 = _2165;
    if (!_2091)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2171 = _2127;
    out.m_91.x = _2153;
    out.m_91.y = _2155;
    out.m_91.z = _2157;
    out.m_91.w = _2141;
    float _2173 = _2171;
    float _2175 = _2171;
    if (!_2091)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2177 = _2159;
    bool _2179 = !_2091;
    float _2181 = _2177;
    float _2183 = _2177;
    if (!_2179)
    {
        bool _2185 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1616);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1616 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2169 = _2237;
            _2183 = _2241;
            _2145 = _2233;
            _2131 = _2239;
            _2175 = _2235;
            _2163 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1616);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2143;
            _2145 = _2257;
            if (!_2255)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2167;
            _2169 = _2259;
            if (!_2255)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2173;
            _2175 = _2261;
            if (!_2255)
            {
                _2129 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2129;
            _2131 = _2263;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2181;
            _2183 = _2265;
            if (!_2255)
            {
                _2161 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2161;
            bool _2269 = !_2255;
            _2163 = _2267;
            if (!_2269)
            {
                bool _2271 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1616);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1616 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2169 = _2323;
                    _2183 = _2327;
                    _2145 = _2319;
                    _2131 = _2325;
                    _2175 = _2321;
                    _2163 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2131 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2163 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2169;
    float _2333 = _2183;
    float _2335 = _2145;
    float _2337 = _2131;
    float _2339 = _2175;
    float _2341 = _2163;
    float _2343 = fma(_1490, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = _2111 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = -_2335;
    float _2355 = _2353 + _2337;
    float _2357 = fma(_2345, _2349, _2331);
    out.m_93.x = 0.0;
    float _2359 = -_2339;
    float _2361 = _2359 + _2341;
    float _2363 = fma(_2345, _2355, _2335);
    float _2365 = _2357 * 0.586610972881317138671875;
    out.m_51.x = _2351;
    bool _2367 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2369 = fma(_2345, _2361, _2339);
    float _2371 = fma(_2363, 0.298911988735198974609375, _2365);
    bool _2373 = _2077 > 0.0;
    bool _2375 = isnan(_2077);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2369, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2363 + _2385;
    float _2389 = -_2383;
    float _2391 = _2357 + _2389;
    float _2393 = -_2383;
    float _2395 = _2369 + _2393;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2367;
    if (!_2403)
    {
        float _2405 = -_1582;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1584;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1586;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _1490 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_1488, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_1492, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2481;
        out.m_93.y = _2483;
        out.m_93.z = _2485;
    }
    out.m_95.x = _2397;
    out.m_95.y = _2399;
    out.m_95.z = _2401;
    if (_2381)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1538 = false;
    bool _194 = false;
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
        float _2544 = as_type<float>(_130);
        out.gl_Position.z = _2544;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_168);
        out.gl_Position.z = _2613;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _172 = !_170;
    float _190;
    int _192;
    if (!_172)
    {
        float _174 = in.m_55.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = as_type<int>(_182);
        _194 = true;
    }
    else
    {
        float _196 = float(_114);
        float _198 = 1.0 / _196;
        float _200 = _148 * _198;
        _190 = _200;
        _192 = as_type<int>(_198);
    }
    _194 = false;
    float _202 = _190;
    int _204 = _192;
    float _206 = in.m_55.w;
    float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _210 = in.m_57.x;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _214 = _212 != 0;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _218 = _216 != 0;
    float _220 = in.m_55.z;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _224 = _222 != 0;
    float _226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _230 = _228 != 0;
    float _232 = in.m_55.x;
    float _234 = in.m_48.x;
    float _236 = in.m_48.y;
    float _238 = in.m_48.z;
    bool _240 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _242 = isnan(_202);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _254 = 1.0 + _252;
    float _256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _258 = in.m_55.y;
    float _260 = in.m_57.y;
    bool _262 = _206 > 0.5;
    float _264 = 1.0 / _254;
    int _266 = as_type<int>(_206);
    int _268 = _204;
    float _270 = _210;
    if (_214)
    {
        float _272 = -_210;
        float _274 = _272 + 1.0;
        _266 = as_type<int>(_274);
    }
    int _276 = _266;
    if (_218)
    {
        float _278 = -_210;
        float _280 = _278 + 1.0;
        _268 = as_type<int>(_280);
    }
    int _282 = _268;
    float _284 = 0.0;
    if (!_214)
    {
        _284 = _210;
    }
    float _286 = _284;
    int _288 = 0;
    float _290 = _286;
    if (_224)
    {
        float _292 = -_210;
        float _294 = _292 + 1.0;
        _288 = as_type<int>(_294);
    }
    int _296 = _288;
    bool _298 = false;
    if (_214)
    {
        bool _300 = _220 > 0.5;
        _298 = _300;
    }
    bool _302 = _298;
    float _304 = _220 * 2.0;
    float _306 = 0.0;
    if (!_218)
    {
        _306 = _210;
    }
    float _308 = _306;
    float _310 = in.m_59.x;
    float _312 = in.m_59.y;
    float _314 = in.m_59.z;
    bool _316 = false;
    float _318 = _308;
    if (_218)
    {
        bool _320 = _232 > 0.5;
        _316 = _320;
    }
    bool _322 = _316;
    float _324 = floor(_304);
    if (_214)
    {
        float _326 = _302 ? as_type<float>(_276) : _210;
        _290 = _326;
    }
    float _328 = _290;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_218)
    {
        float _332 = _322 ? as_type<float>(_282) : _210;
        _318 = _332;
    }
    float _334 = _318;
    float _336 = _236 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _338 = _236 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _340 = _236 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _342 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[5].x, _336);
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _346 = _344 != 0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _354 = _352 != 0;
    float _356 = -_260;
    float _358 = _356 + 1.0;
    bool _360 = _258 > 0.5;
    float _362 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _364 = log2(_362);
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _368 = _366 != 0;
    float _370 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[4].x, _338);
    float _372 = _260;
    float _374 = _358;
    float _376 = _350;
    if (_224)
    {
        float _378 = _360 ? as_type<float>(_296) : _210;
        _270 = _378;
    }
    float _380 = _270;
    float _382 = fma(_234, (*spvDescriptorSet0.vp_c10)._m0[6].x, _340);
    int _384 = _360 ? as_type<int>(_358) : as_type<int>(_260);
    float _386 = _258 * 2.0;
    float _388 = _262 ? _358 : _260;
    float _390 = 1.0 / _350;
    bool _392 = _220 > 0.5;
    float _394 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[88].w, _330);
    float _396 = _230 ? as_type<float>(_384) : _260;
    float _398 = _314 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _402 = _400 != 0;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _410 = _408 != 0;
    float _412 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].w, _394);
    float _414 = floor(_386);
    float _416 = _346 ? _388 : _260;
    float _418 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _382);
    float _420 = _388;
    if (_354)
    {
        float _422 = _392 ? _358 : _260;
        _372 = _422;
    }
    float _424 = _372;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _426;
    bool _430 = !_402;
    int _432 = _430 ? 0 : 1;
    float _434 = _310 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _438 = _436 != 0;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _446 = _444 != 0;
    float _448 = _364 * _148;
    if (_368)
    {
        _420 = _232;
    }
    float _450 = _420;
    float _452 = _428 * _390;
    float _454 = exp2(_448);
    float _456 = _450;
    if (_368)
    {
        _374 = _450;
    }
    float _458 = _374;
    float _460 = _312 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _464 = _458;
    float _466 = _462;
    if (!_368)
    {
        _464 = _220;
    }
    float _468 = _464;
    float _470 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_368)
    {
        _376 = _220;
    }
    float _472 = _376;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _476 = _472;
    if (!_368)
    {
        _476 = _258;
    }
    float _478 = _476;
    float _480 = _468 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_368)
    {
        _456 = _232;
    }
    float _482 = _456;
    float _484 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _486 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[89].z, _462);
    if (_368)
    {
        _466 = _258;
    }
    float _488 = _466;
    float _490 = -_474;
    float _492 = fma(_480, 2.0, _490);
    float _494 = in.m_61.x;
    float _496 = in.m_61.y;
    float _498 = in.m_61.z;
    float _500 = _488;
    if (!_368)
    {
        _500 = _482;
    }
    float _502 = _500;
    float _504 = -_454;
    float _506 = _504 + 1.0;
    bool _508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _510 = isnan(1.0);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _516 = _512 || _514;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _522 = _502 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _524 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _526 = isnan(0.0);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _532 = _528 || _530;
    float _534 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[88].z, _518);
    float _536 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[89].x, _486);
    float _538 = fma(_522, -2.0, _520);
    float _540 = _532 ? _506 : 0.0;
    float _542 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[87].z, _534);
    float _544 = -_148;
    float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[86].x, _492);
    float _548 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[86].y, _538);
    if (_516)
    {
        float _550 = _540 * _264;
        _152 = _550;
    }
    float _552 = _152;
    bool _554 = _324 >= 0.0;
    bool _556 = isnan(_324);
    bool _558 = _554 || _556;
    bool _560 = isnan(0.0);
    bool _562 = _558 || _560;
    float _564 = _418 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _566 = !_406;
    int _568 = _566 ? 0 : 1;
    int _570 = _562 ? 0 : 1;
    bool _572 = _324 > 0.0;
    float _574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    bool _576 = _414 > 0.0;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _494);
    bool _580 = _414 >= 0.0;
    bool _582 = isnan(_414);
    bool _584 = _580 || _582;
    bool _586 = isnan(0.0);
    bool _588 = _584 || _586;
    float _590 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _592 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _594 = isnan(_202);
    bool _596 = _592 || _594;
    bool _598 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _600 = _596 || _598;
    float _602 = float(_600);
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _496);
    int _606 = ~_570;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    float _612 = _574 * _590;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _616 = _202 + _614;
    float _618 = -_250;
    float _620 = _618 + 1.0;
    bool _622 = !_410;
    int _624 = _622 ? 0 : 1;
    float _626 = _578 * _470;
    int _628 = _610;
    if (!_572)
    {
        int _630 = ~_570;
        int _632 = _630 + 1;
        _628 = _632;
    }
    int _634 = _628;
    float _636 = _602 * _620;
    bool _638 = _496 != 0.0;
    bool _640 = isnan(_496);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = fma(_452, _616, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _650 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _342);
    float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _654 = _482 * 2.0;
    bool _656 = _494 == 0.0;
    bool _658 = !_646;
    bool _660 = _656 && _658;
    float _662 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _370);
    float _664 = _648 * _636;
    bool _666 = _498 == 0.0;
    bool _668 = _666 && _660;
    float _670 = -_602;
    float _672 = _670 + 1.0;
    float _674 = floor(_654);
    float _676 = _588 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _678 = _604 * _484;
    bool _680 = !_446;
    int _682 = _680 ? 0 : 1;
    float _684 = in.m_63.x;
    float _686 = in.m_63.y;
    float _688 = in.m_63.z;
    int _690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _692 = _690 != 0;
    int _694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _696 = _694 != 0;
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _700 = _698 != 0;
    float _702 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[115].x, _664);
    int _704 = ~as_type<int>(_676);
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = _662 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _712 = _208 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _714 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[116].x, _702);
    float _716 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    int _718 = _708;
    float _720 = _664;
    float _722 = _672;
    float _724 = _676;
    float _726 = _684;
    float _728 = _686;
    if (!_576)
    {
        int _730 = ~as_type<int>(_676);
        int _732 = _730 + 1;
        _718 = _732;
    }
    int _734 = _718;
    float _736 = fma(_712, _380, -0.5);
    float _738 = _552 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    float _740 = _716 * _226;
    bool _742 = _674 >= 0.0;
    bool _744 = isnan(_674);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _258 + _220;
    float _754 = _738 * _652;
    float _756 = _258 + _482;
    int _758 = _750 ? 0 : 1;
    float _760 = _752 + (-1.0);
    float _762 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[203].x, _754);
    bool _764 = _674 > 0.0;
    float _766 = _256 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _768 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _770 = floor(_762);
    bool _772 = !_692;
    int _774 = _772 ? 0 : 1;
    float _776 = _756 + (-1.0);
    float _778 = fma(_766, _424, -0.5);
    bool _780 = !_696;
    int _782 = _780 ? 0 : 1;
    float _784 = _650 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _786 = abs(_774);
    float _788 = _762 + 0.25;
    float _790 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _792 = abs(_782);
    float _794 = in.m_65.x;
    float _796 = in.m_65.y;
    float _798 = in.m_65.z;
    int _800 = ~_758;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[203].z, _740);
    int _808 = _804;
    if (!_764)
    {
        int _810 = ~_758;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    float _816 = floor(_788);
    float _818 = -_770;
    float _820 = _762 + _818;
    float _822 = _762 * 6.283185482025146484375;
    float _824 = float(_814);
    float _826 = _806 + 0.25;
    float _828 = float(_792);
    float _830 = _822 * 0.15915493667125701904296875;
    float _832 = float(_786);
    float _834 = floor(_826);
    float _836 = float(_634);
    float _838 = _828 * _824;
    bool _840 = _820 >= 0.5;
    bool _842 = isnan(_820);
    bool _844 = _840 || _842;
    bool _846 = isnan(0.5);
    bool _848 = _844 || _846;
    int _850 = abs(_568);
    float _852 = _838 * (-2.0);
    float _854 = _832 * _836;
    float _856 = floor(_806);
    float _858 = -_816;
    float _860 = _788 + _858;
    bool _862 = !_848;
    float _864 = _862 ? 0.5 : (-0.5);
    float _866 = fma(_768, _852, _768);
    int _868 = abs(_432);
    float _870 = fma(_852, _796, _796);
    float _872 = float(_850);
    float _874 = _864 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _876 = _874 * 2.0;
    float _878 = _830 * 6.283185482025146484375;
    float _880 = sin(_878);
    bool _882 = _860 > 0.5;
    float _884 = _258 + (-0.5);
    float _886 = -_834;
    float _888 = _826 + _886;
    float _890 = _806 * 6.283185482025146484375;
    float _892 = _872 * _876;
    float _894 = float(_868);
    float _896 = -_856;
    float _898 = _806 + _896;
    bool _900 = !_442;
    int _902 = _900 ? 0 : 1;
    float _904 = _890 * 0.15915493667125701904296875;
    int _906 = abs(_624);
    float _908 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[196].y, _870);
    int _910 = abs(_902);
    float _912 = _860;
    float _914 = _888;
    if (_882)
    {
        float _916 = -_860;
        float _918 = _916 + 1.0;
        _912 = _918;
    }
    float _920 = _912;
    bool _922 = _898 >= 0.5;
    bool _924 = isnan(_898);
    bool _926 = _922 || _924;
    bool _928 = isnan(0.5);
    bool _930 = _926 || _928;
    float _932 = _880 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _934 = _904 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = fma(_920, 4.0, -1.0);
    bool _940 = !_930;
    float _942 = _940 ? 0.5 : (-0.5);
    float _944 = fma(_894, _932, _892);
    bool _946 = !_438;
    int _948 = _946 ? 0 : 1;
    float _950 = fma(_866, _552, _908);
    bool _952 = _888 > 0.5;
    float _954 = _942 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _956 = _954 * 2.0;
    int _958 = abs(_948);
    float _960 = _938 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _962 = float(_906);
    float _964 = float(_910);
    float _966 = fma(_962, _960, _944);
    float _968 = _936 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _970 = _964 * _956;
    float _972 = float(_958);
    if (_952)
    {
        float _974 = -_888;
        float _976 = _974 + 1.0;
        _914 = _976;
    }
    float _978 = _914;
    float _980 = fma(_966, 3.1415927410125732421875, _794);
    float _982 = _536 * (-0.15915493667125701904296875);
    bool _984 = !_700;
    int _986 = _984 ? 0 : 1;
    float _988 = fma(_978, 4.0, -1.0);
    float _990 = _854 * (-2.0);
    float _992 = fma(_972, _968, _970);
    int _994 = abs(_682);
    float _996 = _950 * 0.15915493667125701904296875;
    float _998 = fma(_980, _990, _980);
    float _1000 = _220 + _482;
    int _1002 = abs(_986);
    float _1004 = _482 + (-0.5);
    float _1006 = float(_994);
    float _1008 = _988 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1010 = _1000 + (-1.0);
    float _1012 = float(_734);
    float _1014 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[196].x, _998);
    float _1016 = float(_1002);
    float _1018 = fma(_790, _990, _790);
    float _1020 = fma(_1006, _1008, _992);
    float _1022 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1024 = _220 + (-0.5);
    float _1026 = _1016 * _1012;
    float _1028 = fma(_1020, 3.1415927410125732421875, _798);
    float _1030 = fma(_1018, _552, _1014);
    if (_668)
    {
        _720 = _684;
    }
    float _1032 = _720;
    float _1034 = in.m_67.x;
    float _1036 = in.m_67.y;
    float _1038 = in.m_67.z;
    float _1040 = in.m_67.w;
    float _1042 = _1026 * (-2.0);
    float _1044 = _1032;
    if (_668)
    {
        _722 = _686;
    }
    float _1046 = _722;
    float _1048 = _982 * 6.283185482025146484375;
    float _1050 = sin(_1048);
    float _1052 = _1046;
    if (_668)
    {
        _724 = _1032;
    }
    float _1054 = _724;
    float _1056 = fma(_1028, _1042, _1028);
    float _1058 = fma(_1022, _1042, _1022);
    float _1060 = _1054;
    if (!_668)
    {
        _1044 = _684;
    }
    float _1062 = _1044;
    float _1064 = _1030 * 0.15915493667125701904296875;
    float _1066 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1056);
    if (_668)
    {
        _726 = _1046;
    }
    float _1068 = _726;
    float _1070 = _982 * 6.283185482025146484375;
    float _1072 = cos(_1070);
    float _1074 = _1068;
    if (!_668)
    {
        _1052 = _686;
    }
    float _1076 = _1052;
    float _1078 = fma(_1058, _552, _1066);
    if (_668)
    {
        _728 = _688;
    }
    float _1080 = _728;
    float _1082 = _1080;
    if (!_668)
    {
        float _1084 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1062);
        _1060 = _1084;
    }
    float _1086 = _1060;
    if (!_668)
    {
        float _1088 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _688);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = _1078 * 0.15915493667125701904296875;
    if (!_668)
    {
        float _1094 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1076);
        _1074 = _1094;
    }
    float _1096 = _1074;
    float _1098 = _996 * 6.283185482025146484375;
    float _1100 = sin(_1098);
    float _1102 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1104 = _1034 * _1076;
    float _1106 = _1038 * _1062;
    float _1108 = _996 * 6.283185482025146484375;
    float _1110 = cos(_1108);
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1118 = _1036 * _688;
    float _1120 = -_1106;
    float _1122 = fma(_1034, _688, _1120);
    float _1124 = _1050 * _778;
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1128 = _1064 * 6.283185482025146484375;
    float _1130 = sin(_1128);
    float _1132 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1134 = _1116 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1072 * _778;
    float _1138 = -_1124;
    float _1140 = fma(_1072, _736, _1138);
    float _1142 = -_1118;
    float _1144 = fma(_1038, _1076, _1142);
    float _1146 = _1122 * _1040;
    out.m_69.x = _1126;
    out.m_69.y = _1132;
    out.m_69.z = _1134;
    out.m_69.w = _1102;
    float _1148 = _1064 * 6.283185482025146484375;
    float _1150 = cos(_1148);
    float _1152 = fma(_542, _1140, _546);
    float _1154 = fma(_1050, _736, _1136);
    float _1156 = -_548;
    float _1158 = fma(_412, _1154, _1156);
    float _1160 = _1092 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = -_1104;
    float _1166 = fma(_1036, _1062, _1164);
    float _1168 = _1130 * _1110;
    float _1170 = _1144 * _1040;
    float _1172 = _1130 * _1100;
    float _1174 = _1166 * _1040;
    float _1176 = _1092 * 6.283185482025146484375;
    float _1178 = sin(_1176);
    float _1180 = _1150 * _1110;
    float _1182 = _1150 * _1100;
    float _1184 = _1150 * _1162;
    float _1186 = _1130 * _1162;
    float _1188 = _1110 * _1162;
    float _1190 = _1100 * _1162;
    float _1192 = _1184 * _678;
    float _1194 = _1186 * _678;
    float _1196 = _1184 * _1036;
    float _1198 = _1186 * _1036;
    float _1200 = fma(_1178, _1180, _1172);
    float _1202 = fma(_1178, _1172, _1180);
    float _1204 = -_678;
    float _1206 = _1178 * _1204;
    float _1208 = -_1168;
    float _1210 = fma(_1178, _1182, _1208);
    float _1212 = fma(_1200, _626, _1192);
    float _1214 = -_1182;
    float _1216 = fma(_1178, _1168, _1214);
    float _1218 = fma(_1188, _626, _1206);
    float _1220 = -_1096;
    float _1222 = _1178 * _1220;
    float _1224 = fma(_1210, _612, _1212);
    float _1226 = fma(_1216, _626, _1194);
    float _1228 = fma(_1190, _612, _1218);
    float _1230 = -_1036;
    float _1232 = _1178 * _1230;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1236 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1238 = fma(_1202, _612, _1226);
    float _1240 = -_1146;
    float _1242 = _1178 * _1240;
    float _1244 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1234);
    float _1246 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1236);
    float _1248 = fma(_1188, _1086, _1222);
    float _1250 = fma(_1188, _1034, _1232);
    float _1252 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1244);
    float _1254 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1246);
    float _1256 = fma(_1188, _1170, _1242);
    float _1258 = _1184 * _1096;
    float _1260 = _710 + _1252;
    float _1262 = _564 + _1254;
    float _1264 = _1186 * _1096;
    float _1266 = _1184 * _1146;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1270 = _1260 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1274 = _1262 + _1272;
    float _1276 = fma(_1200, _1034, _1196);
    float _1278 = fma(_1216, _1034, _1198);
    float _1280 = _1270 * _1270;
    float _1282 = _1274 * _1274;
    float _1284 = _1186 * _1146;
    float _1286 = fma(_1200, _1086, _1258);
    float _1288 = fma(_1216, _1086, _1264);
    float _1290 = _1280 + _1282;
    float _1292 = fma(_1216, _1170, _1284);
    float _1294 = fma(_1210, _1090, _1286);
    float _1296 = fma(_1190, _1090, _1248);
    float _1298 = sqrt(_1290);
    float _1300 = fma(_1190, _1038, _1250);
    float _1302 = fma(_1190, _1174, _1256);
    float _1304 = fma(_1202, _1090, _1288);
    float _1306 = fma(_1200, _1170, _1266);
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1310 = _1224 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1312 = fma(_1210, _1038, _1276);
    float _1314 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1316 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1318 = fma(_1210, _1174, _1306);
    float _1320 = fma(_1202, _1038, _1278);
    float _1322 = fma(_1202, _1174, _1292);
    float _1324 = fma(_1228, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1310);
    float _1326 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1308);
    float _1328 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1330 = _1298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1332 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1314);
    float _1334 = fma(_1296, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1316);
    float _1336 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1338 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1324);
    float _1340 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1342 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1346 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1336);
    float _1348 = _784 + _1338;
    float _1350 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1340);
    float _1352 = fma(_1300, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1342);
    float _1354 = _1338;
    float _1356 = _1280;
    float _1358 = _1282;
    float _1360 = _1260;
    float _1362 = _1262;
    float _1364 = _1304;
    if (!_1330)
    {
        _1354 = _1348;
    }
    float _1366 = _1354;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1370 = !_1330;
    float _1372 = _1366;
    if (!_1370)
    {
        float _1374 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1378 = _1298 + _1376;
        float _1380 = rsqrt(_1290);
        float _1382 = _1378 * _1374;
        float _1384 = _1348 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1386 = _1382 * 0.15915493667125701904296875;
        float _1388 = _1386 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        float _1392 = _1386 * 6.283185482025146484375;
        float _1394 = cos(_1392);
        float _1396 = fma(_1390, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1398 = _1380 * _1396;
        float _1400 = fma(_1270, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = _1394 + (-1.0);
        float _1404 = fma(_1274, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1408 = _1400 + _1406;
        float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1414 = _1404 + _1412;
        float _1416 = _1408 * _1408;
        float _1418 = fma(_1348, _1394, _1410);
        float _1420 = _1414 * _1414;
        _1372 = _1418;
        _1356 = _1416;
        _1358 = _1420;
        _1360 = _1400;
        _1362 = _1404;
    }
    float _1422 = _1372;
    float _1424 = _1356;
    float _1426 = _1358;
    float _1428 = _1360;
    float _1430 = _1362;
    float _1432 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1434 = _1422 + _1432;
    float _1436 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1438 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1440 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = fma(_1434, _1434, _1424);
    float _1444 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1446 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1438);
    float _1448 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1440);
    float _1450 = _1442 + _1426;
    float _1452 = fma(_1302, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1444);
    float _1454 = _396 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = _416 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = _334 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1460 = _328 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1462 = sqrt(_1450);
    float _1464 = _1454 * _1344;
    float _1466 = _1456 * _1368;
    float _1468 = _1458 * _1328;
    float _1470 = _1460 * _1436;
    float _1472 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1350);
    float _1474 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1346);
    float _1476 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1446);
    float _1478 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1448);
    float _1480 = fma(_1320, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1352);
    float _1482 = fma(_1322, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1452);
    float _1484 = _1152 + 0.5;
    float _1486 = _1158 + 0.5;
    float _1488 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1326);
    float _1490 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1332);
    float _1492 = fma(_1304, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1334);
    out.m_71.x = _1468;
    out.m_71.y = _1464;
    out.m_71.z = _1470;
    out.m_71.w = _1466;
    bool _1494 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1496 = isnan(_1462);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1502 = _1498 || _1500;
    out.m_73.x = _1484;
    out.m_73.y = _1486;
    out.m_75.x = _1472;
    out.m_75.y = _1474;
    out.m_75.z = _1480;
    out.m_77.x = _1476;
    out.m_77.y = _1478;
    out.m_77.z = _1482;
    if (!_1502)
    {
        _1364 = 1.0;
    }
    float _1504 = _1364;
    out.m_79.x = _1488;
    out.m_79.y = _1490;
    out.m_79.z = _1492;
    bool _1506 = !_1502;
    float _1508 = _1504;
    if (!_1506)
    {
        bool _1510 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1512 = isnan(_1462);
        bool _1514 = _1510 || _1512;
        bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1518 = _1514 || _1516;
        if (!_1518)
        {
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = _1462 + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1532 = 1.0 / _1526;
            float _1534 = _1522 * _1532;
            float _1536 = fma(_1534, _1530, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1508 = _1536;
            _1538 = true;
        }
        else
        {
            bool _1540 = _1462 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1542 = isnan(_1462);
            bool _1544 = _1540 || _1542;
            bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1548 = _1544 || _1546;
            if (!_1548)
            {
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1462 + _1550;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1562 = 1.0 / _1556;
                float _1564 = _1552 * _1562;
                float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1508 = _1566;
                _1538 = true;
            }
            else
            {
                _1508 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1538 = false;
    float _1568 = _1508;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1572 = _1422 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1576 = _1428 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1580 = _1430 + _1578;
    float _1582 = fma(_1572, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1584 = fma(_1576, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1586 = fma(_1580, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1590 = _1582 + _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1594 = _1584 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1598 = _1586 + _1596;
    float _1600 = fma(_564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1602 = _1590 * _1590;
    float _1604 = floor(_1600);
    float _1606 = fma(_1594, _1594, _1602);
    float _1608 = fma(_1598, _1598, _1606);
    float _1610 = rsqrt(_1608);
    float _1612 = -_1604;
    float _1614 = _1600 + _1612;
    float _1616 = sqrt(_1608);
    float _1618 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1620 = _1594 * _1618;
    float _1622 = _1598 * _1618;
    float _1624 = _1620 * _1620;
    float _1626 = _1622 * _1622;
    float _1628 = _1624 + _1626;
    float _1630 = sqrt(_1628);
    bool _1632 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1636 = _1630 + _1634;
    float _1638 = _1476;
    float _1640 = _1628;
    float _1642 = _1636;
    float _1644 = _1572;
    float _1646 = _1618;
    float _1648 = _1598;
    if (_1632)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1638 = _1650;
    }
    float _1652 = _1638;
    if (_1632)
    {
        float _1654 = rsqrt(_1628);
        _1640 = _1654;
    }
    float _1656 = _1640;
    float _1658 = _1656;
    if (_1632)
    {
        float _1660 = _1636 * _1652;
        _1642 = _1660;
    }
    float _1662 = _1642;
    if (_1632)
    {
        float _1664 = _1662 * 0.15915493667125701904296875;
        _1644 = _1664;
    }
    float _1666 = _1644;
    float _1668 = _1482;
    float _1670 = _1666;
    if (_1632)
    {
        float _1672 = _1666 * 6.283185482025146484375;
        float _1674 = sin(_1672);
        _1668 = _1674;
    }
    float _1676 = _1668;
    float _1678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1680 = precise::max(0.0, _1678);
    float _1682 = _1478;
    float _1684 = _1678;
    float _1686 = _1680;
    if (_1632)
    {
        float _1688 = _1666 * 6.283185482025146484375;
        float _1690 = cos(_1688);
        _1682 = _1690;
    }
    float _1692 = _1682;
    float _1694 = -_1618;
    float _1696 = -_1680;
    float _1698 = fma(_1590, _1694, _1696);
    float _1700 = _1698;
    if (_1632)
    {
        float _1702 = _1698 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1684 = _1702;
    }
    float _1704 = _1684;
    float _1706 = _1704;
    if (!_1632)
    {
        _1670 = _1620;
    }
    float _1708 = _1670;
    float _1710 = _1676;
    float _1712 = _1708;
    if (_1632)
    {
        float _1714 = fma(_1676, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1710 = _1714;
    }
    float _1716 = _1710;
    float _1718 = _1716;
    if (!_1632)
    {
        _1706 = _1624;
    }
    float _1720 = _1706;
    float _1722 = _1720;
    if (_1632)
    {
        float _1724 = _1692 + (-1.0);
        _1686 = _1724;
    }
    float _1726 = _1686;
    float _1728 = _1726;
    if (_1632)
    {
        float _1730 = _1656 * _1716;
        _1646 = _1730;
    }
    float _1732 = _1646;
    if (!_1632)
    {
        _1658 = _1622;
    }
    float _1734 = _1658;
    float _1736 = _1734;
    if (_1632)
    {
        float _1738 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1728 = _1738;
    }
    float _1740 = _1728;
    if (_1632)
    {
        float _1742 = _1620 * _1732;
        _1712 = _1742;
    }
    float _1744 = _1712;
    if (_1632)
    {
        float _1746 = _1622 * _1732;
        _1736 = _1746;
    }
    float _1748 = _1736;
    if (!_1632)
    {
        _1718 = _1626;
    }
    float _1750 = _1718;
    float _1752 = _1750;
    if (_1632)
    {
        float _1754 = fma(_1698, _1692, _1740);
        _1700 = _1754;
    }
    float _1756 = _1700;
    if (_1632)
    {
        float _1758 = _1744 * _1744;
        _1722 = _1758;
    }
    float _1760 = _1722;
    if (_1632)
    {
        float _1762 = _1748 * _1748;
        _1752 = _1762;
    }
    float _1764 = _1752;
    float _1766 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1768 = fma(_1756, _1756, _1760);
    float _1770 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1772 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1766);
    float _1774 = _1768 + _1764;
    float _1776 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1770);
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1780 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1778);
    float _1782 = precise::clamp(_1780, 0.0, 1.0);
    float _1784 = rsqrt(_1774);
    float _1786 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1776);
    float _1788 = -_1782;
    float _1790 = _1788 + 1.0;
    float _1792 = fma(_710, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1794 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1796 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1798 = abs(_1790);
    float _1800 = log2(_1798);
    float _1802 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1804 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1806 = -_1802;
    float _1808 = fma(_1806, _1794, 1.0);
    float _1810 = _1582 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1812 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1804);
    float _1814 = _1784 * _1744;
    float _1816 = _1784 * _1756;
    float _1818 = fma(_1584, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1810);
    float _1820 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1812);
    float _1822 = _1784 * _1748;
    float _1824 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1826 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1818);
    float _1828 = _1820 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1830 = floor(_1792);
    float _1832 = -_1824;
    float _1834 = fma(_1816, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1832);
    float _1836 = _1826 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1840 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1842 = -_1822;
    float _1844 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1834);
    float _1846 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1772);
    float _1848 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1838);
    float _1850 = log2(_1808);
    float _1852 = fma(_1844, -0.5, 0.5);
    float _1854 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1856 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1848);
    float _1858 = fma(_1844, 0.5, 0.5);
    float _1860 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1856);
    float _1864 = exp2(_1840);
    float _1866 = -_1830;
    float _1868 = _1792 + _1866;
    float _1870 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1872 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1860);
    float _1874 = fma(_1858, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1876 = 1.0 / _1862;
    float _1878 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1870);
    float _1880 = _1816 + 1.0;
    float _1882 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1872);
    float _1884 = fma(_1858, _1874, -0.212114393711090087890625);
    float _1886 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1888 = _1850 * 0.693147182464599609375;
    float _1890 = sqrt(_1852);
    float _1892 = -_1816;
    float _1894 = fma(_1864, _1880, _1892);
    float _1896 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1886);
    float _1898 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1882);
    float _1900 = fma(_1858, _1884, 1.570728778839111328125);
    float _1902 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _5402 = float2(_1868, _1614);
    float _1904 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5402, float2(0.0), isnan(_5402)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5402, float2(0.0), isnan(_5402)), level(0.0)).x;
    float _1906 = fma(_1894, 0.5, 0.5);
    float _1908 = _1896 * _1876;
    float _1910 = _1898 * _1876;
    float _1912 = fma(_1908, 0.5, 0.5);
    float _1914 = fma(_1910, -0.5, 0.5);
    float _1916 = _1890 * 0.636619746685028076171875;
    float _1918 = -_1900;
    float _1920 = fma(_1916, _1918, 1.0);
    float3 _5433 = float3(_1912, _1914, _1902);
    float _1922 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5433, float3(0.0), isnan(_5433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5433, float3(0.0), isnan(_5433)), level(0.0)).x;
    float3 _5444 = float3(_1912, _1914, _1902);
    float4 _1925 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5444, float3(0.0), isnan(_5444)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5444, float3(0.0), isnan(_5444)), level(0.0)).xyzw;
    float _1927 = _1925.x;
    float _1929 = _1925.y;
    float _1931 = _1925.z;
    float _1933 = _1925.w;
    float2 _5460 = float2(_1920, _1906);
    float3 _1937 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5460, float2(0.0), isnan(_5460)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5460, float2(0.0), isnan(_5460)), level(0.0)).xyz;
    float _1939 = _1937.x;
    float _1941 = _1937.y;
    float _1943 = _1937.z;
    float _1945 = _784 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1947 = _784 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1949 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_81.x = _1594;
    out.m_81.y = _1590;
    out.m_81.z = _1598;
    float _1951 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1945);
    float _1953 = fma(_710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1947);
    float _1955 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1949);
    float _1957 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1951);
    float _1959 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1953);
    float _1961 = in.m_83.x;
    float _1963 = _1957 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1965 = _1959 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1967 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1955);
    float _1969 = 1.0 / _1963;
    float _1971 = _1965 + _1963;
    out.m_85.x = _1584;
    out.m_85.y = _1582;
    out.m_85.z = _1586;
    float _1973 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1975 = _1973 + _1862;
    out.gl_Position.x = _1896;
    out.gl_Position.y = _1898;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1862;
    bool _1977 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1979 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.5);
    bool _1985 = _1981 || _1983;
    float _1987 = _1971 * _1969;
    float _1989 = _1987 * 0.5;
    float _1991 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1993 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1991);
    float _1995 = 1.0 / _1993;
    float _1997 = _1957;
    float _1999 = _1993;
    float _2001 = _1967;
    float _2003 = _1800;
    if (!_1985)
    {
        _1997 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2005 = _1997;
    if (!_1985)
    {
        float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2009 = _2005 + _2007;
        _1999 = _2009;
    }
    float _2011 = _1999;
    float _2013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2015 = _1995 * _2013;
    float _2017 = abs(_2015);
    float _2019 = log2(_2017);
    if (!_1985)
    {
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2023 = _2015 + _2021;
        _2001 = _2023;
    }
    float _2025 = _2001;
    float _2027 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2029 = exp2(_2027);
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2033 = precise::clamp(_2031, 0.0, 1.0);
    float _2035 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[654].x;
    if (!_1985)
    {
        float _2039 = 1.0 / _2011;
        _2037 = _2039;
    }
    float _2041 = _2037;
    if (_1985)
    {
        _2003 = 1.0;
    }
    float _2043 = _2003;
    float _2045 = fma(_2033, -2.0, 3.0);
    float _2047 = _2033 * _2033;
    float _2049 = _2047 * _2045;
    float _2051 = exp2(_2035);
    bool _2053 = _2015 <= 8000.0;
    bool _2055 = isnan(_2015);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan(8000.0);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = -_2049;
    float _2067 = _2065 + 1.0;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2049);
    float _2071 = _2043;
    if (!_1985)
    {
        float _2073 = _2025 * _2041;
        float _2075 = precise::clamp(_2073, 0.0, 1.0);
        _2071 = _2075;
    }
    float _2077 = _2071;
    float _2079 = _1975 * 0.5;
    float _2081 = _2063 * _2069;
    bool _2083 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2085 = isnan(_1616);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2091 = _2087 || _2089;
    float _2093 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2095 = -_2051;
    float _2097 = _2095 + 1.0;
    out.m_87.z = _2079;
    out.m_87.w = _1862;
    float _2099 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2101 = -_2099;
    float _2103 = _2101 + 1.0;
    float _2105 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2107 = _2103;
    if (!_2091)
    {
        _1648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2109 = _1648;
    float _2111 = _2077 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2113 = -_1904;
    float _2115 = _2113 + 1.0;
    float _2117 = _2115 * _2093;
    float _2119 = precise::clamp(_2117, 0.0, 1.0);
    float _2121 = -_2119;
    float _2123 = fma(_2121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2125 = _1927;
    float _2127 = _1929;
    float _2129 = _2109;
    float _2131 = _2109;
    if (!_2091)
    {
        _2105 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2133 = _2105;
    float _2135 = _2123 * _1961;
    float _2137 = _2099 * _1922;
    float _2139 = _2135 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2141 = _1933 * _2103;
    float _2143 = _2133;
    float _2145 = _2133;
    if (!_2091)
    {
        _2107 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2147 = _2107;
    float _2149 = _1933 * _2137;
    float _2151 = _1943 * _2137;
    out.m_89.x = _2139;
    float _2153 = fma(_1939, _2149, _1927);
    float _2155 = fma(_1941, _2149, _1929);
    float _2157 = fma(_1933, _2151, _1931);
    float _2159 = _2149;
    float _2161 = _2147;
    float _2163 = _2147;
    if (!_2091)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2165 = _2125;
    float _2167 = _2165;
    float _2169 = _2165;
    if (!_2091)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2171 = _2127;
    out.m_91.x = _2153;
    out.m_91.y = _2155;
    out.m_91.z = _2157;
    out.m_91.w = _2141;
    float _2173 = _2171;
    float _2175 = _2171;
    if (!_2091)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2177 = _2159;
    bool _2179 = !_2091;
    float _2181 = _2177;
    float _2183 = _2177;
    if (!_2179)
    {
        bool _2185 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1616);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1616 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2169 = _2237;
            _2183 = _2241;
            _2145 = _2233;
            _2131 = _2239;
            _2175 = _2235;
            _2163 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1616);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2143;
            _2145 = _2257;
            if (!_2255)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2167;
            _2169 = _2259;
            if (!_2255)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2173;
            _2175 = _2261;
            if (!_2255)
            {
                _2129 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2129;
            _2131 = _2263;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2181;
            _2183 = _2265;
            if (!_2255)
            {
                _2161 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2161;
            bool _2269 = !_2255;
            _2163 = _2267;
            if (!_2269)
            {
                bool _2271 = _1616 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1616);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1616 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2169 = _2323;
                    _2183 = _2327;
                    _2145 = _2319;
                    _2131 = _2325;
                    _2175 = _2321;
                    _2163 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2131 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2163 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2169;
    float _2333 = _2183;
    float _2335 = _2145;
    float _2337 = _2131;
    float _2339 = _2175;
    float _2341 = _2163;
    float _2343 = fma(_1490, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = _2111 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = -_2335;
    float _2355 = _2353 + _2337;
    float _2357 = fma(_2345, _2349, _2331);
    out.m_93.x = 0.0;
    float _2359 = -_2339;
    float _2361 = _2359 + _2341;
    float _2363 = fma(_2345, _2355, _2335);
    float _2365 = _2357 * 0.586610972881317138671875;
    out.m_51.x = _2351;
    bool _2367 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2369 = fma(_2345, _2361, _2339);
    float _2371 = fma(_2363, 0.298911988735198974609375, _2365);
    bool _2373 = _2077 > 0.0;
    bool _2375 = isnan(_2077);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2369, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2363 + _2385;
    float _2389 = -_2383;
    float _2391 = _2357 + _2389;
    float _2393 = -_2383;
    float _2395 = _2369 + _2393;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2367;
    if (!_2403)
    {
        float _2405 = -_1582;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1584;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1586;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _1490 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_1488, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_1492, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2481;
        out.m_93.y = _2483;
        out.m_93.z = _2485;
    }
    out.m_95.x = _2397;
    out.m_95.y = _2399;
    out.m_95.z = _2401;
    if (_2381)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

