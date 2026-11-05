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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
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
    float4 m_49 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_77 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = _102;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2189 = as_type<float>(_118);
        out.gl_Position.z = _2189;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_130;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _120 = as_type<int>(_146);
    }
    int _148 = _120;
    out.m_53.x = _132;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2249 = as_type<float>(_148);
        out.gl_Position.z = _2249;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _152 = in.m_55.x;
    float _154 = in.m_55.y;
    float _156 = in.m_55.z;
    float _158 = _132 * 2.0;
    float _160 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _162 = in.m_51.y;
    float _164 = floor(_158);
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = in.m_51.z;
    float _170 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _174 = 0.0;
    float _176 = _170;
    if (_150)
    {
        float _178 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = 0.0;
    float _184 = _180;
    if (_150)
    {
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _182 = _186;
    }
    float _188 = _182;
    float _190 = in.m_57.x;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _194 = _192 != 0;
    float _196 = -_172;
    float _198 = fma(_160, 2.0, _196);
    float _200 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _202 = _164 > 0.0;
    float _204 = _152;
    if (_150)
    {
        float _206 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        _184 = _206;
    }
    float _208 = _184;
    bool _210 = _164 >= 0.0;
    bool _212 = isnan(_164);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    float _220 = _154 * 6.283185482025146484375;
    float _222 = _156 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _224 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _226 = _208;
    if (_150)
    {
        float _228 = _208 * _188;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = _162 * 2.0;
    float _234 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[192].y, _220);
    float _236 = fma(_224, -2.0, _166);
    float _238 = _168 * 2.0;
    float _240 = _224;
    if (_150)
    {
        float _242 = floor(_230);
        _240 = _242;
    }
    float _244 = _240;
    float _246 = _132 + _168;
    float _248 = fma(_222, 6.283185482025146484375, _234);
    float _250 = _162 + _168;
    float _252 = 0.0;
    if (!_150)
    {
        _252 = _154;
    }
    float _254 = _252;
    float _256 = _246 + (-1.0);
    float _258 = _250 + (-1.0);
    float _260 = floor(_238);
    float _262 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[192].y, _248);
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _266 = _264 != 0;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _270 = floor(_232);
    float _272 = _254;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (_150)
    {
        float _276 = -_244;
        float _278 = _230 + _276;
        _272 = _278;
    }
    float _280 = _272;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _290 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _292 = _132 + _162;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _298;
    bool _302 = _260 >= 0.0;
    bool _304 = isnan(_260);
    bool _306 = _302 || _304;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    float _312 = _292 + (-1.0);
    float _314 = fma(_154, 12.56637096405029296875, _200);
    float _316 = 1.0 / _300;
    bool _318 = _260 > 0.0;
    float _320 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _326 = _218 ? 0 : 1;
    float _328 = fma(_156, 6.283185482025146484375, _314);
    bool _330 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _334 = _330 || _332;
    bool _336 = isnan(1.0);
    bool _338 = _334 || _336;
    bool _340 = _270 > 0.0;
    float _342 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].w, _220);
    float _344 = 1.0 / _284;
    float _346 = _270;
    if (!_266)
    {
        _274 = _190;
    }
    float _348 = _274;
    float _350 = _200 + _328;
    float _352 = fma(_156, 6.283185482025146484375, _342);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _358 = _310 ? 0 : 1;
    bool _360 = _270 >= 0.0;
    bool _362 = isnan(_270);
    bool _364 = _360 || _362;
    bool _366 = isnan(0.0);
    bool _368 = _364 || _366;
    float _370 = 1.0 / _288;
    float _372 = _348;
    if (!_266)
    {
        _346 = _348;
    }
    float _374 = _346;
    float _376 = 0.0;
    float _378 = _374;
    if (!_338)
    {
        float _380 = _170 * _170;
        float _382 = _380 * 0.5;
        _376 = _382;
    }
    float _384 = _376;
    float _386 = _384;
    if (_266)
    {
        _372 = _190;
    }
    float _388 = _372;
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].w, _352);
    int _392 = _368 ? 0 : 1;
    if (!_338)
    {
        float _394 = _384 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _394;
    }
    float _396 = _386;
    float _398 = 1.0 / _324;
    int _400 = ~_326;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = ~_358;
    int _408 = _406 + 1;
    int _410 = _408 + 1;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _412;
    int _416 = ~_392;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    int _422 = _404;
    int _424 = _410;
    int _426 = _420;
    float _428 = _396;
    if (!_202)
    {
        int _430 = ~_326;
        int _432 = _430 + 1;
        _422 = _432;
    }
    int _434 = _422;
    float _436 = 1.0 / _296;
    if (!_318)
    {
        int _438 = ~_358;
        int _440 = _438 + 1;
        _424 = _440;
    }
    int _442 = _424;
    if (!_340)
    {
        int _444 = ~_392;
        int _446 = _444 + 1;
        _426 = _446;
    }
    int _448 = _426;
    float _450 = 1.0 / _356;
    bool _452 = !_338;
    if (!_452)
    {
        float _454 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _456 = log2(_454);
        float _458 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _460 = _458 + 1.0;
        float _462 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _464 = _170 * _456;
        float _466 = 1.0 / _460;
        float _468 = _462 * 0.693147182464599609375;
        float _470 = exp2(_464);
        float _472 = 1.0 / _468;
        float _474 = _470 + (-1.0);
        float _476 = -_474;
        float _478 = fma(_476, _472, _170);
        float _480 = _478 * _466;
        float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _482;
    }
    float _484 = _428;
    bool _486 = !_338;
    if (!_486)
    {
        float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _490 = log2(_488);
        float _492 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _494 = _492 + 1.0;
        float _496 = 1.0 / _494;
        float _498 = _170 * _490;
        float _500 = exp2(_498);
        float _502 = -_500;
        float _504 = _502 + 1.0;
        float _506 = _504 * _496;
        _176 = _506;
    }
    float _508 = _176;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _512 = _280 + _510;
    float _514 = 1.0 / _414;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _518 = _280 + _516;
    float _520 = _512 * _344;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _524 = _280 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _540 = _280 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _542;
    float _546 = _518 * _370;
    float _548 = _524 * _398;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _566 = _540 * _316;
    float _568 = fma(_552, _546, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _570 = fma(_556, _546, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _572 = fma(_560, _548, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _574 = fma(_564, _548, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _578 = _280 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _582 = _280 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _586 = _280 + _584;
    float _588 = _578 * _436;
    float _590 = _582 * _514;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _600;
    float _604 = _586 * _450;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _618 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _620 = isnan(_280);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = fma(_594, _588, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _632 = fma(_598, _588, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _634 = fma(_602, _590, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _636 = fma(_608, _590, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _638 = fma(_612, _604, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _640 = in.m_44.x;
    float _642 = in.m_44.y;
    float _644 = in.m_44.z;
    float _646 = fma(_616, _604, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    bool _648 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _650 = isnan(_280);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -_628;
    float _662 = _660 + 1.0;
    float _664 = _262 * 0.15915493667125701904296875;
    float _666 = _390 * 0.15915493667125701904296875;
    bool _668 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _670 = isnan(_280);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_536, _566, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _682 = fma(_544, _566, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _684 = _658 * _662;
    float _686 = -_658;
    float _688 = _686 + 1.0;
    float _690 = in.m_59.x;
    float _692 = in.m_59.y;
    float _694 = in.m_59.z;
    bool _696 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _698 = isnan(_280);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _666 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _678 * _688;
    float _714 = -_678;
    float _716 = _714 + 1.0;
    bool _718 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _720 = isnan(_280);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_706;
    float _732 = _730 + 1.0;
    bool _734 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _736 = isnan(_280);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _706 * _716;
    float _748 = in.m_61.w;
    float _750 = _664 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _728 * _732;
    float _756 = -_728;
    float _758 = _756 + 1.0;
    float _760 = in.m_42.x;
    float _762 = in.m_42.y;
    float _764 = in.m_42.z;
    bool _766 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _768 = isnan(_280);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = -_744;
    float _782 = _780 + 1.0;
    float _784 = fma(_528, _520, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _786 = fma(_532, _520, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _788 = _744 * _758;
    float _790 = fma(_508, _640, _778);
    bool _792 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _794 = isnan(_280);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = _776 * _782;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _812 = _810 != 0;
    float _814 = -_776;
    float _816 = _814 + 1.0;
    float _818 = _710 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _820 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _822 = fma(_752, 0.5, 0.5);
    float _824 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _826 = _802 * _816;
    float _828 = _818 + _692;
    float _830 = fma(_508, _642, _820);
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[192].x, 1.0);
    float _834 = fma(_508, _644, _824);
    float _836 = _784 * _826;
    float _838 = _786 * _826;
    float _840 = -_802;
    float _842 = _840 + 1.0;
    float _844 = -_818;
    float _846 = fma(_844, _152, _828);
    float _848 = _832 * _690;
    float _850 = _832 * _694;
    int _852 = as_type<int>(_690);
    int _854 = as_type<int>(_694);
    int _856 = as_type<int>(_804);
    float _858 = _836;
    float _860 = _832;
    if (_808)
    {
        float _862 = -_388;
        float _864 = _862 + 1.0;
        _852 = as_type<int>(_864);
    }
    int _866 = _852;
    bool _868 = _162 > 0.5;
    float _870 = as_type<float>(_866);
    if (_812)
    {
        float _872 = -_388;
        float _874 = _872 + 1.0;
        _854 = as_type<int>(_874);
    }
    int _876 = _854;
    float _878 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[159].x, _836);
    float _880 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[159].z, _838);
    float _882 = fma(_790, _748, _760);
    float _884 = _760;
    int _886 = as_type<int>(_878);
    if (!_808)
    {
        _204 = _388;
    }
    float _888 = _204;
    float _890 = fma(_568, _804, _878);
    float _892 = _888;
    if (!_812)
    {
        _884 = _388;
    }
    float _894 = _884;
    float _896 = fma(_570, _804, _880);
    float _898 = _894;
    if (_808)
    {
        float _900 = _868 ? as_type<float>(_866) : _388;
        _892 = _900;
    }
    float _902 = _892;
    if (_194)
    {
        _856 = 0;
        _886 = 0;
    }
    int _904 = _856;
    int _906 = _886;
    int _908 = _904;
    int _910 = _906;
    if (_812)
    {
        float _912 = _868 ? as_type<float>(_876) : _388;
        _898 = _912;
    }
    float _914 = _898;
    if (_194)
    {
        _870 = _132;
    }
    float _916 = _870;
    float _918 = _916;
    if (_194)
    {
        _858 = _162;
    }
    float _920 = _858;
    float _922 = _920;
    if (!_194)
    {
        float _924 = _132 * 3.1415927410125732421875;
        float _926 = _924 * 0.15915493667125701904296875;
        float _928 = _162 * 3.1415927410125732421875;
        float _930 = _928 * 0.15915493667125701904296875;
        float _932 = _926 * 6.283185482025146484375;
        float _934 = sin(_932);
        float _936 = _930 * 6.283185482025146484375;
        float _938 = sin(_936);
        _908 = 2;
        _910 = 1;
        _922 = _938;
        _918 = _934;
    }
    int _940 = _908;
    int _942 = _910;
    float _944 = _922;
    float _946 = _918;
    bool _948 = _940 != 2;
    float _950 = fma(_680, _788, _890);
    bool _952 = _942 != 1;
    float _954 = fma(_682, _788, _896);
    float _956 = _944 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _958 = fma(_830, _748, _762);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[93].w, _960);
    float _966 = as_type<float>(_940);
    if (_948)
    {
        _966 = _132;
    }
    float _968 = _966;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _972 = _968;
    if (!_948)
    {
        _972 = _168;
    }
    float _974 = _972;
    float _976 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[93].z, _962);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _984 = _946 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _996 = _994 != 0;
    float _998 = fma(_956, -2.0, _980);
    float _1000 = -_970;
    float _1002 = fma(_982, 2.0, _1000);
    float _1004 = -_978;
    float _1006 = fma(_984, 2.0, _1004);
    float _1008 = in.m_63.x;
    float _1010 = in.m_63.y;
    float _1012 = in.m_63.z;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_952)
    {
        _1014 = _162;
    }
    float _1016 = _1014;
    float _1018 = _132 + (-0.5);
    float _1020 = _350 * 0.15915493667125701904296875;
    bool _1022 = !_988;
    float _1024 = _1022 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1026 = -_102;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1006);
    float _1030 = _1016;
    float _1032 = _1024;
    if (!_952)
    {
        _860 = _1016;
    }
    float _1034 = _860;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1038 = abs(as_type<int>(_1024));
    float _1040 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[91].y, _998);
    float _1042 = _1034;
    float _1044 = _1036;
    if (_952)
    {
        _1030 = _132;
    }
    float _1046 = _1030;
    float _1048 = -_102;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1002);
    float _1052 = fma(_572, _754, _950);
    float _1054 = float(_442);
    float _1056 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1036);
    float _1058 = float(_1038);
    float _1060 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1062 = log2(_1060);
    if (!_952)
    {
        _1032 = _168;
    }
    float _1064 = _1032;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1068 = _1064;
    if (_952)
    {
        _1068 = _162;
    }
    float _1070 = _1068;
    float _1072 = _1058 * _1054;
    float _1074 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1056);
    float _1076 = _1070;
    if (_952)
    {
        _1042 = _132;
    }
    float _1078 = _1042;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1066);
    float _1082 = _1072 * (-2.0);
    if (!_952)
    {
        _1044 = _168;
    }
    float _1084 = _1044;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1088 = fma(_1082, _1008, _1008);
    float _1090 = _1084;
    if (_952)
    {
        _1090 = _162;
    }
    float _1092 = _1090;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_948)
    {
        _1076 = _162;
    }
    float _1096 = _1076;
    float _1098 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1088);
    float _1100 = _1096;
    if (!_948)
    {
        _1100 = _132;
    }
    float _1102 = _1100;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1108 = _1062 * _102;
    float _1110 = -_1086;
    float _1112 = fma(_1094, 2.0, _1110);
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1116 = fma(_1106, -2.0, _1104);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1120 = fma(_320, _1082, _320);
    float _1122 = _1020 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = fma(_1114, -2.0, _1118);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1132 = 1.0 + _1130;
    float _1134 = exp2(_1108);
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1138 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1128);
    bool _1140 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(1.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1152 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1136);
    float _1154 = -_102;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[76].x, _198);
    bool _1158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1166 = _1162 || _1164;
    float _1168 = 1.0 / _1132;
    float _1170 = _1124 * 6.283185482025146484375;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1174 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1152);
    float _1176 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _236);
    float _1178 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1150);
    bool _1180 = !_992;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1186 = -_1134;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1172);
    float _1192 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1178);
    int _1194 = abs(_1182);
    float _1196 = _1184 * 0.15915493667125701904296875;
    float _1198 = _1166 ? _1188 : 0.0;
    float _1200 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[92].z, _976);
    float _1202 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1138);
    float _1204 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1190);
    float _1206 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[92].w, _964);
    float _1208 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1080);
    float _1210 = -_102;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1112);
    float _1214 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1116);
    float _1216 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1126);
    if (_1148)
    {
        float _1218 = _1198 * _1168;
        _110 = _1218;
    }
    float _1220 = _110;
    float _1222 = float(_434);
    float _1224 = fma(_574, _754, _954);
    bool _1226 = !_996;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = fma(_1120, _1220, _1098);
    float _1232 = float(_1194);
    float _1234 = _162 + (-0.5);
    int _1236 = abs(_1228);
    float _1238 = _1230 * 0.15915493667125701904296875;
    float _1240 = float(_448);
    float _1242 = _1232 * _1222;
    float _1244 = float(_1236);
    float _1246 = _1196 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = fma(_630, _746, _1052);
    float _1252 = _1242 * (-2.0);
    float _1254 = fma(_632, _746, _1224);
    float _1256 = _1244 * _1240;
    float _1258 = fma(_638, _712, _1250);
    float _1260 = fma(_1252, _1010, _1010);
    float _1262 = fma(_646, _712, _1254);
    float _1264 = _1256 * (-2.0);
    float _1266 = _1196 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1260);
    float _1272 = _168 + (-0.5);
    float _1274 = in.m_61.x;
    float _1276 = in.m_61.y;
    float _1278 = in.m_61.z;
    float _1280 = fma(_1264, _1012, _1012);
    float _1282 = fma(_268, _1252, _268);
    float _1284 = fma(_290, _1264, _290);
    float _1286 = _848 * _1248;
    float _1288 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1280);
    float _1290 = fma(_1282, _1220, _1270);
    float _1292 = fma(_636, _684, _1262);
    float _1294 = fma(_634, _684, _1258);
    float _1296 = fma(_1284, _1220, _1288);
    float _1298 = _1290 * 0.15915493667125701904296875;
    float _1300 = _1238 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1294);
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = fma(_850, _1268, _1286);
    float _1310 = _848 * _1268;
    float _1312 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1292);
    float _1314 = fma(_834, _748, _764);
    float _1316 = -_1308;
    float _1318 = _848 + _1316;
    float _1320 = _1238 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = -_1310;
    float _1326 = fma(_850, _1248, _1324);
    float _1328 = fma(_1304, _1318, _1308);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _1332 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1334 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1336 = -_1326;
    float _1338 = _850 + _1336;
    float _1340 = _1298 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1328);
    float _1350 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1352 = fma(_1312, _1338, _1326);
    float _1354 = _1344 * _1330;
    float _1356 = _1346 * _1348;
    float _1358 = _1298 * 6.283185482025146484375;
    float _1360 = sin(_1358);
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1352);
    float _1366 = _1362 * _1364;
    float _1368 = _1306 * 6.283185482025146484375;
    float _1370 = cos(_1368);
    float _1372 = _1302 * _1342;
    float _1374 = _1322 * _1342;
    float _1376 = _1306 * 6.283185482025146484375;
    float _1378 = sin(_1376);
    float _1380 = _1302 * _1360;
    float _1382 = _1322 * _1360;
    float _1384 = _1360 * _1370;
    float _1386 = _1342 * _1370;
    float _1388 = _1370 * _1354;
    float _1390 = _1322 * _1388;
    float _1392 = _1302 * _1388;
    float _1394 = fma(_1378, _1374, _1380);
    float _1396 = -_1354;
    float _1398 = _1378 * _1396;
    float _1400 = -_1382;
    float _1402 = fma(_1378, _1372, _1400);
    float _1404 = -_1372;
    float _1406 = fma(_1378, _1382, _1404);
    float _1408 = fma(_1394, _1356, _1390);
    float _1410 = fma(_1386, _1356, _1398);
    float _1412 = fma(_1402, _1356, _1392);
    float _1414 = _958 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1416 = fma(_1406, _1366, _1408);
    float _1418 = fma(_1378, _1380, _1374);
    float _1420 = fma(_1384, _1366, _1410);
    float _1422 = _958 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1424 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1414);
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1428 = fma(_1418, _1366, _1412);
    float _1430 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1422);
    float _1432 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1424);
    float _1434 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1426);
    float _1438 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1430);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1434);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1436);
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1448 = _958 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1450 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1442);
    float _1452 = _1440 + _1444;
    float _1454 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1456 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1448);
    float _1458 = _1446 + _1450;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1462 = _1452 + _1460;
    float _1464 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1454);
    float _1466 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1456);
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1458 + _1468;
    float _1472 = _1462 * _1462;
    float _1474 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1464);
    float _1476 = _1466 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1478 = fma(_1470, _1470, _1472);
    float _1480 = _1476 + _1474;
    float _1482 = sqrt(_1478);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = _1314;
    float _1488 = _1476;
    float _1490 = _1474;
    float _1492 = _1480;
    float _1494 = _1318;
    if (!_1484)
    {
        _1486 = _1458;
    }
    float _1496 = _1486;
    float _1498 = _1496;
    if (!_1484)
    {
        _1488 = _1452;
    }
    float _1500 = _1488;
    float _1502 = _1500;
    if (!_1484)
    {
        _1490 = _1480;
    }
    float _1504 = _1490;
    bool _1506 = !_1484;
    float _1508 = _1504;
    if (!_1506)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1514 = _1482 + _1512;
        float _1516 = rsqrt(_1478);
        float _1518 = _1514 * _1510;
        float _1520 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1522 = _1518 * 0.15915493667125701904296875;
        float _1524 = _1522 * 6.283185482025146484375;
        float _1526 = cos(_1524);
        float _1528 = _1522 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = _1526 + (-1.0);
        float _1534 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1536 = fma(_1530, _1520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1538 = fma(_1480, _1526, _1534);
        float _1540 = _1516 * _1536;
        float _1542 = fma(_1470, _1540, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1544 = fma(_1462, _1540, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1508 = _1538;
        _1498 = _1542;
        _1502 = _1544;
    }
    float _1546 = _1508;
    float _1548 = _1498;
    float _1550 = _1502;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1554 = _1546 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1550 + _1560;
    float _1564 = _1554 * _1554;
    float _1566 = fma(_1558, _1558, _1564);
    float _1568 = fma(_1562, _1562, _1566);
    float _1570 = rsqrt(_1568);
    float _1572 = sqrt(_1568);
    float _1574 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1558 * _1574;
    float _1578 = _1562 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1562;
    float _1596 = _1564;
    float _1598 = _1592;
    float _1600 = _1574;
    if (_1588)
    {
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1602;
    }
    float _1604 = _1594;
    if (_1588)
    {
        float _1606 = rsqrt(_1584);
        _1596 = _1606;
    }
    float _1608 = _1596;
    float _1610 = _1608;
    if (_1588)
    {
        float _1612 = _1592 * _1604;
        _1598 = _1612;
    }
    float _1614 = _1598;
    if (_1588)
    {
        float _1616 = _1614 * 0.15915493667125701904296875;
        _1492 = _1616;
    }
    float _1618 = _1492;
    float _1620 = _1570;
    float _1622 = _1618;
    if (_1588)
    {
        float _1624 = _1618 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = precise::max(0.0, _1630);
    float _1634 = _1478;
    float _1636 = _1632;
    float _1638 = _1630;
    if (_1588)
    {
        float _1640 = _1618 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        _1634 = _1642;
    }
    float _1644 = _1634;
    float _1646 = -_1574;
    float _1648 = -_1632;
    float _1650 = fma(_1554, _1646, _1648);
    float _1652 = _1650;
    if (_1588)
    {
        float _1654 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1654;
    }
    float _1656 = _1636;
    float _1658 = _1628;
    float _1660 = _1656;
    if (_1588)
    {
        float _1662 = fma(_1628, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (!_1588)
    {
        _1660 = _1580;
    }
    float _1668 = _1660;
    float _1670 = _1668;
    if (_1588)
    {
        float _1672 = _1644 + (-1.0);
        _1638 = _1672;
    }
    float _1674 = _1638;
    float _1676 = _1674;
    if (_1588)
    {
        float _1678 = _1608 * _1664;
        _1600 = _1678;
    }
    float _1680 = _1600;
    if (!_1588)
    {
        _1610 = _1576;
    }
    float _1682 = _1610;
    float _1684 = _1682;
    if (_1588)
    {
        float _1686 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1686;
    }
    float _1688 = _1622;
    if (_1588)
    {
        float _1690 = _1576 * _1680;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1588)
    {
        _1666 = _1650;
    }
    float _1694 = _1666;
    float _1696 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1698 = _1694;
    if (!_1588)
    {
        _1676 = _1578;
    }
    float _1700 = _1676;
    float _1702 = _1700;
    if (_1588)
    {
        float _1704 = fma(_1650, _1644, _1688);
        _1698 = _1704;
    }
    float _1706 = _1698;
    if (_1588)
    {
        float _1708 = _1578 * _1680;
        _1702 = _1708;
    }
    float _1710 = _1702;
    if (_1588)
    {
        float _1712 = _1692 * _1692;
        _1670 = _1712;
    }
    float _1714 = _1670;
    if (!_1588)
    {
        _1652 = _1582;
    }
    float _1716 = _1652;
    float _1718 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1716;
    if (_1588)
    {
        float _1722 = _1710 * _1710;
        _1720 = _1722;
    }
    float _1724 = _1720;
    float _1726 = fma(_1706, _1706, _1714);
    float _1728 = _1726 + _1724;
    float _1730 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1734 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1732);
    float _1736 = precise::clamp(_1734, 0.0, 1.0);
    float _1738 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1740 = rsqrt(_1728);
    float _1742 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1744 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1730);
    float _1746 = -_1736;
    float _1748 = _1746 + 1.0;
    float _1750 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1738);
    float _1754 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1742);
    float _1756 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1744);
    float _1758 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1762 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1754);
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1766 = abs(_1748);
    float _1768 = log2(_1766);
    float _1770 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1758);
    float _1772 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = _1740 * _1692;
    float _1778 = _1740 * _1706;
    float _1780 = _1740 * _1710;
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1786 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1788 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1790 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1792 = -_1784;
    float _1794 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1792);
    float _1796 = -_1786;
    float _1798 = fma(_1796, _1696, 1.0);
    float _1800 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1790);
    float _1804 = -_1780;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1794);
    float _1808 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1810 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1812 = log2(_1798);
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
    float _1818 = fma(_1806, 0.5, 0.5);
    float _1820 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1810);
    float _1822 = _1778 + 1.0;
    float _1824 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1826 = 1.0 / _1802;
    float _1828 = fma(_1818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1820);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1834 = fma(_1818, _1828, -0.212114393711090087890625);
    float _1836 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float _1838 = exp2(_1808);
    float _1840 = fma(_1818, _1834, 1.570728778839111328125);
    float _1842 = _1812 * 0.693147182464599609375;
    float _1844 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = sqrt(_1814);
    float _1848 = _1832 * _1826;
    float _1850 = _1836 * _1826;
    float _1852 = fma(_1850, -0.5, 0.5);
    float _1854 = -_1778;
    float _1856 = fma(_1838, _1822, _1854);
    float _1858 = fma(_1848, 0.5, 0.5);
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = _1846 * 0.636619746685028076171875;
    float _1864 = -_1840;
    float _1866 = fma(_1862, _1864, 1.0);
    float3 _5010 = float3(_1858, _1852, _1844);
    float _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).x;
    float3 _5021 = float3(_1858, _1852, _1844);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    float2 _5038 = float2(_1866, _1860);
    float3 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5038, float2(0.0), isnan(_5038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5038, float2(0.0), isnan(_5038)), level(0.0)).xyz;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = in.m_57.w;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1901 = in.m_57.z;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1905 = _1903 != 0;
    float _1907 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1909 = _132 > 0.5;
    bool _1911 = _1909 && _1897;
    float _1913 = in.m_57.y;
    float _1915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1917 = _168 > 0.5;
    float _1919 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1921 = in.m_51.w;
    float _1923 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1925 = _1852;
    if (_266)
    {
        float _1927 = in.m_51.z;
        _1925 = _1927;
    }
    float _1929 = _1925;
    float _1931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1933 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    out.m_65.y = _154;
    float _1935 = -_1891;
    float _1937 = _1935 + 1.0;
    out.m_67.w = _1891;
    float _1939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1941 = _1891;
    if (_1897)
    {
        _1494 = _1901;
    }
    float _1943 = _1494;
    out.m_65.z = _156;
    float _1945 = -_1913;
    float _1947 = _1945 + 1.0;
    float _1949 = _1943;
    float _1951 = _1947;
    if (_1905)
    {
        float _1953 = _868 ? _1937 : _1891;
        _1941 = _1953;
    }
    float _1955 = _1941;
    float _1957 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1911)
    {
        float _1961 = -_1943;
        float _1963 = _1961 + 1.0;
        _1949 = _1963;
    }
    float _1965 = _1949;
    bool _1967 = _1921 > 0.5;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1971 = _1969 != 0;
    int _1973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1975 = _1973 != 0;
    int _1977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1979 = _1977 != 0;
    float _1981 = fma(_1957, _1955, -0.5);
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1985 = in.m_55.w;
    int _1987 = _1967 ? as_type<int>(_1947) : as_type<int>(_1913);
    float _1989 = -_1176;
    float _1991 = fma(_1174, _1981, _1989);
    bool _1993 = _1967;
    int _1995 = _1987;
    if (_266)
    {
        bool _1997 = _1929 > 0.5;
        _1993 = _1997;
    }
    bool _1999 = _1993;
    float _2001 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2003 = _1917 ? as_type<int>(_1947) : as_type<int>(_1913);
    float _2005 = _1991 + 0.5;
    float _2007 = exp2(_1899);
    float _2009 = _1971 ? as_type<float>(_1987) : _1913;
    if (_266)
    {
        float _2011 = -_388;
        float _2013 = _2011 + 1.0;
        _1995 = as_type<int>(_2013);
    }
    int _2015 = _1995;
    if (!_1897)
    {
        _1951 = _1901;
    }
    float _2017 = _1951;
    float _2019 = _1975 ? as_type<float>(_2003) : _1913;
    float _2021 = fma(_2001, _2009, -0.5);
    float _2023 = _1979 ? as_type<float>(_2003) : _1913;
    float _2025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2027 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2029 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2031 = _2017;
    if (_1897)
    {
        _2031 = _1965;
    }
    float _2033 = _2031;
    float _2035 = -_1214;
    float _2037 = fma(_1208, _2021, _2035);
    if (_266)
    {
        float _2039 = _1999 ? as_type<float>(_2015) : _388;
        _378 = _2039;
    }
    float _2041 = _378;
    float _2043 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2045 = fma(_2029, _2019, -0.5);
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2049 = fma(_2027, _2033, -0.5);
    float _2051 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2053 = fma(_2043, _2041, -0.5);
    float _2055 = -_1216;
    float _2057 = fma(_1204, _2045, _2055);
    float _2059 = -_2007;
    float _2061 = _2059 + 1.0;
    float _2063 = fma(_1202, _2049, _1156);
    float _2065 = fma(_2051, _902, -0.5);
    float _2067 = fma(_1074, _2053, _1212);
    float _2069 = _2057 + 0.5;
    float _2071 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.w = _1985;
    float _2075 = _2063 + 0.5;
    float _2077 = _2067 + 0.5;
    float _2079 = fma(_1192, _2065, _1050);
    float _2081 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2083 = fma(_2071, _914, -0.5);
    float _2085 = _1933 + _1802;
    float _2087 = _2079 + 0.5;
    float _2089 = _2037 + 0.5;
    float _2091 = fma(_2081, _2023, -0.5);
    float _2093 = fma(_1200, _2083, _1028);
    float _2095 = _2085 * 0.5;
    out.m_69.x = _2075;
    out.m_69.y = _2005;
    out.m_69.z = _2077;
    out.m_69.w = _2089;
    float _2097 = -_1040;
    float _2099 = fma(_1206, _2091, _2097);
    float _2101 = _2093 + 0.5;
    out.m_71.x = _2087;
    out.m_71.y = _2069;
    float _2103 = _2099 + 0.5;
    out.gl_Position.x = _1832;
    out.gl_Position.y = _1836;
    out.gl_Position.z = _1933;
    out.gl_Position.w = _1802;
    out.m_73.x = _2101;
    out.m_73.y = _2103;
    float _2105 = -_2073;
    float _2107 = _2105 + 1.0;
    float _2109 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.z = _2095;
    out.m_75.w = _1802;
    out.m_49.x = _2109;
    float _2111 = _2073 * _1868;
    float _2113 = _1879 * _2107;
    float _2115 = _1879 * _2111;
    float _2117 = _1889 * _2111;
    float _2119 = fma(_1885, _2115, _1873);
    float _2121 = fma(_1887, _2115, _1875);
    float _2123 = fma(_1879, _2117, _1877);
    out.m_77.x = _2119;
    out.m_77.y = _2121;
    out.m_77.z = _2123;
    out.m_77.w = _2113;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = _102;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2189 = as_type<float>(_118);
        out.gl_Position.z = _2189;
    }
    if (!_106)
    {
        return out;
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_130;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _120 = as_type<int>(_146);
    }
    int _148 = _120;
    out.m_53.x = _132;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2249 = as_type<float>(_148);
        out.gl_Position.z = _2249;
    }
    if (_140)
    {
        return out;
    }
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _152 = in.m_55.x;
    float _154 = in.m_55.y;
    float _156 = in.m_55.z;
    float _158 = _132 * 2.0;
    float _160 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _162 = in.m_51.y;
    float _164 = floor(_158);
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = in.m_51.z;
    float _170 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _174 = 0.0;
    float _176 = _170;
    if (_150)
    {
        float _178 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = 0.0;
    float _184 = _180;
    if (_150)
    {
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _182 = _186;
    }
    float _188 = _182;
    float _190 = in.m_57.x;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _194 = _192 != 0;
    float _196 = -_172;
    float _198 = fma(_160, 2.0, _196);
    float _200 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _202 = _164 > 0.0;
    float _204 = _152;
    if (_150)
    {
        float _206 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        _184 = _206;
    }
    float _208 = _184;
    bool _210 = _164 >= 0.0;
    bool _212 = isnan(_164);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    float _220 = _154 * 6.283185482025146484375;
    float _222 = _156 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _224 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _226 = _208;
    if (_150)
    {
        float _228 = _208 * _188;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = _162 * 2.0;
    float _234 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[192].y, _220);
    float _236 = fma(_224, -2.0, _166);
    float _238 = _168 * 2.0;
    float _240 = _224;
    if (_150)
    {
        float _242 = floor(_230);
        _240 = _242;
    }
    float _244 = _240;
    float _246 = _132 + _168;
    float _248 = fma(_222, 6.283185482025146484375, _234);
    float _250 = _162 + _168;
    float _252 = 0.0;
    if (!_150)
    {
        _252 = _154;
    }
    float _254 = _252;
    float _256 = _246 + (-1.0);
    float _258 = _250 + (-1.0);
    float _260 = floor(_238);
    float _262 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[192].y, _248);
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _266 = _264 != 0;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _270 = floor(_232);
    float _272 = _254;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (_150)
    {
        float _276 = -_244;
        float _278 = _230 + _276;
        _272 = _278;
    }
    float _280 = _272;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _290 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _292 = _132 + _162;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _298;
    bool _302 = _260 >= 0.0;
    bool _304 = isnan(_260);
    bool _306 = _302 || _304;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    float _312 = _292 + (-1.0);
    float _314 = fma(_154, 12.56637096405029296875, _200);
    float _316 = 1.0 / _300;
    bool _318 = _260 > 0.0;
    float _320 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _326 = _218 ? 0 : 1;
    float _328 = fma(_156, 6.283185482025146484375, _314);
    bool _330 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _334 = _330 || _332;
    bool _336 = isnan(1.0);
    bool _338 = _334 || _336;
    bool _340 = _270 > 0.0;
    float _342 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].w, _220);
    float _344 = 1.0 / _284;
    float _346 = _270;
    if (!_266)
    {
        _274 = _190;
    }
    float _348 = _274;
    float _350 = _200 + _328;
    float _352 = fma(_156, 6.283185482025146484375, _342);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _358 = _310 ? 0 : 1;
    bool _360 = _270 >= 0.0;
    bool _362 = isnan(_270);
    bool _364 = _360 || _362;
    bool _366 = isnan(0.0);
    bool _368 = _364 || _366;
    float _370 = 1.0 / _288;
    float _372 = _348;
    if (!_266)
    {
        _346 = _348;
    }
    float _374 = _346;
    float _376 = 0.0;
    float _378 = _374;
    if (!_338)
    {
        float _380 = _170 * _170;
        float _382 = _380 * 0.5;
        _376 = _382;
    }
    float _384 = _376;
    float _386 = _384;
    if (_266)
    {
        _372 = _190;
    }
    float _388 = _372;
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].w, _352);
    int _392 = _368 ? 0 : 1;
    if (!_338)
    {
        float _394 = _384 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _394;
    }
    float _396 = _386;
    float _398 = 1.0 / _324;
    int _400 = ~_326;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = ~_358;
    int _408 = _406 + 1;
    int _410 = _408 + 1;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _412;
    int _416 = ~_392;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    int _422 = _404;
    int _424 = _410;
    int _426 = _420;
    float _428 = _396;
    if (!_202)
    {
        int _430 = ~_326;
        int _432 = _430 + 1;
        _422 = _432;
    }
    int _434 = _422;
    float _436 = 1.0 / _296;
    if (!_318)
    {
        int _438 = ~_358;
        int _440 = _438 + 1;
        _424 = _440;
    }
    int _442 = _424;
    if (!_340)
    {
        int _444 = ~_392;
        int _446 = _444 + 1;
        _426 = _446;
    }
    int _448 = _426;
    float _450 = 1.0 / _356;
    bool _452 = !_338;
    if (!_452)
    {
        float _454 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _456 = log2(_454);
        float _458 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _460 = _458 + 1.0;
        float _462 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _464 = _170 * _456;
        float _466 = 1.0 / _460;
        float _468 = _462 * 0.693147182464599609375;
        float _470 = exp2(_464);
        float _472 = 1.0 / _468;
        float _474 = _470 + (-1.0);
        float _476 = -_474;
        float _478 = fma(_476, _472, _170);
        float _480 = _478 * _466;
        float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _482;
    }
    float _484 = _428;
    bool _486 = !_338;
    if (!_486)
    {
        float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _490 = log2(_488);
        float _492 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _494 = _492 + 1.0;
        float _496 = 1.0 / _494;
        float _498 = _170 * _490;
        float _500 = exp2(_498);
        float _502 = -_500;
        float _504 = _502 + 1.0;
        float _506 = _504 * _496;
        _176 = _506;
    }
    float _508 = _176;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _512 = _280 + _510;
    float _514 = 1.0 / _414;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _518 = _280 + _516;
    float _520 = _512 * _344;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _524 = _280 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _540 = _280 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _542;
    float _546 = _518 * _370;
    float _548 = _524 * _398;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _566 = _540 * _316;
    float _568 = fma(_552, _546, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _570 = fma(_556, _546, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _572 = fma(_560, _548, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _574 = fma(_564, _548, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _578 = _280 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _582 = _280 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _586 = _280 + _584;
    float _588 = _578 * _436;
    float _590 = _582 * _514;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _600;
    float _604 = _586 * _450;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _618 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _620 = isnan(_280);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = fma(_594, _588, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _632 = fma(_598, _588, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _634 = fma(_602, _590, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _636 = fma(_608, _590, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _638 = fma(_612, _604, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _640 = in.m_44.x;
    float _642 = in.m_44.y;
    float _644 = in.m_44.z;
    float _646 = fma(_616, _604, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    bool _648 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _650 = isnan(_280);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -_628;
    float _662 = _660 + 1.0;
    float _664 = _262 * 0.15915493667125701904296875;
    float _666 = _390 * 0.15915493667125701904296875;
    bool _668 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _670 = isnan(_280);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_536, _566, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _682 = fma(_544, _566, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _684 = _658 * _662;
    float _686 = -_658;
    float _688 = _686 + 1.0;
    float _690 = in.m_59.x;
    float _692 = in.m_59.y;
    float _694 = in.m_59.z;
    bool _696 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _698 = isnan(_280);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _666 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _678 * _688;
    float _714 = -_678;
    float _716 = _714 + 1.0;
    bool _718 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _720 = isnan(_280);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_706;
    float _732 = _730 + 1.0;
    bool _734 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _736 = isnan(_280);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _706 * _716;
    float _748 = in.m_61.w;
    float _750 = _664 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _728 * _732;
    float _756 = -_728;
    float _758 = _756 + 1.0;
    float _760 = in.m_42.x;
    float _762 = in.m_42.y;
    float _764 = in.m_42.z;
    bool _766 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _768 = isnan(_280);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = -_744;
    float _782 = _780 + 1.0;
    float _784 = fma(_528, _520, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _786 = fma(_532, _520, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _788 = _744 * _758;
    float _790 = fma(_508, _640, _778);
    bool _792 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _794 = isnan(_280);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = _776 * _782;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _812 = _810 != 0;
    float _814 = -_776;
    float _816 = _814 + 1.0;
    float _818 = _710 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _820 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _822 = fma(_752, 0.5, 0.5);
    float _824 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _826 = _802 * _816;
    float _828 = _818 + _692;
    float _830 = fma(_508, _642, _820);
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[192].x, 1.0);
    float _834 = fma(_508, _644, _824);
    float _836 = _784 * _826;
    float _838 = _786 * _826;
    float _840 = -_802;
    float _842 = _840 + 1.0;
    float _844 = -_818;
    float _846 = fma(_844, _152, _828);
    float _848 = _832 * _690;
    float _850 = _832 * _694;
    int _852 = as_type<int>(_690);
    int _854 = as_type<int>(_694);
    int _856 = as_type<int>(_804);
    float _858 = _836;
    float _860 = _832;
    if (_808)
    {
        float _862 = -_388;
        float _864 = _862 + 1.0;
        _852 = as_type<int>(_864);
    }
    int _866 = _852;
    bool _868 = _162 > 0.5;
    float _870 = as_type<float>(_866);
    if (_812)
    {
        float _872 = -_388;
        float _874 = _872 + 1.0;
        _854 = as_type<int>(_874);
    }
    int _876 = _854;
    float _878 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[159].x, _836);
    float _880 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[159].z, _838);
    float _882 = fma(_790, _748, _760);
    float _884 = _760;
    int _886 = as_type<int>(_878);
    if (!_808)
    {
        _204 = _388;
    }
    float _888 = _204;
    float _890 = fma(_568, _804, _878);
    float _892 = _888;
    if (!_812)
    {
        _884 = _388;
    }
    float _894 = _884;
    float _896 = fma(_570, _804, _880);
    float _898 = _894;
    if (_808)
    {
        float _900 = _868 ? as_type<float>(_866) : _388;
        _892 = _900;
    }
    float _902 = _892;
    if (_194)
    {
        _856 = 0;
        _886 = 0;
    }
    int _904 = _856;
    int _906 = _886;
    int _908 = _904;
    int _910 = _906;
    if (_812)
    {
        float _912 = _868 ? as_type<float>(_876) : _388;
        _898 = _912;
    }
    float _914 = _898;
    if (_194)
    {
        _870 = _132;
    }
    float _916 = _870;
    float _918 = _916;
    if (_194)
    {
        _858 = _162;
    }
    float _920 = _858;
    float _922 = _920;
    if (!_194)
    {
        float _924 = _132 * 3.1415927410125732421875;
        float _926 = _924 * 0.15915493667125701904296875;
        float _928 = _162 * 3.1415927410125732421875;
        float _930 = _928 * 0.15915493667125701904296875;
        float _932 = _926 * 6.283185482025146484375;
        float _934 = sin(_932);
        float _936 = _930 * 6.283185482025146484375;
        float _938 = sin(_936);
        _908 = 2;
        _910 = 1;
        _922 = _938;
        _918 = _934;
    }
    int _940 = _908;
    int _942 = _910;
    float _944 = _922;
    float _946 = _918;
    bool _948 = _940 != 2;
    float _950 = fma(_680, _788, _890);
    bool _952 = _942 != 1;
    float _954 = fma(_682, _788, _896);
    float _956 = _944 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _958 = fma(_830, _748, _762);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[93].w, _960);
    float _966 = as_type<float>(_940);
    if (_948)
    {
        _966 = _132;
    }
    float _968 = _966;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _972 = _968;
    if (!_948)
    {
        _972 = _168;
    }
    float _974 = _972;
    float _976 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[93].z, _962);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _984 = _946 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _996 = _994 != 0;
    float _998 = fma(_956, -2.0, _980);
    float _1000 = -_970;
    float _1002 = fma(_982, 2.0, _1000);
    float _1004 = -_978;
    float _1006 = fma(_984, 2.0, _1004);
    float _1008 = in.m_63.x;
    float _1010 = in.m_63.y;
    float _1012 = in.m_63.z;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_952)
    {
        _1014 = _162;
    }
    float _1016 = _1014;
    float _1018 = _132 + (-0.5);
    float _1020 = _350 * 0.15915493667125701904296875;
    bool _1022 = !_988;
    float _1024 = _1022 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1026 = -_102;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1006);
    float _1030 = _1016;
    float _1032 = _1024;
    if (!_952)
    {
        _860 = _1016;
    }
    float _1034 = _860;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1038 = abs(as_type<int>(_1024));
    float _1040 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[91].y, _998);
    float _1042 = _1034;
    float _1044 = _1036;
    if (_952)
    {
        _1030 = _132;
    }
    float _1046 = _1030;
    float _1048 = -_102;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1002);
    float _1052 = fma(_572, _754, _950);
    float _1054 = float(_442);
    float _1056 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1036);
    float _1058 = float(_1038);
    float _1060 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1062 = log2(_1060);
    if (!_952)
    {
        _1032 = _168;
    }
    float _1064 = _1032;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1068 = _1064;
    if (_952)
    {
        _1068 = _162;
    }
    float _1070 = _1068;
    float _1072 = _1058 * _1054;
    float _1074 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1056);
    float _1076 = _1070;
    if (_952)
    {
        _1042 = _132;
    }
    float _1078 = _1042;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1066);
    float _1082 = _1072 * (-2.0);
    if (!_952)
    {
        _1044 = _168;
    }
    float _1084 = _1044;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1088 = fma(_1082, _1008, _1008);
    float _1090 = _1084;
    if (_952)
    {
        _1090 = _162;
    }
    float _1092 = _1090;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_948)
    {
        _1076 = _162;
    }
    float _1096 = _1076;
    float _1098 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1088);
    float _1100 = _1096;
    if (!_948)
    {
        _1100 = _132;
    }
    float _1102 = _1100;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1108 = _1062 * _102;
    float _1110 = -_1086;
    float _1112 = fma(_1094, 2.0, _1110);
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1116 = fma(_1106, -2.0, _1104);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1120 = fma(_320, _1082, _320);
    float _1122 = _1020 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = fma(_1114, -2.0, _1118);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1132 = 1.0 + _1130;
    float _1134 = exp2(_1108);
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1138 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1128);
    bool _1140 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(1.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1152 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1136);
    float _1154 = -_102;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[76].x, _198);
    bool _1158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1166 = _1162 || _1164;
    float _1168 = 1.0 / _1132;
    float _1170 = _1124 * 6.283185482025146484375;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1174 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1152);
    float _1176 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _236);
    float _1178 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1150);
    bool _1180 = !_992;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1186 = -_1134;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1172);
    float _1192 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1178);
    int _1194 = abs(_1182);
    float _1196 = _1184 * 0.15915493667125701904296875;
    float _1198 = _1166 ? _1188 : 0.0;
    float _1200 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[92].z, _976);
    float _1202 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1138);
    float _1204 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1190);
    float _1206 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[92].w, _964);
    float _1208 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1080);
    float _1210 = -_102;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1112);
    float _1214 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1116);
    float _1216 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1126);
    if (_1148)
    {
        float _1218 = _1198 * _1168;
        _110 = _1218;
    }
    float _1220 = _110;
    float _1222 = float(_434);
    float _1224 = fma(_574, _754, _954);
    bool _1226 = !_996;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = fma(_1120, _1220, _1098);
    float _1232 = float(_1194);
    float _1234 = _162 + (-0.5);
    int _1236 = abs(_1228);
    float _1238 = _1230 * 0.15915493667125701904296875;
    float _1240 = float(_448);
    float _1242 = _1232 * _1222;
    float _1244 = float(_1236);
    float _1246 = _1196 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = fma(_630, _746, _1052);
    float _1252 = _1242 * (-2.0);
    float _1254 = fma(_632, _746, _1224);
    float _1256 = _1244 * _1240;
    float _1258 = fma(_638, _712, _1250);
    float _1260 = fma(_1252, _1010, _1010);
    float _1262 = fma(_646, _712, _1254);
    float _1264 = _1256 * (-2.0);
    float _1266 = _1196 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1260);
    float _1272 = _168 + (-0.5);
    float _1274 = in.m_61.x;
    float _1276 = in.m_61.y;
    float _1278 = in.m_61.z;
    float _1280 = fma(_1264, _1012, _1012);
    float _1282 = fma(_268, _1252, _268);
    float _1284 = fma(_290, _1264, _290);
    float _1286 = _848 * _1248;
    float _1288 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1280);
    float _1290 = fma(_1282, _1220, _1270);
    float _1292 = fma(_636, _684, _1262);
    float _1294 = fma(_634, _684, _1258);
    float _1296 = fma(_1284, _1220, _1288);
    float _1298 = _1290 * 0.15915493667125701904296875;
    float _1300 = _1238 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1294);
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = fma(_850, _1268, _1286);
    float _1310 = _848 * _1268;
    float _1312 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1292);
    float _1314 = fma(_834, _748, _764);
    float _1316 = -_1308;
    float _1318 = _848 + _1316;
    float _1320 = _1238 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = -_1310;
    float _1326 = fma(_850, _1248, _1324);
    float _1328 = fma(_1304, _1318, _1308);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _1332 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1334 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1336 = -_1326;
    float _1338 = _850 + _1336;
    float _1340 = _1298 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1328);
    float _1350 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1352 = fma(_1312, _1338, _1326);
    float _1354 = _1344 * _1330;
    float _1356 = _1346 * _1348;
    float _1358 = _1298 * 6.283185482025146484375;
    float _1360 = sin(_1358);
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1352);
    float _1366 = _1362 * _1364;
    float _1368 = _1306 * 6.283185482025146484375;
    float _1370 = cos(_1368);
    float _1372 = _1302 * _1342;
    float _1374 = _1322 * _1342;
    float _1376 = _1306 * 6.283185482025146484375;
    float _1378 = sin(_1376);
    float _1380 = _1302 * _1360;
    float _1382 = _1322 * _1360;
    float _1384 = _1360 * _1370;
    float _1386 = _1342 * _1370;
    float _1388 = _1370 * _1354;
    float _1390 = _1322 * _1388;
    float _1392 = _1302 * _1388;
    float _1394 = fma(_1378, _1374, _1380);
    float _1396 = -_1354;
    float _1398 = _1378 * _1396;
    float _1400 = -_1382;
    float _1402 = fma(_1378, _1372, _1400);
    float _1404 = -_1372;
    float _1406 = fma(_1378, _1382, _1404);
    float _1408 = fma(_1394, _1356, _1390);
    float _1410 = fma(_1386, _1356, _1398);
    float _1412 = fma(_1402, _1356, _1392);
    float _1414 = _958 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1416 = fma(_1406, _1366, _1408);
    float _1418 = fma(_1378, _1380, _1374);
    float _1420 = fma(_1384, _1366, _1410);
    float _1422 = _958 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1424 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1414);
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1428 = fma(_1418, _1366, _1412);
    float _1430 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1422);
    float _1432 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1424);
    float _1434 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1426);
    float _1438 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1430);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1434);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1436);
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1448 = _958 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1450 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1442);
    float _1452 = _1440 + _1444;
    float _1454 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1456 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1448);
    float _1458 = _1446 + _1450;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1462 = _1452 + _1460;
    float _1464 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1454);
    float _1466 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1456);
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1458 + _1468;
    float _1472 = _1462 * _1462;
    float _1474 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1464);
    float _1476 = _1466 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1478 = fma(_1470, _1470, _1472);
    float _1480 = _1476 + _1474;
    float _1482 = sqrt(_1478);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = _1314;
    float _1488 = _1476;
    float _1490 = _1474;
    float _1492 = _1480;
    float _1494 = _1318;
    if (!_1484)
    {
        _1486 = _1458;
    }
    float _1496 = _1486;
    float _1498 = _1496;
    if (!_1484)
    {
        _1488 = _1452;
    }
    float _1500 = _1488;
    float _1502 = _1500;
    if (!_1484)
    {
        _1490 = _1480;
    }
    float _1504 = _1490;
    bool _1506 = !_1484;
    float _1508 = _1504;
    if (!_1506)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1514 = _1482 + _1512;
        float _1516 = rsqrt(_1478);
        float _1518 = _1514 * _1510;
        float _1520 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1522 = _1518 * 0.15915493667125701904296875;
        float _1524 = _1522 * 6.283185482025146484375;
        float _1526 = cos(_1524);
        float _1528 = _1522 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = _1526 + (-1.0);
        float _1534 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1536 = fma(_1530, _1520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1538 = fma(_1480, _1526, _1534);
        float _1540 = _1516 * _1536;
        float _1542 = fma(_1470, _1540, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1544 = fma(_1462, _1540, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1508 = _1538;
        _1498 = _1542;
        _1502 = _1544;
    }
    float _1546 = _1508;
    float _1548 = _1498;
    float _1550 = _1502;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1554 = _1546 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1550 + _1560;
    float _1564 = _1554 * _1554;
    float _1566 = fma(_1558, _1558, _1564);
    float _1568 = fma(_1562, _1562, _1566);
    float _1570 = rsqrt(_1568);
    float _1572 = sqrt(_1568);
    float _1574 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1558 * _1574;
    float _1578 = _1562 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1562;
    float _1596 = _1564;
    float _1598 = _1592;
    float _1600 = _1574;
    if (_1588)
    {
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1602;
    }
    float _1604 = _1594;
    if (_1588)
    {
        float _1606 = rsqrt(_1584);
        _1596 = _1606;
    }
    float _1608 = _1596;
    float _1610 = _1608;
    if (_1588)
    {
        float _1612 = _1592 * _1604;
        _1598 = _1612;
    }
    float _1614 = _1598;
    if (_1588)
    {
        float _1616 = _1614 * 0.15915493667125701904296875;
        _1492 = _1616;
    }
    float _1618 = _1492;
    float _1620 = _1570;
    float _1622 = _1618;
    if (_1588)
    {
        float _1624 = _1618 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = precise::max(0.0, _1630);
    float _1634 = _1478;
    float _1636 = _1632;
    float _1638 = _1630;
    if (_1588)
    {
        float _1640 = _1618 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        _1634 = _1642;
    }
    float _1644 = _1634;
    float _1646 = -_1574;
    float _1648 = -_1632;
    float _1650 = fma(_1554, _1646, _1648);
    float _1652 = _1650;
    if (_1588)
    {
        float _1654 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1654;
    }
    float _1656 = _1636;
    float _1658 = _1628;
    float _1660 = _1656;
    if (_1588)
    {
        float _1662 = fma(_1628, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (!_1588)
    {
        _1660 = _1580;
    }
    float _1668 = _1660;
    float _1670 = _1668;
    if (_1588)
    {
        float _1672 = _1644 + (-1.0);
        _1638 = _1672;
    }
    float _1674 = _1638;
    float _1676 = _1674;
    if (_1588)
    {
        float _1678 = _1608 * _1664;
        _1600 = _1678;
    }
    float _1680 = _1600;
    if (!_1588)
    {
        _1610 = _1576;
    }
    float _1682 = _1610;
    float _1684 = _1682;
    if (_1588)
    {
        float _1686 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1686;
    }
    float _1688 = _1622;
    if (_1588)
    {
        float _1690 = _1576 * _1680;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1588)
    {
        _1666 = _1650;
    }
    float _1694 = _1666;
    float _1696 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1698 = _1694;
    if (!_1588)
    {
        _1676 = _1578;
    }
    float _1700 = _1676;
    float _1702 = _1700;
    if (_1588)
    {
        float _1704 = fma(_1650, _1644, _1688);
        _1698 = _1704;
    }
    float _1706 = _1698;
    if (_1588)
    {
        float _1708 = _1578 * _1680;
        _1702 = _1708;
    }
    float _1710 = _1702;
    if (_1588)
    {
        float _1712 = _1692 * _1692;
        _1670 = _1712;
    }
    float _1714 = _1670;
    if (!_1588)
    {
        _1652 = _1582;
    }
    float _1716 = _1652;
    float _1718 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1716;
    if (_1588)
    {
        float _1722 = _1710 * _1710;
        _1720 = _1722;
    }
    float _1724 = _1720;
    float _1726 = fma(_1706, _1706, _1714);
    float _1728 = _1726 + _1724;
    float _1730 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1734 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1732);
    float _1736 = precise::clamp(_1734, 0.0, 1.0);
    float _1738 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1740 = rsqrt(_1728);
    float _1742 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1744 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1730);
    float _1746 = -_1736;
    float _1748 = _1746 + 1.0;
    float _1750 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1738);
    float _1754 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1742);
    float _1756 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1744);
    float _1758 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1762 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1754);
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1766 = abs(_1748);
    float _1768 = log2(_1766);
    float _1770 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1758);
    float _1772 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = _1740 * _1692;
    float _1778 = _1740 * _1706;
    float _1780 = _1740 * _1710;
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1786 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1788 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1790 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1792 = -_1784;
    float _1794 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1792);
    float _1796 = -_1786;
    float _1798 = fma(_1796, _1696, 1.0);
    float _1800 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1790);
    float _1804 = -_1780;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1794);
    float _1808 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1810 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1812 = log2(_1798);
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
    float _1818 = fma(_1806, 0.5, 0.5);
    float _1820 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1810);
    float _1822 = _1778 + 1.0;
    float _1824 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1826 = 1.0 / _1802;
    float _1828 = fma(_1818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1820);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1834 = fma(_1818, _1828, -0.212114393711090087890625);
    float _1836 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float _1838 = exp2(_1808);
    float _1840 = fma(_1818, _1834, 1.570728778839111328125);
    float _1842 = _1812 * 0.693147182464599609375;
    float _1844 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = sqrt(_1814);
    float _1848 = _1832 * _1826;
    float _1850 = _1836 * _1826;
    float _1852 = fma(_1850, -0.5, 0.5);
    float _1854 = -_1778;
    float _1856 = fma(_1838, _1822, _1854);
    float _1858 = fma(_1848, 0.5, 0.5);
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = _1846 * 0.636619746685028076171875;
    float _1864 = -_1840;
    float _1866 = fma(_1862, _1864, 1.0);
    float3 _5010 = float3(_1858, _1852, _1844);
    float _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).x;
    float3 _5021 = float3(_1858, _1852, _1844);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    float2 _5038 = float2(_1866, _1860);
    float3 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5038, float2(0.0), isnan(_5038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5038, float2(0.0), isnan(_5038)), level(0.0)).xyz;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = in.m_57.w;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1901 = in.m_57.z;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1905 = _1903 != 0;
    float _1907 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1909 = _132 > 0.5;
    bool _1911 = _1909 && _1897;
    float _1913 = in.m_57.y;
    float _1915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1917 = _168 > 0.5;
    float _1919 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1921 = in.m_51.w;
    float _1923 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1925 = _1852;
    if (_266)
    {
        float _1927 = in.m_51.z;
        _1925 = _1927;
    }
    float _1929 = _1925;
    float _1931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1933 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    out.m_65.y = _154;
    float _1935 = -_1891;
    float _1937 = _1935 + 1.0;
    out.m_67.w = _1891;
    float _1939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1941 = _1891;
    if (_1897)
    {
        _1494 = _1901;
    }
    float _1943 = _1494;
    out.m_65.z = _156;
    float _1945 = -_1913;
    float _1947 = _1945 + 1.0;
    float _1949 = _1943;
    float _1951 = _1947;
    if (_1905)
    {
        float _1953 = _868 ? _1937 : _1891;
        _1941 = _1953;
    }
    float _1955 = _1941;
    float _1957 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1911)
    {
        float _1961 = -_1943;
        float _1963 = _1961 + 1.0;
        _1949 = _1963;
    }
    float _1965 = _1949;
    bool _1967 = _1921 > 0.5;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1971 = _1969 != 0;
    int _1973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1975 = _1973 != 0;
    int _1977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1979 = _1977 != 0;
    float _1981 = fma(_1957, _1955, -0.5);
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1985 = in.m_55.w;
    int _1987 = _1967 ? as_type<int>(_1947) : as_type<int>(_1913);
    float _1989 = -_1176;
    float _1991 = fma(_1174, _1981, _1989);
    bool _1993 = _1967;
    int _1995 = _1987;
    if (_266)
    {
        bool _1997 = _1929 > 0.5;
        _1993 = _1997;
    }
    bool _1999 = _1993;
    float _2001 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2003 = _1917 ? as_type<int>(_1947) : as_type<int>(_1913);
    float _2005 = _1991 + 0.5;
    float _2007 = exp2(_1899);
    float _2009 = _1971 ? as_type<float>(_1987) : _1913;
    if (_266)
    {
        float _2011 = -_388;
        float _2013 = _2011 + 1.0;
        _1995 = as_type<int>(_2013);
    }
    int _2015 = _1995;
    if (!_1897)
    {
        _1951 = _1901;
    }
    float _2017 = _1951;
    float _2019 = _1975 ? as_type<float>(_2003) : _1913;
    float _2021 = fma(_2001, _2009, -0.5);
    float _2023 = _1979 ? as_type<float>(_2003) : _1913;
    float _2025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2027 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2029 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2031 = _2017;
    if (_1897)
    {
        _2031 = _1965;
    }
    float _2033 = _2031;
    float _2035 = -_1214;
    float _2037 = fma(_1208, _2021, _2035);
    if (_266)
    {
        float _2039 = _1999 ? as_type<float>(_2015) : _388;
        _378 = _2039;
    }
    float _2041 = _378;
    float _2043 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2045 = fma(_2029, _2019, -0.5);
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2049 = fma(_2027, _2033, -0.5);
    float _2051 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2053 = fma(_2043, _2041, -0.5);
    float _2055 = -_1216;
    float _2057 = fma(_1204, _2045, _2055);
    float _2059 = -_2007;
    float _2061 = _2059 + 1.0;
    float _2063 = fma(_1202, _2049, _1156);
    float _2065 = fma(_2051, _902, -0.5);
    float _2067 = fma(_1074, _2053, _1212);
    float _2069 = _2057 + 0.5;
    float _2071 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.w = _1985;
    float _2075 = _2063 + 0.5;
    float _2077 = _2067 + 0.5;
    float _2079 = fma(_1192, _2065, _1050);
    float _2081 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2083 = fma(_2071, _914, -0.5);
    float _2085 = _1933 + _1802;
    float _2087 = _2079 + 0.5;
    float _2089 = _2037 + 0.5;
    float _2091 = fma(_2081, _2023, -0.5);
    float _2093 = fma(_1200, _2083, _1028);
    float _2095 = _2085 * 0.5;
    out.m_69.x = _2075;
    out.m_69.y = _2005;
    out.m_69.z = _2077;
    out.m_69.w = _2089;
    float _2097 = -_1040;
    float _2099 = fma(_1206, _2091, _2097);
    float _2101 = _2093 + 0.5;
    out.m_71.x = _2087;
    out.m_71.y = _2069;
    float _2103 = _2099 + 0.5;
    out.gl_Position.x = _1832;
    out.gl_Position.y = _1836;
    out.gl_Position.z = _1933;
    out.gl_Position.w = _1802;
    out.m_73.x = _2101;
    out.m_73.y = _2103;
    float _2105 = -_2073;
    float _2107 = _2105 + 1.0;
    float _2109 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.z = _2095;
    out.m_75.w = _1802;
    out.m_49.x = _2109;
    float _2111 = _2073 * _1868;
    float _2113 = _1879 * _2107;
    float _2115 = _1879 * _2111;
    float _2117 = _1889 * _2111;
    float _2119 = fma(_1885, _2115, _1873);
    float _2121 = fma(_1887, _2115, _1875);
    float _2123 = fma(_1879, _2117, _1877);
    out.m_77.x = _2119;
    out.m_77.y = _2121;
    out.m_77.z = _2123;
    out.m_77.w = _2113;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = _102;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2189 = as_type<float>(_118);
        out.gl_Position.z = _2189;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_98);
    bool _136 = _102 >= _134;
    bool _138 = !_130;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_49.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _120 = as_type<int>(_146);
    }
    int _148 = _120;
    out.m_53.x = _132;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2249 = as_type<float>(_148);
        out.gl_Position.z = _2249;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _152 = in.m_55.x;
    float _154 = in.m_55.y;
    float _156 = in.m_55.z;
    float _158 = _132 * 2.0;
    float _160 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _162 = in.m_51.y;
    float _164 = floor(_158);
    float _166 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _168 = in.m_51.z;
    float _170 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _172 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _174 = 0.0;
    float _176 = _170;
    if (_150)
    {
        float _178 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = 0.0;
    float _184 = _180;
    if (_150)
    {
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _182 = _186;
    }
    float _188 = _182;
    float _190 = in.m_57.x;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _194 = _192 != 0;
    float _196 = -_172;
    float _198 = fma(_160, 2.0, _196);
    float _200 = (*spvDescriptorSet0.vp_c10)._m0[2].x * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _202 = _164 > 0.0;
    float _204 = _152;
    if (_150)
    {
        float _206 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[14].x, _154);
        _184 = _206;
    }
    float _208 = _184;
    bool _210 = _164 >= 0.0;
    bool _212 = isnan(_164);
    bool _214 = _210 || _212;
    bool _216 = isnan(0.0);
    bool _218 = _214 || _216;
    float _220 = _154 * 6.283185482025146484375;
    float _222 = _156 * (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _224 = _162 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _226 = _208;
    if (_150)
    {
        float _228 = _208 * _188;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = _162 * 2.0;
    float _234 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[192].y, _220);
    float _236 = fma(_224, -2.0, _166);
    float _238 = _168 * 2.0;
    float _240 = _224;
    if (_150)
    {
        float _242 = floor(_230);
        _240 = _242;
    }
    float _244 = _240;
    float _246 = _132 + _168;
    float _248 = fma(_222, 6.283185482025146484375, _234);
    float _250 = _162 + _168;
    float _252 = 0.0;
    if (!_150)
    {
        _252 = _154;
    }
    float _254 = _252;
    float _256 = _246 + (-1.0);
    float _258 = _250 + (-1.0);
    float _260 = floor(_238);
    float _262 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[192].y, _248);
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _266 = _264 != 0;
    float _268 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _270 = floor(_232);
    float _272 = _254;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[160].w;
    if (_150)
    {
        float _276 = -_244;
        float _278 = _230 + _276;
        _272 = _278;
    }
    float _280 = _272;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _290 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _292 = _132 + _162;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _296 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _298;
    bool _302 = _260 >= 0.0;
    bool _304 = isnan(_260);
    bool _306 = _302 || _304;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    float _312 = _292 + (-1.0);
    float _314 = fma(_154, 12.56637096405029296875, _200);
    float _316 = 1.0 / _300;
    bool _318 = _260 > 0.0;
    float _320 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _326 = _218 ? 0 : 1;
    float _328 = fma(_156, 6.283185482025146484375, _314);
    bool _330 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _334 = _330 || _332;
    bool _336 = isnan(1.0);
    bool _338 = _334 || _336;
    bool _340 = _270 > 0.0;
    float _342 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].w, _220);
    float _344 = 1.0 / _284;
    float _346 = _270;
    if (!_266)
    {
        _274 = _190;
    }
    float _348 = _274;
    float _350 = _200 + _328;
    float _352 = fma(_156, 6.283185482025146484375, _342);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _358 = _310 ? 0 : 1;
    bool _360 = _270 >= 0.0;
    bool _362 = isnan(_270);
    bool _364 = _360 || _362;
    bool _366 = isnan(0.0);
    bool _368 = _364 || _366;
    float _370 = 1.0 / _288;
    float _372 = _348;
    if (!_266)
    {
        _346 = _348;
    }
    float _374 = _346;
    float _376 = 0.0;
    float _378 = _374;
    if (!_338)
    {
        float _380 = _170 * _170;
        float _382 = _380 * 0.5;
        _376 = _382;
    }
    float _384 = _376;
    float _386 = _384;
    if (_266)
    {
        _372 = _190;
    }
    float _388 = _372;
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[191].w, _352);
    int _392 = _368 ? 0 : 1;
    if (!_338)
    {
        float _394 = _384 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _394;
    }
    float _396 = _386;
    float _398 = 1.0 / _324;
    int _400 = ~_326;
    int _402 = _400 + 1;
    int _404 = _402 + 1;
    int _406 = ~_358;
    int _408 = _406 + 1;
    int _410 = _408 + 1;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _412;
    int _416 = ~_392;
    int _418 = _416 + 1;
    int _420 = _418 + 1;
    int _422 = _404;
    int _424 = _410;
    int _426 = _420;
    float _428 = _396;
    if (!_202)
    {
        int _430 = ~_326;
        int _432 = _430 + 1;
        _422 = _432;
    }
    int _434 = _422;
    float _436 = 1.0 / _296;
    if (!_318)
    {
        int _438 = ~_358;
        int _440 = _438 + 1;
        _424 = _440;
    }
    int _442 = _424;
    if (!_340)
    {
        int _444 = ~_392;
        int _446 = _444 + 1;
        _426 = _446;
    }
    int _448 = _426;
    float _450 = 1.0 / _356;
    bool _452 = !_338;
    if (!_452)
    {
        float _454 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _456 = log2(_454);
        float _458 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _460 = _458 + 1.0;
        float _462 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _464 = _170 * _456;
        float _466 = 1.0 / _460;
        float _468 = _462 * 0.693147182464599609375;
        float _470 = exp2(_464);
        float _472 = 1.0 / _468;
        float _474 = _470 + (-1.0);
        float _476 = -_474;
        float _478 = fma(_476, _472, _170);
        float _480 = _478 * _466;
        float _482 = _480 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _428 = _482;
    }
    float _484 = _428;
    bool _486 = !_338;
    if (!_486)
    {
        float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _490 = log2(_488);
        float _492 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _494 = _492 + 1.0;
        float _496 = 1.0 / _494;
        float _498 = _170 * _490;
        float _500 = exp2(_498);
        float _502 = -_500;
        float _504 = _502 + 1.0;
        float _506 = _504 * _496;
        _176 = _506;
    }
    float _508 = _176;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _512 = _280 + _510;
    float _514 = 1.0 / _414;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _518 = _280 + _516;
    float _520 = _512 * _344;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _524 = _280 + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _540 = _280 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _542;
    float _546 = _518 * _370;
    float _548 = _524 * _398;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _566 = _540 * _316;
    float _568 = fma(_552, _546, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _570 = fma(_556, _546, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _572 = fma(_560, _548, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _574 = fma(_564, _548, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _578 = _280 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _582 = _280 + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _586 = _280 + _584;
    float _588 = _578 * _436;
    float _590 = _582 * _514;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _600;
    float _604 = _586 * _450;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _618 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _620 = isnan(_280);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = fma(_594, _588, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _632 = fma(_598, _588, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _634 = fma(_602, _590, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _636 = fma(_608, _590, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _638 = fma(_612, _604, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _640 = in.m_44.x;
    float _642 = in.m_44.y;
    float _644 = in.m_44.z;
    float _646 = fma(_616, _604, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    bool _648 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _650 = isnan(_280);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -_628;
    float _662 = _660 + 1.0;
    float _664 = _262 * 0.15915493667125701904296875;
    float _666 = _390 * 0.15915493667125701904296875;
    bool _668 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _670 = isnan(_280);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_536, _566, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _682 = fma(_544, _566, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _684 = _658 * _662;
    float _686 = -_658;
    float _688 = _686 + 1.0;
    float _690 = in.m_59.x;
    float _692 = in.m_59.y;
    float _694 = in.m_59.z;
    bool _696 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _698 = isnan(_280);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = _666 * 6.283185482025146484375;
    float _710 = sin(_708);
    float _712 = _678 * _688;
    float _714 = -_678;
    float _716 = _714 + 1.0;
    bool _718 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _720 = isnan(_280);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_706;
    float _732 = _730 + 1.0;
    bool _734 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _736 = isnan(_280);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _706 * _716;
    float _748 = in.m_61.w;
    float _750 = _664 * 6.283185482025146484375;
    float _752 = sin(_750);
    float _754 = _728 * _732;
    float _756 = -_728;
    float _758 = _756 + 1.0;
    float _760 = in.m_42.x;
    float _762 = in.m_42.y;
    float _764 = in.m_42.z;
    bool _766 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _768 = isnan(_280);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _780 = -_744;
    float _782 = _780 + 1.0;
    float _784 = fma(_528, _520, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _786 = fma(_532, _520, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _788 = _744 * _758;
    float _790 = fma(_508, _640, _778);
    bool _792 = _280 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _794 = isnan(_280);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = _776 * _782;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _812 = _810 != 0;
    float _814 = -_776;
    float _816 = _814 + 1.0;
    float _818 = _710 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _820 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _822 = fma(_752, 0.5, 0.5);
    float _824 = _484 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _826 = _802 * _816;
    float _828 = _818 + _692;
    float _830 = fma(_508, _642, _820);
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[192].x, 1.0);
    float _834 = fma(_508, _644, _824);
    float _836 = _784 * _826;
    float _838 = _786 * _826;
    float _840 = -_802;
    float _842 = _840 + 1.0;
    float _844 = -_818;
    float _846 = fma(_844, _152, _828);
    float _848 = _832 * _690;
    float _850 = _832 * _694;
    int _852 = as_type<int>(_690);
    int _854 = as_type<int>(_694);
    int _856 = as_type<int>(_804);
    float _858 = _836;
    float _860 = _832;
    if (_808)
    {
        float _862 = -_388;
        float _864 = _862 + 1.0;
        _852 = as_type<int>(_864);
    }
    int _866 = _852;
    bool _868 = _162 > 0.5;
    float _870 = as_type<float>(_866);
    if (_812)
    {
        float _872 = -_388;
        float _874 = _872 + 1.0;
        _854 = as_type<int>(_874);
    }
    int _876 = _854;
    float _878 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[159].x, _836);
    float _880 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[159].z, _838);
    float _882 = fma(_790, _748, _760);
    float _884 = _760;
    int _886 = as_type<int>(_878);
    if (!_808)
    {
        _204 = _388;
    }
    float _888 = _204;
    float _890 = fma(_568, _804, _878);
    float _892 = _888;
    if (!_812)
    {
        _884 = _388;
    }
    float _894 = _884;
    float _896 = fma(_570, _804, _880);
    float _898 = _894;
    if (_808)
    {
        float _900 = _868 ? as_type<float>(_866) : _388;
        _892 = _900;
    }
    float _902 = _892;
    if (_194)
    {
        _856 = 0;
        _886 = 0;
    }
    int _904 = _856;
    int _906 = _886;
    int _908 = _904;
    int _910 = _906;
    if (_812)
    {
        float _912 = _868 ? as_type<float>(_876) : _388;
        _898 = _912;
    }
    float _914 = _898;
    if (_194)
    {
        _870 = _132;
    }
    float _916 = _870;
    float _918 = _916;
    if (_194)
    {
        _858 = _162;
    }
    float _920 = _858;
    float _922 = _920;
    if (!_194)
    {
        float _924 = _132 * 3.1415927410125732421875;
        float _926 = _924 * 0.15915493667125701904296875;
        float _928 = _162 * 3.1415927410125732421875;
        float _930 = _928 * 0.15915493667125701904296875;
        float _932 = _926 * 6.283185482025146484375;
        float _934 = sin(_932);
        float _936 = _930 * 6.283185482025146484375;
        float _938 = sin(_936);
        _908 = 2;
        _910 = 1;
        _922 = _938;
        _918 = _934;
    }
    int _940 = _908;
    int _942 = _910;
    float _944 = _922;
    float _946 = _918;
    bool _948 = _940 != 2;
    float _950 = fma(_680, _788, _890);
    bool _952 = _942 != 1;
    float _954 = fma(_682, _788, _896);
    float _956 = _944 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _958 = fma(_830, _748, _762);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[93].w, _960);
    float _966 = as_type<float>(_940);
    if (_948)
    {
        _966 = _132;
    }
    float _968 = _966;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _972 = _968;
    if (!_948)
    {
        _972 = _168;
    }
    float _974 = _972;
    float _976 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[93].z, _962);
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _984 = _946 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _996 = _994 != 0;
    float _998 = fma(_956, -2.0, _980);
    float _1000 = -_970;
    float _1002 = fma(_982, 2.0, _1000);
    float _1004 = -_978;
    float _1006 = fma(_984, 2.0, _1004);
    float _1008 = in.m_63.x;
    float _1010 = in.m_63.y;
    float _1012 = in.m_63.z;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_952)
    {
        _1014 = _162;
    }
    float _1016 = _1014;
    float _1018 = _132 + (-0.5);
    float _1020 = _350 * 0.15915493667125701904296875;
    bool _1022 = !_988;
    float _1024 = _1022 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1026 = -_102;
    float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1006);
    float _1030 = _1016;
    float _1032 = _1024;
    if (!_952)
    {
        _860 = _1016;
    }
    float _1034 = _860;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1038 = abs(as_type<int>(_1024));
    float _1040 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[91].y, _998);
    float _1042 = _1034;
    float _1044 = _1036;
    if (_952)
    {
        _1030 = _132;
    }
    float _1046 = _1030;
    float _1048 = -_102;
    float _1050 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1002);
    float _1052 = fma(_572, _754, _950);
    float _1054 = float(_442);
    float _1056 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1036);
    float _1058 = float(_1038);
    float _1060 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1062 = log2(_1060);
    if (!_952)
    {
        _1032 = _168;
    }
    float _1064 = _1032;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1068 = _1064;
    if (_952)
    {
        _1068 = _162;
    }
    float _1070 = _1068;
    float _1072 = _1058 * _1054;
    float _1074 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1056);
    float _1076 = _1070;
    if (_952)
    {
        _1042 = _132;
    }
    float _1078 = _1042;
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1066);
    float _1082 = _1072 * (-2.0);
    if (!_952)
    {
        _1044 = _168;
    }
    float _1084 = _1044;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1088 = fma(_1082, _1008, _1008);
    float _1090 = _1084;
    if (_952)
    {
        _1090 = _162;
    }
    float _1092 = _1090;
    float _1094 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_948)
    {
        _1076 = _162;
    }
    float _1096 = _1076;
    float _1098 = fma(_1018, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1088);
    float _1100 = _1096;
    if (!_948)
    {
        _1100 = _132;
    }
    float _1102 = _1100;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1108 = _1062 * _102;
    float _1110 = -_1086;
    float _1112 = fma(_1094, 2.0, _1110);
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1116 = fma(_1106, -2.0, _1104);
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1120 = fma(_320, _1082, _320);
    float _1122 = _1020 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = fma(_1114, -2.0, _1118);
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1132 = 1.0 + _1130;
    float _1134 = exp2(_1108);
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1138 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1128);
    bool _1140 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1142 = isnan(1.0);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1148 = _1144 || _1146;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1152 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1136);
    float _1154 = -_102;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[76].x, _198);
    bool _1158 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1166 = _1162 || _1164;
    float _1168 = 1.0 / _1132;
    float _1170 = _1124 * 6.283185482025146484375;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1174 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1152);
    float _1176 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _236);
    float _1178 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1150);
    bool _1180 = !_992;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1186 = -_1134;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_162, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1172);
    float _1192 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1178);
    int _1194 = abs(_1182);
    float _1196 = _1184 * 0.15915493667125701904296875;
    float _1198 = _1166 ? _1188 : 0.0;
    float _1200 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[92].z, _976);
    float _1202 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1138);
    float _1204 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1190);
    float _1206 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[92].w, _964);
    float _1208 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1080);
    float _1210 = -_102;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1112);
    float _1214 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1116);
    float _1216 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1126);
    if (_1148)
    {
        float _1218 = _1198 * _1168;
        _110 = _1218;
    }
    float _1220 = _110;
    float _1222 = float(_434);
    float _1224 = fma(_574, _754, _954);
    bool _1226 = !_996;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = fma(_1120, _1220, _1098);
    float _1232 = float(_1194);
    float _1234 = _162 + (-0.5);
    int _1236 = abs(_1228);
    float _1238 = _1230 * 0.15915493667125701904296875;
    float _1240 = float(_448);
    float _1242 = _1232 * _1222;
    float _1244 = float(_1236);
    float _1246 = _1196 * 6.283185482025146484375;
    float _1248 = cos(_1246);
    float _1250 = fma(_630, _746, _1052);
    float _1252 = _1242 * (-2.0);
    float _1254 = fma(_632, _746, _1224);
    float _1256 = _1244 * _1240;
    float _1258 = fma(_638, _712, _1250);
    float _1260 = fma(_1252, _1010, _1010);
    float _1262 = fma(_646, _712, _1254);
    float _1264 = _1256 * (-2.0);
    float _1266 = _1196 * 6.283185482025146484375;
    float _1268 = sin(_1266);
    float _1270 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1260);
    float _1272 = _168 + (-0.5);
    float _1274 = in.m_61.x;
    float _1276 = in.m_61.y;
    float _1278 = in.m_61.z;
    float _1280 = fma(_1264, _1012, _1012);
    float _1282 = fma(_268, _1252, _268);
    float _1284 = fma(_290, _1264, _290);
    float _1286 = _848 * _1248;
    float _1288 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1280);
    float _1290 = fma(_1282, _1220, _1270);
    float _1292 = fma(_636, _684, _1262);
    float _1294 = fma(_634, _684, _1258);
    float _1296 = fma(_1284, _1220, _1288);
    float _1298 = _1290 * 0.15915493667125701904296875;
    float _1300 = _1238 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1294);
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = fma(_850, _1268, _1286);
    float _1310 = _848 * _1268;
    float _1312 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1292);
    float _1314 = fma(_834, _748, _764);
    float _1316 = -_1308;
    float _1318 = _848 + _1316;
    float _1320 = _1238 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = -_1310;
    float _1326 = fma(_850, _1248, _1324);
    float _1328 = fma(_1304, _1318, _1308);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _846);
    float _1332 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1334 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1336 = -_1326;
    float _1338 = _850 + _1336;
    float _1340 = _1298 * 6.283185482025146484375;
    float _1342 = cos(_1340);
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1346 = _1334 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1328);
    float _1350 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1352 = fma(_1312, _1338, _1326);
    float _1354 = _1344 * _1330;
    float _1356 = _1346 * _1348;
    float _1358 = _1298 * 6.283185482025146484375;
    float _1360 = sin(_1358);
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1352);
    float _1366 = _1362 * _1364;
    float _1368 = _1306 * 6.283185482025146484375;
    float _1370 = cos(_1368);
    float _1372 = _1302 * _1342;
    float _1374 = _1322 * _1342;
    float _1376 = _1306 * 6.283185482025146484375;
    float _1378 = sin(_1376);
    float _1380 = _1302 * _1360;
    float _1382 = _1322 * _1360;
    float _1384 = _1360 * _1370;
    float _1386 = _1342 * _1370;
    float _1388 = _1370 * _1354;
    float _1390 = _1322 * _1388;
    float _1392 = _1302 * _1388;
    float _1394 = fma(_1378, _1374, _1380);
    float _1396 = -_1354;
    float _1398 = _1378 * _1396;
    float _1400 = -_1382;
    float _1402 = fma(_1378, _1372, _1400);
    float _1404 = -_1372;
    float _1406 = fma(_1378, _1382, _1404);
    float _1408 = fma(_1394, _1356, _1390);
    float _1410 = fma(_1386, _1356, _1398);
    float _1412 = fma(_1402, _1356, _1392);
    float _1414 = _958 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1416 = fma(_1406, _1366, _1408);
    float _1418 = fma(_1378, _1380, _1374);
    float _1420 = fma(_1384, _1366, _1410);
    float _1422 = _958 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1424 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1414);
    float _1426 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1428 = fma(_1418, _1366, _1412);
    float _1430 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1422);
    float _1432 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1424);
    float _1434 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1426);
    float _1438 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1430);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1442 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1434);
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1436);
    float _1446 = _1438 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1448 = _958 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1450 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1442);
    float _1452 = _1440 + _1444;
    float _1454 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1456 = fma(_882, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1448);
    float _1458 = _1446 + _1450;
    float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1462 = _1452 + _1460;
    float _1464 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1454);
    float _1466 = fma(_1314, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1456);
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1458 + _1468;
    float _1472 = _1462 * _1462;
    float _1474 = fma(_1428, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1464);
    float _1476 = _1466 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1478 = fma(_1470, _1470, _1472);
    float _1480 = _1476 + _1474;
    float _1482 = sqrt(_1478);
    bool _1484 = _1482 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1486 = _1314;
    float _1488 = _1476;
    float _1490 = _1474;
    float _1492 = _1480;
    float _1494 = _1318;
    if (!_1484)
    {
        _1486 = _1458;
    }
    float _1496 = _1486;
    float _1498 = _1496;
    if (!_1484)
    {
        _1488 = _1452;
    }
    float _1500 = _1488;
    float _1502 = _1500;
    if (!_1484)
    {
        _1490 = _1480;
    }
    float _1504 = _1490;
    bool _1506 = !_1484;
    float _1508 = _1504;
    if (!_1506)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1512 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1514 = _1482 + _1512;
        float _1516 = rsqrt(_1478);
        float _1518 = _1514 * _1510;
        float _1520 = _1480 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1522 = _1518 * 0.15915493667125701904296875;
        float _1524 = _1522 * 6.283185482025146484375;
        float _1526 = cos(_1524);
        float _1528 = _1522 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = _1526 + (-1.0);
        float _1534 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1536 = fma(_1530, _1520, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1538 = fma(_1480, _1526, _1534);
        float _1540 = _1516 * _1536;
        float _1542 = fma(_1470, _1540, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1544 = fma(_1462, _1540, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1508 = _1538;
        _1498 = _1542;
        _1502 = _1544;
    }
    float _1546 = _1508;
    float _1548 = _1498;
    float _1550 = _1502;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1554 = _1546 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1558 = _1548 + _1556;
    float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1562 = _1550 + _1560;
    float _1564 = _1554 * _1554;
    float _1566 = fma(_1558, _1558, _1564);
    float _1568 = fma(_1562, _1562, _1566);
    float _1570 = rsqrt(_1568);
    float _1572 = sqrt(_1568);
    float _1574 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1576 = _1558 * _1574;
    float _1578 = _1562 * _1574;
    float _1580 = _1576 * _1576;
    float _1582 = _1578 * _1578;
    float _1584 = _1580 + _1582;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1592 = _1586 + _1590;
    float _1594 = _1562;
    float _1596 = _1564;
    float _1598 = _1592;
    float _1600 = _1574;
    if (_1588)
    {
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1602;
    }
    float _1604 = _1594;
    if (_1588)
    {
        float _1606 = rsqrt(_1584);
        _1596 = _1606;
    }
    float _1608 = _1596;
    float _1610 = _1608;
    if (_1588)
    {
        float _1612 = _1592 * _1604;
        _1598 = _1612;
    }
    float _1614 = _1598;
    if (_1588)
    {
        float _1616 = _1614 * 0.15915493667125701904296875;
        _1492 = _1616;
    }
    float _1618 = _1492;
    float _1620 = _1570;
    float _1622 = _1618;
    if (_1588)
    {
        float _1624 = _1618 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        _1620 = _1626;
    }
    float _1628 = _1620;
    float _1630 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1632 = precise::max(0.0, _1630);
    float _1634 = _1478;
    float _1636 = _1632;
    float _1638 = _1630;
    if (_1588)
    {
        float _1640 = _1618 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        _1634 = _1642;
    }
    float _1644 = _1634;
    float _1646 = -_1574;
    float _1648 = -_1632;
    float _1650 = fma(_1554, _1646, _1648);
    float _1652 = _1650;
    if (_1588)
    {
        float _1654 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1654;
    }
    float _1656 = _1636;
    float _1658 = _1628;
    float _1660 = _1656;
    if (_1588)
    {
        float _1662 = fma(_1628, _1656, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1658 = _1662;
    }
    float _1664 = _1658;
    float _1666 = _1664;
    if (!_1588)
    {
        _1660 = _1580;
    }
    float _1668 = _1660;
    float _1670 = _1668;
    if (_1588)
    {
        float _1672 = _1644 + (-1.0);
        _1638 = _1672;
    }
    float _1674 = _1638;
    float _1676 = _1674;
    if (_1588)
    {
        float _1678 = _1608 * _1664;
        _1600 = _1678;
    }
    float _1680 = _1600;
    if (!_1588)
    {
        _1610 = _1576;
    }
    float _1682 = _1610;
    float _1684 = _1682;
    if (_1588)
    {
        float _1686 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1622 = _1686;
    }
    float _1688 = _1622;
    if (_1588)
    {
        float _1690 = _1576 * _1680;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1588)
    {
        _1666 = _1650;
    }
    float _1694 = _1666;
    float _1696 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1698 = _1694;
    if (!_1588)
    {
        _1676 = _1578;
    }
    float _1700 = _1676;
    float _1702 = _1700;
    if (_1588)
    {
        float _1704 = fma(_1650, _1644, _1688);
        _1698 = _1704;
    }
    float _1706 = _1698;
    if (_1588)
    {
        float _1708 = _1578 * _1680;
        _1702 = _1708;
    }
    float _1710 = _1702;
    if (_1588)
    {
        float _1712 = _1692 * _1692;
        _1670 = _1712;
    }
    float _1714 = _1670;
    if (!_1588)
    {
        _1652 = _1582;
    }
    float _1716 = _1652;
    float _1718 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1720 = _1716;
    if (_1588)
    {
        float _1722 = _1710 * _1710;
        _1720 = _1722;
    }
    float _1724 = _1720;
    float _1726 = fma(_1706, _1706, _1714);
    float _1728 = _1726 + _1724;
    float _1730 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1734 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1732);
    float _1736 = precise::clamp(_1734, 0.0, 1.0);
    float _1738 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1718);
    float _1740 = rsqrt(_1728);
    float _1742 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1744 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1730);
    float _1746 = -_1736;
    float _1748 = _1746 + 1.0;
    float _1750 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1752 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1738);
    float _1754 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1742);
    float _1756 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1744);
    float _1758 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1750);
    float _1760 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1762 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1754);
    float _1764 = _1756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1766 = abs(_1748);
    float _1768 = log2(_1766);
    float _1770 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1758);
    float _1772 = _1762 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1774 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1776 = _1740 * _1692;
    float _1778 = _1740 * _1706;
    float _1780 = _1740 * _1710;
    float _1782 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1774);
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1786 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1788 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1790 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1782);
    float _1792 = -_1784;
    float _1794 = fma(_1778, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1792);
    float _1796 = -_1786;
    float _1798 = fma(_1796, _1696, 1.0);
    float _1800 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1790);
    float _1804 = -_1780;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1794);
    float _1808 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1810 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1812 = log2(_1798);
    float _1814 = fma(_1806, -0.5, 0.5);
    float _1816 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1800);
    float _1818 = fma(_1806, 0.5, 0.5);
    float _1820 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1810);
    float _1822 = _1778 + 1.0;
    float _1824 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1816);
    float _1826 = 1.0 / _1802;
    float _1828 = fma(_1818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1830 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1820);
    float _1832 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1824);
    float _1834 = fma(_1818, _1828, -0.212114393711090087890625);
    float _1836 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1830);
    float _1838 = exp2(_1808);
    float _1840 = fma(_1818, _1834, 1.570728778839111328125);
    float _1842 = _1812 * 0.693147182464599609375;
    float _1844 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1846 = sqrt(_1814);
    float _1848 = _1832 * _1826;
    float _1850 = _1836 * _1826;
    float _1852 = fma(_1850, -0.5, 0.5);
    float _1854 = -_1778;
    float _1856 = fma(_1838, _1822, _1854);
    float _1858 = fma(_1848, 0.5, 0.5);
    float _1860 = fma(_1856, 0.5, 0.5);
    float _1862 = _1846 * 0.636619746685028076171875;
    float _1864 = -_1840;
    float _1866 = fma(_1862, _1864, 1.0);
    float3 _5010 = float3(_1858, _1852, _1844);
    float _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5010, float3(0.0), isnan(_5010)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5010, float3(0.0), isnan(_5010)), level(0.0)).x;
    float3 _5021 = float3(_1858, _1852, _1844);
    float4 _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).xyzw;
    float _1873 = _1871.x;
    float _1875 = _1871.y;
    float _1877 = _1871.z;
    float _1879 = _1871.w;
    float2 _5038 = float2(_1866, _1860);
    float3 _1883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5038, float2(0.0), isnan(_5038)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5038, float2(0.0), isnan(_5038)), level(0.0)).xyz;
    float _1885 = _1883.x;
    float _1887 = _1883.y;
    float _1889 = _1883.z;
    float _1891 = in.m_57.w;
    float _1893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1901 = in.m_57.z;
    int _1903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1905 = _1903 != 0;
    float _1907 = _1764 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1909 = _132 > 0.5;
    bool _1911 = _1909 && _1897;
    float _1913 = in.m_57.y;
    float _1915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1917 = _168 > 0.5;
    float _1919 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1921 = in.m_51.w;
    float _1923 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1925 = _1852;
    if (_266)
    {
        float _1927 = in.m_51.z;
        _1925 = _1927;
    }
    float _1929 = _1925;
    float _1931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1933 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1923);
    out.m_65.y = _154;
    float _1935 = -_1891;
    float _1937 = _1935 + 1.0;
    out.m_67.w = _1891;
    float _1939 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1941 = _1891;
    if (_1897)
    {
        _1494 = _1901;
    }
    float _1943 = _1494;
    out.m_65.z = _156;
    float _1945 = -_1913;
    float _1947 = _1945 + 1.0;
    float _1949 = _1943;
    float _1951 = _1947;
    if (_1905)
    {
        float _1953 = _868 ? _1937 : _1891;
        _1941 = _1953;
    }
    float _1955 = _1941;
    float _1957 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1911)
    {
        float _1961 = -_1943;
        float _1963 = _1961 + 1.0;
        _1949 = _1963;
    }
    float _1965 = _1949;
    bool _1967 = _1921 > 0.5;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1971 = _1969 != 0;
    int _1973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1975 = _1973 != 0;
    int _1977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1979 = _1977 != 0;
    float _1981 = fma(_1957, _1955, -0.5);
    float _1983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1985 = in.m_55.w;
    int _1987 = _1967 ? as_type<int>(_1947) : as_type<int>(_1913);
    float _1989 = -_1176;
    float _1991 = fma(_1174, _1981, _1989);
    bool _1993 = _1967;
    int _1995 = _1987;
    if (_266)
    {
        bool _1997 = _1929 > 0.5;
        _1993 = _1997;
    }
    bool _1999 = _1993;
    float _2001 = _1931 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2003 = _1917 ? as_type<int>(_1947) : as_type<int>(_1913);
    float _2005 = _1991 + 0.5;
    float _2007 = exp2(_1899);
    float _2009 = _1971 ? as_type<float>(_1987) : _1913;
    if (_266)
    {
        float _2011 = -_388;
        float _2013 = _2011 + 1.0;
        _1995 = as_type<int>(_2013);
    }
    int _2015 = _1995;
    if (!_1897)
    {
        _1951 = _1901;
    }
    float _2017 = _1951;
    float _2019 = _1975 ? as_type<float>(_2003) : _1913;
    float _2021 = fma(_2001, _2009, -0.5);
    float _2023 = _1979 ? as_type<float>(_2003) : _1913;
    float _2025 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2027 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2029 = _1939 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2031 = _2017;
    if (_1897)
    {
        _2031 = _1965;
    }
    float _2033 = _2031;
    float _2035 = -_1214;
    float _2037 = fma(_1208, _2021, _2035);
    if (_266)
    {
        float _2039 = _1999 ? as_type<float>(_2015) : _388;
        _378 = _2039;
    }
    float _2041 = _378;
    float _2043 = _1959 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2045 = fma(_2029, _2019, -0.5);
    float _2047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _2049 = fma(_2027, _2033, -0.5);
    float _2051 = _1983 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2053 = fma(_2043, _2041, -0.5);
    float _2055 = -_1216;
    float _2057 = fma(_1204, _2045, _2055);
    float _2059 = -_2007;
    float _2061 = _2059 + 1.0;
    float _2063 = fma(_1202, _2049, _1156);
    float _2065 = fma(_2051, _902, -0.5);
    float _2067 = fma(_1074, _2053, _1212);
    float _2069 = _2057 + 0.5;
    float _2071 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.w = _1985;
    float _2075 = _2063 + 0.5;
    float _2077 = _2067 + 0.5;
    float _2079 = fma(_1192, _2065, _1050);
    float _2081 = _2047 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2083 = fma(_2071, _914, -0.5);
    float _2085 = _1933 + _1802;
    float _2087 = _2079 + 0.5;
    float _2089 = _2037 + 0.5;
    float _2091 = fma(_2081, _2023, -0.5);
    float _2093 = fma(_1200, _2083, _1028);
    float _2095 = _2085 * 0.5;
    out.m_69.x = _2075;
    out.m_69.y = _2005;
    out.m_69.z = _2077;
    out.m_69.w = _2089;
    float _2097 = -_1040;
    float _2099 = fma(_1206, _2091, _2097);
    float _2101 = _2093 + 0.5;
    out.m_71.x = _2087;
    out.m_71.y = _2069;
    float _2103 = _2099 + 0.5;
    out.gl_Position.x = _1832;
    out.gl_Position.y = _1836;
    out.gl_Position.z = _1933;
    out.gl_Position.w = _1802;
    out.m_73.x = _2101;
    out.m_73.y = _2103;
    float _2105 = -_2073;
    float _2107 = _2105 + 1.0;
    float _2109 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.z = _2095;
    out.m_75.w = _1802;
    out.m_49.x = _2109;
    float _2111 = _2073 * _1868;
    float _2113 = _1879 * _2107;
    float _2115 = _1879 * _2111;
    float _2117 = _1889 * _2111;
    float _2119 = fma(_1885, _2115, _1873);
    float _2121 = fma(_1887, _2115, _1875);
    float _2123 = fma(_1879, _2117, _1877);
    out.m_77.x = _2119;
    out.m_77.y = _2121;
    out.m_77.z = _2123;
    out.m_77.w = _2113;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

