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
    float4 m_69 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_79 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_65 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_55 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2450 = false;
    bool _688 = false;
    bool _380 = false;
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
        float _2998 = as_type<float>(_114);
        out.gl_Position.z = _2998;
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
        float _3067 = as_type<float>(_150);
        out.gl_Position.z = _3067;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _156 * _154;
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = _174 * 6.283185482025146484375;
    float _184 = floor(_174);
    float _186 = _182 * 0.15915493667125701904296875;
    float _188 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = 0.0;
    float _192 = _188;
    if (!_166)
    {
        float _194 = _188 * _188;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = _198;
    if (!_166)
    {
        float _206 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = -_184;
    float _212 = _174 + _210;
    bool _214 = !_166;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _188 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _188);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_166;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _188 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _192 = _270;
    }
    float _272 = _192;
    float _274 = in.m_53.w;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = in.m_44.x;
    float _288 = in.m_44.y;
    float _290 = in.m_44.z;
    float _292 = -_212;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _296 = _212 < 0.5;
    float _298 = float(_296);
    bool _300 = !_280;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_202, 0.5, 0.5);
    bool _306 = !_170;
    int _308 = _306 ? 0 : 1;
    float _310 = -_298;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_302);
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _176, _276);
    int _322 = abs(_308);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_284;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_272, _178, _324);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_314);
    float _340 = float(_322);
    float _342 = abs(_294);
    float _344 = _338 * _342;
    float _346 = fma(_272, _180, _336);
    float _348 = fma(_330, _274, _288);
    float _350 = float(_334);
    float _352 = fma(_340, _318, _344);
    float _354 = fma(_320, _274, _286);
    float _356 = fma(_346, _274, _290);
    float _358 = abs(_312);
    float _360 = fma(_350, _358, _352);
    bool _362 = !_332;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_98);
        float _384 = 1.0 / _382;
        float _386 = _132 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _388 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = _388 + _394;
    bool _398 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _400 = isnan(_388);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _428 = _388 + _426;
    float _430 = 1.0 / _412;
    bool _432 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_388);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = 1.0 / _424;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _448 = 1.0 / _420;
    float _450 = _392 * _430;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _454 = _388 + _452;
    float _456 = -_408;
    float _458 = _456 + 1.0;
    float _460 = 1.0 / _416;
    float _462 = _454 * _444;
    bool _464 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _466 = isnan(_388);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _474 * _458;
    float _478 = _396 * _448;
    bool _480 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_388);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_474;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _500;
    float _504 = _490 * _494;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = _428 * _460;
    bool _512 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_388);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _524;
    float _528 = fma(_498, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _530 = fma(_502, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = -_522;
    float _538 = _536 + 1.0;
    float _540 = fma(_526, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _542 = _522 * _508;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _552 = _442 * _538;
    float _554 = fma(_534, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_546, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = _528 * _552;
    float _562 = _530 * _552;
    float _564 = _540 * _552;
    float _566 = -_442;
    float _568 = _566 + 1.0;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _592 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _564);
    float _594 = fma(_578, _478, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_582, _478, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _598 = fma(_586, _478, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_554, _542, _588);
    float _602 = fma(_556, _542, _590);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _616 = fma(_558, _542, _592);
    float _618 = fma(_606, _462, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _620 = fma(_610, _462, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _622 = fma(_594, _504, _600);
    float _624 = fma(_596, _504, _602);
    float _626 = fma(_614, _462, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_598, _504, _616);
    float _630 = fma(_618, _476, _622);
    float _632 = fma(_620, _476, _624);
    float _634 = fma(_626, _476, _628);
    float _636 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].x, _630);
    float _638 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].y, _632);
    float _640 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].z, _634);
    float _642 = _636 * _570;
    float _644 = _638 * _572;
    float _646 = _640 * _574;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _662 = !_446;
    float _684;
    float _686;
    if (!_662)
    {
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _666 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _668 = float(_98);
        float _670 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _672 = 1.0 / _668;
        float _674 = _670 * _664;
        float _676 = floor(_674);
        float _678 = _132 * _672;
        float _680 = -_676;
        float _682 = _674 + _680;
        _684 = _682;
        _686 = _678;
        _688 = true;
    }
    else
    {
        float _690 = float(_98);
        float _692 = 1.0 / _690;
        float _694 = _132 * _692;
        _684 = _694;
        _686 = _694;
    }
    _688 = false;
    float _696 = _684;
    float _698 = _686;
    float _700 = in.m_55.y;
    float _702 = _360 * _642;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _714 = _712 != 0;
    float _716 = _360 * _644;
    float _718 = in.m_51.w;
    float _720 = _152 * 2.0;
    float _722 = in.m_57.x;
    float _724 = in.m_57.y;
    float _726 = in.m_57.z;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _730 = _728 != 0;
    float _732 = floor(_720);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _736 = _734 != 0;
    float _738 = in.m_59.x;
    float _740 = in.m_59.y;
    float _742 = in.m_59.z;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _746 = _744 != 0;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = in.m_61.x;
    float _752 = in.m_61.y;
    float _754 = in.m_61.z;
    float _756 = _360 * _646;
    float _758 = in.m_51.y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _768 = -_700;
    float _770 = _768 + 1.0;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _774 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _776 = _718 > 0.5;
    float _778 = 1.0 / _766;
    float _780 = _718 * 6.283185482025146484375;
    float _782 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    int _784 = _776 ? as_type<int>(_770) : as_type<int>(_700);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _696 + _786;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _792 = _790 != 0;
    float _794 = _348 * _724;
    float _796 = _348 * _740;
    float _798 = 1.0 / _762;
    float _800 = fma(_354, _722, _794);
    float _802 = _348 * _752;
    float _804 = fma(_354, _738, _796);
    float _806 = _746 ? as_type<float>(_784) : _700;
    float _808 = fma(_354, _750, _802);
    float _810 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _812;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _820 = _758 > 0.5;
    float _822 = in.m_63.x;
    float _824 = -_748;
    float _826 = fma(_810, 2.0, _824);
    float _828 = 1.0 / _814;
    float _830 = _700;
    if (_792)
    {
        float _832 = _820 ? _770 : _700;
        _830 = _832;
    }
    float _834 = _830;
    float _836 = _758 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _838;
    float _842 = fma(_836, -2.0, _772);
    bool _844 = _732 > 0.0;
    float _846 = 1.0 / _818;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _856 = _732 >= 0.0;
    bool _858 = isnan(_732);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _872 = _696 + _870;
    float _874 = _758 * 2.0;
    float _876 = 1.0 / _850;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _884 = _696 + _882;
    float _886 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _888 = _884 * _828;
    float _890 = 1.0 / _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _896 = _788 * _846;
    float _898 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _886);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _902 = _698 + _900;
    float _904 = 1.0 / _894;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _910 = -_822;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[191].x, _132);
    float _914 = -_718;
    float _916 = fma(_914, 0.0350000001490116119384765625, 0.070000000298023223876953125);
    float _918 = fma(_356, _742, _804);
    float _920 = _872 * _876;
    float _922 = _912 * _916;
    float _924 = fma(_912, 0.100000001490116119384765625, _780);
    float _926 = fma(_912, 0.00999999977648258209228515625, _780);
    float _928 = 1.0 / _854;
    float _930 = fma(_356, _726, _800);
    float _932 = fma(_356, _754, _808);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _940 = _696 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _942;
    float _946 = 1.0 / _908;
    float _948 = in.m_51.z;
    float _950 = _940 * _778;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _964;
    float _968 = 1.0 / _936;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _972 = _696 + _970;
    float _974 = _962 * _904;
    int _976 = _864 ? 0 : 1;
    float _978 = _958 * _890;
    float _980 = _972 * _798;
    float _982 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _984 = 1.0 / _954;
    bool _986 = _758 >= 0.949999988079071044921875;
    bool _988 = isnan(_758);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.949999988079071044921875);
    bool _994 = _990 || _992;
    float _996 = _966 * _946;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1002 = ~_976;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _1012 = _1006;
    float _1014 = 1.0;
    if (!_844)
    {
        int _1016 = ~_976;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    float _1022 = fma(_974, _902, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1024 = 1.0 / _1000;
    float _1026 = _948 * 2.0;
    float _1028 = _840 * _968;
    bool _1030 = !_710;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _152 + _948;
    float _1036 = _1010 * _928;
    float _1038 = _868 * _984;
    float _1040 = in.m_65.x;
    float _1042 = in.m_65.y;
    float _1044 = in.m_65.z;
    float _1046 = floor(_1026);
    float _1048 = _758 + _948;
    float _1050 = _1034 + (-1.0);
    float _1052 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _1054 = _1048 + (-1.0);
    float _1056 = _944 * _1024;
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = floor(_874);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1064 = _152 + _758;
    float _1066 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1052);
    float _1068 = _1064 + (-1.0);
    float _1070 = fma(_718, 2.0, -1.0);
    bool _1072 = _1046 > 0.0;
    float _1074 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1076 = _1046 >= 0.0;
    bool _1078 = isnan(_1046);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _898);
    bool _1088 = !_994;
    float _1090 = _1088 ? 1.0 : 1.5;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1092;
    float _1096 = _1026 + (-1.0);
    int _1098 = _1084 ? 0 : 1;
    float _1100 = _1090 * _1040;
    float _1102 = _1090 * _1044;
    float _1104 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _1106 = fma(_1094, _888, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1108 = _874 + (-1.0);
    float _1110 = -_132;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[76].x, _826);
    bool _1114 = _1060 > 0.0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    bool _1120 = _1060 >= 0.0;
    bool _1122 = isnan(_1060);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1090 * _1042;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1152 = fma(_1134, _980, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1154 = fma(_1118, _980, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1156 = fma(_1138, _980, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1158 = fma(_1142, _950, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1160 = fma(_1146, _950, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1162 = fma(_1150, _950, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1176;
    float _1180 = fma(_1166, _896, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1182 = fma(_1170, _888, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1184 = fma(_1178, _888, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1186 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1188 = log2(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1192 = _698 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1206 = fma(_996, _1192, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1214 = _698 + _1212;
    float _1216 = fma(_1174, _896, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1218 = fma(_1196, _920, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1220 = fma(_1200, _920, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1222 = fma(_1204, _896, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1224 = fma(_1210, _920, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1226 = fma(_1056, _1214, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1230 = _698 + _1228;
    bool _1232 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1234 = isnan(_696);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1246 = _698 + _1244;
    bool _1248 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1250 = isnan(_696);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = fma(_1036, _1230, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1262 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1264 = isnan(_696);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = _132 * _1188;
    bool _1276 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1278 = isnan(_696);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = fma(_978, _1246, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1290 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1292 = isnan(_696);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1304 = _698 + _1302;
    bool _1306 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1308 = isnan(_696);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1320 = _698 + _1318;
    bool _1322 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1324 = isnan(_698);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1330 = _1326 || _1328;
    float _1332 = float(_1330);
    float _1334 = fma(_1028, _1304, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1336 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1338 = isnan(_698);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1316;
    float _1350 = _1348 + 1.0;
    bool _1352 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1354 = isnan(_698);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1332;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_1038, _1320, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1370 = -_1346;
    float _1372 = _1370 + 1.0;
    float _1374 = exp2(_1274);
    float _1376 = _1346 * _1366;
    bool _1378 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1380 = isnan(_698);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = in.m_55.x;
    bool _1392 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1394 = isnan(_698);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1300 * _1350;
    bool _1406 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1408 = isnan(_698);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1362;
    float _1420 = _1418 + 1.0;
    bool _1422 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1424 = isnan(_698);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _842);
    bool _1436 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1438 = isnan(_698);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    float _1448 = -_1300;
    float _1450 = _1448 + 1.0;
    float _1452 = _1362 * _1372;
    float _1454 = -_1286;
    float _1456 = _1454 + 1.0;
    int _1458 = _1128 ? 0 : 1;
    float _1460 = _1286 * _1450;
    float _1462 = _1446 * _1420;
    float _1464 = -_1446;
    float _1466 = _1464 + 1.0;
    float _1468 = _1272 * _1456;
    float _1470 = -_1432;
    float _1472 = _1470 + 1.0;
    float _1474 = -_1272;
    float _1476 = _1474 + 1.0;
    float _1478 = _1432 * _1466;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1482 = 1.0 + _1480;
    float _1484 = _1416 * _1472;
    float _1486 = -_1416;
    float _1488 = _1486 + 1.0;
    float _1490 = -_1374;
    float _1492 = _1490 + 1.0;
    bool _1494 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1502 = _1498 || _1500;
    float _1504 = _1258 * _1476;
    float _1506 = _1402 * _1488;
    float _1508 = -_1402;
    float _1510 = _1508 + 1.0;
    float _1512 = 1.0 / _1482;
    float _1514 = _1502 ? _1492 : 0.0;
    float _1516 = -_1258;
    float _1518 = _1516 + 1.0;
    bool _1520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1522 = isnan(1.0);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1528 = _1524 || _1526;
    float _1530 = _1388 * _1510;
    float _1532 = _1518;
    bool _1534 = _1072;
    bool _1536 = _1114;
    if (!_730)
    {
        _1014 = _1390;
    }
    float _1538 = _1014;
    float _1540 = _1242 * _1518;
    float _1542 = _1288 * _1530;
    float _1544 = _1538;
    if (!_730)
    {
        _1532 = _1538;
    }
    float _1546 = _1532;
    float _1548 = _1152 * _1540;
    float _1550 = _1546;
    if (_730)
    {
        _1544 = _1390;
    }
    float _1552 = _1544;
    float _1554 = _1154 * _1540;
    float _1556 = in.m_67.x;
    float _1558 = in.m_67.y;
    float _1560 = in.m_67.z;
    float _1562 = _1156 * _1540;
    int _1564 = abs(_1032);
    float _1566 = _1514 * _1512;
    float _1568 = _918 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1570 = float(_1564);
    float _1572 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1574 = float(_1020);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1578 = ~_1098;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    float _1584 = _932 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1586 = _1582;
    float _1588 = _1552;
    float _1590 = _1572;
    if (!_1072)
    {
        int _1592 = ~_1098;
        int _1594 = _1592 + 1;
        _1586 = _1594;
    }
    int _1596 = _1586;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1600 = _1570 * _1574;
    int _1602 = ~_1458;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1576);
    float _1610 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1598);
    int _1612 = _1606;
    if (!_1114)
    {
        int _1614 = ~_1458;
        int _1616 = _1614 + 1;
        _1612 = _1616;
    }
    int _1618 = _1612;
    float _1620 = _1600 * (-2.0);
    bool _1622 = !_714;
    int _1624 = _1622 ? 0 : 1;
    float _1626 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1610);
    float _1628 = _926 * 0.15915493667125701904296875;
    float _1630 = fma(_1062, _1620, _1062);
    float _1632 = fma(_1620, _1558, _1558);
    bool _1634 = !_706;
    int _1636 = _1634 ? 0 : 1;
    float _1638 = _1628 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = _1096 * _1096;
    float _1644 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1608);
    bool _1646 = !_1528;
    float _1648 = _1646 ? _132 : _1566;
    float _1650 = _758 + (-0.5);
    int _1652 = abs(_1624);
    float _1654 = _924 * 0.15915493667125701904296875;
    int _1656 = abs(_1636);
    float _1658 = fma(_1108, _1108, _1642);
    float _1660 = -_1568;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1664 = _1628 * 6.283185482025146484375;
    float _1666 = sin(_1664);
    float _1668 = float(_1656);
    float _1670 = fma(_1070, _1070, _1658);
    float _1672 = float(_1596);
    float _1674 = -_1572;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1096 + _1640;
    if (_730)
    {
        bool _1680 = _152 > 0.5;
        _1534 = _1680;
    }
    bool _1682 = _1534;
    float _1684 = _152 + (-0.5);
    float _1686 = sqrt(_1104);
    float _1688 = _1662 * _1662;
    float _1690 = _1668 * _1672;
    float _1692 = float(_1652);
    float _1694 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1632);
    float _1696 = fma(_1676, _1676, _1688);
    float _1698 = _1690 * (-2.0);
    float _1700 = float(_1618);
    float _1702 = rsqrt(_1104);
    float _1704 = _1108 + _1666;
    float _1706 = fma(_1698, _1556, _1556);
    float _1708 = fma(_1074, _1698, _1074);
    float _1710 = _1692 * _1700;
    if (_736)
    {
        bool _1712 = _948 > 0.5;
        _1536 = _1712;
    }
    bool _1714 = _1536;
    float _1716 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1706);
    float _1718 = _948 + (-0.5);
    float _1720 = rsqrt(_1066);
    float _1722 = -_1584;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = fma(_1648, _1708, _1716);
    float _1728 = _1710 * (-2.0);
    float _1730 = _720 + (-1.0);
    float _1732 = fma(_1724, _1724, _1696);
    float _1734 = _1704 * _1704;
    float _1736 = fma(_1728, _1560, _1560);
    float _1738 = rsqrt(_1086);
    float _1740 = _1100 * _1702;
    float _1742 = fma(_1058, _1728, _1058);
    float _1744 = fma(_1648, _1630, _1694);
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1736);
    float _1748 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1750 = fma(_1730, _1730, _1734);
    float _1752 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1754 = rsqrt(_1732);
    float _1756 = _1102 * _1720;
    float _1758 = _1726 * 0.15915493667125701904296875;
    float _1760 = _1686 * _1740;
    float _1762 = fma(_1648, _1742, _1746);
    float _1764 = fma(_1678, _1678, _1750);
    float _1766 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1760);
    float _1770 = _1130 * _1738;
    float _1772 = _1744 * 0.15915493667125701904296875;
    float _1774 = _1758 * 6.283185482025146484375;
    float _1776 = sin(_1774);
    float _1778 = _1766 * _1768;
    float _1780 = _1686 * _1770;
    float _1782 = _1686 * _1756;
    float _1784 = _1676 * _1754;
    float _1786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1780);
    float _1788 = _1724 * _1754;
    float _1790 = _1662 * _1754;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = _1784 * _1792;
    float _1796 = _1748 * _1786;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = _1788 * _1798;
    float _1802 = _1772 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1808 = -_1794;
    float _1810 = fma(_1788, _1806, _1808);
    float _1812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1782);
    float _1814 = _1762 * 0.15915493667125701904296875;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1818 = -_1800;
    float _1820 = fma(_1790, _1816, _1818);
    float _1822 = _1810 * _1810;
    float _1824 = _1752 * _1812;
    float _1826 = _1772 * 6.283185482025146484375;
    float _1828 = cos(_1826);
    float _1830 = rsqrt(_1764);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1834 = _1790 * _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = -_1834;
    float _1840 = fma(_1784, _1836, _1838);
    float _1842 = fma(_1820, _1820, _1822);
    float _1844 = _1776 * _1804;
    float _1846 = _1758 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = fma(_1840, _1840, _1842);
    float _1852 = _1814 * 6.283185482025146484375;
    float _1854 = cos(_1852);
    float _1856 = _1730 * _1830;
    float _1858 = _1704 * _1830;
    float _1860 = _1678 * _1830;
    float _1862 = _1776 * _1828;
    float _1864 = _1814 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = _1848 * _1828;
    float _1870 = _1848 * _1804;
    float _1872 = rsqrt(_1850);
    float _1874 = _1828 * _1854;
    float _1876 = _1854 * _1796;
    float _1878 = _1804 * _1854;
    float _1880 = _922 * 0.15915493667125701904296875;
    float _1882 = _1848 * _1876;
    float _1884 = _1776 * _1876;
    float _1886 = -_1796;
    float _1888 = _1866 * _1886;
    float _1890 = -_1870;
    float _1892 = fma(_1866, _1862, _1890);
    float _1894 = fma(_1866, _1868, _1844);
    float _1896 = -_1862;
    float _1898 = fma(_1866, _1870, _1896);
    float _1900 = fma(_1874, _1778, _1888);
    float _1902 = _1858 * _1858;
    float _1904 = fma(_1866, _1844, _1868);
    float _1906 = fma(_1894, _1778, _1882);
    float _1908 = _1810 * _1872;
    float _1910 = fma(_1892, _1778, _1884);
    float _1912 = fma(_1878, _1824, _1900);
    float _1914 = _1820 * _1872;
    float _1916 = fma(_1856, _1856, _1902);
    float _1918 = _1840 * _1872;
    float _1920 = _1788 * _1908;
    float _1922 = _1654 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = fma(_1860, _1860, _1916);
    float _1928 = fma(_1898, _1824, _1906);
    float _1930 = -_1920;
    float _1932 = fma(_1790, _1918, _1930);
    float _1934 = _1784 * _1918;
    float _1936 = _922 * (-0.15915493667125701904296875);
    float _1938 = _1790 * _1914;
    float _1940 = _1932 * _1928;
    float _1942 = rsqrt(_1670);
    float _1944 = -_1934;
    float _1946 = fma(_1788, _1914, _1944);
    float _1948 = fma(_1904, _1824, _1910);
    float _1950 = -_1938;
    float _1952 = fma(_1784, _1908, _1950);
    float _1954 = fma(_1914, _1912, _1940);
    float _1956 = _1946 * _1928;
    float _1958 = _1952 * _1928;
    float _1960 = rsqrt(_1926);
    float _1962 = fma(_1908, _1912, _1956);
    float _1964 = fma(_1784, _1948, _1954);
    float _1966 = fma(_1918, _1912, _1958);
    float _1968 = fma(_1790, _1948, _1962);
    float _1970 = _1572 + _1964;
    float _1972 = fma(_1788, _1948, _1966);
    float _1974 = _1936 * 6.283185482025146484375;
    float _1976 = cos(_1974);
    float _1978 = _1942 * _1924;
    float _1980 = _1568 + _1968;
    float _1982 = _1978 * 0.300000011920928955078125;
    float _1984 = _1936 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    float _1988 = _1856 * _1960;
    float _1990 = _1860 * _1960;
    float _1992 = fma(_1096, _1982, _1980);
    float _1994 = fma(_1108, _1982, _1970);
    float _1996 = -_1568;
    float _1998 = _1996 + _1992;
    float _2000 = -_1976;
    float _2002 = _2000 + 1.0;
    float _2004 = _1858 * _1960;
    float _2006 = _1880 * 6.283185482025146484375;
    float _2008 = sin(_2006);
    float _2010 = -_1572;
    float _2012 = _2010 + _1994;
    float _2014 = _1988 * _2002;
    float _2016 = _2004 * _2002;
    float _2018 = _1988 * _1986;
    float _2020 = _1990 * _1986;
    float _2022 = _1880 * 6.283185482025146484375;
    float _2024 = cos(_2022);
    float _2026 = _2004 * _1986;
    float _2028 = fma(_1990, _2016, _2018);
    float _2030 = fma(_2004, _2014, _2020);
    float _2032 = -_2020;
    float _2034 = fma(_2004, _2014, _2032);
    float _2036 = -_2018;
    float _2038 = fma(_1990, _2016, _2036);
    float _2040 = fma(_2004, _2016, _1976);
    float _2042 = _1584 + _1972;
    float _2044 = _1990 * _1990;
    float _2046 = _2034 * _1998;
    float _2048 = _2040 * _1998;
    float _2050 = fma(_1070, _1982, _2042);
    float _2052 = fma(_2002, _2044, _1976);
    float _2054 = fma(_1988, _2014, _1976);
    float _2056 = fma(_2030, _2012, _2048);
    float _2058 = -_1584;
    float _2060 = _2058 + _2050;
    float _2062 = -_2026;
    float _2064 = fma(_1990, _2014, _2062);
    float _2066 = _2028 * _1998;
    float _2068 = fma(_1990, _2014, _2026);
    float _2070 = fma(_2054, _2012, _2046);
    float _2072 = -_2024;
    float _2074 = _2072 + 1.0;
    float _2076 = fma(_2038, _2060, _2056);
    float _2078 = fma(_2064, _2012, _2066);
    float _2080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2082 = _1990 * _2008;
    float _2084 = _1988 * _2074;
    float _2086 = fma(_2068, _2060, _2070);
    float _2088 = _1568 + _2076;
    float _2090 = _1988 * _2008;
    float _2092 = -_2082;
    float _2094 = fma(_2004, _2084, _2092);
    float _2096 = _1572 + _2086;
    float _2098 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2100 = _2088 + _2098;
    float _2102 = fma(_1988, _2084, _2024);
    float _2104 = _2004 * _2074;
    float _2106 = fma(_2044, _2074, _2024);
    float _2108 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2110 = _2096 + _2108;
    float _2112 = _2094 * _2100;
    float _2114 = fma(_2052, _2060, _2078);
    float _2116 = _2004 * _2008;
    float _2118 = fma(_1990, _2104, _2090);
    float _2120 = fma(_2102, _2110, _2112);
    float _2122 = _1584 + _2114;
    float _2124 = -_2116;
    float _2126 = fma(_1990, _2084, _2124);
    float _2128 = _2118 * _2100;
    int _2130 = as_type<int>(_2044);
    int _2132 = as_type<int>(_2116);
    if (_730)
    {
        float _2134 = -_1552;
        float _2136 = _2134 + 1.0;
        _2130 = as_type<int>(_2136);
    }
    int _2138 = _2130;
    float _2140 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2142 = fma(_1990, _2084, _2116);
    float _2144 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2146 = _2122 + _2144;
    float _2148 = fma(_2126, _2110, _2128);
    float _2150 = fma(_2140, _834, -0.5);
    float _2152 = _2146;
    if (_730)
    {
        float _2154 = _1682 ? as_type<float>(_2138) : _1552;
        _1550 = _2154;
    }
    float _2156 = _1550;
    float _2158 = fma(_2142, _2146, _2120);
    float _2160 = fma(_2106, _2146, _2148);
    if (_736)
    {
        float _2162 = -_1552;
        float _2164 = _2162 + 1.0;
        _2132 = as_type<int>(_2164);
    }
    int _2166 = _2132;
    float _2168 = -_1434;
    float _2170 = fma(_1626, _2150, _2168);
    float _2172 = _2158 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2174 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2176 = -_1388;
    float _2178 = _2176 + 1.0;
    float _2180 = _2174;
    if (_736)
    {
        float _2182 = _1714 ? as_type<float>(_2166) : _1552;
        _1588 = _2182;
    }
    float _2184 = _1588;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2188 = _2172 + _2186;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2192 = _2174 + _2190;
    float _2194 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1542);
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2198 = _2188 * _2188;
    float _2200 = _2192 * _2192;
    float _2202 = fma(_1022, _1506, _2194);
    float _2204 = fma(_2004, _2104, _2024);
    float _2206 = -_1242;
    float _2208 = _2206 + 1.0;
    float _2210 = _2198 + _2200;
    float _2212 = fma(_2004, _2084, _2082);
    float _2214 = _2204 * _2100;
    float _2216 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1548);
    float _2218 = sqrt(_2210);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1554);
    float _2222 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    float _2224 = -_2090;
    float _2226 = fma(_1990, _2104, _2224);
    float _2228 = fma(_2212, _2110, _2214);
    float _2230 = fma(_1158, _1504, _2216);
    float _2232 = fma(_1160, _1504, _2220);
    float _2234 = fma(_1162, _1504, _2222);
    float _2236 = fma(_1206, _1484, _2202);
    float _2238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2240 = fma(_2226, _2146, _2228);
    float _2242 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2244 = fma(_1182, _1468, _2230);
    float _2246 = fma(_1106, _1468, _2232);
    float _2248 = fma(_1184, _1468, _2234);
    float _2250 = fma(_1260, _1478, _2236);
    bool _2252 = _2218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2256 = _2240 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2258 = fma(_2242, _2156, -0.5);
    float _2260 = fma(_1216, _1460, _2244);
    float _2262 = fma(_1180, _1460, _2246);
    float _2264 = fma(_1222, _1460, _2248);
    float _2266 = fma(_1334, _1462, _2250);
    float _2268 = fma(_1644, _2258, _1112);
    float _2270 = fma(_1218, _1404, _2260);
    float _2272 = fma(_1220, _1404, _2262);
    float _2274 = fma(_1224, _1404, _2264);
    float _2276 = fma(_1368, _1452, _2266);
    float _2278 = _2226;
    float _2280 = _2198;
    float _2282 = _2200;
    float _2284 = _2210;
    float _2286 = _2188;
    if (!_2252)
    {
        _2152 = _2172;
    }
    float _2288 = _2152;
    float _2290 = _2288;
    if (!_2252)
    {
        _2278 = _2256;
    }
    float _2292 = _2278;
    bool _2294 = !_2252;
    float _2296 = _2292;
    if (!_2294)
    {
        float _2298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2302 = _2218 + _2300;
        float _2304 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = rsqrt(_2210);
        float _2308 = _2302 * _2298;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2310 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2310 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = fma(_2314, _2304, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2322 = _2306 * _2320;
        float _2324 = _2318 + (-1.0);
        float _2326 = fma(_2188, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2328 = fma(_2192, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2330 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2334 = _2326 + _2332;
        float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2338 = _2328 + _2336;
        float _2340 = fma(_2256, _2318, _2330);
        float _2342 = _2334 * _2334;
        float _2344 = _2338 * _2338;
        _2296 = _2340;
        _2280 = _2342;
        _2282 = _2344;
        _2290 = _2326;
        _2180 = _2328;
        _2284 = _2306;
    }
    float _2346 = _2296;
    float _2348 = _2280;
    float _2350 = _2282;
    float _2352 = _2290;
    float _2354 = _2180;
    float _2356 = _2284;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2360 = _2346 + _2358;
    float _2362 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2270);
    float _2364 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2272);
    float _2366 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2274);
    float _2368 = fma(_2360, _2360, _2348);
    float _2370 = _806 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2372 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2374 = fma(_1226, _1376, _2276);
    float _2376 = _2368 + _2350;
    float _2378 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2380 = _2364 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = _2366 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2384 = _2370 * _2254;
    float _2386 = _2372 * _2238;
    float _2388 = sqrt(_2376);
    float _2390 = _2170 + 0.5;
    float _2392 = _2268 + 0.5;
    float _2394 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2374);
    out.m_69.x = _654;
    out.m_69.y = _658;
    out.m_69.z = _660;
    out.m_69.w = _656;
    out.m_71.x = _2392;
    out.m_71.y = _2390;
    out.m_71.z = _2386;
    out.m_71.w = _2384;
    out.m_73.x = _2394;
    out.m_73.y = _2396;
    out.m_73.z = _2398;
    bool _2402 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2404 = isnan(_2388);
    bool _2406 = _2402 || _2404;
    bool _2408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2410 = _2406 || _2408;
    out.m_75.x = _2400;
    float _2412 = _2360;
    float _2414 = _2356;
    if (!_2410)
    {
        _2412 = 1.0;
    }
    float _2416 = _2412;
    bool _2418 = !_2410;
    float _2420 = _2416;
    if (!_2418)
    {
        bool _2422 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2424 = isnan(_2388);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2434 = _2388 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2444 = 1.0 / _2438;
            float _2446 = _2434 * _2444;
            float _2448 = fma(_2446, _2442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2420 = _2448;
            _2450 = true;
        }
        else
        {
            bool _2452 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2454 = isnan(_2388);
            bool _2456 = _2452 || _2454;
            bool _2458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2460 = _2456 || _2458;
            if (!_2460)
            {
                float _2462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2464 = _2388 + _2462;
                float _2466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2468 = _2466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2472 = _2470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2474 = 1.0 / _2468;
                float _2476 = _2464 * _2474;
                float _2478 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2420 = _2478;
                _2450 = true;
            }
            else
            {
                _2420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2450 = false;
    float _2480 = _2420;
    float _2482 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2484 = _2346 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2488 = _2352 + _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2492 = _2354 + _2490;
    bool _2494 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2498 = _2494 || _2496;
    bool _2500 = isnan(0.5);
    bool _2502 = _2498 || _2500;
    float _2504 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2506 = fma(_2488, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2508 = fma(_2492, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2510 = _2504;
    float _2512 = _2506;
    float _2514 = _2508;
    if (!_2502)
    {
        float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2518 = _1568 + _2516;
        float _2520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2522 = _1572 + _2520;
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2526 = -_1572;
        float _2528 = _2526 + _2506;
        float _2530 = _2518 * _2518;
        float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2534 = _1584 + _2532;
        float _2536 = -_1568;
        float _2538 = _2536 + _2504;
        float _2540 = fma(_2522, _2522, _2530);
        float _2542 = fma(_2534, _2534, _2540);
        float _2544 = sqrt(_2542);
        float _2546 = precise::min(_2544, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2548 = _2546 * _2524;
        float _2550 = -_1584;
        float _2552 = _2550 + _2508;
        float _2554 = fma(_2528, _2548, _1572);
        float _2556 = fma(_2538, _2548, _1568);
        float _2558 = fma(_2552, _2548, _1584);
        _2510 = _2556;
        _2512 = _2554;
        _2514 = _2558;
    }
    float _2560 = _2510;
    float _2562 = _2512;
    float _2564 = _2514;
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2560 + _2566;
    float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2572 = _2562 + _2570;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2576 = _2564 + _2574;
    float _2578 = _2568 * _2568;
    float _2580 = fma(_2572, _2572, _2578);
    float _2582 = fma(_2576, _2576, _2580);
    float _2584 = rsqrt(_2582);
    float _2586 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2588 = _2572 * _2586;
    float _2590 = _2576 * _2586;
    float _2592 = _2588 * _2588;
    float _2594 = _2590 * _2590;
    float _2596 = _2592 + _2594;
    float _2598 = sqrt(_2596);
    bool _2600 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2604 = _2598 + _2602;
    float _2606 = _2584;
    float _2608 = _2596;
    float _2610 = _2604;
    float _2612 = _2568;
    if (_2600)
    {
        float _2614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2606 = _2614;
    }
    float _2616 = _2606;
    if (_2600)
    {
        float _2618 = rsqrt(_2596);
        _2608 = _2618;
    }
    float _2620 = _2608;
    float _2622 = _2620;
    if (_2600)
    {
        float _2624 = _2604 * _2616;
        _2610 = _2624;
    }
    float _2626 = _2610;
    if (_2600)
    {
        float _2628 = _2626 * 0.15915493667125701904296875;
        _1590 = _2628;
    }
    float _2630 = _1590;
    float _2632 = _2576;
    if (_2600)
    {
        float _2634 = _2630 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2642 = precise::max(0.0, _2640);
    float _2644 = _2616;
    float _2646 = _2642;
    if (_2600)
    {
        float _2648 = _2630 * 6.283185482025146484375;
        float _2650 = cos(_2648);
        _2644 = _2650;
    }
    float _2652 = _2644;
    float _2654 = -_2586;
    float _2656 = -_2642;
    float _2658 = fma(_2568, _2654, _2656);
    if (_2600)
    {
        float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2612 = _2660;
    }
    float _2662 = _2612;
    float _2664 = sqrt(_2582);
    float _2666 = _2662;
    float _2668 = _2638;
    if (_2600)
    {
        float _2670 = fma(_2638, _2662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2666 = _2670;
    }
    float _2672 = _2666;
    float _2674 = _2672;
    if (!_2600)
    {
        _2668 = _2588;
    }
    float _2676 = _2668;
    float _2678 = _2676;
    float _2680 = _2652;
    if (_2600)
    {
        float _2682 = _2652 + (-1.0);
        _2646 = _2682;
    }
    float _2684 = _2646;
    float _2686 = _2684;
    if (_2600)
    {
        float _2688 = _2620 * _2672;
        _2414 = _2688;
    }
    float _2690 = _2414;
    if (!_2600)
    {
        _2674 = _2658;
    }
    float _2692 = _2674;
    float _2694 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2696 = _2692;
    if (_2600)
    {
        float _2698 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2698;
    }
    float _2700 = _2286;
    if (_2600)
    {
        float _2702 = _2588 * _2690;
        _2678 = _2702;
    }
    float _2704 = _2678;
    if (!_2600)
    {
        _2686 = _2590;
    }
    float _2706 = _2686;
    float _2708 = _2706;
    if (_2600)
    {
        float _2710 = _2590 * _2690;
        _2708 = _2710;
    }
    float _2712 = _2708;
    if (!_2600)
    {
        _2622 = _2592;
    }
    float _2714 = _2622;
    float _2716 = _2714;
    if (_2600)
    {
        float _2718 = fma(_2658, _2652, _2700);
        _2696 = _2718;
    }
    float _2720 = _2696;
    if (_2600)
    {
        float _2722 = _2704 * _2704;
        _2716 = _2722;
    }
    float _2724 = _2716;
    if (!_2600)
    {
        _2680 = _2594;
    }
    float _2726 = _2680;
    float _2728 = _2726;
    if (_2600)
    {
        float _2730 = _2712 * _2712;
        _2728 = _2730;
    }
    float _2732 = _2728;
    float _2734 = fma(_2720, _2720, _2724);
    float _2736 = _2734 + _2732;
    float _2738 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2742 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2740);
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2750 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2738);
    float _2752 = rsqrt(_2736);
    float _2754 = -_2744;
    float _2756 = _2754 + 1.0;
    float _2758 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2760 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2750);
    float _2762 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2746);
    float _2764 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2766 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2758);
    float _2768 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2762);
    float _2770 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2694);
    float _2772 = abs(_2756);
    float _2774 = log2(_2772);
    float _2776 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2778 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2766);
    float _2780 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2782 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2770);
    float _2784 = _2752 * _2704;
    float _2786 = -_2776;
    float _2788 = fma(_2786, _2748, 1.0);
    float _2790 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2792 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2794 = _2752 * _2720;
    float _2796 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2798 = _2752 * _2712;
    float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2792);
    float _2802 = _2782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2804 = -_2796;
    float _2806 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2810 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2812 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = -_2798;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2818 = log2(_2788);
    float _2820 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2810);
    float _2822 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2824 = fma(_2816, -0.5, 0.5);
    float _2826 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2808);
    float _2828 = fma(_2816, 0.5, 0.5);
    float _2830 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2822);
    float _2832 = _2794 + 1.0;
    float _2834 = exp2(_2812);
    float _2836 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2826);
    float _2838 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2830);
    float _2840 = fma(_2828, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2842 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2836);
    float _2844 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2838);
    float _2846 = fma(_2828, _2840, -0.212114393711090087890625);
    float _2848 = 1.0 / _2820;
    float _2850 = _2818 * 0.693147182464599609375;
    float _2852 = fma(_2828, _2846, 1.570728778839111328125);
    float _2854 = sqrt(_2824);
    float _2856 = -_2794;
    float _2858 = fma(_2834, _2832, _2856);
    float _2860 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2862 = fma(_2858, 0.5, 0.5);
    float _2864 = _2842 * _2848;
    float _2866 = _2844 * _2848;
    float _2868 = fma(_2864, 0.5, 0.5);
    float _2870 = fma(_2866, -0.5, 0.5);
    float _2872 = _2854 * 0.636619746685028076171875;
    float3 _7368 = float3(_2868, _2870, _2860);
    float _2874 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7368, float3(0.0), isnan(_7368)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7368, float3(0.0), isnan(_7368)), level(0.0)).x;
    float _2876 = -_2852;
    float _2878 = fma(_2872, _2876, 1.0);
    float3 _7384 = float3(_2868, _2870, _2860);
    float4 _2881 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7384, float3(0.0), isnan(_7384)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7384, float3(0.0), isnan(_7384)), level(0.0)).xyzw;
    float _2883 = _2881.x;
    float _2885 = _2881.y;
    float _2887 = _2881.z;
    float _2889 = _2881.w;
    float2 _7401 = float2(_2878, _2862);
    float3 _2893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7401, float2(0.0), isnan(_7401)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7401, float2(0.0), isnan(_7401)), level(0.0)).xyz;
    float _2895 = _2893.x;
    float _2897 = _2893.y;
    float _2899 = _2893.z;
    float _2901 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2903 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2905 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2903);
    float _2907 = exp2(_2901);
    float _2909 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2905);
    float _2911 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2913 = _2911 + _2820;
    out.gl_Position.x = _2842;
    out.gl_Position.y = _2844;
    out.gl_Position.z = _2911;
    out.gl_Position.w = _2820;
    float _2915 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2917 = _2913 * 0.5;
    float _2919 = -_2907;
    float _2921 = _2919 + 1.0;
    out.m_47.x = _2915;
    float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2917;
    out.m_77.w = _2820;
    float _2925 = -_2923;
    float _2927 = _2925 + 1.0;
    float _2929 = _2923 * _2874;
    float _2931 = _2889 * _2929;
    float _2933 = _2899 * _2929;
    float _2935 = fma(_2895, _2931, _2883);
    float _2937 = fma(_2897, _2931, _2885);
    float _2939 = _2889 * _2927;
    float _2941 = fma(_2889, _2933, _2887);
    out.m_79.x = _2935;
    out.m_79.y = _2937;
    out.m_79.z = _2941;
    out.m_79.w = _2939;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2450 = false;
    bool _688 = false;
    bool _380 = false;
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
        float _2998 = as_type<float>(_114);
        out.gl_Position.z = _2998;
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
        float _3067 = as_type<float>(_150);
        out.gl_Position.z = _3067;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _156 * _154;
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = _174 * 6.283185482025146484375;
    float _184 = floor(_174);
    float _186 = _182 * 0.15915493667125701904296875;
    float _188 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = 0.0;
    float _192 = _188;
    if (!_166)
    {
        float _194 = _188 * _188;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = _198;
    if (!_166)
    {
        float _206 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = -_184;
    float _212 = _174 + _210;
    bool _214 = !_166;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _188 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _188);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_166;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _188 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _192 = _270;
    }
    float _272 = _192;
    float _274 = in.m_53.w;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = in.m_44.x;
    float _288 = in.m_44.y;
    float _290 = in.m_44.z;
    float _292 = -_212;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _296 = _212 < 0.5;
    float _298 = float(_296);
    bool _300 = !_280;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_202, 0.5, 0.5);
    bool _306 = !_170;
    int _308 = _306 ? 0 : 1;
    float _310 = -_298;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_302);
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _176, _276);
    int _322 = abs(_308);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_284;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_272, _178, _324);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_314);
    float _340 = float(_322);
    float _342 = abs(_294);
    float _344 = _338 * _342;
    float _346 = fma(_272, _180, _336);
    float _348 = fma(_330, _274, _288);
    float _350 = float(_334);
    float _352 = fma(_340, _318, _344);
    float _354 = fma(_320, _274, _286);
    float _356 = fma(_346, _274, _290);
    float _358 = abs(_312);
    float _360 = fma(_350, _358, _352);
    bool _362 = !_332;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_98);
        float _384 = 1.0 / _382;
        float _386 = _132 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _388 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = _388 + _394;
    bool _398 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _400 = isnan(_388);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _428 = _388 + _426;
    float _430 = 1.0 / _412;
    bool _432 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_388);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = 1.0 / _424;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _448 = 1.0 / _420;
    float _450 = _392 * _430;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _454 = _388 + _452;
    float _456 = -_408;
    float _458 = _456 + 1.0;
    float _460 = 1.0 / _416;
    float _462 = _454 * _444;
    bool _464 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _466 = isnan(_388);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _474 * _458;
    float _478 = _396 * _448;
    bool _480 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_388);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_474;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _500;
    float _504 = _490 * _494;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = _428 * _460;
    bool _512 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_388);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _524;
    float _528 = fma(_498, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _530 = fma(_502, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = -_522;
    float _538 = _536 + 1.0;
    float _540 = fma(_526, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _542 = _522 * _508;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _552 = _442 * _538;
    float _554 = fma(_534, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_546, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = _528 * _552;
    float _562 = _530 * _552;
    float _564 = _540 * _552;
    float _566 = -_442;
    float _568 = _566 + 1.0;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _592 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _564);
    float _594 = fma(_578, _478, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_582, _478, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _598 = fma(_586, _478, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_554, _542, _588);
    float _602 = fma(_556, _542, _590);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _616 = fma(_558, _542, _592);
    float _618 = fma(_606, _462, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _620 = fma(_610, _462, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _622 = fma(_594, _504, _600);
    float _624 = fma(_596, _504, _602);
    float _626 = fma(_614, _462, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_598, _504, _616);
    float _630 = fma(_618, _476, _622);
    float _632 = fma(_620, _476, _624);
    float _634 = fma(_626, _476, _628);
    float _636 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].x, _630);
    float _638 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].y, _632);
    float _640 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].z, _634);
    float _642 = _636 * _570;
    float _644 = _638 * _572;
    float _646 = _640 * _574;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _662 = !_446;
    float _684;
    float _686;
    if (!_662)
    {
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _666 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _668 = float(_98);
        float _670 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _672 = 1.0 / _668;
        float _674 = _670 * _664;
        float _676 = floor(_674);
        float _678 = _132 * _672;
        float _680 = -_676;
        float _682 = _674 + _680;
        _684 = _682;
        _686 = _678;
        _688 = true;
    }
    else
    {
        float _690 = float(_98);
        float _692 = 1.0 / _690;
        float _694 = _132 * _692;
        _684 = _694;
        _686 = _694;
    }
    _688 = false;
    float _696 = _684;
    float _698 = _686;
    float _700 = in.m_55.y;
    float _702 = _360 * _642;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _714 = _712 != 0;
    float _716 = _360 * _644;
    float _718 = in.m_51.w;
    float _720 = _152 * 2.0;
    float _722 = in.m_57.x;
    float _724 = in.m_57.y;
    float _726 = in.m_57.z;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _730 = _728 != 0;
    float _732 = floor(_720);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _736 = _734 != 0;
    float _738 = in.m_59.x;
    float _740 = in.m_59.y;
    float _742 = in.m_59.z;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _746 = _744 != 0;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = in.m_61.x;
    float _752 = in.m_61.y;
    float _754 = in.m_61.z;
    float _756 = _360 * _646;
    float _758 = in.m_51.y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _768 = -_700;
    float _770 = _768 + 1.0;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _774 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _776 = _718 > 0.5;
    float _778 = 1.0 / _766;
    float _780 = _718 * 6.283185482025146484375;
    float _782 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    int _784 = _776 ? as_type<int>(_770) : as_type<int>(_700);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _696 + _786;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _792 = _790 != 0;
    float _794 = _348 * _724;
    float _796 = _348 * _740;
    float _798 = 1.0 / _762;
    float _800 = fma(_354, _722, _794);
    float _802 = _348 * _752;
    float _804 = fma(_354, _738, _796);
    float _806 = _746 ? as_type<float>(_784) : _700;
    float _808 = fma(_354, _750, _802);
    float _810 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _812;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _820 = _758 > 0.5;
    float _822 = in.m_63.x;
    float _824 = -_748;
    float _826 = fma(_810, 2.0, _824);
    float _828 = 1.0 / _814;
    float _830 = _700;
    if (_792)
    {
        float _832 = _820 ? _770 : _700;
        _830 = _832;
    }
    float _834 = _830;
    float _836 = _758 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _838;
    float _842 = fma(_836, -2.0, _772);
    bool _844 = _732 > 0.0;
    float _846 = 1.0 / _818;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _856 = _732 >= 0.0;
    bool _858 = isnan(_732);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _872 = _696 + _870;
    float _874 = _758 * 2.0;
    float _876 = 1.0 / _850;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _884 = _696 + _882;
    float _886 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _888 = _884 * _828;
    float _890 = 1.0 / _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _896 = _788 * _846;
    float _898 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _886);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _902 = _698 + _900;
    float _904 = 1.0 / _894;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _910 = -_822;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[191].x, _132);
    float _914 = -_718;
    float _916 = fma(_914, 0.0350000001490116119384765625, 0.070000000298023223876953125);
    float _918 = fma(_356, _742, _804);
    float _920 = _872 * _876;
    float _922 = _912 * _916;
    float _924 = fma(_912, 0.100000001490116119384765625, _780);
    float _926 = fma(_912, 0.00999999977648258209228515625, _780);
    float _928 = 1.0 / _854;
    float _930 = fma(_356, _726, _800);
    float _932 = fma(_356, _754, _808);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _940 = _696 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _942;
    float _946 = 1.0 / _908;
    float _948 = in.m_51.z;
    float _950 = _940 * _778;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _964;
    float _968 = 1.0 / _936;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _972 = _696 + _970;
    float _974 = _962 * _904;
    int _976 = _864 ? 0 : 1;
    float _978 = _958 * _890;
    float _980 = _972 * _798;
    float _982 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _984 = 1.0 / _954;
    bool _986 = _758 >= 0.949999988079071044921875;
    bool _988 = isnan(_758);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.949999988079071044921875);
    bool _994 = _990 || _992;
    float _996 = _966 * _946;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1002 = ~_976;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _1012 = _1006;
    float _1014 = 1.0;
    if (!_844)
    {
        int _1016 = ~_976;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    float _1022 = fma(_974, _902, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1024 = 1.0 / _1000;
    float _1026 = _948 * 2.0;
    float _1028 = _840 * _968;
    bool _1030 = !_710;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _152 + _948;
    float _1036 = _1010 * _928;
    float _1038 = _868 * _984;
    float _1040 = in.m_65.x;
    float _1042 = in.m_65.y;
    float _1044 = in.m_65.z;
    float _1046 = floor(_1026);
    float _1048 = _758 + _948;
    float _1050 = _1034 + (-1.0);
    float _1052 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _1054 = _1048 + (-1.0);
    float _1056 = _944 * _1024;
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = floor(_874);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1064 = _152 + _758;
    float _1066 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1052);
    float _1068 = _1064 + (-1.0);
    float _1070 = fma(_718, 2.0, -1.0);
    bool _1072 = _1046 > 0.0;
    float _1074 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1076 = _1046 >= 0.0;
    bool _1078 = isnan(_1046);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _898);
    bool _1088 = !_994;
    float _1090 = _1088 ? 1.0 : 1.5;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1092;
    float _1096 = _1026 + (-1.0);
    int _1098 = _1084 ? 0 : 1;
    float _1100 = _1090 * _1040;
    float _1102 = _1090 * _1044;
    float _1104 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _1106 = fma(_1094, _888, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1108 = _874 + (-1.0);
    float _1110 = -_132;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[76].x, _826);
    bool _1114 = _1060 > 0.0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    bool _1120 = _1060 >= 0.0;
    bool _1122 = isnan(_1060);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1090 * _1042;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1152 = fma(_1134, _980, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1154 = fma(_1118, _980, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1156 = fma(_1138, _980, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1158 = fma(_1142, _950, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1160 = fma(_1146, _950, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1162 = fma(_1150, _950, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1176;
    float _1180 = fma(_1166, _896, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1182 = fma(_1170, _888, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1184 = fma(_1178, _888, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1186 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1188 = log2(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1192 = _698 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1206 = fma(_996, _1192, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1214 = _698 + _1212;
    float _1216 = fma(_1174, _896, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1218 = fma(_1196, _920, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1220 = fma(_1200, _920, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1222 = fma(_1204, _896, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1224 = fma(_1210, _920, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1226 = fma(_1056, _1214, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1230 = _698 + _1228;
    bool _1232 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1234 = isnan(_696);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1246 = _698 + _1244;
    bool _1248 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1250 = isnan(_696);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = fma(_1036, _1230, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1262 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1264 = isnan(_696);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = _132 * _1188;
    bool _1276 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1278 = isnan(_696);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = fma(_978, _1246, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1290 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1292 = isnan(_696);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1304 = _698 + _1302;
    bool _1306 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1308 = isnan(_696);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1320 = _698 + _1318;
    bool _1322 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1324 = isnan(_698);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1330 = _1326 || _1328;
    float _1332 = float(_1330);
    float _1334 = fma(_1028, _1304, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1336 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1338 = isnan(_698);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1316;
    float _1350 = _1348 + 1.0;
    bool _1352 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1354 = isnan(_698);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1332;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_1038, _1320, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1370 = -_1346;
    float _1372 = _1370 + 1.0;
    float _1374 = exp2(_1274);
    float _1376 = _1346 * _1366;
    bool _1378 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1380 = isnan(_698);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = in.m_55.x;
    bool _1392 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1394 = isnan(_698);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1300 * _1350;
    bool _1406 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1408 = isnan(_698);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1362;
    float _1420 = _1418 + 1.0;
    bool _1422 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1424 = isnan(_698);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _842);
    bool _1436 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1438 = isnan(_698);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    float _1448 = -_1300;
    float _1450 = _1448 + 1.0;
    float _1452 = _1362 * _1372;
    float _1454 = -_1286;
    float _1456 = _1454 + 1.0;
    int _1458 = _1128 ? 0 : 1;
    float _1460 = _1286 * _1450;
    float _1462 = _1446 * _1420;
    float _1464 = -_1446;
    float _1466 = _1464 + 1.0;
    float _1468 = _1272 * _1456;
    float _1470 = -_1432;
    float _1472 = _1470 + 1.0;
    float _1474 = -_1272;
    float _1476 = _1474 + 1.0;
    float _1478 = _1432 * _1466;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1482 = 1.0 + _1480;
    float _1484 = _1416 * _1472;
    float _1486 = -_1416;
    float _1488 = _1486 + 1.0;
    float _1490 = -_1374;
    float _1492 = _1490 + 1.0;
    bool _1494 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1502 = _1498 || _1500;
    float _1504 = _1258 * _1476;
    float _1506 = _1402 * _1488;
    float _1508 = -_1402;
    float _1510 = _1508 + 1.0;
    float _1512 = 1.0 / _1482;
    float _1514 = _1502 ? _1492 : 0.0;
    float _1516 = -_1258;
    float _1518 = _1516 + 1.0;
    bool _1520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1522 = isnan(1.0);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1528 = _1524 || _1526;
    float _1530 = _1388 * _1510;
    float _1532 = _1518;
    bool _1534 = _1072;
    bool _1536 = _1114;
    if (!_730)
    {
        _1014 = _1390;
    }
    float _1538 = _1014;
    float _1540 = _1242 * _1518;
    float _1542 = _1288 * _1530;
    float _1544 = _1538;
    if (!_730)
    {
        _1532 = _1538;
    }
    float _1546 = _1532;
    float _1548 = _1152 * _1540;
    float _1550 = _1546;
    if (_730)
    {
        _1544 = _1390;
    }
    float _1552 = _1544;
    float _1554 = _1154 * _1540;
    float _1556 = in.m_67.x;
    float _1558 = in.m_67.y;
    float _1560 = in.m_67.z;
    float _1562 = _1156 * _1540;
    int _1564 = abs(_1032);
    float _1566 = _1514 * _1512;
    float _1568 = _918 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1570 = float(_1564);
    float _1572 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1574 = float(_1020);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1578 = ~_1098;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    float _1584 = _932 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1586 = _1582;
    float _1588 = _1552;
    float _1590 = _1572;
    if (!_1072)
    {
        int _1592 = ~_1098;
        int _1594 = _1592 + 1;
        _1586 = _1594;
    }
    int _1596 = _1586;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1600 = _1570 * _1574;
    int _1602 = ~_1458;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1576);
    float _1610 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1598);
    int _1612 = _1606;
    if (!_1114)
    {
        int _1614 = ~_1458;
        int _1616 = _1614 + 1;
        _1612 = _1616;
    }
    int _1618 = _1612;
    float _1620 = _1600 * (-2.0);
    bool _1622 = !_714;
    int _1624 = _1622 ? 0 : 1;
    float _1626 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1610);
    float _1628 = _926 * 0.15915493667125701904296875;
    float _1630 = fma(_1062, _1620, _1062);
    float _1632 = fma(_1620, _1558, _1558);
    bool _1634 = !_706;
    int _1636 = _1634 ? 0 : 1;
    float _1638 = _1628 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = _1096 * _1096;
    float _1644 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1608);
    bool _1646 = !_1528;
    float _1648 = _1646 ? _132 : _1566;
    float _1650 = _758 + (-0.5);
    int _1652 = abs(_1624);
    float _1654 = _924 * 0.15915493667125701904296875;
    int _1656 = abs(_1636);
    float _1658 = fma(_1108, _1108, _1642);
    float _1660 = -_1568;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1664 = _1628 * 6.283185482025146484375;
    float _1666 = sin(_1664);
    float _1668 = float(_1656);
    float _1670 = fma(_1070, _1070, _1658);
    float _1672 = float(_1596);
    float _1674 = -_1572;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1096 + _1640;
    if (_730)
    {
        bool _1680 = _152 > 0.5;
        _1534 = _1680;
    }
    bool _1682 = _1534;
    float _1684 = _152 + (-0.5);
    float _1686 = sqrt(_1104);
    float _1688 = _1662 * _1662;
    float _1690 = _1668 * _1672;
    float _1692 = float(_1652);
    float _1694 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1632);
    float _1696 = fma(_1676, _1676, _1688);
    float _1698 = _1690 * (-2.0);
    float _1700 = float(_1618);
    float _1702 = rsqrt(_1104);
    float _1704 = _1108 + _1666;
    float _1706 = fma(_1698, _1556, _1556);
    float _1708 = fma(_1074, _1698, _1074);
    float _1710 = _1692 * _1700;
    if (_736)
    {
        bool _1712 = _948 > 0.5;
        _1536 = _1712;
    }
    bool _1714 = _1536;
    float _1716 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1706);
    float _1718 = _948 + (-0.5);
    float _1720 = rsqrt(_1066);
    float _1722 = -_1584;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = fma(_1648, _1708, _1716);
    float _1728 = _1710 * (-2.0);
    float _1730 = _720 + (-1.0);
    float _1732 = fma(_1724, _1724, _1696);
    float _1734 = _1704 * _1704;
    float _1736 = fma(_1728, _1560, _1560);
    float _1738 = rsqrt(_1086);
    float _1740 = _1100 * _1702;
    float _1742 = fma(_1058, _1728, _1058);
    float _1744 = fma(_1648, _1630, _1694);
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1736);
    float _1748 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1750 = fma(_1730, _1730, _1734);
    float _1752 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1754 = rsqrt(_1732);
    float _1756 = _1102 * _1720;
    float _1758 = _1726 * 0.15915493667125701904296875;
    float _1760 = _1686 * _1740;
    float _1762 = fma(_1648, _1742, _1746);
    float _1764 = fma(_1678, _1678, _1750);
    float _1766 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1760);
    float _1770 = _1130 * _1738;
    float _1772 = _1744 * 0.15915493667125701904296875;
    float _1774 = _1758 * 6.283185482025146484375;
    float _1776 = sin(_1774);
    float _1778 = _1766 * _1768;
    float _1780 = _1686 * _1770;
    float _1782 = _1686 * _1756;
    float _1784 = _1676 * _1754;
    float _1786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1780);
    float _1788 = _1724 * _1754;
    float _1790 = _1662 * _1754;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = _1784 * _1792;
    float _1796 = _1748 * _1786;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = _1788 * _1798;
    float _1802 = _1772 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1808 = -_1794;
    float _1810 = fma(_1788, _1806, _1808);
    float _1812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1782);
    float _1814 = _1762 * 0.15915493667125701904296875;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1818 = -_1800;
    float _1820 = fma(_1790, _1816, _1818);
    float _1822 = _1810 * _1810;
    float _1824 = _1752 * _1812;
    float _1826 = _1772 * 6.283185482025146484375;
    float _1828 = cos(_1826);
    float _1830 = rsqrt(_1764);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1834 = _1790 * _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = -_1834;
    float _1840 = fma(_1784, _1836, _1838);
    float _1842 = fma(_1820, _1820, _1822);
    float _1844 = _1776 * _1804;
    float _1846 = _1758 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = fma(_1840, _1840, _1842);
    float _1852 = _1814 * 6.283185482025146484375;
    float _1854 = cos(_1852);
    float _1856 = _1730 * _1830;
    float _1858 = _1704 * _1830;
    float _1860 = _1678 * _1830;
    float _1862 = _1776 * _1828;
    float _1864 = _1814 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = _1848 * _1828;
    float _1870 = _1848 * _1804;
    float _1872 = rsqrt(_1850);
    float _1874 = _1828 * _1854;
    float _1876 = _1854 * _1796;
    float _1878 = _1804 * _1854;
    float _1880 = _922 * 0.15915493667125701904296875;
    float _1882 = _1848 * _1876;
    float _1884 = _1776 * _1876;
    float _1886 = -_1796;
    float _1888 = _1866 * _1886;
    float _1890 = -_1870;
    float _1892 = fma(_1866, _1862, _1890);
    float _1894 = fma(_1866, _1868, _1844);
    float _1896 = -_1862;
    float _1898 = fma(_1866, _1870, _1896);
    float _1900 = fma(_1874, _1778, _1888);
    float _1902 = _1858 * _1858;
    float _1904 = fma(_1866, _1844, _1868);
    float _1906 = fma(_1894, _1778, _1882);
    float _1908 = _1810 * _1872;
    float _1910 = fma(_1892, _1778, _1884);
    float _1912 = fma(_1878, _1824, _1900);
    float _1914 = _1820 * _1872;
    float _1916 = fma(_1856, _1856, _1902);
    float _1918 = _1840 * _1872;
    float _1920 = _1788 * _1908;
    float _1922 = _1654 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = fma(_1860, _1860, _1916);
    float _1928 = fma(_1898, _1824, _1906);
    float _1930 = -_1920;
    float _1932 = fma(_1790, _1918, _1930);
    float _1934 = _1784 * _1918;
    float _1936 = _922 * (-0.15915493667125701904296875);
    float _1938 = _1790 * _1914;
    float _1940 = _1932 * _1928;
    float _1942 = rsqrt(_1670);
    float _1944 = -_1934;
    float _1946 = fma(_1788, _1914, _1944);
    float _1948 = fma(_1904, _1824, _1910);
    float _1950 = -_1938;
    float _1952 = fma(_1784, _1908, _1950);
    float _1954 = fma(_1914, _1912, _1940);
    float _1956 = _1946 * _1928;
    float _1958 = _1952 * _1928;
    float _1960 = rsqrt(_1926);
    float _1962 = fma(_1908, _1912, _1956);
    float _1964 = fma(_1784, _1948, _1954);
    float _1966 = fma(_1918, _1912, _1958);
    float _1968 = fma(_1790, _1948, _1962);
    float _1970 = _1572 + _1964;
    float _1972 = fma(_1788, _1948, _1966);
    float _1974 = _1936 * 6.283185482025146484375;
    float _1976 = cos(_1974);
    float _1978 = _1942 * _1924;
    float _1980 = _1568 + _1968;
    float _1982 = _1978 * 0.300000011920928955078125;
    float _1984 = _1936 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    float _1988 = _1856 * _1960;
    float _1990 = _1860 * _1960;
    float _1992 = fma(_1096, _1982, _1980);
    float _1994 = fma(_1108, _1982, _1970);
    float _1996 = -_1568;
    float _1998 = _1996 + _1992;
    float _2000 = -_1976;
    float _2002 = _2000 + 1.0;
    float _2004 = _1858 * _1960;
    float _2006 = _1880 * 6.283185482025146484375;
    float _2008 = sin(_2006);
    float _2010 = -_1572;
    float _2012 = _2010 + _1994;
    float _2014 = _1988 * _2002;
    float _2016 = _2004 * _2002;
    float _2018 = _1988 * _1986;
    float _2020 = _1990 * _1986;
    float _2022 = _1880 * 6.283185482025146484375;
    float _2024 = cos(_2022);
    float _2026 = _2004 * _1986;
    float _2028 = fma(_1990, _2016, _2018);
    float _2030 = fma(_2004, _2014, _2020);
    float _2032 = -_2020;
    float _2034 = fma(_2004, _2014, _2032);
    float _2036 = -_2018;
    float _2038 = fma(_1990, _2016, _2036);
    float _2040 = fma(_2004, _2016, _1976);
    float _2042 = _1584 + _1972;
    float _2044 = _1990 * _1990;
    float _2046 = _2034 * _1998;
    float _2048 = _2040 * _1998;
    float _2050 = fma(_1070, _1982, _2042);
    float _2052 = fma(_2002, _2044, _1976);
    float _2054 = fma(_1988, _2014, _1976);
    float _2056 = fma(_2030, _2012, _2048);
    float _2058 = -_1584;
    float _2060 = _2058 + _2050;
    float _2062 = -_2026;
    float _2064 = fma(_1990, _2014, _2062);
    float _2066 = _2028 * _1998;
    float _2068 = fma(_1990, _2014, _2026);
    float _2070 = fma(_2054, _2012, _2046);
    float _2072 = -_2024;
    float _2074 = _2072 + 1.0;
    float _2076 = fma(_2038, _2060, _2056);
    float _2078 = fma(_2064, _2012, _2066);
    float _2080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2082 = _1990 * _2008;
    float _2084 = _1988 * _2074;
    float _2086 = fma(_2068, _2060, _2070);
    float _2088 = _1568 + _2076;
    float _2090 = _1988 * _2008;
    float _2092 = -_2082;
    float _2094 = fma(_2004, _2084, _2092);
    float _2096 = _1572 + _2086;
    float _2098 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2100 = _2088 + _2098;
    float _2102 = fma(_1988, _2084, _2024);
    float _2104 = _2004 * _2074;
    float _2106 = fma(_2044, _2074, _2024);
    float _2108 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2110 = _2096 + _2108;
    float _2112 = _2094 * _2100;
    float _2114 = fma(_2052, _2060, _2078);
    float _2116 = _2004 * _2008;
    float _2118 = fma(_1990, _2104, _2090);
    float _2120 = fma(_2102, _2110, _2112);
    float _2122 = _1584 + _2114;
    float _2124 = -_2116;
    float _2126 = fma(_1990, _2084, _2124);
    float _2128 = _2118 * _2100;
    int _2130 = as_type<int>(_2044);
    int _2132 = as_type<int>(_2116);
    if (_730)
    {
        float _2134 = -_1552;
        float _2136 = _2134 + 1.0;
        _2130 = as_type<int>(_2136);
    }
    int _2138 = _2130;
    float _2140 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2142 = fma(_1990, _2084, _2116);
    float _2144 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2146 = _2122 + _2144;
    float _2148 = fma(_2126, _2110, _2128);
    float _2150 = fma(_2140, _834, -0.5);
    float _2152 = _2146;
    if (_730)
    {
        float _2154 = _1682 ? as_type<float>(_2138) : _1552;
        _1550 = _2154;
    }
    float _2156 = _1550;
    float _2158 = fma(_2142, _2146, _2120);
    float _2160 = fma(_2106, _2146, _2148);
    if (_736)
    {
        float _2162 = -_1552;
        float _2164 = _2162 + 1.0;
        _2132 = as_type<int>(_2164);
    }
    int _2166 = _2132;
    float _2168 = -_1434;
    float _2170 = fma(_1626, _2150, _2168);
    float _2172 = _2158 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2174 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2176 = -_1388;
    float _2178 = _2176 + 1.0;
    float _2180 = _2174;
    if (_736)
    {
        float _2182 = _1714 ? as_type<float>(_2166) : _1552;
        _1588 = _2182;
    }
    float _2184 = _1588;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2188 = _2172 + _2186;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2192 = _2174 + _2190;
    float _2194 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1542);
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2198 = _2188 * _2188;
    float _2200 = _2192 * _2192;
    float _2202 = fma(_1022, _1506, _2194);
    float _2204 = fma(_2004, _2104, _2024);
    float _2206 = -_1242;
    float _2208 = _2206 + 1.0;
    float _2210 = _2198 + _2200;
    float _2212 = fma(_2004, _2084, _2082);
    float _2214 = _2204 * _2100;
    float _2216 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1548);
    float _2218 = sqrt(_2210);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1554);
    float _2222 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    float _2224 = -_2090;
    float _2226 = fma(_1990, _2104, _2224);
    float _2228 = fma(_2212, _2110, _2214);
    float _2230 = fma(_1158, _1504, _2216);
    float _2232 = fma(_1160, _1504, _2220);
    float _2234 = fma(_1162, _1504, _2222);
    float _2236 = fma(_1206, _1484, _2202);
    float _2238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2240 = fma(_2226, _2146, _2228);
    float _2242 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2244 = fma(_1182, _1468, _2230);
    float _2246 = fma(_1106, _1468, _2232);
    float _2248 = fma(_1184, _1468, _2234);
    float _2250 = fma(_1260, _1478, _2236);
    bool _2252 = _2218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2256 = _2240 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2258 = fma(_2242, _2156, -0.5);
    float _2260 = fma(_1216, _1460, _2244);
    float _2262 = fma(_1180, _1460, _2246);
    float _2264 = fma(_1222, _1460, _2248);
    float _2266 = fma(_1334, _1462, _2250);
    float _2268 = fma(_1644, _2258, _1112);
    float _2270 = fma(_1218, _1404, _2260);
    float _2272 = fma(_1220, _1404, _2262);
    float _2274 = fma(_1224, _1404, _2264);
    float _2276 = fma(_1368, _1452, _2266);
    float _2278 = _2226;
    float _2280 = _2198;
    float _2282 = _2200;
    float _2284 = _2210;
    float _2286 = _2188;
    if (!_2252)
    {
        _2152 = _2172;
    }
    float _2288 = _2152;
    float _2290 = _2288;
    if (!_2252)
    {
        _2278 = _2256;
    }
    float _2292 = _2278;
    bool _2294 = !_2252;
    float _2296 = _2292;
    if (!_2294)
    {
        float _2298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2302 = _2218 + _2300;
        float _2304 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = rsqrt(_2210);
        float _2308 = _2302 * _2298;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2310 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2310 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = fma(_2314, _2304, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2322 = _2306 * _2320;
        float _2324 = _2318 + (-1.0);
        float _2326 = fma(_2188, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2328 = fma(_2192, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2330 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2334 = _2326 + _2332;
        float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2338 = _2328 + _2336;
        float _2340 = fma(_2256, _2318, _2330);
        float _2342 = _2334 * _2334;
        float _2344 = _2338 * _2338;
        _2296 = _2340;
        _2280 = _2342;
        _2282 = _2344;
        _2290 = _2326;
        _2180 = _2328;
        _2284 = _2306;
    }
    float _2346 = _2296;
    float _2348 = _2280;
    float _2350 = _2282;
    float _2352 = _2290;
    float _2354 = _2180;
    float _2356 = _2284;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2360 = _2346 + _2358;
    float _2362 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2270);
    float _2364 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2272);
    float _2366 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2274);
    float _2368 = fma(_2360, _2360, _2348);
    float _2370 = _806 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2372 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2374 = fma(_1226, _1376, _2276);
    float _2376 = _2368 + _2350;
    float _2378 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2380 = _2364 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = _2366 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2384 = _2370 * _2254;
    float _2386 = _2372 * _2238;
    float _2388 = sqrt(_2376);
    float _2390 = _2170 + 0.5;
    float _2392 = _2268 + 0.5;
    float _2394 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2374);
    out.m_69.x = _654;
    out.m_69.y = _658;
    out.m_69.z = _660;
    out.m_69.w = _656;
    out.m_71.x = _2392;
    out.m_71.y = _2390;
    out.m_71.z = _2386;
    out.m_71.w = _2384;
    out.m_73.x = _2394;
    out.m_73.y = _2396;
    out.m_73.z = _2398;
    bool _2402 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2404 = isnan(_2388);
    bool _2406 = _2402 || _2404;
    bool _2408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2410 = _2406 || _2408;
    out.m_75.x = _2400;
    float _2412 = _2360;
    float _2414 = _2356;
    if (!_2410)
    {
        _2412 = 1.0;
    }
    float _2416 = _2412;
    bool _2418 = !_2410;
    float _2420 = _2416;
    if (!_2418)
    {
        bool _2422 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2424 = isnan(_2388);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2434 = _2388 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2444 = 1.0 / _2438;
            float _2446 = _2434 * _2444;
            float _2448 = fma(_2446, _2442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2420 = _2448;
            _2450 = true;
        }
        else
        {
            bool _2452 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2454 = isnan(_2388);
            bool _2456 = _2452 || _2454;
            bool _2458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2460 = _2456 || _2458;
            if (!_2460)
            {
                float _2462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2464 = _2388 + _2462;
                float _2466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2468 = _2466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2472 = _2470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2474 = 1.0 / _2468;
                float _2476 = _2464 * _2474;
                float _2478 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2420 = _2478;
                _2450 = true;
            }
            else
            {
                _2420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2450 = false;
    float _2480 = _2420;
    float _2482 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2484 = _2346 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2488 = _2352 + _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2492 = _2354 + _2490;
    bool _2494 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2498 = _2494 || _2496;
    bool _2500 = isnan(0.5);
    bool _2502 = _2498 || _2500;
    float _2504 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2506 = fma(_2488, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2508 = fma(_2492, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2510 = _2504;
    float _2512 = _2506;
    float _2514 = _2508;
    if (!_2502)
    {
        float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2518 = _1568 + _2516;
        float _2520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2522 = _1572 + _2520;
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2526 = -_1572;
        float _2528 = _2526 + _2506;
        float _2530 = _2518 * _2518;
        float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2534 = _1584 + _2532;
        float _2536 = -_1568;
        float _2538 = _2536 + _2504;
        float _2540 = fma(_2522, _2522, _2530);
        float _2542 = fma(_2534, _2534, _2540);
        float _2544 = sqrt(_2542);
        float _2546 = precise::min(_2544, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2548 = _2546 * _2524;
        float _2550 = -_1584;
        float _2552 = _2550 + _2508;
        float _2554 = fma(_2528, _2548, _1572);
        float _2556 = fma(_2538, _2548, _1568);
        float _2558 = fma(_2552, _2548, _1584);
        _2510 = _2556;
        _2512 = _2554;
        _2514 = _2558;
    }
    float _2560 = _2510;
    float _2562 = _2512;
    float _2564 = _2514;
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2560 + _2566;
    float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2572 = _2562 + _2570;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2576 = _2564 + _2574;
    float _2578 = _2568 * _2568;
    float _2580 = fma(_2572, _2572, _2578);
    float _2582 = fma(_2576, _2576, _2580);
    float _2584 = rsqrt(_2582);
    float _2586 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2588 = _2572 * _2586;
    float _2590 = _2576 * _2586;
    float _2592 = _2588 * _2588;
    float _2594 = _2590 * _2590;
    float _2596 = _2592 + _2594;
    float _2598 = sqrt(_2596);
    bool _2600 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2604 = _2598 + _2602;
    float _2606 = _2584;
    float _2608 = _2596;
    float _2610 = _2604;
    float _2612 = _2568;
    if (_2600)
    {
        float _2614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2606 = _2614;
    }
    float _2616 = _2606;
    if (_2600)
    {
        float _2618 = rsqrt(_2596);
        _2608 = _2618;
    }
    float _2620 = _2608;
    float _2622 = _2620;
    if (_2600)
    {
        float _2624 = _2604 * _2616;
        _2610 = _2624;
    }
    float _2626 = _2610;
    if (_2600)
    {
        float _2628 = _2626 * 0.15915493667125701904296875;
        _1590 = _2628;
    }
    float _2630 = _1590;
    float _2632 = _2576;
    if (_2600)
    {
        float _2634 = _2630 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2642 = precise::max(0.0, _2640);
    float _2644 = _2616;
    float _2646 = _2642;
    if (_2600)
    {
        float _2648 = _2630 * 6.283185482025146484375;
        float _2650 = cos(_2648);
        _2644 = _2650;
    }
    float _2652 = _2644;
    float _2654 = -_2586;
    float _2656 = -_2642;
    float _2658 = fma(_2568, _2654, _2656);
    if (_2600)
    {
        float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2612 = _2660;
    }
    float _2662 = _2612;
    float _2664 = sqrt(_2582);
    float _2666 = _2662;
    float _2668 = _2638;
    if (_2600)
    {
        float _2670 = fma(_2638, _2662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2666 = _2670;
    }
    float _2672 = _2666;
    float _2674 = _2672;
    if (!_2600)
    {
        _2668 = _2588;
    }
    float _2676 = _2668;
    float _2678 = _2676;
    float _2680 = _2652;
    if (_2600)
    {
        float _2682 = _2652 + (-1.0);
        _2646 = _2682;
    }
    float _2684 = _2646;
    float _2686 = _2684;
    if (_2600)
    {
        float _2688 = _2620 * _2672;
        _2414 = _2688;
    }
    float _2690 = _2414;
    if (!_2600)
    {
        _2674 = _2658;
    }
    float _2692 = _2674;
    float _2694 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2696 = _2692;
    if (_2600)
    {
        float _2698 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2698;
    }
    float _2700 = _2286;
    if (_2600)
    {
        float _2702 = _2588 * _2690;
        _2678 = _2702;
    }
    float _2704 = _2678;
    if (!_2600)
    {
        _2686 = _2590;
    }
    float _2706 = _2686;
    float _2708 = _2706;
    if (_2600)
    {
        float _2710 = _2590 * _2690;
        _2708 = _2710;
    }
    float _2712 = _2708;
    if (!_2600)
    {
        _2622 = _2592;
    }
    float _2714 = _2622;
    float _2716 = _2714;
    if (_2600)
    {
        float _2718 = fma(_2658, _2652, _2700);
        _2696 = _2718;
    }
    float _2720 = _2696;
    if (_2600)
    {
        float _2722 = _2704 * _2704;
        _2716 = _2722;
    }
    float _2724 = _2716;
    if (!_2600)
    {
        _2680 = _2594;
    }
    float _2726 = _2680;
    float _2728 = _2726;
    if (_2600)
    {
        float _2730 = _2712 * _2712;
        _2728 = _2730;
    }
    float _2732 = _2728;
    float _2734 = fma(_2720, _2720, _2724);
    float _2736 = _2734 + _2732;
    float _2738 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2742 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2740);
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2750 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2738);
    float _2752 = rsqrt(_2736);
    float _2754 = -_2744;
    float _2756 = _2754 + 1.0;
    float _2758 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2760 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2750);
    float _2762 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2746);
    float _2764 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2766 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2758);
    float _2768 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2762);
    float _2770 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2694);
    float _2772 = abs(_2756);
    float _2774 = log2(_2772);
    float _2776 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2778 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2766);
    float _2780 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2782 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2770);
    float _2784 = _2752 * _2704;
    float _2786 = -_2776;
    float _2788 = fma(_2786, _2748, 1.0);
    float _2790 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2792 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2794 = _2752 * _2720;
    float _2796 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2798 = _2752 * _2712;
    float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2792);
    float _2802 = _2782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2804 = -_2796;
    float _2806 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2810 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2812 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = -_2798;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2818 = log2(_2788);
    float _2820 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2810);
    float _2822 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2824 = fma(_2816, -0.5, 0.5);
    float _2826 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2808);
    float _2828 = fma(_2816, 0.5, 0.5);
    float _2830 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2822);
    float _2832 = _2794 + 1.0;
    float _2834 = exp2(_2812);
    float _2836 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2826);
    float _2838 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2830);
    float _2840 = fma(_2828, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2842 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2836);
    float _2844 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2838);
    float _2846 = fma(_2828, _2840, -0.212114393711090087890625);
    float _2848 = 1.0 / _2820;
    float _2850 = _2818 * 0.693147182464599609375;
    float _2852 = fma(_2828, _2846, 1.570728778839111328125);
    float _2854 = sqrt(_2824);
    float _2856 = -_2794;
    float _2858 = fma(_2834, _2832, _2856);
    float _2860 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2862 = fma(_2858, 0.5, 0.5);
    float _2864 = _2842 * _2848;
    float _2866 = _2844 * _2848;
    float _2868 = fma(_2864, 0.5, 0.5);
    float _2870 = fma(_2866, -0.5, 0.5);
    float _2872 = _2854 * 0.636619746685028076171875;
    float3 _7368 = float3(_2868, _2870, _2860);
    float _2874 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7368, float3(0.0), isnan(_7368)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7368, float3(0.0), isnan(_7368)), level(0.0)).x;
    float _2876 = -_2852;
    float _2878 = fma(_2872, _2876, 1.0);
    float3 _7384 = float3(_2868, _2870, _2860);
    float4 _2881 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7384, float3(0.0), isnan(_7384)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7384, float3(0.0), isnan(_7384)), level(0.0)).xyzw;
    float _2883 = _2881.x;
    float _2885 = _2881.y;
    float _2887 = _2881.z;
    float _2889 = _2881.w;
    float2 _7401 = float2(_2878, _2862);
    float3 _2893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7401, float2(0.0), isnan(_7401)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7401, float2(0.0), isnan(_7401)), level(0.0)).xyz;
    float _2895 = _2893.x;
    float _2897 = _2893.y;
    float _2899 = _2893.z;
    float _2901 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2903 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2905 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2903);
    float _2907 = exp2(_2901);
    float _2909 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2905);
    float _2911 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2913 = _2911 + _2820;
    out.gl_Position.x = _2842;
    out.gl_Position.y = _2844;
    out.gl_Position.z = _2911;
    out.gl_Position.w = _2820;
    float _2915 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2917 = _2913 * 0.5;
    float _2919 = -_2907;
    float _2921 = _2919 + 1.0;
    out.m_47.x = _2915;
    float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2917;
    out.m_77.w = _2820;
    float _2925 = -_2923;
    float _2927 = _2925 + 1.0;
    float _2929 = _2923 * _2874;
    float _2931 = _2889 * _2929;
    float _2933 = _2899 * _2929;
    float _2935 = fma(_2895, _2931, _2883);
    float _2937 = fma(_2897, _2931, _2885);
    float _2939 = _2889 * _2927;
    float _2941 = fma(_2889, _2933, _2887);
    out.m_79.x = _2935;
    out.m_79.y = _2937;
    out.m_79.z = _2941;
    out.m_79.w = _2939;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2450 = false;
    bool _688 = false;
    bool _380 = false;
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
        float _2998 = as_type<float>(_114);
        out.gl_Position.z = _2998;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3067 = as_type<float>(_150);
        out.gl_Position.z = _3067;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.x;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _156 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    int _168 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _170 = _168 != 0;
    float _172 = _156 * _154;
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = _174 * 6.283185482025146484375;
    float _184 = floor(_174);
    float _186 = _182 * 0.15915493667125701904296875;
    float _188 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _190 = 0.0;
    float _192 = _188;
    if (!_166)
    {
        float _194 = _188 * _188;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = cos(_200);
    float _204 = _198;
    if (!_166)
    {
        float _206 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    float _210 = -_184;
    float _212 = _174 + _210;
    bool _214 = !_166;
    float _216 = _208;
    if (!_214)
    {
        float _218 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = log2(_218);
        float _222 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _224 = _222 + 1.0;
        float _226 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = _188 * _220;
        float _230 = 1.0 / _224;
        float _232 = _226 * 0.693147182464599609375;
        float _234 = exp2(_228);
        float _236 = 1.0 / _232;
        float _238 = _234 + (-1.0);
        float _240 = -_238;
        float _242 = fma(_240, _236, _188);
        float _244 = _242 * _230;
        float _246 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _246;
    }
    float _248 = _216;
    bool _250 = !_166;
    if (!_250)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _188 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _192 = _270;
    }
    float _272 = _192;
    float _274 = in.m_53.w;
    float _276 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = in.m_44.x;
    float _288 = in.m_44.y;
    float _290 = in.m_44.z;
    float _292 = -_212;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _296 = _212 < 0.5;
    float _298 = float(_296);
    bool _300 = !_280;
    int _302 = _300 ? 0 : 1;
    float _304 = fma(_202, 0.5, 0.5);
    bool _306 = !_170;
    int _308 = _306 ? 0 : 1;
    float _310 = -_298;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_302);
    float _316 = -_304;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = fma(_272, _176, _276);
    int _322 = abs(_308);
    float _324 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _326 = !_284;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_272, _178, _324);
    bool _332 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _334 = abs(_328);
    float _336 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_314);
    float _340 = float(_322);
    float _342 = abs(_294);
    float _344 = _338 * _342;
    float _346 = fma(_272, _180, _336);
    float _348 = fma(_330, _274, _288);
    float _350 = float(_334);
    float _352 = fma(_340, _318, _344);
    float _354 = fma(_320, _274, _286);
    float _356 = fma(_346, _274, _290);
    float _358 = abs(_312);
    float _360 = fma(_350, _358, _352);
    bool _362 = !_332;
    float _378;
    if (!_362)
    {
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _152 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        float _382 = float(_98);
        float _384 = 1.0 / _382;
        float _386 = _132 * _384;
        _378 = _386;
    }
    _380 = false;
    float _388 = _378;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _392 = _388 + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _396 = _388 + _394;
    bool _398 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _400 = isnan(_388);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _428 = _388 + _426;
    float _430 = 1.0 / _412;
    bool _432 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _434 = isnan(_388);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = 1.0 / _424;
    bool _446 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _448 = 1.0 / _420;
    float _450 = _392 * _430;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _454 = _388 + _452;
    float _456 = -_408;
    float _458 = _456 + 1.0;
    float _460 = 1.0 / _416;
    float _462 = _454 * _444;
    bool _464 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _466 = isnan(_388);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _474 * _458;
    float _478 = _396 * _448;
    bool _480 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_388);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -_474;
    float _494 = _492 + 1.0;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _500;
    float _504 = _490 * _494;
    float _506 = -_490;
    float _508 = _506 + 1.0;
    float _510 = _428 * _460;
    bool _512 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_388);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _524;
    float _528 = fma(_498, _450, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _530 = fma(_502, _450, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _536 = -_522;
    float _538 = _536 + 1.0;
    float _540 = fma(_526, _450, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _542 = _522 * _508;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _552 = _442 * _538;
    float _554 = fma(_534, _510, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_546, _510, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_550, _510, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = _528 * _552;
    float _562 = _530 * _552;
    float _564 = _540 * _552;
    float _566 = -_442;
    float _568 = _566 + 1.0;
    float _570 = in.m_53.x;
    float _572 = in.m_53.y;
    float _574 = in.m_53.z;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _584;
    float _588 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].x, _560);
    float _590 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].y, _562);
    float _592 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[143].z, _564);
    float _594 = fma(_578, _478, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _596 = fma(_582, _478, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _598 = fma(_586, _478, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = fma(_554, _542, _588);
    float _602 = fma(_556, _542, _590);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _616 = fma(_558, _542, _592);
    float _618 = fma(_606, _462, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _620 = fma(_610, _462, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _622 = fma(_594, _504, _600);
    float _624 = fma(_596, _504, _602);
    float _626 = fma(_614, _462, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_598, _504, _616);
    float _630 = fma(_618, _476, _622);
    float _632 = fma(_620, _476, _624);
    float _634 = fma(_626, _476, _628);
    float _636 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].x, _630);
    float _638 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].y, _632);
    float _640 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[147].z, _634);
    float _642 = _636 * _570;
    float _644 = _638 * _572;
    float _646 = _640 * _574;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _662 = !_446;
    float _684;
    float _686;
    if (!_662)
    {
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _666 = _152 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _668 = float(_98);
        float _670 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _672 = 1.0 / _668;
        float _674 = _670 * _664;
        float _676 = floor(_674);
        float _678 = _132 * _672;
        float _680 = -_676;
        float _682 = _674 + _680;
        _684 = _682;
        _686 = _678;
        _688 = true;
    }
    else
    {
        float _690 = float(_98);
        float _692 = 1.0 / _690;
        float _694 = _132 * _692;
        _684 = _694;
        _686 = _694;
    }
    _688 = false;
    float _696 = _684;
    float _698 = _686;
    float _700 = in.m_55.y;
    float _702 = _360 * _642;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _706 = _704 != 0;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _710 = _708 != 0;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _714 = _712 != 0;
    float _716 = _360 * _644;
    float _718 = in.m_51.w;
    float _720 = _152 * 2.0;
    float _722 = in.m_57.x;
    float _724 = in.m_57.y;
    float _726 = in.m_57.z;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _730 = _728 != 0;
    float _732 = floor(_720);
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _736 = _734 != 0;
    float _738 = in.m_59.x;
    float _740 = in.m_59.y;
    float _742 = in.m_59.z;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _746 = _744 != 0;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _750 = in.m_61.x;
    float _752 = in.m_61.y;
    float _754 = in.m_61.z;
    float _756 = _360 * _646;
    float _758 = in.m_51.y;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _760;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _768 = -_700;
    float _770 = _768 + 1.0;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _774 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _776 = _718 > 0.5;
    float _778 = 1.0 / _766;
    float _780 = _718 * 6.283185482025146484375;
    float _782 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    int _784 = _776 ? as_type<int>(_770) : as_type<int>(_700);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _696 + _786;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _792 = _790 != 0;
    float _794 = _348 * _724;
    float _796 = _348 * _740;
    float _798 = 1.0 / _762;
    float _800 = fma(_354, _722, _794);
    float _802 = _348 * _752;
    float _804 = fma(_354, _738, _796);
    float _806 = _746 ? as_type<float>(_784) : _700;
    float _808 = fma(_354, _750, _802);
    float _810 = _152 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _812;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _820 = _758 > 0.5;
    float _822 = in.m_63.x;
    float _824 = -_748;
    float _826 = fma(_810, 2.0, _824);
    float _828 = 1.0 / _814;
    float _830 = _700;
    if (_792)
    {
        float _832 = _820 ? _770 : _700;
        _830 = _832;
    }
    float _834 = _830;
    float _836 = _758 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _838;
    float _842 = fma(_836, -2.0, _772);
    bool _844 = _732 > 0.0;
    float _846 = 1.0 / _818;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _854 = _852 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _856 = _732 >= 0.0;
    bool _858 = isnan(_732);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _872 = _696 + _870;
    float _874 = _758 * 2.0;
    float _876 = 1.0 / _850;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _884 = _696 + _882;
    float _886 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _888 = _884 * _828;
    float _890 = 1.0 / _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _896 = _788 * _846;
    float _898 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _886);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _902 = _698 + _900;
    float _904 = 1.0 / _894;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _910 = -_822;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[191].x, _132);
    float _914 = -_718;
    float _916 = fma(_914, 0.0350000001490116119384765625, 0.070000000298023223876953125);
    float _918 = fma(_356, _742, _804);
    float _920 = _872 * _876;
    float _922 = _912 * _916;
    float _924 = fma(_912, 0.100000001490116119384765625, _780);
    float _926 = fma(_912, 0.00999999977648258209228515625, _780);
    float _928 = 1.0 / _854;
    float _930 = fma(_356, _726, _800);
    float _932 = fma(_356, _754, _808);
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _936 = _934 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _940 = _696 + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _942;
    float _946 = 1.0 / _908;
    float _948 = in.m_51.z;
    float _950 = _940 * _778;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _956;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _964;
    float _968 = 1.0 / _936;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _972 = _696 + _970;
    float _974 = _962 * _904;
    int _976 = _864 ? 0 : 1;
    float _978 = _958 * _890;
    float _980 = _972 * _798;
    float _982 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _984 = 1.0 / _954;
    bool _986 = _758 >= 0.949999988079071044921875;
    bool _988 = isnan(_758);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.949999988079071044921875);
    bool _994 = _990 || _992;
    float _996 = _966 * _946;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1002 = ~_976;
    int _1004 = _1002 + 1;
    int _1006 = _1004 + 1;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _1012 = _1006;
    float _1014 = 1.0;
    if (!_844)
    {
        int _1016 = ~_976;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    float _1022 = fma(_974, _902, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1024 = 1.0 / _1000;
    float _1026 = _948 * 2.0;
    float _1028 = _840 * _968;
    bool _1030 = !_710;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = _152 + _948;
    float _1036 = _1010 * _928;
    float _1038 = _868 * _984;
    float _1040 = in.m_65.x;
    float _1042 = in.m_65.y;
    float _1044 = in.m_65.z;
    float _1046 = floor(_1026);
    float _1048 = _758 + _948;
    float _1050 = _1034 + (-1.0);
    float _1052 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _982);
    float _1054 = _1048 + (-1.0);
    float _1056 = _944 * _1024;
    float _1058 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1060 = floor(_874);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1064 = _152 + _758;
    float _1066 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1052);
    float _1068 = _1064 + (-1.0);
    float _1070 = fma(_718, 2.0, -1.0);
    bool _1072 = _1046 > 0.0;
    float _1074 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1076 = _1046 >= 0.0;
    bool _1078 = isnan(_1046);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _898);
    bool _1088 = !_994;
    float _1090 = _1088 ? 1.0 : 1.5;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1092;
    float _1096 = _1026 + (-1.0);
    int _1098 = _1084 ? 0 : 1;
    float _1100 = _1090 * _1040;
    float _1102 = _1090 * _1044;
    float _1104 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _782);
    float _1106 = fma(_1094, _888, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1108 = _874 + (-1.0);
    float _1110 = -_132;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[76].x, _826);
    bool _1114 = _1060 > 0.0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    bool _1120 = _1060 >= 0.0;
    bool _1122 = isnan(_1060);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1090 * _1042;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1136;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1152 = fma(_1134, _980, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1154 = fma(_1118, _980, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1156 = fma(_1138, _980, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1158 = fma(_1142, _950, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1160 = fma(_1146, _950, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1162 = fma(_1150, _950, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1166 = _1164 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1168;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1176;
    float _1180 = fma(_1166, _896, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1182 = fma(_1170, _888, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1184 = fma(_1178, _888, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1186 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1188 = log2(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1192 = _698 + _1190;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1194;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1198;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1206 = fma(_996, _1192, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1214 = _698 + _1212;
    float _1216 = fma(_1174, _896, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1218 = fma(_1196, _920, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1220 = fma(_1200, _920, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1222 = fma(_1204, _896, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1224 = fma(_1210, _920, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1226 = fma(_1056, _1214, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1230 = _698 + _1228;
    bool _1232 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1234 = isnan(_696);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1240 = _1236 || _1238;
    float _1242 = float(_1240);
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1246 = _698 + _1244;
    bool _1248 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1250 = isnan(_696);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1256 = _1252 || _1254;
    float _1258 = float(_1256);
    float _1260 = fma(_1036, _1230, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1262 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1264 = isnan(_696);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = _132 * _1188;
    bool _1276 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1278 = isnan(_696);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = fma(_978, _1246, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1290 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1292 = isnan(_696);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1304 = _698 + _1302;
    bool _1306 = _696 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1308 = isnan(_696);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1320 = _698 + _1318;
    bool _1322 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1324 = isnan(_698);
    bool _1326 = _1322 || _1324;
    bool _1328 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1330 = _1326 || _1328;
    float _1332 = float(_1330);
    float _1334 = fma(_1028, _1304, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1336 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1338 = isnan(_698);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = -_1316;
    float _1350 = _1348 + 1.0;
    bool _1352 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1354 = isnan(_698);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1360 = _1356 || _1358;
    float _1362 = float(_1360);
    float _1364 = -_1332;
    float _1366 = _1364 + 1.0;
    float _1368 = fma(_1038, _1320, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1370 = -_1346;
    float _1372 = _1370 + 1.0;
    float _1374 = exp2(_1274);
    float _1376 = _1346 * _1366;
    bool _1378 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1380 = isnan(_698);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = in.m_55.x;
    bool _1392 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1394 = isnan(_698);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = _1300 * _1350;
    bool _1406 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1408 = isnan(_698);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_1362;
    float _1420 = _1418 + 1.0;
    bool _1422 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1424 = isnan(_698);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _842);
    bool _1436 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1438 = isnan(_698);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1444 = _1440 || _1442;
    float _1446 = float(_1444);
    float _1448 = -_1300;
    float _1450 = _1448 + 1.0;
    float _1452 = _1362 * _1372;
    float _1454 = -_1286;
    float _1456 = _1454 + 1.0;
    int _1458 = _1128 ? 0 : 1;
    float _1460 = _1286 * _1450;
    float _1462 = _1446 * _1420;
    float _1464 = -_1446;
    float _1466 = _1464 + 1.0;
    float _1468 = _1272 * _1456;
    float _1470 = -_1432;
    float _1472 = _1470 + 1.0;
    float _1474 = -_1272;
    float _1476 = _1474 + 1.0;
    float _1478 = _1432 * _1466;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1482 = 1.0 + _1480;
    float _1484 = _1416 * _1472;
    float _1486 = -_1416;
    float _1488 = _1486 + 1.0;
    float _1490 = -_1374;
    float _1492 = _1490 + 1.0;
    bool _1494 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1502 = _1498 || _1500;
    float _1504 = _1258 * _1476;
    float _1506 = _1402 * _1488;
    float _1508 = -_1402;
    float _1510 = _1508 + 1.0;
    float _1512 = 1.0 / _1482;
    float _1514 = _1502 ? _1492 : 0.0;
    float _1516 = -_1258;
    float _1518 = _1516 + 1.0;
    bool _1520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1522 = isnan(1.0);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1528 = _1524 || _1526;
    float _1530 = _1388 * _1510;
    float _1532 = _1518;
    bool _1534 = _1072;
    bool _1536 = _1114;
    if (!_730)
    {
        _1014 = _1390;
    }
    float _1538 = _1014;
    float _1540 = _1242 * _1518;
    float _1542 = _1288 * _1530;
    float _1544 = _1538;
    if (!_730)
    {
        _1532 = _1538;
    }
    float _1546 = _1532;
    float _1548 = _1152 * _1540;
    float _1550 = _1546;
    if (_730)
    {
        _1544 = _1390;
    }
    float _1552 = _1544;
    float _1554 = _1154 * _1540;
    float _1556 = in.m_67.x;
    float _1558 = in.m_67.y;
    float _1560 = in.m_67.z;
    float _1562 = _1156 * _1540;
    int _1564 = abs(_1032);
    float _1566 = _1514 * _1512;
    float _1568 = _918 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1570 = float(_1564);
    float _1572 = _930 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1574 = float(_1020);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1578 = ~_1098;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    float _1584 = _932 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1586 = _1582;
    float _1588 = _1552;
    float _1590 = _1572;
    if (!_1072)
    {
        int _1592 = ~_1098;
        int _1594 = _1592 + 1;
        _1586 = _1594;
    }
    int _1596 = _1586;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1600 = _1570 * _1574;
    int _1602 = ~_1458;
    int _1604 = _1602 + 1;
    int _1606 = _1604 + 1;
    float _1608 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1576);
    float _1610 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1598);
    int _1612 = _1606;
    if (!_1114)
    {
        int _1614 = ~_1458;
        int _1616 = _1614 + 1;
        _1612 = _1616;
    }
    int _1618 = _1612;
    float _1620 = _1600 * (-2.0);
    bool _1622 = !_714;
    int _1624 = _1622 ? 0 : 1;
    float _1626 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1610);
    float _1628 = _926 * 0.15915493667125701904296875;
    float _1630 = fma(_1062, _1620, _1062);
    float _1632 = fma(_1620, _1558, _1558);
    bool _1634 = !_706;
    int _1636 = _1634 ? 0 : 1;
    float _1638 = _1628 * 6.283185482025146484375;
    float _1640 = cos(_1638);
    float _1642 = _1096 * _1096;
    float _1644 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1608);
    bool _1646 = !_1528;
    float _1648 = _1646 ? _132 : _1566;
    float _1650 = _758 + (-0.5);
    int _1652 = abs(_1624);
    float _1654 = _924 * 0.15915493667125701904296875;
    int _1656 = abs(_1636);
    float _1658 = fma(_1108, _1108, _1642);
    float _1660 = -_1568;
    float _1662 = _1660 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1664 = _1628 * 6.283185482025146484375;
    float _1666 = sin(_1664);
    float _1668 = float(_1656);
    float _1670 = fma(_1070, _1070, _1658);
    float _1672 = float(_1596);
    float _1674 = -_1572;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1678 = _1096 + _1640;
    if (_730)
    {
        bool _1680 = _152 > 0.5;
        _1534 = _1680;
    }
    bool _1682 = _1534;
    float _1684 = _152 + (-0.5);
    float _1686 = sqrt(_1104);
    float _1688 = _1662 * _1662;
    float _1690 = _1668 * _1672;
    float _1692 = float(_1652);
    float _1694 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1632);
    float _1696 = fma(_1676, _1676, _1688);
    float _1698 = _1690 * (-2.0);
    float _1700 = float(_1618);
    float _1702 = rsqrt(_1104);
    float _1704 = _1108 + _1666;
    float _1706 = fma(_1698, _1556, _1556);
    float _1708 = fma(_1074, _1698, _1074);
    float _1710 = _1692 * _1700;
    if (_736)
    {
        bool _1712 = _948 > 0.5;
        _1536 = _1712;
    }
    bool _1714 = _1536;
    float _1716 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1706);
    float _1718 = _948 + (-0.5);
    float _1720 = rsqrt(_1066);
    float _1722 = -_1584;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = fma(_1648, _1708, _1716);
    float _1728 = _1710 * (-2.0);
    float _1730 = _720 + (-1.0);
    float _1732 = fma(_1724, _1724, _1696);
    float _1734 = _1704 * _1704;
    float _1736 = fma(_1728, _1560, _1560);
    float _1738 = rsqrt(_1086);
    float _1740 = _1100 * _1702;
    float _1742 = fma(_1058, _1728, _1058);
    float _1744 = fma(_1648, _1630, _1694);
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1736);
    float _1748 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1750 = fma(_1730, _1730, _1734);
    float _1752 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1754 = rsqrt(_1732);
    float _1756 = _1102 * _1720;
    float _1758 = _1726 * 0.15915493667125701904296875;
    float _1760 = _1686 * _1740;
    float _1762 = fma(_1648, _1742, _1746);
    float _1764 = fma(_1678, _1678, _1750);
    float _1766 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1760);
    float _1770 = _1130 * _1738;
    float _1772 = _1744 * 0.15915493667125701904296875;
    float _1774 = _1758 * 6.283185482025146484375;
    float _1776 = sin(_1774);
    float _1778 = _1766 * _1768;
    float _1780 = _1686 * _1770;
    float _1782 = _1686 * _1756;
    float _1784 = _1676 * _1754;
    float _1786 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1780);
    float _1788 = _1724 * _1754;
    float _1790 = _1662 * _1754;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = _1784 * _1792;
    float _1796 = _1748 * _1786;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = _1788 * _1798;
    float _1802 = _1772 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    float _1806 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1808 = -_1794;
    float _1810 = fma(_1788, _1806, _1808);
    float _1812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1782);
    float _1814 = _1762 * 0.15915493667125701904296875;
    float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1818 = -_1800;
    float _1820 = fma(_1790, _1816, _1818);
    float _1822 = _1810 * _1810;
    float _1824 = _1752 * _1812;
    float _1826 = _1772 * 6.283185482025146484375;
    float _1828 = cos(_1826);
    float _1830 = rsqrt(_1764);
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1834 = _1790 * _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1838 = -_1834;
    float _1840 = fma(_1784, _1836, _1838);
    float _1842 = fma(_1820, _1820, _1822);
    float _1844 = _1776 * _1804;
    float _1846 = _1758 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = fma(_1840, _1840, _1842);
    float _1852 = _1814 * 6.283185482025146484375;
    float _1854 = cos(_1852);
    float _1856 = _1730 * _1830;
    float _1858 = _1704 * _1830;
    float _1860 = _1678 * _1830;
    float _1862 = _1776 * _1828;
    float _1864 = _1814 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = _1848 * _1828;
    float _1870 = _1848 * _1804;
    float _1872 = rsqrt(_1850);
    float _1874 = _1828 * _1854;
    float _1876 = _1854 * _1796;
    float _1878 = _1804 * _1854;
    float _1880 = _922 * 0.15915493667125701904296875;
    float _1882 = _1848 * _1876;
    float _1884 = _1776 * _1876;
    float _1886 = -_1796;
    float _1888 = _1866 * _1886;
    float _1890 = -_1870;
    float _1892 = fma(_1866, _1862, _1890);
    float _1894 = fma(_1866, _1868, _1844);
    float _1896 = -_1862;
    float _1898 = fma(_1866, _1870, _1896);
    float _1900 = fma(_1874, _1778, _1888);
    float _1902 = _1858 * _1858;
    float _1904 = fma(_1866, _1844, _1868);
    float _1906 = fma(_1894, _1778, _1882);
    float _1908 = _1810 * _1872;
    float _1910 = fma(_1892, _1778, _1884);
    float _1912 = fma(_1878, _1824, _1900);
    float _1914 = _1820 * _1872;
    float _1916 = fma(_1856, _1856, _1902);
    float _1918 = _1840 * _1872;
    float _1920 = _1788 * _1908;
    float _1922 = _1654 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = fma(_1860, _1860, _1916);
    float _1928 = fma(_1898, _1824, _1906);
    float _1930 = -_1920;
    float _1932 = fma(_1790, _1918, _1930);
    float _1934 = _1784 * _1918;
    float _1936 = _922 * (-0.15915493667125701904296875);
    float _1938 = _1790 * _1914;
    float _1940 = _1932 * _1928;
    float _1942 = rsqrt(_1670);
    float _1944 = -_1934;
    float _1946 = fma(_1788, _1914, _1944);
    float _1948 = fma(_1904, _1824, _1910);
    float _1950 = -_1938;
    float _1952 = fma(_1784, _1908, _1950);
    float _1954 = fma(_1914, _1912, _1940);
    float _1956 = _1946 * _1928;
    float _1958 = _1952 * _1928;
    float _1960 = rsqrt(_1926);
    float _1962 = fma(_1908, _1912, _1956);
    float _1964 = fma(_1784, _1948, _1954);
    float _1966 = fma(_1918, _1912, _1958);
    float _1968 = fma(_1790, _1948, _1962);
    float _1970 = _1572 + _1964;
    float _1972 = fma(_1788, _1948, _1966);
    float _1974 = _1936 * 6.283185482025146484375;
    float _1976 = cos(_1974);
    float _1978 = _1942 * _1924;
    float _1980 = _1568 + _1968;
    float _1982 = _1978 * 0.300000011920928955078125;
    float _1984 = _1936 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    float _1988 = _1856 * _1960;
    float _1990 = _1860 * _1960;
    float _1992 = fma(_1096, _1982, _1980);
    float _1994 = fma(_1108, _1982, _1970);
    float _1996 = -_1568;
    float _1998 = _1996 + _1992;
    float _2000 = -_1976;
    float _2002 = _2000 + 1.0;
    float _2004 = _1858 * _1960;
    float _2006 = _1880 * 6.283185482025146484375;
    float _2008 = sin(_2006);
    float _2010 = -_1572;
    float _2012 = _2010 + _1994;
    float _2014 = _1988 * _2002;
    float _2016 = _2004 * _2002;
    float _2018 = _1988 * _1986;
    float _2020 = _1990 * _1986;
    float _2022 = _1880 * 6.283185482025146484375;
    float _2024 = cos(_2022);
    float _2026 = _2004 * _1986;
    float _2028 = fma(_1990, _2016, _2018);
    float _2030 = fma(_2004, _2014, _2020);
    float _2032 = -_2020;
    float _2034 = fma(_2004, _2014, _2032);
    float _2036 = -_2018;
    float _2038 = fma(_1990, _2016, _2036);
    float _2040 = fma(_2004, _2016, _1976);
    float _2042 = _1584 + _1972;
    float _2044 = _1990 * _1990;
    float _2046 = _2034 * _1998;
    float _2048 = _2040 * _1998;
    float _2050 = fma(_1070, _1982, _2042);
    float _2052 = fma(_2002, _2044, _1976);
    float _2054 = fma(_1988, _2014, _1976);
    float _2056 = fma(_2030, _2012, _2048);
    float _2058 = -_1584;
    float _2060 = _2058 + _2050;
    float _2062 = -_2026;
    float _2064 = fma(_1990, _2014, _2062);
    float _2066 = _2028 * _1998;
    float _2068 = fma(_1990, _2014, _2026);
    float _2070 = fma(_2054, _2012, _2046);
    float _2072 = -_2024;
    float _2074 = _2072 + 1.0;
    float _2076 = fma(_2038, _2060, _2056);
    float _2078 = fma(_2064, _2012, _2066);
    float _2080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2082 = _1990 * _2008;
    float _2084 = _1988 * _2074;
    float _2086 = fma(_2068, _2060, _2070);
    float _2088 = _1568 + _2076;
    float _2090 = _1988 * _2008;
    float _2092 = -_2082;
    float _2094 = fma(_2004, _2084, _2092);
    float _2096 = _1572 + _2086;
    float _2098 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2100 = _2088 + _2098;
    float _2102 = fma(_1988, _2084, _2024);
    float _2104 = _2004 * _2074;
    float _2106 = fma(_2044, _2074, _2024);
    float _2108 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2110 = _2096 + _2108;
    float _2112 = _2094 * _2100;
    float _2114 = fma(_2052, _2060, _2078);
    float _2116 = _2004 * _2008;
    float _2118 = fma(_1990, _2104, _2090);
    float _2120 = fma(_2102, _2110, _2112);
    float _2122 = _1584 + _2114;
    float _2124 = -_2116;
    float _2126 = fma(_1990, _2084, _2124);
    float _2128 = _2118 * _2100;
    int _2130 = as_type<int>(_2044);
    int _2132 = as_type<int>(_2116);
    if (_730)
    {
        float _2134 = -_1552;
        float _2136 = _2134 + 1.0;
        _2130 = as_type<int>(_2136);
    }
    int _2138 = _2130;
    float _2140 = _2080 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2142 = fma(_1990, _2084, _2116);
    float _2144 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2146 = _2122 + _2144;
    float _2148 = fma(_2126, _2110, _2128);
    float _2150 = fma(_2140, _834, -0.5);
    float _2152 = _2146;
    if (_730)
    {
        float _2154 = _1682 ? as_type<float>(_2138) : _1552;
        _1550 = _2154;
    }
    float _2156 = _1550;
    float _2158 = fma(_2142, _2146, _2120);
    float _2160 = fma(_2106, _2146, _2148);
    if (_736)
    {
        float _2162 = -_1552;
        float _2164 = _2162 + 1.0;
        _2132 = as_type<int>(_2164);
    }
    int _2166 = _2132;
    float _2168 = -_1434;
    float _2170 = fma(_1626, _2150, _2168);
    float _2172 = _2158 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2174 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2176 = -_1388;
    float _2178 = _2176 + 1.0;
    float _2180 = _2174;
    if (_736)
    {
        float _2182 = _1714 ? as_type<float>(_2166) : _1552;
        _1588 = _2182;
    }
    float _2184 = _1588;
    float _2186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2188 = _2172 + _2186;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2192 = _2174 + _2190;
    float _2194 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1542);
    float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2198 = _2188 * _2188;
    float _2200 = _2192 * _2192;
    float _2202 = fma(_1022, _1506, _2194);
    float _2204 = fma(_2004, _2104, _2024);
    float _2206 = -_1242;
    float _2208 = _2206 + 1.0;
    float _2210 = _2198 + _2200;
    float _2212 = fma(_2004, _2084, _2082);
    float _2214 = _2204 * _2100;
    float _2216 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1548);
    float _2218 = sqrt(_2210);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1554);
    float _2222 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    float _2224 = -_2090;
    float _2226 = fma(_1990, _2104, _2224);
    float _2228 = fma(_2212, _2110, _2214);
    float _2230 = fma(_1158, _1504, _2216);
    float _2232 = fma(_1160, _1504, _2220);
    float _2234 = fma(_1162, _1504, _2222);
    float _2236 = fma(_1206, _1484, _2202);
    float _2238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2240 = fma(_2226, _2146, _2228);
    float _2242 = _2196 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2244 = fma(_1182, _1468, _2230);
    float _2246 = fma(_1106, _1468, _2232);
    float _2248 = fma(_1184, _1468, _2234);
    float _2250 = fma(_1260, _1478, _2236);
    bool _2252 = _2218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2256 = _2240 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2258 = fma(_2242, _2156, -0.5);
    float _2260 = fma(_1216, _1460, _2244);
    float _2262 = fma(_1180, _1460, _2246);
    float _2264 = fma(_1222, _1460, _2248);
    float _2266 = fma(_1334, _1462, _2250);
    float _2268 = fma(_1644, _2258, _1112);
    float _2270 = fma(_1218, _1404, _2260);
    float _2272 = fma(_1220, _1404, _2262);
    float _2274 = fma(_1224, _1404, _2264);
    float _2276 = fma(_1368, _1452, _2266);
    float _2278 = _2226;
    float _2280 = _2198;
    float _2282 = _2200;
    float _2284 = _2210;
    float _2286 = _2188;
    if (!_2252)
    {
        _2152 = _2172;
    }
    float _2288 = _2152;
    float _2290 = _2288;
    if (!_2252)
    {
        _2278 = _2256;
    }
    float _2292 = _2278;
    bool _2294 = !_2252;
    float _2296 = _2292;
    if (!_2294)
    {
        float _2298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2302 = _2218 + _2300;
        float _2304 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = rsqrt(_2210);
        float _2308 = _2302 * _2298;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2310 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2310 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = fma(_2314, _2304, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2322 = _2306 * _2320;
        float _2324 = _2318 + (-1.0);
        float _2326 = fma(_2188, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2328 = fma(_2192, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2330 = _2324 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2334 = _2326 + _2332;
        float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2338 = _2328 + _2336;
        float _2340 = fma(_2256, _2318, _2330);
        float _2342 = _2334 * _2334;
        float _2344 = _2338 * _2338;
        _2296 = _2340;
        _2280 = _2342;
        _2282 = _2344;
        _2290 = _2326;
        _2180 = _2328;
        _2284 = _2306;
    }
    float _2346 = _2296;
    float _2348 = _2280;
    float _2350 = _2282;
    float _2352 = _2290;
    float _2354 = _2180;
    float _2356 = _2284;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2360 = _2346 + _2358;
    float _2362 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].x, _2270);
    float _2364 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].y, _2272);
    float _2366 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[128].z, _2274);
    float _2368 = fma(_2360, _2360, _2348);
    float _2370 = _806 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2372 = _2184 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2374 = fma(_1226, _1376, _2276);
    float _2376 = _2368 + _2350;
    float _2378 = _2362 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2380 = _2364 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2382 = _2366 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2384 = _2370 * _2254;
    float _2386 = _2372 * _2238;
    float _2388 = sqrt(_2376);
    float _2390 = _2170 + 0.5;
    float _2392 = _2268 + 0.5;
    float _2394 = _2378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2396 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2398 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2400 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2374);
    out.m_69.x = _654;
    out.m_69.y = _658;
    out.m_69.z = _660;
    out.m_69.w = _656;
    out.m_71.x = _2392;
    out.m_71.y = _2390;
    out.m_71.z = _2386;
    out.m_71.w = _2384;
    out.m_73.x = _2394;
    out.m_73.y = _2396;
    out.m_73.z = _2398;
    bool _2402 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2404 = isnan(_2388);
    bool _2406 = _2402 || _2404;
    bool _2408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2410 = _2406 || _2408;
    out.m_75.x = _2400;
    float _2412 = _2360;
    float _2414 = _2356;
    if (!_2410)
    {
        _2412 = 1.0;
    }
    float _2416 = _2412;
    bool _2418 = !_2410;
    float _2420 = _2416;
    if (!_2418)
    {
        bool _2422 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2424 = isnan(_2388);
        bool _2426 = _2422 || _2424;
        bool _2428 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2430 = _2426 || _2428;
        if (!_2430)
        {
            float _2432 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2434 = _2388 + _2432;
            float _2436 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2438 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2436;
            float _2440 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2444 = 1.0 / _2438;
            float _2446 = _2434 * _2444;
            float _2448 = fma(_2446, _2442, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2420 = _2448;
            _2450 = true;
        }
        else
        {
            bool _2452 = _2388 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2454 = isnan(_2388);
            bool _2456 = _2452 || _2454;
            bool _2458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2460 = _2456 || _2458;
            if (!_2460)
            {
                float _2462 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2464 = _2388 + _2462;
                float _2466 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2468 = _2466 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2470 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2472 = _2470 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2474 = 1.0 / _2468;
                float _2476 = _2464 * _2474;
                float _2478 = fma(_2476, _2472, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2420 = _2478;
                _2450 = true;
            }
            else
            {
                _2420 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2450 = false;
    float _2480 = _2420;
    float _2482 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2484 = _2346 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2488 = _2352 + _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2492 = _2354 + _2490;
    bool _2494 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2498 = _2494 || _2496;
    bool _2500 = isnan(0.5);
    bool _2502 = _2498 || _2500;
    float _2504 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2506 = fma(_2488, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2508 = fma(_2492, _2480, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2510 = _2504;
    float _2512 = _2506;
    float _2514 = _2508;
    if (!_2502)
    {
        float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2518 = _1568 + _2516;
        float _2520 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2522 = _1572 + _2520;
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2526 = -_1572;
        float _2528 = _2526 + _2506;
        float _2530 = _2518 * _2518;
        float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2534 = _1584 + _2532;
        float _2536 = -_1568;
        float _2538 = _2536 + _2504;
        float _2540 = fma(_2522, _2522, _2530);
        float _2542 = fma(_2534, _2534, _2540);
        float _2544 = sqrt(_2542);
        float _2546 = precise::min(_2544, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2548 = _2546 * _2524;
        float _2550 = -_1584;
        float _2552 = _2550 + _2508;
        float _2554 = fma(_2528, _2548, _1572);
        float _2556 = fma(_2538, _2548, _1568);
        float _2558 = fma(_2552, _2548, _1584);
        _2510 = _2556;
        _2512 = _2554;
        _2514 = _2558;
    }
    float _2560 = _2510;
    float _2562 = _2512;
    float _2564 = _2514;
    float _2566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2568 = _2560 + _2566;
    float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2572 = _2562 + _2570;
    float _2574 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2576 = _2564 + _2574;
    float _2578 = _2568 * _2568;
    float _2580 = fma(_2572, _2572, _2578);
    float _2582 = fma(_2576, _2576, _2580);
    float _2584 = rsqrt(_2582);
    float _2586 = _2584 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2588 = _2572 * _2586;
    float _2590 = _2576 * _2586;
    float _2592 = _2588 * _2588;
    float _2594 = _2590 * _2590;
    float _2596 = _2592 + _2594;
    float _2598 = sqrt(_2596);
    bool _2600 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2604 = _2598 + _2602;
    float _2606 = _2584;
    float _2608 = _2596;
    float _2610 = _2604;
    float _2612 = _2568;
    if (_2600)
    {
        float _2614 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2606 = _2614;
    }
    float _2616 = _2606;
    if (_2600)
    {
        float _2618 = rsqrt(_2596);
        _2608 = _2618;
    }
    float _2620 = _2608;
    float _2622 = _2620;
    if (_2600)
    {
        float _2624 = _2604 * _2616;
        _2610 = _2624;
    }
    float _2626 = _2610;
    if (_2600)
    {
        float _2628 = _2626 * 0.15915493667125701904296875;
        _1590 = _2628;
    }
    float _2630 = _1590;
    float _2632 = _2576;
    if (_2600)
    {
        float _2634 = _2630 * 6.283185482025146484375;
        float _2636 = sin(_2634);
        _2632 = _2636;
    }
    float _2638 = _2632;
    float _2640 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2642 = precise::max(0.0, _2640);
    float _2644 = _2616;
    float _2646 = _2642;
    if (_2600)
    {
        float _2648 = _2630 * 6.283185482025146484375;
        float _2650 = cos(_2648);
        _2644 = _2650;
    }
    float _2652 = _2644;
    float _2654 = -_2586;
    float _2656 = -_2642;
    float _2658 = fma(_2568, _2654, _2656);
    if (_2600)
    {
        float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2612 = _2660;
    }
    float _2662 = _2612;
    float _2664 = sqrt(_2582);
    float _2666 = _2662;
    float _2668 = _2638;
    if (_2600)
    {
        float _2670 = fma(_2638, _2662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2666 = _2670;
    }
    float _2672 = _2666;
    float _2674 = _2672;
    if (!_2600)
    {
        _2668 = _2588;
    }
    float _2676 = _2668;
    float _2678 = _2676;
    float _2680 = _2652;
    if (_2600)
    {
        float _2682 = _2652 + (-1.0);
        _2646 = _2682;
    }
    float _2684 = _2646;
    float _2686 = _2684;
    if (_2600)
    {
        float _2688 = _2620 * _2672;
        _2414 = _2688;
    }
    float _2690 = _2414;
    if (!_2600)
    {
        _2674 = _2658;
    }
    float _2692 = _2674;
    float _2694 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2696 = _2692;
    if (_2600)
    {
        float _2698 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2698;
    }
    float _2700 = _2286;
    if (_2600)
    {
        float _2702 = _2588 * _2690;
        _2678 = _2702;
    }
    float _2704 = _2678;
    if (!_2600)
    {
        _2686 = _2590;
    }
    float _2706 = _2686;
    float _2708 = _2706;
    if (_2600)
    {
        float _2710 = _2590 * _2690;
        _2708 = _2710;
    }
    float _2712 = _2708;
    if (!_2600)
    {
        _2622 = _2592;
    }
    float _2714 = _2622;
    float _2716 = _2714;
    if (_2600)
    {
        float _2718 = fma(_2658, _2652, _2700);
        _2696 = _2718;
    }
    float _2720 = _2696;
    if (_2600)
    {
        float _2722 = _2704 * _2704;
        _2716 = _2722;
    }
    float _2724 = _2716;
    if (!_2600)
    {
        _2680 = _2594;
    }
    float _2726 = _2680;
    float _2728 = _2726;
    if (_2600)
    {
        float _2730 = _2712 * _2712;
        _2728 = _2730;
    }
    float _2732 = _2728;
    float _2734 = fma(_2720, _2720, _2724);
    float _2736 = _2734 + _2732;
    float _2738 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2742 = fma(_2664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2740);
    float _2744 = precise::clamp(_2742, 0.0, 1.0);
    float _2746 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2748 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2750 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2738);
    float _2752 = rsqrt(_2736);
    float _2754 = -_2744;
    float _2756 = _2754 + 1.0;
    float _2758 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2760 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2750);
    float _2762 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2746);
    float _2764 = _2760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2766 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2758);
    float _2768 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2762);
    float _2770 = fma(_2562, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2694);
    float _2772 = abs(_2756);
    float _2774 = log2(_2772);
    float _2776 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2778 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2766);
    float _2780 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2782 = fma(_2564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2770);
    float _2784 = _2752 * _2704;
    float _2786 = -_2776;
    float _2788 = fma(_2786, _2748, 1.0);
    float _2790 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2792 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2794 = _2752 * _2720;
    float _2796 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2798 = _2752 * _2712;
    float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2792);
    float _2802 = _2782 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2804 = -_2796;
    float _2806 = fma(_2794, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2810 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2812 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2814 = -_2798;
    float _2816 = fma(_2814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2818 = log2(_2788);
    float _2820 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2810);
    float _2822 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2824 = fma(_2816, -0.5, 0.5);
    float _2826 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2808);
    float _2828 = fma(_2816, 0.5, 0.5);
    float _2830 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2822);
    float _2832 = _2794 + 1.0;
    float _2834 = exp2(_2812);
    float _2836 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2826);
    float _2838 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2830);
    float _2840 = fma(_2828, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2842 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2836);
    float _2844 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2838);
    float _2846 = fma(_2828, _2840, -0.212114393711090087890625);
    float _2848 = 1.0 / _2820;
    float _2850 = _2818 * 0.693147182464599609375;
    float _2852 = fma(_2828, _2846, 1.570728778839111328125);
    float _2854 = sqrt(_2824);
    float _2856 = -_2794;
    float _2858 = fma(_2834, _2832, _2856);
    float _2860 = _2850 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2862 = fma(_2858, 0.5, 0.5);
    float _2864 = _2842 * _2848;
    float _2866 = _2844 * _2848;
    float _2868 = fma(_2864, 0.5, 0.5);
    float _2870 = fma(_2866, -0.5, 0.5);
    float _2872 = _2854 * 0.636619746685028076171875;
    float3 _7368 = float3(_2868, _2870, _2860);
    float _2874 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7368, float3(0.0), isnan(_7368)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7368, float3(0.0), isnan(_7368)), level(0.0)).x;
    float _2876 = -_2852;
    float _2878 = fma(_2872, _2876, 1.0);
    float3 _7384 = float3(_2868, _2870, _2860);
    float4 _2881 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7384, float3(0.0), isnan(_7384)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7384, float3(0.0), isnan(_7384)), level(0.0)).xyzw;
    float _2883 = _2881.x;
    float _2885 = _2881.y;
    float _2887 = _2881.z;
    float _2889 = _2881.w;
    float2 _7401 = float2(_2878, _2862);
    float3 _2893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7401, float2(0.0), isnan(_7401)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7401, float2(0.0), isnan(_7401)), level(0.0)).xyz;
    float _2895 = _2893.x;
    float _2897 = _2893.y;
    float _2899 = _2893.z;
    float _2901 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2903 = _2780 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2905 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2903);
    float _2907 = exp2(_2901);
    float _2909 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2905);
    float _2911 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2913 = _2911 + _2820;
    out.gl_Position.x = _2842;
    out.gl_Position.y = _2844;
    out.gl_Position.z = _2911;
    out.gl_Position.w = _2820;
    float _2915 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2917 = _2913 * 0.5;
    float _2919 = -_2907;
    float _2921 = _2919 + 1.0;
    out.m_47.x = _2915;
    float _2923 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2917;
    out.m_77.w = _2820;
    float _2925 = -_2923;
    float _2927 = _2925 + 1.0;
    float _2929 = _2923 * _2874;
    float _2931 = _2889 * _2929;
    float _2933 = _2899 * _2929;
    float _2935 = fma(_2895, _2931, _2883);
    float _2937 = fma(_2897, _2931, _2885);
    float _2939 = _2889 * _2927;
    float _2941 = fma(_2889, _2933, _2887);
    out.m_79.x = _2935;
    out.m_79.y = _2937;
    out.m_79.z = _2941;
    out.m_79.w = _2939;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

